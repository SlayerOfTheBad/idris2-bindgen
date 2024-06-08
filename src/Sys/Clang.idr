module Sys.Clang

import Data.Bits
import System

clib : String -> String
clib str = "C:" ++ str ++ ",libclang"

wrapper : String -> String
wrapper str = "C:" ++ str ++ ",wrapper"

namespace CXErrorCode
  public export
  Prim_CXErrorCode : Type
  Prim_CXErrorCode = Bits32

  public export
  data CXErrorCode
    = Other Prim_CXErrorCode
    | CXError_ASTReadError
    | CXError_InvalidArguments
    | CXError_Crashed
    | CXError_Failure
    | CXError_Success

  export
  Cast CXErrorCode Prim_CXErrorCode where
    cast CXError_ASTReadError = (4)
    cast CXError_InvalidArguments = (3)
    cast CXError_Crashed = (2)
    cast CXError_Failure = (1)
    cast CXError_Success = (0)
    cast (Other m) = m


  export
  toPrimitive : CXErrorCode -> Prim_CXErrorCode
  toPrimitive x = cast x

  export
  Cast Prim_CXErrorCode CXErrorCode where
    cast (4) = CXError_ASTReadError
    cast (3) = CXError_InvalidArguments
    cast (2) = CXError_Crashed
    cast (1) = CXError_Failure
    cast (0) = CXError_Success
    cast m = (Other m)


  export
  fromPrimitive : Prim_CXErrorCode -> CXErrorCode
  fromPrimitive x = cast x

  export
  Bits CXErrorCode where
    Index = Index @{the (Bits Bits32) %search}
    (.&.) x y = fromPrimitive $ (toPrimitive x) .&. (toPrimitive y)
    (.|.) x y = fromPrimitive $ (toPrimitive x) .|. (toPrimitive y)
    xor x y = fromPrimitive $ xor (toPrimitive x) (toPrimitive y)
    shiftL x y = fromPrimitive $ shiftL (toPrimitive x) y
    shiftR x y = fromPrimitive $ shiftR (toPrimitive x) y
    zeroBits = fromPrimitive $ zeroBits
    testBit = testBit . toPrimitive
    bit = fromPrimitive . bit

  export
  Eq CXErrorCode where
    (==) x y = (toPrimitive x) == (toPrimitive y)

namespace CXDiagnosticSeverity
  public export
  Prim_CXDiagnosticSeverity : Type
  Prim_CXDiagnosticSeverity = Bits32

  public export
  data CXDiagnosticSeverity
    = Other Prim_CXDiagnosticSeverity
    | CXDiagnostic_Fatal
    | CXDiagnostic_Error
    | CXDiagnostic_Warning
    | CXDiagnostic_Note
    | CXDiagnostic_Ignored

  export
  Cast CXDiagnosticSeverity Prim_CXDiagnosticSeverity where
    cast CXDiagnostic_Fatal = (4)
    cast CXDiagnostic_Error = (3)
    cast CXDiagnostic_Warning = (2)
    cast CXDiagnostic_Note = (1)
    cast CXDiagnostic_Ignored = (0)
    cast (Other m) = m


  export
  toPrimitive : CXDiagnosticSeverity -> Prim_CXDiagnosticSeverity
  toPrimitive x = cast x

  export
  Cast Prim_CXDiagnosticSeverity CXDiagnosticSeverity where
    cast (4) = CXDiagnostic_Fatal
    cast (3) = CXDiagnostic_Error
    cast (2) = CXDiagnostic_Warning
    cast (1) = CXDiagnostic_Note
    cast (0) = CXDiagnostic_Ignored
    cast m = (Other m)


  export
  fromPrimitive : Prim_CXDiagnosticSeverity -> CXDiagnosticSeverity
  fromPrimitive x = cast x

  export
  Bits CXDiagnosticSeverity where
    Index = Index @{the (Bits Bits32) %search}
    (.&.) x y = fromPrimitive $ (toPrimitive x) .&. (toPrimitive y)
    (.|.) x y = fromPrimitive $ (toPrimitive x) .|. (toPrimitive y)
    xor x y = fromPrimitive $ xor (toPrimitive x) (toPrimitive y)
    shiftL x y = fromPrimitive $ shiftL (toPrimitive x) y
    shiftR x y = fromPrimitive $ shiftR (toPrimitive x) y
    zeroBits = fromPrimitive $ zeroBits
    testBit = testBit . toPrimitive
    bit = fromPrimitive . bit

  export
  Eq CXDiagnosticSeverity where
    (==) x y = (toPrimitive x) == (toPrimitive y)

namespace CXLoadDiag_Error
  public export
  Prim_CXLoadDiag_Error : Type
  Prim_CXLoadDiag_Error = Bits32

  public export
  data CXLoadDiag_Error
    = Other Prim_CXLoadDiag_Error
    | CXLoadDiag_InvalidFile
    | CXLoadDiag_CannotLoad
    | CXLoadDiag_Unknown
    | CXLoadDiag_None

  export
  Cast CXLoadDiag_Error Prim_CXLoadDiag_Error where
    cast CXLoadDiag_InvalidFile = (3)
    cast CXLoadDiag_CannotLoad = (2)
    cast CXLoadDiag_Unknown = (1)
    cast CXLoadDiag_None = (0)
    cast (Other m) = m


  export
  toPrimitive : CXLoadDiag_Error -> Prim_CXLoadDiag_Error
  toPrimitive x = cast x

  export
  Cast Prim_CXLoadDiag_Error CXLoadDiag_Error where
    cast (3) = CXLoadDiag_InvalidFile
    cast (2) = CXLoadDiag_CannotLoad
    cast (1) = CXLoadDiag_Unknown
    cast (0) = CXLoadDiag_None
    cast m = (Other m)


  export
  fromPrimitive : Prim_CXLoadDiag_Error -> CXLoadDiag_Error
  fromPrimitive x = cast x

  export
  Bits CXLoadDiag_Error where
    Index = Index @{the (Bits Bits32) %search}
    (.&.) x y = fromPrimitive $ (toPrimitive x) .&. (toPrimitive y)
    (.|.) x y = fromPrimitive $ (toPrimitive x) .|. (toPrimitive y)
    xor x y = fromPrimitive $ xor (toPrimitive x) (toPrimitive y)
    shiftL x y = fromPrimitive $ shiftL (toPrimitive x) y
    shiftR x y = fromPrimitive $ shiftR (toPrimitive x) y
    zeroBits = fromPrimitive $ zeroBits
    testBit = testBit . toPrimitive
    bit = fromPrimitive . bit

  export
  Eq CXLoadDiag_Error where
    (==) x y = (toPrimitive x) == (toPrimitive y)

namespace CXDiagnosticDisplayOptions
  public export
  Prim_CXDiagnosticDisplayOptions : Type
  Prim_CXDiagnosticDisplayOptions = Bits32

  public export
  data CXDiagnosticDisplayOptions
    = Other Prim_CXDiagnosticDisplayOptions
    | CXDiagnostic_DisplayCategoryName
    | CXDiagnostic_DisplayCategoryId
    | CXDiagnostic_DisplayOption
    | CXDiagnostic_DisplaySourceRanges
    | CXDiagnostic_DisplayColumn
    | CXDiagnostic_DisplaySourceLocation

  export
  Cast CXDiagnosticDisplayOptions Prim_CXDiagnosticDisplayOptions where
    cast CXDiagnostic_DisplayCategoryName = (32)
    cast CXDiagnostic_DisplayCategoryId = (16)
    cast CXDiagnostic_DisplayOption = (8)
    cast CXDiagnostic_DisplaySourceRanges = (4)
    cast CXDiagnostic_DisplayColumn = (2)
    cast CXDiagnostic_DisplaySourceLocation = (1)
    cast (Other m) = m


  export
  toPrimitive : CXDiagnosticDisplayOptions -> Prim_CXDiagnosticDisplayOptions
  toPrimitive x = cast x

  export
  Cast Prim_CXDiagnosticDisplayOptions CXDiagnosticDisplayOptions where
    cast (32) = CXDiagnostic_DisplayCategoryName
    cast (16) = CXDiagnostic_DisplayCategoryId
    cast (8) = CXDiagnostic_DisplayOption
    cast (4) = CXDiagnostic_DisplaySourceRanges
    cast (2) = CXDiagnostic_DisplayColumn
    cast (1) = CXDiagnostic_DisplaySourceLocation
    cast m = (Other m)


  export
  fromPrimitive : Prim_CXDiagnosticDisplayOptions -> CXDiagnosticDisplayOptions
  fromPrimitive x = cast x

  export
  Bits CXDiagnosticDisplayOptions where
    Index = Index @{the (Bits Bits32) %search}
    (.&.) x y = fromPrimitive $ (toPrimitive x) .&. (toPrimitive y)
    (.|.) x y = fromPrimitive $ (toPrimitive x) .|. (toPrimitive y)
    xor x y = fromPrimitive $ xor (toPrimitive x) (toPrimitive y)
    shiftL x y = fromPrimitive $ shiftL (toPrimitive x) y
    shiftR x y = fromPrimitive $ shiftR (toPrimitive x) y
    zeroBits = fromPrimitive $ zeroBits
    testBit = testBit . toPrimitive
    bit = fromPrimitive . bit

  export
  Eq CXDiagnosticDisplayOptions where
    (==) x y = (toPrimitive x) == (toPrimitive y)

namespace CXAvailabilityKind
  public export
  Prim_CXAvailabilityKind : Type
  Prim_CXAvailabilityKind = Bits32

  public export
  data CXAvailabilityKind
    = Other Prim_CXAvailabilityKind
    | CXAvailability_NotAccessible
    | CXAvailability_NotAvailable
    | CXAvailability_Deprecated
    | CXAvailability_Available

  export
  Cast CXAvailabilityKind Prim_CXAvailabilityKind where
    cast CXAvailability_NotAccessible = (3)
    cast CXAvailability_NotAvailable = (2)
    cast CXAvailability_Deprecated = (1)
    cast CXAvailability_Available = (0)
    cast (Other m) = m


  export
  toPrimitive : CXAvailabilityKind -> Prim_CXAvailabilityKind
  toPrimitive x = cast x

  export
  Cast Prim_CXAvailabilityKind CXAvailabilityKind where
    cast (3) = CXAvailability_NotAccessible
    cast (2) = CXAvailability_NotAvailable
    cast (1) = CXAvailability_Deprecated
    cast (0) = CXAvailability_Available
    cast m = (Other m)


  export
  fromPrimitive : Prim_CXAvailabilityKind -> CXAvailabilityKind
  fromPrimitive x = cast x

  export
  Bits CXAvailabilityKind where
    Index = Index @{the (Bits Bits32) %search}
    (.&.) x y = fromPrimitive $ (toPrimitive x) .&. (toPrimitive y)
    (.|.) x y = fromPrimitive $ (toPrimitive x) .|. (toPrimitive y)
    xor x y = fromPrimitive $ xor (toPrimitive x) (toPrimitive y)
    shiftL x y = fromPrimitive $ shiftL (toPrimitive x) y
    shiftR x y = fromPrimitive $ shiftR (toPrimitive x) y
    zeroBits = fromPrimitive $ zeroBits
    testBit = testBit . toPrimitive
    bit = fromPrimitive . bit

  export
  Eq CXAvailabilityKind where
    (==) x y = (toPrimitive x) == (toPrimitive y)

namespace CXCursor_ExceptionSpecificationKind
  public export
  Prim_CXCursor_ExceptionSpecificationKind : Type
  Prim_CXCursor_ExceptionSpecificationKind = Bits32

  public export
  data CXCursor_ExceptionSpecificationKind
    = Other Prim_CXCursor_ExceptionSpecificationKind
    | CXCursor_ExceptionSpecificationKind_NoThrow
    | CXCursor_ExceptionSpecificationKind_Unparsed
    | CXCursor_ExceptionSpecificationKind_Uninstantiated
    | CXCursor_ExceptionSpecificationKind_Unevaluated
    | CXCursor_ExceptionSpecificationKind_ComputedNoexcept
    | CXCursor_ExceptionSpecificationKind_BasicNoexcept
    | CXCursor_ExceptionSpecificationKind_MSAny
    | CXCursor_ExceptionSpecificationKind_Dynamic
    | CXCursor_ExceptionSpecificationKind_DynamicNone
    | CXCursor_ExceptionSpecificationKind_None

  export
  Cast CXCursor_ExceptionSpecificationKind Prim_CXCursor_ExceptionSpecificationKind where
    cast CXCursor_ExceptionSpecificationKind_NoThrow = (9)
    cast CXCursor_ExceptionSpecificationKind_Unparsed = (8)
    cast CXCursor_ExceptionSpecificationKind_Uninstantiated = (7)
    cast CXCursor_ExceptionSpecificationKind_Unevaluated = (6)
    cast CXCursor_ExceptionSpecificationKind_ComputedNoexcept = (5)
    cast CXCursor_ExceptionSpecificationKind_BasicNoexcept = (4)
    cast CXCursor_ExceptionSpecificationKind_MSAny = (3)
    cast CXCursor_ExceptionSpecificationKind_Dynamic = (2)
    cast CXCursor_ExceptionSpecificationKind_DynamicNone = (1)
    cast CXCursor_ExceptionSpecificationKind_None = (0)
    cast (Other m) = m


  export
  toPrimitive : CXCursor_ExceptionSpecificationKind -> Prim_CXCursor_ExceptionSpecificationKind
  toPrimitive x = cast x

  export
  Cast Prim_CXCursor_ExceptionSpecificationKind CXCursor_ExceptionSpecificationKind where
    cast (9) = CXCursor_ExceptionSpecificationKind_NoThrow
    cast (8) = CXCursor_ExceptionSpecificationKind_Unparsed
    cast (7) = CXCursor_ExceptionSpecificationKind_Uninstantiated
    cast (6) = CXCursor_ExceptionSpecificationKind_Unevaluated
    cast (5) = CXCursor_ExceptionSpecificationKind_ComputedNoexcept
    cast (4) = CXCursor_ExceptionSpecificationKind_BasicNoexcept
    cast (3) = CXCursor_ExceptionSpecificationKind_MSAny
    cast (2) = CXCursor_ExceptionSpecificationKind_Dynamic
    cast (1) = CXCursor_ExceptionSpecificationKind_DynamicNone
    cast (0) = CXCursor_ExceptionSpecificationKind_None
    cast m = (Other m)


  export
  fromPrimitive : Prim_CXCursor_ExceptionSpecificationKind -> CXCursor_ExceptionSpecificationKind
  fromPrimitive x = cast x

  export
  Bits CXCursor_ExceptionSpecificationKind where
    Index = Index @{the (Bits Bits32) %search}
    (.&.) x y = fromPrimitive $ (toPrimitive x) .&. (toPrimitive y)
    (.|.) x y = fromPrimitive $ (toPrimitive x) .|. (toPrimitive y)
    xor x y = fromPrimitive $ xor (toPrimitive x) (toPrimitive y)
    shiftL x y = fromPrimitive $ shiftL (toPrimitive x) y
    shiftR x y = fromPrimitive $ shiftR (toPrimitive x) y
    zeroBits = fromPrimitive $ zeroBits
    testBit = testBit . toPrimitive
    bit = fromPrimitive . bit

  export
  Eq CXCursor_ExceptionSpecificationKind where
    (==) x y = (toPrimitive x) == (toPrimitive y)

namespace CXChoice
  public export
  Prim_CXChoice : Type
  Prim_CXChoice = Bits32

  public export
  data CXChoice
    = Other Prim_CXChoice
    | CXChoice_Disabled
    | CXChoice_Enabled
    | CXChoice_Default

  export
  Cast CXChoice Prim_CXChoice where
    cast CXChoice_Disabled = (2)
    cast CXChoice_Enabled = (1)
    cast CXChoice_Default = (0)
    cast (Other m) = m


  export
  toPrimitive : CXChoice -> Prim_CXChoice
  toPrimitive x = cast x

  export
  Cast Prim_CXChoice CXChoice where
    cast (2) = CXChoice_Disabled
    cast (1) = CXChoice_Enabled
    cast (0) = CXChoice_Default
    cast m = (Other m)


  export
  fromPrimitive : Prim_CXChoice -> CXChoice
  fromPrimitive x = cast x

  export
  Bits CXChoice where
    Index = Index @{the (Bits Bits32) %search}
    (.&.) x y = fromPrimitive $ (toPrimitive x) .&. (toPrimitive y)
    (.|.) x y = fromPrimitive $ (toPrimitive x) .|. (toPrimitive y)
    xor x y = fromPrimitive $ xor (toPrimitive x) (toPrimitive y)
    shiftL x y = fromPrimitive $ shiftL (toPrimitive x) y
    shiftR x y = fromPrimitive $ shiftR (toPrimitive x) y
    zeroBits = fromPrimitive $ zeroBits
    testBit = testBit . toPrimitive
    bit = fromPrimitive . bit

  export
  Eq CXChoice where
    (==) x y = (toPrimitive x) == (toPrimitive y)

namespace CXGlobalOptFlags
  public export
  Prim_CXGlobalOptFlags : Type
  Prim_CXGlobalOptFlags = Bits32

  public export
  data CXGlobalOptFlags
    = Other Prim_CXGlobalOptFlags
    | CXGlobalOpt_ThreadBackgroundPriorityForAll
    | CXGlobalOpt_ThreadBackgroundPriorityForEditing
    | CXGlobalOpt_ThreadBackgroundPriorityForIndexing
    | CXGlobalOpt_None

  export
  Cast CXGlobalOptFlags Prim_CXGlobalOptFlags where
    cast CXGlobalOpt_ThreadBackgroundPriorityForAll = (3)
    cast CXGlobalOpt_ThreadBackgroundPriorityForEditing = (2)
    cast CXGlobalOpt_ThreadBackgroundPriorityForIndexing = (1)
    cast CXGlobalOpt_None = (0)
    cast (Other m) = m


  export
  toPrimitive : CXGlobalOptFlags -> Prim_CXGlobalOptFlags
  toPrimitive x = cast x

  export
  Cast Prim_CXGlobalOptFlags CXGlobalOptFlags where
    cast (3) = CXGlobalOpt_ThreadBackgroundPriorityForAll
    cast (2) = CXGlobalOpt_ThreadBackgroundPriorityForEditing
    cast (1) = CXGlobalOpt_ThreadBackgroundPriorityForIndexing
    cast (0) = CXGlobalOpt_None
    cast m = (Other m)


  export
  fromPrimitive : Prim_CXGlobalOptFlags -> CXGlobalOptFlags
  fromPrimitive x = cast x

  export
  Bits CXGlobalOptFlags where
    Index = Index @{the (Bits Bits32) %search}
    (.&.) x y = fromPrimitive $ (toPrimitive x) .&. (toPrimitive y)
    (.|.) x y = fromPrimitive $ (toPrimitive x) .|. (toPrimitive y)
    xor x y = fromPrimitive $ xor (toPrimitive x) (toPrimitive y)
    shiftL x y = fromPrimitive $ shiftL (toPrimitive x) y
    shiftR x y = fromPrimitive $ shiftR (toPrimitive x) y
    zeroBits = fromPrimitive $ zeroBits
    testBit = testBit . toPrimitive
    bit = fromPrimitive . bit

  export
  Eq CXGlobalOptFlags where
    (==) x y = (toPrimitive x) == (toPrimitive y)

namespace CXTranslationUnit_Flags
  public export
  Prim_CXTranslationUnit_Flags : Type
  Prim_CXTranslationUnit_Flags = Bits32

  public export
  data CXTranslationUnit_Flags
    = Other Prim_CXTranslationUnit_Flags
    | CXTranslationUnit_RetainExcludedConditionalBlocks
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

  export
  Cast CXTranslationUnit_Flags Prim_CXTranslationUnit_Flags where
    cast CXTranslationUnit_RetainExcludedConditionalBlocks = (32768)
    cast CXTranslationUnit_IgnoreNonErrorsFromIncludedFiles = (16384)
    cast CXTranslationUnit_VisitImplicitAttributes = (8192)
    cast CXTranslationUnit_IncludeAttributedTypes = (4096)
    cast CXTranslationUnit_LimitSkipFunctionBodiesToPreamble = (2048)
    cast CXTranslationUnit_SingleFileParse = (1024)
    cast CXTranslationUnit_KeepGoing = (512)
    cast CXTranslationUnit_CreatePreambleOnFirstParse = (256)
    cast CXTranslationUnit_IncludeBriefCommentsInCodeCompletion = (128)
    cast CXTranslationUnit_SkipFunctionBodies = (64)
    cast CXTranslationUnit_CXXChainedPCH = (32)
    cast CXTranslationUnit_ForSerialization = (16)
    cast CXTranslationUnit_CacheCompletionResults = (8)
    cast CXTranslationUnit_PrecompiledPreamble = (4)
    cast CXTranslationUnit_Incomplete = (2)
    cast CXTranslationUnit_DetailedPreprocessingRecord = (1)
    cast CXTranslationUnit_None = (0)
    cast (Other m) = m


  export
  toPrimitive : CXTranslationUnit_Flags -> Prim_CXTranslationUnit_Flags
  toPrimitive x = cast x

  export
  Cast Prim_CXTranslationUnit_Flags CXTranslationUnit_Flags where
    cast (32768) = CXTranslationUnit_RetainExcludedConditionalBlocks
    cast (16384) = CXTranslationUnit_IgnoreNonErrorsFromIncludedFiles
    cast (8192) = CXTranslationUnit_VisitImplicitAttributes
    cast (4096) = CXTranslationUnit_IncludeAttributedTypes
    cast (2048) = CXTranslationUnit_LimitSkipFunctionBodiesToPreamble
    cast (1024) = CXTranslationUnit_SingleFileParse
    cast (512) = CXTranslationUnit_KeepGoing
    cast (256) = CXTranslationUnit_CreatePreambleOnFirstParse
    cast (128) = CXTranslationUnit_IncludeBriefCommentsInCodeCompletion
    cast (64) = CXTranslationUnit_SkipFunctionBodies
    cast (32) = CXTranslationUnit_CXXChainedPCH
    cast (16) = CXTranslationUnit_ForSerialization
    cast (8) = CXTranslationUnit_CacheCompletionResults
    cast (4) = CXTranslationUnit_PrecompiledPreamble
    cast (2) = CXTranslationUnit_Incomplete
    cast (1) = CXTranslationUnit_DetailedPreprocessingRecord
    cast (0) = CXTranslationUnit_None
    cast m = (Other m)


  export
  fromPrimitive : Prim_CXTranslationUnit_Flags -> CXTranslationUnit_Flags
  fromPrimitive x = cast x

  export
  Bits CXTranslationUnit_Flags where
    Index = Index @{the (Bits Bits32) %search}
    (.&.) x y = fromPrimitive $ (toPrimitive x) .&. (toPrimitive y)
    (.|.) x y = fromPrimitive $ (toPrimitive x) .|. (toPrimitive y)
    xor x y = fromPrimitive $ xor (toPrimitive x) (toPrimitive y)
    shiftL x y = fromPrimitive $ shiftL (toPrimitive x) y
    shiftR x y = fromPrimitive $ shiftR (toPrimitive x) y
    zeroBits = fromPrimitive $ zeroBits
    testBit = testBit . toPrimitive
    bit = fromPrimitive . bit

  export
  Eq CXTranslationUnit_Flags where
    (==) x y = (toPrimitive x) == (toPrimitive y)

