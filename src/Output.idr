module Output

import System

wrapper : String -> String
wrapper str = "C:" ++ str ++ ",clangWrapper"

Prim_CXErrorCode : Type
Prim_CXErrorCode = Int

data CXErrorCode
   = CXError_ASTReadError
   | CXError_InvalidArguments
   | CXError_Crashed
   | CXError_Failure
   | CXError_Success

%foreign (wrapper "toPrim_CXErrorCode")
toPrim_CXErrorCode : Int -> Prim_CXErrorCode

Cast CXErrorCode Prim_CXErrorCode where
   cast CXError_ASTReadError = toPrim_CXErrorCode (4)
   cast CXError_InvalidArguments = toPrim_CXErrorCode (3)
   cast CXError_Crashed = toPrim_CXErrorCode (2)
   cast CXError_Failure = toPrim_CXErrorCode (1)
   cast CXError_Success = toPrim_CXErrorCode (0)

%foreign (wrapper "fromPrim_CXErrorCode")
fromPrim_CXErrorCode : Prim_CXErrorCode -> Int

Cast Prim_CXErrorCode CXErrorCode where
   cast x = case (fromPrim_CXErrorCode x) of
      (4) => CXError_ASTReadError
      (3) => CXError_InvalidArguments
      (2) => CXError_Crashed
      (1) => CXError_Failure
      (0) => CXError_Success
      _ => assert_total $ idris_crash "Invalid cast from Prim_CXErrorCode to CXErrorCode"

Prim_CXDiagnosticSeverity : Type
Prim_CXDiagnosticSeverity = Int

data CXDiagnosticSeverity
   = CXDiagnostic_Fatal
   | CXDiagnostic_Error
   | CXDiagnostic_Warning
   | CXDiagnostic_Note
   | CXDiagnostic_Ignored

%foreign (wrapper "toPrim_CXDiagnosticSeverity")
toPrim_CXDiagnosticSeverity : Int -> Prim_CXDiagnosticSeverity

Cast CXDiagnosticSeverity Prim_CXDiagnosticSeverity where
   cast CXDiagnostic_Fatal = toPrim_CXDiagnosticSeverity (4)
   cast CXDiagnostic_Error = toPrim_CXDiagnosticSeverity (3)
   cast CXDiagnostic_Warning = toPrim_CXDiagnosticSeverity (2)
   cast CXDiagnostic_Note = toPrim_CXDiagnosticSeverity (1)
   cast CXDiagnostic_Ignored = toPrim_CXDiagnosticSeverity (0)

%foreign (wrapper "fromPrim_CXDiagnosticSeverity")
fromPrim_CXDiagnosticSeverity : Prim_CXDiagnosticSeverity -> Int

Cast Prim_CXDiagnosticSeverity CXDiagnosticSeverity where
   cast x = case (fromPrim_CXDiagnosticSeverity x) of
      (4) => CXDiagnostic_Fatal
      (3) => CXDiagnostic_Error
      (2) => CXDiagnostic_Warning
      (1) => CXDiagnostic_Note
      (0) => CXDiagnostic_Ignored
      _ => assert_total $ idris_crash "Invalid cast from Prim_CXDiagnosticSeverity to CXDiagnosticSeverity"

Prim_CXLoadDiag_Error : Type
Prim_CXLoadDiag_Error = Int

data CXLoadDiag_Error
   = CXLoadDiag_InvalidFile
   | CXLoadDiag_CannotLoad
   | CXLoadDiag_Unknown
   | CXLoadDiag_None

%foreign (wrapper "toPrim_CXLoadDiag_Error")
toPrim_CXLoadDiag_Error : Int -> Prim_CXLoadDiag_Error

Cast CXLoadDiag_Error Prim_CXLoadDiag_Error where
   cast CXLoadDiag_InvalidFile = toPrim_CXLoadDiag_Error (3)
   cast CXLoadDiag_CannotLoad = toPrim_CXLoadDiag_Error (2)
   cast CXLoadDiag_Unknown = toPrim_CXLoadDiag_Error (1)
   cast CXLoadDiag_None = toPrim_CXLoadDiag_Error (0)

%foreign (wrapper "fromPrim_CXLoadDiag_Error")
fromPrim_CXLoadDiag_Error : Prim_CXLoadDiag_Error -> Int

Cast Prim_CXLoadDiag_Error CXLoadDiag_Error where
   cast x = case (fromPrim_CXLoadDiag_Error x) of
      (3) => CXLoadDiag_InvalidFile
      (2) => CXLoadDiag_CannotLoad
      (1) => CXLoadDiag_Unknown
      (0) => CXLoadDiag_None
      _ => assert_total $ idris_crash "Invalid cast from Prim_CXLoadDiag_Error to CXLoadDiag_Error"

Prim_CXDiagnosticDisplayOptions : Type
Prim_CXDiagnosticDisplayOptions = Int

data CXDiagnosticDisplayOptions
   = CXDiagnostic_DisplayCategoryName
   | CXDiagnostic_DisplayCategoryId
   | CXDiagnostic_DisplayOption
   | CXDiagnostic_DisplaySourceRanges
   | CXDiagnostic_DisplayColumn
   | CXDiagnostic_DisplaySourceLocation

%foreign (wrapper "toPrim_CXDiagnosticDisplayOptions")
toPrim_CXDiagnosticDisplayOptions : Int -> Prim_CXDiagnosticDisplayOptions

Cast CXDiagnosticDisplayOptions Prim_CXDiagnosticDisplayOptions where
   cast CXDiagnostic_DisplayCategoryName = toPrim_CXDiagnosticDisplayOptions (32)
   cast CXDiagnostic_DisplayCategoryId = toPrim_CXDiagnosticDisplayOptions (16)
   cast CXDiagnostic_DisplayOption = toPrim_CXDiagnosticDisplayOptions (8)
   cast CXDiagnostic_DisplaySourceRanges = toPrim_CXDiagnosticDisplayOptions (4)
   cast CXDiagnostic_DisplayColumn = toPrim_CXDiagnosticDisplayOptions (2)
   cast CXDiagnostic_DisplaySourceLocation = toPrim_CXDiagnosticDisplayOptions (1)

%foreign (wrapper "fromPrim_CXDiagnosticDisplayOptions")
fromPrim_CXDiagnosticDisplayOptions : Prim_CXDiagnosticDisplayOptions -> Int

Cast Prim_CXDiagnosticDisplayOptions CXDiagnosticDisplayOptions where
   cast x = case (fromPrim_CXDiagnosticDisplayOptions x) of
      (32) => CXDiagnostic_DisplayCategoryName
      (16) => CXDiagnostic_DisplayCategoryId
      (8) => CXDiagnostic_DisplayOption
      (4) => CXDiagnostic_DisplaySourceRanges
      (2) => CXDiagnostic_DisplayColumn
      (1) => CXDiagnostic_DisplaySourceLocation
      _ => assert_total $ idris_crash "Invalid cast from Prim_CXDiagnosticDisplayOptions to CXDiagnosticDisplayOptions"

Prim_CXAvailabilityKind : Type
Prim_CXAvailabilityKind = Int

data CXAvailabilityKind
   = CXAvailability_NotAccessible
   | CXAvailability_NotAvailable
   | CXAvailability_Deprecated
   | CXAvailability_Available

%foreign (wrapper "toPrim_CXAvailabilityKind")
toPrim_CXAvailabilityKind : Int -> Prim_CXAvailabilityKind

Cast CXAvailabilityKind Prim_CXAvailabilityKind where
   cast CXAvailability_NotAccessible = toPrim_CXAvailabilityKind (3)
   cast CXAvailability_NotAvailable = toPrim_CXAvailabilityKind (2)
   cast CXAvailability_Deprecated = toPrim_CXAvailabilityKind (1)
   cast CXAvailability_Available = toPrim_CXAvailabilityKind (0)

%foreign (wrapper "fromPrim_CXAvailabilityKind")
fromPrim_CXAvailabilityKind : Prim_CXAvailabilityKind -> Int

Cast Prim_CXAvailabilityKind CXAvailabilityKind where
   cast x = case (fromPrim_CXAvailabilityKind x) of
      (3) => CXAvailability_NotAccessible
      (2) => CXAvailability_NotAvailable
      (1) => CXAvailability_Deprecated
      (0) => CXAvailability_Available
      _ => assert_total $ idris_crash "Invalid cast from Prim_CXAvailabilityKind to CXAvailabilityKind"

Prim_CXCursor_ExceptionSpecificationKind : Type
Prim_CXCursor_ExceptionSpecificationKind = Int

data CXCursor_ExceptionSpecificationKind
   = CXCursor_ExceptionSpecificationKind_NoThrow
   | CXCursor_ExceptionSpecificationKind_Unparsed
   | CXCursor_ExceptionSpecificationKind_Uninstantiated
   | CXCursor_ExceptionSpecificationKind_Unevaluated
   | CXCursor_ExceptionSpecificationKind_ComputedNoexcept
   | CXCursor_ExceptionSpecificationKind_BasicNoexcept
   | CXCursor_ExceptionSpecificationKind_MSAny
   | CXCursor_ExceptionSpecificationKind_Dynamic
   | CXCursor_ExceptionSpecificationKind_DynamicNone
   | CXCursor_ExceptionSpecificationKind_None

%foreign (wrapper "toPrim_CXCursor_ExceptionSpecificationKind")
toPrim_CXCursor_ExceptionSpecificationKind : Int -> Prim_CXCursor_ExceptionSpecificationKind

Cast CXCursor_ExceptionSpecificationKind Prim_CXCursor_ExceptionSpecificationKind where
   cast CXCursor_ExceptionSpecificationKind_NoThrow = toPrim_CXCursor_ExceptionSpecificationKind (9)
   cast CXCursor_ExceptionSpecificationKind_Unparsed = toPrim_CXCursor_ExceptionSpecificationKind (8)
   cast CXCursor_ExceptionSpecificationKind_Uninstantiated = toPrim_CXCursor_ExceptionSpecificationKind (7)
   cast CXCursor_ExceptionSpecificationKind_Unevaluated = toPrim_CXCursor_ExceptionSpecificationKind (6)
   cast CXCursor_ExceptionSpecificationKind_ComputedNoexcept = toPrim_CXCursor_ExceptionSpecificationKind (5)
   cast CXCursor_ExceptionSpecificationKind_BasicNoexcept = toPrim_CXCursor_ExceptionSpecificationKind (4)
   cast CXCursor_ExceptionSpecificationKind_MSAny = toPrim_CXCursor_ExceptionSpecificationKind (3)
   cast CXCursor_ExceptionSpecificationKind_Dynamic = toPrim_CXCursor_ExceptionSpecificationKind (2)
   cast CXCursor_ExceptionSpecificationKind_DynamicNone = toPrim_CXCursor_ExceptionSpecificationKind (1)
   cast CXCursor_ExceptionSpecificationKind_None = toPrim_CXCursor_ExceptionSpecificationKind (0)

%foreign (wrapper "fromPrim_CXCursor_ExceptionSpecificationKind")
fromPrim_CXCursor_ExceptionSpecificationKind : Prim_CXCursor_ExceptionSpecificationKind -> Int

Cast Prim_CXCursor_ExceptionSpecificationKind CXCursor_ExceptionSpecificationKind where
   cast x = case (fromPrim_CXCursor_ExceptionSpecificationKind x) of
      (9) => CXCursor_ExceptionSpecificationKind_NoThrow
      (8) => CXCursor_ExceptionSpecificationKind_Unparsed
      (7) => CXCursor_ExceptionSpecificationKind_Uninstantiated
      (6) => CXCursor_ExceptionSpecificationKind_Unevaluated
      (5) => CXCursor_ExceptionSpecificationKind_ComputedNoexcept
      (4) => CXCursor_ExceptionSpecificationKind_BasicNoexcept
      (3) => CXCursor_ExceptionSpecificationKind_MSAny
      (2) => CXCursor_ExceptionSpecificationKind_Dynamic
      (1) => CXCursor_ExceptionSpecificationKind_DynamicNone
      (0) => CXCursor_ExceptionSpecificationKind_None
      _ => assert_total $ idris_crash "Invalid cast from Prim_CXCursor_ExceptionSpecificationKind to CXCursor_ExceptionSpecificationKind"

Prim_CXChoice : Type
Prim_CXChoice = Int

data CXChoice
   = CXChoice_Disabled
   | CXChoice_Enabled
   | CXChoice_Default

%foreign (wrapper "toPrim_CXChoice")
toPrim_CXChoice : Int -> Prim_CXChoice

Cast CXChoice Prim_CXChoice where
   cast CXChoice_Disabled = toPrim_CXChoice (2)
   cast CXChoice_Enabled = toPrim_CXChoice (1)
   cast CXChoice_Default = toPrim_CXChoice (0)

%foreign (wrapper "fromPrim_CXChoice")
fromPrim_CXChoice : Prim_CXChoice -> Int

Cast Prim_CXChoice CXChoice where
   cast x = case (fromPrim_CXChoice x) of
      (2) => CXChoice_Disabled
      (1) => CXChoice_Enabled
      (0) => CXChoice_Default
      _ => assert_total $ idris_crash "Invalid cast from Prim_CXChoice to CXChoice"

Prim_CXGlobalOptFlags : Type
Prim_CXGlobalOptFlags = Int

data CXGlobalOptFlags
   = CXGlobalOpt_ThreadBackgroundPriorityForAll
   | CXGlobalOpt_ThreadBackgroundPriorityForEditing
   | CXGlobalOpt_ThreadBackgroundPriorityForIndexing
   | CXGlobalOpt_None

%foreign (wrapper "toPrim_CXGlobalOptFlags")
toPrim_CXGlobalOptFlags : Int -> Prim_CXGlobalOptFlags

Cast CXGlobalOptFlags Prim_CXGlobalOptFlags where
   cast CXGlobalOpt_ThreadBackgroundPriorityForAll = toPrim_CXGlobalOptFlags (3)
   cast CXGlobalOpt_ThreadBackgroundPriorityForEditing = toPrim_CXGlobalOptFlags (2)
   cast CXGlobalOpt_ThreadBackgroundPriorityForIndexing = toPrim_CXGlobalOptFlags (1)
   cast CXGlobalOpt_None = toPrim_CXGlobalOptFlags (0)

%foreign (wrapper "fromPrim_CXGlobalOptFlags")
fromPrim_CXGlobalOptFlags : Prim_CXGlobalOptFlags -> Int

Cast Prim_CXGlobalOptFlags CXGlobalOptFlags where
   cast x = case (fromPrim_CXGlobalOptFlags x) of
      (3) => CXGlobalOpt_ThreadBackgroundPriorityForAll
      (2) => CXGlobalOpt_ThreadBackgroundPriorityForEditing
      (1) => CXGlobalOpt_ThreadBackgroundPriorityForIndexing
      (0) => CXGlobalOpt_None
      _ => assert_total $ idris_crash "Invalid cast from Prim_CXGlobalOptFlags to CXGlobalOptFlags"

Prim_CXTranslationUnit_Flags : Type
Prim_CXTranslationUnit_Flags = Int

data CXTranslationUnit_Flags
   = CXTranslationUnit_RetainExcludedConditionalBlocks
   | CXTranslationUnit_IgnoreNonErrorsFromIncludedFiles
   | CXTranslationUnit_VisitImplicitAttributes
   | CXTranslationUnit_IncludeAttributedTypes
   | CXTranslationUnit_LimitSkipFunctionBodiesToPreamble
   | CXTranslationUnit_SingleFileParse
   | CXTranslationUnit_KeepGoing
   | CXTranslationUnit_CreatePreambleOnFirstParse
   | CXTranslationUnit_IncludeBriefCommentsInCodeCompletion
   | CXTranslationUnit_SkipFunctionBodies
   | CXTranslationUnit_CXXChainedPCH
   | CXTranslationUnit_ForSerialization
   | CXTranslationUnit_CacheCompletionResults
   | CXTranslationUnit_PrecompiledPreamble
   | CXTranslationUnit_Incomplete
   | CXTranslationUnit_DetailedPreprocessingRecord
   | CXTranslationUnit_None

%foreign (wrapper "toPrim_CXTranslationUnit_Flags")
toPrim_CXTranslationUnit_Flags : Int -> Prim_CXTranslationUnit_Flags

Cast CXTranslationUnit_Flags Prim_CXTranslationUnit_Flags where
   cast CXTranslationUnit_RetainExcludedConditionalBlocks = toPrim_CXTranslationUnit_Flags (32768)
   cast CXTranslationUnit_IgnoreNonErrorsFromIncludedFiles = toPrim_CXTranslationUnit_Flags (16384)
   cast CXTranslationUnit_VisitImplicitAttributes = toPrim_CXTranslationUnit_Flags (8192)
   cast CXTranslationUnit_IncludeAttributedTypes = toPrim_CXTranslationUnit_Flags (4096)
   cast CXTranslationUnit_LimitSkipFunctionBodiesToPreamble = toPrim_CXTranslationUnit_Flags (2048)
   cast CXTranslationUnit_SingleFileParse = toPrim_CXTranslationUnit_Flags (1024)
   cast CXTranslationUnit_KeepGoing = toPrim_CXTranslationUnit_Flags (512)
   cast CXTranslationUnit_CreatePreambleOnFirstParse = toPrim_CXTranslationUnit_Flags (256)
   cast CXTranslationUnit_IncludeBriefCommentsInCodeCompletion = toPrim_CXTranslationUnit_Flags (128)
   cast CXTranslationUnit_SkipFunctionBodies = toPrim_CXTranslationUnit_Flags (64)
   cast CXTranslationUnit_CXXChainedPCH = toPrim_CXTranslationUnit_Flags (32)
   cast CXTranslationUnit_ForSerialization = toPrim_CXTranslationUnit_Flags (16)
   cast CXTranslationUnit_CacheCompletionResults = toPrim_CXTranslationUnit_Flags (8)
   cast CXTranslationUnit_PrecompiledPreamble = toPrim_CXTranslationUnit_Flags (4)
   cast CXTranslationUnit_Incomplete = toPrim_CXTranslationUnit_Flags (2)
   cast CXTranslationUnit_DetailedPreprocessingRecord = toPrim_CXTranslationUnit_Flags (1)
   cast CXTranslationUnit_None = toPrim_CXTranslationUnit_Flags (0)

%foreign (wrapper "fromPrim_CXTranslationUnit_Flags")
fromPrim_CXTranslationUnit_Flags : Prim_CXTranslationUnit_Flags -> Int

Cast Prim_CXTranslationUnit_Flags CXTranslationUnit_Flags where
   cast x = case (fromPrim_CXTranslationUnit_Flags x) of
      (32768) => CXTranslationUnit_RetainExcludedConditionalBlocks
      (16384) => CXTranslationUnit_IgnoreNonErrorsFromIncludedFiles
      (8192) => CXTranslationUnit_VisitImplicitAttributes
      (4096) => CXTranslationUnit_IncludeAttributedTypes
      (2048) => CXTranslationUnit_LimitSkipFunctionBodiesToPreamble
      (1024) => CXTranslationUnit_SingleFileParse
      (512) => CXTranslationUnit_KeepGoing
      (256) => CXTranslationUnit_CreatePreambleOnFirstParse
      (128) => CXTranslationUnit_IncludeBriefCommentsInCodeCompletion
      (64) => CXTranslationUnit_SkipFunctionBodies
      (32) => CXTranslationUnit_CXXChainedPCH
      (16) => CXTranslationUnit_ForSerialization
      (8) => CXTranslationUnit_CacheCompletionResults
      (4) => CXTranslationUnit_PrecompiledPreamble
      (2) => CXTranslationUnit_Incomplete
      (1) => CXTranslationUnit_DetailedPreprocessingRecord
      (0) => CXTranslationUnit_None
      _ => assert_total $ idris_crash "Invalid cast from Prim_CXTranslationUnit_Flags to CXTranslationUnit_Flags"

Prim_CXSaveTranslationUnit_Flags : Type
Prim_CXSaveTranslationUnit_Flags = Int

data CXSaveTranslationUnit_Flags
   = CXSaveTranslationUnit_None


%foreign (wrapper "toPrim_CXSaveTranslationUnit_Flags")
toPrim_CXSaveTranslationUnit_Flags : Int -> Prim_CXSaveTranslationUnit_Flags

Cast CXSaveTranslationUnit_Flags Prim_CXSaveTranslationUnit_Flags where
   cast CXSaveTranslationUnit_None = toPrim_CXSaveTranslationUnit_Flags (0)

%foreign (wrapper "fromPrim_CXSaveTranslationUnit_Flags")
fromPrim_CXSaveTranslationUnit_Flags : Prim_CXSaveTranslationUnit_Flags -> Int

Cast Prim_CXSaveTranslationUnit_Flags CXSaveTranslationUnit_Flags where
   cast x = case (fromPrim_CXSaveTranslationUnit_Flags x) of
      (0) => CXSaveTranslationUnit_None
      _ => assert_total $ idris_crash "Invalid cast from Prim_CXSaveTranslationUnit_Flags to CXSaveTranslationUnit_Flags"

Prim_CXSaveError : Type
Prim_CXSaveError = Int

data CXSaveError
   = CXSaveError_InvalidTU
   | CXSaveError_TranslationErrors
   | CXSaveError_Unknown
   | CXSaveError_None

%foreign (wrapper "toPrim_CXSaveError")
toPrim_CXSaveError : Int -> Prim_CXSaveError

Cast CXSaveError Prim_CXSaveError where
   cast CXSaveError_InvalidTU = toPrim_CXSaveError (3)
   cast CXSaveError_TranslationErrors = toPrim_CXSaveError (2)
   cast CXSaveError_Unknown = toPrim_CXSaveError (1)
   cast CXSaveError_None = toPrim_CXSaveError (0)

%foreign (wrapper "fromPrim_CXSaveError")
fromPrim_CXSaveError : Prim_CXSaveError -> Int

Cast Prim_CXSaveError CXSaveError where
   cast x = case (fromPrim_CXSaveError x) of
      (3) => CXSaveError_InvalidTU
      (2) => CXSaveError_TranslationErrors
      (1) => CXSaveError_Unknown
      (0) => CXSaveError_None
      _ => assert_total $ idris_crash "Invalid cast from Prim_CXSaveError to CXSaveError"

Prim_CXReparse_Flags : Type
Prim_CXReparse_Flags = Int

data CXReparse_Flags
   = CXReparse_None


%foreign (wrapper "toPrim_CXReparse_Flags")
toPrim_CXReparse_Flags : Int -> Prim_CXReparse_Flags

Cast CXReparse_Flags Prim_CXReparse_Flags where
   cast CXReparse_None = toPrim_CXReparse_Flags (0)

%foreign (wrapper "fromPrim_CXReparse_Flags")
fromPrim_CXReparse_Flags : Prim_CXReparse_Flags -> Int

Cast Prim_CXReparse_Flags CXReparse_Flags where
   cast x = case (fromPrim_CXReparse_Flags x) of
      (0) => CXReparse_None
      _ => assert_total $ idris_crash "Invalid cast from Prim_CXReparse_Flags to CXReparse_Flags"

Prim_CXTUResourceUsageKind : Type
Prim_CXTUResourceUsageKind = Int

