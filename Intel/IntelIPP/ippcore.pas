unit ippcore; // Core (ippCore)

interface

uses
  ippdefs;

{$INCLUDE ipp_defs.inc}

type
  {$MINENUMSIZE 4}
  IppAffinityType = (
    ippAffinityCompactFineCore, { KMP_AFFINITY=granularity=fine,compact,n,offset, where n - level }
    ippAffinityCompactFineHT,   { KMP_AFFINITY=granularity=fine,compact,0,offset }
    ippAffinityAllEnabled,      { KMP_AFFINITY=respect }
    ippAffinityRestore,
    ippTstAffinityCompactFineCore, { test mode for affinity type ippAffinityCompactFineCore }
    ippTstAffinityCompactFineHT    { test mode for affinity type ippAffinityCompactFineHT   }
  );


{ /////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
//                   Functions declarations
////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////// }


{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippGetLibVersion
//  Purpose:    getting of the library version
//  Returns:    the structure of information about version
//              of ippcore library
//  Parameters:
//
//  Notes:      not necessary to release the returned structure
}
function ippGetLibVersion:PIppLibraryVersion; stdcall; external ippcoredll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippGetStatusString
//  Purpose:    convert the library status code to a readable string
//  Parameters:
//    StsCode   IPP status code
//  Returns:    pointer to string describing the library status code
//
//  Notes:      don't free the pointer
}
function ippGetStatusString(StsCode:IppStatus):PAnsiChar; stdcall; external ippcoredll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippGetCpuType
//  Purpose:    detects Intel(R) processor
//  Parameter:  none
//  Return:     IppCpuType
//
}

// DEPRECATED. use ippGetCpuFeatures() function instead of this one
function ippGetCpuType:IppCpuType; stdcall; external ippcoredll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippGetCpuClocks
//  Purpose:    reading of time stamp counter (TSC) register value
//  Returns:    TSC value
//
//  Note:      An hardware exception is possible if TSC reading is not supported by
/              the current chipset
}

function ippGetCpuClocks:Ipp64u; stdcall; external ippcoredll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ ///////////////////////////////////////////////////////////////////////////
//  Names:  ippSetFlushToZero,
//          ippSetDenormAreZero.
//
//  Purpose: ippSetFlushToZero enables or disables the flush-to-zero mode,
//           ippSetDenormAreZero enables or disables the denormals-are-zeros
//           mode.
//
//  Arguments:
//     value       - !0 or 0 - set or clear the corresponding bit of MXCSR
//     pUMask      - pointer to user store current underflow exception mask
//                   ( may be NULL if don't want to store )
//
//  Return:
//   ippStsNoErr              - Ok
//   ippStsCpuNotSupportedErr - the mode is not supported
}

function ippSetFlushToZero(value:integer; out pUMask:cardinal):IppStatus; stdcall; external ippcoredll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippSetDenormAreZeros(value:integer):IppStatus; stdcall; external ippcoredll {$IFDEF IPPDELAYED}delayed{$ENDIF};



{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippAlignPtr
//  Purpose:    pointer aligning
//  Returns:    aligned pointer
//
//  Parameter:
//    ptr        - pointer
//    alignBytes - number of bytes to align
//
}
function ippAlignPtr(ptr:Pointer; alignBytes:integer):Pointer; stdcall; external ippcoredll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//                   Functions to allocate and free memory
///////////////////////////////////////////////////////////////////////////// }
{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippMalloc
//  Purpose:    64-byte aligned memory allocation
//  Parameter:
//    len       number of bytes
//  Returns:    pointer to allocated memory
//
//  Notes:      the memory allocated by ippMalloc has to be free by ippFree
//              function only.
}