namespace CXSaveTranslationUnit_Flags
  public export
  Prim_CXSaveTranslationUnit_Flags : Type
  Prim_CXSaveTranslationUnit_Flags = Bits32

  public export
  data CXSaveTranslationUnit_Flags
    = Other Prim_CXSaveTranslationUnit_Flags
    | CXSaveTranslationUnit_None

  export
  Cast CXSaveTranslationUnit_Flags Prim_CXSaveTranslationUnit_Flags where
    cast CXSaveTranslationUnit_None = (0)
    cast (Other m) = m


  export
  toPrimitive : CXSaveTranslationUnit_Flags -> Prim_CXSaveTranslationUnit_Flags
  toPrimitive x = cast x

  export
  Cast Prim_CXSaveTranslationUnit_Flags CXSaveTranslationUnit_Flags where
    cast (0) = CXSaveTranslationUnit_None
    cast m = (Other m)


  export
  fromPrimitive : Prim_CXSaveTranslationUnit_Flags -> CXSaveTranslationUnit_Flags
  fromPrimitive x = cast x

  export
  Bits CXSaveTranslationUnit_Flags where
    Index = Index @{the (Bits Bits32) %search}
    (.&.) x y = fromPrimitive $ (toPrimitive x) .&. (toPrimitive y)
    (.|.) x y = fromPrimitive $ (toPrimitive x) .|. (toPrimitive y)
    xor x y = fromPrimitive $ xor (toPrimitive x) (toPrimitive y)
    shiftL x y = fromPrimitive $ shiftL (toPrimitive x) y
    shiftR x y = fromPrimitive $ shiftR (toPrimitive x) y
    zeroBits = fromPrimitive $ zeroBits
    testBit = testBit . toPrimitive
    bit = fromPrimitive . bit

  export
  Eq CXSaveTranslationUnit_Flags where
    (==) x y = (toPrimitive x) == (toPrimitive y)

namespace CXSaveError
  public export
  Prim_CXSaveError : Type
  Prim_CXSaveError = Bits32

  public export
  data CXSaveError
    = Other Prim_CXSaveError
    | CXSaveError_InvalidTU
    | CXSaveError_TranslationErrors
    | CXSaveError_Unknown
    | CXSaveError_None

  export
  Cast CXSaveError Prim_CXSaveError where
    cast CXSaveError_InvalidTU = (3)
    cast CXSaveError_TranslationErrors = (2)
    cast CXSaveError_Unknown = (1)
    cast CXSaveError_None = (0)
    cast (Other m) = m


  export
  toPrimitive : CXSaveError -> Prim_CXSaveError
  toPrimitive x = cast x

  export
  Cast Prim_CXSaveError CXSaveError where
    cast (3) = CXSaveError_InvalidTU
    cast (2) = CXSaveError_TranslationErrors
    cast (1) = CXSaveError_Unknown
    cast (0) = CXSaveError_None
    cast m = (Other m)


  export
  fromPrimitive : Prim_CXSaveError -> CXSaveError
  fromPrimitive x = cast x

  export
  Bits CXSaveError where
    Index = Index @{the (Bits Bits32) %search}
    (.&.) x y = fromPrimitive $ (toPrimitive x) .&. (toPrimitive y)
    (.|.) x y = fromPrimitive $ (toPrimitive x) .|. (toPrimitive y)
    xor x y = fromPrimitive $ xor (toPrimitive x) (toPrimitive y)
    shiftL x y = fromPrimitive $ shiftL (toPrimitive x) y
    shiftR x y = fromPrimitive $ shiftR (toPrimitive x) y
    zeroBits = fromPrimitive $ zeroBits
    testBit = testBit . toPrimitive
    bit = fromPrimitive . bit

  export
  Eq CXSaveError where
    (==) x y = (toPrimitive x) == (toPrimitive y)

namespace CXReparse_Flags
  public export
  Prim_CXReparse_Flags : Type
  Prim_CXReparse_Flags = Bits32

  public export
  data CXReparse_Flags
    = Other Prim_CXReparse_Flags
    | CXReparse_None

  export
  Cast CXReparse_Flags Prim_CXReparse_Flags where
    cast CXReparse_None = (0)
    cast (Other m) = m


  export
  toPrimitive : CXReparse_Flags -> Prim_CXReparse_Flags
  toPrimitive x = cast x

  export
  Cast Prim_CXReparse_Flags CXReparse_Flags where
    cast (0) = CXReparse_None
    cast m = (Other m)


  export
  fromPrimitive : Prim_CXReparse_Flags -> CXReparse_Flags
  fromPrimitive x = cast x

  export
  Bits CXReparse_Flags where
    Index = Index @{the (Bits Bits32) %search}
    (.&.) x y = fromPrimitive $ (toPrimitive x) .&. (toPrimitive y)
    (.|.) x y = fromPrimitive $ (toPrimitive x) .|. (toPrimitive y)
    xor x y = fromPrimitive $ xor (toPrimitive x) (toPrimitive y)
    shiftL x y = fromPrimitive $ shiftL (toPrimitive x) y
    shiftR x y = fromPrimitive $ shiftR (toPrimitive x) y
    zeroBits = fromPrimitive $ zeroBits
    testBit = testBit . toPrimitive
    bit = fromPrimitive . bit

  export
  Eq CXReparse_Flags where
    (==) x y = (toPrimitive x) == (toPrimitive y)

namespace CXTUResourceUsageKind
  public export
  Prim_CXTUResourceUsageKind : Type
  Prim_CXTUResourceUsageKind = Bits32

  public export
  data CXTUResourceUsageKind
    = Other Prim_CXTUResourceUsageKind
    | CXTUResourceUsage_Last
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

  export
  Cast CXTUResourceUsageKind Prim_CXTUResourceUsageKind where
    cast CXTUResourceUsage_Last = (14)
    cast CXTUResourceUsage_First = (1)
    cast CXTUResourceUsage_MEMORY_IN_BYTES_END = (14)
    cast CXTUResourceUsage_MEMORY_IN_BYTES_BEGIN = (1)
    cast CXTUResourceUsage_Preprocessor_HeaderSearch = (14)
    cast CXTUResourceUsage_SourceManager_DataStructures = (13)
    cast CXTUResourceUsage_PreprocessingRecord = (12)
    cast CXTUResourceUsage_Preprocessor = (11)
    cast CXTUResourceUsage_ExternalASTSource_Membuffer_MMap = (10)
    cast CXTUResourceUsage_ExternalASTSource_Membuffer_Malloc = (9)
    cast CXTUResourceUsage_SourceManager_Membuffer_MMap = (8)
    cast CXTUResourceUsage_SourceManager_Membuffer_Malloc = (7)
    cast CXTUResourceUsage_AST_SideTables = (6)
    cast CXTUResourceUsage_SourceManagerContentCache = (5)
    cast CXTUResourceUsage_GlobalCompletionResults = (4)
    cast CXTUResourceUsage_Selectors = (3)
    cast CXTUResourceUsage_Identifiers = (2)
    cast CXTUResourceUsage_AST = (1)
    cast (Other m) = m


  export
  toPrimitive : CXTUResourceUsageKind -> Prim_CXTUResourceUsageKind
  toPrimitive x = cast x

  export
  Cast Prim_CXTUResourceUsageKind CXTUResourceUsageKind where
    cast (14) = CXTUResourceUsage_Last
    cast (1) = CXTUResourceUsage_First
    cast (14) = CXTUResourceUsage_MEMORY_IN_BYTES_END
    cast (1) = CXTUResourceUsage_MEMORY_IN_BYTES_BEGIN
    cast (14) = CXTUResourceUsage_Preprocessor_HeaderSearch
    cast (13) = CXTUResourceUsage_SourceManager_DataStructures
    cast (12) = CXTUResourceUsage_PreprocessingRecord
    cast (11) = CXTUResourceUsage_Preprocessor
    cast (10) = CXTUResourceUsage_ExternalASTSource_Membuffer_MMap
    cast (9) = CXTUResourceUsage_ExternalASTSource_Membuffer_Malloc
    cast (8) = CXTUResourceUsage_SourceManager_Membuffer_MMap
    cast (7) = CXTUResourceUsage_SourceManager_Membuffer_Malloc
    cast (6) = CXTUResourceUsage_AST_SideTables
    cast (5) = CXTUResourceUsage_SourceManagerContentCache
    cast (4) = CXTUResourceUsage_GlobalCompletionResults
    cast (3) = CXTUResourceUsage_Selectors
    cast (2) = CXTUResourceUsage_Identifiers
    cast (1) = CXTUResourceUsage_AST
    cast m = (Other m)


  export
  fromPrimitive : Prim_CXTUResourceUsageKind -> CXTUResourceUsageKind
  fromPrimitive x = cast x

  export
  Bits CXTUResourceUsageKind where
    Index = Index @{the (Bits Bits32) %search}
    (.&.) x y = fromPrimitive $ (toPrimitive x) .&. (toPrimitive y)
    (.|.) x y = fromPrimitive $ (toPrimitive x) .|. (toPrimitive y)
    xor x y = fromPrimitive $ xor (toPrimitive x) (toPrimitive y)
    shiftL x y = fromPrimitive $ shiftL (toPrimitive x) y
    shiftR x y = fromPrimitive $ shiftR (toPrimitive x) y
    zeroBits = fromPrimitive $ zeroBits
    testBit = testBit . toPrimitive
    bit = fromPrimitive . bit

  export
  Eq CXTUResourceUsageKind where
    (==) x y = (toPrimitive x) == (toPrimitive y)