data CXTUResourceUsageKind
   = CXTUResourceUsage_Last
   | CXTUResourceUsage_First
   | CXTUResourceUsage_MEMORY_IN_BYTES_END
   | CXTUResourceUsage_MEMORY_IN_BYTES_BEGIN
   | CXTUResourceUsage_Preprocessor_HeaderSearch
   | CXTUResourceUsage_SourceManager_DataStructures
   | CXTUResourceUsage_PreprocessingRecord
   | CXTUResourceUsage_Preprocessor
   | CXTUResourceUsage_ExternalASTSource_Membuffer_MMap
   | CXTUResourceUsage_ExternalASTSource_Membuffer_Malloc
   | CXTUResourceUsage_SourceManager_Membuffer_MMap
   | CXTUResourceUsage_SourceManager_Membuffer_Malloc
   | CXTUResourceUsage_AST_SideTables
   | CXTUResourceUsage_SourceManagerContentCache
   | CXTUResourceUsage_GlobalCompletionResults
   | CXTUResourceUsage_Selectors
   | CXTUResourceUsage_Identifiers
   | CXTUResourceUsage_AST

%foreign (wrapper "toPrim_CXTUResourceUsageKind")
toPrim_CXTUResourceUsageKind : Int -> Prim_CXTUResourceUsageKind

Cast CXTUResourceUsageKind Prim_CXTUResourceUsageKind where
   cast CXTUResourceUsage_Last = toPrim_CXTUResourceUsageKind (14)
   cast CXTUResourceUsage_First = toPrim_CXTUResourceUsageKind (1)
   cast CXTUResourceUsage_MEMORY_IN_BYTES_END = toPrim_CXTUResourceUsageKind (14)
   cast CXTUResourceUsage_MEMORY_IN_BYTES_BEGIN = toPrim_CXTUResourceUsageKind (1)
   cast CXTUResourceUsage_Preprocessor_HeaderSearch = toPrim_CXTUResourceUsageKind (14)
   cast CXTUResourceUsage_SourceManager_DataStructures = toPrim_CXTUResourceUsageKind (13)
   cast CXTUResourceUsage_PreprocessingRecord = toPrim_CXTUResourceUsageKind (12)
   cast CXTUResourceUsage_Preprocessor = toPrim_CXTUResourceUsageKind (11)
   cast CXTUResourceUsage_ExternalASTSource_Membuffer_MMap = toPrim_CXTUResourceUsageKind (10)
   cast CXTUResourceUsage_ExternalASTSource_Membuffer_Malloc = toPrim_CXTUResourceUsageKind (9)
   cast CXTUResourceUsage_SourceManager_Membuffer_MMap = toPrim_CXTUResourceUsageKind (8)
   cast CXTUResourceUsage_SourceManager_Membuffer_Malloc = toPrim_CXTUResourceUsageKind (7)
   cast CXTUResourceUsage_AST_SideTables = toPrim_CXTUResourceUsageKind (6)
   cast CXTUResourceUsage_SourceManagerContentCache = toPrim_CXTUResourceUsageKind (5)
   cast CXTUResourceUsage_GlobalCompletionResults = toPrim_CXTUResourceUsageKind (4)
   cast CXTUResourceUsage_Selectors = toPrim_CXTUResourceUsageKind (3)
   cast CXTUResourceUsage_Identifiers = toPrim_CXTUResourceUsageKind (2)
   cast CXTUResourceUsage_AST = toPrim_CXTUResourceUsageKind (1)

%foreign (wrapper "fromPrim_CXTUResourceUsageKind")
fromPrim_CXTUResourceUsageKind : Prim_CXTUResourceUsageKind -> Int

Cast Prim_CXTUResourceUsageKind CXTUResourceUsageKind where
   cast x = case (fromPrim_CXTUResourceUsageKind x) of
      (14) => CXTUResourceUsage_Preprocessor_HeaderSearch
      (13) => CXTUResourceUsage_SourceManager_DataStructures
      (12) => CXTUResourceUsage_PreprocessingRecord
      (11) => CXTUResourceUsage_Preprocessor
      (10) => CXTUResourceUsage_ExternalASTSource_Membuffer_MMap
      (9) => CXTUResourceUsage_ExternalASTSource_Membuffer_Malloc
      (8) => CXTUResourceUsage_SourceManager_Membuffer_MMap
      (7) => CXTUResourceUsage_SourceManager_Membuffer_Malloc
      (6) => CXTUResourceUsage_AST_SideTables
      (5) => CXTUResourceUsage_SourceManagerContentCache
      (4) => CXTUResourceUsage_GlobalCompletionResults
      (3) => CXTUResourceUsage_Selectors
      (2) => CXTUResourceUsage_Identifiers
      (1) => CXTUResourceUsage_AST
      _ => assert_total $ idris_crash "Invalid cast from Prim_CXTUResourceUsageKind to CXTUResourceUsageKind"

Prim_CXCursorKind : Type
Prim_CXCursorKind = Int

data CXCursorKind
   = CXCursor_OverloadCandidate
   | CXCursor_LastExtraDecl
   | CXCursor_FirstExtraDecl
   | CXCursor_ConceptDecl
   | CXCursor_FriendDecl
   | CXCursor_StaticAssert
   | CXCursor_TypeAliasTemplateDecl
   | CXCursor_ModuleImportDecl
   | CXCursor_LastPreprocessing
   | CXCursor_FirstPreprocessing
   | CXCursor_InclusionDirective
   | CXCursor_MacroInstantiation
   | CXCursor_MacroExpansion
   | CXCursor_MacroDefinition
   | CXCursor_PreprocessingDirective
   | CXCursor_LastAttr
   | CXCursor_AlignedAttr
   | CXCursor_WarnUnusedResultAttr
   | CXCursor_WarnUnusedAttr
   | CXCursor_ConvergentAttr
   | CXCursor_FlagEnum
   | CXCursor_ObjCBoxable
   | CXCursor_ObjCRuntimeVisible
   | CXCursor_ObjCDesignatedInitializer
   | CXCursor_ObjCExplicitProtocolImpl
   | CXCursor_ObjCSubclassingRestricted
   | CXCursor_ObjCRootClass
   | CXCursor_ObjCRequiresSuper
   | CXCursor_ObjCReturnsInnerPointer
   | CXCursor_ObjCPreciseLifetime
   | CXCursor_ObjCIndependentClass
   | CXCursor_ObjCNSObject
   | CXCursor_ObjCException
   | CXCursor_NSConsumed
   | CXCursor_NSConsumesSelf
   | CXCursor_NSReturnsAutoreleased
   | CXCursor_NSReturnsNotRetained
   | CXCursor_NSReturnsRetained
   | CXCursor_DLLImport
   | CXCursor_DLLExport
   | CXCursor_VisibilityAttr
   | CXCursor_CUDASharedAttr
   | CXCursor_CUDAHostAttr
   | CXCursor_CUDAGlobalAttr
   | CXCursor_CUDADeviceAttr
   | CXCursor_CUDAConstantAttr
   | CXCursor_NoDuplicateAttr
   | CXCursor_ConstAttr
   | CXCursor_PureAttr
   | CXCursor_PackedAttr
   | CXCursor_AsmLabelAttr
   | CXCursor_AnnotateAttr
   | CXCursor_CXXOverrideAttr
   | CXCursor_CXXFinalAttr
   | CXCursor_IBOutletCollectionAttr
   | CXCursor_IBOutletAttr
   | CXCursor_IBActionAttr
   | CXCursor_UnexposedAttr
   | CXCursor_FirstAttr
   | CXCursor_TranslationUnit
   | CXCursor_LastStmt
   | CXCursor_OMPErrorDirective
   | CXCursor_OMPParallelMaskedTaskLoopSimdDirective
   | CXCursor_OMPParallelMaskedTaskLoopDirective
   | CXCursor_OMPMaskedTaskLoopSimdDirective
   | CXCursor_OMPMaskedTaskLoopDirective
   | CXCursor_OMPParallelMaskedDirective
   | CXCursor_OMPTargetParallelGenericLoopDirective
   | CXCursor_OMPParallelGenericLoopDirective
   | CXCursor_OMPTargetTeamsGenericLoopDirective
   | CXCursor_OMPTeamsGenericLoopDirective
   | CXCursor_OMPGenericLoopDirective
   | CXCursor_OMPMetaDirective
   | CXCursor_OMPUnrollDirective
   | CXCursor_OMPMaskedDirective
   | CXCursor_OMPDispatchDirective
   | CXCursor_OMPInteropDirective
   | CXCursor_OMPCanonicalLoop
   | CXCursor_OMPTileDirective
   | CXCursor_OMPScanDirective
   | CXCursor_OMPDepobjDirective
   | CXCursor_OMPParallelMasterDirective
   | CXCursor_OMPParallelMasterTaskLoopSimdDirective
   | CXCursor_OMPMasterTaskLoopSimdDirective
   | CXCursor_OMPParallelMasterTaskLoopDirective
   | CXCursor_OMPMasterTaskLoopDirective
   | CXCursor_BuiltinBitCastExpr
   | CXCursor_OMPTargetTeamsDistributeSimdDirective
   | CXCursor_OMPTargetTeamsDistributeParallelForSimdDirective
   | CXCursor_OMPTargetTeamsDistributeParallelForDirective
   | CXCursor_OMPTargetTeamsDistributeDirective
   | CXCursor_OMPTargetTeamsDirective
   | CXCursor_OMPTeamsDistributeParallelForDirective
   | CXCursor_OMPTeamsDistributeParallelForSimdDirective
   | CXCursor_OMPTeamsDistributeSimdDirective
   | CXCursor_OMPTeamsDistributeDirective
   | CXCursor_OMPTargetSimdDirective
   | CXCursor_OMPTargetParallelForSimdDirective
   | CXCursor_OMPDistributeSimdDirective
   | CXCursor_OMPDistributeParallelForSimdDirective
   | CXCursor_OMPDistributeParallelForDirective
   | CXCursor_OMPTargetUpdateDirective
   | CXCursor_OMPTargetParallelForDirective
   | CXCursor_OMPTargetParallelDirective
   | CXCursor_OMPTargetExitDataDirective
   | CXCursor_OMPTargetEnterDataDirective
   | CXCursor_OMPDistributeDirective
   | CXCursor_OMPTaskLoopSimdDirective
   | CXCursor_OMPTaskLoopDirective
   | CXCursor_OMPTargetDataDirective
   | CXCursor_OMPCancelDirective
   | CXCursor_OMPCancellationPointDirective
   | CXCursor_OMPTaskgroupDirective
   | CXCursor_OMPTeamsDirective
   | CXCursor_OMPTargetDirective
   | CXCursor_OMPParallelForSimdDirective
   | CXCursor_OMPForSimdDirective
   | CXCursor_OMPAtomicDirective
   | CXCursor_OMPOrderedDirective
   | CXCursor_SEHLeaveStmt
   | CXCursor_OMPFlushDirective
   | CXCursor_OMPTaskwaitDirective
   | CXCursor_OMPBarrierDirective
   | CXCursor_OMPTaskyieldDirective
   | CXCursor_OMPCriticalDirective
   | CXCursor_OMPMasterDirective
   | CXCursor_OMPTaskDirective
   | CXCursor_OMPParallelSectionsDirective
   | CXCursor_OMPParallelForDirective
   | CXCursor_OMPSingleDirective
   | CXCursor_OMPSectionDirective
   | CXCursor_OMPSectionsDirective
   | CXCursor_OMPForDirective
   | CXCursor_OMPSimdDirective
   | CXCursor_OMPParallelDirective
   | CXCursor_DeclStmt
   | CXCursor_NullStmt
   | CXCursor_MSAsmStmt
   | CXCursor_SEHFinallyStmt
   | CXCursor_SEHExceptStmt
   | CXCursor_SEHTryStmt
   | CXCursor_CXXForRangeStmt
   | CXCursor_CXXTryStmt
   | CXCursor_CXXCatchStmt
   | CXCursor_ObjCForCollectionStmt
   | CXCursor_ObjCAutoreleasePoolStmt
   | CXCursor_ObjCAtSynchronizedStmt
   | CXCursor_ObjCAtThrowStmt
   | CXCursor_ObjCAtFinallyStmt
   | CXCursor_ObjCAtCatchStmt
   | CXCursor_ObjCAtTryStmt
   | CXCursor_AsmStmt
   | CXCursor_GCCAsmStmt
   | CXCursor_ReturnStmt
   | CXCursor_BreakStmt
   | CXCursor_ContinueStmt
   | CXCursor_IndirectGotoStmt
   | CXCursor_GotoStmt
   | CXCursor_ForStmt
   | CXCursor_DoStmt
   | CXCursor_WhileStmt
   | CXCursor_SwitchStmt
   | CXCursor_IfStmt
   | CXCursor_DefaultStmt
   | CXCursor_CaseStmt
   | CXCursor_CompoundStmt
   | CXCursor_LabelStmt
   | CXCursor_UnexposedStmt
   | CXCursor_FirstStmt
   | CXCursor_LastExpr
   | CXCursor_CXXParenListInitExpr
   | CXCursor_RequiresExpr
   | CXCursor_ConceptSpecializationExpr
   | CXCursor_CXXAddrspaceCastExpr
   | CXCursor_OMPIteratorExpr
   | CXCursor_OMPArrayShapingExpr
   | CXCursor_FixedPointLiteral
   | CXCursor_ObjCAvailabilityCheckExpr
   | CXCursor_OMPArraySectionExpr
   | CXCursor_ObjCSelfExpr
   | CXCursor_ObjCBoolLiteralExpr
   | CXCursor_LambdaExpr
   | CXCursor_SizeOfPackExpr
   | CXCursor_PackExpansionExpr
   | CXCursor_ObjCBridgedCastExpr
   | CXCursor_ObjCProtocolExpr
   | CXCursor_ObjCSelectorExpr
   | CXCursor_ObjCEncodeExpr
   | CXCursor_ObjCStringLiteral
   | CXCursor_UnaryExpr
   | CXCursor_CXXDeleteExpr
   | CXCursor_CXXNewExpr
   | CXCursor_CXXThrowExpr
   | CXCursor_CXXThisExpr
   | CXCursor_CXXNullPtrLiteralExpr
   | CXCursor_CXXBoolLiteralExpr
   | CXCursor_CXXTypeidExpr
   | CXCursor_CXXFunctionalCastExpr
   | CXCursor_CXXConstCastExpr
   | CXCursor_CXXReinterpretCastExpr
   | CXCursor_CXXDynamicCastExpr
   | CXCursor_CXXStaticCastExpr
   | CXCursor_GNUNullExpr
   | CXCursor_GenericSelectionExpr
   | CXCursor_StmtExpr
   | CXCursor_AddrLabelExpr
   | CXCursor_InitListExpr
   | CXCursor_CompoundLiteralExpr
   | CXCursor_CStyleCastExpr
   | CXCursor_ConditionalOperator
   | CXCursor_CompoundAssignOperator
   | CXCursor_BinaryOperator
   | CXCursor_ArraySubscriptExpr
   | CXCursor_UnaryOperator
   | CXCursor_ParenExpr
   | CXCursor_CharacterLiteral
   | CXCursor_StringLiteral
   | CXCursor_ImaginaryLiteral
   | CXCursor_FloatingLiteral
   | CXCursor_IntegerLiteral
   | CXCursor_BlockExpr
   | CXCursor_ObjCMessageExpr
   | CXCursor_CallExpr
   | CXCursor_MemberRefExpr
   | CXCursor_DeclRefExpr
   | CXCursor_UnexposedExpr
   | CXCursor_FirstExpr
   | CXCursor_LastInvalid
   | CXCursor_InvalidCode
   | CXCursor_NotImplemented
   | CXCursor_NoDeclFound
   | CXCursor_InvalidFile
   | CXCursor_FirstInvalid
   | CXCursor_LastRef
   | CXCursor_VariableRef
   | CXCursor_OverloadedDeclRef
   | CXCursor_LabelRef
   | CXCursor_MemberRef
   | CXCursor_NamespaceRef
   | CXCursor_TemplateRef
   | CXCursor_CXXBaseSpecifier
   | CXCursor_TypeRef
   | CXCursor_ObjCClassRef
   | CXCursor_ObjCProtocolRef
   | CXCursor_ObjCSuperClassRef
   | CXCursor_FirstRef
   | CXCursor_LastDecl
   | CXCursor_FirstDecl
   | CXCursor_CXXAccessSpecifier
   | CXCursor_ObjCDynamicDecl
   | CXCursor_ObjCSynthesizeDecl
   | CXCursor_TypeAliasDecl
   | CXCursor_UsingDeclaration
   | CXCursor_UsingDirective
   | CXCursor_NamespaceAlias
   | CXCursor_ClassTemplatePartialSpecialization
   | CXCursor_ClassTemplate
   | CXCursor_FunctionTemplate
   | CXCursor_TemplateTemplateParameter
   | CXCursor_NonTypeTemplateParameter
   | CXCursor_TemplateTypeParameter
   | CXCursor_ConversionFunction
   | CXCursor_Destructor
   | CXCursor_Constructor
   | CXCursor_LinkageSpec
   | CXCursor_Namespace
   | CXCursor_CXXMethod
   | CXCursor_TypedefDecl
   | CXCursor_ObjCCategoryImplDecl
   | CXCursor_ObjCImplementationDecl
   | CXCursor_ObjCClassMethodDecl
   | CXCursor_ObjCInstanceMethodDecl
   | CXCursor_ObjCIvarDecl
   | CXCursor_ObjCPropertyDecl
   | CXCursor_ObjCProtocolDecl
   | CXCursor_ObjCCategoryDecl
   | CXCursor_ObjCInterfaceDecl
   | CXCursor_ParmDecl
   | CXCursor_VarDecl
   | CXCursor_FunctionDecl
   | CXCursor_EnumConstantDecl
   | CXCursor_FieldDecl
   | CXCursor_EnumDecl
   | CXCursor_ClassDecl
   | CXCursor_UnionDecl
   | CXCursor_StructDecl
   | CXCursor_UnexposedDecl

%foreign (wrapper "toPrim_CXCursorKind")
toPrim_CXCursorKind : Int -> Prim_CXCursorKind