function ippMalloc(length:integer):Pointer; stdcall; external ippcoredll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippFree
//  Purpose:    free memory allocated by the ippMalloc function
//  Parameter:
//    ptr       pointer to the memory allocated by the ippMalloc function
//
//  Notes:      use the function to free memory allocated by ippMalloc
}
procedure ippFree(ptr:Pointer); stdcall; external ippcoredll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippStaticInit
//  Purpose:    Automatic switching to best for current cpu library code using.
//  Returns:
//   ippStsNoErr       - the best code (static) successfully set
//   ippStsNonIntelCpu - px version (static) of code was set
//   ippStsNoOperationInDll - function does nothing in the dynamic version of the library
//
//  Parameter:  nothing
//
//  Notes:      At the moment of this function execution no any other IPP function
//              has to be working
}
// DEPRECATED. use ippInit() function instead of this one
function ippStaticInit:IppStatus; stdcall; external ippcoredll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippInit
//  Purpose:    Automatic switching to best for current cpu library code using.
//  Returns:
//   ippStsNoErr
//
//  Parameter:  nothing
//
//  Notes:      At the moment of this function execution no any other IPP function
//              has to be working
}
function ippInit:IppStatus; stdcall; external ippcoredll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippInitCpu
//  Purpose:    switching to user defined target cpu library code using
//
//  Returns:
//   ippStsNoErr       - required target cpu library code is successfully set
//   ippStsCpuMismatch - required target cpu library can't be set, the previous
//                       set is used
//  Parameter:  IppCpuType
//
//  Notes:      At the moment of this function execution no any other IPP function
//              has to be working
}
// DEPRECATED. use ippSetCpuFeatures() function instead of this one
function ippInitCpu(cpu:IppCpuType):IppStatus; stdcall; external ippcoredll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippEnableCpu
//  Purpose:    allows dispatching CPU specific IPP library. It doesn't dispatch the code.
//              The following call ippInit(), if it follows ippEnableCpu, does that if application
//              is executed on CPU enabled platform or CPU simulator.
//              Introducing this function in IPP 6.1 was needed to allow IPP users run the codes
//              with Intel(R) AVX instructions in the case they have an Intel(R) AVX-enabled hardware
//              or simulator
//
//  Returns:
//   ippStsNoErr
//
//  Parameter:  IppCpuType
//
//  Notes: The ippInit() call without calling ippEnableCpu() as well as ippEnableCpu
//         without ippInit() call will not dispatch Intel(R) AVX code, even if you run code on Intel(R) AVX
//         enabled platform. Call the functions sequentially:
//         ippEnableCpu(ippCpuAVX); ippInit(); to dispatch Intel(R) AVX code.
//         The function works and could be useful for ippCpuAVX processor type only.
//
}
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippEnableCpu(cpu:IppCpuType):IppStatus; stdcall; external ippcoredll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ ////////////////////////////////////////////////////////////////////////////
//  Name:       ippGetCpuFreqMhz
//
//  Purpose:    the function estimates cpu frequency and returns
//              its value in MHz as a integer
//
//  Return:
//    ippStsNoErr              Ok
//    ippStsNullPtrErr         null pointer to the freq value
//    ippStsSizeErr            wrong num of tries, internal var
//  Arguments:
//    pMhz                     pointer to the integer to write
//                             cpu freq value estimated
//
//  Notes:      no exact value is guaranteed, the value could
//              vary with cpu workloading
}