namespace CXCursorKind
  public export
  Prim_CXCursorKind : Type
  Prim_CXCursorKind = Bits32

  public export
  data CXCursorKind
    = Other Prim_CXCursorKind
    | CXCursor_OverloadCandidate
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

  export
  Cast CXCursorKind Prim_CXCursorKind where
    cast CXCursor_OverloadCandidate = (700)
    cast CXCursor_LastExtraDecl = (604)
    cast CXCursor_FirstExtraDecl = (600)
    cast CXCursor_ConceptDecl = (604)
    cast CXCursor_FriendDecl = (603)
    cast CXCursor_StaticAssert = (602)
    cast CXCursor_TypeAliasTemplateDecl = (601)
    cast CXCursor_ModuleImportDecl = (600)
    cast CXCursor_LastPreprocessing = (503)
    cast CXCursor_FirstPreprocessing = (500)
    cast CXCursor_InclusionDirective = (503)
    cast CXCursor_MacroInstantiation = (502)
    cast CXCursor_MacroExpansion = (502)
    cast CXCursor_MacroDefinition = (501)
    cast CXCursor_PreprocessingDirective = (500)
    cast CXCursor_LastAttr = (441)
    cast CXCursor_AlignedAttr = (441)
    cast CXCursor_WarnUnusedResultAttr = (440)
    cast CXCursor_WarnUnusedAttr = (439)
    cast CXCursor_ConvergentAttr = (438)
    cast CXCursor_FlagEnum = (437)
    cast CXCursor_ObjCBoxable = (436)
    cast CXCursor_ObjCRuntimeVisible = (435)
    cast CXCursor_ObjCDesignatedInitializer = (434)
    cast CXCursor_ObjCExplicitProtocolImpl = (433)
    cast CXCursor_ObjCSubclassingRestricted = (432)
    cast CXCursor_ObjCRootClass = (431)
    cast CXCursor_ObjCRequiresSuper = (430)
    cast CXCursor_ObjCReturnsInnerPointer = (429)
    cast CXCursor_ObjCPreciseLifetime = (428)
    cast CXCursor_ObjCIndependentClass = (427)
    cast CXCursor_ObjCNSObject = (426)
    cast CXCursor_ObjCException = (425)
    cast CXCursor_NSConsumed = (424)
    cast CXCursor_NSConsumesSelf = (423)
    cast CXCursor_NSReturnsAutoreleased = (422)
    cast CXCursor_NSReturnsNotRetained = (421)
    cast CXCursor_NSReturnsRetained = (420)
    cast CXCursor_DLLImport = (419)
    cast CXCursor_DLLExport = (418)
    cast CXCursor_VisibilityAttr = (417)
    cast CXCursor_CUDASharedAttr = (416)
    cast CXCursor_CUDAHostAttr = (415)
    cast CXCursor_CUDAGlobalAttr = (414)
    cast CXCursor_CUDADeviceAttr = (413)
    cast CXCursor_CUDAConstantAttr = (412)
    cast CXCursor_NoDuplicateAttr = (411)
    cast CXCursor_ConstAttr = (410)
    cast CXCursor_PureAttr = (409)
    cast CXCursor_PackedAttr = (408)
    cast CXCursor_AsmLabelAttr = (407)
    cast CXCursor_AnnotateAttr = (406)
    cast CXCursor_CXXOverrideAttr = (405)
    cast CXCursor_CXXFinalAttr = (404)
    cast CXCursor_IBOutletCollectionAttr = (403)
    cast CXCursor_IBOutletAttr = (402)
    cast CXCursor_IBActionAttr = (401)
    cast CXCursor_UnexposedAttr = (400)
    cast CXCursor_FirstAttr = (400)
    cast CXCursor_TranslationUnit = (350)
    cast CXCursor_LastStmt = (305)
    cast CXCursor_OMPErrorDirective = (305)
    cast CXCursor_OMPParallelMaskedTaskLoopSimdDirective = (304)
    cast CXCursor_OMPParallelMaskedTaskLoopDirective = (303)
    cast CXCursor_OMPMaskedTaskLoopSimdDirective = (302)
    cast CXCursor_OMPMaskedTaskLoopDirective = (301)
    cast CXCursor_OMPParallelMaskedDirective = (300)
    cast CXCursor_OMPTargetParallelGenericLoopDirective = (299)
    cast CXCursor_OMPParallelGenericLoopDirective = (298)
    cast CXCursor_OMPTargetTeamsGenericLoopDirective = (297)
    cast CXCursor_OMPTeamsGenericLoopDirective = (296)
    cast CXCursor_OMPGenericLoopDirective = (295)
    cast CXCursor_OMPMetaDirective = (294)
    cast CXCursor_OMPUnrollDirective = (293)
    cast CXCursor_OMPMaskedDirective = (292)
    cast CXCursor_OMPDispatchDirective = (291)
    cast CXCursor_OMPInteropDirective = (290)
    cast CXCursor_OMPCanonicalLoop = (289)
    cast CXCursor_OMPTileDirective = (288)
    cast CXCursor_OMPScanDirective = (287)
    cast CXCursor_OMPDepobjDirective = (286)
    cast CXCursor_OMPParallelMasterDirective = (285)
    cast CXCursor_OMPParallelMasterTaskLoopSimdDirective = (284)
    cast CXCursor_OMPMasterTaskLoopSimdDirective = (283)
    cast CXCursor_OMPParallelMasterTaskLoopDirective = (282)
    cast CXCursor_OMPMasterTaskLoopDirective = (281)
    cast CXCursor_BuiltinBitCastExpr = (280)
    cast CXCursor_OMPTargetTeamsDistributeSimdDirective = (279)
    cast CXCursor_OMPTargetTeamsDistributeParallelForSimdDirective = (278)
    cast CXCursor_OMPTargetTeamsDistributeParallelForDirective = (277)
    cast CXCursor_OMPTargetTeamsDistributeDirective = (276)
    cast CXCursor_OMPTargetTeamsDirective = (275)
    cast CXCursor_OMPTeamsDistributeParallelForDirective = (274)
    cast CXCursor_OMPTeamsDistributeParallelForSimdDirective = (273)
    cast CXCursor_OMPTeamsDistributeSimdDirective = (272)
    cast CXCursor_OMPTeamsDistributeDirective = (271)
    cast CXCursor_OMPTargetSimdDirective = (270)
    cast CXCursor_OMPTargetParallelForSimdDirective = (269)
    cast CXCursor_OMPDistributeSimdDirective = (268)
    cast CXCursor_OMPDistributeParallelForSimdDirective = (267)
    cast CXCursor_OMPDistributeParallelForDirective = (266)
    cast CXCursor_OMPTargetUpdateDirective = (265)
    cast CXCursor_OMPTargetParallelForDirective = (264)
    cast CXCursor_OMPTargetParallelDirective = (263)
    cast CXCursor_OMPTargetExitDataDirective = (262)
    cast CXCursor_OMPTargetEnterDataDirective = (261)
    cast CXCursor_OMPDistributeDirective = (260)
    cast CXCursor_OMPTaskLoopSimdDirective = (259)
    cast CXCursor_OMPTaskLoopDirective = (258)
    cast CXCursor_OMPTargetDataDirective = (257)
    cast CXCursor_OMPCancelDirective = (256)
    cast CXCursor_OMPCancellationPointDirective = (255)
    cast CXCursor_OMPTaskgroupDirective = (254)
    cast CXCursor_OMPTeamsDirective = (253)
    cast CXCursor_OMPTargetDirective = (252)
    cast CXCursor_OMPParallelForSimdDirective = (251)
    cast CXCursor_OMPForSimdDirective = (250)
    cast CXCursor_OMPAtomicDirective = (249)
    cast CXCursor_OMPOrderedDirective = (248)
    cast CXCursor_SEHLeaveStmt = (247)
    cast CXCursor_OMPFlushDirective = (246)
    cast CXCursor_OMPTaskwaitDirective = (245)
    cast CXCursor_OMPBarrierDirective = (244)
    cast CXCursor_OMPTaskyieldDirective = (243)
    cast CXCursor_OMPCriticalDirective = (242)
    cast CXCursor_OMPMasterDirective = (241)
    cast CXCursor_OMPTaskDirective = (240)
    cast CXCursor_OMPParallelSectionsDirective = (239)
    cast CXCursor_OMPParallelForDirective = (238)
    cast CXCursor_OMPSingleDirective = (237)
    cast CXCursor_OMPSectionDirective = (236)
    cast CXCursor_OMPSectionsDirective = (235)
    cast CXCursor_OMPForDirective = (234)
    cast CXCursor_OMPSimdDirective = (233)
    cast CXCursor_OMPParallelDirective = (232)
    cast CXCursor_DeclStmt = (231)
    cast CXCursor_NullStmt = (230)
    cast CXCursor_MSAsmStmt = (229)
    cast CXCursor_SEHFinallyStmt = (228)
    cast CXCursor_SEHExceptStmt = (227)
    cast CXCursor_SEHTryStmt = (226)
    cast CXCursor_CXXForRangeStmt = (225)
    cast CXCursor_CXXTryStmt = (224)
    cast CXCursor_CXXCatchStmt = (223)
    cast CXCursor_ObjCForCollectionStmt = (222)
    cast CXCursor_ObjCAutoreleasePoolStmt = (221)
    cast CXCursor_ObjCAtSynchronizedStmt = (220)
    cast CXCursor_ObjCAtThrowStmt = (219)
    cast CXCursor_ObjCAtFinallyStmt = (218)
    cast CXCursor_ObjCAtCatchStmt = (217)
    cast CXCursor_ObjCAtTryStmt = (216)
    cast CXCursor_AsmStmt = (215)
    cast CXCursor_GCCAsmStmt = (215)
    cast CXCursor_ReturnStmt = (214)
    cast CXCursor_BreakStmt = (213)
    cast CXCursor_ContinueStmt = (212)
    cast CXCursor_IndirectGotoStmt = (211)
    cast CXCursor_GotoStmt = (210)
    cast CXCursor_ForStmt = (209)
    cast CXCursor_DoStmt = (208)
    cast CXCursor_WhileStmt = (207)
    cast CXCursor_SwitchStmt = (206)
    cast CXCursor_IfStmt = (205)
    cast CXCursor_DefaultStmt = (204)
    cast CXCursor_CaseStmt = (203)
    cast CXCursor_CompoundStmt = (202)
    cast CXCursor_LabelStmt = (201)
    cast CXCursor_UnexposedStmt = (200)
    cast CXCursor_FirstStmt = (200)
    cast CXCursor_LastExpr = (155)
    cast CXCursor_CXXParenListInitExpr = (155)
    cast CXCursor_RequiresExpr = (154)
    cast CXCursor_ConceptSpecializationExpr = (153)
    cast CXCursor_CXXAddrspaceCastExpr = (152)
    cast CXCursor_OMPIteratorExpr = (151)
    cast CXCursor_OMPArrayShapingExpr = (150)
    cast CXCursor_FixedPointLiteral = (149)
    cast CXCursor_ObjCAvailabilityCheckExpr = (148)
    cast CXCursor_OMPArraySectionExpr = (147)
    cast CXCursor_ObjCSelfExpr = (146)
    cast CXCursor_ObjCBoolLiteralExpr = (145)
    cast CXCursor_LambdaExpr = (144)
    cast CXCursor_SizeOfPackExpr = (143)
    cast CXCursor_PackExpansionExpr = (142)
    cast CXCursor_ObjCBridgedCastExpr = (141)
    cast CXCursor_ObjCProtocolExpr = (140)
    cast CXCursor_ObjCSelectorExpr = (139)
    cast CXCursor_ObjCEncodeExpr = (138)
    cast CXCursor_ObjCStringLiteral = (137)
    cast CXCursor_UnaryExpr = (136)
    cast CXCursor_CXXDeleteExpr = (135)
    cast CXCursor_CXXNewExpr = (134)
    cast CXCursor_CXXThrowExpr = (133)
    cast CXCursor_CXXThisExpr = (132)
    cast CXCursor_CXXNullPtrLiteralExpr = (131)
    cast CXCursor_CXXBoolLiteralExpr = (130)
    cast CXCursor_CXXTypeidExpr = (129)
    cast CXCursor_CXXFunctionalCastExpr = (128)
    cast CXCursor_CXXConstCastExpr = (127)
    cast CXCursor_CXXReinterpretCastExpr = (126)
    cast CXCursor_CXXDynamicCastExpr = (125)
    cast CXCursor_CXXStaticCastExpr = (124)
    cast CXCursor_GNUNullExpr = (123)
    cast CXCursor_GenericSelectionExpr = (122)
    cast CXCursor_StmtExpr = (121)
    cast CXCursor_AddrLabelExpr = (120)
    cast CXCursor_InitListExpr = (119)
    cast CXCursor_CompoundLiteralExpr = (118)
    cast CXCursor_CStyleCastExpr = (117)
    cast CXCursor_ConditionalOperator = (116)
    cast CXCursor_CompoundAssignOperator = (115)
    cast CXCursor_BinaryOperator = (114)
    cast CXCursor_ArraySubscriptExpr = (113)
    cast CXCursor_UnaryOperator = (112)
    cast CXCursor_ParenExpr = (111)
    cast CXCursor_CharacterLiteral = (110)
    cast CXCursor_StringLiteral = (109)
    cast CXCursor_ImaginaryLiteral = (108)
    cast CXCursor_FloatingLiteral = (107)
    cast CXCursor_IntegerLiteral = (106)
    cast CXCursor_BlockExpr = (105)
    cast CXCursor_ObjCMessageExpr = (104)
    cast CXCursor_CallExpr = (103)
    cast CXCursor_MemberRefExpr = (102)
    cast CXCursor_DeclRefExpr = (101)
    cast CXCursor_UnexposedExpr = (100)
    cast CXCursor_FirstExpr = (100)
    cast CXCursor_LastInvalid = (73)
    cast CXCursor_InvalidCode = (73)
    cast CXCursor_NotImplemented = (72)
    cast CXCursor_NoDeclFound = (71)
    cast CXCursor_InvalidFile = (70)
    cast CXCursor_FirstInvalid = (70)
    cast CXCursor_LastRef = (50)
    cast CXCursor_VariableRef = (50)
    cast CXCursor_OverloadedDeclRef = (49)
    cast CXCursor_LabelRef = (48)
    cast CXCursor_MemberRef = (47)
    cast CXCursor_NamespaceRef = (46)
    cast CXCursor_TemplateRef = (45)
    cast CXCursor_CXXBaseSpecifier = (44)
    cast CXCursor_TypeRef = (43)
    cast CXCursor_ObjCClassRef = (42)
    cast CXCursor_ObjCProtocolRef = (41)
    cast CXCursor_ObjCSuperClassRef = (40)
    cast CXCursor_FirstRef = (40)
    cast CXCursor_LastDecl = (39)
    cast CXCursor_FirstDecl = (1)
    cast CXCursor_CXXAccessSpecifier = (39)
    cast CXCursor_ObjCDynamicDecl = (38)
    cast CXCursor_ObjCSynthesizeDecl = (37)
    cast CXCursor_TypeAliasDecl = (36)
    cast CXCursor_UsingDeclaration = (35)
    cast CXCursor_UsingDirective = (34)
    cast CXCursor_NamespaceAlias = (33)
    cast CXCursor_ClassTemplatePartialSpecialization = (32)
    cast CXCursor_ClassTemplate = (31)
    cast CXCursor_FunctionTemplate = (30)
    cast CXCursor_TemplateTemplateParameter = (29)
    cast CXCursor_NonTypeTemplateParameter = (28)
    cast CXCursor_TemplateTypeParameter = (27)
    cast CXCursor_ConversionFunction = (26)
    cast CXCursor_Destructor = (25)
    cast CXCursor_Constructor = (24)
    cast CXCursor_LinkageSpec = (23)
    cast CXCursor_Namespace = (22)
    cast CXCursor_CXXMethod = (21)
    cast CXCursor_TypedefDecl = (20)
    cast CXCursor_ObjCCategoryImplDecl = (19)
    cast CXCursor_ObjCImplementationDecl = (18)
    cast CXCursor_ObjCClassMethodDecl = (17)
    cast CXCursor_ObjCInstanceMethodDecl = (16)
    cast CXCursor_ObjCIvarDecl = (15)
    cast CXCursor_ObjCPropertyDecl = (14)
    cast CXCursor_ObjCProtocolDecl = (13)
    cast CXCursor_ObjCCategoryDecl = (12)
    cast CXCursor_ObjCInterfaceDecl = (11)
    cast CXCursor_ParmDecl = (10)
    cast CXCursor_VarDecl = (9)
    cast CXCursor_FunctionDecl = (8)
    cast CXCursor_EnumConstantDecl = (7)
    cast CXCursor_FieldDecl = (6)
    cast CXCursor_EnumDecl = (5)
    cast CXCursor_ClassDecl = (4)
    cast CXCursor_UnionDecl = (3)
    cast CXCursor_StructDecl = (2)
    cast CXCursor_UnexposedDecl = (1)
    cast (Other m) = m


  export
  toPrimitive : CXCursorKind -> Prim_CXCursorKind
  toPrimitive x = cast x

  export
  Cast Prim_CXCursorKind CXCursorKind where
    cast (700) = CXCursor_OverloadCandidate
    cast (604) = CXCursor_LastExtraDecl
    cast (600) = CXCursor_FirstExtraDecl
    cast (604) = CXCursor_ConceptDecl
    cast (603) = CXCursor_FriendDecl
    cast (602) = CXCursor_StaticAssert
    cast (601) = CXCursor_TypeAliasTemplateDecl
    cast (600) = CXCursor_ModuleImportDecl
    cast (503) = CXCursor_LastPreprocessing
    cast (500) = CXCursor_FirstPreprocessing
    cast (503) = CXCursor_InclusionDirective
    cast (502) = CXCursor_MacroInstantiation
    cast (502) = CXCursor_MacroExpansion
    cast (501) = CXCursor_MacroDefinition
    cast (500) = CXCursor_PreprocessingDirective
    cast (441) = CXCursor_LastAttr
    cast (441) = CXCursor_AlignedAttr
    cast (440) = CXCursor_WarnUnusedResultAttr
    cast (439) = CXCursor_WarnUnusedAttr
    cast (438) = CXCursor_ConvergentAttr
    cast (437) = CXCursor_FlagEnum
    cast (436) = CXCursor_ObjCBoxable
    cast (435) = CXCursor_ObjCRuntimeVisible
    cast (434) = CXCursor_ObjCDesignatedInitializer
    cast (433) = CXCursor_ObjCExplicitProtocolImpl
    cast (432) = CXCursor_ObjCSubclassingRestricted
    cast (431) = CXCursor_ObjCRootClass
    cast (430) = CXCursor_ObjCRequiresSuper
    cast (429) = CXCursor_ObjCReturnsInnerPointer
    cast (428) = CXCursor_ObjCPreciseLifetime
    cast (427) = CXCursor_ObjCIndependentClass
    cast (426) = CXCursor_ObjCNSObject
    cast (425) = CXCursor_ObjCException
    cast (424) = CXCursor_NSConsumed
    cast (423) = CXCursor_NSConsumesSelf
    cast (422) = CXCursor_NSReturnsAutoreleased
    cast (421) = CXCursor_NSReturnsNotRetained
    cast (420) = CXCursor_NSReturnsRetained
    cast (419) = CXCursor_DLLImport
    cast (418) = CXCursor_DLLExport
    cast (417) = CXCursor_VisibilityAttr
    cast (416) = CXCursor_CUDASharedAttr
    cast (415) = CXCursor_CUDAHostAttr
    cast (414) = CXCursor_CUDAGlobalAttr
    cast (413) = CXCursor_CUDADeviceAttr
    cast (412) = CXCursor_CUDAConstantAttr
    cast (411) = CXCursor_NoDuplicateAttr
    cast (410) = CXCursor_ConstAttr
    cast (409) = CXCursor_PureAttr
    cast (408) = CXCursor_PackedAttr
    cast (407) = CXCursor_AsmLabelAttr
    cast (406) = CXCursor_AnnotateAttr
    cast (405) = CXCursor_CXXOverrideAttr
    cast (404) = CXCursor_CXXFinalAttr
    cast (403) = CXCursor_IBOutletCollectionAttr
    cast (402) = CXCursor_IBOutletAttr
    cast (401) = CXCursor_IBActionAttr
    cast (400) = CXCursor_UnexposedAttr
    cast (400) = CXCursor_FirstAttr
    cast (350) = CXCursor_TranslationUnit
    cast (305) = CXCursor_LastStmt
    cast (305) = CXCursor_OMPErrorDirective
    cast (304) = CXCursor_OMPParallelMaskedTaskLoopSimdDirective
    cast (303) = CXCursor_OMPParallelMaskedTaskLoopDirective
    cast (302) = CXCursor_OMPMaskedTaskLoopSimdDirective
    cast (301) = CXCursor_OMPMaskedTaskLoopDirective
    cast (300) = CXCursor_OMPParallelMaskedDirective
    cast (299) = CXCursor_OMPTargetParallelGenericLoopDirective
    cast (298) = CXCursor_OMPParallelGenericLoopDirective
    cast (297) = CXCursor_OMPTargetTeamsGenericLoopDirective
    cast (296) = CXCursor_OMPTeamsGenericLoopDirective
    cast (295) = CXCursor_OMPGenericLoopDirective
    cast (294) = CXCursor_OMPMetaDirective
    cast (293) = CXCursor_OMPUnrollDirective
    cast (292) = CXCursor_OMPMaskedDirective
    cast (291) = CXCursor_OMPDispatchDirective
    cast (290) = CXCursor_OMPInteropDirective
    cast (289) = CXCursor_OMPCanonicalLoop
    cast (288) = CXCursor_OMPTileDirective
    cast (287) = CXCursor_OMPScanDirective
    cast (286) = CXCursor_OMPDepobjDirective
    cast (285) = CXCursor_OMPParallelMasterDirective
    cast (284) = CXCursor_OMPParallelMasterTaskLoopSimdDirective
    cast (283) = CXCursor_OMPMasterTaskLoopSimdDirective
    cast (282) = CXCursor_OMPParallelMasterTaskLoopDirective
    cast (281) = CXCursor_OMPMasterTaskLoopDirective
    cast (280) = CXCursor_BuiltinBitCastExpr
    cast (279) = CXCursor_OMPTargetTeamsDistributeSimdDirective
    cast (278) = CXCursor_OMPTargetTeamsDistributeParallelForSimdDirective
    cast (277) = CXCursor_OMPTargetTeamsDistributeParallelForDirective
    cast (276) = CXCursor_OMPTargetTeamsDistributeDirective
    cast (275) = CXCursor_OMPTargetTeamsDirective
    cast (274) = CXCursor_OMPTeamsDistributeParallelForDirective
    cast (273) = CXCursor_OMPTeamsDistributeParallelForSimdDirective
    cast (272) = CXCursor_OMPTeamsDistributeSimdDirective
    cast (271) = CXCursor_OMPTeamsDistributeDirective
    cast (270) = CXCursor_OMPTargetSimdDirective
    cast (269) = CXCursor_OMPTargetParallelForSimdDirective
    cast (268) = CXCursor_OMPDistributeSimdDirective
    cast (267) = CXCursor_OMPDistributeParallelForSimdDirective
    cast (266) = CXCursor_OMPDistributeParallelForDirective
    cast (265) = CXCursor_OMPTargetUpdateDirective
    cast (264) = CXCursor_OMPTargetParallelForDirective
    cast (263) = CXCursor_OMPTargetParallelDirective
    cast (262) = CXCursor_OMPTargetExitDataDirective
    cast (261) = CXCursor_OMPTargetEnterDataDirective
    cast (260) = CXCursor_OMPDistributeDirective
    cast (259) = CXCursor_OMPTaskLoopSimdDirective
    cast (258) = CXCursor_OMPTaskLoopDirective
    cast (257) = CXCursor_OMPTargetDataDirective
    cast (256) = CXCursor_OMPCancelDirective
    cast (255) = CXCursor_OMPCancellationPointDirective
    cast (254) = CXCursor_OMPTaskgroupDirective
    cast (253) = CXCursor_OMPTeamsDirective
    cast (252) = CXCursor_OMPTargetDirective
    cast (251) = CXCursor_OMPParallelForSimdDirective
    cast (250) = CXCursor_OMPForSimdDirective
    cast (249) = CXCursor_OMPAtomicDirective
    cast (248) = CXCursor_OMPOrderedDirective
    cast (247) = CXCursor_SEHLeaveStmt
    cast (246) = CXCursor_OMPFlushDirective
    cast (245) = CXCursor_OMPTaskwaitDirective
    cast (244) = CXCursor_OMPBarrierDirective
    cast (243) = CXCursor_OMPTaskyieldDirective
    cast (242) = CXCursor_OMPCriticalDirective
    cast (241) = CXCursor_OMPMasterDirective
    cast (240) = CXCursor_OMPTaskDirective
    cast (239) = CXCursor_OMPParallelSectionsDirective
    cast (238) = CXCursor_OMPParallelForDirective
    cast (237) = CXCursor_OMPSingleDirective
    cast (236) = CXCursor_OMPSectionDirective
    cast (235) = CXCursor_OMPSectionsDirective
    cast (234) = CXCursor_OMPForDirective
    cast (233) = CXCursor_OMPSimdDirective
    cast (232) = CXCursor_OMPParallelDirective
    cast (231) = CXCursor_DeclStmt
    cast (230) = CXCursor_NullStmt
    cast (229) = CXCursor_MSAsmStmt
    cast (228) = CXCursor_SEHFinallyStmt
    cast (227) = CXCursor_SEHExceptStmt
    cast (226) = CXCursor_SEHTryStmt
    cast (225) = CXCursor_CXXForRangeStmt
    cast (224) = CXCursor_CXXTryStmt
    cast (223) = CXCursor_CXXCatchStmt
    cast (222) = CXCursor_ObjCForCollectionStmt
    cast (221) = CXCursor_ObjCAutoreleasePoolStmt
    cast (220) = CXCursor_ObjCAtSynchronizedStmt
    cast (219) = CXCursor_ObjCAtThrowStmt
    cast (218) = CXCursor_ObjCAtFinallyStmt
    cast (217) = CXCursor_ObjCAtCatchStmt
    cast (216) = CXCursor_ObjCAtTryStmt
    cast (215) = CXCursor_AsmStmt
    cast (215) = CXCursor_GCCAsmStmt
    cast (214) = CXCursor_ReturnStmt
    cast (213) = CXCursor_BreakStmt
    cast (212) = CXCursor_ContinueStmt
    cast (211) = CXCursor_IndirectGotoStmt
    cast (210) = CXCursor_GotoStmt
    cast (209) = CXCursor_ForStmt
    cast (208) = CXCursor_DoStmt
    cast (207) = CXCursor_WhileStmt
    cast (206) = CXCursor_SwitchStmt
    cast (205) = CXCursor_IfStmt
    cast (204) = CXCursor_DefaultStmt
    cast (203) = CXCursor_CaseStmt
    cast (202) = CXCursor_CompoundStmt
    cast (201) = CXCursor_LabelStmt
    cast (200) = CXCursor_UnexposedStmt
    cast (200) = CXCursor_FirstStmt
    cast (155) = CXCursor_LastExpr
    cast (155) = CXCursor_CXXParenListInitExpr
    cast (154) = CXCursor_RequiresExpr
    cast (153) = CXCursor_ConceptSpecializationExpr
    cast (152) = CXCursor_CXXAddrspaceCastExpr
    cast (151) = CXCursor_OMPIteratorExpr
    cast (150) = CXCursor_OMPArrayShapingExpr
    cast (149) = CXCursor_FixedPointLiteral
    cast (148) = CXCursor_ObjCAvailabilityCheckExpr
    cast (147) = CXCursor_OMPArraySectionExpr
    cast (146) = CXCursor_ObjCSelfExpr
    cast (145) = CXCursor_ObjCBoolLiteralExpr
    cast (144) = CXCursor_LambdaExpr
    cast (143) = CXCursor_SizeOfPackExpr
    cast (142) = CXCursor_PackExpansionExpr
    cast (141) = CXCursor_ObjCBridgedCastExpr
    cast (140) = CXCursor_ObjCProtocolExpr
    cast (139) = CXCursor_ObjCSelectorExpr
    cast (138) = CXCursor_ObjCEncodeExpr
    cast (137) = CXCursor_ObjCStringLiteral
    cast (136) = CXCursor_UnaryExpr
    cast (135) = CXCursor_CXXDeleteExpr
    cast (134) = CXCursor_CXXNewExpr
    cast (133) = CXCursor_CXXThrowExpr
    cast (132) = CXCursor_CXXThisExpr
    cast (131) = CXCursor_CXXNullPtrLiteralExpr
    cast (130) = CXCursor_CXXBoolLiteralExpr
    cast (129) = CXCursor_CXXTypeidExpr
    cast (128) = CXCursor_CXXFunctionalCastExpr
    cast (127) = CXCursor_CXXConstCastExpr
    cast (126) = CXCursor_CXXReinterpretCastExpr
    cast (125) = CXCursor_CXXDynamicCastExpr
    cast (124) = CXCursor_CXXStaticCastExpr
    cast (123) = CXCursor_GNUNullExpr
    cast (122) = CXCursor_GenericSelectionExpr
    cast (121) = CXCursor_StmtExpr
    cast (120) = CXCursor_AddrLabelExpr
    cast (119) = CXCursor_InitListExpr
    cast (118) = CXCursor_CompoundLiteralExpr
    cast (117) = CXCursor_CStyleCastExpr
    cast (116) = CXCursor_ConditionalOperator
    cast (115) = CXCursor_CompoundAssignOperator
    cast (114) = CXCursor_BinaryOperator
    cast (113) = CXCursor_ArraySubscriptExpr
    cast (112) = CXCursor_UnaryOperator
    cast (111) = CXCursor_ParenExpr
    cast (110) = CXCursor_CharacterLiteral
    cast (109) = CXCursor_StringLiteral
    cast (108) = CXCursor_ImaginaryLiteral
    cast (107) = CXCursor_FloatingLiteral
    cast (106) = CXCursor_IntegerLiteral
    cast (105) = CXCursor_BlockExpr
    cast (104) = CXCursor_ObjCMessageExpr
    cast (103) = CXCursor_CallExpr
    cast (102) = CXCursor_MemberRefExpr
    cast (101) = CXCursor_DeclRefExpr
    cast (100) = CXCursor_UnexposedExpr
    cast (100) = CXCursor_FirstExpr
    cast (73) = CXCursor_LastInvalid
    cast (73) = CXCursor_InvalidCode
    cast (72) = CXCursor_NotImplemented
    cast (71) = CXCursor_NoDeclFound
    cast (70) = CXCursor_InvalidFile
    cast (70) = CXCursor_FirstInvalid
    cast (50) = CXCursor_LastRef
    cast (50) = CXCursor_VariableRef
    cast (49) = CXCursor_OverloadedDeclRef
    cast (48) = CXCursor_LabelRef
    cast (47) = CXCursor_MemberRef
    cast (46) = CXCursor_NamespaceRef
    cast (45) = CXCursor_TemplateRef
    cast (44) = CXCursor_CXXBaseSpecifier
    cast (43) = CXCursor_TypeRef
    cast (42) = CXCursor_ObjCClassRef
    cast (41) = CXCursor_ObjCProtocolRef
    cast (40) = CXCursor_ObjCSuperClassRef
    cast (40) = CXCursor_FirstRef
    cast (39) = CXCursor_LastDecl
    cast (1) = CXCursor_FirstDecl
    cast (39) = CXCursor_CXXAccessSpecifier
    cast (38) = CXCursor_ObjCDynamicDecl
    cast (37) = CXCursor_ObjCSynthesizeDecl
    cast (36) = CXCursor_TypeAliasDecl
    cast (35) = CXCursor_UsingDeclaration
    cast (34) = CXCursor_UsingDirective
    cast (33) = CXCursor_NamespaceAlias
    cast (32) = CXCursor_ClassTemplatePartialSpecialization
    cast (31) = CXCursor_ClassTemplate
    cast (30) = CXCursor_FunctionTemplate
    cast (29) = CXCursor_TemplateTemplateParameter
    cast (28) = CXCursor_NonTypeTemplateParameter
    cast (27) = CXCursor_TemplateTypeParameter
    cast (26) = CXCursor_ConversionFunction
    cast (25) = CXCursor_Destructor
    cast (24) = CXCursor_Constructor
    cast (23) = CXCursor_LinkageSpec
    cast (22) = CXCursor_Namespace
    cast (21) = CXCursor_CXXMethod
    cast (20) = CXCursor_TypedefDecl
    cast (19) = CXCursor_ObjCCategoryImplDecl
    cast (18) = CXCursor_ObjCImplementationDecl
    cast (17) = CXCursor_ObjCClassMethodDecl
    cast (16) = CXCursor_ObjCInstanceMethodDecl
    cast (15) = CXCursor_ObjCIvarDecl
    cast (14) = CXCursor_ObjCPropertyDecl
    cast (13) = CXCursor_ObjCProtocolDecl
    cast (12) = CXCursor_ObjCCategoryDecl
    cast (11) = CXCursor_ObjCInterfaceDecl
    cast (10) = CXCursor_ParmDecl
    cast (9) = CXCursor_VarDecl
    cast (8) = CXCursor_FunctionDecl
    cast (7) = CXCursor_EnumConstantDecl
    cast (6) = CXCursor_FieldDecl
    cast (5) = CXCursor_EnumDecl
    cast (4) = CXCursor_ClassDecl
    cast (3) = CXCursor_UnionDecl
    cast (2) = CXCursor_StructDecl
    cast (1) = CXCursor_UnexposedDecl
    cast m = (Other m)


  export
  fromPrimitive : Prim_CXCursorKind -> CXCursorKind
  fromPrimitive x = cast x

  export
  Bits CXCursorKind where
    Index = Index @{the (Bits Bits32) %search}
    (.&.) x y = fromPrimitive $ (toPrimitive x) .&. (toPrimitive y)
    (.|.) x y = fromPrimitive $ (toPrimitive x) .|. (toPrimitive y)
    xor x y = fromPrimitive $ xor (toPrimitive x) (toPrimitive y)
    shiftL x y = fromPrimitive $ shiftL (toPrimitive x) y
    shiftR x y = fromPrimitive $ shiftR (toPrimitive x) y
    zeroBits = fromPrimitive $ zeroBits
    testBit = testBit . toPrimitive
    bit = fromPrimitive . bit

  export
  Eq CXCursorKind where
    (==) x y = (toPrimitive x) == (toPrimitive y)

