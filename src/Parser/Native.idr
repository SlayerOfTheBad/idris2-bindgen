module Parser.Native

import Parser.Common
import Data.List1
import Data.String
import System.FFI
import Sys.Clang
import Wrapper

getName : HasIO io => CXCursor -> io String
getName cur =
   do cxName <- (getCursorSpelling cur)
      let name = (getCString cxName)
      disposeString cxName
      pure name

isAnonymousStr : String -> Bool
isAnonymousStr str = let ID = head' (tail (split (\x => x == '@') str)) in
   case ID of
        Just "EA" => True
        Just "SA" => True
        Just "UA" => True
        _    => False

isAnonymous : HasIO io => CXCursor -> io Bool
isAnonymous cur =
   do usr <- (getCursorUSR cur)
      pure (isAnonymousStr usr)

parseEnumFieldsVisitor : CXCursorVisitor (List EnumVariant)
parseEnumFieldsVisitor cursor _ fields =
  do name <- getName cursor
     value <- getEnumConstantDeclUnsignedValue cursor
     pure (CXChildVisit_Continue, (name, value) :: fields)

parseEnumFields : HasIO io => (cursor : CXCursor) -> io (List EnumVariant)
parseEnumFields cursor =
  visitChildren cursor parseEnumFieldsVisitor [] >>= \(_, fields) => pure fields

getEnumSize : HasIO io => CXCursor -> io EnumSize
getEnumSize cursor =
  do type <- getEnumDeclIntegerType cursor 
     size <- type_getSizeOf type
     pure $ cast size


parseEnum : HasIO io => CXCursor -> io ASTNode
parseEnum cursor =
  do name <- getName cursor
     size <- getEnumSize cursor
     fields <- parseEnumFields cursor
     anonymous <- isAnonymous cursor
     let enum = Enum name size fields
     case anonymous of
          False => pure enum
          True => pure $ Anonymous enum

parseCursor : HasIO io => AST -> CXCursor -> CXCursorKind -> io (CXChildVisitResult, AST)
parseCursor ast cursor CXCursor_EnumDecl = parseEnum cursor >>= \node => pure (CXChildVisit_Continue, node ?? ast)
parseCursor ast cursor _ = pure (CXChildVisit_Continue, ast)

visitor : CXCursorVisitor AST
visitor cursor _ ast = 
  do let nativeKind = getField cursor "kind"
     let kind = fromPrimitive nativeKind
     parseCursor ast cursor kind

export
parseAST : HasIO io => (file: String) -> io (Either String AST)
parseAST file =
  do index <- (createIndex 0 0)
     unit <- (parseTranslationUnit index file null 0 null 0 0)
     cursor <- getTranslationUnitCursor unit
     (_, ast) <- (visitChildren cursor visitor [])
     pure (Right ast)