function ippGetCpuFreqMhz(out pMhz:integer):IppStatus; stdcall; external ippcoredll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ ////////////////////////////////////////////////////////////////////////////
//  Name:       ippSetNumThreads
//
//  Purpose:
//
//  Return:
//    ippStsNoErr              Ok
//    ippStsNoOperation        For static library internal threading is not supported
//    ippStsSizeErr            Desired number of threads less or equal zero
//
//  Arguments:
//    numThr                   Desired number of threads
}
function ippSetNumThreads(numThr:integer):IppStatus; stdcall; external ippcoredll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ ////////////////////////////////////////////////////////////////////////////
//  Name:       ippGetNumThreads
//
//  Purpose:
//
//  Return:
//    ippStsNoErr              Ok
//    ippStsNullPtrErr         Pointer to numThr is Null
//    ippStsNoOperation        For static library internal threading is not supported
//                             and return value is always == 1
//
//  Arguments:
//    pNumThr                  Pointer to memory location where to store current numThr
}
function ippGetNumThreads(out pNumThr:integer):IppStatus; stdcall; external ippcoredll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ ////////////////////////////////////////////////////////////////////////////
//  Name:       ippGetMaxCacheSizeB
//
//  Purpose:  Detects maximal from the sizes of L2 or L3 in bytes
//
//  Return:
//    ippStsNullPtrErr         The result's pointer is NULL.
//    ippStsNotSupportedCpu    The cpu is not supported.
//    ippStsUnknownCacheSize   The cpu is supported, but the size of the cache is unknown.
//    ippStsNoErr              Ok
//
//  Arguments:
//    pSizeByte                Pointer to the result
//
//  Note:
//    1). Intel(R) processors are supported only.
//    2). Intel(R) Itanium(R) processors and platforms with Intel XScale(R) technology are unsupported
//    3). For unsupported processors the result is "0",
//        and the return status is "ippStsNotSupportedCpu".
//    4). For supported processors the result is "0",
//        and the return status is "ippStsUnknownCacheSize".
//        if sizes of the cache is unknown.
//
}
function ippGetMaxCacheSizeB(out pSizeByte:integer):IppStatus; stdcall; external ippcoredll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{
//  Name:       ippGetNumCoresOnDie
//  Purpose:    to distinguish MultiCore processors from other
//  Returns:    number of cores
//
}
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippGetNumCoresOnDie:integer; stdcall; external ippcoredll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{
//  Name:       ippGetCpuFeatures
//  Purpose:    Detects CPU features.
//  Parameters:
//    pFeaturesMask   Pointer to the features mask.
//                    Nonzero value of bit means the corresponding feature is supported.
//                    Features mask values are defined in the ippdefs.h
//                      [ 0] - MMX        ( ippCPUID_MMX   )
//                      [ 1] - SSE        ( ippCPUID_SSE   )
//                      [ 2] - SSE2       ( ippCPUID_SSE2  )
//                      [ 3] - SSE3       ( ippCPUID_SSE3  )
//                      [ 4] - SSSE3      ( ippCPUID_SSSE3 )
//                      [ 5] - MOVBE      ( ippCPUID_MOVBE )
//                      [ 6] - SSE41      ( ippCPUID_SSE41 )
//                      [ 7] - SSE42      ( ippCPUID_SSE42 )
//                      [ 8] - AVX        ( ippCPUID_AVX   )
//                      [ 9] - ENABLEDBYOS( ippAVX_ENABLEDBYOS )
//                      [10] - AES        ( ippCPUID_AES   )
//                      [11] - PCLMULQDQ  ( ippCPUID_CLMUL )
//                      [12] - ABR        ( ippCPUID_ABR )
//                      [13] - RDRAND     ( ippCPUID_RDRAND )
//                      [14] - F16C       ( ippCPUID_F16C )
//                      [15] - AVX2       ( ippCPUID_AVX2 )
//                      [16] - ADOX/ADCX  ( ippCPUID_ADCOX )      ADCX and ADOX instructions
//                      [17] - RDSEED     ( ippCPUID_RDSEED )     The RDSEED instruction
//                      [18] - PREFETCHW  ( ippCPUID_PREFETCHW )  The PREFETCHW instruction
//                      [19] - SHA        ( ippCPUID_SHA )        Intel (R) SHA Extensions
//                      [20:63] - Reserved
//
//    pCpuidInfoRegs  Pointer to the 4-element vector.
//                    Result of CPUID.1 are stored in this vector.
//                      [0] - register EAX
//                      [1] - register EBX
//                      [2] - register ECX
//                      [3] - register EDX
//                    If pointer pCpuidInfoRegs is set to NULL, registers are not stored.
//
//  Returns:
//    ippStsNullPtrErr         The pointer to the features mask (pFeaturesMask) is NULL.
//    ippStsNotSupportedCpu    CPU is not supported.
//    ippStsNoErr              Ok
//
//  Note: Only IA-32 and Intel(R) 64 are supported
}
type
  CpuidInfoRegs = array [0..3] of Ipp32u;