namespace CXLinkageKind
  public export
  Prim_CXLinkageKind : Type
  Prim_CXLinkageKind = Bits32

  public export
  data CXLinkageKind
    = Other Prim_CXLinkageKind
    | CXLinkage_External
    | CXLinkage_UniqueExternal
    | CXLinkage_Internal
    | CXLinkage_NoLinkage
    | CXLinkage_Invalid

  export
  Cast CXLinkageKind Prim_CXLinkageKind where
    cast CXLinkage_External = (4)
    cast CXLinkage_UniqueExternal = (3)
    cast CXLinkage_Internal = (2)
    cast CXLinkage_NoLinkage = (1)
    cast CXLinkage_Invalid = (0)
    cast (Other m) = m


  export
  toPrimitive : CXLinkageKind -> Prim_CXLinkageKind
  toPrimitive x = cast x

  export
  Cast Prim_CXLinkageKind CXLinkageKind where
    cast (4) = CXLinkage_External
    cast (3) = CXLinkage_UniqueExternal
    cast (2) = CXLinkage_Internal
    cast (1) = CXLinkage_NoLinkage
    cast (0) = CXLinkage_Invalid
    cast m = (Other m)


  export
  fromPrimitive : Prim_CXLinkageKind -> CXLinkageKind
  fromPrimitive x = cast x

  export
  Bits CXLinkageKind where
    Index = Index @{the (Bits Bits32) %search}
    (.&.) x y = fromPrimitive $ (toPrimitive x) .&. (toPrimitive y)
    (.|.) x y = fromPrimitive $ (toPrimitive x) .|. (toPrimitive y)
    xor x y = fromPrimitive $ xor (toPrimitive x) (toPrimitive y)
    shiftL x y = fromPrimitive $ shiftL (toPrimitive x) y
    shiftR x y = fromPrimitive $ shiftR (toPrimitive x) y
    zeroBits = fromPrimitive $ zeroBits
    testBit = testBit . toPrimitive
    bit = fromPrimitive . bit

  export
  Eq CXLinkageKind where
    (==) x y = (toPrimitive x) == (toPrimitive y)

namespace CXVisibilityKind
  public export
  Prim_CXVisibilityKind : Type
  Prim_CXVisibilityKind = Bits32

  public export
  data CXVisibilityKind
    = Other Prim_CXVisibilityKind
    | CXVisibility_Default
    | CXVisibility_Protected
    | CXVisibility_Hidden
    | CXVisibility_Invalid

  export
  Cast CXVisibilityKind Prim_CXVisibilityKind where
    cast CXVisibility_Default = (3)
    cast CXVisibility_Protected = (2)
    cast CXVisibility_Hidden = (1)
    cast CXVisibility_Invalid = (0)
    cast (Other m) = m


  export
  toPrimitive : CXVisibilityKind -> Prim_CXVisibilityKind
  toPrimitive x = cast x

  export
  Cast Prim_CXVisibilityKind CXVisibilityKind where
    cast (3) = CXVisibility_Default
    cast (2) = CXVisibility_Protected
    cast (1) = CXVisibility_Hidden
    cast (0) = CXVisibility_Invalid
    cast m = (Other m)


  export
  fromPrimitive : Prim_CXVisibilityKind -> CXVisibilityKind
  fromPrimitive x = cast x

  export
  Bits CXVisibilityKind where
    Index = Index @{the (Bits Bits32) %search}
    (.&.) x y = fromPrimitive $ (toPrimitive x) .&. (toPrimitive y)
    (.|.) x y = fromPrimitive $ (toPrimitive x) .|. (toPrimitive y)
    xor x y = fromPrimitive $ xor (toPrimitive x) (toPrimitive y)
    shiftL x y = fromPrimitive $ shiftL (toPrimitive x) y
    shiftR x y = fromPrimitive $ shiftR (toPrimitive x) y
    zeroBits = fromPrimitive $ zeroBits
    testBit = testBit . toPrimitive
    bit = fromPrimitive . bit

  export
  Eq CXVisibilityKind where
    (==) x y = (toPrimitive x) == (toPrimitive y)

namespace CXLanguageKind
  public export
  Prim_CXLanguageKind : Type
  Prim_CXLanguageKind = Bits32

  public export
  data CXLanguageKind
    = Other Prim_CXLanguageKind
    | CXLanguage_CPlusPlus
    | CXLanguage_ObjC
    | CXLanguage_C
    | CXLanguage_Invalid

  export
  Cast CXLanguageKind Prim_CXLanguageKind where
    cast CXLanguage_CPlusPlus = (3)
    cast CXLanguage_ObjC = (2)
    cast CXLanguage_C = (1)
    cast CXLanguage_Invalid = (0)
    cast (Other m) = m


  export
  toPrimitive : CXLanguageKind -> Prim_CXLanguageKind
  toPrimitive x = cast x

  export
  Cast Prim_CXLanguageKind CXLanguageKind where
    cast (3) = CXLanguage_CPlusPlus
    cast (2) = CXLanguage_ObjC
    cast (1) = CXLanguage_C
    cast (0) = CXLanguage_Invalid
    cast m = (Other m)


  export
  fromPrimitive : Prim_CXLanguageKind -> CXLanguageKind
  fromPrimitive x = cast x

  export
  Bits CXLanguageKind where
    Index = Index @{the (Bits Bits32) %search}
    (.&.) x y = fromPrimitive $ (toPrimitive x) .&. (toPrimitive y)
    (.|.) x y = fromPrimitive $ (toPrimitive x) .|. (toPrimitive y)
    xor x y = fromPrimitive $ xor (toPrimitive x) (toPrimitive y)
    shiftL x y = fromPrimitive $ shiftL (toPrimitive x) y
    shiftR x y = fromPrimitive $ shiftR (toPrimitive x) y
    zeroBits = fromPrimitive $ zeroBits
    testBit = testBit . toPrimitive
    bit = fromPrimitive . bit

  export
  Eq CXLanguageKind where
    (==) x y = (toPrimitive x) == (toPrimitive y)

namespace CXTLSKind
  public export
  Prim_CXTLSKind : Type
  Prim_CXTLSKind = Bits32

  public export
  data CXTLSKind
    = Other Prim_CXTLSKind
    | CXTLS_Static
    | CXTLS_Dynamic
    | CXTLS_None

  export
  Cast CXTLSKind Prim_CXTLSKind where
    cast CXTLS_Static = (2)
    cast CXTLS_Dynamic = (1)
    cast CXTLS_None = (0)
    cast (Other m) = m


  export
  toPrimitive : CXTLSKind -> Prim_CXTLSKind
  toPrimitive x = cast x

  export
  Cast Prim_CXTLSKind CXTLSKind where
    cast (2) = CXTLS_Static
    cast (1) = CXTLS_Dynamic
    cast (0) = CXTLS_None
    cast m = (Other m)


  export
  fromPrimitive : Prim_CXTLSKind -> CXTLSKind
  fromPrimitive x = cast x

  export
  Bits CXTLSKind where
    Index = Index @{the (Bits Bits32) %search}
    (.&.) x y = fromPrimitive $ (toPrimitive x) .&. (toPrimitive y)
    (.|.) x y = fromPrimitive $ (toPrimitive x) .|. (toPrimitive y)
    xor x y = fromPrimitive $ xor (toPrimitive x) (toPrimitive y)
    shiftL x y = fromPrimitive $ shiftL (toPrimitive x) y
    shiftR x y = fromPrimitive $ shiftR (toPrimitive x) y
    zeroBits = fromPrimitive $ zeroBits
    testBit = testBit . toPrimitive
    bit = fromPrimitive . bit

  export
  Eq CXTLSKind where
    (==) x y = (toPrimitive x) == (toPrimitive y)

namespace CXTypeKind
  public export
  Prim_CXTypeKind : Type
  Prim_CXTypeKind = Bits32

  public export
  data CXTypeKind
    = Other Prim_CXTypeKind
    | CXType_BTFTagAttributed
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

  export
  Cast CXTypeKind Prim_CXTypeKind where
    cast CXType_BTFTagAttributed = (178)
    cast CXType_Atomic = (177)
    cast CXType_ExtVector = (176)
    cast CXType_OCLIntelSubgroupAVCImeDualRefStreamin = (175)
    cast CXType_OCLIntelSubgroupAVCImeSingleRefStreamin = (174)
    cast CXType_OCLIntelSubgroupAVCImeResultDualRefStreamout = (173)
    cast CXType_OCLIntelSubgroupAVCImeResultSingleRefStreamout = (172)
    cast CXType_OCLIntelSubgroupAVCImeDualReferenceStreamin = (175)
    cast CXType_OCLIntelSubgroupAVCImeSingleReferenceStreamin = (174)
    cast CXType_OCLIntelSubgroupAVCImeResultDualReferenceStreamout = (173)
    cast CXType_OCLIntelSubgroupAVCImeResultSingleReferenceStreamout = (172)
    cast CXType_OCLIntelSubgroupAVCSicResult = (171)
    cast CXType_OCLIntelSubgroupAVCRefResult = (170)
    cast CXType_OCLIntelSubgroupAVCImeResult = (169)
    cast CXType_OCLIntelSubgroupAVCMceResult = (168)
    cast CXType_OCLIntelSubgroupAVCSicPayload = (167)
    cast CXType_OCLIntelSubgroupAVCRefPayload = (166)
    cast CXType_OCLIntelSubgroupAVCImePayload = (165)
    cast CXType_OCLIntelSubgroupAVCMcePayload = (164)
    cast CXType_Attributed = (163)
    cast CXType_ObjCTypeParam = (162)
    cast CXType_ObjCObject = (161)
    cast CXType_OCLReserveID = (160)
    cast CXType_OCLQueue = (159)
    cast CXType_OCLEvent = (158)
    cast CXType_OCLSampler = (157)
    cast CXType_OCLImage3dRW = (156)
    cast CXType_OCLImage2dArrayMSAADepthRW = (155)
    cast CXType_OCLImage2dMSAADepthRW = (154)
    cast CXType_OCLImage2dArrayMSAARW = (153)
    cast CXType_OCLImage2dMSAARW = (152)
    cast CXType_OCLImage2dArrayDepthRW = (151)
    cast CXType_OCLImage2dDepthRW = (150)
    cast CXType_OCLImage2dArrayRW = (149)
    cast CXType_OCLImage2dRW = (148)
    cast CXType_OCLImage1dBufferRW = (147)
    cast CXType_OCLImage1dArrayRW = (146)
    cast CXType_OCLImage1dRW = (145)
    cast CXType_OCLImage3dWO = (144)
    cast CXType_OCLImage2dArrayMSAADepthWO = (143)
    cast CXType_OCLImage2dMSAADepthWO = (142)
    cast CXType_OCLImage2dArrayMSAAWO = (141)
    cast CXType_OCLImage2dMSAAWO = (140)
    cast CXType_OCLImage2dArrayDepthWO = (139)
    cast CXType_OCLImage2dDepthWO = (138)
    cast CXType_OCLImage2dArrayWO = (137)
    cast CXType_OCLImage2dWO = (136)
    cast CXType_OCLImage1dBufferWO = (135)
    cast CXType_OCLImage1dArrayWO = (134)
    cast CXType_OCLImage1dWO = (133)
    cast CXType_OCLImage3dRO = (132)
    cast CXType_OCLImage2dArrayMSAADepthRO = (131)
    cast CXType_OCLImage2dMSAADepthRO = (130)
    cast CXType_OCLImage2dArrayMSAARO = (129)
    cast CXType_OCLImage2dMSAARO = (128)
    cast CXType_OCLImage2dArrayDepthRO = (127)
    cast CXType_OCLImage2dDepthRO = (126)
    cast CXType_OCLImage2dArrayRO = (125)
    cast CXType_OCLImage2dRO = (124)
    cast CXType_OCLImage1dBufferRO = (123)
    cast CXType_OCLImage1dArrayRO = (122)
    cast CXType_OCLImage1dRO = (121)
    cast CXType_Pipe = (120)
    cast CXType_Elaborated = (119)
    cast CXType_Auto = (118)
    cast CXType_MemberPointer = (117)
    cast CXType_DependentSizedArray = (116)
    cast CXType_VariableArray = (115)
    cast CXType_IncompleteArray = (114)
    cast CXType_Vector = (113)
    cast CXType_ConstantArray = (112)
    cast CXType_FunctionProto = (111)
    cast CXType_FunctionNoProto = (110)
    cast CXType_ObjCObjectPointer = (109)
    cast CXType_ObjCInterface = (108)
    cast CXType_Typedef = (107)
    cast CXType_Enum = (106)
    cast CXType_Record = (105)
    cast CXType_RValueReference = (104)
    cast CXType_LValueReference = (103)
    cast CXType_BlockPointer = (102)
    cast CXType_Pointer = (101)
    cast CXType_Complex = (100)
    cast CXType_LastBuiltin = (40)
    cast CXType_FirstBuiltin = (2)
    cast CXType_Ibm128 = (40)
    cast CXType_BFloat16 = (39)
    cast CXType_ULongAccum = (38)
    cast CXType_UAccum = (37)
    cast CXType_UShortAccum = (36)
    cast CXType_LongAccum = (35)
    cast CXType_Accum = (34)
    cast CXType_ShortAccum = (33)
    cast CXType_Float16 = (32)
    cast CXType_Half = (31)
    cast CXType_Float128 = (30)
    cast CXType_ObjCSel = (29)
    cast CXType_ObjCClass = (28)
    cast CXType_ObjCId = (27)
    cast CXType_Dependent = (26)
    cast CXType_Overload = (25)
    cast CXType_NullPtr = (24)
    cast CXType_LongDouble = (23)
    cast CXType_Double = (22)
    cast CXType_Float = (21)
    cast CXType_Int128 = (20)
    cast CXType_LongLong = (19)
    cast CXType_Long = (18)
    cast CXType_Int = (17)
    cast CXType_Short = (16)
    cast CXType_WChar = (15)
    cast CXType_SChar = (14)
    cast CXType_Char_S = (13)
    cast CXType_UInt128 = (12)
    cast CXType_ULongLong = (11)
    cast CXType_ULong = (10)
    cast CXType_UInt = (9)
    cast CXType_UShort = (8)
    cast CXType_Char32 = (7)
    cast CXType_Char16 = (6)
    cast CXType_UChar = (5)
    cast CXType_Char_U = (4)
    cast CXType_Bool = (3)
    cast CXType_Void = (2)
    cast CXType_Unexposed = (1)
    cast CXType_Invalid = (0)
    cast (Other m) = m


  export
  toPrimitive : CXTypeKind -> Prim_CXTypeKind
  toPrimitive x = cast x

  export
  Cast Prim_CXTypeKind CXTypeKind where
    cast (178) = CXType_BTFTagAttributed
    cast (177) = CXType_Atomic
    cast (176) = CXType_ExtVector
    cast (175) = CXType_OCLIntelSubgroupAVCImeDualRefStreamin
    cast (174) = CXType_OCLIntelSubgroupAVCImeSingleRefStreamin
    cast (173) = CXType_OCLIntelSubgroupAVCImeResultDualRefStreamout
    cast (172) = CXType_OCLIntelSubgroupAVCImeResultSingleRefStreamout
    cast (175) = CXType_OCLIntelSubgroupAVCImeDualReferenceStreamin
    cast (174) = CXType_OCLIntelSubgroupAVCImeSingleReferenceStreamin
    cast (173) = CXType_OCLIntelSubgroupAVCImeResultDualReferenceStreamout
    cast (172) = CXType_OCLIntelSubgroupAVCImeResultSingleReferenceStreamout
    cast (171) = CXType_OCLIntelSubgroupAVCSicResult
    cast (170) = CXType_OCLIntelSubgroupAVCRefResult
    cast (169) = CXType_OCLIntelSubgroupAVCImeResult
    cast (168) = CXType_OCLIntelSubgroupAVCMceResult
    cast (167) = CXType_OCLIntelSubgroupAVCSicPayload
    cast (166) = CXType_OCLIntelSubgroupAVCRefPayload
    cast (165) = CXType_OCLIntelSubgroupAVCImePayload
    cast (164) = CXType_OCLIntelSubgroupAVCMcePayload
    cast (163) = CXType_Attributed
    cast (162) = CXType_ObjCTypeParam
    cast (161) = CXType_ObjCObject
    cast (160) = CXType_OCLReserveID
    cast (159) = CXType_OCLQueue
    cast (158) = CXType_OCLEvent
    cast (157) = CXType_OCLSampler
    cast (156) = CXType_OCLImage3dRW
    cast (155) = CXType_OCLImage2dArrayMSAADepthRW
    cast (154) = CXType_OCLImage2dMSAADepthRW
    cast (153) = CXType_OCLImage2dArrayMSAARW
    cast (152) = CXType_OCLImage2dMSAARW
    cast (151) = CXType_OCLImage2dArrayDepthRW
    cast (150) = CXType_OCLImage2dDepthRW
    cast (149) = CXType_OCLImage2dArrayRW
    cast (148) = CXType_OCLImage2dRW
    cast (147) = CXType_OCLImage1dBufferRW
    cast (146) = CXType_OCLImage1dArrayRW
    cast (145) = CXType_OCLImage1dRW
    cast (144) = CXType_OCLImage3dWO
    cast (143) = CXType_OCLImage2dArrayMSAADepthWO
    cast (142) = CXType_OCLImage2dMSAADepthWO
    cast (141) = CXType_OCLImage2dArrayMSAAWO
    cast (140) = CXType_OCLImage2dMSAAWO
    cast (139) = CXType_OCLImage2dArrayDepthWO
    cast (138) = CXType_OCLImage2dDepthWO
    cast (137) = CXType_OCLImage2dArrayWO
    cast (136) = CXType_OCLImage2dWO
    cast (135) = CXType_OCLImage1dBufferWO
    cast (134) = CXType_OCLImage1dArrayWO
    cast (133) = CXType_OCLImage1dWO
    cast (132) = CXType_OCLImage3dRO
    cast (131) = CXType_OCLImage2dArrayMSAADepthRO
    cast (130) = CXType_OCLImage2dMSAADepthRO
    cast (129) = CXType_OCLImage2dArrayMSAARO
    cast (128) = CXType_OCLImage2dMSAARO
    cast (127) = CXType_OCLImage2dArrayDepthRO
    cast (126) = CXType_OCLImage2dDepthRO
    cast (125) = CXType_OCLImage2dArrayRO
    cast (124) = CXType_OCLImage2dRO
    cast (123) = CXType_OCLImage1dBufferRO
    cast (122) = CXType_OCLImage1dArrayRO
    cast (121) = CXType_OCLImage1dRO
    cast (120) = CXType_Pipe
    cast (119) = CXType_Elaborated
    cast (118) = CXType_Auto
    cast (117) = CXType_MemberPointer
    cast (116) = CXType_DependentSizedArray
    cast (115) = CXType_VariableArray
    cast (114) = CXType_IncompleteArray
    cast (113) = CXType_Vector
    cast (112) = CXType_ConstantArray
    cast (111) = CXType_FunctionProto
    cast (110) = CXType_FunctionNoProto
    cast (109) = CXType_ObjCObjectPointer
    cast (108) = CXType_ObjCInterface
    cast (107) = CXType_Typedef
    cast (106) = CXType_Enum
    cast (105) = CXType_Record
    cast (104) = CXType_RValueReference
    cast (103) = CXType_LValueReference
    cast (102) = CXType_BlockPointer
    cast (101) = CXType_Pointer
    cast (100) = CXType_Complex
    cast (40) = CXType_LastBuiltin
    cast (2) = CXType_FirstBuiltin
    cast (40) = CXType_Ibm128
    cast (39) = CXType_BFloat16
    cast (38) = CXType_ULongAccum
    cast (37) = CXType_UAccum
    cast (36) = CXType_UShortAccum
    cast (35) = CXType_LongAccum
    cast (34) = CXType_Accum
    cast (33) = CXType_ShortAccum
    cast (32) = CXType_Float16
    cast (31) = CXType_Half
    cast (30) = CXType_Float128
    cast (29) = CXType_ObjCSel
    cast (28) = CXType_ObjCClass
    cast (27) = CXType_ObjCId
    cast (26) = CXType_Dependent
    cast (25) = CXType_Overload
    cast (24) = CXType_NullPtr
    cast (23) = CXType_LongDouble
    cast (22) = CXType_Double
    cast (21) = CXType_Float
    cast (20) = CXType_Int128
    cast (19) = CXType_LongLong
    cast (18) = CXType_Long
    cast (17) = CXType_Int
    cast (16) = CXType_Short
    cast (15) = CXType_WChar
    cast (14) = CXType_SChar
    cast (13) = CXType_Char_S
    cast (12) = CXType_UInt128
    cast (11) = CXType_ULongLong
    cast (10) = CXType_ULong
    cast (9) = CXType_UInt
    cast (8) = CXType_UShort
    cast (7) = CXType_Char32
    cast (6) = CXType_Char16
    cast (5) = CXType_UChar
    cast (4) = CXType_Char_U
    cast (3) = CXType_Bool
    cast (2) = CXType_Void
    cast (1) = CXType_Unexposed
    cast (0) = CXType_Invalid
    cast m = (Other m)


  export
  fromPrimitive : Prim_CXTypeKind -> CXTypeKind
  fromPrimitive x = cast x

  export
  Bits CXTypeKind where
    Index = Index @{the (Bits Bits32) %search}
    (.&.) x y = fromPrimitive $ (toPrimitive x) .&. (toPrimitive y)
    (.|.) x y = fromPrimitive $ (toPrimitive x) .|. (toPrimitive y)
    xor x y = fromPrimitive $ xor (toPrimitive x) (toPrimitive y)
    shiftL x y = fromPrimitive $ shiftL (toPrimitive x) y
    shiftR x y = fromPrimitive $ shiftR (toPrimitive x) y
    zeroBits = fromPrimitive $ zeroBits
    testBit = testBit . toPrimitive
    bit = fromPrimitive . bit

  export
  Eq CXTypeKind where
    (==) x y = (toPrimitive x) == (toPrimitive y)

