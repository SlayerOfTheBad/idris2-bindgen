module Generator.C

import Data.List
import System.File
import Parser.Common
import Generator.Common

public export
data ClibLocation
  = FilePath String
  | LibraryName String

Interpolation ClibLocation where
    interpolate (FilePath str) = "\"\{str}\""
    interpolate (LibraryName str) = "<\{str}>"

public export
record ClangOpts where
  constructor MkClangOpts
  enumConversion : Bool
  fileName : String
  clibLoc : ClibLocation
%name ClangOpts opts


writeHeader : HasIO io => (opts : ClangOpts) -> (file : File) -> io (Either FileError ())
writeHeader opts file =
  fPutStrLn file """
    #include \{opts.clibLoc}
    #include <limits.h>
    #include <stdlib.h>
    #include <inttypes.h>

    """

namespace Enum
  Interpolation EnumSize where
    interpolate One = "uint8_t"
    interpolate Two = "uint16_t"
    interpolate Four = "uint32_t"
    interpolate Eight = "uint64_t"
    interpolate Other = "int"

  enumTag : Bool -> String
  enumTag False = "enum "
  enumTag True = ""


  generateConversions : Bool -> List EnumVariant -> EnumSize -> String -> String
  generateConversions anonymous variants size name = """
  \{enumTag anonymous}\{name} \{toPrimitiveEnumFunc name}(\{size} v) {
    switch (v) {
  \{toPrimitiveCases variants}
    }
    return v;
  }

  \{size} \{fromPrimitiveEnumFunc name}(\{enumTag anonymous}\{name} v) {
    switch (v) {
  \{fromPrimitiveCases variants}
    }
    return v;
  }

  """
    where
      toPrimitiveCases : List EnumVariant -> String
      toPrimitiveCases [] = ""
      toPrimitiveCases ((name, value) :: variants) = """
        case \{show value}:
          return \{name};
      \{toPrimitiveCases variants}
      """

      fromPrimitiveCases : List EnumVariant -> String
      fromPrimitiveCases [] = ""
      fromPrimitiveCases ((name, value) :: variants) = """
        case \{name}:
          return \{show value};
      \{fromPrimitiveCases variants}
      """

  export
  generateEnum :
    HasIO io =>
    File -> ClangOpts ->
    (anonymous : Bool) -> String -> EnumSize -> List EnumVariant ->
    io (Either FileError ())
  generateEnum _ _ _ _ _ [] = pure (Right ())
  generateEnum _ (MkClangOpts False _ _) _ _ _ _ = pure (Right ())
  generateEnum file opts anonymous name size variants =
    do Right _ <- write $ generateConversions anonymous uniqueVariants size name
         | err => pure err
       pure (Right ())
       where
         uniqueVariants : List EnumVariant
         uniqueVariants = nubBy (\x, y => snd x == snd y) variants
         write : String -> io (Either FileError ())
         write str = fPutStrLn file str


generateCode : HasIO io => (opts : ClangOpts) -> (file : File) -> AST -> io (Either FileError ())
generateCode opts file [] = pure (Right ())
generateCode opts file ((Enum name width values) :: ast) =
  case !(generateEnum file opts False name width values) of
    Right _ => generateCode opts file ast
    err     => pure err
generateCode opts file ((Anonymous (Enum name width values)) :: ast) =
  case !(generateEnum file opts True name width values) of
    Right _ => generateCode opts file ast
    err     => pure err
-- The other options don't need C glue
generateCode opts file (_ :: ast) = generateCode opts file ast

export
generateC : HasIO io => ClangOpts -> AST -> io ()
generateC opts ast =
  do Right file <- openFile opts.fileName WriteTruncate
       | Left err => putStrLn "Error opening \{opts.fileName}"
     Right _ <- writeHeader opts file
       | Left err => putStrLn "Error writing to \{opts.fileName}: \{show err}"
     Right _ <- generateCode opts file ast
       | Left err => putStrLn "Error writing to \{opts.fileName}: \{show err}"
     pure ()
