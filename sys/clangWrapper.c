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
