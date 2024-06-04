module Wrapper

import Data.Bits
import System
import System.FFI

clib : String -> String
clib str = "C:clang_" ++ str ++ ",libclang"

wrapper : String -> String
wrapper str = "C:" ++ str ++ ",clangWrapper"

chez : String -> String
chez str = "scheme,chez:" ++ str

-- Types
public export
CXIndex : Type
CXIndex = AnyPtr

public export
CXTranslationUnit : Type
CXTranslationUnit = AnyPtr

public export
data ChildVisitResult
   = Break
   | Continue
   | Recurse
   | Invalid

public export
CXChildVisitResult : Type
CXChildVisitResult = Int

public export
data CursorKind
   = UnexposedDecl
   | StructDecl
   | UnionDecl
   | ClassDecl
   | EnumDecl
   | FieldDecl
   | EnumConstantDecl
   | FunctionDecl
   | VarDecl
   | ParmDecl
   | TypedefDecl
   | Cursor_Invalid

public export
CXCursorKind : Type
CXCursorKind = Int

public export
data TypeKind
   = TK_Int
   | Pointer
   | BlockPointer
   | LValueReference
   | RValueReference
   | Record
   | Enum
   | Elaborated
   | TypeInvalid

public export
CXTypeKind : Type
CXTypeKind = Int

public export
CXCursor : Type
CXCursor = Struct "CXCursor" [
      ("kind", CXCursorKind),
      ("xdata", Int),
      ("data", AnyPtr)
   ]

public export
CXType : Type
CXType = Struct "CXType" [
      ("kind", CXTypeKind),
      ("data", AnyPtr)
   ]

public export
CXString : Type
CXString = Struct "CXString" [
      ("data", AnyPtr),
      ("private_flags", Int)
   ]

public export
SchemeObj : Type
SchemeObj = AnyPtr

public export
SchemeObjPtr : Type
SchemeObjPtr = AnyPtr

public export
CXCursorVisitor : Type -> Type
CXCursorVisitor t = CXCursor -> CXCursor -> t -> IO (ChildVisitResult, t)

public export
CXCursorVisitorWrapper : Type
CXCursorVisitorWrapper = CXCursor -> CXCursor -> SchemeObjPtr -> IO CXChildVisitResult

public export
PrimCXCursorVisitorWrapper : Type
PrimCXCursorVisitorWrapper = CXCursor -> CXCursor -> SchemeObjPtr -> PrimIO CXChildVisitResult

public export
WrappedCXCursorVisitor : Type
WrappedCXCursorVisitor = AnyPtr

-- Implementations
public export
%foreign (wrapper "toRealChildVisitResult")
toRealChildVisitResult : Int -> CXChildVisitResult
public export
%foreign (wrapper "fromRealChildVisitResult")
fromRealChildVisitResult : CXChildVisitResult -> Int

public export
Cast ChildVisitResult CXChildVisitResult where
   cast Break    = toRealChildVisitResult 0
   cast Continue = toRealChildVisitResult 1
   cast Recurse  = toRealChildVisitResult 2
   cast Invalid  = toRealChildVisitResult 3

public export
Cast CXChildVisitResult ChildVisitResult where
   cast x = case (fromRealChildVisitResult x) of
                 0 => Break
                 1 => Continue
                 2 => Recurse
                 _ => Invalid

public export
%foreign (wrapper "toRealCursorKind")
toRealCursorKind : Int -> CXCursorKind
%foreign (wrapper "fromRealCursorKind")
fromRealCursorKind : CXCursorKind -> Int

public export
Cast CursorKind CXCursorKind where
   cast Cursor_Invalid   = toRealCursorKind 0
   cast UnexposedDecl    = toRealCursorKind 1
   cast StructDecl       = toRealCursorKind 2
   cast UnionDecl        = toRealCursorKind 3
   cast ClassDecl        = toRealCursorKind 4
   cast EnumDecl         = toRealCursorKind 5
   cast FieldDecl        = toRealCursorKind 6
   cast EnumConstantDecl = toRealCursorKind 7
   cast FunctionDecl     = toRealCursorKind 8
   cast VarDecl          = toRealCursorKind 9
   cast ParmDecl         = toRealCursorKind 10
   cast TypedefDecl      = toRealCursorKind 20

public export
Cast CXCursorKind CursorKind where
   cast x = case (fromRealCursorKind x) of
                 1  => UnexposedDecl
                 2  => StructDecl
                 3  => UnionDecl
                 4  => ClassDecl
                 5  => EnumDecl
                 6  => FieldDecl
                 7  => EnumConstantDecl
                 8  => FunctionDecl
                 9  => VarDecl
                 10 => ParmDecl
                 20 => TypedefDecl
                 _  => Cursor_Invalid