Cast CXCursorKind Prim_CXCursorKind where
   cast CXCursor_OverloadCandidate = toPrim_CXCursorKind (700)
   cast CXCursor_LastExtraDecl = toPrim_CXCursorKind (604)
   cast CXCursor_FirstExtraDecl = toPrim_CXCursorKind (600)
   cast CXCursor_ConceptDecl = toPrim_CXCursorKind (604)
   cast CXCursor_FriendDecl = toPrim_CXCursorKind (603)
   cast CXCursor_StaticAssert = toPrim_CXCursorKind (602)
   cast CXCursor_TypeAliasTemplateDecl = toPrim_CXCursorKind (601)
   cast CXCursor_ModuleImportDecl = toPrim_CXCursorKind (600)
   cast CXCursor_LastPreprocessing = toPrim_CXCursorKind (503)
   cast CXCursor_FirstPreprocessing = toPrim_CXCursorKind (500)
   cast CXCursor_InclusionDirective = toPrim_CXCursorKind (503)
   cast CXCursor_MacroInstantiation = toPrim_CXCursorKind (502)
   cast CXCursor_MacroExpansion = toPrim_CXCursorKind (502)
   cast CXCursor_MacroDefinition = toPrim_CXCursorKind (501)
   cast CXCursor_PreprocessingDirective = toPrim_CXCursorKind (500)
   cast CXCursor_LastAttr = toPrim_CXCursorKind (441)
   cast CXCursor_AlignedAttr = toPrim_CXCursorKind (441)
   cast CXCursor_WarnUnusedResultAttr = toPrim_CXCursorKind (440)
   cast CXCursor_WarnUnusedAttr = toPrim_CXCursorKind (439)
   cast CXCursor_ConvergentAttr = toPrim_CXCursorKind (438)
   cast CXCursor_FlagEnum = toPrim_CXCursorKind (437)
   cast CXCursor_ObjCBoxable = toPrim_CXCursorKind (436)
   cast CXCursor_ObjCRuntimeVisible = toPrim_CXCursorKind (435)
   cast CXCursor_ObjCDesignatedInitializer = toPrim_CXCursorKind (434)
   cast CXCursor_ObjCExplicitProtocolImpl = toPrim_CXCursorKind (433)
   cast CXCursor_ObjCSubclassingRestricted = toPrim_CXCursorKind (432)
   cast CXCursor_ObjCRootClass = toPrim_CXCursorKind (431)
   cast CXCursor_ObjCRequiresSuper = toPrim_CXCursorKind (430)
   cast CXCursor_ObjCReturnsInnerPointer = toPrim_CXCursorKind (429)
   cast CXCursor_ObjCPreciseLifetime = toPrim_CXCursorKind (428)
   cast CXCursor_ObjCIndependentClass = toPrim_CXCursorKind (427)
   cast CXCursor_ObjCNSObject = toPrim_CXCursorKind (426)
   cast CXCursor_ObjCException = toPrim_CXCursorKind (425)
   cast CXCursor_NSConsumed = toPrim_CXCursorKind (424)
   cast CXCursor_NSConsumesSelf = toPrim_CXCursorKind (423)
   cast CXCursor_NSReturnsAutoreleased = toPrim_CXCursorKind (422)
   cast CXCursor_NSReturnsNotRetained = toPrim_CXCursorKind (421)
   cast CXCursor_NSReturnsRetained = toPrim_CXCursorKind (420)
   cast CXCursor_DLLImport = toPrim_CXCursorKind (419)
   cast CXCursor_DLLExport = toPrim_CXCursorKind (418)
   cast CXCursor_VisibilityAttr = toPrim_CXCursorKind (417)
   cast CXCursor_CUDASharedAttr = toPrim_CXCursorKind (416)
   cast CXCursor_CUDAHostAttr = toPrim_CXCursorKind (415)
   cast CXCursor_CUDAGlobalAttr = toPrim_CXCursorKind (414)
   cast CXCursor_CUDADeviceAttr = toPrim_CXCursorKind (413)
   cast CXCursor_CUDAConstantAttr = toPrim_CXCursorKind (412)
   cast CXCursor_NoDuplicateAttr = toPrim_CXCursorKind (411)
   cast CXCursor_ConstAttr = toPrim_CXCursorKind (410)
   cast CXCursor_PureAttr = toPrim_CXCursorKind (409)
   cast CXCursor_PackedAttr = toPrim_CXCursorKind (408)
   cast CXCursor_AsmLabelAttr = toPrim_CXCursorKind (407)
   cast CXCursor_AnnotateAttr = toPrim_CXCursorKind (406)
   cast CXCursor_CXXOverrideAttr = toPrim_CXCursorKind (405)
   cast CXCursor_CXXFinalAttr = toPrim_CXCursorKind (404)
   cast CXCursor_IBOutletCollectionAttr = toPrim_CXCursorKind (403)
   cast CXCursor_IBOutletAttr = toPrim_CXCursorKind (402)
   cast CXCursor_IBActionAttr = toPrim_CXCursorKind (401)
   cast CXCursor_UnexposedAttr = toPrim_CXCursorKind (400)
   cast CXCursor_FirstAttr = toPrim_CXCursorKind (400)
   cast CXCursor_TranslationUnit = toPrim_CXCursorKind (350)
   cast CXCursor_LastStmt = toPrim_CXCursorKind (305)
   cast CXCursor_OMPErrorDirective = toPrim_CXCursorKind (305)
   cast CXCursor_OMPParallelMaskedTaskLoopSimdDirective = toPrim_CXCursorKind (304)
   cast CXCursor_OMPParallelMaskedTaskLoopDirective = toPrim_CXCursorKind (303)
   cast CXCursor_OMPMaskedTaskLoopSimdDirective = toPrim_CXCursorKind (302)
   cast CXCursor_OMPMaskedTaskLoopDirective = toPrim_CXCursorKind (301)
   cast CXCursor_OMPParallelMaskedDirective = toPrim_CXCursorKind (300)
   cast CXCursor_OMPTargetParallelGenericLoopDirective = toPrim_CXCursorKind (299)
   cast CXCursor_OMPParallelGenericLoopDirective = toPrim_CXCursorKind (298)
   cast CXCursor_OMPTargetTeamsGenericLoopDirective = toPrim_CXCursorKind (297)
   cast CXCursor_OMPTeamsGenericLoopDirective = toPrim_CXCursorKind (296)
   cast CXCursor_OMPGenericLoopDirective = toPrim_CXCursorKind (295)
   cast CXCursor_OMPMetaDirective = toPrim_CXCursorKind (294)
   cast CXCursor_OMPUnrollDirective = toPrim_CXCursorKind (293)
   cast CXCursor_OMPMaskedDirective = toPrim_CXCursorKind (292)
   cast CXCursor_OMPDispatchDirective = toPrim_CXCursorKind (291)
   cast CXCursor_OMPInteropDirective = toPrim_CXCursorKind (290)
   cast CXCursor_OMPCanonicalLoop = toPrim_CXCursorKind (289)
   cast CXCursor_OMPTileDirective = toPrim_CXCursorKind (288)
   cast CXCursor_OMPScanDirective = toPrim_CXCursorKind (287)
   cast CXCursor_OMPDepobjDirective = toPrim_CXCursorKind (286)
   cast CXCursor_OMPParallelMasterDirective = toPrim_CXCursorKind (285)
   cast CXCursor_OMPParallelMasterTaskLoopSimdDirective = toPrim_CXCursorKind (284)
   cast CXCursor_OMPMasterTaskLoopSimdDirective = toPrim_CXCursorKind (283)
   cast CXCursor_OMPParallelMasterTaskLoopDirective = toPrim_CXCursorKind (282)
   cast CXCursor_OMPMasterTaskLoopDirective = toPrim_CXCursorKind (281)
   cast CXCursor_BuiltinBitCastExpr = toPrim_CXCursorKind (280)
   cast CXCursor_OMPTargetTeamsDistributeSimdDirective = toPrim_CXCursorKind (279)
   cast CXCursor_OMPTargetTeamsDistributeParallelForSimdDirective = toPrim_CXCursorKind (278)
   cast CXCursor_OMPTargetTeamsDistributeParallelForDirective = toPrim_CXCursorKind (277)
   cast CXCursor_OMPTargetTeamsDistributeDirective = toPrim_CXCursorKind (276)
   cast CXCursor_OMPTargetTeamsDirective = toPrim_CXCursorKind (275)
   cast CXCursor_OMPTeamsDistributeParallelForDirective = toPrim_CXCursorKind (274)
   cast CXCursor_OMPTeamsDistributeParallelForSimdDirective = toPrim_CXCursorKind (273)
   cast CXCursor_OMPTeamsDistributeSimdDirective = toPrim_CXCursorKind (272)
   cast CXCursor_OMPTeamsDistributeDirective = toPrim_CXCursorKind (271)
   cast CXCursor_OMPTargetSimdDirective = toPrim_CXCursorKind (270)
   cast CXCursor_OMPTargetParallelForSimdDirective = toPrim_CXCursorKind (269)
   cast CXCursor_OMPDistributeSimdDirective = toPrim_CXCursorKind (268)
   cast CXCursor_OMPDistributeParallelForSimdDirective = toPrim_CXCursorKind (267)
   cast CXCursor_OMPDistributeParallelForDirective = toPrim_CXCursorKind (266)
   cast CXCursor_OMPTargetUpdateDirective = toPrim_CXCursorKind (265)
   cast CXCursor_OMPTargetParallelForDirective = toPrim_CXCursorKind (264)
   cast CXCursor_OMPTargetParallelDirective = toPrim_CXCursorKind (263)
   cast CXCursor_OMPTargetExitDataDirective = toPrim_CXCursorKind (262)
   cast CXCursor_OMPTargetEnterDataDirective = toPrim_CXCursorKind (261)
   cast CXCursor_OMPDistributeDirective = toPrim_CXCursorKind (260)
   cast CXCursor_OMPTaskLoopSimdDirective = toPrim_CXCursorKind (259)
   cast CXCursor_OMPTaskLoopDirective = toPrim_CXCursorKind (258)
   cast CXCursor_OMPTargetDataDirective = toPrim_CXCursorKind (257)
   cast CXCursor_OMPCancelDirective = toPrim_CXCursorKind (256)
   cast CXCursor_OMPCancellationPointDirective = toPrim_CXCursorKind (255)
   cast CXCursor_OMPTaskgroupDirective = toPrim_CXCursorKind (254)
   cast CXCursor_OMPTeamsDirective = toPrim_CXCursorKind (253)
   cast CXCursor_OMPTargetDirective = toPrim_CXCursorKind (252)
   cast CXCursor_OMPParallelForSimdDirective = toPrim_CXCursorKind (251)
   cast CXCursor_OMPForSimdDirective = toPrim_CXCursorKind (250)
   cast CXCursor_OMPAtomicDirective = toPrim_CXCursorKind (249)
   cast CXCursor_OMPOrderedDirective = toPrim_CXCursorKind (248)
   cast CXCursor_SEHLeaveStmt = toPrim_CXCursorKind (247)
   cast CXCursor_OMPFlushDirective = toPrim_CXCursorKind (246)
   cast CXCursor_OMPTaskwaitDirective = toPrim_CXCursorKind (245)
   cast CXCursor_OMPBarrierDirective = toPrim_CXCursorKind (244)
   cast CXCursor_OMPTaskyieldDirective = toPrim_CXCursorKind (243)
   cast CXCursor_OMPCriticalDirective = toPrim_CXCursorKind (242)
   cast CXCursor_OMPMasterDirective = toPrim_CXCursorKind (241)
   cast CXCursor_OMPTaskDirective = toPrim_CXCursorKind (240)
   cast CXCursor_OMPParallelSectionsDirective = toPrim_CXCursorKind (239)
   cast CXCursor_OMPParallelForDirective = toPrim_CXCursorKind (238)
   cast CXCursor_OMPSingleDirective = toPrim_CXCursorKind (237)
   cast CXCursor_OMPSectionDirective = toPrim_CXCursorKind (236)
   cast CXCursor_OMPSectionsDirective = toPrim_CXCursorKind (235)
   cast CXCursor_OMPForDirective = toPrim_CXCursorKind (234)
   cast CXCursor_OMPSimdDirective = toPrim_CXCursorKind (233)
   cast CXCursor_OMPParallelDirective = toPrim_CXCursorKind (232)
   cast CXCursor_DeclStmt = toPrim_CXCursorKind (231)
   cast CXCursor_NullStmt = toPrim_CXCursorKind (230)
   cast CXCursor_MSAsmStmt = toPrim_CXCursorKind (229)
   cast CXCursor_SEHFinallyStmt = toPrim_CXCursorKind (228)
   cast CXCursor_SEHExceptStmt = toPrim_CXCursorKind (227)
   cast CXCursor_SEHTryStmt = toPrim_CXCursorKind (226)
   cast CXCursor_CXXForRangeStmt = toPrim_CXCursorKind (225)
   cast CXCursor_CXXTryStmt = toPrim_CXCursorKind (224)
   cast CXCursor_CXXCatchStmt = toPrim_CXCursorKind (223)
   cast CXCursor_ObjCForCollectionStmt = toPrim_CXCursorKind (222)
   cast CXCursor_ObjCAutoreleasePoolStmt = toPrim_CXCursorKind (221)
   cast CXCursor_ObjCAtSynchronizedStmt = toPrim_CXCursorKind (220)
   cast CXCursor_ObjCAtThrowStmt = toPrim_CXCursorKind (219)
   cast CXCursor_ObjCAtFinallyStmt = toPrim_CXCursorKind (218)
   cast CXCursor_ObjCAtCatchStmt = toPrim_CXCursorKind (217)
   cast CXCursor_ObjCAtTryStmt = toPrim_CXCursorKind (216)
   cast CXCursor_AsmStmt = toPrim_CXCursorKind (215)
   cast CXCursor_GCCAsmStmt = toPrim_CXCursorKind (215)
   cast CXCursor_ReturnStmt = toPrim_CXCursorKind (214)
   cast CXCursor_BreakStmt = toPrim_CXCursorKind (213)
   cast CXCursor_ContinueStmt = toPrim_CXCursorKind (212)
   cast CXCursor_IndirectGotoStmt = toPrim_CXCursorKind (211)
   cast CXCursor_GotoStmt = toPrim_CXCursorKind (210)
   cast CXCursor_ForStmt = toPrim_CXCursorKind (209)
   cast CXCursor_DoStmt = toPrim_CXCursorKind (208)
   cast CXCursor_WhileStmt = toPrim_CXCursorKind (207)
   cast CXCursor_SwitchStmt = toPrim_CXCursorKind (206)
   cast CXCursor_IfStmt = toPrim_CXCursorKind (205)
   cast CXCursor_DefaultStmt = toPrim_CXCursorKind (204)
   cast CXCursor_CaseStmt = toPrim_CXCursorKind (203)
   cast CXCursor_CompoundStmt = toPrim_CXCursorKind (202)
   cast CXCursor_LabelStmt = toPrim_CXCursorKind (201)
   cast CXCursor_UnexposedStmt = toPrim_CXCursorKind (200)
   cast CXCursor_FirstStmt = toPrim_CXCursorKind (200)
   cast CXCursor_LastExpr = toPrim_CXCursorKind (155)
   cast CXCursor_CXXParenListInitExpr = toPrim_CXCursorKind (155)
   cast CXCursor_RequiresExpr = toPrim_CXCursorKind (154)
   cast CXCursor_ConceptSpecializationExpr = toPrim_CXCursorKind (153)
   cast CXCursor_CXXAddrspaceCastExpr = toPrim_CXCursorKind (152)
   cast CXCursor_OMPIteratorExpr = toPrim_CXCursorKind (151)
   cast CXCursor_OMPArrayShapingExpr = toPrim_CXCursorKind (150)
   cast CXCursor_FixedPointLiteral = toPrim_CXCursorKind (149)
   cast CXCursor_ObjCAvailabilityCheckExpr = toPrim_CXCursorKind (148)
   cast CXCursor_OMPArraySectionExpr = toPrim_CXCursorKind (147)
   cast CXCursor_ObjCSelfExpr = toPrim_CXCursorKind (146)
   cast CXCursor_ObjCBoolLiteralExpr = toPrim_CXCursorKind (145)
   cast CXCursor_LambdaExpr = toPrim_CXCursorKind (144)
   cast CXCursor_SizeOfPackExpr = toPrim_CXCursorKind (143)
   cast CXCursor_PackExpansionExpr = toPrim_CXCursorKind (142)
   cast CXCursor_ObjCBridgedCastExpr = toPrim_CXCursorKind (141)
   cast CXCursor_ObjCProtocolExpr = toPrim_CXCursorKind (140)
   cast CXCursor_ObjCSelectorExpr = toPrim_CXCursorKind (139)
   cast CXCursor_ObjCEncodeExpr = toPrim_CXCursorKind (138)
   cast CXCursor_ObjCStringLiteral = toPrim_CXCursorKind (137)
   cast CXCursor_UnaryExpr = toPrim_CXCursorKind (136)
   cast CXCursor_CXXDeleteExpr = toPrim_CXCursorKind (135)
   cast CXCursor_CXXNewExpr = toPrim_CXCursorKind (134)
   cast CXCursor_CXXThrowExpr = toPrim_CXCursorKind (133)
   cast CXCursor_CXXThisExpr = toPrim_CXCursorKind (132)
   cast CXCursor_CXXNullPtrLiteralExpr = toPrim_CXCursorKind (131)
   cast CXCursor_CXXBoolLiteralExpr = toPrim_CXCursorKind (130)
   cast CXCursor_CXXTypeidExpr = toPrim_CXCursorKind (129)
   cast CXCursor_CXXFunctionalCastExpr = toPrim_CXCursorKind (128)
   cast CXCursor_CXXConstCastExpr = toPrim_CXCursorKind (127)
   cast CXCursor_CXXReinterpretCastExpr = toPrim_CXCursorKind (126)
   cast CXCursor_CXXDynamicCastExpr = toPrim_CXCursorKind (125)
   cast CXCursor_CXXStaticCastExpr = toPrim_CXCursorKind (124)
   cast CXCursor_GNUNullExpr = toPrim_CXCursorKind (123)
   cast CXCursor_GenericSelectionExpr = toPrim_CXCursorKind (122)
   cast CXCursor_StmtExpr = toPrim_CXCursorKind (121)
   cast CXCursor_AddrLabelExpr = toPrim_CXCursorKind (120)
   cast CXCursor_InitListExpr = toPrim_CXCursorKind (119)
   cast CXCursor_CompoundLiteralExpr = toPrim_CXCursorKind (118)
   cast CXCursor_CStyleCastExpr = toPrim_CXCursorKind (117)
   cast CXCursor_ConditionalOperator = toPrim_CXCursorKind (116)
   cast CXCursor_CompoundAssignOperator = toPrim_CXCursorKind (115)
   cast CXCursor_BinaryOperator = toPrim_CXCursorKind (114)
   cast CXCursor_ArraySubscriptExpr = toPrim_CXCursorKind (113)
   cast CXCursor_UnaryOperator = toPrim_CXCursorKind (112)
   cast CXCursor_ParenExpr = toPrim_CXCursorKind (111)
   cast CXCursor_CharacterLiteral = toPrim_CXCursorKind (110)
   cast CXCursor_StringLiteral = toPrim_CXCursorKind (109)
   cast CXCursor_ImaginaryLiteral = toPrim_CXCursorKind (108)
   cast CXCursor_FloatingLiteral = toPrim_CXCursorKind (107)
   cast CXCursor_IntegerLiteral = toPrim_CXCursorKind (106)
   cast CXCursor_BlockExpr = toPrim_CXCursorKind (105)
   cast CXCursor_ObjCMessageExpr = toPrim_CXCursorKind (104)
   cast CXCursor_CallExpr = toPrim_CXCursorKind (103)
   cast CXCursor_MemberRefExpr = toPrim_CXCursorKind (102)
   cast CXCursor_DeclRefExpr = toPrim_CXCursorKind (101)
   cast CXCursor_UnexposedExpr = toPrim_CXCursorKind (100)
   cast CXCursor_FirstExpr = toPrim_CXCursorKind (100)
   cast CXCursor_LastInvalid = toPrim_CXCursorKind (73)
   cast CXCursor_InvalidCode = toPrim_CXCursorKind (73)
   cast CXCursor_NotImplemented = toPrim_CXCursorKind (72)
   cast CXCursor_NoDeclFound = toPrim_CXCursorKind (71)
   cast CXCursor_InvalidFile = toPrim_CXCursorKind (70)
   cast CXCursor_FirstInvalid = toPrim_CXCursorKind (70)
   cast CXCursor_LastRef = toPrim_CXCursorKind (50)
   cast CXCursor_VariableRef = toPrim_CXCursorKind (50)
   cast CXCursor_OverloadedDeclRef = toPrim_CXCursorKind (49)
   cast CXCursor_LabelRef = toPrim_CXCursorKind (48)
   cast CXCursor_MemberRef = toPrim_CXCursorKind (47)
   cast CXCursor_NamespaceRef = toPrim_CXCursorKind (46)
   cast CXCursor_TemplateRef = toPrim_CXCursorKind (45)
   cast CXCursor_CXXBaseSpecifier = toPrim_CXCursorKind (44)
   cast CXCursor_TypeRef = toPrim_CXCursorKind (43)
   cast CXCursor_ObjCClassRef = toPrim_CXCursorKind (42)
   cast CXCursor_ObjCProtocolRef = toPrim_CXCursorKind (41)
   cast CXCursor_ObjCSuperClassRef = toPrim_CXCursorKind (40)
   cast CXCursor_FirstRef = toPrim_CXCursorKind (40)
   cast CXCursor_LastDecl = toPrim_CXCursorKind (39)
   cast CXCursor_FirstDecl = toPrim_CXCursorKind (1)
   cast CXCursor_CXXAccessSpecifier = toPrim_CXCursorKind (39)
   cast CXCursor_ObjCDynamicDecl = toPrim_CXCursorKind (38)
   cast CXCursor_ObjCSynthesizeDecl = toPrim_CXCursorKind (37)
   cast CXCursor_TypeAliasDecl = toPrim_CXCursorKind (36)
   cast CXCursor_UsingDeclaration = toPrim_CXCursorKind (35)
   cast CXCursor_UsingDirective = toPrim_CXCursorKind (34)
   cast CXCursor_NamespaceAlias = toPrim_CXCursorKind (33)
   cast CXCursor_ClassTemplatePartialSpecialization = toPrim_CXCursorKind (32)
   cast CXCursor_ClassTemplate = toPrim_CXCursorKind (31)
   cast CXCursor_FunctionTemplate = toPrim_CXCursorKind (30)
   cast CXCursor_TemplateTemplateParameter = toPrim_CXCursorKind (29)
   cast CXCursor_NonTypeTemplateParameter = toPrim_CXCursorKind (28)
   cast CXCursor_TemplateTypeParameter = toPrim_CXCursorKind (27)
   cast CXCursor_ConversionFunction = toPrim_CXCursorKind (26)
   cast CXCursor_Destructor = toPrim_CXCursorKind (25)
   cast CXCursor_Constructor = toPrim_CXCursorKind (24)
   cast CXCursor_LinkageSpec = toPrim_CXCursorKind (23)
   cast CXCursor_Namespace = toPrim_CXCursorKind (22)
   cast CXCursor_CXXMethod = toPrim_CXCursorKind (21)
   cast CXCursor_TypedefDecl = toPrim_CXCursorKind (20)
   cast CXCursor_ObjCCategoryImplDecl = toPrim_CXCursorKind (19)
   cast CXCursor_ObjCImplementationDecl = toPrim_CXCursorKind (18)
   cast CXCursor_ObjCClassMethodDecl = toPrim_CXCursorKind (17)
   cast CXCursor_ObjCInstanceMethodDecl = toPrim_CXCursorKind (16)
   cast CXCursor_ObjCIvarDecl = toPrim_CXCursorKind (15)
   cast CXCursor_ObjCPropertyDecl = toPrim_CXCursorKind (14)
   cast CXCursor_ObjCProtocolDecl = toPrim_CXCursorKind (13)
   cast CXCursor_ObjCCategoryDecl = toPrim_CXCursorKind (12)
   cast CXCursor_ObjCInterfaceDecl = toPrim_CXCursorKind (11)
   cast CXCursor_ParmDecl = toPrim_CXCursorKind (10)
   cast CXCursor_VarDecl = toPrim_CXCursorKind (9)
   cast CXCursor_FunctionDecl = toPrim_CXCursorKind (8)
   cast CXCursor_EnumConstantDecl = toPrim_CXCursorKind (7)
   cast CXCursor_FieldDecl = toPrim_CXCursorKind (6)
   cast CXCursor_EnumDecl = toPrim_CXCursorKind (5)
   cast CXCursor_ClassDecl = toPrim_CXCursorKind (4)
   cast CXCursor_UnionDecl = toPrim_CXCursorKind (3)
   cast CXCursor_StructDecl = toPrim_CXCursorKind (2)
   cast CXCursor_UnexposedDecl = toPrim_CXCursorKind (1)

%foreign (wrapper "fromPrim_CXCursorKind")
fromPrim_CXCursorKind : Prim_CXCursorKind -> Int