namespace CXCallingConv
  public export
  Prim_CXCallingConv : Type
  Prim_CXCallingConv = Bits32

  public export
  data CXCallingConv
    = Other Prim_CXCallingConv
    | CXCallingConv_Unexposed
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

  export
  Cast CXCallingConv Prim_CXCallingConv where
    cast CXCallingConv_Unexposed = (200)
    cast CXCallingConv_Invalid = (100)
    cast CXCallingConv_AArch64SVEPCS = (18)
    cast CXCallingConv_SwiftAsync = (17)
    cast CXCallingConv_AArch64VectorCall = (16)
    cast CXCallingConv_PreserveAll = (15)
    cast CXCallingConv_PreserveMost = (14)
    cast CXCallingConv_Swift = (13)
    cast CXCallingConv_X86VectorCall = (12)
    cast CXCallingConv_X86_64SysV = (11)
    cast CXCallingConv_X86_64Win64 = (10)
    cast CXCallingConv_Win64 = (10)
    cast CXCallingConv_IntelOclBicc = (9)
    cast CXCallingConv_X86RegCall = (8)
    cast CXCallingConv_AAPCS_VFP = (7)
    cast CXCallingConv_AAPCS = (6)
    cast CXCallingConv_X86Pascal = (5)
    cast CXCallingConv_X86ThisCall = (4)
    cast CXCallingConv_X86FastCall = (3)
    cast CXCallingConv_X86StdCall = (2)
    cast CXCallingConv_C = (1)
    cast CXCallingConv_Default = (0)
    cast (Other m) = m


  export
  toPrimitive : CXCallingConv -> Prim_CXCallingConv
  toPrimitive x = cast x

  export
  Cast Prim_CXCallingConv CXCallingConv where
    cast (200) = CXCallingConv_Unexposed
    cast (100) = CXCallingConv_Invalid
    cast (18) = CXCallingConv_AArch64SVEPCS
    cast (17) = CXCallingConv_SwiftAsync
    cast (16) = CXCallingConv_AArch64VectorCall
    cast (15) = CXCallingConv_PreserveAll
    cast (14) = CXCallingConv_PreserveMost
    cast (13) = CXCallingConv_Swift
    cast (12) = CXCallingConv_X86VectorCall
    cast (11) = CXCallingConv_X86_64SysV
    cast (10) = CXCallingConv_X86_64Win64
    cast (10) = CXCallingConv_Win64
    cast (9) = CXCallingConv_IntelOclBicc
    cast (8) = CXCallingConv_X86RegCall
    cast (7) = CXCallingConv_AAPCS_VFP
    cast (6) = CXCallingConv_AAPCS
    cast (5) = CXCallingConv_X86Pascal
    cast (4) = CXCallingConv_X86ThisCall
    cast (3) = CXCallingConv_X86FastCall
    cast (2) = CXCallingConv_X86StdCall
    cast (1) = CXCallingConv_C
    cast (0) = CXCallingConv_Default
    cast m = (Other m)


  export
  fromPrimitive : Prim_CXCallingConv -> CXCallingConv
  fromPrimitive x = cast x

  export
  Bits CXCallingConv where
    Index = Index @{the (Bits Bits32) %search}
    (.&.) x y = fromPrimitive $ (toPrimitive x) .&. (toPrimitive y)
    (.|.) x y = fromPrimitive $ (toPrimitive x) .|. (toPrimitive y)
    xor x y = fromPrimitive $ xor (toPrimitive x) (toPrimitive y)
    shiftL x y = fromPrimitive $ shiftL (toPrimitive x) y
    shiftR x y = fromPrimitive $ shiftR (toPrimitive x) y
    zeroBits = fromPrimitive $ zeroBits
    testBit = testBit . toPrimitive
    bit = fromPrimitive . bit

  export
  Eq CXCallingConv where
    (==) x y = (toPrimitive x) == (toPrimitive y)

namespace CXTemplateArgumentKind
  public export
  Prim_CXTemplateArgumentKind : Type
  Prim_CXTemplateArgumentKind = Bits32

  public export
  data CXTemplateArgumentKind
    = Other Prim_CXTemplateArgumentKind
    | CXTemplateArgumentKind_Invalid
    | CXTemplateArgumentKind_Pack
    | CXTemplateArgumentKind_Expression
    | CXTemplateArgumentKind_TemplateExpansion
    | CXTemplateArgumentKind_Template
    | CXTemplateArgumentKind_Integral
    | CXTemplateArgumentKind_NullPtr
    | CXTemplateArgumentKind_Declaration
    | CXTemplateArgumentKind_Type
    | CXTemplateArgumentKind_Null

  export
  Cast CXTemplateArgumentKind Prim_CXTemplateArgumentKind where
    cast CXTemplateArgumentKind_Invalid = (9)
    cast CXTemplateArgumentKind_Pack = (8)
    cast CXTemplateArgumentKind_Expression = (7)
    cast CXTemplateArgumentKind_TemplateExpansion = (6)
    cast CXTemplateArgumentKind_Template = (5)
    cast CXTemplateArgumentKind_Integral = (4)
    cast CXTemplateArgumentKind_NullPtr = (3)
    cast CXTemplateArgumentKind_Declaration = (2)
    cast CXTemplateArgumentKind_Type = (1)
    cast CXTemplateArgumentKind_Null = (0)
    cast (Other m) = m


  export
  toPrimitive : CXTemplateArgumentKind -> Prim_CXTemplateArgumentKind
  toPrimitive x = cast x

  export
  Cast Prim_CXTemplateArgumentKind CXTemplateArgumentKind where
    cast (9) = CXTemplateArgumentKind_Invalid
    cast (8) = CXTemplateArgumentKind_Pack
    cast (7) = CXTemplateArgumentKind_Expression
    cast (6) = CXTemplateArgumentKind_TemplateExpansion
    cast (5) = CXTemplateArgumentKind_Template
    cast (4) = CXTemplateArgumentKind_Integral
    cast (3) = CXTemplateArgumentKind_NullPtr
    cast (2) = CXTemplateArgumentKind_Declaration
    cast (1) = CXTemplateArgumentKind_Type
    cast (0) = CXTemplateArgumentKind_Null
    cast m = (Other m)


  export
  fromPrimitive : Prim_CXTemplateArgumentKind -> CXTemplateArgumentKind
  fromPrimitive x = cast x

  export
  Bits CXTemplateArgumentKind where
    Index = Index @{the (Bits Bits32) %search}
    (.&.) x y = fromPrimitive $ (toPrimitive x) .&. (toPrimitive y)
    (.|.) x y = fromPrimitive $ (toPrimitive x) .|. (toPrimitive y)
    xor x y = fromPrimitive $ xor (toPrimitive x) (toPrimitive y)
    shiftL x y = fromPrimitive $ shiftL (toPrimitive x) y
    shiftR x y = fromPrimitive $ shiftR (toPrimitive x) y
    zeroBits = fromPrimitive $ zeroBits
    testBit = testBit . toPrimitive
    bit = fromPrimitive . bit

  export
  Eq CXTemplateArgumentKind where
    (==) x y = (toPrimitive x) == (toPrimitive y)

namespace CXTypeNullabilityKind
  public export
  Prim_CXTypeNullabilityKind : Type
  Prim_CXTypeNullabilityKind = Bits32

  public export
  data CXTypeNullabilityKind
    = Other Prim_CXTypeNullabilityKind
    | CXTypeNullability_NullableResult
    | CXTypeNullability_Invalid
    | CXTypeNullability_Unspecified
    | CXTypeNullability_Nullable
    | CXTypeNullability_NonNull

  export
  Cast CXTypeNullabilityKind Prim_CXTypeNullabilityKind where
    cast CXTypeNullability_NullableResult = (4)
    cast CXTypeNullability_Invalid = (3)
    cast CXTypeNullability_Unspecified = (2)
    cast CXTypeNullability_Nullable = (1)
    cast CXTypeNullability_NonNull = (0)
    cast (Other m) = m


  export
  toPrimitive : CXTypeNullabilityKind -> Prim_CXTypeNullabilityKind
  toPrimitive x = cast x

  export
  Cast Prim_CXTypeNullabilityKind CXTypeNullabilityKind where
    cast (4) = CXTypeNullability_NullableResult
    cast (3) = CXTypeNullability_Invalid
    cast (2) = CXTypeNullability_Unspecified
    cast (1) = CXTypeNullability_Nullable
    cast (0) = CXTypeNullability_NonNull
    cast m = (Other m)


  export
  fromPrimitive : Prim_CXTypeNullabilityKind -> CXTypeNullabilityKind
  fromPrimitive x = cast x

  export
  Bits CXTypeNullabilityKind where
    Index = Index @{the (Bits Bits32) %search}
    (.&.) x y = fromPrimitive $ (toPrimitive x) .&. (toPrimitive y)
    (.|.) x y = fromPrimitive $ (toPrimitive x) .|. (toPrimitive y)
    xor x y = fromPrimitive $ xor (toPrimitive x) (toPrimitive y)
    shiftL x y = fromPrimitive $ shiftL (toPrimitive x) y
    shiftR x y = fromPrimitive $ shiftR (toPrimitive x) y
    zeroBits = fromPrimitive $ zeroBits
    testBit = testBit . toPrimitive
    bit = fromPrimitive . bit

  export
  Eq CXTypeNullabilityKind where
    (==) x y = (toPrimitive x) == (toPrimitive y)

namespace CXTypeLayoutError
  public export
  Prim_CXTypeLayoutError : Type
  Prim_CXTypeLayoutError = Bits32

  public export
  data CXTypeLayoutError
    = Other Prim_CXTypeLayoutError
    | CXTypeLayoutError_Undeduced
    | CXTypeLayoutError_InvalidFieldName
    | CXTypeLayoutError_NotConstantSize
    | CXTypeLayoutError_Dependent
    | CXTypeLayoutError_Incomplete
    | CXTypeLayoutError_Invalid

  export
  Cast CXTypeLayoutError Prim_CXTypeLayoutError where
    cast CXTypeLayoutError_Undeduced = (-6)
    cast CXTypeLayoutError_InvalidFieldName = (-5)
    cast CXTypeLayoutError_NotConstantSize = (-4)
    cast CXTypeLayoutError_Dependent = (-3)
    cast CXTypeLayoutError_Incomplete = (-2)
    cast CXTypeLayoutError_Invalid = (-1)
    cast (Other m) = m


  export
  toPrimitive : CXTypeLayoutError -> Prim_CXTypeLayoutError
  toPrimitive x = cast x

  export
  Cast Prim_CXTypeLayoutError CXTypeLayoutError where
    cast (-6) = CXTypeLayoutError_Undeduced
    cast (-5) = CXTypeLayoutError_InvalidFieldName
    cast (-4) = CXTypeLayoutError_NotConstantSize
    cast (-3) = CXTypeLayoutError_Dependent
    cast (-2) = CXTypeLayoutError_Incomplete
    cast (-1) = CXTypeLayoutError_Invalid
    cast m = (Other m)


  export
  fromPrimitive : Prim_CXTypeLayoutError -> CXTypeLayoutError
  fromPrimitive x = cast x

  export
  Bits CXTypeLayoutError where
    Index = Index @{the (Bits Bits32) %search}
    (.&.) x y = fromPrimitive $ (toPrimitive x) .&. (toPrimitive y)
    (.|.) x y = fromPrimitive $ (toPrimitive x) .|. (toPrimitive y)
    xor x y = fromPrimitive $ xor (toPrimitive x) (toPrimitive y)
    shiftL x y = fromPrimitive $ shiftL (toPrimitive x) y
    shiftR x y = fromPrimitive $ shiftR (toPrimitive x) y
    zeroBits = fromPrimitive $ zeroBits
    testBit = testBit . toPrimitive
    bit = fromPrimitive . bit

  export
  Eq CXTypeLayoutError where
    (==) x y = (toPrimitive x) == (toPrimitive y)

namespace CXRefQualifierKind
  public export
  Prim_CXRefQualifierKind : Type
  Prim_CXRefQualifierKind = Bits32

  public export
  data CXRefQualifierKind
    = Other Prim_CXRefQualifierKind
    | CXRefQualifier_RValue
    | CXRefQualifier_LValue
    | CXRefQualifier_None

  export
  Cast CXRefQualifierKind Prim_CXRefQualifierKind where
    cast CXRefQualifier_RValue = (2)
    cast CXRefQualifier_LValue = (1)
    cast CXRefQualifier_None = (0)
    cast (Other m) = m


  export
  toPrimitive : CXRefQualifierKind -> Prim_CXRefQualifierKind
  toPrimitive x = cast x

  export
  Cast Prim_CXRefQualifierKind CXRefQualifierKind where
    cast (2) = CXRefQualifier_RValue
    cast (1) = CXRefQualifier_LValue
    cast (0) = CXRefQualifier_None
    cast m = (Other m)


  export
  fromPrimitive : Prim_CXRefQualifierKind -> CXRefQualifierKind
  fromPrimitive x = cast x

  export
  Bits CXRefQualifierKind where
    Index = Index @{the (Bits Bits32) %search}
    (.&.) x y = fromPrimitive $ (toPrimitive x) .&. (toPrimitive y)
    (.|.) x y = fromPrimitive $ (toPrimitive x) .|. (toPrimitive y)
    xor x y = fromPrimitive $ xor (toPrimitive x) (toPrimitive y)
    shiftL x y = fromPrimitive $ shiftL (toPrimitive x) y
    shiftR x y = fromPrimitive $ shiftR (toPrimitive x) y
    zeroBits = fromPrimitive $ zeroBits
    testBit = testBit . toPrimitive
    bit = fromPrimitive . bit

  export
  Eq CXRefQualifierKind where
    (==) x y = (toPrimitive x) == (toPrimitive y)

namespace CX_CXXAccessSpecifier
  public export
  Prim_CX_CXXAccessSpecifier : Type
  Prim_CX_CXXAccessSpecifier = Bits32

  public export
  data CX_CXXAccessSpecifier
    = Other Prim_CX_CXXAccessSpecifier
    | CX_CXXPrivate
    | CX_CXXProtected
    | CX_CXXPublic
    | CX_CXXInvalidAccessSpecifier

  export
  Cast CX_CXXAccessSpecifier Prim_CX_CXXAccessSpecifier where
    cast CX_CXXPrivate = (3)
    cast CX_CXXProtected = (2)
    cast CX_CXXPublic = (1)
    cast CX_CXXInvalidAccessSpecifier = (0)
    cast (Other m) = m


  export
  toPrimitive : CX_CXXAccessSpecifier -> Prim_CX_CXXAccessSpecifier
  toPrimitive x = cast x

  export
  Cast Prim_CX_CXXAccessSpecifier CX_CXXAccessSpecifier where
    cast (3) = CX_CXXPrivate
    cast (2) = CX_CXXProtected
    cast (1) = CX_CXXPublic
    cast (0) = CX_CXXInvalidAccessSpecifier
    cast m = (Other m)


  export
  fromPrimitive : Prim_CX_CXXAccessSpecifier -> CX_CXXAccessSpecifier
  fromPrimitive x = cast x

  export
  Bits CX_CXXAccessSpecifier where
    Index = Index @{the (Bits Bits32) %search}
    (.&.) x y = fromPrimitive $ (toPrimitive x) .&. (toPrimitive y)
    (.|.) x y = fromPrimitive $ (toPrimitive x) .|. (toPrimitive y)
    xor x y = fromPrimitive $ xor (toPrimitive x) (toPrimitive y)
    shiftL x y = fromPrimitive $ shiftL (toPrimitive x) y
    shiftR x y = fromPrimitive $ shiftR (toPrimitive x) y
    zeroBits = fromPrimitive $ zeroBits
    testBit = testBit . toPrimitive
    bit = fromPrimitive . bit

  export
  Eq CX_CXXAccessSpecifier where
    (==) x y = (toPrimitive x) == (toPrimitive y)

namespace CX_StorageClass
  public export
  Prim_CX_StorageClass : Type
  Prim_CX_StorageClass = Bits32

  public export
  data CX_StorageClass
    = Other Prim_CX_StorageClass
    | CX_SC_Register
    | CX_SC_Auto
    | CX_SC_OpenCLWorkGroupLocal
    | CX_SC_PrivateExtern
    | CX_SC_Static
    | CX_SC_Extern
    | CX_SC_None
    | CX_SC_Invalid

  export
  Cast CX_StorageClass Prim_CX_StorageClass where
    cast CX_SC_Register = (7)
    cast CX_SC_Auto = (6)
    cast CX_SC_OpenCLWorkGroupLocal = (5)
    cast CX_SC_PrivateExtern = (4)
    cast CX_SC_Static = (3)
    cast CX_SC_Extern = (2)
    cast CX_SC_None = (1)
    cast CX_SC_Invalid = (0)
    cast (Other m) = m


  export
  toPrimitive : CX_StorageClass -> Prim_CX_StorageClass
  toPrimitive x = cast x

  export
  Cast Prim_CX_StorageClass CX_StorageClass where
    cast (7) = CX_SC_Register
    cast (6) = CX_SC_Auto
    cast (5) = CX_SC_OpenCLWorkGroupLocal
    cast (4) = CX_SC_PrivateExtern
    cast (3) = CX_SC_Static
    cast (2) = CX_SC_Extern
    cast (1) = CX_SC_None
    cast (0) = CX_SC_Invalid
    cast m = (Other m)


  export
  fromPrimitive : Prim_CX_StorageClass -> CX_StorageClass
  fromPrimitive x = cast x

  export
  Bits CX_StorageClass where
    Index = Index @{the (Bits Bits32) %search}
    (.&.) x y = fromPrimitive $ (toPrimitive x) .&. (toPrimitive y)
    (.|.) x y = fromPrimitive $ (toPrimitive x) .|. (toPrimitive y)
    xor x y = fromPrimitive $ xor (toPrimitive x) (toPrimitive y)
    shiftL x y = fromPrimitive $ shiftL (toPrimitive x) y
    shiftR x y = fromPrimitive $ shiftR (toPrimitive x) y
    zeroBits = fromPrimitive $ zeroBits
    testBit = testBit . toPrimitive
    bit = fromPrimitive . bit

  export
  Eq CX_StorageClass where
    (==) x y = (toPrimitive x) == (toPrimitive y)