public export
%foreign (wrapper "toRealTypeKind")
toRealTypeKind : Int -> CXTypeKind
public export
%foreign (wrapper "fromRealTypeKind")
fromRealTypeKind : CXTypeKind -> Int

public export
Cast TypeKind CXTypeKind where
   cast TK_Int          = toRealTypeKind 17
   cast Pointer         = toRealTypeKind 101
   cast BlockPointer    = toRealTypeKind 102
   cast LValueReference = toRealTypeKind 103
   cast RValueReference = toRealTypeKind 104
   cast Record          = toRealTypeKind 105
   cast Enum            = toRealTypeKind 106
   cast Elaborated      = toRealTypeKind 119
   cast TypeInvalid     = toRealTypeKind 10000

public export
Cast CXTypeKind TypeKind where
   cast x = case (fromRealTypeKind x) of
                 17  => TK_Int
                 101 => Pointer
                 102 => BlockPointer
                 103 => LValueReference
                 104 => RValueReference
                 105 => Record
                 106 => Enum
                 119 => Elaborated
                 _   => TypeInvalid

-- Foreign functions

public export
%foreign (wrapper "null")
null : AnyPtr

%foreign (clib "createIndex")
prim_createIndex : Int -> Int -> PrimIO AnyPtr
public export
createIndex : HasIO io => Int -> Int -> io AnyPtr
createIndex i j = primIO $ prim_createIndex i j

%foreign (chez "lock-object")
prim_lockObject : SchemeObj -> PrimIO ()
public export
lockObject : HasIO io => SchemeObj -> io ()
lockObject ptr = primIO $ (prim_lockObject ptr)

%foreign (chez "unlock-object")
prim_unlockObject : SchemeObj -> PrimIO ()
public export
unlockObject : HasIO io => SchemeObj -> io ()
unlockObject ptr = primIO $ (prim_unlockObject ptr)

%foreign (chez "(foreign-procedure \"toSchemeObjPtr\" (scheme-object) void*)")
prim_toSchemeObjPtr : SchemeObj -> PrimIO SchemeObjPtr
public export
toSchemeObjPtr : HasIO io => SchemeObj -> io SchemeObjPtr
toSchemeObjPtr ptr = primIO $ (prim_toSchemeObjPtr ptr)

%foreign (chez "(foreign-procedure \"fromSchemeObjPtr\" (void\*) scheme-object)")
prim_fromSchemeObjPtr : SchemeObjPtr -> PrimIO SchemeObj
public export
fromSchemeObjPtr : HasIO io => SchemeObjPtr -> io SchemeObj
fromSchemeObjPtr ptr = primIO $ (prim_fromSchemeObjPtr ptr)

%foreign (chez "(foreign-procedure \"setSchemeObjPtr\" (void\* scheme-object) void)")
prim_setSchemeObjPtr : SchemeObjPtr -> SchemeObj -> PrimIO ()
public export
setSchemeObjPtr : HasIO io => SchemeObjPtr -> SchemeObj -> io ()
setSchemeObjPtr ptr dat = primIO $ (prim_setSchemeObjPtr ptr dat)

%foreign (wrapper "getCursorType")
prim_getCursorType : CXCursor -> PrimIO CXType
public export
getCursorType : HasIO io => CXCursor -> io CXType
getCursorType x = primIO $ (prim_getCursorType x)

%foreign (wrapper "getCursorSemanticParent")
prim_getCursorSemanticParent : CXCursor -> PrimIO CXCursor
public export
getCursorSemanticParent : HasIO io => CXCursor -> io CXCursor
getCursorSemanticParent x = primIO $ (prim_getCursorSemanticParent x)

%foreign (wrapper "getPointeeType")
prim_getPointeeType : CXType -> PrimIO CXType
public export
getPointeeType : HasIO io => CXType -> io CXType
getPointeeType x = primIO $ (prim_getPointeeType x)

%foreign (wrapper "getTypeDeclaration")
prim_getTypeDeclaration : CXType -> PrimIO CXCursor
public export
getTypeDeclaration : HasIO io => CXType -> io CXCursor
getTypeDeclaration x = primIO $ (prim_getTypeDeclaration x)

%foreign (wrapper "getTypedefDeclUnderlyingType")
prim_getTypedefDeclUnderlyingType : CXCursor -> PrimIO CXType
public export
getTypedefDeclUnderlyingType : HasIO io => CXCursor -> io CXType
getTypedefDeclUnderlyingType x = primIO $ (prim_getTypedefDeclUnderlyingType x)

%foreign (wrapper "getCursorKindSpelling")
prim_getCursorKindSpelling : CXCursorKind -> PrimIO CXString
public export
getCursorKindSpelling : HasIO io => CursorKind -> io CXString
getCursorKindSpelling i = primIO $ (prim_getCursorKindSpelling (cast i))