Cast Prim_CXCursorKind CXCursorKind where
   cast x = case (fromPrim_CXCursorKind x) of
      (700) => CXCursor_OverloadCandidate
      (604) => CXCursor_ConceptDecl
      (603) => CXCursor_FriendDecl
      (602) => CXCursor_StaticAssert
      (601) => CXCursor_TypeAliasTemplateDecl
      (600) => CXCursor_ModuleImportDecl
      (503) => CXCursor_InclusionDirective
      (502) => CXCursor_MacroExpansion
      (501) => CXCursor_MacroDefinition
      (500) => CXCursor_PreprocessingDirective
      (441) => CXCursor_AlignedAttr
      (440) => CXCursor_WarnUnusedResultAttr
      (439) => CXCursor_WarnUnusedAttr
      (438) => CXCursor_ConvergentAttr
      (437) => CXCursor_FlagEnum
      (436) => CXCursor_ObjCBoxable
      (435) => CXCursor_ObjCRuntimeVisible
      (434) => CXCursor_ObjCDesignatedInitializer
      (433) => CXCursor_ObjCExplicitProtocolImpl
      (432) => CXCursor_ObjCSubclassingRestricted
      (431) => CXCursor_ObjCRootClass
      (430) => CXCursor_ObjCRequiresSuper
      (429) => CXCursor_ObjCReturnsInnerPointer
      (428) => CXCursor_ObjCPreciseLifetime
      (427) => CXCursor_ObjCIndependentClass
      (426) => CXCursor_ObjCNSObject
      (425) => CXCursor_ObjCException
      (424) => CXCursor_NSConsumed
      (423) => CXCursor_NSConsumesSelf
      (422) => CXCursor_NSReturnsAutoreleased
      (421) => CXCursor_NSReturnsNotRetained
      (420) => CXCursor_NSReturnsRetained
      (419) => CXCursor_DLLImport
      (418) => CXCursor_DLLExport
      (417) => CXCursor_VisibilityAttr
      (416) => CXCursor_CUDASharedAttr
      (415) => CXCursor_CUDAHostAttr
      (414) => CXCursor_CUDAGlobalAttr
      (413) => CXCursor_CUDADeviceAttr
      (412) => CXCursor_CUDAConstantAttr
      (411) => CXCursor_NoDuplicateAttr
      (410) => CXCursor_ConstAttr
      (409) => CXCursor_PureAttr
      (408) => CXCursor_PackedAttr
      (407) => CXCursor_AsmLabelAttr
      (406) => CXCursor_AnnotateAttr
      (405) => CXCursor_CXXOverrideAttr
      (404) => CXCursor_CXXFinalAttr
      (403) => CXCursor_IBOutletCollectionAttr
      (402) => CXCursor_IBOutletAttr
      (401) => CXCursor_IBActionAttr
      (400) => CXCursor_FirstAttr
      (350) => CXCursor_TranslationUnit
      (305) => CXCursor_OMPErrorDirective
      (304) => CXCursor_OMPParallelMaskedTaskLoopSimdDirective
      (303) => CXCursor_OMPParallelMaskedTaskLoopDirective
      (302) => CXCursor_OMPMaskedTaskLoopSimdDirective
      (301) => CXCursor_OMPMaskedTaskLoopDirective
      (300) => CXCursor_OMPParallelMaskedDirective
      (299) => CXCursor_OMPTargetParallelGenericLoopDirective
      (298) => CXCursor_OMPParallelGenericLoopDirective
      (297) => CXCursor_OMPTargetTeamsGenericLoopDirective
      (296) => CXCursor_OMPTeamsGenericLoopDirective
      (295) => CXCursor_OMPGenericLoopDirective
      (294) => CXCursor_OMPMetaDirective
      (293) => CXCursor_OMPUnrollDirective
      (292) => CXCursor_OMPMaskedDirective
      (291) => CXCursor_OMPDispatchDirective
      (290) => CXCursor_OMPInteropDirective
      (289) => CXCursor_OMPCanonicalLoop
      (288) => CXCursor_OMPTileDirective
      (287) => CXCursor_OMPScanDirective
      (286) => CXCursor_OMPDepobjDirective
      (285) => CXCursor_OMPParallelMasterDirective
      (284) => CXCursor_OMPParallelMasterTaskLoopSimdDirective
      (283) => CXCursor_OMPMasterTaskLoopSimdDirective
      (282) => CXCursor_OMPParallelMasterTaskLoopDirective
      (281) => CXCursor_OMPMasterTaskLoopDirective
      (280) => CXCursor_BuiltinBitCastExpr
      (279) => CXCursor_OMPTargetTeamsDistributeSimdDirective
      (278) => CXCursor_OMPTargetTeamsDistributeParallelForSimdDirective
      (277) => CXCursor_OMPTargetTeamsDistributeParallelForDirective
      (276) => CXCursor_OMPTargetTeamsDistributeDirective
      (275) => CXCursor_OMPTargetTeamsDirective
      (274) => CXCursor_OMPTeamsDistributeParallelForDirective
      (273) => CXCursor_OMPTeamsDistributeParallelForSimdDirective
      (272) => CXCursor_OMPTeamsDistributeSimdDirective
      (271) => CXCursor_OMPTeamsDistributeDirective
      (270) => CXCursor_OMPTargetSimdDirective
      (269) => CXCursor_OMPTargetParallelForSimdDirective
      (268) => CXCursor_OMPDistributeSimdDirective
      (267) => CXCursor_OMPDistributeParallelForSimdDirective
      (266) => CXCursor_OMPDistributeParallelForDirective
      (265) => CXCursor_OMPTargetUpdateDirective
      (264) => CXCursor_OMPTargetParallelForDirective
      (263) => CXCursor_OMPTargetParallelDirective
      (262) => CXCursor_OMPTargetExitDataDirective
      (261) => CXCursor_OMPTargetEnterDataDirective
      (260) => CXCursor_OMPDistributeDirective
      (259) => CXCursor_OMPTaskLoopSimdDirective
      (258) => CXCursor_OMPTaskLoopDirective
      (257) => CXCursor_OMPTargetDataDirective
      (256) => CXCursor_OMPCancelDirective
      (255) => CXCursor_OMPCancellationPointDirective
      (254) => CXCursor_OMPTaskgroupDirective
      (253) => CXCursor_OMPTeamsDirective
      (252) => CXCursor_OMPTargetDirective
      (251) => CXCursor_OMPParallelForSimdDirective
      (250) => CXCursor_OMPForSimdDirective
      (249) => CXCursor_OMPAtomicDirective
      (248) => CXCursor_OMPOrderedDirective
      (247) => CXCursor_SEHLeaveStmt
      (246) => CXCursor_OMPFlushDirective
      (245) => CXCursor_OMPTaskwaitDirective
      (244) => CXCursor_OMPBarrierDirective
      (243) => CXCursor_OMPTaskyieldDirective
      (242) => CXCursor_OMPCriticalDirective
      (241) => CXCursor_OMPMasterDirective
      (240) => CXCursor_OMPTaskDirective
      (239) => CXCursor_OMPParallelSectionsDirective
      (238) => CXCursor_OMPParallelForDirective
      (237) => CXCursor_OMPSingleDirective
      (236) => CXCursor_OMPSectionDirective
      (235) => CXCursor_OMPSectionsDirective
      (234) => CXCursor_OMPForDirective
      (233) => CXCursor_OMPSimdDirective
      (232) => CXCursor_OMPParallelDirective
      (231) => CXCursor_DeclStmt
      (230) => CXCursor_NullStmt
      (229) => CXCursor_MSAsmStmt
      (228) => CXCursor_SEHFinallyStmt
      (227) => CXCursor_SEHExceptStmt
      (226) => CXCursor_SEHTryStmt
      (225) => CXCursor_CXXForRangeStmt
      (224) => CXCursor_CXXTryStmt
      (223) => CXCursor_CXXCatchStmt
      (222) => CXCursor_ObjCForCollectionStmt
      (221) => CXCursor_ObjCAutoreleasePoolStmt
      (220) => CXCursor_ObjCAtSynchronizedStmt
      (219) => CXCursor_ObjCAtThrowStmt
      (218) => CXCursor_ObjCAtFinallyStmt
      (217) => CXCursor_ObjCAtCatchStmt
      (216) => CXCursor_ObjCAtTryStmt
      (215) => CXCursor_GCCAsmStmt
      (214) => CXCursor_ReturnStmt
      (213) => CXCursor_BreakStmt
      (212) => CXCursor_ContinueStmt
      (211) => CXCursor_IndirectGotoStmt
      (210) => CXCursor_GotoStmt
      (209) => CXCursor_ForStmt
      (208) => CXCursor_DoStmt
      (207) => CXCursor_WhileStmt
      (206) => CXCursor_SwitchStmt
      (205) => CXCursor_IfStmt
      (204) => CXCursor_DefaultStmt
      (203) => CXCursor_CaseStmt
      (202) => CXCursor_CompoundStmt
      (201) => CXCursor_LabelStmt
      (200) => CXCursor_FirstStmt
      (155) => CXCursor_CXXParenListInitExpr
      (154) => CXCursor_RequiresExpr
      (153) => CXCursor_ConceptSpecializationExpr
      (152) => CXCursor_CXXAddrspaceCastExpr
      (151) => CXCursor_OMPIteratorExpr
      (150) => CXCursor_OMPArrayShapingExpr
      (149) => CXCursor_FixedPointLiteral
      (148) => CXCursor_ObjCAvailabilityCheckExpr
      (147) => CXCursor_OMPArraySectionExpr
      (146) => CXCursor_ObjCSelfExpr
      (145) => CXCursor_ObjCBoolLiteralExpr
      (144) => CXCursor_LambdaExpr
      (143) => CXCursor_SizeOfPackExpr
      (142) => CXCursor_PackExpansionExpr
      (141) => CXCursor_ObjCBridgedCastExpr
      (140) => CXCursor_ObjCProtocolExpr
      (139) => CXCursor_ObjCSelectorExpr
      (138) => CXCursor_ObjCEncodeExpr
      (137) => CXCursor_ObjCStringLiteral
      (136) => CXCursor_UnaryExpr
      (135) => CXCursor_CXXDeleteExpr
      (134) => CXCursor_CXXNewExpr
      (133) => CXCursor_CXXThrowExpr
      (132) => CXCursor_CXXThisExpr
      (131) => CXCursor_CXXNullPtrLiteralExpr
      (130) => CXCursor_CXXBoolLiteralExpr
      (129) => CXCursor_CXXTypeidExpr
      (128) => CXCursor_CXXFunctionalCastExpr
      (127) => CXCursor_CXXConstCastExpr
      (126) => CXCursor_CXXReinterpretCastExpr
      (125) => CXCursor_CXXDynamicCastExpr
      (124) => CXCursor_CXXStaticCastExpr
      (123) => CXCursor_GNUNullExpr
      (122) => CXCursor_GenericSelectionExpr
      (121) => CXCursor_StmtExpr
      (120) => CXCursor_AddrLabelExpr
      (119) => CXCursor_InitListExpr
      (118) => CXCursor_CompoundLiteralExpr
      (117) => CXCursor_CStyleCastExpr
      (116) => CXCursor_ConditionalOperator
      (115) => CXCursor_CompoundAssignOperator
      (114) => CXCursor_BinaryOperator
      (113) => CXCursor_ArraySubscriptExpr
      (112) => CXCursor_UnaryOperator
      (111) => CXCursor_ParenExpr
      (110) => CXCursor_CharacterLiteral
      (109) => CXCursor_StringLiteral
      (108) => CXCursor_ImaginaryLiteral
      (107) => CXCursor_FloatingLiteral
      (106) => CXCursor_IntegerLiteral
      (105) => CXCursor_BlockExpr
      (104) => CXCursor_ObjCMessageExpr
      (103) => CXCursor_CallExpr
      (102) => CXCursor_MemberRefExpr
      (101) => CXCursor_DeclRefExpr
      (100) => CXCursor_FirstExpr
      (73) => CXCursor_InvalidCode
      (72) => CXCursor_NotImplemented
      (71) => CXCursor_NoDeclFound
      (70) => CXCursor_FirstInvalid
      (50) => CXCursor_VariableRef
      (49) => CXCursor_OverloadedDeclRef
      (48) => CXCursor_LabelRef
      (47) => CXCursor_MemberRef
      (46) => CXCursor_NamespaceRef
      (45) => CXCursor_TemplateRef
      (44) => CXCursor_CXXBaseSpecifier
      (43) => CXCursor_TypeRef
      (42) => CXCursor_ObjCClassRef
      (41) => CXCursor_ObjCProtocolRef
      (40) => CXCursor_FirstRef
      (39) => CXCursor_CXXAccessSpecifier
      (38) => CXCursor_ObjCDynamicDecl
      (37) => CXCursor_ObjCSynthesizeDecl
      (36) => CXCursor_TypeAliasDecl
      (35) => CXCursor_UsingDeclaration
      (34) => CXCursor_UsingDirective
      (33) => CXCursor_NamespaceAlias
      (32) => CXCursor_ClassTemplatePartialSpecialization
      (31) => CXCursor_ClassTemplate
      (30) => CXCursor_FunctionTemplate
      (29) => CXCursor_TemplateTemplateParameter
      (28) => CXCursor_NonTypeTemplateParameter
      (27) => CXCursor_TemplateTypeParameter
      (26) => CXCursor_ConversionFunction
      (25) => CXCursor_Destructor
      (24) => CXCursor_Constructor
      (23) => CXCursor_LinkageSpec
      (22) => CXCursor_Namespace
      (21) => CXCursor_CXXMethod
      (20) => CXCursor_TypedefDecl
      (19) => CXCursor_ObjCCategoryImplDecl
      (18) => CXCursor_ObjCImplementationDecl
      (17) => CXCursor_ObjCClassMethodDecl
      (16) => CXCursor_ObjCInstanceMethodDecl
      (15) => CXCursor_ObjCIvarDecl
      (14) => CXCursor_ObjCPropertyDecl
      (13) => CXCursor_ObjCProtocolDecl
      (12) => CXCursor_ObjCCategoryDecl
      (11) => CXCursor_ObjCInterfaceDecl
      (10) => CXCursor_ParmDecl
      (9) => CXCursor_VarDecl
      (8) => CXCursor_FunctionDecl
      (7) => CXCursor_EnumConstantDecl
      (6) => CXCursor_FieldDecl
      (5) => CXCursor_EnumDecl
      (4) => CXCursor_ClassDecl
      (3) => CXCursor_UnionDecl
      (2) => CXCursor_StructDecl
      (1) => CXCursor_UnexposedDecl
      _ => assert_total $ idris_crash "Invalid cast from Prim_CXCursorKind to CXCursorKind"

Prim_CXLinkageKind : Type
Prim_CXLinkageKind = Int

data CXLinkageKind
   = CXLinkage_External
   | CXLinkage_UniqueExternal
   | CXLinkage_Internal
   | CXLinkage_NoLinkage
   | CXLinkage_Invalid

%foreign (wrapper "toPrim_CXLinkageKind")
toPrim_CXLinkageKind : Int -> Prim_CXLinkageKind

Cast CXLinkageKind Prim_CXLinkageKind where
   cast CXLinkage_External = toPrim_CXLinkageKind (4)
   cast CXLinkage_UniqueExternal = toPrim_CXLinkageKind (3)
   cast CXLinkage_Internal = toPrim_CXLinkageKind (2)
   cast CXLinkage_NoLinkage = toPrim_CXLinkageKind (1)
   cast CXLinkage_Invalid = toPrim_CXLinkageKind (0)

%foreign (wrapper "fromPrim_CXLinkageKind")
fromPrim_CXLinkageKind : Prim_CXLinkageKind -> Int

Cast Prim_CXLinkageKind CXLinkageKind where
   cast x = case (fromPrim_CXLinkageKind x) of
      (4) => CXLinkage_External
      (3) => CXLinkage_UniqueExternal
      (2) => CXLinkage_Internal
      (1) => CXLinkage_NoLinkage
      (0) => CXLinkage_Invalid
      _ => assert_total $ idris_crash "Invalid cast from Prim_CXLinkageKind to CXLinkageKind"

Prim_CXVisibilityKind : Type
Prim_CXVisibilityKind = Int

data CXVisibilityKind
   = CXVisibility_Default
   | CXVisibility_Protected
   | CXVisibility_Hidden
   | CXVisibility_Invalid

%foreign (wrapper "toPrim_CXVisibilityKind")
toPrim_CXVisibilityKind : Int -> Prim_CXVisibilityKind

Cast CXVisibilityKind Prim_CXVisibilityKind where
   cast CXVisibility_Default = toPrim_CXVisibilityKind (3)
   cast CXVisibility_Protected = toPrim_CXVisibilityKind (2)
   cast CXVisibility_Hidden = toPrim_CXVisibilityKind (1)
   cast CXVisibility_Invalid = toPrim_CXVisibilityKind (0)

%foreign (wrapper "fromPrim_CXVisibilityKind")
fromPrim_CXVisibilityKind : Prim_CXVisibilityKind -> Int

Cast Prim_CXVisibilityKind CXVisibilityKind where
   cast x = case (fromPrim_CXVisibilityKind x) of
      (3) => CXVisibility_Default
      (2) => CXVisibility_Protected
      (1) => CXVisibility_Hidden
      (0) => CXVisibility_Invalid
      _ => assert_total $ idris_crash "Invalid cast from Prim_CXVisibilityKind to CXVisibilityKind"

Prim_CXLanguageKind : Type
Prim_CXLanguageKind = Int

data CXLanguageKind
   = CXLanguage_CPlusPlus
   | CXLanguage_ObjC
   | CXLanguage_C
   | CXLanguage_Invalid

%foreign (wrapper "toPrim_CXLanguageKind")
toPrim_CXLanguageKind : Int -> Prim_CXLanguageKind

Cast CXLanguageKind Prim_CXLanguageKind where
   cast CXLanguage_CPlusPlus = toPrim_CXLanguageKind (3)
   cast CXLanguage_ObjC = toPrim_CXLanguageKind (2)
   cast CXLanguage_C = toPrim_CXLanguageKind (1)
   cast CXLanguage_Invalid = toPrim_CXLanguageKind (0)

%foreign (wrapper "fromPrim_CXLanguageKind")
fromPrim_CXLanguageKind : Prim_CXLanguageKind -> Int

Cast Prim_CXLanguageKind CXLanguageKind where
   cast x = case (fromPrim_CXLanguageKind x) of
      (3) => CXLanguage_CPlusPlus
      (2) => CXLanguage_ObjC
      (1) => CXLanguage_C
      (0) => CXLanguage_Invalid
      _ => assert_total $ idris_crash "Invalid cast from Prim_CXLanguageKind to CXLanguageKind"

Prim_CXTLSKind : Type
Prim_CXTLSKind = Int

data CXTLSKind
   = CXTLS_Static
   | CXTLS_Dynamic
   | CXTLS_None

%foreign (wrapper "toPrim_CXTLSKind")
toPrim_CXTLSKind : Int -> Prim_CXTLSKind

Cast CXTLSKind Prim_CXTLSKind where
   cast CXTLS_Static = toPrim_CXTLSKind (2)
   cast CXTLS_Dynamic = toPrim_CXTLSKind (1)
   cast CXTLS_None = toPrim_CXTLSKind (0)

%foreign (wrapper "fromPrim_CXTLSKind")
fromPrim_CXTLSKind : Prim_CXTLSKind -> Int

Cast Prim_CXTLSKind CXTLSKind where
   cast x = case (fromPrim_CXTLSKind x) of
      (2) => CXTLS_Static
      (1) => CXTLS_Dynamic
      (0) => CXTLS_None
      _ => assert_total $ idris_crash "Invalid cast from Prim_CXTLSKind to CXTLSKind"

Prim_CXTypeKind : Type
Prim_CXTypeKind = Int

data CXTypeKind
   = CXType_BTFTagAttributed
   | CXType_Atomic
   | CXType_ExtVector
   | CXType_OCLIntelSubgroupAVCImeDualRefStreamin
   | CXType_OCLIntelSubgroupAVCImeSingleRefStreamin
   | CXType_OCLIntelSubgroupAVCImeResultDualRefStreamout
   | CXType_OCLIntelSubgroupAVCImeResultSingleRefStreamout
   | CXType_OCLIntelSubgroupAVCImeDualReferenceStreamin
   | CXType_OCLIntelSubgroupAVCImeSingleReferenceStreamin
   | CXType_OCLIntelSubgroupAVCImeResultDualReferenceStreamout
   | CXType_OCLIntelSubgroupAVCImeResultSingleReferenceStreamout
   | CXType_OCLIntelSubgroupAVCSicResult
   | CXType_OCLIntelSubgroupAVCRefResult
   | CXType_OCLIntelSubgroupAVCImeResult
   | CXType_OCLIntelSubgroupAVCMceResult
   | CXType_OCLIntelSubgroupAVCSicPayload
   | CXType_OCLIntelSubgroupAVCRefPayload
   | CXType_OCLIntelSubgroupAVCImePayload
   | CXType_OCLIntelSubgroupAVCMcePayload
   | CXType_Attributed
   | CXType_ObjCTypeParam
   | CXType_ObjCObject
   | CXType_OCLReserveID
   | CXType_OCLQueue
   | CXType_OCLEvent
   | CXType_OCLSampler
   | CXType_OCLImage3dRW
   | CXType_OCLImage2dArrayMSAADepthRW
   | CXType_OCLImage2dMSAADepthRW
   | CXType_OCLImage2dArrayMSAARW
   | CXType_OCLImage2dMSAARW
   | CXType_OCLImage2dArrayDepthRW
   | CXType_OCLImage2dDepthRW
   | CXType_OCLImage2dArrayRW
   | CXType_OCLImage2dRW
   | CXType_OCLImage1dBufferRW
   | CXType_OCLImage1dArrayRW
   | CXType_OCLImage1dRW
   | CXType_OCLImage3dWO
   | CXType_OCLImage2dArrayMSAADepthWO
   | CXType_OCLImage2dMSAADepthWO
   | CXType_OCLImage2dArrayMSAAWO
   | CXType_OCLImage2dMSAAWO
   | CXType_OCLImage2dArrayDepthWO
   | CXType_OCLImage2dDepthWO
   | CXType_OCLImage2dArrayWO
   | CXType_OCLImage2dWO
   | CXType_OCLImage1dBufferWO
   | CXType_OCLImage1dArrayWO
   | CXType_OCLImage1dWO
   | CXType_OCLImage3dRO
   | CXType_OCLImage2dArrayMSAADepthRO
   | CXType_OCLImage2dMSAADepthRO
   | CXType_OCLImage2dArrayMSAARO
   | CXType_OCLImage2dMSAARO
   | CXType_OCLImage2dArrayDepthRO
   | CXType_OCLImage2dDepthRO
   | CXType_OCLImage2dArrayRO
   | CXType_OCLImage2dRO
   | CXType_OCLImage1dBufferRO
   | CXType_OCLImage1dArrayRO
   | CXType_OCLImage1dRO
   | CXType_Pipe
   | CXType_Elaborated
   | CXType_Auto
   | CXType_MemberPointer
   | CXType_DependentSizedArray
   | CXType_VariableArray
   | CXType_IncompleteArray
   | CXType_Vector
   | CXType_ConstantArray
   | CXType_FunctionProto
   | CXType_FunctionNoProto
   | CXType_ObjCObjectPointer
   | CXType_ObjCInterface
   | CXType_Typedef
   | CXType_Enum
   | CXType_Record
   | CXType_RValueReference
   | CXType_LValueReference
   | CXType_BlockPointer
   | CXType_Pointer
   | CXType_Complex
   | CXType_LastBuiltin
   | CXType_FirstBuiltin
   | CXType_Ibm128
   | CXType_BFloat16
   | CXType_ULongAccum
   | CXType_UAccum
   | CXType_UShortAccum
   | CXType_LongAccum
   | CXType_Accum
   | CXType_ShortAccum
   | CXType_Float16
   | CXType_Half
   | CXType_Float128
   | CXType_ObjCSel
   | CXType_ObjCClass
   | CXType_ObjCId
   | CXType_Dependent
   | CXType_Overload
   | CXType_NullPtr
   | CXType_LongDouble
   | CXType_Double
   | CXType_Float
   | CXType_Int128
   | CXType_LongLong
   | CXType_Long
   | CXType_Int
   | CXType_Short
   | CXType_WChar
   | CXType_SChar
   | CXType_Char_S
   | CXType_UInt128
   | CXType_ULongLong
   | CXType_ULong
   | CXType_UInt
   | CXType_UShort
   | CXType_Char32
   | CXType_Char16
   | CXType_UChar
   | CXType_Char_U
   | CXType_Bool
   | CXType_Void
   | CXType_Unexposed
   | CXType_Invalid

%foreign (wrapper "toPrim_CXTypeKind")
toPrim_CXTypeKind : Int -> Prim_CXTypeKind