function ippGetCpuFeatures(out pFeaturesMask:Ipp64u; out pCpuidInfoRegs:CpuidInfoRegs):IppStatus; stdcall; external ippcoredll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{
//  Name:       ippGetEnabledCpuFeatures
//  Purpose:    Detects enabled features for loaded libraries
//  Returns:    Features mask
//                    Features mask values are defined in the ippdefs.h
//                      [ 0] - ippCPUID_MMX
//                      [ 1] - ippCPUID_SSE
//                      [ 2] - ippCPUID_SSE2
//                      [ 3] - ippCPUID_SSE3
//                      [ 4] - ippCPUID_SSSE3
//                      [ 5] - ippCPUID_MOVBE
//                      [ 6] - ippCPUID_SSE41
//                      [ 7] - ippCPUID_SSE42
//                      [ 8] - ippCPUID_AVX
//                      [ 9] - ippAVX_ENABLEDBYOS
//                      [10] - ippCPUID_AES
//                      [11] - ippCPUID_CLMUL
//                      [12] - ippCPUID_ABR
//                      [13] - ippCPUID_RDRAND
//                      [14] - ippCPUID_F16C
//                      [15] - ippCPUID_AVX2
//                      [16] - ippCPUID_ADCOX
//                      [17] - ippCPUID_RDSEED
//                      [18] - ippCPUID_PREFETCHW
//                      [19] - ippCPUID_SHA
//                      [20:63] - Reserved
//
}
function ippGetEnabledCpuFeatures:Ipp64u; stdcall; external ippcoredll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ ////////////////////////////////////////////////////////////////////////////
//  Name:       ippSetCpuFeatures
//
//  Purpose: Changes the set of enabled/disabled CPU features.
//           This function sets the processor-specific code of the Intel IPP
//           library according to the processor features specified in cpuFeatures.
//
//  Return:
//    ippStsNoErr                 No errors.
//    Warnings:
//    ippStsFeatureNotSupported   Current CPU doesn't support at least 1 of the
//                                desired features;
//    ippStsUnknownFeature        At least one of the desired features is unknown;
//    ippStsFeaturesCombination   Wrong combination of features;
//    ippStsCpuMismatch           Indicates that the specified processor features
//                                are not valid. Previously set code is used.
//
//  Arguments:
//    cpuFeatures                 Desired features to support by the library
//                                (see ippdefs.h for ippCPUID_XX definition)
//
//  NOTE:       this function can re-initializes dispatcher and after the
//              call another library (letter) may work
//  CAUTION:    At the moment of this function excecution no any other IPP
//              function has to be working
//
//  The next pre-defined sets of features can be used:
//  32-bit code:
// PX_FM = ( ippCPUID_MMX | ippCPUID_SSE )
// W7_FM = ( PX_FM | ippCPUID_SSE2 )
// V8_FM = ( W7_FM | ippCPUID_SSE3 | ippCPUID_SSSE3 )
// S8_FM = ( V8_FM | ippCPUID_MOVBE )
// P8_FM = ( V8_FM | ippCPUID_SSE41 | ippCPUID_SSE42 | ippCPUID_AES | ippCPUID_CLMUL | ippCPUID_SHA )
// G9_FM = ( P8_FM | ippCPUID_AVX | ippAVX_ENABLEDBYOS | ippCPUID_RDRAND | ippCPUID_F16C )
// H9_FM = ( G9_FM | ippCPUID_AVX2 | ippCPUID_MOVBE | ippCPUID_ADCOX | ippCPUID_RDSEED | ippCPUID_PREFETCHW )
//
// 64-bit code:
// PX_FM = ( ippCPUID_MMX | ippCPUID_SSE | ippCPUID_SSE2 )
// M7_FM = ( PX_FM | ippCPUID_SSE3 )
// N8_FM = ( S8_FM )
// U8_FM = ( V8_FM )
// Y8_FM = ( P8_FM )
// E9_FM = ( G9_FM )
// L9_FM = ( H9_FM )
//
}