%foreign (wrapper "getCursorSpelling")
prim_getCursorSpelling : CXCursor -> PrimIO CXString
public export
getCursorSpelling : HasIO io => CXCursor -> io CXString
getCursorSpelling i = primIO $ (prim_getCursorSpelling (cast i))

%foreign (wrapper "getTypeKindSpelling")
prim_getTypeKindSpelling : CXTypeKind -> PrimIO CXString
public export
getTypeKindSpelling : HasIO io => TypeKind -> io CXString
getTypeKindSpelling i = primIO $ (prim_getTypeKindSpelling (cast i))

%foreign (wrapper "getTypeSpelling")
prim_getTypeSpelling : CXType -> PrimIO CXString
public export
getTypeSpelling : CXType -> IO CXString
getTypeSpelling i = primIO $ (prim_getTypeSpelling i)

%foreign (wrapper "Type_getSizeOf")
prim_type_getSizeOf : CXType -> PrimIO Int
public export
type_getSizeOf : HasIO io => CXType -> io Int
type_getSizeOf x = primIO $ (prim_type_getSizeOf x)

public export
%foreign (wrapper "getCString")
getCString : CXString -> String

%foreign (clib "disposeString") 
prim_disposeString : CXString -> PrimIO ()
public export
disposeString : HasIO io => CXString -> io ()
disposeString x = primIO $ prim_disposeString x

%foreign (clib "parseTranslationUnit")
prim_parseTranslationUnit : CXIndex -> String -> AnyPtr -> Int -> AnyPtr -> Int -> Int -> PrimIO CXTranslationUnit
public export
parseTranslationUnit : HasIO io => CXIndex -> String -> AnyPtr -> Int -> AnyPtr -> Int -> Int -> io CXTranslationUnit
parseTranslationUnit x str y i z j k = primIO $ prim_parseTranslationUnit x str y i z j k

%foreign (wrapper "getEnumDeclIntegerType")
prim_getEnumDeclIntegerType : CXCursor -> PrimIO CXType
public export
getEnumDeclIntegerType : HasIO io => CXCursor -> io CXType
getEnumDeclIntegerType x = primIO $ (prim_getEnumDeclIntegerType x)

%foreign (wrapper "getEnumConstantDeclValue")
prim_getEnumConstantDeclValue : CXCursor -> PrimIO Int
public export
getEnumConstantDeclValue : HasIO io => CXCursor -> io Int
getEnumConstantDeclValue x = primIO $ (prim_getEnumConstantDeclValue x)

%foreign (wrapper "getEnumConstantDeclUnsignedValue")
prim_getEnumConstantDeclUnsignedValue : CXCursor -> PrimIO Int
public export
getEnumConstantDeclUnsignedValue : HasIO io => CXCursor -> io Int
getEnumConstantDeclUnsignedValue x = primIO $ (prim_getEnumConstantDeclUnsignedValue x)

%foreign (wrapper "getTranslationUnitCursor")
prim_getTranslationUnitCursor : CXTranslationUnit -> PrimIO CXCursor
public export
getTranslationUnitCursor : HasIO io => CXTranslationUnit -> io CXCursor
getTranslationUnitCursor x = primIO $ prim_getTranslationUnitCursor x

%foreign (wrapper "getCursorUSR")
prim_getCursorUSR : CXCursor -> PrimIO String
public export
getCursorUSR : HasIO io => CXCursor -> io String
getCursorUSR x = primIO $ (prim_getCursorUSR x)

public export
wrapVisitor : {t: _} -> CXCursorVisitor t -> PrimCXCursorVisitorWrapper
wrapVisitor visitor = (\u, v, w => toPrim $ nativeVisit u v w)
   where 
      nativeVisit : CXCursorVisitorWrapper
      nativeVisit cursor parent client_data =
         do dat <- (fromSchemeObjPtr client_data)
            _ <- unlockObject dat
            let dat : t = believe_me dat
            (result, dat) <- visitor cursor parent dat
            let dat : SchemeObj = believe_me dat
            _ <- lockObject dat
            _ <- (setSchemeObjPtr client_data dat)
            pure (cast result)

%foreign (wrapper "visitChildren")
prim_visitChildren : CXCursor -> PrimCXCursorVisitorWrapper -> SchemeObjPtr -> PrimIO CXChildVisitResult
public export
visitChildren : HasIO io => {t: _} ->  CXCursor -> CXCursorVisitor t -> t -> io (CXChildVisitResult, t)
visitChildren cursor callback dat =
   do let visit = wrapVisitor callback
      let dat = (believe_me dat)
      _ <- lockObject dat
      dataptr <- toSchemeObjPtr dat
      result <- primIO $ prim_visitChildren cursor visit dataptr
      dat <- fromSchemeObjPtr dataptr
      _ <- unlockObject dat
      let dat = believe_me dat
      pure (result, dat)