Cast CXTypeKind Prim_CXTypeKind where
   cast CXType_BTFTagAttributed = toPrim_CXTypeKind (178)
   cast CXType_Atomic = toPrim_CXTypeKind (177)
   cast CXType_ExtVector = toPrim_CXTypeKind (176)
   cast CXType_OCLIntelSubgroupAVCImeDualRefStreamin = toPrim_CXTypeKind (175)
   cast CXType_OCLIntelSubgroupAVCImeSingleRefStreamin = toPrim_CXTypeKind (174)
   cast CXType_OCLIntelSubgroupAVCImeResultDualRefStreamout = toPrim_CXTypeKind (173)
   cast CXType_OCLIntelSubgroupAVCImeResultSingleRefStreamout = toPrim_CXTypeKind (172)
   cast CXType_OCLIntelSubgroupAVCImeDualReferenceStreamin = toPrim_CXTypeKind (175)
   cast CXType_OCLIntelSubgroupAVCImeSingleReferenceStreamin = toPrim_CXTypeKind (174)
   cast CXType_OCLIntelSubgroupAVCImeResultDualReferenceStreamout = toPrim_CXTypeKind (173)
   cast CXType_OCLIntelSubgroupAVCImeResultSingleReferenceStreamout = toPrim_CXTypeKind (172)
   cast CXType_OCLIntelSubgroupAVCSicResult = toPrim_CXTypeKind (171)
   cast CXType_OCLIntelSubgroupAVCRefResult = toPrim_CXTypeKind (170)
   cast CXType_OCLIntelSubgroupAVCImeResult = toPrim_CXTypeKind (169)
   cast CXType_OCLIntelSubgroupAVCMceResult = toPrim_CXTypeKind (168)
   cast CXType_OCLIntelSubgroupAVCSicPayload = toPrim_CXTypeKind (167)
   cast CXType_OCLIntelSubgroupAVCRefPayload = toPrim_CXTypeKind (166)
   cast CXType_OCLIntelSubgroupAVCImePayload = toPrim_CXTypeKind (165)
   cast CXType_OCLIntelSubgroupAVCMcePayload = toPrim_CXTypeKind (164)
   cast CXType_Attributed = toPrim_CXTypeKind (163)
   cast CXType_ObjCTypeParam = toPrim_CXTypeKind (162)
   cast CXType_ObjCObject = toPrim_CXTypeKind (161)
   cast CXType_OCLReserveID = toPrim_CXTypeKind (160)
   cast CXType_OCLQueue = toPrim_CXTypeKind (159)
   cast CXType_OCLEvent = toPrim_CXTypeKind (158)
   cast CXType_OCLSampler = toPrim_CXTypeKind (157)
   cast CXType_OCLImage3dRW = toPrim_CXTypeKind (156)
   cast CXType_OCLImage2dArrayMSAADepthRW = toPrim_CXTypeKind (155)
   cast CXType_OCLImage2dMSAADepthRW = toPrim_CXTypeKind (154)
   cast CXType_OCLImage2dArrayMSAARW = toPrim_CXTypeKind (153)
   cast CXType_OCLImage2dMSAARW = toPrim_CXTypeKind (152)
   cast CXType_OCLImage2dArrayDepthRW = toPrim_CXTypeKind (151)
   cast CXType_OCLImage2dDepthRW = toPrim_CXTypeKind (150)
   cast CXType_OCLImage2dArrayRW = toPrim_CXTypeKind (149)
   cast CXType_OCLImage2dRW = toPrim_CXTypeKind (148)
   cast CXType_OCLImage1dBufferRW = toPrim_CXTypeKind (147)
   cast CXType_OCLImage1dArrayRW = toPrim_CXTypeKind (146)
   cast CXType_OCLImage1dRW = toPrim_CXTypeKind (145)
   cast CXType_OCLImage3dWO = toPrim_CXTypeKind (144)
   cast CXType_OCLImage2dArrayMSAADepthWO = toPrim_CXTypeKind (143)
   cast CXType_OCLImage2dMSAADepthWO = toPrim_CXTypeKind (142)
   cast CXType_OCLImage2dArrayMSAAWO = toPrim_CXTypeKind (141)
   cast CXType_OCLImage2dMSAAWO = toPrim_CXTypeKind (140)
   cast CXType_OCLImage2dArrayDepthWO = toPrim_CXTypeKind (139)
   cast CXType_OCLImage2dDepthWO = toPrim_CXTypeKind (138)
   cast CXType_OCLImage2dArrayWO = toPrim_CXTypeKind (137)
   cast CXType_OCLImage2dWO = toPrim_CXTypeKind (136)
   cast CXType_OCLImage1dBufferWO = toPrim_CXTypeKind (135)
   cast CXType_OCLImage1dArrayWO = toPrim_CXTypeKind (134)
   cast CXType_OCLImage1dWO = toPrim_CXTypeKind (133)
   cast CXType_OCLImage3dRO = toPrim_CXTypeKind (132)
   cast CXType_OCLImage2dArrayMSAADepthRO = toPrim_CXTypeKind (131)
   cast CXType_OCLImage2dMSAADepthRO = toPrim_CXTypeKind (130)
   cast CXType_OCLImage2dArrayMSAARO = toPrim_CXTypeKind (129)
   cast CXType_OCLImage2dMSAARO = toPrim_CXTypeKind (128)
   cast CXType_OCLImage2dArrayDepthRO = toPrim_CXTypeKind (127)
   cast CXType_OCLImage2dDepthRO = toPrim_CXTypeKind (126)
   cast CXType_OCLImage2dArrayRO = toPrim_CXTypeKind (125)
   cast CXType_OCLImage2dRO = toPrim_CXTypeKind (124)
   cast CXType_OCLImage1dBufferRO = toPrim_CXTypeKind (123)
   cast CXType_OCLImage1dArrayRO = toPrim_CXTypeKind (122)
   cast CXType_OCLImage1dRO = toPrim_CXTypeKind (121)
   cast CXType_Pipe = toPrim_CXTypeKind (120)
   cast CXType_Elaborated = toPrim_CXTypeKind (119)
   cast CXType_Auto = toPrim_CXTypeKind (118)
   cast CXType_MemberPointer = toPrim_CXTypeKind (117)
   cast CXType_DependentSizedArray = toPrim_CXTypeKind (116)
   cast CXType_VariableArray = toPrim_CXTypeKind (115)
   cast CXType_IncompleteArray = toPrim_CXTypeKind (114)
   cast CXType_Vector = toPrim_CXTypeKind (113)
   cast CXType_ConstantArray = toPrim_CXTypeKind (112)
   cast CXType_FunctionProto = toPrim_CXTypeKind (111)
   cast CXType_FunctionNoProto = toPrim_CXTypeKind (110)
   cast CXType_ObjCObjectPointer = toPrim_CXTypeKind (109)
   cast CXType_ObjCInterface = toPrim_CXTypeKind (108)
   cast CXType_Typedef = toPrim_CXTypeKind (107)
   cast CXType_Enum = toPrim_CXTypeKind (106)
   cast CXType_Record = toPrim_CXTypeKind (105)
   cast CXType_RValueReference = toPrim_CXTypeKind (104)
   cast CXType_LValueReference = toPrim_CXTypeKind (103)
   cast CXType_BlockPointer = toPrim_CXTypeKind (102)
   cast CXType_Pointer = toPrim_CXTypeKind (101)
   cast CXType_Complex = toPrim_CXTypeKind (100)
   cast CXType_LastBuiltin = toPrim_CXTypeKind (40)
   cast CXType_FirstBuiltin = toPrim_CXTypeKind (2)
   cast CXType_Ibm128 = toPrim_CXTypeKind (40)
   cast CXType_BFloat16 = toPrim_CXTypeKind (39)
   cast CXType_ULongAccum = toPrim_CXTypeKind (38)
   cast CXType_UAccum = toPrim_CXTypeKind (37)
   cast CXType_UShortAccum = toPrim_CXTypeKind (36)
   cast CXType_LongAccum = toPrim_CXTypeKind (35)
   cast CXType_Accum = toPrim_CXTypeKind (34)
   cast CXType_ShortAccum = toPrim_CXTypeKind (33)
   cast CXType_Float16 = toPrim_CXTypeKind (32)
   cast CXType_Half = toPrim_CXTypeKind (31)
   cast CXType_Float128 = toPrim_CXTypeKind (30)
   cast CXType_ObjCSel = toPrim_CXTypeKind (29)
   cast CXType_ObjCClass = toPrim_CXTypeKind (28)
   cast CXType_ObjCId = toPrim_CXTypeKind (27)
   cast CXType_Dependent = toPrim_CXTypeKind (26)
   cast CXType_Overload = toPrim_CXTypeKind (25)
   cast CXType_NullPtr = toPrim_CXTypeKind (24)
   cast CXType_LongDouble = toPrim_CXTypeKind (23)
   cast CXType_Double = toPrim_CXTypeKind (22)
   cast CXType_Float = toPrim_CXTypeKind (21)
   cast CXType_Int128 = toPrim_CXTypeKind (20)
   cast CXType_LongLong = toPrim_CXTypeKind (19)
   cast CXType_Long = toPrim_CXTypeKind (18)
   cast CXType_Int = toPrim_CXTypeKind (17)
   cast CXType_Short = toPrim_CXTypeKind (16)
   cast CXType_WChar = toPrim_CXTypeKind (15)
   cast CXType_SChar = toPrim_CXTypeKind (14)
   cast CXType_Char_S = toPrim_CXTypeKind (13)
   cast CXType_UInt128 = toPrim_CXTypeKind (12)
   cast CXType_ULongLong = toPrim_CXTypeKind (11)
   cast CXType_ULong = toPrim_CXTypeKind (10)
   cast CXType_UInt = toPrim_CXTypeKind (9)
   cast CXType_UShort = toPrim_CXTypeKind (8)
   cast CXType_Char32 = toPrim_CXTypeKind (7)
   cast CXType_Char16 = toPrim_CXTypeKind (6)
   cast CXType_UChar = toPrim_CXTypeKind (5)
   cast CXType_Char_U = toPrim_CXTypeKind (4)
   cast CXType_Bool = toPrim_CXTypeKind (3)
   cast CXType_Void = toPrim_CXTypeKind (2)
   cast CXType_Unexposed = toPrim_CXTypeKind (1)
   cast CXType_Invalid = toPrim_CXTypeKind (0)

%foreign (wrapper "fromPrim_CXTypeKind")
fromPrim_CXTypeKind : Prim_CXTypeKind -> Int

Cast Prim_CXTypeKind CXTypeKind where
   cast x = case (fromPrim_CXTypeKind x) of
      (178) => CXType_BTFTagAttributed
      (177) => CXType_Atomic
      (176) => CXType_ExtVector
      (175) => CXType_OCLIntelSubgroupAVCImeDualReferenceStreamin
      (174) => CXType_OCLIntelSubgroupAVCImeSingleReferenceStreamin
      (173) => CXType_OCLIntelSubgroupAVCImeResultDualReferenceStreamout
      (172) => CXType_OCLIntelSubgroupAVCImeResultSingleReferenceStreamout
      (171) => CXType_OCLIntelSubgroupAVCSicResult
      (170) => CXType_OCLIntelSubgroupAVCRefResult
      (169) => CXType_OCLIntelSubgroupAVCImeResult
      (168) => CXType_OCLIntelSubgroupAVCMceResult
      (167) => CXType_OCLIntelSubgroupAVCSicPayload
      (166) => CXType_OCLIntelSubgroupAVCRefPayload
      (165) => CXType_OCLIntelSubgroupAVCImePayload
      (164) => CXType_OCLIntelSubgroupAVCMcePayload
      (163) => CXType_Attributed
      (162) => CXType_ObjCTypeParam
      (161) => CXType_ObjCObject
      (160) => CXType_OCLReserveID
      (159) => CXType_OCLQueue
      (158) => CXType_OCLEvent
      (157) => CXType_OCLSampler
      (156) => CXType_OCLImage3dRW
      (155) => CXType_OCLImage2dArrayMSAADepthRW
      (154) => CXType_OCLImage2dMSAADepthRW
      (153) => CXType_OCLImage2dArrayMSAARW
      (152) => CXType_OCLImage2dMSAARW
      (151) => CXType_OCLImage2dArrayDepthRW
      (150) => CXType_OCLImage2dDepthRW
      (149) => CXType_OCLImage2dArrayRW
      (148) => CXType_OCLImage2dRW
      (147) => CXType_OCLImage1dBufferRW
      (146) => CXType_OCLImage1dArrayRW
      (145) => CXType_OCLImage1dRW
      (144) => CXType_OCLImage3dWO
      (143) => CXType_OCLImage2dArrayMSAADepthWO
      (142) => CXType_OCLImage2dMSAADepthWO
      (141) => CXType_OCLImage2dArrayMSAAWO
      (140) => CXType_OCLImage2dMSAAWO
      (139) => CXType_OCLImage2dArrayDepthWO
      (138) => CXType_OCLImage2dDepthWO
      (137) => CXType_OCLImage2dArrayWO
      (136) => CXType_OCLImage2dWO
      (135) => CXType_OCLImage1dBufferWO
      (134) => CXType_OCLImage1dArrayWO
      (133) => CXType_OCLImage1dWO
      (132) => CXType_OCLImage3dRO
      (131) => CXType_OCLImage2dArrayMSAADepthRO
      (130) => CXType_OCLImage2dMSAADepthRO
      (129) => CXType_OCLImage2dArrayMSAARO
      (128) => CXType_OCLImage2dMSAARO
      (127) => CXType_OCLImage2dArrayDepthRO
      (126) => CXType_OCLImage2dDepthRO
      (125) => CXType_OCLImage2dArrayRO
      (124) => CXType_OCLImage2dRO
      (123) => CXType_OCLImage1dBufferRO
      (122) => CXType_OCLImage1dArrayRO
      (121) => CXType_OCLImage1dRO
      (120) => CXType_Pipe
      (119) => CXType_Elaborated
      (118) => CXType_Auto
      (117) => CXType_MemberPointer
      (116) => CXType_DependentSizedArray
      (115) => CXType_VariableArray
      (114) => CXType_IncompleteArray
      (113) => CXType_Vector
      (112) => CXType_ConstantArray
      (111) => CXType_FunctionProto
      (110) => CXType_FunctionNoProto
      (109) => CXType_ObjCObjectPointer
      (108) => CXType_ObjCInterface
      (107) => CXType_Typedef
      (106) => CXType_Enum
      (105) => CXType_Record
      (104) => CXType_RValueReference
      (103) => CXType_LValueReference
      (102) => CXType_BlockPointer
      (101) => CXType_Pointer
      (100) => CXType_Complex
      (40) => CXType_Ibm128
      (39) => CXType_BFloat16
      (38) => CXType_ULongAccum
      (37) => CXType_UAccum
      (36) => CXType_UShortAccum
      (35) => CXType_LongAccum
      (34) => CXType_Accum
      (33) => CXType_ShortAccum
      (32) => CXType_Float16
      (31) => CXType_Half
      (30) => CXType_Float128
      (29) => CXType_ObjCSel
      (28) => CXType_ObjCClass
      (27) => CXType_ObjCId
      (26) => CXType_Dependent
      (25) => CXType_Overload
      (24) => CXType_NullPtr
      (23) => CXType_LongDouble
      (22) => CXType_Double
      (21) => CXType_Float
      (20) => CXType_Int128
      (19) => CXType_LongLong
      (18) => CXType_Long
      (17) => CXType_Int
      (16) => CXType_Short
      (15) => CXType_WChar
      (14) => CXType_SChar
      (13) => CXType_Char_S
      (12) => CXType_UInt128
      (11) => CXType_ULongLong
      (10) => CXType_ULong
      (9) => CXType_UInt
      (8) => CXType_UShort
      (7) => CXType_Char32
      (6) => CXType_Char16
      (5) => CXType_UChar
      (4) => CXType_Char_U
      (3) => CXType_Bool
      (2) => CXType_Void
      (1) => CXType_Unexposed
      (0) => CXType_Invalid
      _ => assert_total $ idris_crash "Invalid cast from Prim_CXTypeKind to CXTypeKind"

Prim_CXCallingConv : Type
Prim_CXCallingConv = Int

data CXCallingConv
   = CXCallingConv_Unexposed
   | CXCallingConv_Invalid
   | CXCallingConv_AArch64SVEPCS
   | CXCallingConv_SwiftAsync
   | CXCallingConv_AArch64VectorCall
   | CXCallingConv_PreserveAll
   | CXCallingConv_PreserveMost
   | CXCallingConv_Swift
   | CXCallingConv_X86VectorCall
   | CXCallingConv_X86_64SysV
   | CXCallingConv_X86_64Win64
   | CXCallingConv_Win64
   | CXCallingConv_IntelOclBicc
   | CXCallingConv_X86RegCall
   | CXCallingConv_AAPCS_VFP
   | CXCallingConv_AAPCS
   | CXCallingConv_X86Pascal
   | CXCallingConv_X86ThisCall
   | CXCallingConv_X86FastCall
   | CXCallingConv_X86StdCall
   | CXCallingConv_C
   | CXCallingConv_Default

%foreign (wrapper "toPrim_CXCallingConv")
toPrim_CXCallingConv : Int -> Prim_CXCallingConv

Cast CXCallingConv Prim_CXCallingConv where
   cast CXCallingConv_Unexposed = toPrim_CXCallingConv (200)
   cast CXCallingConv_Invalid = toPrim_CXCallingConv (100)
   cast CXCallingConv_AArch64SVEPCS = toPrim_CXCallingConv (18)
   cast CXCallingConv_SwiftAsync = toPrim_CXCallingConv (17)
   cast CXCallingConv_AArch64VectorCall = toPrim_CXCallingConv (16)
   cast CXCallingConv_PreserveAll = toPrim_CXCallingConv (15)
   cast CXCallingConv_PreserveMost = toPrim_CXCallingConv (14)
   cast CXCallingConv_Swift = toPrim_CXCallingConv (13)
   cast CXCallingConv_X86VectorCall = toPrim_CXCallingConv (12)
   cast CXCallingConv_X86_64SysV = toPrim_CXCallingConv (11)
   cast CXCallingConv_X86_64Win64 = toPrim_CXCallingConv (10)
   cast CXCallingConv_Win64 = toPrim_CXCallingConv (10)
   cast CXCallingConv_IntelOclBicc = toPrim_CXCallingConv (9)
   cast CXCallingConv_X86RegCall = toPrim_CXCallingConv (8)
   cast CXCallingConv_AAPCS_VFP = toPrim_CXCallingConv (7)
   cast CXCallingConv_AAPCS = toPrim_CXCallingConv (6)
   cast CXCallingConv_X86Pascal = toPrim_CXCallingConv (5)
   cast CXCallingConv_X86ThisCall = toPrim_CXCallingConv (4)
   cast CXCallingConv_X86FastCall = toPrim_CXCallingConv (3)
   cast CXCallingConv_X86StdCall = toPrim_CXCallingConv (2)
   cast CXCallingConv_C = toPrim_CXCallingConv (1)
   cast CXCallingConv_Default = toPrim_CXCallingConv (0)

%foreign (wrapper "fromPrim_CXCallingConv")
fromPrim_CXCallingConv : Prim_CXCallingConv -> Int

Cast Prim_CXCallingConv CXCallingConv where
   cast x = case (fromPrim_CXCallingConv x) of
      (200) => CXCallingConv_Unexposed
      (100) => CXCallingConv_Invalid
      (18) => CXCallingConv_AArch64SVEPCS
      (17) => CXCallingConv_SwiftAsync
      (16) => CXCallingConv_AArch64VectorCall
      (15) => CXCallingConv_PreserveAll
      (14) => CXCallingConv_PreserveMost
      (13) => CXCallingConv_Swift
      (12) => CXCallingConv_X86VectorCall
      (11) => CXCallingConv_X86_64SysV
      (10) => CXCallingConv_Win64
      (9) => CXCallingConv_IntelOclBicc
      (8) => CXCallingConv_X86RegCall
      (7) => CXCallingConv_AAPCS_VFP
      (6) => CXCallingConv_AAPCS
      (5) => CXCallingConv_X86Pascal
      (4) => CXCallingConv_X86ThisCall
      (3) => CXCallingConv_X86FastCall
      (2) => CXCallingConv_X86StdCall
      (1) => CXCallingConv_C
      (0) => CXCallingConv_Default
      _ => assert_total $ idris_crash "Invalid cast from Prim_CXCallingConv to CXCallingConv"

Prim_CXTemplateArgumentKind : Type
Prim_CXTemplateArgumentKind = Int

data CXTemplateArgumentKind
   = CXTemplateArgumentKind_Invalid
   | CXTemplateArgumentKind_Pack
   | CXTemplateArgumentKind_Expression
   | CXTemplateArgumentKind_TemplateExpansion
   | CXTemplateArgumentKind_Template
   | CXTemplateArgumentKind_Integral
   | CXTemplateArgumentKind_NullPtr
   | CXTemplateArgumentKind_Declaration
   | CXTemplateArgumentKind_Type
   | CXTemplateArgumentKind_Null

%foreign (wrapper "toPrim_CXTemplateArgumentKind")
toPrim_CXTemplateArgumentKind : Int -> Prim_CXTemplateArgumentKind

Cast CXTemplateArgumentKind Prim_CXTemplateArgumentKind where
   cast CXTemplateArgumentKind_Invalid = toPrim_CXTemplateArgumentKind (9)
   cast CXTemplateArgumentKind_Pack = toPrim_CXTemplateArgumentKind (8)
   cast CXTemplateArgumentKind_Expression = toPrim_CXTemplateArgumentKind (7)
   cast CXTemplateArgumentKind_TemplateExpansion = toPrim_CXTemplateArgumentKind (6)
   cast CXTemplateArgumentKind_Template = toPrim_CXTemplateArgumentKind (5)
   cast CXTemplateArgumentKind_Integral = toPrim_CXTemplateArgumentKind (4)
   cast CXTemplateArgumentKind_NullPtr = toPrim_CXTemplateArgumentKind (3)
   cast CXTemplateArgumentKind_Declaration = toPrim_CXTemplateArgumentKind (2)
   cast CXTemplateArgumentKind_Type = toPrim_CXTemplateArgumentKind (1)
   cast CXTemplateArgumentKind_Null = toPrim_CXTemplateArgumentKind (0)

%foreign (wrapper "fromPrim_CXTemplateArgumentKind")
fromPrim_CXTemplateArgumentKind : Prim_CXTemplateArgumentKind -> Int

Cast Prim_CXTemplateArgumentKind CXTemplateArgumentKind where
   cast x = case (fromPrim_CXTemplateArgumentKind x) of
      (9) => CXTemplateArgumentKind_Invalid
      (8) => CXTemplateArgumentKind_Pack
      (7) => CXTemplateArgumentKind_Expression
      (6) => CXTemplateArgumentKind_TemplateExpansion
      (5) => CXTemplateArgumentKind_Template
      (4) => CXTemplateArgumentKind_Integral
      (3) => CXTemplateArgumentKind_NullPtr
      (2) => CXTemplateArgumentKind_Declaration
      (1) => CXTemplateArgumentKind_Type
      (0) => CXTemplateArgumentKind_Null
      _ => assert_total $ idris_crash "Invalid cast from Prim_CXTemplateArgumentKind to CXTemplateArgumentKind"

Prim_CXTypeNullabilityKind : Type
Prim_CXTypeNullabilityKind = Int

data CXTypeNullabilityKind
   = CXTypeNullability_NullableResult
   | CXTypeNullability_Invalid
   | CXTypeNullability_Unspecified
   | CXTypeNullability_Nullable
   | CXTypeNullability_NonNull

%foreign (wrapper "toPrim_CXTypeNullabilityKind")
toPrim_CXTypeNullabilityKind : Int -> Prim_CXTypeNullabilityKind

Cast CXTypeNullabilityKind Prim_CXTypeNullabilityKind where
   cast CXTypeNullability_NullableResult = toPrim_CXTypeNullabilityKind (4)
   cast CXTypeNullability_Invalid = toPrim_CXTypeNullabilityKind (3)
   cast CXTypeNullability_Unspecified = toPrim_CXTypeNullabilityKind (2)
   cast CXTypeNullability_Nullable = toPrim_CXTypeNullabilityKind (1)
   cast CXTypeNullability_NonNull = toPrim_CXTypeNullabilityKind (0)

%foreign (wrapper "fromPrim_CXTypeNullabilityKind")
fromPrim_CXTypeNullabilityKind : Prim_CXTypeNullabilityKind -> Int