function ippSetCpuFeatures(cpuFeatures:Ipp64u):IppStatus; stdcall; external  ippcoredll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//                   i18n functions to operate with Message Catalogs
///////////////////////////////////////////////////////////////////////////// }

type
  PIppMsgCatalog = ^TIppMsgCatalog;
  TIppMsgCatalog = record end;
  IppMsg = PWideChar;

{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippMessageCatalogOpenI18n
//  Purpose:    Opens i18n Message Catalog
//  Parameters:
//
//  Returns:
//    ippStsMemAllocErr
//    ippStsNullPtrErr
//    ippStsI18nUnsupportedErr
//    ippStsI18nMsgCatalogOpenErr
//    ippStsNoErr
//
//  Notes: function allocates memory, this memory has to be freed by ippMessageCatalogCloseI18n
//         ippMessageCatalogCloseI18n It should be used, despite of the returned status code
}
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippMessageCatalogOpenI18n(out pMsgCatalog:PIppMsgCatalog):IppStatus; stdcall; external ippcoredll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippMessageCatalogCloseI18n
//  Purpose:    Closes i18n Message Catalog, which was opened by ippMessageCatalogOpenI18n
//  Parameters:
//
//  Returns:
//  ippStsContextMatchErr
//  ippStsNullPtrErr
//  ippStsI18nMsgCatalogCloseErr
//  ippStsI18nUnsupportedErr
//
//  Notes:
}
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippMessageCatalogCloseI18n(pMsgCatalog:PIppMsgCatalog):IppStatus; stdcall; external ippcoredll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippGetMessageStatusI18n
//  Purpose:    gets localized message corresponding to IppStatus
//  Parameters:
//  Returns:
//    ippStsMemAllocErr
//    ippStsNullPtrErr
//    ippStsContextMatchErr
//    ippStsI18nMsgCatalogInvalid
//    ippStsI18nGetMessageFail
//    ippStsUnknownStatusCodeErr
//
//  Notes:
//
}
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippGetMessageStatusI18n(pMsgCatalog:PIppMsgCatalog; StsCode:IppStatus; out pMsg:IppMsg):IppStatus; stdcall; external ippcoredll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippStatusToMessageIdI18n
//  Purpose:    transforms of IPP status to message ID for Message Catalog
//  Parameters:
//    StsCode   IPP status code
//
//  Returns:    Message ID for i18n catalogs
//
//  Notes:      Function is useful for direct Message Catalogs access
//
}
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippStatusToMessageIdI18n(StsCode:IppStatus):Ipp32u; stdcall; external ippcoredll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ ///////////////////////////////////////////////////////////////////////////
Name:
ippSetAffinity
  Purpose:
    Binds OpenMP threads to OS processors.
  Parameters:
           affType  Type of affinity settings, the possible values:
           ippAffinityCompactFineCore
           ippAffinityCompactFineHT
           ippAffinityRestore
           ippTstAffinityCompactFineCore
           ippTstAffinityCompactFineHT
           offset  - Specified the starting position for thread assignment.
  Returns:
     ippStsNoErr            - no errors.
     ippStsLLADisabled      - Low Level Affinity API was disabled.
     ippStsNotSupportedCpu  - the cpu is not supported.
}

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippSetAffinity(aType:IppAffinityType; offset:integer):IppStatus; stdcall; external ippcoredll {$IFDEF IPPDELAYED}delayed{$ENDIF};

implementation

end.
