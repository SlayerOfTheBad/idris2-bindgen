module Wrapper

import Data.Bits
import System
import System.FFI
import Sys.Clang

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
CXCursor : Type
CXCursor = Struct "CXCursor" [
      ("kind", Prim_CXCursorKind),
      ("xdata", Int),
      ("data", AnyPtr)
   ]

public export
CXType : Type
CXType = Struct "CXType" [
      ("kind", Prim_CXTypeKind),
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
CXCursorVisitor t = CXCursor -> CXCursor -> t -> IO (CXChildVisitResult, t)

public export
CXCursorVisitorWrapper : Type
CXCursorVisitorWrapper = CXCursor -> CXCursor -> SchemeObjPtr -> IO Prim_CXChildVisitResult

public export
PrimCXCursorVisitorWrapper : Type
PrimCXCursorVisitorWrapper = CXCursor -> CXCursor -> SchemeObjPtr -> PrimIO Prim_CXChildVisitResult

public export
WrappedCXCursorVisitor : Type
WrappedCXCursorVisitor = AnyPtr

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
prim_getCursorKindSpelling : Prim_CXCursorKind -> PrimIO CXString
public export
getCursorKindSpelling : HasIO io => CXCursorKind -> io CXString
getCursorKindSpelling i = primIO $ (prim_getCursorKindSpelling (cast i))

%foreign (wrapper "getCursorSpelling")
prim_getCursorSpelling : CXCursor -> PrimIO CXString
public export
getCursorSpelling : HasIO io => CXCursor -> io CXString
getCursorSpelling i = primIO $ (prim_getCursorSpelling (cast i))

%foreign (wrapper "getTypeKindSpelling")
prim_getTypeKindSpelling : Prim_CXTypeKind -> PrimIO CXString
public export
getTypeKindSpelling : HasIO io => CXTypeKind -> io CXString
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
prim_visitChildren : CXCursor -> PrimCXCursorVisitorWrapper -> SchemeObjPtr -> PrimIO Prim_CXChildVisitResult
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
      pure (cast result, dat)