Cast Prim_CXTypeNullabilityKind CXTypeNullabilityKind where
   cast x = case (fromPrim_CXTypeNullabilityKind x) of
      (4) => CXTypeNullability_NullableResult
      (3) => CXTypeNullability_Invalid
      (2) => CXTypeNullability_Unspecified
      (1) => CXTypeNullability_Nullable
      (0) => CXTypeNullability_NonNull
      _ => assert_total $ idris_crash "Invalid cast from Prim_CXTypeNullabilityKind to CXTypeNullabilityKind"

Prim_CXTypeLayoutError : Type
Prim_CXTypeLayoutError = Int

data CXTypeLayoutError
   = CXTypeLayoutError_Undeduced
   | CXTypeLayoutError_InvalidFieldName
   | CXTypeLayoutError_NotConstantSize
   | CXTypeLayoutError_Dependent
   | CXTypeLayoutError_Incomplete
   | CXTypeLayoutError_Invalid

%foreign (wrapper "toPrim_CXTypeLayoutError")
toPrim_CXTypeLayoutError : Int -> Prim_CXTypeLayoutError

Cast CXTypeLayoutError Prim_CXTypeLayoutError where
   cast CXTypeLayoutError_Undeduced = toPrim_CXTypeLayoutError (-6)
   cast CXTypeLayoutError_InvalidFieldName = toPrim_CXTypeLayoutError (-5)
   cast CXTypeLayoutError_NotConstantSize = toPrim_CXTypeLayoutError (-4)
   cast CXTypeLayoutError_Dependent = toPrim_CXTypeLayoutError (-3)
   cast CXTypeLayoutError_Incomplete = toPrim_CXTypeLayoutError (-2)
   cast CXTypeLayoutError_Invalid = toPrim_CXTypeLayoutError (-1)

%foreign (wrapper "fromPrim_CXTypeLayoutError")
fromPrim_CXTypeLayoutError : Prim_CXTypeLayoutError -> Int

Cast Prim_CXTypeLayoutError CXTypeLayoutError where
   cast x = case (fromPrim_CXTypeLayoutError x) of
      (-6) => CXTypeLayoutError_Undeduced
      (-5) => CXTypeLayoutError_InvalidFieldName
      (-4) => CXTypeLayoutError_NotConstantSize
      (-3) => CXTypeLayoutError_Dependent
      (-2) => CXTypeLayoutError_Incomplete
      (-1) => CXTypeLayoutError_Invalid
      _ => assert_total $ idris_crash "Invalid cast from Prim_CXTypeLayoutError to CXTypeLayoutError"

Prim_CXRefQualifierKind : Type
Prim_CXRefQualifierKind = Int

data CXRefQualifierKind
   = CXRefQualifier_RValue
   | CXRefQualifier_LValue
   | CXRefQualifier_None

%foreign (wrapper "toPrim_CXRefQualifierKind")
toPrim_CXRefQualifierKind : Int -> Prim_CXRefQualifierKind

Cast CXRefQualifierKind Prim_CXRefQualifierKind where
   cast CXRefQualifier_RValue = toPrim_CXRefQualifierKind (2)
   cast CXRefQualifier_LValue = toPrim_CXRefQualifierKind (1)
   cast CXRefQualifier_None = toPrim_CXRefQualifierKind (0)

%foreign (wrapper "fromPrim_CXRefQualifierKind")
fromPrim_CXRefQualifierKind : Prim_CXRefQualifierKind -> Int

Cast Prim_CXRefQualifierKind CXRefQualifierKind where
   cast x = case (fromPrim_CXRefQualifierKind x) of
      (2) => CXRefQualifier_RValue
      (1) => CXRefQualifier_LValue
      (0) => CXRefQualifier_None
      _ => assert_total $ idris_crash "Invalid cast from Prim_CXRefQualifierKind to CXRefQualifierKind"

Prim_CX_CXXAccessSpecifier : Type
Prim_CX_CXXAccessSpecifier = Int

data CX_CXXAccessSpecifier
   = CX_CXXPrivate
   | CX_CXXProtected
   | CX_CXXPublic
   | CX_CXXInvalidAccessSpecifier

%foreign (wrapper "toPrim_CX_CXXAccessSpecifier")
toPrim_CX_CXXAccessSpecifier : Int -> Prim_CX_CXXAccessSpecifier

Cast CX_CXXAccessSpecifier Prim_CX_CXXAccessSpecifier where
   cast CX_CXXPrivate = toPrim_CX_CXXAccessSpecifier (3)
   cast CX_CXXProtected = toPrim_CX_CXXAccessSpecifier (2)
   cast CX_CXXPublic = toPrim_CX_CXXAccessSpecifier (1)
   cast CX_CXXInvalidAccessSpecifier = toPrim_CX_CXXAccessSpecifier (0)

%foreign (wrapper "fromPrim_CX_CXXAccessSpecifier")
fromPrim_CX_CXXAccessSpecifier : Prim_CX_CXXAccessSpecifier -> Int

Cast Prim_CX_CXXAccessSpecifier CX_CXXAccessSpecifier where
   cast x = case (fromPrim_CX_CXXAccessSpecifier x) of
      (3) => CX_CXXPrivate
      (2) => CX_CXXProtected
      (1) => CX_CXXPublic
      (0) => CX_CXXInvalidAccessSpecifier
      _ => assert_total $ idris_crash "Invalid cast from Prim_CX_CXXAccessSpecifier to CX_CXXAccessSpecifier"

Prim_CX_StorageClass : Type
Prim_CX_StorageClass = Int

data CX_StorageClass
   = CX_SC_Register
   | CX_SC_Auto
   | CX_SC_OpenCLWorkGroupLocal
   | CX_SC_PrivateExtern
   | CX_SC_Static
   | CX_SC_Extern
   | CX_SC_None
   | CX_SC_Invalid

%foreign (wrapper "toPrim_CX_StorageClass")
toPrim_CX_StorageClass : Int -> Prim_CX_StorageClass

Cast CX_StorageClass Prim_CX_StorageClass where
   cast CX_SC_Register = toPrim_CX_StorageClass (7)
   cast CX_SC_Auto = toPrim_CX_StorageClass (6)
   cast CX_SC_OpenCLWorkGroupLocal = toPrim_CX_StorageClass (5)
   cast CX_SC_PrivateExtern = toPrim_CX_StorageClass (4)
   cast CX_SC_Static = toPrim_CX_StorageClass (3)
   cast CX_SC_Extern = toPrim_CX_StorageClass (2)
   cast CX_SC_None = toPrim_CX_StorageClass (1)
   cast CX_SC_Invalid = toPrim_CX_StorageClass (0)

%foreign (wrapper "fromPrim_CX_StorageClass")
fromPrim_CX_StorageClass : Prim_CX_StorageClass -> Int

Cast Prim_CX_StorageClass CX_StorageClass where
   cast x = case (fromPrim_CX_StorageClass x) of
      (7) => CX_SC_Register
      (6) => CX_SC_Auto
      (5) => CX_SC_OpenCLWorkGroupLocal
      (4) => CX_SC_PrivateExtern
      (3) => CX_SC_Static
      (2) => CX_SC_Extern
      (1) => CX_SC_None
      (0) => CX_SC_Invalid
      _ => assert_total $ idris_crash "Invalid cast from Prim_CX_StorageClass to CX_StorageClass"

Prim_CXChildVisitResult : Type
Prim_CXChildVisitResult = Int

data CXChildVisitResult
   = CXChildVisit_Recurse
   | CXChildVisit_Continue
   | CXChildVisit_Break

%foreign (wrapper "toPrim_CXChildVisitResult")
toPrim_CXChildVisitResult : Int -> Prim_CXChildVisitResult

Cast CXChildVisitResult Prim_CXChildVisitResult where
   cast CXChildVisit_Recurse = toPrim_CXChildVisitResult (2)
   cast CXChildVisit_Continue = toPrim_CXChildVisitResult (1)
   cast CXChildVisit_Break = toPrim_CXChildVisitResult (0)

%foreign (wrapper "fromPrim_CXChildVisitResult")
fromPrim_CXChildVisitResult : Prim_CXChildVisitResult -> Int

Cast Prim_CXChildVisitResult CXChildVisitResult where
   cast x = case (fromPrim_CXChildVisitResult x) of
      (2) => CXChildVisit_Recurse
      (1) => CXChildVisit_Continue
      (0) => CXChildVisit_Break
      _ => assert_total $ idris_crash "Invalid cast from Prim_CXChildVisitResult to CXChildVisitResult"

Prim_CXPrintingPolicyProperty : Type
Prim_CXPrintingPolicyProperty = Int

data CXPrintingPolicyProperty
   = CXPrintingPolicy_LastProperty
   | CXPrintingPolicy_FullyQualifiedName
   | CXPrintingPolicy_SuppressImplicitBase
   | CXPrintingPolicy_ConstantsAsWritten
   | CXPrintingPolicy_MSVCFormatting
   | CXPrintingPolicy_IncludeNewlines
   | CXPrintingPolicy_MSWChar
   | CXPrintingPolicy_Half
   | CXPrintingPolicy_PolishForDeclaration
   | CXPrintingPolicy_TerseOutput
   | CXPrintingPolicy_UseVoidForZeroParams
   | CXPrintingPolicy_UnderscoreAlignof
   | CXPrintingPolicy_Alignof
   | CXPrintingPolicy_Restrict
   | CXPrintingPolicy_Bool
   | CXPrintingPolicy_SuppressTemplateArgsInCXXConstructors
   | CXPrintingPolicy_SuppressLifetimeQualifiers
   | CXPrintingPolicy_SuppressStrongLifetime
   | CXPrintingPolicy_AnonymousTagLocations
   | CXPrintingPolicy_ConstantArraySizeAsWritten
   | CXPrintingPolicy_SuppressInitializers
   | CXPrintingPolicy_SuppressUnwrittenScope
   | CXPrintingPolicy_SuppressScope
   | CXPrintingPolicy_IncludeTagDefinition
   | CXPrintingPolicy_SuppressTagKeyword
   | CXPrintingPolicy_SuppressSpecifiers
   | CXPrintingPolicy_Indentation

%foreign (wrapper "toPrim_CXPrintingPolicyProperty")
toPrim_CXPrintingPolicyProperty : Int -> Prim_CXPrintingPolicyProperty

Cast CXPrintingPolicyProperty Prim_CXPrintingPolicyProperty where
   cast CXPrintingPolicy_LastProperty = toPrim_CXPrintingPolicyProperty (25)
   cast CXPrintingPolicy_FullyQualifiedName = toPrim_CXPrintingPolicyProperty (25)
   cast CXPrintingPolicy_SuppressImplicitBase = toPrim_CXPrintingPolicyProperty (24)
   cast CXPrintingPolicy_ConstantsAsWritten = toPrim_CXPrintingPolicyProperty (23)
   cast CXPrintingPolicy_MSVCFormatting = toPrim_CXPrintingPolicyProperty (22)
   cast CXPrintingPolicy_IncludeNewlines = toPrim_CXPrintingPolicyProperty (21)
   cast CXPrintingPolicy_MSWChar = toPrim_CXPrintingPolicyProperty (20)
   cast CXPrintingPolicy_Half = toPrim_CXPrintingPolicyProperty (19)
   cast CXPrintingPolicy_PolishForDeclaration = toPrim_CXPrintingPolicyProperty (18)
   cast CXPrintingPolicy_TerseOutput = toPrim_CXPrintingPolicyProperty (17)
   cast CXPrintingPolicy_UseVoidForZeroParams = toPrim_CXPrintingPolicyProperty (16)
   cast CXPrintingPolicy_UnderscoreAlignof = toPrim_CXPrintingPolicyProperty (15)
   cast CXPrintingPolicy_Alignof = toPrim_CXPrintingPolicyProperty (14)
   cast CXPrintingPolicy_Restrict = toPrim_CXPrintingPolicyProperty (13)
   cast CXPrintingPolicy_Bool = toPrim_CXPrintingPolicyProperty (12)
   cast CXPrintingPolicy_SuppressTemplateArgsInCXXConstructors = toPrim_CXPrintingPolicyProperty (11)
   cast CXPrintingPolicy_SuppressLifetimeQualifiers = toPrim_CXPrintingPolicyProperty (10)
   cast CXPrintingPolicy_SuppressStrongLifetime = toPrim_CXPrintingPolicyProperty (9)
   cast CXPrintingPolicy_AnonymousTagLocations = toPrim_CXPrintingPolicyProperty (8)
   cast CXPrintingPolicy_ConstantArraySizeAsWritten = toPrim_CXPrintingPolicyProperty (7)
   cast CXPrintingPolicy_SuppressInitializers = toPrim_CXPrintingPolicyProperty (6)
   cast CXPrintingPolicy_SuppressUnwrittenScope = toPrim_CXPrintingPolicyProperty (5)
   cast CXPrintingPolicy_SuppressScope = toPrim_CXPrintingPolicyProperty (4)
   cast CXPrintingPolicy_IncludeTagDefinition = toPrim_CXPrintingPolicyProperty (3)
   cast CXPrintingPolicy_SuppressTagKeyword = toPrim_CXPrintingPolicyProperty (2)
   cast CXPrintingPolicy_SuppressSpecifiers = toPrim_CXPrintingPolicyProperty (1)
   cast CXPrintingPolicy_Indentation = toPrim_CXPrintingPolicyProperty (0)

%foreign (wrapper "fromPrim_CXPrintingPolicyProperty")
fromPrim_CXPrintingPolicyProperty : Prim_CXPrintingPolicyProperty -> Int

Cast Prim_CXPrintingPolicyProperty CXPrintingPolicyProperty where
   cast x = case (fromPrim_CXPrintingPolicyProperty x) of
      (25) => CXPrintingPolicy_FullyQualifiedName
      (24) => CXPrintingPolicy_SuppressImplicitBase
      (23) => CXPrintingPolicy_ConstantsAsWritten
      (22) => CXPrintingPolicy_MSVCFormatting
      (21) => CXPrintingPolicy_IncludeNewlines
      (20) => CXPrintingPolicy_MSWChar
      (19) => CXPrintingPolicy_Half
      (18) => CXPrintingPolicy_PolishForDeclaration
      (17) => CXPrintingPolicy_TerseOutput
      (16) => CXPrintingPolicy_UseVoidForZeroParams
      (15) => CXPrintingPolicy_UnderscoreAlignof
      (14) => CXPrintingPolicy_Alignof
      (13) => CXPrintingPolicy_Restrict
      (12) => CXPrintingPolicy_Bool
      (11) => CXPrintingPolicy_SuppressTemplateArgsInCXXConstructors
      (10) => CXPrintingPolicy_SuppressLifetimeQualifiers
      (9) => CXPrintingPolicy_SuppressStrongLifetime
      (8) => CXPrintingPolicy_AnonymousTagLocations
      (7) => CXPrintingPolicy_ConstantArraySizeAsWritten
      (6) => CXPrintingPolicy_SuppressInitializers
      (5) => CXPrintingPolicy_SuppressUnwrittenScope
      (4) => CXPrintingPolicy_SuppressScope
      (3) => CXPrintingPolicy_IncludeTagDefinition
      (2) => CXPrintingPolicy_SuppressTagKeyword
      (1) => CXPrintingPolicy_SuppressSpecifiers
      (0) => CXPrintingPolicy_Indentation
      _ => assert_total $ idris_crash "Invalid cast from Prim_CXPrintingPolicyProperty to CXPrintingPolicyProperty"

Prim_CXObjCPropertyAttrKind : Type
Prim_CXObjCPropertyAttrKind = Int

data CXObjCPropertyAttrKind
   = CXObjCPropertyAttr_class
   | CXObjCPropertyAttr_unsafe_unretained
   | CXObjCPropertyAttr_strong
   | CXObjCPropertyAttr_weak
   | CXObjCPropertyAttr_atomic
   | CXObjCPropertyAttr_setter
   | CXObjCPropertyAttr_nonatomic
   | CXObjCPropertyAttr_copy
   | CXObjCPropertyAttr_retain
   | CXObjCPropertyAttr_readwrite
   | CXObjCPropertyAttr_assign
   | CXObjCPropertyAttr_getter
   | CXObjCPropertyAttr_readonly
   | CXObjCPropertyAttr_noattr

%foreign (wrapper "toPrim_CXObjCPropertyAttrKind")
toPrim_CXObjCPropertyAttrKind : Int -> Prim_CXObjCPropertyAttrKind

Cast CXObjCPropertyAttrKind Prim_CXObjCPropertyAttrKind where
   cast CXObjCPropertyAttr_class = toPrim_CXObjCPropertyAttrKind (4096)
   cast CXObjCPropertyAttr_unsafe_unretained = toPrim_CXObjCPropertyAttrKind (2048)
   cast CXObjCPropertyAttr_strong = toPrim_CXObjCPropertyAttrKind (1024)
   cast CXObjCPropertyAttr_weak = toPrim_CXObjCPropertyAttrKind (512)
   cast CXObjCPropertyAttr_atomic = toPrim_CXObjCPropertyAttrKind (256)
   cast CXObjCPropertyAttr_setter = toPrim_CXObjCPropertyAttrKind (128)
   cast CXObjCPropertyAttr_nonatomic = toPrim_CXObjCPropertyAttrKind (64)
   cast CXObjCPropertyAttr_copy = toPrim_CXObjCPropertyAttrKind (32)
   cast CXObjCPropertyAttr_retain = toPrim_CXObjCPropertyAttrKind (16)
   cast CXObjCPropertyAttr_readwrite = toPrim_CXObjCPropertyAttrKind (8)
   cast CXObjCPropertyAttr_assign = toPrim_CXObjCPropertyAttrKind (4)
   cast CXObjCPropertyAttr_getter = toPrim_CXObjCPropertyAttrKind (2)
   cast CXObjCPropertyAttr_readonly = toPrim_CXObjCPropertyAttrKind (1)
   cast CXObjCPropertyAttr_noattr = toPrim_CXObjCPropertyAttrKind (0)

%foreign (wrapper "fromPrim_CXObjCPropertyAttrKind")
fromPrim_CXObjCPropertyAttrKind : Prim_CXObjCPropertyAttrKind -> Int

Cast Prim_CXObjCPropertyAttrKind CXObjCPropertyAttrKind where
   cast x = case (fromPrim_CXObjCPropertyAttrKind x) of
      (4096) => CXObjCPropertyAttr_class
      (2048) => CXObjCPropertyAttr_unsafe_unretained
      (1024) => CXObjCPropertyAttr_strong
      (512) => CXObjCPropertyAttr_weak
      (256) => CXObjCPropertyAttr_atomic
      (128) => CXObjCPropertyAttr_setter
      (64) => CXObjCPropertyAttr_nonatomic
      (32) => CXObjCPropertyAttr_copy
      (16) => CXObjCPropertyAttr_retain
      (8) => CXObjCPropertyAttr_readwrite
      (4) => CXObjCPropertyAttr_assign
      (2) => CXObjCPropertyAttr_getter
      (1) => CXObjCPropertyAttr_readonly
      (0) => CXObjCPropertyAttr_noattr
      _ => assert_total $ idris_crash "Invalid cast from Prim_CXObjCPropertyAttrKind to CXObjCPropertyAttrKind"

Prim_CXObjCDeclQualifierKind : Type
Prim_CXObjCDeclQualifierKind = Int

data CXObjCDeclQualifierKind
   = CXObjCDeclQualifier_Oneway
   | CXObjCDeclQualifier_Byref
   | CXObjCDeclQualifier_Bycopy
   | CXObjCDeclQualifier_Out
   | CXObjCDeclQualifier_Inout
   | CXObjCDeclQualifier_In
   | CXObjCDeclQualifier_None

%foreign (wrapper "toPrim_CXObjCDeclQualifierKind")
toPrim_CXObjCDeclQualifierKind : Int -> Prim_CXObjCDeclQualifierKind

Cast CXObjCDeclQualifierKind Prim_CXObjCDeclQualifierKind where
   cast CXObjCDeclQualifier_Oneway = toPrim_CXObjCDeclQualifierKind (32)
   cast CXObjCDeclQualifier_Byref = toPrim_CXObjCDeclQualifierKind (16)
   cast CXObjCDeclQualifier_Bycopy = toPrim_CXObjCDeclQualifierKind (8)
   cast CXObjCDeclQualifier_Out = toPrim_CXObjCDeclQualifierKind (4)
   cast CXObjCDeclQualifier_Inout = toPrim_CXObjCDeclQualifierKind (2)
   cast CXObjCDeclQualifier_In = toPrim_CXObjCDeclQualifierKind (1)
   cast CXObjCDeclQualifier_None = toPrim_CXObjCDeclQualifierKind (0)

%foreign (wrapper "fromPrim_CXObjCDeclQualifierKind")
fromPrim_CXObjCDeclQualifierKind : Prim_CXObjCDeclQualifierKind -> Int

Cast Prim_CXObjCDeclQualifierKind CXObjCDeclQualifierKind where
   cast x = case (fromPrim_CXObjCDeclQualifierKind x) of
      (32) => CXObjCDeclQualifier_Oneway
      (16) => CXObjCDeclQualifier_Byref
      (8) => CXObjCDeclQualifier_Bycopy
      (4) => CXObjCDeclQualifier_Out
      (2) => CXObjCDeclQualifier_Inout
      (1) => CXObjCDeclQualifier_In
      (0) => CXObjCDeclQualifier_None
      _ => assert_total $ idris_crash "Invalid cast from Prim_CXObjCDeclQualifierKind to CXObjCDeclQualifierKind"

Prim_CXNameRefFlags : Type
Prim_CXNameRefFlags = Int

data CXNameRefFlags
   = CXNameRange_WantSinglePiece
   | CXNameRange_WantTemplateArgs
   | CXNameRange_WantQualifier

%foreign (wrapper "toPrim_CXNameRefFlags")
toPrim_CXNameRefFlags : Int -> Prim_CXNameRefFlags

Cast CXNameRefFlags Prim_CXNameRefFlags where
   cast CXNameRange_WantSinglePiece = toPrim_CXNameRefFlags (4)
   cast CXNameRange_WantTemplateArgs = toPrim_CXNameRefFlags (2)
   cast CXNameRange_WantQualifier = toPrim_CXNameRefFlags (1)

%foreign (wrapper "fromPrim_CXNameRefFlags")
fromPrim_CXNameRefFlags : Prim_CXNameRefFlags -> Int

Cast Prim_CXNameRefFlags CXNameRefFlags where
   cast x = case (fromPrim_CXNameRefFlags x) of
      (4) => CXNameRange_WantSinglePiece
      (2) => CXNameRange_WantTemplateArgs
      (1) => CXNameRange_WantQualifier
      _ => assert_total $ idris_crash "Invalid cast from Prim_CXNameRefFlags to CXNameRefFlags"

Prim_CXTokenKind : Type
Prim_CXTokenKind = Int

data CXTokenKind
   = CXToken_Comment
   | CXToken_Literal
   | CXToken_Identifier
   | CXToken_Keyword
   | CXToken_Punctuation

%foreign (wrapper "toPrim_CXTokenKind")
toPrim_CXTokenKind : Int -> Prim_CXTokenKind

Cast CXTokenKind Prim_CXTokenKind where
   cast CXToken_Comment = toPrim_CXTokenKind (4)
   cast CXToken_Literal = toPrim_CXTokenKind (3)
   cast CXToken_Identifier = toPrim_CXTokenKind (2)
   cast CXToken_Keyword = toPrim_CXTokenKind (1)
   cast CXToken_Punctuation = toPrim_CXTokenKind (0)