namespace CXChildVisitResult
  public export
  Prim_CXChildVisitResult : Type
  Prim_CXChildVisitResult = Bits32

  public export
  data CXChildVisitResult
    = Other Prim_CXChildVisitResult
    | CXChildVisit_Recurse
    | CXChildVisit_Continue
    | CXChildVisit_Break

  export
  Cast CXChildVisitResult Prim_CXChildVisitResult where
    cast CXChildVisit_Recurse = (2)
    cast CXChildVisit_Continue = (1)
    cast CXChildVisit_Break = (0)
    cast (Other m) = m


  export
  toPrimitive : CXChildVisitResult -> Prim_CXChildVisitResult
  toPrimitive x = cast x

  export
  Cast Prim_CXChildVisitResult CXChildVisitResult where
    cast (2) = CXChildVisit_Recurse
    cast (1) = CXChildVisit_Continue
    cast (0) = CXChildVisit_Break
    cast m = (Other m)


  export
  fromPrimitive : Prim_CXChildVisitResult -> CXChildVisitResult
  fromPrimitive x = cast x

  export
  Bits CXChildVisitResult where
    Index = Index @{the (Bits Bits32) %search}
    (.&.) x y = fromPrimitive $ (toPrimitive x) .&. (toPrimitive y)
    (.|.) x y = fromPrimitive $ (toPrimitive x) .|. (toPrimitive y)
    xor x y = fromPrimitive $ xor (toPrimitive x) (toPrimitive y)
    shiftL x y = fromPrimitive $ shiftL (toPrimitive x) y
    shiftR x y = fromPrimitive $ shiftR (toPrimitive x) y
    zeroBits = fromPrimitive $ zeroBits
    testBit = testBit . toPrimitive
    bit = fromPrimitive . bit

  export
  Eq CXChildVisitResult where
    (==) x y = (toPrimitive x) == (toPrimitive y)

namespace CXPrintingPolicyProperty
  public export
  Prim_CXPrintingPolicyProperty : Type
  Prim_CXPrintingPolicyProperty = Bits32

  public export
  data CXPrintingPolicyProperty
    = Other Prim_CXPrintingPolicyProperty
    | CXPrintingPolicy_LastProperty
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

  export
  Cast CXPrintingPolicyProperty Prim_CXPrintingPolicyProperty where
    cast CXPrintingPolicy_LastProperty = (25)
    cast CXPrintingPolicy_FullyQualifiedName = (25)
    cast CXPrintingPolicy_SuppressImplicitBase = (24)
    cast CXPrintingPolicy_ConstantsAsWritten = (23)
    cast CXPrintingPolicy_MSVCFormatting = (22)
    cast CXPrintingPolicy_IncludeNewlines = (21)
    cast CXPrintingPolicy_MSWChar = (20)
    cast CXPrintingPolicy_Half = (19)
    cast CXPrintingPolicy_PolishForDeclaration = (18)
    cast CXPrintingPolicy_TerseOutput = (17)
    cast CXPrintingPolicy_UseVoidForZeroParams = (16)
    cast CXPrintingPolicy_UnderscoreAlignof = (15)
    cast CXPrintingPolicy_Alignof = (14)
    cast CXPrintingPolicy_Restrict = (13)
    cast CXPrintingPolicy_Bool = (12)
    cast CXPrintingPolicy_SuppressTemplateArgsInCXXConstructors = (11)
    cast CXPrintingPolicy_SuppressLifetimeQualifiers = (10)
    cast CXPrintingPolicy_SuppressStrongLifetime = (9)
    cast CXPrintingPolicy_AnonymousTagLocations = (8)
    cast CXPrintingPolicy_ConstantArraySizeAsWritten = (7)
    cast CXPrintingPolicy_SuppressInitializers = (6)
    cast CXPrintingPolicy_SuppressUnwrittenScope = (5)
    cast CXPrintingPolicy_SuppressScope = (4)
    cast CXPrintingPolicy_IncludeTagDefinition = (3)
    cast CXPrintingPolicy_SuppressTagKeyword = (2)
    cast CXPrintingPolicy_SuppressSpecifiers = (1)
    cast CXPrintingPolicy_Indentation = (0)
    cast (Other m) = m


  export
  toPrimitive : CXPrintingPolicyProperty -> Prim_CXPrintingPolicyProperty
  toPrimitive x = cast x

  export
  Cast Prim_CXPrintingPolicyProperty CXPrintingPolicyProperty where
    cast (25) = CXPrintingPolicy_LastProperty
    cast (25) = CXPrintingPolicy_FullyQualifiedName
    cast (24) = CXPrintingPolicy_SuppressImplicitBase
    cast (23) = CXPrintingPolicy_ConstantsAsWritten
    cast (22) = CXPrintingPolicy_MSVCFormatting
    cast (21) = CXPrintingPolicy_IncludeNewlines
    cast (20) = CXPrintingPolicy_MSWChar
    cast (19) = CXPrintingPolicy_Half
    cast (18) = CXPrintingPolicy_PolishForDeclaration
    cast (17) = CXPrintingPolicy_TerseOutput
    cast (16) = CXPrintingPolicy_UseVoidForZeroParams
    cast (15) = CXPrintingPolicy_UnderscoreAlignof
    cast (14) = CXPrintingPolicy_Alignof
    cast (13) = CXPrintingPolicy_Restrict
    cast (12) = CXPrintingPolicy_Bool
    cast (11) = CXPrintingPolicy_SuppressTemplateArgsInCXXConstructors
    cast (10) = CXPrintingPolicy_SuppressLifetimeQualifiers
    cast (9) = CXPrintingPolicy_SuppressStrongLifetime
    cast (8) = CXPrintingPolicy_AnonymousTagLocations
    cast (7) = CXPrintingPolicy_ConstantArraySizeAsWritten
    cast (6) = CXPrintingPolicy_SuppressInitializers
    cast (5) = CXPrintingPolicy_SuppressUnwrittenScope
    cast (4) = CXPrintingPolicy_SuppressScope
    cast (3) = CXPrintingPolicy_IncludeTagDefinition
    cast (2) = CXPrintingPolicy_SuppressTagKeyword
    cast (1) = CXPrintingPolicy_SuppressSpecifiers
    cast (0) = CXPrintingPolicy_Indentation
    cast m = (Other m)


  export
  fromPrimitive : Prim_CXPrintingPolicyProperty -> CXPrintingPolicyProperty
  fromPrimitive x = cast x

  export
  Bits CXPrintingPolicyProperty where
    Index = Index @{the (Bits Bits32) %search}
    (.&.) x y = fromPrimitive $ (toPrimitive x) .&. (toPrimitive y)
    (.|.) x y = fromPrimitive $ (toPrimitive x) .|. (toPrimitive y)
    xor x y = fromPrimitive $ xor (toPrimitive x) (toPrimitive y)
    shiftL x y = fromPrimitive $ shiftL (toPrimitive x) y
    shiftR x y = fromPrimitive $ shiftR (toPrimitive x) y
    zeroBits = fromPrimitive $ zeroBits
    testBit = testBit . toPrimitive
    bit = fromPrimitive . bit

  export
  Eq CXPrintingPolicyProperty where
    (==) x y = (toPrimitive x) == (toPrimitive y)

namespace CXObjCPropertyAttrKind
  public export
  Prim_CXObjCPropertyAttrKind : Type
  Prim_CXObjCPropertyAttrKind = Bits32

  public export
  data CXObjCPropertyAttrKind
    = Other Prim_CXObjCPropertyAttrKind
    | CXObjCPropertyAttr_class
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

  export
  Cast CXObjCPropertyAttrKind Prim_CXObjCPropertyAttrKind where
    cast CXObjCPropertyAttr_class = (4096)
    cast CXObjCPropertyAttr_unsafe_unretained = (2048)
    cast CXObjCPropertyAttr_strong = (1024)
    cast CXObjCPropertyAttr_weak = (512)
    cast CXObjCPropertyAttr_atomic = (256)
    cast CXObjCPropertyAttr_setter = (128)
    cast CXObjCPropertyAttr_nonatomic = (64)
    cast CXObjCPropertyAttr_copy = (32)
    cast CXObjCPropertyAttr_retain = (16)
    cast CXObjCPropertyAttr_readwrite = (8)
    cast CXObjCPropertyAttr_assign = (4)
    cast CXObjCPropertyAttr_getter = (2)
    cast CXObjCPropertyAttr_readonly = (1)
    cast CXObjCPropertyAttr_noattr = (0)
    cast (Other m) = m


  export
  toPrimitive : CXObjCPropertyAttrKind -> Prim_CXObjCPropertyAttrKind
  toPrimitive x = cast x

  export
  Cast Prim_CXObjCPropertyAttrKind CXObjCPropertyAttrKind where
    cast (4096) = CXObjCPropertyAttr_class
    cast (2048) = CXObjCPropertyAttr_unsafe_unretained
    cast (1024) = CXObjCPropertyAttr_strong
    cast (512) = CXObjCPropertyAttr_weak
    cast (256) = CXObjCPropertyAttr_atomic
    cast (128) = CXObjCPropertyAttr_setter
    cast (64) = CXObjCPropertyAttr_nonatomic
    cast (32) = CXObjCPropertyAttr_copy
    cast (16) = CXObjCPropertyAttr_retain
    cast (8) = CXObjCPropertyAttr_readwrite
    cast (4) = CXObjCPropertyAttr_assign
    cast (2) = CXObjCPropertyAttr_getter
    cast (1) = CXObjCPropertyAttr_readonly
    cast (0) = CXObjCPropertyAttr_noattr
    cast m = (Other m)


  export
  fromPrimitive : Prim_CXObjCPropertyAttrKind -> CXObjCPropertyAttrKind
  fromPrimitive x = cast x

  export
  Bits CXObjCPropertyAttrKind where
    Index = Index @{the (Bits Bits32) %search}
    (.&.) x y = fromPrimitive $ (toPrimitive x) .&. (toPrimitive y)
    (.|.) x y = fromPrimitive $ (toPrimitive x) .|. (toPrimitive y)
    xor x y = fromPrimitive $ xor (toPrimitive x) (toPrimitive y)
    shiftL x y = fromPrimitive $ shiftL (toPrimitive x) y
    shiftR x y = fromPrimitive $ shiftR (toPrimitive x) y
    zeroBits = fromPrimitive $ zeroBits
    testBit = testBit . toPrimitive
    bit = fromPrimitive . bit

  export
  Eq CXObjCPropertyAttrKind where
    (==) x y = (toPrimitive x) == (toPrimitive y)

namespace CXObjCDeclQualifierKind
  public export
  Prim_CXObjCDeclQualifierKind : Type
  Prim_CXObjCDeclQualifierKind = Bits32

  public export
  data CXObjCDeclQualifierKind
    = Other Prim_CXObjCDeclQualifierKind
    | CXObjCDeclQualifier_Oneway
    | CXObjCDeclQualifier_Byref
    | CXObjCDeclQualifier_Bycopy
    | CXObjCDeclQualifier_Out
    | CXObjCDeclQualifier_Inout
    | CXObjCDeclQualifier_In
    | CXObjCDeclQualifier_None

  export
  Cast CXObjCDeclQualifierKind Prim_CXObjCDeclQualifierKind where
    cast CXObjCDeclQualifier_Oneway = (32)
    cast CXObjCDeclQualifier_Byref = (16)
    cast CXObjCDeclQualifier_Bycopy = (8)
    cast CXObjCDeclQualifier_Out = (4)
    cast CXObjCDeclQualifier_Inout = (2)
    cast CXObjCDeclQualifier_In = (1)
    cast CXObjCDeclQualifier_None = (0)
    cast (Other m) = m


  export
  toPrimitive : CXObjCDeclQualifierKind -> Prim_CXObjCDeclQualifierKind
  toPrimitive x = cast x

  export
  Cast Prim_CXObjCDeclQualifierKind CXObjCDeclQualifierKind where
    cast (32) = CXObjCDeclQualifier_Oneway
    cast (16) = CXObjCDeclQualifier_Byref
    cast (8) = CXObjCDeclQualifier_Bycopy
    cast (4) = CXObjCDeclQualifier_Out
    cast (2) = CXObjCDeclQualifier_Inout
    cast (1) = CXObjCDeclQualifier_In
    cast (0) = CXObjCDeclQualifier_None
    cast m = (Other m)


  export
  fromPrimitive : Prim_CXObjCDeclQualifierKind -> CXObjCDeclQualifierKind
  fromPrimitive x = cast x

  export
  Bits CXObjCDeclQualifierKind where
    Index = Index @{the (Bits Bits32) %search}
    (.&.) x y = fromPrimitive $ (toPrimitive x) .&. (toPrimitive y)
    (.|.) x y = fromPrimitive $ (toPrimitive x) .|. (toPrimitive y)
    xor x y = fromPrimitive $ xor (toPrimitive x) (toPrimitive y)
    shiftL x y = fromPrimitive $ shiftL (toPrimitive x) y
    shiftR x y = fromPrimitive $ shiftR (toPrimitive x) y
    zeroBits = fromPrimitive $ zeroBits
    testBit = testBit . toPrimitive
    bit = fromPrimitive . bit

  export
  Eq CXObjCDeclQualifierKind where
    (==) x y = (toPrimitive x) == (toPrimitive y)

namespace CXNameRefFlags
  public export
  Prim_CXNameRefFlags : Type
  Prim_CXNameRefFlags = Bits32

  public export
  data CXNameRefFlags
    = Other Prim_CXNameRefFlags
    | CXNameRange_WantSinglePiece
    | CXNameRange_WantTemplateArgs
    | CXNameRange_WantQualifier

  export
  Cast CXNameRefFlags Prim_CXNameRefFlags where
    cast CXNameRange_WantSinglePiece = (4)
    cast CXNameRange_WantTemplateArgs = (2)
    cast CXNameRange_WantQualifier = (1)
    cast (Other m) = m


  export
  toPrimitive : CXNameRefFlags -> Prim_CXNameRefFlags
  toPrimitive x = cast x

  export
  Cast Prim_CXNameRefFlags CXNameRefFlags where
    cast (4) = CXNameRange_WantSinglePiece
    cast (2) = CXNameRange_WantTemplateArgs
    cast (1) = CXNameRange_WantQualifier
    cast m = (Other m)


  export
  fromPrimitive : Prim_CXNameRefFlags -> CXNameRefFlags
  fromPrimitive x = cast x

  export
  Bits CXNameRefFlags where
    Index = Index @{the (Bits Bits32) %search}
    (.&.) x y = fromPrimitive $ (toPrimitive x) .&. (toPrimitive y)
    (.|.) x y = fromPrimitive $ (toPrimitive x) .|. (toPrimitive y)
    xor x y = fromPrimitive $ xor (toPrimitive x) (toPrimitive y)
    shiftL x y = fromPrimitive $ shiftL (toPrimitive x) y
    shiftR x y = fromPrimitive $ shiftR (toPrimitive x) y
    zeroBits = fromPrimitive $ zeroBits
    testBit = testBit . toPrimitive
    bit = fromPrimitive . bit

  export
  Eq CXNameRefFlags where
    (==) x y = (toPrimitive x) == (toPrimitive y)

namespace CXTokenKind
  public export
  Prim_CXTokenKind : Type
  Prim_CXTokenKind = Bits32

  public export
  data CXTokenKind
    = Other Prim_CXTokenKind
    | CXToken_Comment
    | CXToken_Literal
    | CXToken_Identifier
    | CXToken_Keyword
    | CXToken_Punctuation

  export
  Cast CXTokenKind Prim_CXTokenKind where
    cast CXToken_Comment = (4)
    cast CXToken_Literal = (3)
    cast CXToken_Identifier = (2)
    cast CXToken_Keyword = (1)
    cast CXToken_Punctuation = (0)
    cast (Other m) = m


  export
  toPrimitive : CXTokenKind -> Prim_CXTokenKind
  toPrimitive x = cast x

  export
  Cast Prim_CXTokenKind CXTokenKind where
    cast (4) = CXToken_Comment
    cast (3) = CXToken_Literal
    cast (2) = CXToken_Identifier
    cast (1) = CXToken_Keyword
    cast (0) = CXToken_Punctuation
    cast m = (Other m)


  export
  fromPrimitive : Prim_CXTokenKind -> CXTokenKind
  fromPrimitive x = cast x

  export
  Bits CXTokenKind where
    Index = Index @{the (Bits Bits32) %search}
    (.&.) x y = fromPrimitive $ (toPrimitive x) .&. (toPrimitive y)
    (.|.) x y = fromPrimitive $ (toPrimitive x) .|. (toPrimitive y)
    xor x y = fromPrimitive $ xor (toPrimitive x) (toPrimitive y)
    shiftL x y = fromPrimitive $ shiftL (toPrimitive x) y
    shiftR x y = fromPrimitive $ shiftR (toPrimitive x) y
    zeroBits = fromPrimitive $ zeroBits
    testBit = testBit . toPrimitive
    bit = fromPrimitive . bit

  export
  Eq CXTokenKind where
    (==) x y = (toPrimitive x) == (toPrimitive y)

namespace CXCompletionChunkKind
  public export
  Prim_CXCompletionChunkKind : Type
  Prim_CXCompletionChunkKind = Bits32

  public export
  data CXCompletionChunkKind
    = Other Prim_CXCompletionChunkKind
    | CXCompletionChunk_VerticalSpace
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

  export
  Cast CXCompletionChunkKind Prim_CXCompletionChunkKind where
    cast CXCompletionChunk_VerticalSpace = (20)
    cast CXCompletionChunk_HorizontalSpace = (19)
    cast CXCompletionChunk_Equal = (18)
    cast CXCompletionChunk_SemiColon = (17)
    cast CXCompletionChunk_Colon = (16)
    cast CXCompletionChunk_ResultType = (15)
    cast CXCompletionChunk_Comma = (14)
    cast CXCompletionChunk_RightAngle = (13)
    cast CXCompletionChunk_LeftAngle = (12)
    cast CXCompletionChunk_RightBrace = (11)
    cast CXCompletionChunk_LeftBrace = (10)
    cast CXCompletionChunk_RightBracket = (9)
    cast CXCompletionChunk_LeftBracket = (8)
    cast CXCompletionChunk_RightParen = (7)
    cast CXCompletionChunk_LeftParen = (6)
    cast CXCompletionChunk_CurrentParameter = (5)
    cast CXCompletionChunk_Informative = (4)
    cast CXCompletionChunk_Placeholder = (3)
    cast CXCompletionChunk_Text = (2)
    cast CXCompletionChunk_TypedText = (1)
    cast CXCompletionChunk_Optional = (0)
    cast (Other m) = m


  export
  toPrimitive : CXCompletionChunkKind -> Prim_CXCompletionChunkKind
  toPrimitive x = cast x

  export
  Cast Prim_CXCompletionChunkKind CXCompletionChunkKind where
    cast (20) = CXCompletionChunk_VerticalSpace
    cast (19) = CXCompletionChunk_HorizontalSpace
    cast (18) = CXCompletionChunk_Equal
    cast (17) = CXCompletionChunk_SemiColon
    cast (16) = CXCompletionChunk_Colon
    cast (15) = CXCompletionChunk_ResultType
    cast (14) = CXCompletionChunk_Comma
    cast (13) = CXCompletionChunk_RightAngle
    cast (12) = CXCompletionChunk_LeftAngle
    cast (11) = CXCompletionChunk_RightBrace
    cast (10) = CXCompletionChunk_LeftBrace
    cast (9) = CXCompletionChunk_RightBracket
    cast (8) = CXCompletionChunk_LeftBracket
    cast (7) = CXCompletionChunk_RightParen
    cast (6) = CXCompletionChunk_LeftParen
    cast (5) = CXCompletionChunk_CurrentParameter
    cast (4) = CXCompletionChunk_Informative
    cast (3) = CXCompletionChunk_Placeholder
    cast (2) = CXCompletionChunk_Text
    cast (1) = CXCompletionChunk_TypedText
    cast (0) = CXCompletionChunk_Optional
    cast m = (Other m)


  export
  fromPrimitive : Prim_CXCompletionChunkKind -> CXCompletionChunkKind
  fromPrimitive x = cast x

  export
  Bits CXCompletionChunkKind where
    Index = Index @{the (Bits Bits32) %search}
    (.&.) x y = fromPrimitive $ (toPrimitive x) .&. (toPrimitive y)
    (.|.) x y = fromPrimitive $ (toPrimitive x) .|. (toPrimitive y)
    xor x y = fromPrimitive $ xor (toPrimitive x) (toPrimitive y)
    shiftL x y = fromPrimitive $ shiftL (toPrimitive x) y
    shiftR x y = fromPrimitive $ shiftR (toPrimitive x) y
    zeroBits = fromPrimitive $ zeroBits
    testBit = testBit . toPrimitive
    bit = fromPrimitive . bit

  export
  Eq CXCompletionChunkKind where
    (==) x y = (toPrimitive x) == (toPrimitive y)

