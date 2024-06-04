#include <clang-c/Index.h>
#include <memory.h>
#include <stdlib.h>
#include <string.h>

#define toPtr(T)                                                               \
  T *toPtr##T(T s) {                                                           \
    T *h = (T *)malloc(sizeof(T));                                             \
    *h = s;                                                                    \
    return h;                                                                  \
  }
toPtr(CXCursor);
toPtr(CXType);
toPtr(CXString);

void *null() { return NULL; }

CXType *getPointeeType(CXType *type) {
  return toPtrCXType(clang_getPointeeType(*type));
}

CXType *getCursorType(CXCursor *cursor) {
  return toPtrCXType(clang_getCursorType(*cursor));
}

CXCursor *getCursorSemanticParent(CXCursor *cursor) {
  return toPtrCXCursor(clang_getCursorSemanticParent(*cursor));
}

long long Type_getSizeOf(CXType *type) { return clang_Type_getSizeOf(*type); }

CXType *getEnumDeclIntegerType(CXCursor *cursor) {
  return toPtrCXType(clang_getEnumDeclIntegerType(*cursor));
}

CXType *getTypedefDeclUnderlyingType(CXCursor *cursor) {
  return toPtrCXType(clang_getTypedefDeclUnderlyingType(*cursor));
}

long long getEnumConstantDeclValue(CXCursor *cursor) {
  return clang_getEnumConstantDeclValue(*cursor);
}

unsigned long long getEnumConstantDeclUnsignedValue(CXCursor *cursor) {
  return clang_getEnumConstantDeclUnsignedValue(*cursor);
}

CXString *getTypeKindSpelling(enum CXTypeKind kind) {
  return toPtrCXString(clang_getTypeKindSpelling(kind));
}

CXString *getCursorSpelling(CXCursor *cursor) {
  return toPtrCXString(clang_getCursorSpelling(*cursor));
}

CXString *getCursorKindSpelling(enum CXCursorKind kind) {
  return toPtrCXString(clang_getCursorKindSpelling(kind));
}

CXString *getTypeSpelling(CXType *type) {
  return toPtrCXString(clang_getTypeSpelling(*type));
}

CXCursor *getTypeDeclaration(CXType *type) {
  return toPtrCXCursor(clang_getTypeDeclaration(*type));
}

char *getCString(CXString *string) { return strdup(clang_getCString(*string)); }

char *getCursorUSR(CXCursor *cursor) {
  return strdup(clang_getCString(clang_getCursorUSR(*cursor)));
}

CXCursor *getTranslationUnitCursor(CXTranslationUnit unit) {
  return toPtrCXCursor(clang_getTranslationUnitCursor(unit));
}

void **toSchemeObjPtr(void *data) {
  void **ptr = malloc(sizeof(void **));
  *ptr = data;
  return ptr;
}

void *fromSchemeObjPtr(void **ptr) { return *ptr; }

void setSchemeObjPtr(void **ptr, void *data) { *ptr = data; }

enum CXChildVisitResult toRealChildVisitResult(int v) {
  switch (v) {
  case 0:
    return CXChildVisit_Break;
  case 1:
    return CXChildVisit_Continue;
  case 2:
    return CXChildVisit_Recurse;
  };
  return CXChildVisit_Break;
}

int fromRealChildVisitResult(enum CXChildVisitResult v) {
  switch (v) {
  case CXChildVisit_Break:
    return 0;
  case CXChildVisit_Continue:
    return 1;
  case CXChildVisit_Recurse:
    return 2;
  };
  return 10000;
}

enum CXCursorKind toRealCursorKind(int v) {
  switch (v) {
  case 1:
    return CXCursor_UnexposedDecl;
  case 2:
    return CXCursor_StructDecl;
  case 3:
    return CXCursor_UnionDecl;
  case 4:
    return CXCursor_ClassDecl;
  case 5:
    return CXCursor_EnumDecl;
  case 6:
    return CXCursor_FieldDecl;
  case 7:
    return CXCursor_EnumConstantDecl;
  case 8:
    return CXCursor_FunctionDecl;
  case 9:
    return CXCursor_VarDecl;
  case 10:
    return CXCursor_ParmDecl;
  case 20:
    return CXCursor_TypedefDecl;
  };
  return CXCursor_UnexposedDecl;
}

int fromRealCursorKind(enum CXCursorKind v) {
  switch (v) {
  case CXCursor_UnexposedDecl:
    return 1;
  case CXCursor_StructDecl:
    return 2;
  case CXCursor_UnionDecl:
    return 3;
  case CXCursor_ClassDecl:
    return 4;
  case CXCursor_EnumDecl:
    return 5;
  case CXCursor_FieldDecl:
    return 6;
  case CXCursor_EnumConstantDecl:
    return 7;
  case CXCursor_FunctionDecl:
    return 8;
  case CXCursor_VarDecl:
    return 9;
  case CXCursor_ParmDecl:
    return 10;
  case CXCursor_TypedefDecl:
    return 20;
  };
  return 10000;
}

enum CXTypeKind toRealTypeKind(int v) {
  switch (v) {
  case 17:
    return CXType_Int;
  case 101:
    return CXType_Pointer;
  case 102:
    return CXType_BlockPointer;
  case 103:
    return CXType_LValueReference;
  case 104:
    return CXType_RValueReference;
  case 105:
    return CXType_Record;
  case 106:
    return CXType_Enum;
  case 119:
    return CXType_Elaborated;
  };
  return CXType_Invalid;
}

int fromRealTypeKind(enum CXTypeKind v) {
  switch (v) {
  case CXType_Int:
    return 17;
  case CXType_Pointer:
    return 101;
  case CXType_BlockPointer:
    return 102;
  case CXType_LValueReference:
    return 103;
  case CXType_RValueReference:
    return 104;
  case CXType_Record:
    return 105;
  case CXType_Enum:
    return 106;
  case CXType_Elaborated:
    return 119;
  };
  return 10000;
}

typedef enum CXChildVisitResult (*FOREIGN_CALLBACK)(CXCursor *, CXCursor *,
                                                    void **);

typedef struct {
  FOREIGN_CALLBACK func;
  CXClientData data;
} WrappedFunction;

enum CXChildVisitResult foreignCaller(CXCursor cursor, CXCursor parent,
                                      CXClientData cx_data) {
  WrappedFunction *wrapped = (WrappedFunction *)(cx_data);
  return wrapped->func(&cursor, &parent, wrapped->data);
}

unsigned visitChildren(CXCursor *cursor, FOREIGN_CALLBACK visitor,
                       CXClientData data) {
  WrappedFunction *cb = malloc(sizeof(WrappedFunction));
  cb->func = visitor;
  cb->data = data;
  return clang_visitChildren(*cursor, &foreignCaller, cb);
}