%foreign (wrapper "fromPrim_CXTokenKind")
fromPrim_CXTokenKind : Prim_CXTokenKind -> Int

Cast Prim_CXTokenKind CXTokenKind where
   cast x = case (fromPrim_CXTokenKind x) of
      (4) => CXToken_Comment
      (3) => CXToken_Literal
      (2) => CXToken_Identifier
      (1) => CXToken_Keyword
      (0) => CXToken_Punctuation
      _ => assert_total $ idris_crash "Invalid cast from Prim_CXTokenKind to CXTokenKind"

Prim_CXCompletionChunkKind : Type
Prim_CXCompletionChunkKind = Int

data CXCompletionChunkKind
   = CXCompletionChunk_VerticalSpace
   | CXCompletionChunk_HorizontalSpace
   | CXCompletionChunk_Equal
   | CXCompletionChunk_SemiColon
   | CXCompletionChunk_Colon
   | CXCompletionChunk_ResultType
   | CXCompletionChunk_Comma
   | CXCompletionChunk_RightAngle
   | CXCompletionChunk_LeftAngle
   | CXCompletionChunk_RightBrace
   | CXCompletionChunk_LeftBrace
   | CXCompletionChunk_RightBracket
   | CXCompletionChunk_LeftBracket
   | CXCompletionChunk_RightParen
   | CXCompletionChunk_LeftParen
   | CXCompletionChunk_CurrentParameter
   | CXCompletionChunk_Informative
   | CXCompletionChunk_Placeholder
   | CXCompletionChunk_Text
   | CXCompletionChunk_TypedText
   | CXCompletionChunk_Optional

%foreign (wrapper "toPrim_CXCompletionChunkKind")
toPrim_CXCompletionChunkKind : Int -> Prim_CXCompletionChunkKind

Cast CXCompletionChunkKind Prim_CXCompletionChunkKind where
   cast CXCompletionChunk_VerticalSpace = toPrim_CXCompletionChunkKind (20)
   cast CXCompletionChunk_HorizontalSpace = toPrim_CXCompletionChunkKind (19)
   cast CXCompletionChunk_Equal = toPrim_CXCompletionChunkKind (18)
   cast CXCompletionChunk_SemiColon = toPrim_CXCompletionChunkKind (17)
   cast CXCompletionChunk_Colon = toPrim_CXCompletionChunkKind (16)
   cast CXCompletionChunk_ResultType = toPrim_CXCompletionChunkKind (15)
   cast CXCompletionChunk_Comma = toPrim_CXCompletionChunkKind (14)
   cast CXCompletionChunk_RightAngle = toPrim_CXCompletionChunkKind (13)
   cast CXCompletionChunk_LeftAngle = toPrim_CXCompletionChunkKind (12)
   cast CXCompletionChunk_RightBrace = toPrim_CXCompletionChunkKind (11)
   cast CXCompletionChunk_LeftBrace = toPrim_CXCompletionChunkKind (10)
   cast CXCompletionChunk_RightBracket = toPrim_CXCompletionChunkKind (9)
   cast CXCompletionChunk_LeftBracket = toPrim_CXCompletionChunkKind (8)
   cast CXCompletionChunk_RightParen = toPrim_CXCompletionChunkKind (7)
   cast CXCompletionChunk_LeftParen = toPrim_CXCompletionChunkKind (6)
   cast CXCompletionChunk_CurrentParameter = toPrim_CXCompletionChunkKind (5)
   cast CXCompletionChunk_Informative = toPrim_CXCompletionChunkKind (4)
   cast CXCompletionChunk_Placeholder = toPrim_CXCompletionChunkKind (3)
   cast CXCompletionChunk_Text = toPrim_CXCompletionChunkKind (2)
   cast CXCompletionChunk_TypedText = toPrim_CXCompletionChunkKind (1)
   cast CXCompletionChunk_Optional = toPrim_CXCompletionChunkKind (0)

%foreign (wrapper "fromPrim_CXCompletionChunkKind")
fromPrim_CXCompletionChunkKind : Prim_CXCompletionChunkKind -> Int

Cast Prim_CXCompletionChunkKind CXCompletionChunkKind where
   cast x = case (fromPrim_CXCompletionChunkKind x) of
      (20) => CXCompletionChunk_VerticalSpace
      (19) => CXCompletionChunk_HorizontalSpace
      (18) => CXCompletionChunk_Equal
      (17) => CXCompletionChunk_SemiColon
      (16) => CXCompletionChunk_Colon
      (15) => CXCompletionChunk_ResultType
      (14) => CXCompletionChunk_Comma
      (13) => CXCompletionChunk_RightAngle
      (12) => CXCompletionChunk_LeftAngle
      (11) => CXCompletionChunk_RightBrace
      (10) => CXCompletionChunk_LeftBrace
      (9) => CXCompletionChunk_RightBracket
      (8) => CXCompletionChunk_LeftBracket
      (7) => CXCompletionChunk_RightParen
      (6) => CXCompletionChunk_LeftParen
      (5) => CXCompletionChunk_CurrentParameter
      (4) => CXCompletionChunk_Informative
      (3) => CXCompletionChunk_Placeholder
      (2) => CXCompletionChunk_Text
      (1) => CXCompletionChunk_TypedText
      (0) => CXCompletionChunk_Optional
      _ => assert_total $ idris_crash "Invalid cast from Prim_CXCompletionChunkKind to CXCompletionChunkKind"

Prim_CXCodeComplete_Flags : Type
Prim_CXCodeComplete_Flags = Int

data CXCodeComplete_Flags
   = CXCodeComplete_IncludeCompletionsWithFixIts
   | CXCodeComplete_SkipPreamble
   | CXCodeComplete_IncludeBriefComments
   | CXCodeComplete_IncludeCodePatterns
   | CXCodeComplete_IncludeMacros

%foreign (wrapper "toPrim_CXCodeComplete_Flags")
toPrim_CXCodeComplete_Flags : Int -> Prim_CXCodeComplete_Flags

Cast CXCodeComplete_Flags Prim_CXCodeComplete_Flags where
   cast CXCodeComplete_IncludeCompletionsWithFixIts = toPrim_CXCodeComplete_Flags (16)
   cast CXCodeComplete_SkipPreamble = toPrim_CXCodeComplete_Flags (8)
   cast CXCodeComplete_IncludeBriefComments = toPrim_CXCodeComplete_Flags (4)
   cast CXCodeComplete_IncludeCodePatterns = toPrim_CXCodeComplete_Flags (2)
   cast CXCodeComplete_IncludeMacros = toPrim_CXCodeComplete_Flags (1)

%foreign (wrapper "fromPrim_CXCodeComplete_Flags")
fromPrim_CXCodeComplete_Flags : Prim_CXCodeComplete_Flags -> Int

Cast Prim_CXCodeComplete_Flags CXCodeComplete_Flags where
   cast x = case (fromPrim_CXCodeComplete_Flags x) of
      (16) => CXCodeComplete_IncludeCompletionsWithFixIts
      (8) => CXCodeComplete_SkipPreamble
      (4) => CXCodeComplete_IncludeBriefComments
      (2) => CXCodeComplete_IncludeCodePatterns
      (1) => CXCodeComplete_IncludeMacros
      _ => assert_total $ idris_crash "Invalid cast from Prim_CXCodeComplete_Flags to CXCodeComplete_Flags"

Prim_CXCompletionContext : Type
Prim_CXCompletionContext = Int

data CXCompletionContext
   = CXCompletionContext_Unknown
   | CXCompletionContext_IncludedFile
   | CXCompletionContext_NaturalLanguage
   | CXCompletionContext_MacroName
   | CXCompletionContext_ObjCSelectorName
   | CXCompletionContext_ObjCClassMessage
   | CXCompletionContext_ObjCInstanceMessage
   | CXCompletionContext_ObjCCategory
   | CXCompletionContext_ObjCProtocol
   | CXCompletionContext_ObjCInterface
   | CXCompletionContext_NestedNameSpecifier
   | CXCompletionContext_Namespace
   | CXCompletionContext_ClassTag
   | CXCompletionContext_StructTag
   | CXCompletionContext_UnionTag
   | CXCompletionContext_EnumTag
   | CXCompletionContext_ObjCPropertyAccess
   | CXCompletionContext_ArrowMemberAccess
   | CXCompletionContext_DotMemberAccess
   | CXCompletionContext_CXXClassTypeValue
   | CXCompletionContext_ObjCSelectorValue
   | CXCompletionContext_ObjCObjectValue
   | CXCompletionContext_AnyValue
   | CXCompletionContext_AnyType
   | CXCompletionContext_Unexposed

%foreign (wrapper "toPrim_CXCompletionContext")
toPrim_CXCompletionContext : Int -> Prim_CXCompletionContext

Cast CXCompletionContext Prim_CXCompletionContext where
   cast CXCompletionContext_Unknown = toPrim_CXCompletionContext (8388607)
   cast CXCompletionContext_IncludedFile = toPrim_CXCompletionContext (4194304)
   cast CXCompletionContext_NaturalLanguage = toPrim_CXCompletionContext (2097152)
   cast CXCompletionContext_MacroName = toPrim_CXCompletionContext (1048576)
   cast CXCompletionContext_ObjCSelectorName = toPrim_CXCompletionContext (524288)
   cast CXCompletionContext_ObjCClassMessage = toPrim_CXCompletionContext (262144)
   cast CXCompletionContext_ObjCInstanceMessage = toPrim_CXCompletionContext (131072)
   cast CXCompletionContext_ObjCCategory = toPrim_CXCompletionContext (65536)
   cast CXCompletionContext_ObjCProtocol = toPrim_CXCompletionContext (32768)
   cast CXCompletionContext_ObjCInterface = toPrim_CXCompletionContext (16384)
   cast CXCompletionContext_NestedNameSpecifier = toPrim_CXCompletionContext (8192)
   cast CXCompletionContext_Namespace = toPrim_CXCompletionContext (4096)
   cast CXCompletionContext_ClassTag = toPrim_CXCompletionContext (2048)
   cast CXCompletionContext_StructTag = toPrim_CXCompletionContext (1024)
   cast CXCompletionContext_UnionTag = toPrim_CXCompletionContext (512)
   cast CXCompletionContext_EnumTag = toPrim_CXCompletionContext (256)
   cast CXCompletionContext_ObjCPropertyAccess = toPrim_CXCompletionContext (128)
   cast CXCompletionContext_ArrowMemberAccess = toPrim_CXCompletionContext (64)
   cast CXCompletionContext_DotMemberAccess = toPrim_CXCompletionContext (32)
   cast CXCompletionContext_CXXClassTypeValue = toPrim_CXCompletionContext (16)
   cast CXCompletionContext_ObjCSelectorValue = toPrim_CXCompletionContext (8)
   cast CXCompletionContext_ObjCObjectValue = toPrim_CXCompletionContext (4)
   cast CXCompletionContext_AnyValue = toPrim_CXCompletionContext (2)
   cast CXCompletionContext_AnyType = toPrim_CXCompletionContext (1)
   cast CXCompletionContext_Unexposed = toPrim_CXCompletionContext (0)

%foreign (wrapper "fromPrim_CXCompletionContext")
fromPrim_CXCompletionContext : Prim_CXCompletionContext -> Int

Cast Prim_CXCompletionContext CXCompletionContext where
   cast x = case (fromPrim_CXCompletionContext x) of
      (8388607) => CXCompletionContext_Unknown
      (4194304) => CXCompletionContext_IncludedFile
      (2097152) => CXCompletionContext_NaturalLanguage
      (1048576) => CXCompletionContext_MacroName
      (524288) => CXCompletionContext_ObjCSelectorName
      (262144) => CXCompletionContext_ObjCClassMessage
      (131072) => CXCompletionContext_ObjCInstanceMessage
      (65536) => CXCompletionContext_ObjCCategory
      (32768) => CXCompletionContext_ObjCProtocol
      (16384) => CXCompletionContext_ObjCInterface
      (8192) => CXCompletionContext_NestedNameSpecifier
      (4096) => CXCompletionContext_Namespace
      (2048) => CXCompletionContext_ClassTag
      (1024) => CXCompletionContext_StructTag
      (512) => CXCompletionContext_UnionTag
      (256) => CXCompletionContext_EnumTag
      (128) => CXCompletionContext_ObjCPropertyAccess
      (64) => CXCompletionContext_ArrowMemberAccess
      (32) => CXCompletionContext_DotMemberAccess
      (16) => CXCompletionContext_CXXClassTypeValue
      (8) => CXCompletionContext_ObjCSelectorValue
      (4) => CXCompletionContext_ObjCObjectValue
      (2) => CXCompletionContext_AnyValue
      (1) => CXCompletionContext_AnyType
      (0) => CXCompletionContext_Unexposed
      _ => assert_total $ idris_crash "Invalid cast from Prim_CXCompletionContext to CXCompletionContext"

Prim_CXEvalResultKind : Type
Prim_CXEvalResultKind = Int

data CXEvalResultKind
   = CXEval_UnExposed
   | CXEval_Other
   | CXEval_CFStr
   | CXEval_StrLiteral
   | CXEval_ObjCStrLiteral
   | CXEval_Float
   | CXEval_Int

%foreign (wrapper "toPrim_CXEvalResultKind")
toPrim_CXEvalResultKind : Int -> Prim_CXEvalResultKind

Cast CXEvalResultKind Prim_CXEvalResultKind where
   cast CXEval_UnExposed = toPrim_CXEvalResultKind (0)
   cast CXEval_Other = toPrim_CXEvalResultKind (6)
   cast CXEval_CFStr = toPrim_CXEvalResultKind (5)
   cast CXEval_StrLiteral = toPrim_CXEvalResultKind (4)
   cast CXEval_ObjCStrLiteral = toPrim_CXEvalResultKind (3)
   cast CXEval_Float = toPrim_CXEvalResultKind (2)
   cast CXEval_Int = toPrim_CXEvalResultKind (1)

%foreign (wrapper "fromPrim_CXEvalResultKind")
fromPrim_CXEvalResultKind : Prim_CXEvalResultKind -> Int

Cast Prim_CXEvalResultKind CXEvalResultKind where
   cast x = case (fromPrim_CXEvalResultKind x) of
      (0) => CXEval_UnExposed
      (6) => CXEval_Other
      (5) => CXEval_CFStr
      (4) => CXEval_StrLiteral
      (3) => CXEval_ObjCStrLiteral
      (2) => CXEval_Float
      (1) => CXEval_Int
      _ => assert_total $ idris_crash "Invalid cast from Prim_CXEvalResultKind to CXEvalResultKind"

Prim_CXVisitorResult : Type
Prim_CXVisitorResult = Int

data CXVisitorResult
   = CXVisit_Continue
   | CXVisit_Break

%foreign (wrapper "toPrim_CXVisitorResult")
toPrim_CXVisitorResult : Int -> Prim_CXVisitorResult

Cast CXVisitorResult Prim_CXVisitorResult where
   cast CXVisit_Continue = toPrim_CXVisitorResult (1)
   cast CXVisit_Break = toPrim_CXVisitorResult (0)

%foreign (wrapper "fromPrim_CXVisitorResult")
fromPrim_CXVisitorResult : Prim_CXVisitorResult -> Int

Cast Prim_CXVisitorResult CXVisitorResult where
   cast x = case (fromPrim_CXVisitorResult x) of
      (1) => CXVisit_Continue
      (0) => CXVisit_Break
      _ => assert_total $ idris_crash "Invalid cast from Prim_CXVisitorResult to CXVisitorResult"

Prim_CXResult : Type
Prim_CXResult = Int

data CXResult
   = CXResult_VisitBreak
   | CXResult_Invalid
   | CXResult_Success

%foreign (wrapper "toPrim_CXResult")
toPrim_CXResult : Int -> Prim_CXResult

Cast CXResult Prim_CXResult where
   cast CXResult_VisitBreak = toPrim_CXResult (2)
   cast CXResult_Invalid = toPrim_CXResult (1)
   cast CXResult_Success = toPrim_CXResult (0)

%foreign (wrapper "fromPrim_CXResult")
fromPrim_CXResult : Prim_CXResult -> Int

Cast Prim_CXResult CXResult where
   cast x = case (fromPrim_CXResult x) of
      (2) => CXResult_VisitBreak
      (1) => CXResult_Invalid
      (0) => CXResult_Success
      _ => assert_total $ idris_crash "Invalid cast from Prim_CXResult to CXResult"

Prim_CXIdxEntityKind : Type
Prim_CXIdxEntityKind = Int

data CXIdxEntityKind
   = CXIdxEntity_CXXConcept
   | CXIdxEntity_CXXInterface
   | CXIdxEntity_CXXTypeAlias
   | CXIdxEntity_CXXConversionFunction
   | CXIdxEntity_CXXDestructor
   | CXIdxEntity_CXXConstructor
   | CXIdxEntity_CXXInstanceMethod
   | CXIdxEntity_CXXStaticMethod
   | CXIdxEntity_CXXStaticVariable
   | CXIdxEntity_CXXNamespaceAlias
   | CXIdxEntity_CXXNamespace
   | CXIdxEntity_CXXClass
   | CXIdxEntity_Union
   | CXIdxEntity_Struct
   | CXIdxEntity_Enum
   | CXIdxEntity_ObjCIvar
   | CXIdxEntity_ObjCProperty
   | CXIdxEntity_ObjCClassMethod
   | CXIdxEntity_ObjCInstanceMethod
   | CXIdxEntity_ObjCCategory
   | CXIdxEntity_ObjCProtocol
   | CXIdxEntity_ObjCClass
   | CXIdxEntity_EnumConstant
   | CXIdxEntity_Field
   | CXIdxEntity_Variable
   | CXIdxEntity_Function
   | CXIdxEntity_Typedef
   | CXIdxEntity_Unexposed

%foreign (wrapper "toPrim_CXIdxEntityKind")
toPrim_CXIdxEntityKind : Int -> Prim_CXIdxEntityKind

Cast CXIdxEntityKind Prim_CXIdxEntityKind where
   cast CXIdxEntity_CXXConcept = toPrim_CXIdxEntityKind (27)
   cast CXIdxEntity_CXXInterface = toPrim_CXIdxEntityKind (26)
   cast CXIdxEntity_CXXTypeAlias = toPrim_CXIdxEntityKind (25)
   cast CXIdxEntity_CXXConversionFunction = toPrim_CXIdxEntityKind (24)
   cast CXIdxEntity_CXXDestructor = toPrim_CXIdxEntityKind (23)
   cast CXIdxEntity_CXXConstructor = toPrim_CXIdxEntityKind (22)
   cast CXIdxEntity_CXXInstanceMethod = toPrim_CXIdxEntityKind (21)
   cast CXIdxEntity_CXXStaticMethod = toPrim_CXIdxEntityKind (20)
   cast CXIdxEntity_CXXStaticVariable = toPrim_CXIdxEntityKind (19)
   cast CXIdxEntity_CXXNamespaceAlias = toPrim_CXIdxEntityKind (18)
   cast CXIdxEntity_CXXNamespace = toPrim_CXIdxEntityKind (17)
   cast CXIdxEntity_CXXClass = toPrim_CXIdxEntityKind (16)
   cast CXIdxEntity_Union = toPrim_CXIdxEntityKind (15)
   cast CXIdxEntity_Struct = toPrim_CXIdxEntityKind (14)
   cast CXIdxEntity_Enum = toPrim_CXIdxEntityKind (13)
   cast CXIdxEntity_ObjCIvar = toPrim_CXIdxEntityKind (12)
   cast CXIdxEntity_ObjCProperty = toPrim_CXIdxEntityKind (11)
   cast CXIdxEntity_ObjCClassMethod = toPrim_CXIdxEntityKind (10)
   cast CXIdxEntity_ObjCInstanceMethod = toPrim_CXIdxEntityKind (9)
   cast CXIdxEntity_ObjCCategory = toPrim_CXIdxEntityKind (8)
   cast CXIdxEntity_ObjCProtocol = toPrim_CXIdxEntityKind (7)
   cast CXIdxEntity_ObjCClass = toPrim_CXIdxEntityKind (6)
   cast CXIdxEntity_EnumConstant = toPrim_CXIdxEntityKind (5)
   cast CXIdxEntity_Field = toPrim_CXIdxEntityKind (4)
   cast CXIdxEntity_Variable = toPrim_CXIdxEntityKind (3)
   cast CXIdxEntity_Function = toPrim_CXIdxEntityKind (2)
   cast CXIdxEntity_Typedef = toPrim_CXIdxEntityKind (1)
   cast CXIdxEntity_Unexposed = toPrim_CXIdxEntityKind (0)

%foreign (wrapper "fromPrim_CXIdxEntityKind")
fromPrim_CXIdxEntityKind : Prim_CXIdxEntityKind -> Int

Cast Prim_CXIdxEntityKind CXIdxEntityKind where
   cast x = case (fromPrim_CXIdxEntityKind x) of
      (27) => CXIdxEntity_CXXConcept
      (26) => CXIdxEntity_CXXInterface
      (25) => CXIdxEntity_CXXTypeAlias
      (24) => CXIdxEntity_CXXConversionFunction
      (23) => CXIdxEntity_CXXDestructor
      (22) => CXIdxEntity_CXXConstructor
      (21) => CXIdxEntity_CXXInstanceMethod
      (20) => CXIdxEntity_CXXStaticMethod
      (19) => CXIdxEntity_CXXStaticVariable
      (18) => CXIdxEntity_CXXNamespaceAlias
      (17) => CXIdxEntity_CXXNamespace
      (16) => CXIdxEntity_CXXClass
      (15) => CXIdxEntity_Union
      (14) => CXIdxEntity_Struct
      (13) => CXIdxEntity_Enum
      (12) => CXIdxEntity_ObjCIvar
      (11) => CXIdxEntity_ObjCProperty
      (10) => CXIdxEntity_ObjCClassMethod
      (9) => CXIdxEntity_ObjCInstanceMethod
      (8) => CXIdxEntity_ObjCCategory
      (7) => CXIdxEntity_ObjCProtocol
      (6) => CXIdxEntity_ObjCClass
      (5) => CXIdxEntity_EnumConstant
      (4) => CXIdxEntity_Field
      (3) => CXIdxEntity_Variable
      (2) => CXIdxEntity_Function
      (1) => CXIdxEntity_Typedef
      (0) => CXIdxEntity_Unexposed
      _ => assert_total $ idris_crash "Invalid cast from Prim_CXIdxEntityKind to CXIdxEntityKind"

Prim_CXIdxEntityLanguage : Type
Prim_CXIdxEntityLanguage = Int

data CXIdxEntityLanguage
   = CXIdxEntityLang_Swift
   | CXIdxEntityLang_CXX
   | CXIdxEntityLang_ObjC
   | CXIdxEntityLang_C
   | CXIdxEntityLang_None

%foreign (wrapper "toPrim_CXIdxEntityLanguage")
toPrim_CXIdxEntityLanguage : Int -> Prim_CXIdxEntityLanguage