namespace CXCodeComplete_Flags
  public export
  Prim_CXCodeComplete_Flags : Type
  Prim_CXCodeComplete_Flags = Bits32

  public export
  data CXCodeComplete_Flags
    = Other Prim_CXCodeComplete_Flags
    | CXCodeComplete_IncludeCompletionsWithFixIts
    | CXCodeComplete_SkipPreamble
    | CXCodeComplete_IncludeBriefComments
    | CXCodeComplete_IncludeCodePatterns
    | CXCodeComplete_IncludeMacros

  export
  Cast CXCodeComplete_Flags Prim_CXCodeComplete_Flags where
    cast CXCodeComplete_IncludeCompletionsWithFixIts = (16)
    cast CXCodeComplete_SkipPreamble = (8)
    cast CXCodeComplete_IncludeBriefComments = (4)
    cast CXCodeComplete_IncludeCodePatterns = (2)
    cast CXCodeComplete_IncludeMacros = (1)
    cast (Other m) = m


  export
  toPrimitive : CXCodeComplete_Flags -> Prim_CXCodeComplete_Flags
  toPrimitive x = cast x

  export
  Cast Prim_CXCodeComplete_Flags CXCodeComplete_Flags where
    cast (16) = CXCodeComplete_IncludeCompletionsWithFixIts
    cast (8) = CXCodeComplete_SkipPreamble
    cast (4) = CXCodeComplete_IncludeBriefComments
    cast (2) = CXCodeComplete_IncludeCodePatterns
    cast (1) = CXCodeComplete_IncludeMacros
    cast m = (Other m)


  export
  fromPrimitive : Prim_CXCodeComplete_Flags -> CXCodeComplete_Flags
  fromPrimitive x = cast x

  export
  Bits CXCodeComplete_Flags where
    Index = Index @{the (Bits Bits32) %search}
    (.&.) x y = fromPrimitive $ (toPrimitive x) .&. (toPrimitive y)
    (.|.) x y = fromPrimitive $ (toPrimitive x) .|. (toPrimitive y)
    xor x y = fromPrimitive $ xor (toPrimitive x) (toPrimitive y)
    shiftL x y = fromPrimitive $ shiftL (toPrimitive x) y
    shiftR x y = fromPrimitive $ shiftR (toPrimitive x) y
    zeroBits = fromPrimitive $ zeroBits
    testBit = testBit . toPrimitive
    bit = fromPrimitive . bit

  export
  Eq CXCodeComplete_Flags where
    (==) x y = (toPrimitive x) == (toPrimitive y)

namespace CXCompletionContext
  public export
  Prim_CXCompletionContext : Type
  Prim_CXCompletionContext = Bits32

  public export
  data CXCompletionContext
    = Other Prim_CXCompletionContext
    | CXCompletionContext_Unknown
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

  export
  Cast CXCompletionContext Prim_CXCompletionContext where
    cast CXCompletionContext_Unknown = (8388607)
    cast CXCompletionContext_IncludedFile = (4194304)
    cast CXCompletionContext_NaturalLanguage = (2097152)
    cast CXCompletionContext_MacroName = (1048576)
    cast CXCompletionContext_ObjCSelectorName = (524288)
    cast CXCompletionContext_ObjCClassMessage = (262144)
    cast CXCompletionContext_ObjCInstanceMessage = (131072)
    cast CXCompletionContext_ObjCCategory = (65536)
    cast CXCompletionContext_ObjCProtocol = (32768)
    cast CXCompletionContext_ObjCInterface = (16384)
    cast CXCompletionContext_NestedNameSpecifier = (8192)
    cast CXCompletionContext_Namespace = (4096)
    cast CXCompletionContext_ClassTag = (2048)
    cast CXCompletionContext_StructTag = (1024)
    cast CXCompletionContext_UnionTag = (512)
    cast CXCompletionContext_EnumTag = (256)
    cast CXCompletionContext_ObjCPropertyAccess = (128)
    cast CXCompletionContext_ArrowMemberAccess = (64)
    cast CXCompletionContext_DotMemberAccess = (32)
    cast CXCompletionContext_CXXClassTypeValue = (16)
    cast CXCompletionContext_ObjCSelectorValue = (8)
    cast CXCompletionContext_ObjCObjectValue = (4)
    cast CXCompletionContext_AnyValue = (2)
    cast CXCompletionContext_AnyType = (1)
    cast CXCompletionContext_Unexposed = (0)
    cast (Other m) = m


  export
  toPrimitive : CXCompletionContext -> Prim_CXCompletionContext
  toPrimitive x = cast x

  export
  Cast Prim_CXCompletionContext CXCompletionContext where
    cast (8388607) = CXCompletionContext_Unknown
    cast (4194304) = CXCompletionContext_IncludedFile
    cast (2097152) = CXCompletionContext_NaturalLanguage
    cast (1048576) = CXCompletionContext_MacroName
    cast (524288) = CXCompletionContext_ObjCSelectorName
    cast (262144) = CXCompletionContext_ObjCClassMessage
    cast (131072) = CXCompletionContext_ObjCInstanceMessage
    cast (65536) = CXCompletionContext_ObjCCategory
    cast (32768) = CXCompletionContext_ObjCProtocol
    cast (16384) = CXCompletionContext_ObjCInterface
    cast (8192) = CXCompletionContext_NestedNameSpecifier
    cast (4096) = CXCompletionContext_Namespace
    cast (2048) = CXCompletionContext_ClassTag
    cast (1024) = CXCompletionContext_StructTag
    cast (512) = CXCompletionContext_UnionTag
    cast (256) = CXCompletionContext_EnumTag
    cast (128) = CXCompletionContext_ObjCPropertyAccess
    cast (64) = CXCompletionContext_ArrowMemberAccess
    cast (32) = CXCompletionContext_DotMemberAccess
    cast (16) = CXCompletionContext_CXXClassTypeValue
    cast (8) = CXCompletionContext_ObjCSelectorValue
    cast (4) = CXCompletionContext_ObjCObjectValue
    cast (2) = CXCompletionContext_AnyValue
    cast (1) = CXCompletionContext_AnyType
    cast (0) = CXCompletionContext_Unexposed
    cast m = (Other m)


  export
  fromPrimitive : Prim_CXCompletionContext -> CXCompletionContext
  fromPrimitive x = cast x

  export
  Bits CXCompletionContext where
    Index = Index @{the (Bits Bits32) %search}
    (.&.) x y = fromPrimitive $ (toPrimitive x) .&. (toPrimitive y)
    (.|.) x y = fromPrimitive $ (toPrimitive x) .|. (toPrimitive y)
    xor x y = fromPrimitive $ xor (toPrimitive x) (toPrimitive y)
    shiftL x y = fromPrimitive $ shiftL (toPrimitive x) y
    shiftR x y = fromPrimitive $ shiftR (toPrimitive x) y
    zeroBits = fromPrimitive $ zeroBits
    testBit = testBit . toPrimitive
    bit = fromPrimitive . bit

  export
  Eq CXCompletionContext where
    (==) x y = (toPrimitive x) == (toPrimitive y)

namespace CXEvalResultKind
  public export
  Prim_CXEvalResultKind : Type
  Prim_CXEvalResultKind = Bits32

  public export
  data CXEvalResultKind
    = Other Prim_CXEvalResultKind
    | CXEval_UnExposed
    | CXEval_Other
    | CXEval_CFStr
    | CXEval_StrLiteral
    | CXEval_ObjCStrLiteral
    | CXEval_Float
    | CXEval_Int

  export
  Cast CXEvalResultKind Prim_CXEvalResultKind where
    cast CXEval_UnExposed = (0)
    cast CXEval_Other = (6)
    cast CXEval_CFStr = (5)
    cast CXEval_StrLiteral = (4)
    cast CXEval_ObjCStrLiteral = (3)
    cast CXEval_Float = (2)
    cast CXEval_Int = (1)
    cast (Other m) = m


  export
  toPrimitive : CXEvalResultKind -> Prim_CXEvalResultKind
  toPrimitive x = cast x

  export
  Cast Prim_CXEvalResultKind CXEvalResultKind where
    cast (0) = CXEval_UnExposed
    cast (6) = CXEval_Other
    cast (5) = CXEval_CFStr
    cast (4) = CXEval_StrLiteral
    cast (3) = CXEval_ObjCStrLiteral
    cast (2) = CXEval_Float
    cast (1) = CXEval_Int
    cast m = (Other m)


  export
  fromPrimitive : Prim_CXEvalResultKind -> CXEvalResultKind
  fromPrimitive x = cast x

  export
  Bits CXEvalResultKind where
    Index = Index @{the (Bits Bits32) %search}
    (.&.) x y = fromPrimitive $ (toPrimitive x) .&. (toPrimitive y)
    (.|.) x y = fromPrimitive $ (toPrimitive x) .|. (toPrimitive y)
    xor x y = fromPrimitive $ xor (toPrimitive x) (toPrimitive y)
    shiftL x y = fromPrimitive $ shiftL (toPrimitive x) y
    shiftR x y = fromPrimitive $ shiftR (toPrimitive x) y
    zeroBits = fromPrimitive $ zeroBits
    testBit = testBit . toPrimitive
    bit = fromPrimitive . bit

  export
  Eq CXEvalResultKind where
    (==) x y = (toPrimitive x) == (toPrimitive y)

namespace CXVisitorResult
  public export
  Prim_CXVisitorResult : Type
  Prim_CXVisitorResult = Bits32

  public export
  data CXVisitorResult
    = Other Prim_CXVisitorResult
    | CXVisit_Continue
    | CXVisit_Break

  export
  Cast CXVisitorResult Prim_CXVisitorResult where
    cast CXVisit_Continue = (1)
    cast CXVisit_Break = (0)
    cast (Other m) = m


  export
  toPrimitive : CXVisitorResult -> Prim_CXVisitorResult
  toPrimitive x = cast x

  export
  Cast Prim_CXVisitorResult CXVisitorResult where
    cast (1) = CXVisit_Continue
    cast (0) = CXVisit_Break
    cast m = (Other m)


  export
  fromPrimitive : Prim_CXVisitorResult -> CXVisitorResult
  fromPrimitive x = cast x

  export
  Bits CXVisitorResult where
    Index = Index @{the (Bits Bits32) %search}
    (.&.) x y = fromPrimitive $ (toPrimitive x) .&. (toPrimitive y)
    (.|.) x y = fromPrimitive $ (toPrimitive x) .|. (toPrimitive y)
    xor x y = fromPrimitive $ xor (toPrimitive x) (toPrimitive y)
    shiftL x y = fromPrimitive $ shiftL (toPrimitive x) y
    shiftR x y = fromPrimitive $ shiftR (toPrimitive x) y
    zeroBits = fromPrimitive $ zeroBits
    testBit = testBit . toPrimitive
    bit = fromPrimitive . bit

  export
  Eq CXVisitorResult where
    (==) x y = (toPrimitive x) == (toPrimitive y)

namespace CXResult
  public export
  Prim_CXResult : Type
  Prim_CXResult = Bits32

  public export
  data CXResult
    = Other Prim_CXResult
    | CXResult_VisitBreak
    | CXResult_Invalid
    | CXResult_Success

  export
  Cast CXResult Prim_CXResult where
    cast CXResult_VisitBreak = (2)
    cast CXResult_Invalid = (1)
    cast CXResult_Success = (0)
    cast (Other m) = m


  export
  toPrimitive : CXResult -> Prim_CXResult
  toPrimitive x = cast x

  export
  Cast Prim_CXResult CXResult where
    cast (2) = CXResult_VisitBreak
    cast (1) = CXResult_Invalid
    cast (0) = CXResult_Success
    cast m = (Other m)


  export
  fromPrimitive : Prim_CXResult -> CXResult
  fromPrimitive x = cast x

  export
  Bits CXResult where
    Index = Index @{the (Bits Bits32) %search}
    (.&.) x y = fromPrimitive $ (toPrimitive x) .&. (toPrimitive y)
    (.|.) x y = fromPrimitive $ (toPrimitive x) .|. (toPrimitive y)
    xor x y = fromPrimitive $ xor (toPrimitive x) (toPrimitive y)
    shiftL x y = fromPrimitive $ shiftL (toPrimitive x) y
    shiftR x y = fromPrimitive $ shiftR (toPrimitive x) y
    zeroBits = fromPrimitive $ zeroBits
    testBit = testBit . toPrimitive
    bit = fromPrimitive . bit

  export
  Eq CXResult where
    (==) x y = (toPrimitive x) == (toPrimitive y)

namespace CXIdxEntityKind
  public export
  Prim_CXIdxEntityKind : Type
  Prim_CXIdxEntityKind = Bits32

  public export
  data CXIdxEntityKind
    = Other Prim_CXIdxEntityKind
    | CXIdxEntity_CXXConcept
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

  export
  Cast CXIdxEntityKind Prim_CXIdxEntityKind where
    cast CXIdxEntity_CXXConcept = (27)
    cast CXIdxEntity_CXXInterface = (26)
    cast CXIdxEntity_CXXTypeAlias = (25)
    cast CXIdxEntity_CXXConversionFunction = (24)
    cast CXIdxEntity_CXXDestructor = (23)
    cast CXIdxEntity_CXXConstructor = (22)
    cast CXIdxEntity_CXXInstanceMethod = (21)
    cast CXIdxEntity_CXXStaticMethod = (20)
    cast CXIdxEntity_CXXStaticVariable = (19)
    cast CXIdxEntity_CXXNamespaceAlias = (18)
    cast CXIdxEntity_CXXNamespace = (17)
    cast CXIdxEntity_CXXClass = (16)
    cast CXIdxEntity_Union = (15)
    cast CXIdxEntity_Struct = (14)
    cast CXIdxEntity_Enum = (13)
    cast CXIdxEntity_ObjCIvar = (12)
    cast CXIdxEntity_ObjCProperty = (11)
    cast CXIdxEntity_ObjCClassMethod = (10)
    cast CXIdxEntity_ObjCInstanceMethod = (9)
    cast CXIdxEntity_ObjCCategory = (8)
    cast CXIdxEntity_ObjCProtocol = (7)
    cast CXIdxEntity_ObjCClass = (6)
    cast CXIdxEntity_EnumConstant = (5)
    cast CXIdxEntity_Field = (4)
    cast CXIdxEntity_Variable = (3)
    cast CXIdxEntity_Function = (2)
    cast CXIdxEntity_Typedef = (1)
    cast CXIdxEntity_Unexposed = (0)
    cast (Other m) = m


  export
  toPrimitive : CXIdxEntityKind -> Prim_CXIdxEntityKind
  toPrimitive x = cast x

  export
  Cast Prim_CXIdxEntityKind CXIdxEntityKind where
    cast (27) = CXIdxEntity_CXXConcept
    cast (26) = CXIdxEntity_CXXInterface
    cast (25) = CXIdxEntity_CXXTypeAlias
    cast (24) = CXIdxEntity_CXXConversionFunction
    cast (23) = CXIdxEntity_CXXDestructor
    cast (22) = CXIdxEntity_CXXConstructor
    cast (21) = CXIdxEntity_CXXInstanceMethod
    cast (20) = CXIdxEntity_CXXStaticMethod
    cast (19) = CXIdxEntity_CXXStaticVariable
    cast (18) = CXIdxEntity_CXXNamespaceAlias
    cast (17) = CXIdxEntity_CXXNamespace
    cast (16) = CXIdxEntity_CXXClass
    cast (15) = CXIdxEntity_Union
    cast (14) = CXIdxEntity_Struct
    cast (13) = CXIdxEntity_Enum
    cast (12) = CXIdxEntity_ObjCIvar
    cast (11) = CXIdxEntity_ObjCProperty
    cast (10) = CXIdxEntity_ObjCClassMethod
    cast (9) = CXIdxEntity_ObjCInstanceMethod
    cast (8) = CXIdxEntity_ObjCCategory
    cast (7) = CXIdxEntity_ObjCProtocol
    cast (6) = CXIdxEntity_ObjCClass
    cast (5) = CXIdxEntity_EnumConstant
    cast (4) = CXIdxEntity_Field
    cast (3) = CXIdxEntity_Variable
    cast (2) = CXIdxEntity_Function
    cast (1) = CXIdxEntity_Typedef
    cast (0) = CXIdxEntity_Unexposed
    cast m = (Other m)


  export
  fromPrimitive : Prim_CXIdxEntityKind -> CXIdxEntityKind
  fromPrimitive x = cast x

  export
  Bits CXIdxEntityKind where
    Index = Index @{the (Bits Bits32) %search}
    (.&.) x y = fromPrimitive $ (toPrimitive x) .&. (toPrimitive y)
    (.|.) x y = fromPrimitive $ (toPrimitive x) .|. (toPrimitive y)
    xor x y = fromPrimitive $ xor (toPrimitive x) (toPrimitive y)
    shiftL x y = fromPrimitive $ shiftL (toPrimitive x) y
    shiftR x y = fromPrimitive $ shiftR (toPrimitive x) y
    zeroBits = fromPrimitive $ zeroBits
    testBit = testBit . toPrimitive
    bit = fromPrimitive . bit

  export
  Eq CXIdxEntityKind where
    (==) x y = (toPrimitive x) == (toPrimitive y)

namespace CXIdxEntityLanguage
  public export
  Prim_CXIdxEntityLanguage : Type
  Prim_CXIdxEntityLanguage = Bits32

  public export
  data CXIdxEntityLanguage
    = Other Prim_CXIdxEntityLanguage
    | CXIdxEntityLang_Swift
    | CXIdxEntityLang_CXX
    | CXIdxEntityLang_ObjC
    | CXIdxEntityLang_C
    | CXIdxEntityLang_None

  export
  Cast CXIdxEntityLanguage Prim_CXIdxEntityLanguage where
    cast CXIdxEntityLang_Swift = (4)
    cast CXIdxEntityLang_CXX = (3)
    cast CXIdxEntityLang_ObjC = (2)
    cast CXIdxEntityLang_C = (1)
    cast CXIdxEntityLang_None = (0)
    cast (Other m) = m


  export
  toPrimitive : CXIdxEntityLanguage -> Prim_CXIdxEntityLanguage
  toPrimitive x = cast x

  export
  Cast Prim_CXIdxEntityLanguage CXIdxEntityLanguage where
    cast (4) = CXIdxEntityLang_Swift
    cast (3) = CXIdxEntityLang_CXX
    cast (2) = CXIdxEntityLang_ObjC
    cast (1) = CXIdxEntityLang_C
    cast (0) = CXIdxEntityLang_None
    cast m = (Other m)


  export
  fromPrimitive : Prim_CXIdxEntityLanguage -> CXIdxEntityLanguage
  fromPrimitive x = cast x

  export
  Bits CXIdxEntityLanguage where
    Index = Index @{the (Bits Bits32) %search}
    (.&.) x y = fromPrimitive $ (toPrimitive x) .&. (toPrimitive y)
    (.|.) x y = fromPrimitive $ (toPrimitive x) .|. (toPrimitive y)
    xor x y = fromPrimitive $ xor (toPrimitive x) (toPrimitive y)
    shiftL x y = fromPrimitive $ shiftL (toPrimitive x) y
    shiftR x y = fromPrimitive $ shiftR (toPrimitive x) y
    zeroBits = fromPrimitive $ zeroBits
    testBit = testBit . toPrimitive
    bit = fromPrimitive . bit

  export
  Eq CXIdxEntityLanguage where
    (==) x y = (toPrimitive x) == (toPrimitive y)

namespace CXIdxEntityCXXTemplateKind
  public export
  Prim_CXIdxEntityCXXTemplateKind : Type
  Prim_CXIdxEntityCXXTemplateKind = Bits32

  public export
  data CXIdxEntityCXXTemplateKind
    = Other Prim_CXIdxEntityCXXTemplateKind
    | CXIdxEntity_TemplateSpecialization
    | CXIdxEntity_TemplatePartialSpecialization
    | CXIdxEntity_Template
    | CXIdxEntity_NonTemplate

  export
  Cast CXIdxEntityCXXTemplateKind Prim_CXIdxEntityCXXTemplateKind where
    cast CXIdxEntity_TemplateSpecialization = (3)
    cast CXIdxEntity_TemplatePartialSpecialization = (2)
    cast CXIdxEntity_Template = (1)
    cast CXIdxEntity_NonTemplate = (0)
    cast (Other m) = m


  export
  toPrimitive : CXIdxEntityCXXTemplateKind -> Prim_CXIdxEntityCXXTemplateKind
  toPrimitive x = cast x

  export
  Cast Prim_CXIdxEntityCXXTemplateKind CXIdxEntityCXXTemplateKind where
    cast (3) = CXIdxEntity_TemplateSpecialization
    cast (2) = CXIdxEntity_TemplatePartialSpecialization
    cast (1) = CXIdxEntity_Template
    cast (0) = CXIdxEntity_NonTemplate
    cast m = (Other m)


  export
  fromPrimitive : Prim_CXIdxEntityCXXTemplateKind -> CXIdxEntityCXXTemplateKind
  fromPrimitive x = cast x

  export
  Bits CXIdxEntityCXXTemplateKind where
    Index = Index @{the (Bits Bits32) %search}
    (.&.) x y = fromPrimitive $ (toPrimitive x) .&. (toPrimitive y)
    (.|.) x y = fromPrimitive $ (toPrimitive x) .|. (toPrimitive y)
    xor x y = fromPrimitive $ xor (toPrimitive x) (toPrimitive y)
    shiftL x y = fromPrimitive $ shiftL (toPrimitive x) y
    shiftR x y = fromPrimitive $ shiftR (toPrimitive x) y
    zeroBits = fromPrimitive $ zeroBits
    testBit = testBit . toPrimitive
    bit = fromPrimitive . bit

  export
  Eq CXIdxEntityCXXTemplateKind where
    (==) x y = (toPrimitive x) == (toPrimitive y)