Cast CXIdxEntityLanguage Prim_CXIdxEntityLanguage where
   cast CXIdxEntityLang_Swift = toPrim_CXIdxEntityLanguage (4)
   cast CXIdxEntityLang_CXX = toPrim_CXIdxEntityLanguage (3)
   cast CXIdxEntityLang_ObjC = toPrim_CXIdxEntityLanguage (2)
   cast CXIdxEntityLang_C = toPrim_CXIdxEntityLanguage (1)
   cast CXIdxEntityLang_None = toPrim_CXIdxEntityLanguage (0)

%foreign (wrapper "fromPrim_CXIdxEntityLanguage")
fromPrim_CXIdxEntityLanguage : Prim_CXIdxEntityLanguage -> Int

Cast Prim_CXIdxEntityLanguage CXIdxEntityLanguage where
   cast x = case (fromPrim_CXIdxEntityLanguage x) of
      (4) => CXIdxEntityLang_Swift
      (3) => CXIdxEntityLang_CXX
      (2) => CXIdxEntityLang_ObjC
      (1) => CXIdxEntityLang_C
      (0) => CXIdxEntityLang_None
      _ => assert_total $ idris_crash "Invalid cast from Prim_CXIdxEntityLanguage to CXIdxEntityLanguage"

Prim_CXIdxEntityCXXTemplateKind : Type
Prim_CXIdxEntityCXXTemplateKind = Int

data CXIdxEntityCXXTemplateKind
   = CXIdxEntity_TemplateSpecialization
   | CXIdxEntity_TemplatePartialSpecialization
   | CXIdxEntity_Template
   | CXIdxEntity_NonTemplate

%foreign (wrapper "toPrim_CXIdxEntityCXXTemplateKind")
toPrim_CXIdxEntityCXXTemplateKind : Int -> Prim_CXIdxEntityCXXTemplateKind

Cast CXIdxEntityCXXTemplateKind Prim_CXIdxEntityCXXTemplateKind where
   cast CXIdxEntity_TemplateSpecialization = toPrim_CXIdxEntityCXXTemplateKind (3)
   cast CXIdxEntity_TemplatePartialSpecialization = toPrim_CXIdxEntityCXXTemplateKind (2)
   cast CXIdxEntity_Template = toPrim_CXIdxEntityCXXTemplateKind (1)
   cast CXIdxEntity_NonTemplate = toPrim_CXIdxEntityCXXTemplateKind (0)

%foreign (wrapper "fromPrim_CXIdxEntityCXXTemplateKind")
fromPrim_CXIdxEntityCXXTemplateKind : Prim_CXIdxEntityCXXTemplateKind -> Int

Cast Prim_CXIdxEntityCXXTemplateKind CXIdxEntityCXXTemplateKind where
   cast x = case (fromPrim_CXIdxEntityCXXTemplateKind x) of
      (3) => CXIdxEntity_TemplateSpecialization
      (2) => CXIdxEntity_TemplatePartialSpecialization
      (1) => CXIdxEntity_Template
      (0) => CXIdxEntity_NonTemplate
      _ => assert_total $ idris_crash "Invalid cast from Prim_CXIdxEntityCXXTemplateKind to CXIdxEntityCXXTemplateKind"

Prim_CXIdxAttrKind : Type
Prim_CXIdxAttrKind = Int

data CXIdxAttrKind
   = CXIdxAttr_IBOutletCollection
   | CXIdxAttr_IBOutlet
   | CXIdxAttr_IBAction
   | CXIdxAttr_Unexposed

%foreign (wrapper "toPrim_CXIdxAttrKind")
toPrim_CXIdxAttrKind : Int -> Prim_CXIdxAttrKind

Cast CXIdxAttrKind Prim_CXIdxAttrKind where
   cast CXIdxAttr_IBOutletCollection = toPrim_CXIdxAttrKind (3)
   cast CXIdxAttr_IBOutlet = toPrim_CXIdxAttrKind (2)
   cast CXIdxAttr_IBAction = toPrim_CXIdxAttrKind (1)
   cast CXIdxAttr_Unexposed = toPrim_CXIdxAttrKind (0)

%foreign (wrapper "fromPrim_CXIdxAttrKind")
fromPrim_CXIdxAttrKind : Prim_CXIdxAttrKind -> Int

Cast Prim_CXIdxAttrKind CXIdxAttrKind where
   cast x = case (fromPrim_CXIdxAttrKind x) of
      (3) => CXIdxAttr_IBOutletCollection
      (2) => CXIdxAttr_IBOutlet
      (1) => CXIdxAttr_IBAction
      (0) => CXIdxAttr_Unexposed
      _ => assert_total $ idris_crash "Invalid cast from Prim_CXIdxAttrKind to CXIdxAttrKind"

Prim_CXIdxDeclInfoFlags : Type
Prim_CXIdxDeclInfoFlags = Int

data CXIdxDeclInfoFlags
   = CXIdxDeclFlag_Skipped


%foreign (wrapper "toPrim_CXIdxDeclInfoFlags")
toPrim_CXIdxDeclInfoFlags : Int -> Prim_CXIdxDeclInfoFlags

Cast CXIdxDeclInfoFlags Prim_CXIdxDeclInfoFlags where
   cast CXIdxDeclFlag_Skipped = toPrim_CXIdxDeclInfoFlags (1)

%foreign (wrapper "fromPrim_CXIdxDeclInfoFlags")
fromPrim_CXIdxDeclInfoFlags : Prim_CXIdxDeclInfoFlags -> Int

Cast Prim_CXIdxDeclInfoFlags CXIdxDeclInfoFlags where
   cast x = case (fromPrim_CXIdxDeclInfoFlags x) of
      (1) => CXIdxDeclFlag_Skipped
      _ => assert_total $ idris_crash "Invalid cast from Prim_CXIdxDeclInfoFlags to CXIdxDeclInfoFlags"

Prim_CXIdxObjCContainerKind : Type
Prim_CXIdxObjCContainerKind = Int

data CXIdxObjCContainerKind
   = CXIdxObjCContainer_Implementation
   | CXIdxObjCContainer_Interface
   | CXIdxObjCContainer_ForwardRef

%foreign (wrapper "toPrim_CXIdxObjCContainerKind")
toPrim_CXIdxObjCContainerKind : Int -> Prim_CXIdxObjCContainerKind

Cast CXIdxObjCContainerKind Prim_CXIdxObjCContainerKind where
   cast CXIdxObjCContainer_Implementation = toPrim_CXIdxObjCContainerKind (2)
   cast CXIdxObjCContainer_Interface = toPrim_CXIdxObjCContainerKind (1)
   cast CXIdxObjCContainer_ForwardRef = toPrim_CXIdxObjCContainerKind (0)

%foreign (wrapper "fromPrim_CXIdxObjCContainerKind")
fromPrim_CXIdxObjCContainerKind : Prim_CXIdxObjCContainerKind -> Int

Cast Prim_CXIdxObjCContainerKind CXIdxObjCContainerKind where
   cast x = case (fromPrim_CXIdxObjCContainerKind x) of
      (2) => CXIdxObjCContainer_Implementation
      (1) => CXIdxObjCContainer_Interface
      (0) => CXIdxObjCContainer_ForwardRef
      _ => assert_total $ idris_crash "Invalid cast from Prim_CXIdxObjCContainerKind to CXIdxObjCContainerKind"

Prim_CXIdxEntityRefKind : Type
Prim_CXIdxEntityRefKind = Int

data CXIdxEntityRefKind
   = CXIdxEntityRef_Implicit
   | CXIdxEntityRef_Direct

%foreign (wrapper "toPrim_CXIdxEntityRefKind")
toPrim_CXIdxEntityRefKind : Int -> Prim_CXIdxEntityRefKind

Cast CXIdxEntityRefKind Prim_CXIdxEntityRefKind where
   cast CXIdxEntityRef_Implicit = toPrim_CXIdxEntityRefKind (2)
   cast CXIdxEntityRef_Direct = toPrim_CXIdxEntityRefKind (1)

%foreign (wrapper "fromPrim_CXIdxEntityRefKind")
fromPrim_CXIdxEntityRefKind : Prim_CXIdxEntityRefKind -> Int

Cast Prim_CXIdxEntityRefKind CXIdxEntityRefKind where
   cast x = case (fromPrim_CXIdxEntityRefKind x) of
      (2) => CXIdxEntityRef_Implicit
      (1) => CXIdxEntityRef_Direct
      _ => assert_total $ idris_crash "Invalid cast from Prim_CXIdxEntityRefKind to CXIdxEntityRefKind"

Prim_CXSymbolRole : Type
Prim_CXSymbolRole = Int

data CXSymbolRole
   = CXSymbolRole_Implicit
   | CXSymbolRole_AddressOf
   | CXSymbolRole_Dynamic
   | CXSymbolRole_Call
   | CXSymbolRole_Write
   | CXSymbolRole_Read
   | CXSymbolRole_Reference
   | CXSymbolRole_Definition
   | CXSymbolRole_Declaration
   | CXSymbolRole_None

%foreign (wrapper "toPrim_CXSymbolRole")
toPrim_CXSymbolRole : Int -> Prim_CXSymbolRole

Cast CXSymbolRole Prim_CXSymbolRole where
   cast CXSymbolRole_Implicit = toPrim_CXSymbolRole (256)
   cast CXSymbolRole_AddressOf = toPrim_CXSymbolRole (128)
   cast CXSymbolRole_Dynamic = toPrim_CXSymbolRole (64)
   cast CXSymbolRole_Call = toPrim_CXSymbolRole (32)
   cast CXSymbolRole_Write = toPrim_CXSymbolRole (16)
   cast CXSymbolRole_Read = toPrim_CXSymbolRole (8)
   cast CXSymbolRole_Reference = toPrim_CXSymbolRole (4)
   cast CXSymbolRole_Definition = toPrim_CXSymbolRole (2)
   cast CXSymbolRole_Declaration = toPrim_CXSymbolRole (1)
   cast CXSymbolRole_None = toPrim_CXSymbolRole (0)

%foreign (wrapper "fromPrim_CXSymbolRole")
fromPrim_CXSymbolRole : Prim_CXSymbolRole -> Int

Cast Prim_CXSymbolRole CXSymbolRole where
   cast x = case (fromPrim_CXSymbolRole x) of
      (256) => CXSymbolRole_Implicit
      (128) => CXSymbolRole_AddressOf
      (64) => CXSymbolRole_Dynamic
      (32) => CXSymbolRole_Call
      (16) => CXSymbolRole_Write
      (8) => CXSymbolRole_Read
      (4) => CXSymbolRole_Reference
      (2) => CXSymbolRole_Definition
      (1) => CXSymbolRole_Declaration
      (0) => CXSymbolRole_None
      _ => assert_total $ idris_crash "Invalid cast from Prim_CXSymbolRole to CXSymbolRole"

Prim_CXIndexOptFlags : Type
Prim_CXIndexOptFlags = Int

data CXIndexOptFlags
   = CXIndexOpt_SkipParsedBodiesInSession
   | CXIndexOpt_SuppressWarnings
   | CXIndexOpt_IndexImplicitTemplateInstantiations
   | CXIndexOpt_IndexFunctionLocalSymbols
   | CXIndexOpt_SuppressRedundantRefs
   | CXIndexOpt_None

%foreign (wrapper "toPrim_CXIndexOptFlags")
toPrim_CXIndexOptFlags : Int -> Prim_CXIndexOptFlags

Cast CXIndexOptFlags Prim_CXIndexOptFlags where
   cast CXIndexOpt_SkipParsedBodiesInSession = toPrim_CXIndexOptFlags (16)
   cast CXIndexOpt_SuppressWarnings = toPrim_CXIndexOptFlags (8)
   cast CXIndexOpt_IndexImplicitTemplateInstantiations = toPrim_CXIndexOptFlags (4)
   cast CXIndexOpt_IndexFunctionLocalSymbols = toPrim_CXIndexOptFlags (2)
   cast CXIndexOpt_SuppressRedundantRefs = toPrim_CXIndexOptFlags (1)
   cast CXIndexOpt_None = toPrim_CXIndexOptFlags (0)

%foreign (wrapper "fromPrim_CXIndexOptFlags")
fromPrim_CXIndexOptFlags : Prim_CXIndexOptFlags -> Int

Cast Prim_CXIndexOptFlags CXIndexOptFlags where
   cast x = case (fromPrim_CXIndexOptFlags x) of
      (16) => CXIndexOpt_SkipParsedBodiesInSession
      (8) => CXIndexOpt_SuppressWarnings
      (4) => CXIndexOpt_IndexImplicitTemplateInstantiations
      (2) => CXIndexOpt_IndexFunctionLocalSymbols
      (1) => CXIndexOpt_SuppressRedundantRefs
      (0) => CXIndexOpt_None
      _ => assert_total $ idris_crash "Invalid cast from Prim_CXIndexOptFlags to CXIndexOptFlags"

Prim_CXBinaryOperatorKind : Type
Prim_CXBinaryOperatorKind = Int

data CXBinaryOperatorKind
   = CXBinaryOperator_Comma
   | CXBinaryOperator_OrAssign
   | CXBinaryOperator_XorAssign
   | CXBinaryOperator_AndAssign
   | CXBinaryOperator_ShrAssign
   | CXBinaryOperator_ShlAssign
   | CXBinaryOperator_SubAssign
   | CXBinaryOperator_AddAssign
   | CXBinaryOperator_RemAssign
   | CXBinaryOperator_DivAssign
   | CXBinaryOperator_MulAssign
   | CXBinaryOperator_Assign
   | CXBinaryOperator_LOr
   | CXBinaryOperator_LAnd
   | CXBinaryOperator_Or
   | CXBinaryOperator_Xor
   | CXBinaryOperator_And
   | CXBinaryOperator_NE
   | CXBinaryOperator_EQ
   | CXBinaryOperator_GE
   | CXBinaryOperator_LE
   | CXBinaryOperator_GT
   | CXBinaryOperator_LT
   | CXBinaryOperator_Cmp
   | CXBinaryOperator_Shr
   | CXBinaryOperator_Shl
   | CXBinaryOperator_Sub
   | CXBinaryOperator_Add
   | CXBinaryOperator_Rem
   | CXBinaryOperator_Div
   | CXBinaryOperator_Mul
   | CXBinaryOperator_PtrMemI
   | CXBinaryOperator_PtrMemD
   | CXBinaryOperator_Invalid

%foreign (wrapper "toPrim_CXBinaryOperatorKind")
toPrim_CXBinaryOperatorKind : Int -> Prim_CXBinaryOperatorKind

Cast CXBinaryOperatorKind Prim_CXBinaryOperatorKind where
   cast CXBinaryOperator_Comma = toPrim_CXBinaryOperatorKind (33)
   cast CXBinaryOperator_OrAssign = toPrim_CXBinaryOperatorKind (32)
   cast CXBinaryOperator_XorAssign = toPrim_CXBinaryOperatorKind (31)
   cast CXBinaryOperator_AndAssign = toPrim_CXBinaryOperatorKind (30)
   cast CXBinaryOperator_ShrAssign = toPrim_CXBinaryOperatorKind (29)
   cast CXBinaryOperator_ShlAssign = toPrim_CXBinaryOperatorKind (28)
   cast CXBinaryOperator_SubAssign = toPrim_CXBinaryOperatorKind (27)
   cast CXBinaryOperator_AddAssign = toPrim_CXBinaryOperatorKind (26)
   cast CXBinaryOperator_RemAssign = toPrim_CXBinaryOperatorKind (25)
   cast CXBinaryOperator_DivAssign = toPrim_CXBinaryOperatorKind (24)
   cast CXBinaryOperator_MulAssign = toPrim_CXBinaryOperatorKind (23)
   cast CXBinaryOperator_Assign = toPrim_CXBinaryOperatorKind (22)
   cast CXBinaryOperator_LOr = toPrim_CXBinaryOperatorKind (21)
   cast CXBinaryOperator_LAnd = toPrim_CXBinaryOperatorKind (20)
   cast CXBinaryOperator_Or = toPrim_CXBinaryOperatorKind (19)
   cast CXBinaryOperator_Xor = toPrim_CXBinaryOperatorKind (18)
   cast CXBinaryOperator_And = toPrim_CXBinaryOperatorKind (17)
   cast CXBinaryOperator_NE = toPrim_CXBinaryOperatorKind (16)
   cast CXBinaryOperator_EQ = toPrim_CXBinaryOperatorKind (15)
   cast CXBinaryOperator_GE = toPrim_CXBinaryOperatorKind (14)
   cast CXBinaryOperator_LE = toPrim_CXBinaryOperatorKind (13)
   cast CXBinaryOperator_GT = toPrim_CXBinaryOperatorKind (12)
   cast CXBinaryOperator_LT = toPrim_CXBinaryOperatorKind (11)
   cast CXBinaryOperator_Cmp = toPrim_CXBinaryOperatorKind (10)
   cast CXBinaryOperator_Shr = toPrim_CXBinaryOperatorKind (9)
   cast CXBinaryOperator_Shl = toPrim_CXBinaryOperatorKind (8)
   cast CXBinaryOperator_Sub = toPrim_CXBinaryOperatorKind (7)
   cast CXBinaryOperator_Add = toPrim_CXBinaryOperatorKind (6)
   cast CXBinaryOperator_Rem = toPrim_CXBinaryOperatorKind (5)
   cast CXBinaryOperator_Div = toPrim_CXBinaryOperatorKind (4)
   cast CXBinaryOperator_Mul = toPrim_CXBinaryOperatorKind (3)
   cast CXBinaryOperator_PtrMemI = toPrim_CXBinaryOperatorKind (2)
   cast CXBinaryOperator_PtrMemD = toPrim_CXBinaryOperatorKind (1)
   cast CXBinaryOperator_Invalid = toPrim_CXBinaryOperatorKind (0)

%foreign (wrapper "fromPrim_CXBinaryOperatorKind")
fromPrim_CXBinaryOperatorKind : Prim_CXBinaryOperatorKind -> Int

Cast Prim_CXBinaryOperatorKind CXBinaryOperatorKind where
   cast x = case (fromPrim_CXBinaryOperatorKind x) of
      (33) => CXBinaryOperator_Comma
      (32) => CXBinaryOperator_OrAssign
      (31) => CXBinaryOperator_XorAssign
      (30) => CXBinaryOperator_AndAssign
      (29) => CXBinaryOperator_ShrAssign
      (28) => CXBinaryOperator_ShlAssign
      (27) => CXBinaryOperator_SubAssign
      (26) => CXBinaryOperator_AddAssign
      (25) => CXBinaryOperator_RemAssign
      (24) => CXBinaryOperator_DivAssign
      (23) => CXBinaryOperator_MulAssign
      (22) => CXBinaryOperator_Assign
      (21) => CXBinaryOperator_LOr
      (20) => CXBinaryOperator_LAnd
      (19) => CXBinaryOperator_Or
      (18) => CXBinaryOperator_Xor
      (17) => CXBinaryOperator_And
      (16) => CXBinaryOperator_NE
      (15) => CXBinaryOperator_EQ
      (14) => CXBinaryOperator_GE
      (13) => CXBinaryOperator_LE
      (12) => CXBinaryOperator_GT
      (11) => CXBinaryOperator_LT
      (10) => CXBinaryOperator_Cmp
      (9) => CXBinaryOperator_Shr
      (8) => CXBinaryOperator_Shl
      (7) => CXBinaryOperator_Sub
      (6) => CXBinaryOperator_Add
      (5) => CXBinaryOperator_Rem
      (4) => CXBinaryOperator_Div
      (3) => CXBinaryOperator_Mul
      (2) => CXBinaryOperator_PtrMemI
      (1) => CXBinaryOperator_PtrMemD
      (0) => CXBinaryOperator_Invalid
      _ => assert_total $ idris_crash "Invalid cast from Prim_CXBinaryOperatorKind to CXBinaryOperatorKind"

Prim_CXUnaryOperatorKind : Type
Prim_CXUnaryOperatorKind = Int

data CXUnaryOperatorKind
   = CXUnaryOperator_Coawait
   | CXUnaryOperator_Extension
   | CXUnaryOperator_Imag
   | CXUnaryOperator_Real
   | CXUnaryOperator_LNot
   | CXUnaryOperator_Not
   | CXUnaryOperator_Minus
   | CXUnaryOperator_Plus
   | CXUnaryOperator_Deref
   | CXUnaryOperator_AddrOf
   | CXUnaryOperator_PreDec
   | CXUnaryOperator_PreInc
   | CXUnaryOperator_PostDec
   | CXUnaryOperator_PostInc
   | CXUnaryOperator_Invalid

%foreign (wrapper "toPrim_CXUnaryOperatorKind")
toPrim_CXUnaryOperatorKind : Int -> Prim_CXUnaryOperatorKind

Cast CXUnaryOperatorKind Prim_CXUnaryOperatorKind where
   cast CXUnaryOperator_Coawait = toPrim_CXUnaryOperatorKind (14)
   cast CXUnaryOperator_Extension = toPrim_CXUnaryOperatorKind (13)
   cast CXUnaryOperator_Imag = toPrim_CXUnaryOperatorKind (12)
   cast CXUnaryOperator_Real = toPrim_CXUnaryOperatorKind (11)
   cast CXUnaryOperator_LNot = toPrim_CXUnaryOperatorKind (10)
   cast CXUnaryOperator_Not = toPrim_CXUnaryOperatorKind (9)
   cast CXUnaryOperator_Minus = toPrim_CXUnaryOperatorKind (8)
   cast CXUnaryOperator_Plus = toPrim_CXUnaryOperatorKind (7)
   cast CXUnaryOperator_Deref = toPrim_CXUnaryOperatorKind (6)
   cast CXUnaryOperator_AddrOf = toPrim_CXUnaryOperatorKind (5)
   cast CXUnaryOperator_PreDec = toPrim_CXUnaryOperatorKind (4)
   cast CXUnaryOperator_PreInc = toPrim_CXUnaryOperatorKind (3)
   cast CXUnaryOperator_PostDec = toPrim_CXUnaryOperatorKind (2)
   cast CXUnaryOperator_PostInc = toPrim_CXUnaryOperatorKind (1)
   cast CXUnaryOperator_Invalid = toPrim_CXUnaryOperatorKind (0)

%foreign (wrapper "fromPrim_CXUnaryOperatorKind")
fromPrim_CXUnaryOperatorKind : Prim_CXUnaryOperatorKind -> Int

Cast Prim_CXUnaryOperatorKind CXUnaryOperatorKind where
   cast x = case (fromPrim_CXUnaryOperatorKind x) of
      (14) => CXUnaryOperator_Coawait
      (13) => CXUnaryOperator_Extension
      (12) => CXUnaryOperator_Imag
      (11) => CXUnaryOperator_Real
      (10) => CXUnaryOperator_LNot
      (9) => CXUnaryOperator_Not
      (8) => CXUnaryOperator_Minus
      (7) => CXUnaryOperator_Plus
      (6) => CXUnaryOperator_Deref
      (5) => CXUnaryOperator_AddrOf
      (4) => CXUnaryOperator_PreDec
      (3) => CXUnaryOperator_PreInc
      (2) => CXUnaryOperator_PostDec
      (1) => CXUnaryOperator_PostInc
      (0) => CXUnaryOperator_Invalid
      _ => assert_total $ idris_crash "Invalid cast from Prim_CXUnaryOperatorKind to CXUnaryOperatorKind"