namespace CXIdxAttrKind
  public export
  Prim_CXIdxAttrKind : Type
  Prim_CXIdxAttrKind = Bits32

  public export
  data CXIdxAttrKind
    = Other Prim_CXIdxAttrKind
    | CXIdxAttr_IBOutletCollection
    | CXIdxAttr_IBOutlet
    | CXIdxAttr_IBAction
    | CXIdxAttr_Unexposed

  export
  Cast CXIdxAttrKind Prim_CXIdxAttrKind where
    cast CXIdxAttr_IBOutletCollection = (3)
    cast CXIdxAttr_IBOutlet = (2)
    cast CXIdxAttr_IBAction = (1)
    cast CXIdxAttr_Unexposed = (0)
    cast (Other m) = m


  export
  toPrimitive : CXIdxAttrKind -> Prim_CXIdxAttrKind
  toPrimitive x = cast x

  export
  Cast Prim_CXIdxAttrKind CXIdxAttrKind where
    cast (3) = CXIdxAttr_IBOutletCollection
    cast (2) = CXIdxAttr_IBOutlet
    cast (1) = CXIdxAttr_IBAction
    cast (0) = CXIdxAttr_Unexposed
    cast m = (Other m)


  export
  fromPrimitive : Prim_CXIdxAttrKind -> CXIdxAttrKind
  fromPrimitive x = cast x

  export
  Bits CXIdxAttrKind where
    Index = Index @{the (Bits Bits32) %search}
    (.&.) x y = fromPrimitive $ (toPrimitive x) .&. (toPrimitive y)
    (.|.) x y = fromPrimitive $ (toPrimitive x) .|. (toPrimitive y)
    xor x y = fromPrimitive $ xor (toPrimitive x) (toPrimitive y)
    shiftL x y = fromPrimitive $ shiftL (toPrimitive x) y
    shiftR x y = fromPrimitive $ shiftR (toPrimitive x) y
    zeroBits = fromPrimitive $ zeroBits
    testBit = testBit . toPrimitive
    bit = fromPrimitive . bit

  export
  Eq CXIdxAttrKind where
    (==) x y = (toPrimitive x) == (toPrimitive y)

namespace CXIdxDeclInfoFlags
  public export
  Prim_CXIdxDeclInfoFlags : Type
  Prim_CXIdxDeclInfoFlags = Bits32

  public export
  data CXIdxDeclInfoFlags
    = Other Prim_CXIdxDeclInfoFlags
    | CXIdxDeclFlag_Skipped

  export
  Cast CXIdxDeclInfoFlags Prim_CXIdxDeclInfoFlags where
    cast CXIdxDeclFlag_Skipped = (1)
    cast (Other m) = m


  export
  toPrimitive : CXIdxDeclInfoFlags -> Prim_CXIdxDeclInfoFlags
  toPrimitive x = cast x

  export
  Cast Prim_CXIdxDeclInfoFlags CXIdxDeclInfoFlags where
    cast (1) = CXIdxDeclFlag_Skipped
    cast m = (Other m)


  export
  fromPrimitive : Prim_CXIdxDeclInfoFlags -> CXIdxDeclInfoFlags
  fromPrimitive x = cast x

  export
  Bits CXIdxDeclInfoFlags where
    Index = Index @{the (Bits Bits32) %search}
    (.&.) x y = fromPrimitive $ (toPrimitive x) .&. (toPrimitive y)
    (.|.) x y = fromPrimitive $ (toPrimitive x) .|. (toPrimitive y)
    xor x y = fromPrimitive $ xor (toPrimitive x) (toPrimitive y)
    shiftL x y = fromPrimitive $ shiftL (toPrimitive x) y
    shiftR x y = fromPrimitive $ shiftR (toPrimitive x) y
    zeroBits = fromPrimitive $ zeroBits
    testBit = testBit . toPrimitive
    bit = fromPrimitive . bit

  export
  Eq CXIdxDeclInfoFlags where
    (==) x y = (toPrimitive x) == (toPrimitive y)

namespace CXIdxObjCContainerKind
  public export
  Prim_CXIdxObjCContainerKind : Type
  Prim_CXIdxObjCContainerKind = Bits32

  public export
  data CXIdxObjCContainerKind
    = Other Prim_CXIdxObjCContainerKind
    | CXIdxObjCContainer_Implementation
    | CXIdxObjCContainer_Interface
    | CXIdxObjCContainer_ForwardRef

  export
  Cast CXIdxObjCContainerKind Prim_CXIdxObjCContainerKind where
    cast CXIdxObjCContainer_Implementation = (2)
    cast CXIdxObjCContainer_Interface = (1)
    cast CXIdxObjCContainer_ForwardRef = (0)
    cast (Other m) = m


  export
  toPrimitive : CXIdxObjCContainerKind -> Prim_CXIdxObjCContainerKind
  toPrimitive x = cast x

  export
  Cast Prim_CXIdxObjCContainerKind CXIdxObjCContainerKind where
    cast (2) = CXIdxObjCContainer_Implementation
    cast (1) = CXIdxObjCContainer_Interface
    cast (0) = CXIdxObjCContainer_ForwardRef
    cast m = (Other m)


  export
  fromPrimitive : Prim_CXIdxObjCContainerKind -> CXIdxObjCContainerKind
  fromPrimitive x = cast x

  export
  Bits CXIdxObjCContainerKind where
    Index = Index @{the (Bits Bits32) %search}
    (.&.) x y = fromPrimitive $ (toPrimitive x) .&. (toPrimitive y)
    (.|.) x y = fromPrimitive $ (toPrimitive x) .|. (toPrimitive y)
    xor x y = fromPrimitive $ xor (toPrimitive x) (toPrimitive y)
    shiftL x y = fromPrimitive $ shiftL (toPrimitive x) y
    shiftR x y = fromPrimitive $ shiftR (toPrimitive x) y
    zeroBits = fromPrimitive $ zeroBits
    testBit = testBit . toPrimitive
    bit = fromPrimitive . bit

  export
  Eq CXIdxObjCContainerKind where
    (==) x y = (toPrimitive x) == (toPrimitive y)

namespace CXIdxEntityRefKind
  public export
  Prim_CXIdxEntityRefKind : Type
  Prim_CXIdxEntityRefKind = Bits32

  public export
  data CXIdxEntityRefKind
    = Other Prim_CXIdxEntityRefKind
    | CXIdxEntityRef_Implicit
    | CXIdxEntityRef_Direct

  export
  Cast CXIdxEntityRefKind Prim_CXIdxEntityRefKind where
    cast CXIdxEntityRef_Implicit = (2)
    cast CXIdxEntityRef_Direct = (1)
    cast (Other m) = m


  export
  toPrimitive : CXIdxEntityRefKind -> Prim_CXIdxEntityRefKind
  toPrimitive x = cast x

  export
  Cast Prim_CXIdxEntityRefKind CXIdxEntityRefKind where
    cast (2) = CXIdxEntityRef_Implicit
    cast (1) = CXIdxEntityRef_Direct
    cast m = (Other m)


  export
  fromPrimitive : Prim_CXIdxEntityRefKind -> CXIdxEntityRefKind
  fromPrimitive x = cast x

  export
  Bits CXIdxEntityRefKind where
    Index = Index @{the (Bits Bits32) %search}
    (.&.) x y = fromPrimitive $ (toPrimitive x) .&. (toPrimitive y)
    (.|.) x y = fromPrimitive $ (toPrimitive x) .|. (toPrimitive y)
    xor x y = fromPrimitive $ xor (toPrimitive x) (toPrimitive y)
    shiftL x y = fromPrimitive $ shiftL (toPrimitive x) y
    shiftR x y = fromPrimitive $ shiftR (toPrimitive x) y
    zeroBits = fromPrimitive $ zeroBits
    testBit = testBit . toPrimitive
    bit = fromPrimitive . bit

  export
  Eq CXIdxEntityRefKind where
    (==) x y = (toPrimitive x) == (toPrimitive y)

namespace CXSymbolRole
  public export
  Prim_CXSymbolRole : Type
  Prim_CXSymbolRole = Bits32

  public export
  data CXSymbolRole
    = Other Prim_CXSymbolRole
    | CXSymbolRole_Implicit
    | CXSymbolRole_AddressOf
    | CXSymbolRole_Dynamic
    | CXSymbolRole_Call
    | CXSymbolRole_Write
    | CXSymbolRole_Read
    | CXSymbolRole_Reference
    | CXSymbolRole_Definition
    | CXSymbolRole_Declaration
    | CXSymbolRole_None

  export
  Cast CXSymbolRole Prim_CXSymbolRole where
    cast CXSymbolRole_Implicit = (256)
    cast CXSymbolRole_AddressOf = (128)
    cast CXSymbolRole_Dynamic = (64)
    cast CXSymbolRole_Call = (32)
    cast CXSymbolRole_Write = (16)
    cast CXSymbolRole_Read = (8)
    cast CXSymbolRole_Reference = (4)
    cast CXSymbolRole_Definition = (2)
    cast CXSymbolRole_Declaration = (1)
    cast CXSymbolRole_None = (0)
    cast (Other m) = m


  export
  toPrimitive : CXSymbolRole -> Prim_CXSymbolRole
  toPrimitive x = cast x

  export
  Cast Prim_CXSymbolRole CXSymbolRole where
    cast (256) = CXSymbolRole_Implicit
    cast (128) = CXSymbolRole_AddressOf
    cast (64) = CXSymbolRole_Dynamic
    cast (32) = CXSymbolRole_Call
    cast (16) = CXSymbolRole_Write
    cast (8) = CXSymbolRole_Read
    cast (4) = CXSymbolRole_Reference
    cast (2) = CXSymbolRole_Definition
    cast (1) = CXSymbolRole_Declaration
    cast (0) = CXSymbolRole_None
    cast m = (Other m)


  export
  fromPrimitive : Prim_CXSymbolRole -> CXSymbolRole
  fromPrimitive x = cast x

  export
  Bits CXSymbolRole where
    Index = Index @{the (Bits Bits32) %search}
    (.&.) x y = fromPrimitive $ (toPrimitive x) .&. (toPrimitive y)
    (.|.) x y = fromPrimitive $ (toPrimitive x) .|. (toPrimitive y)
    xor x y = fromPrimitive $ xor (toPrimitive x) (toPrimitive y)
    shiftL x y = fromPrimitive $ shiftL (toPrimitive x) y
    shiftR x y = fromPrimitive $ shiftR (toPrimitive x) y
    zeroBits = fromPrimitive $ zeroBits
    testBit = testBit . toPrimitive
    bit = fromPrimitive . bit

  export
  Eq CXSymbolRole where
    (==) x y = (toPrimitive x) == (toPrimitive y)

namespace CXIndexOptFlags
  public export
  Prim_CXIndexOptFlags : Type
  Prim_CXIndexOptFlags = Bits32

  public export
  data CXIndexOptFlags
    = Other Prim_CXIndexOptFlags
    | CXIndexOpt_SkipParsedBodiesInSession
    | CXIndexOpt_SuppressWarnings
    | CXIndexOpt_IndexImplicitTemplateInstantiations
    | CXIndexOpt_IndexFunctionLocalSymbols
    | CXIndexOpt_SuppressRedundantRefs
    | CXIndexOpt_None

  export
  Cast CXIndexOptFlags Prim_CXIndexOptFlags where
    cast CXIndexOpt_SkipParsedBodiesInSession = (16)
    cast CXIndexOpt_SuppressWarnings = (8)
    cast CXIndexOpt_IndexImplicitTemplateInstantiations = (4)
    cast CXIndexOpt_IndexFunctionLocalSymbols = (2)
    cast CXIndexOpt_SuppressRedundantRefs = (1)
    cast CXIndexOpt_None = (0)
    cast (Other m) = m


  export
  toPrimitive : CXIndexOptFlags -> Prim_CXIndexOptFlags
  toPrimitive x = cast x

  export
  Cast Prim_CXIndexOptFlags CXIndexOptFlags where
    cast (16) = CXIndexOpt_SkipParsedBodiesInSession
    cast (8) = CXIndexOpt_SuppressWarnings
    cast (4) = CXIndexOpt_IndexImplicitTemplateInstantiations
    cast (2) = CXIndexOpt_IndexFunctionLocalSymbols
    cast (1) = CXIndexOpt_SuppressRedundantRefs
    cast (0) = CXIndexOpt_None
    cast m = (Other m)


  export
  fromPrimitive : Prim_CXIndexOptFlags -> CXIndexOptFlags
  fromPrimitive x = cast x

  export
  Bits CXIndexOptFlags where
    Index = Index @{the (Bits Bits32) %search}
    (.&.) x y = fromPrimitive $ (toPrimitive x) .&. (toPrimitive y)
    (.|.) x y = fromPrimitive $ (toPrimitive x) .|. (toPrimitive y)
    xor x y = fromPrimitive $ xor (toPrimitive x) (toPrimitive y)
    shiftL x y = fromPrimitive $ shiftL (toPrimitive x) y
    shiftR x y = fromPrimitive $ shiftR (toPrimitive x) y
    zeroBits = fromPrimitive $ zeroBits
    testBit = testBit . toPrimitive
    bit = fromPrimitive . bit

  export
  Eq CXIndexOptFlags where
    (==) x y = (toPrimitive x) == (toPrimitive y)

namespace CXBinaryOperatorKind
  public export
  Prim_CXBinaryOperatorKind : Type
  Prim_CXBinaryOperatorKind = Bits32

  public export
  data CXBinaryOperatorKind
    = Other Prim_CXBinaryOperatorKind
    | CXBinaryOperator_Comma
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

  export
  Cast CXBinaryOperatorKind Prim_CXBinaryOperatorKind where
    cast CXBinaryOperator_Comma = (33)
    cast CXBinaryOperator_OrAssign = (32)
    cast CXBinaryOperator_XorAssign = (31)
    cast CXBinaryOperator_AndAssign = (30)
    cast CXBinaryOperator_ShrAssign = (29)
    cast CXBinaryOperator_ShlAssign = (28)
    cast CXBinaryOperator_SubAssign = (27)
    cast CXBinaryOperator_AddAssign = (26)
    cast CXBinaryOperator_RemAssign = (25)
    cast CXBinaryOperator_DivAssign = (24)
    cast CXBinaryOperator_MulAssign = (23)
    cast CXBinaryOperator_Assign = (22)
    cast CXBinaryOperator_LOr = (21)
    cast CXBinaryOperator_LAnd = (20)
    cast CXBinaryOperator_Or = (19)
    cast CXBinaryOperator_Xor = (18)
    cast CXBinaryOperator_And = (17)
    cast CXBinaryOperator_NE = (16)
    cast CXBinaryOperator_EQ = (15)
    cast CXBinaryOperator_GE = (14)
    cast CXBinaryOperator_LE = (13)
    cast CXBinaryOperator_GT = (12)
    cast CXBinaryOperator_LT = (11)
    cast CXBinaryOperator_Cmp = (10)
    cast CXBinaryOperator_Shr = (9)
    cast CXBinaryOperator_Shl = (8)
    cast CXBinaryOperator_Sub = (7)
    cast CXBinaryOperator_Add = (6)
    cast CXBinaryOperator_Rem = (5)
    cast CXBinaryOperator_Div = (4)
    cast CXBinaryOperator_Mul = (3)
    cast CXBinaryOperator_PtrMemI = (2)
    cast CXBinaryOperator_PtrMemD = (1)
    cast CXBinaryOperator_Invalid = (0)
    cast (Other m) = m


  export
  toPrimitive : CXBinaryOperatorKind -> Prim_CXBinaryOperatorKind
  toPrimitive x = cast x

  export
  Cast Prim_CXBinaryOperatorKind CXBinaryOperatorKind where
    cast (33) = CXBinaryOperator_Comma
    cast (32) = CXBinaryOperator_OrAssign
    cast (31) = CXBinaryOperator_XorAssign
    cast (30) = CXBinaryOperator_AndAssign
    cast (29) = CXBinaryOperator_ShrAssign
    cast (28) = CXBinaryOperator_ShlAssign
    cast (27) = CXBinaryOperator_SubAssign
    cast (26) = CXBinaryOperator_AddAssign
    cast (25) = CXBinaryOperator_RemAssign
    cast (24) = CXBinaryOperator_DivAssign
    cast (23) = CXBinaryOperator_MulAssign
    cast (22) = CXBinaryOperator_Assign
    cast (21) = CXBinaryOperator_LOr
    cast (20) = CXBinaryOperator_LAnd
    cast (19) = CXBinaryOperator_Or
    cast (18) = CXBinaryOperator_Xor
    cast (17) = CXBinaryOperator_And
    cast (16) = CXBinaryOperator_NE
    cast (15) = CXBinaryOperator_EQ
    cast (14) = CXBinaryOperator_GE
    cast (13) = CXBinaryOperator_LE
    cast (12) = CXBinaryOperator_GT
    cast (11) = CXBinaryOperator_LT
    cast (10) = CXBinaryOperator_Cmp
    cast (9) = CXBinaryOperator_Shr
    cast (8) = CXBinaryOperator_Shl
    cast (7) = CXBinaryOperator_Sub
    cast (6) = CXBinaryOperator_Add
    cast (5) = CXBinaryOperator_Rem
    cast (4) = CXBinaryOperator_Div
    cast (3) = CXBinaryOperator_Mul
    cast (2) = CXBinaryOperator_PtrMemI
    cast (1) = CXBinaryOperator_PtrMemD
    cast (0) = CXBinaryOperator_Invalid
    cast m = (Other m)


  export
  fromPrimitive : Prim_CXBinaryOperatorKind -> CXBinaryOperatorKind
  fromPrimitive x = cast x

  export
  Bits CXBinaryOperatorKind where
    Index = Index @{the (Bits Bits32) %search}
    (.&.) x y = fromPrimitive $ (toPrimitive x) .&. (toPrimitive y)
    (.|.) x y = fromPrimitive $ (toPrimitive x) .|. (toPrimitive y)
    xor x y = fromPrimitive $ xor (toPrimitive x) (toPrimitive y)
    shiftL x y = fromPrimitive $ shiftL (toPrimitive x) y
    shiftR x y = fromPrimitive $ shiftR (toPrimitive x) y
    zeroBits = fromPrimitive $ zeroBits
    testBit = testBit . toPrimitive
    bit = fromPrimitive . bit

  export
  Eq CXBinaryOperatorKind where
    (==) x y = (toPrimitive x) == (toPrimitive y)

namespace CXUnaryOperatorKind
  public export
  Prim_CXUnaryOperatorKind : Type
  Prim_CXUnaryOperatorKind = Bits32

  public export
  data CXUnaryOperatorKind
    = Other Prim_CXUnaryOperatorKind
    | CXUnaryOperator_Coawait
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

  export
  Cast CXUnaryOperatorKind Prim_CXUnaryOperatorKind where
    cast CXUnaryOperator_Coawait = (14)
    cast CXUnaryOperator_Extension = (13)
    cast CXUnaryOperator_Imag = (12)
    cast CXUnaryOperator_Real = (11)
    cast CXUnaryOperator_LNot = (10)
    cast CXUnaryOperator_Not = (9)
    cast CXUnaryOperator_Minus = (8)
    cast CXUnaryOperator_Plus = (7)
    cast CXUnaryOperator_Deref = (6)
    cast CXUnaryOperator_AddrOf = (5)
    cast CXUnaryOperator_PreDec = (4)
    cast CXUnaryOperator_PreInc = (3)
    cast CXUnaryOperator_PostDec = (2)
    cast CXUnaryOperator_PostInc = (1)
    cast CXUnaryOperator_Invalid = (0)
    cast (Other m) = m


  export
  toPrimitive : CXUnaryOperatorKind -> Prim_CXUnaryOperatorKind
  toPrimitive x = cast x

  export
  Cast Prim_CXUnaryOperatorKind CXUnaryOperatorKind where
    cast (14) = CXUnaryOperator_Coawait
    cast (13) = CXUnaryOperator_Extension
    cast (12) = CXUnaryOperator_Imag
    cast (11) = CXUnaryOperator_Real
    cast (10) = CXUnaryOperator_LNot
    cast (9) = CXUnaryOperator_Not
    cast (8) = CXUnaryOperator_Minus
    cast (7) = CXUnaryOperator_Plus
    cast (6) = CXUnaryOperator_Deref
    cast (5) = CXUnaryOperator_AddrOf
    cast (4) = CXUnaryOperator_PreDec
    cast (3) = CXUnaryOperator_PreInc
    cast (2) = CXUnaryOperator_PostDec
    cast (1) = CXUnaryOperator_PostInc
    cast (0) = CXUnaryOperator_Invalid
    cast m = (Other m)


  export
  fromPrimitive : Prim_CXUnaryOperatorKind -> CXUnaryOperatorKind
  fromPrimitive x = cast x

  export
  Bits CXUnaryOperatorKind where
    Index = Index @{the (Bits Bits32) %search}
    (.&.) x y = fromPrimitive $ (toPrimitive x) .&. (toPrimitive y)
    (.|.) x y = fromPrimitive $ (toPrimitive x) .|. (toPrimitive y)
    xor x y = fromPrimitive $ xor (toPrimitive x) (toPrimitive y)
    shiftL x y = fromPrimitive $ shiftL (toPrimitive x) y
    shiftR x y = fromPrimitive $ shiftR (toPrimitive x) y
    zeroBits = fromPrimitive $ zeroBits
    testBit = testBit . toPrimitive
    bit = fromPrimitive . bit

  export
  Eq CXUnaryOperatorKind where
    (==) x y = (toPrimitive x) == (toPrimitive y)

