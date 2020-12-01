unit ipps; // Signal Processing (ippSP)

interface

uses
  ippdefs;

{$INCLUDE ipp_defs.inc}

type
  IppsROI = record
    left: integer;
    right: integer;
  end;


type
  TIpp32fcArray2 = array [0..1] of Ipp32fc;
  TIpp32fArray2 = array [0..1] of Ipp32f;
  TIpp64fcArray2 = array [0..1] of Ipp64fc;
  TIpp64fArray2 = array [0..1] of Ipp64f;
  TIpp16scArray2 = array[ 0..1] of Ipp16sc;
  TIpp16sArray2 = array [0..1] of Ipp16s;

type
  PPIpp32f = ^PIpp32f;
  PPIpp32s = ^PIpp32s;

{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippsGetLibVersion
//  Purpose:    get the library version
//  Parameters:
//  Returns:    pointer to structure describing version of the ipps library
//
//  Notes:      don't free the pointer
}
function ippsGetLibVersion:PIppLibraryVersion; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//                   Functions to allocate and free memory
///////////////////////////////////////////////////////////////////////////// }
{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippsMalloc
//  Purpose:    32-byte aligned memory allocation
//  Parameter:
//    len       number of elements (according to their type)
//  Returns:    pointer to allocated memory
//
//  Notes:      the memory allocated by ippsMalloc has to be free by ippsFree
//              function only.
}

function ippsMalloc_8u(len:integer):PIpp8u; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMalloc_16u(len:integer):PIpp16u; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMalloc_32u(len:integer):PIpp32u; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMalloc_8s(len:integer):PIpp8s; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMalloc_16s(len:integer):PIpp16s; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMalloc_32s(len:integer):PIpp32s; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMalloc_64s(len:integer):PIpp64s; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsMalloc_32f(len:integer):PIpp32f; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMalloc_64f(len:integer):PIpp64f; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsMalloc_8sc(len:integer):PIpp8sc; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMalloc_16sc(len:integer):PIpp16sc; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMalloc_32sc(len:integer):PIpp32sc; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMalloc_64sc(len:integer):PIpp64sc; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMalloc_32fc(len:integer):PIpp32fc; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMalloc_64fc(len:integer):PIpp64fc; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippsFree
//  Purpose:    free memory allocated by the ippsMalloc functions
//  Parameter:
//    ptr       pointer to the memory allocated by the ippsMalloc functions
//
//  Notes:      use the function to free memory allocated by ippsMalloc_*
}
procedure ippsFree(ptr:Pointer); stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};



{ /////////////////////////////////////////////////////////////////////////////
//                   Vector Initialization functions
///////////////////////////////////////////////////////////////////////////// }
{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippsCopy
//  Purpose:    copy data from source to destination vector
//  Parameters:
//    pSrc        pointer to the input vector
//    pDst        pointer to the output vector
//    len         length of the vectors, number of items
//  Return:
//    ippStsNullPtrErr        pointer(s) to the data is NULL
//    ippStsSizeErr           length of the vectors is less or equal zero
//    ippStsNoErr             otherwise
}

function ippsCopy_8u(pSrc:PIpp8u; pDst:PIpp8u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsCopy_16s(pSrc:PIpp16s; pDst:PIpp16s; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsCopy_16sc(pSrc:PIpp16sc; pDst:PIpp16sc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsCopy_32f(pSrc:PIpp32f; pDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsCopy_32fc(pSrc:PIpp32fc; pDst:PIpp32fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsCopy_64f(pSrc:PIpp64f; pDst:PIpp64f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsCopy_64fc(pSrc:PIpp64fc; pDst:PIpp64fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsCopy_32s(pSrc:PIpp32s; pDst:PIpp32s; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsCopy_32sc(pSrc:PIpp32sc; pDst:PIpp32sc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsCopy_64s(pSrc:PIpp64s; pDst:PIpp64s; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsCopy_64sc(pSrc:PIpp64sc; pDst:PIpp64sc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippsPackBits_32u8u
//  Purpose:    Packing of bit's data from source to destination vector
//  Parameters:
//    pSrcBit       pointer to the input vector with data bits
//    pSrcBits      pointer to the input vector that specifies number of data bits
//    srcLen        length of the pSrcBit and pSrcBits vectors, number of items
//    pDst          pointer to the output vector
//    dstBitOffset  offset in the first byte of the destination vector
//    pDstLenBit    pointer to the length of the output vector, number of bits
//  Return:
//    ippStsNullPtrErr        pointer(s) to the data is NULL
//    ippStsSizeErr           length of the vectors is less or equal zero
//    ippStsSizeErr           dstBitOffset is less zero
//
//    ippStsOverlongString    Warning: pSrcBits[i] < 0, or pSrcBits[i] > 32.
//
//    ippStsNoErr             otherwise
}

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsPackBits_32u8u(pSrcBit:PIpp32u; pSrcBits:PInteger; srcLen:integer; pDst:PIpp8u; dstBitOffset:integer; pDstLenBit:PInteger):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippsCopy_1u
//              ippsCopyLE_1u
//              ippsCopyBE_1u
//  Purpose:    copy bit's data from source to destination vector
//  Parameters:
//    pSrc          pointer to the input vector
//    srcBitOffset  offset in the first byte of the source vector
//    pDst          pointer to the output vector
//    dstBitOffset  offset in the first byte of the destination vector
//    len           length of the vectors, number of bits
//  Return:
//    ippStsNullPtrErr        pointer(s) to the data is NULL
//    ippStsSizeErr           length of the vectors is less or equal zero
//    ippStsNoErr             otherwise
}
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use ippsCopyLE_1u function instead of this one and the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsCopy_1u(pSrc:PIpp8u; srcBitOffset:integer; pDst:PIpp8u; dstBitOffset:integer; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsCopyLE_1u(pSrc:PIpp8u; srcBitOffset:integer; pDst:PIpp8u; dstBitOffset:integer; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsCopyBE_1u(pSrc:PIpp8u; srcBitOffset:integer; pDst:PIpp8u; dstBitOffset:integer; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippsMove
//  Purpose:    The ippsMove function copies "len" elements from src to dst.
//              If some regions of the source area and the destination overlap,
//              ippsMove ensures that the original source bytes in the overlapping
//              region are copied before being overwritten.
//
//  Parameters:
//    pSrc        pointer to the input vector
//    pDst        pointer to the output vector
//    len         length of the vectors, number of items
//  Return:
//    ippStsNullPtrErr        pointer(s) to the data is NULL
//    ippStsSizeErr           length of the vectors is less or equal zero
//    ippStsNoErr             otherwise
}

function ippsMove_8u(pSrc:PIpp8u; pDst:PIpp8u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMove_16s(pSrc:PIpp16s; pDst:PIpp16s; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMove_16sc(pSrc:PIpp16sc; pDst:PIpp16sc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMove_32f(pSrc:PIpp32f; pDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMove_32fc(pSrc:PIpp32fc; pDst:PIpp32fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMove_64f(pSrc:PIpp64f; pDst:PIpp64f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMove_64fc(pSrc:PIpp64fc; pDst:PIpp64fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMove_32s(pSrc:PIpp32s; pDst:PIpp32s; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMove_32sc(pSrc:PIpp32sc; pDst:PIpp32sc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMove_64s(pSrc:PIpp64s; pDst:PIpp64s; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMove_64sc(pSrc:PIpp64sc; pDst:PIpp64sc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};



{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippsZero
//  Purpose:    set elements of the vector to zero of corresponding type
//  Parameters:
//    pDst       pointer to the destination vector
//    len        length of the vectors
//  Return:
//    ippStsNullPtrErr        pointer to the vector is NULL
//    ippStsSizeErr           length of the vectors is less or equal zero
//    ippStsNoErr             otherwise
}

function ippsZero_8u(pDst:PIpp8u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsZero_16s(pDst:PIpp16s; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsZero_16sc(pDst:PIpp16sc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsZero_32f(pDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsZero_32fc(pDst:PIpp32fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsZero_64f(pDst:PIpp64f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsZero_64fc(pDst:PIpp64fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsZero_32s(pDst:PIpp32s; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsZero_32sc(pDst:PIpp32sc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsZero_64s(pDst:PIpp64s; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsZero_64sc(pDst:PIpp64sc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippsSet
//  Purpose:    set elements of the destination vector to the value
//  Parameters:
//    val        value to set the elements of the vector
//    pDst       pointer to the destination vector
//    len        length of the vectors
//  Return:
//    ippStsNullPtrErr        pointer to the vector is NULL
//    ippStsSizeErr           length of the vector is less or equal zero
//    ippStsNoErr             otherwise
}

function ippsSet_8u(val:Ipp8u; pDst:PIpp8u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSet_16s(val:Ipp16s; pDst:PIpp16s; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSet_16sc(val:Ipp16sc; pDst:PIpp16sc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSet_32s(val:Ipp32s; pDst:PIpp32s; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSet_32sc(val:Ipp32sc; pDst:PIpp32sc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSet_32f(val:Ipp32f; pDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSet_32fc(val:Ipp32fc; pDst:PIpp32fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSet_64s(val:Ipp64s; pDst:PIpp64s; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSet_64sc(val:Ipp64sc; pDst:PIpp64sc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSet_64f(val:Ipp64f; pDst:PIpp64f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSet_64fc(val:Ipp64fc; pDst:PIpp64fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ ////////////////////////////////////////////////////////////////////////////
//  Name:       ippsRandUniform_Direct_16s, ippsRandUniform_Direct_32f, ippsRandUniform_Direct_64f
//
//  Purpose:    Makes pseudo-random samples with a uniform distribution and places them in
//              the vector.
//
//
//  Return:
//    ippStsNoErr              Ok
//    ippStsNullPtrErr         The pointer to vector is NULL
//    ippStsBadSizeErr         The length of the vector is less or equal zero
//
//  Arguments:
//    low                      The lower bounds of the uniform distributions range.
//    high                     The upper bounds of the uniform distributions range.
//    pSeed                    The pointer to the seed value used by the pseudo-random number
//                             generation algorithm.
//    pSrcDst                  The pointer to vector
//    len                      Vector's length
}

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use ippsRandUniform_16s function instead of this one and the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsRandUniform_Direct_16s(pDst:PIpp16s; len:integer; low:Ipp16s; high:Ipp16s; var pSeed:cardinal):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use ippsRandUniform_32f function instead of this one and the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsRandUniform_Direct_32f(pDst:PIpp32f; len:integer; low:Ipp32f; high:Ipp32f; var pSeed:cardinal):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use ippsRandUniform_64 function instead of this one and the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsRandUniform_Direct_64f(pDst:PIpp64f; len:integer; low:Ipp64f; high:Ipp64f; var pSeed:cardinal):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ ////////////////////////////////////////////////////////////////////////////
//  Name:       ippsRandGauss_Direct_16s, ippsRandGauss_Direct_32f, ippsRandGauss_Direct_64f
//
//  Purpose:    Makes pseudo-random samples with a Normal distribution distribution and places
//              them in the vector.
//
//
//  Return:
//    ippStsNoErr              Ok
//    ippStsNullPtrErr         The pointer to vector is NULL
//    ippStsBadSizeErr         The length of the vector is less or equal zero
//
//  Arguments:
//    mean                     The mean of the Normal distribution.
//    stdev                    The standard deviation of the Normal distribution.
//    pSeed                    The pointer to the seed value used by the pseudo-random number
//                             generation algorithm.
//    pSrcDst                  The pointer to vector
//    len                      Vector's length
}

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use ippsRandGauss_16s function instead of this one and the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsRandGauss_Direct_16s(pDst:PIpp16s; len:integer; mean:Ipp16s; stdev:Ipp16s; var pSeed:cardinal):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use ippsRandGauss_32f function instead of this one and the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsRandGauss_Direct_32f(pDst:PIpp32f; len:integer; mean:Ipp32f; stdev:Ipp32f; var pSeed:cardinal):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use ippsRandGauss_64f function instead of this one and the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsRandGauss_Direct_64f(pDst:PIpp64f; len:integer; mean:Ipp64f; stdev:Ipp64f; var pSeed:cardinal):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ ///////////////////////////////////////////////////////////////////////// }

type
  PIppsRandUniState_8u = ^TIppsRandUniState_8u;
  TIppsRandUniState_8u = record end;

  PIppsRandUniState_16s = ^TIppsRandUniState_16s;
  TIppsRandUniState_16s = record end;

  PIppsRandUniState_32f = ^TIppsRandUniState_32f;
  TIppsRandUniState_32f = record end;

  PIppsRandGaussState_8u = ^TIppsRandGaussState_8u;
  TIppsRandGaussState_8u = record end;

  PIppsRandGaussState_16s = ^TIppsRandGaussState_16s;
  TIppsRandGaussState_16s = record end;

  PIppsRandGaussState_32f = ^TIppsRandGaussState_32f;
  TIppsRandGaussState_32f = record end;

{ /////////////////////////////////////////////////////////////////////////
// Name:                ippsRandUniformInitAlloc_8u,  ippsRandUniformInitAlloc_16s,
//                      ippsRandUniformInitAlloc_32f
// Purpose:             Allocate and initialize parameters for the generator
//                      of noise with uniform distribution.
// Returns:
// Parameters:
//    pRandUniState     A pointer to the structure containing parameters for the
//                      generator of noise.
//    low               The lower bounds of the uniform distribution's range.
//    high              The upper bounds of the uniform distribution's range.
//    seed              The seed value used by the pseudo-random number generation
//                      algorithm.
//
// Returns:
//    ippStsNullPtrErr  pRandUniState==NULL
//    ippMemAllocErr    Can not allocate random uniform state
//    ippStsNoErr       No errors
//
}
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use GetSize and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsRandUniformInitAlloc_8u(out pRandUniState:PIppsRandUniState_8u; low:Ipp8u; high:Ipp8u; seed:cardinal):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use GetSize and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsRandUniformInitAlloc_16s(out pRandUniState:PIppsRandUniState_16s; low:Ipp16s; high:Ipp16s; seed:cardinal):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use GetSize and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsRandUniformInitAlloc_32f(out pRandUniState:PIppsRandUniState_32f; low:Ipp32f; high:Ipp32f; seed:cardinal):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////
// Name:                     ippsRandUniform_8u,  ippsRandUniform_16s,
//                           ippsRandUniform_32f
// Purpose:                  Makes pseudo-random samples with a uniform distribution
//                           and places them in the vector.
// Parameters:
//    pDst                   The pointer to vector
//    len                    Vector's length
//    pRandUniState          A pointer to the structure containing parameters for the
//                           generator of noise
// Returns:
//    ippStsNullPtrErr       pRandUniState==NULL
//    ippStsContextMatchErr  pState->idCtx != idCtxRandUni
//    ippStsNoErr            No errors
}

function ippsRandUniform_8u(pDst:PIpp8u; len:integer; pRandUniState:PIppsRandUniState_8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsRandUniform_16s(pDst:PIpp16s; len:integer; pRandUniState:PIppsRandUniState_16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsRandUniform_32f(pDst:PIpp32f; len:integer; pRandUniState:PIppsRandUniState_32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////
// Name:                     ippsRandUniformFree_8u, ippsRandUniformFree_16s
//                           ippsRandUniformFree_32f
// Purpose:                  Close random uniform state
//
// Parameters:
//    pRandUniState          Pointer to the random uniform state
//
// Returns:
//    ippStsNullPtrErr       pState==NULL
//    ippStsContextMatchErr  pState->idCtx != idCtxRandUni
//    ippStsNoErr,           No errors
}

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use GetSize and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsRandUniformFree_8u(pRandUniState:PIppsRandUniState_8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use GetSize and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsRandUniformFree_16s(pRandUniState:PIppsRandUniState_16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use GetSize and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsRandUniformFree_32f(pRandUniState:PIppsRandUniState_32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ //////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////
// Name:                ippsRandGaussInitAlloc_8u,  ippsRandGaussInitAlloc_16s,
//                      ippsRandGaussInitAlloc_32f
// Purpose:             Allocate and initialize parameters for the generator of noise.
// Returns:
// Parameters:
//    pRandGaussState   A pointer to the structure containing parameters for the
//                      generator of noise.
//    mean              The mean of the normal distribution.
//    stdDev            The standard deviation of the normal distribution.
//    seed              The seed value used by the pseudo-random number
//
// Returns:
//    ippStsNullPtrErr  pRandGaussState==NULL
//    ippMemAllocErr    Can not allocate normal random state
//    ippStsNoErr       No errors
//
}
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use GetSize and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsRandGaussInitAlloc_8u(out pRandGaussState:PIppsRandGaussState_8u; mean:Ipp8u; stdDev:Ipp8u; seed:cardinal):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use GetSize and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsRandGaussInitAlloc_16s(out pRandGaussState:PIppsRandGaussState_16s; mean:Ipp16s; stdDev:Ipp16s; seed:cardinal):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use GetSize and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsRandGaussInitAlloc_32f(out pRandGaussState:PIppsRandGaussState_32f; mean:Ipp32f; stdDev:Ipp32f; seed:cardinal):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////
// Name:                     ippsRandGauss_8u,  ippsRandGauss_16s,
//                           ippsRandGauss_32f
// Purpose:                  Makes pseudo-random samples with a normal distribution
//                           and places them in the vector.
// Parameters:
//    pDst                   The pointer to vector
//    len                    Vector's length
//    pRandUniState          A pointer to the structure containing parameters
//                           for the generator of noise
//    ippStsContextMatchErr  pState->idCtx != idCtxRandGauss
// Returns:
//    ippStsNullPtrErr       pRandGaussState==NULL
//    ippStsNoErr            No errors
}

function ippsRandGauss_8u(pDst:PIpp8u; len:integer; pRandGaussState:PIppsRandGaussState_8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsRandGauss_16s(pDst:PIpp16s; len:integer; pRandGaussState:PIppsRandGaussState_16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsRandGauss_32f(pDst:PIpp32f; len:integer; pRandGaussState:PIppsRandGaussState_32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////
// Name:                     ippsRandGaussFree_8u, ippsRandGaussFree_16s,
//                           ippsRandGaussFree_32f
// Purpose:                  Close random normal state
//
// Parameters:
//    pRandUniState          Pointer to the random normal state
//
// Returns:
//    ippStsNullPtrErr       pState==NULL
//    ippStsContextMatchErr  pState->idCtx != idCtxRandGauss
//    ippStsNoErr,           No errors
}

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use GetSize and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsRandGaussFree_8u(pRandGaussState:PIppsRandGaussState_8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use GetSize and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsRandGaussFree_16s(pRandGaussState:PIppsRandGaussState_16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use GetSize and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsRandGaussFree_32f(pRandGaussState:PIppsRandGaussState_32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ ////////////////////////////////////////////////////////////////////////////
//  Name:       ippsRandGaussGetSize_8u, ippsRandGaussGetSize_16s
//              ippsRandGaussGetSize_32f
//
//  Purpose:    Gaussian sequence generator state variable size -
//              computes the size,in bytes,
//              of the state variable structure ippsRandGaussState_16s.
//  Return:
//    ippStsNoErr              Ok
//    ippStsNullPtrErr         pRandGaussStateSize==NULL
//  Arguments:
//    pRandGaussStateSize      pointer to the computed values of the size
//                             of the structure ippsRandGaussState_8u/16s/32f.
}
function ippsRandGaussGetSize_8u(out pRandGaussStateSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsRandGaussGetSize_16s(out pRandGaussStateSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsRandGaussGetSize_32f(out pRandGaussStateSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ //////////////////////////////////////////////////////////////////////////////////
// Name:                ippsRandGaussInit_8u, ippsRandGaussInit_16s
//                      ippsRandGaussInit_32f
// Purpose:             Initializes the Gaussian sequence generator state structure with
//                      given parameters (mean, variance, seed).
// Parameters:
//    pRandGaussState   A pointer to the structure containing parameters for the
//                      generator of noise.
//    mean              Mean of the normal distribution.
//    stdDev            Standard deviation of the normal distribution.
//    seed              Seed value used by the pseudo-random number generator
//
// Returns:
//    ippStsNullPtrErr  pRandGaussState==NULL
//    ippMemAllocErr    Can not allocate normal random state
//    ippStsNoErr       No errors
//
}
function ippsRandGaussInit_8u(pRandGaussState:PIppsRandGaussState_8u; mean:Ipp8u; stdDev:Ipp8u; seed:cardinal):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsRandGaussInit_16s(pRandGaussState:PIppsRandGaussState_16s; mean:Ipp16s; stdDev:Ipp16s; seed:cardinal):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsRandGaussInit_32f(pRandGaussState:PIppsRandGaussState_32f; mean:Ipp32f; stdDev:Ipp32f; seed:cardinal):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ ////////////////////////////////////////////////////////////////////////////
//  Name:       ippsRandUniformGetSize_8u, ippsRandUniformGetSize_16s
//              ippsRandUniformGetSize_32f
//
//  Purpose:    Uniform sequence generator state variable size -
//              computes the size,in bytes,
//              of the state variable structure ippsRandIniState_16s.
//
//  Return:
//    ippStsNoErr              Ok
//    ippStsNullPtrErr         pRandUniformStateSize==NULL
//  Arguments:
//    pRandGaussStateSize      pointer to the computed value of the size
//                             of the structure ippsRandUniState_8u/16s/32f.
}
function ippsRandUniformGetSize_8u(out pRandUniformStateSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsRandUniformGetSize_16s(out pRandUniformStateSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsRandUniformGetSize_32f(out pRandUniformStateSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ //////////////////////////////////////////////////////////////////////////////////
// Name:                ippsRandUniformInit_8u, ippsRandUniformInit_16s
//                      ippsRandUniformInit_32f
// Purpose:             Initializes the uniform sequence generator state structure with
//                      given parameters (boundaries, seed)
// Parameters:
//    pRandUniState     Pointer to the structure containing parameters for the
//                      generator of noise.
//    low               Lower bound of the uniform distribution's range.
//    high              Upper bounds of the uniform distribution's range.
//    seed              Seed value used by the pseudo-random number generation
//                      algorithm.
//
}
function ippsRandUniformInit_8u(pRandUniState:PIppsRandUniState_8u; low:Ipp8u; high:Ipp8u; seed:cardinal):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsRandUniformInit_16s(pRandUniState:PIppsRandUniState_16s; low:Ipp16s; high:Ipp16s; seed:cardinal):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsRandUniformInit_32f(pRandUniState:PIppsRandUniState_32f; low:Ipp32f; high:Ipp32f; seed:cardinal):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};




{ /////////////////////////////////////////////////////////////////////////
//  Name:               ippsVectorJaehne
//  Purpose:            creates Jaehne vector
//
//  Parameters:
//    pDst              the pointer to the destination vector
//    len               length of the vector
//    magn              magnitude of the signal
//
//  Return:
//    ippStsNoErr       indicates no error
//    ippStsNullPtrErr  indicates an error when the pDst pointer is NULL
//    ippStsBadSizeErr  indicates an error when len is less or equal zero
//    ippStsJaehneErr   indicates an error when magnitude value is negative
//
//  Notes:              pDst[n] = magn*sin(0.5*pi*n^2/len), n=0,1,2,..len-1.
//
}
function ippsVectorJaehne_8u(pDst:PIpp8u; len:integer; magn:Ipp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsVectorJaehne_8s(pDst:PIpp8s; len:integer; magn:Ipp8s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsVectorJaehne_16u(pDst:PIpp16u; len:integer; magn:Ipp16u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsVectorJaehne_16s(pDst:PIpp16s; len:integer; magn:Ipp16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsVectorJaehne_32u(pDst:PIpp32u; len:integer; magn:Ipp32u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsVectorJaehne_32s(pDst:PIpp32s; len:integer; magn:Ipp32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsVectorJaehne_32f(pDst:PIpp32f; len:integer; magn:Ipp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsVectorJaehne_64f(pDst:PIpp64f; len:integer; magn:Ipp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ /////////////////////////////////////////////////////////////////////////////
//  Name:           ippsTone_Direct
//  Purpose:        generates a tone
//  Context:
//  Returns:        IppStatus
//    ippStsNoErr        Ok
//    ippStsNullPtrErr   Some of pointers to input or output data are NULL
//    ippStsSizeErr      The length of vector is less or equal zero
//    ippStsToneMagnErr  The magn value is less than or equal to zero
//    ippStsToneFreqErr  The rFreq value is less than 0 or greater than or equal to 0.5
//                       for real tone and 1.0 for complex tone
//    ippStsTonePhaseErr The phase value is less 0 or greater or equal 2*PI
//  Parameters:
//    magn            Magnitude of the tone; that is, the maximum value
//                    attained by the wave
//    rFreq           Frequency of the tone relative to the sampling
//                    frequency. It must be in range [0.0, 0.5) for real, and
//                    [0.0, 1.0) for complex tone
//    pPhase          Phase of the tone relative to a cosinewave. It must
//                    be in range [0.0, 2*PI).
//    pDst            Pointer to the destination vector.
//    len             Length of the vector
//    hint            Suggests using specific code
//  Notes:
//    for real:  pDst[i] = magn * cos(IPP_2PI * rfreq * i + phase);
//    for cplx:  pDst[i].re = magn * cos(IPP_2PI * rfreq * i + phase);
//               pDst[i].im = magn * sin(IPP_2PI * rfreq * i + phase);
}


// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsTone_Direct_32f(pDst:PIpp32f; len:integer; magn:single; rFreq:single; pPhase:PSingle; hint:IppHintAlgorithm):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsTone_Direct_32fc(pDst:PIpp32fc; len:integer; magn:single; rFreq:single; pPhase:PSingle; hint:IppHintAlgorithm):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsTone_Direct_64f(pDst:PIpp64f; len:integer; magn:double; rFreq:double; pPhase:PDouble; hint:IppHintAlgorithm):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsTone_Direct_64fc(pDst:PIpp64fc; len:integer; magn:double; rFreq:double; pPhase:PDouble; hint:IppHintAlgorithm):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsTone_Direct_16s(pDst:PIpp16s; len:integer; magn:Ipp16s; rFreq:single; pPhase:PSingle; hint:IppHintAlgorithm):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsTone_Direct_16sc(pDst:PIpp16sc; len:integer; magn:Ipp16s; rFreq:single; pPhase:PSingle; hint:IppHintAlgorithm):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

type
  PIppToneState_16s = ^TIppToneState_16s;
  TIppToneState_16s = record end;

{
//  Name:                ippsToneInitAllocQ15_16s
//  Purpose:             Allocates memory for the structure IppToneState_16s,
//                       initializes it with a set of cosinwave parameters (magnitude,
//                       frequency, phase).
//  Context:
//  Returns:             IppStatus
//    ippStsNoErr        Ok
//    ippStsNullPtrErr   Double pointer to pToneState is NULL
//    ippStsToneMagnErr  The magn value is less than or equal to zero
//    ippStsToneFreqErr  The freqQ15 value is less than 0 or greater than 16383
//    ippStsTonePhaseErr The phaseQ15 value is less than 0 or greater than 205886
//  Parameters:
//    **pToneState       Double pointer to the structure IppToneState_16s.
//    magn               Magnitude of the tone; that is, the maximum value
//                       attained by the wave.
//    rFreqQ15           Frequency of the tone relative to the sampling
//                       frequency. It must be between 0 and 16383
//    phaseQ15           Phase of the tone relative to a cosinewave. It must
//                       be between 0 and 205886.
//  Notes:
}
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsToneInitAllocQ15_16s(out pToneState:PIppToneState_16s; magn:Ipp16s; rFreqQ15:Ipp16s; phaseQ15:Ipp32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{
//  Name:                ippsToneFree_16s
//  Purpose:             Frees memory, which was allocated
//                       for the structure IppToneState_16s.
//  Context:
//  Returns:             IppStatus
//    ippStsNoErr        Ok
//    ippStsNullPtrErr   Pointer to pToneState is NULL
//  Parameters:
//    *pToneState        Pointer to the structure IppToneState_16s.
//  Notes:
}
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsToneFree(pToneState:PIppToneState_16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{
//  Name:                ippsToneGetStateSizeQ15_16s
//  Purpose:             Computes the size, in bytes, of the structure IppToneState_16s
//  Context:
//  Returns:             IppStatus
//    ippStsNoErr        Ok
//    ippStsNullPtrErr   Pointer to pToneState size is NULL
//  Parameters:
//    *pToneStateSize    Pointer to the computed value of the size
//                       of the structure IppToneState_16s.
//  Notes:
}
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsToneGetStateSizeQ15_16s(out pToneStateSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{
//  Name:                ippsToneInitQ15_16s
//  Purpose:             initializes the structure IppToneState_16s with
//                       given set of cosinewave parameters (magnitude,
//                       frequency, phase)
//  Context:
//  Returns:             IppStatus
//    ippStsNoErr        Ok
//    ippStsNullPtrErr   Pointer to pToneState is NULL
//    ippStsToneMagnErr  The magn value is less than or equal to zero
//    ippStsToneFreqErr  The rFreqQ15 value is less than 0 or greater 16383
//    ippStsTonePhaseErr The phaseQ15 value is less than 0 or greater 205886
//  Parameters:
//    *pToneState        Pointer to the structure IppToneState_16s.
//    magn               Magnitude of the tone; that is, the maximum value
//                       attained by the wave.
//    rFreqQ15           Frequency of the tone relative to the sampling
//                       frequency. It must be between 0 and 16383
//    phaseQ15           Phase of the tone relative to a cosinewave. It must
//                       be between 0 and 205886.
//  Notes:
}
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsToneInitQ15_16s(pToneState:PIppToneState_16s; magn:Ipp16s; rFreqQ15:Ipp16s; phaseQ15:Ipp32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{
//  Name:                ippsToneQ15_16s
//  Purpose:             generates a tone
//  Context:
//  Returns:             IppStatus
//    ippStsNoErr        Ok
//    ippStsNullPtrErr   One of the specified pointers is NULL
//    ippStsSizeErr      len is less than or equal to 0
//  Parameters:
//    pDst               Pointer to the destination vector.
//    len                Length of the vector
//    *pToneState        Pointer to the structure IppToneState_16s.
//  Notes:
}

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsToneQ15_16s(pDst:PIpp16s; len:integer; pToneState:PIppToneState_16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ /////////////////////////////////////////////////////////////////////////////
//  Name:           ippsTriangle_Direct
//  Purpose:        generates a Triangle
//  Context:
//  Returns:        IppStatus
//    ippStsNoErr        Ok
//    ippStsNullPtrErr   Some of pointers to input or output data are NULL
//    ippStsSizeErr       The length of vector is less or equal zero
//    ippStsTrnglMagnErr  The magn value is less or equal to zero
//    ippStsTrnglFreqErr  The rfreq value is less 0 or greater or equal 0.5
//    ippStsTrnglPhaseErr The phase value is less 0 or greater or equal 2*PI
//    ippStsTrnglAsymErr  The asym value is less -PI or greater or equal PI
//  Parameters:
//    magn            Magnitude of the Triangle; that is, the maximum value
//                    attained by the wave
//    rFreq           Frequency of the Triangle relative to the sampling
//                    frequency. It must be in range [0.0, 0.5)
//    pPhase          POinter to the phase of the Triangle relative to acosinewave. It must
//                    be in range [0.0, 2*PI)
//    asym            Asymmetry of a triangle. It must be in range [-PI,PI).
//    pDst            Pointer to destination vector.
//    len             Length of the vector
}


// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsTriangle_Direct_64f(pDst:PIpp64f; len:integer; magn:double; rFreq:double; asym:double; pPhase:PDouble):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsTriangle_Direct_64fc(pDst:PIpp64fc; len:integer; magn:double; rFreq:double; asym:double; pPhase:PDouble):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsTriangle_Direct_32f(pDst:PIpp32f; len:integer; magn:single; rFreq:single; asym:single; pPhase:PSingle):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsTriangle_Direct_32fc(pDst:PIpp32fc; len:integer; magn:single; rFreq:single; asym:single; pPhase:PSingle):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsTriangle_Direct_16s(pDst:PIpp16s; len:integer; magn:Ipp16s; rFreq:single; asym:single; pPhase:PSingle):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsTriangle_Direct_16sc(pDst:PIpp16sc; len:integer; magn:Ipp16s; rFreq:single; asym:single; pPhase:PSingle):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

type
  PIppTriangleState_16s = ^TIppTriangleState_16s;
  TIppTriangleState_16s = record end;

{
//  Name:                ippsTriangleInitAllocQ15_16s
//  Purpose:             Allocates memory for the structure IppTriangleState_16s,
//                       initializes it with a set of wave parameters (magnitude,
//                       frequency, phase, asymmetry).
//  Context:
//  Returns:             IppStatus
//    ippStsNoErr        Ok
//    ippStsNullPtrErr   Double pointer to pTriangleState is NULL
//    ippStsTriangleMagnErr  The magn value is less than or equal to zero
//    ippStsTriangleFreqErr  The freqQ15 value is less than 0 or greater than 16383
//    ippStsTriangleAsymErr  The phaseQ15 value is less than 0 or greater than 205886
//    ippStsTrianglePhaseErr The asymQ15 value is less than -102943 or greater than 102943
//  Parameters:
//    **pTriangleState   Double pointer to the structure IppTriangleState_16s.
//    magn               Magnitude of the Triangle; that is, the maximum value
//                       attained by the wave.
//    rFreqQ15           Frequency of the Triangle relative to the sampling
//                       frequency. It must be between 0 and 16383
//    phaseQ15           Phase of the Triangle relative to a wave. It must
//                       be between 0 and 205886.
//    asymQ15            Asymmetry of the Triangle relative to a wave. It must
//                       be between -102943 and 102943.
//  Notes:
}
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsTriangleInitAllocQ15_16s(out pTriangleState:PIppTriangleState_16s; magn:Ipp16s; rFreqQ15:Ipp16s; phaseQ15:Ipp32s; asymQ15:Ipp32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};



{
//  Name:                ippsTriangleFree_16s
//  Purpose:             Frees memory, which was allocated
//                       for the structure IppTriangleState_16s.
//  Context:
//  Returns:             IppStatus
//    ippStsNoErr        Ok
//    ippStsNullPtrErr   Pointer to pTriangleState is NULL
//  Parameters:
//    *pTriangleState    Pointer to the structure IppTriangleState_16s.
//  Notes:
}
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsTriangleFree(pTriangleState:PIppTriangleState_16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};



{
//  Name:                ippsTriangleGetStateSizeQ15_16s
//  Purpose:             Computes the size, in bytes, of the structure IppTriangleState_16s
//  Context:
//  Returns:             IppStatus
//    ippStsNoErr        Ok
//    ippStsNullPtrErr   Pointer to pTriangleState size is NULL
//  Parameters:
//    *pTriangleStateSize Pointer to the computed value of the size
//                        of the structure IppTriangleState_16s.
//  Notes:
}
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsTriangleGetStateSizeQ15_16s(out pTriangleStateSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{
//  Name:                ippsTriangleInitQ15_16s
//  Purpose:             Initializes the structure IppTriangleState_16s
//                       with a given set of cosinewave parameters (magnitude,
//                       frequency, phase)
//  Context:
//  Returns:               IppStatus
//    ippStsNoErr          Ok
//    ippStsNullPtrErr     The pointer to pTriangleState is NULL
//    ippStsTrngleMagnErr  The magn value is less than or equal to zero
//    ippStsTrngleFreqErr  The freqQ15 value is less than 0 or greater than 16383
//    ippStsTrnglePhaseErr The phaseQ15 value is less than 0 or greater than 205886
//    ippStsTrngleAsymErr  The asymQ15 value is less than -102943 or greater than 102943
//  Parameters:
//    *pTriangleState    Pointer to the structure IppTriangleState_16s.
//    magn               Magnitude of the Triangle; that is, the maximum value
//                       attained by the wave.
//    rFreqQ15           Frequency of the Triangle relative to the sampling
//                       frequency. It must be between 0 and 16383
//    phaseQ15           Phase of the Triangle relative to a wave. It must
//                       be between 0 and 205886.
//    asymQ15            Asymmetry of the Triangle relative to a wave. It must
//                       be between -102943 and 102943.

//  Notes:
}
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsTriangleInitQ15_16s(pTriangleState:PIppTriangleState_16s; magn:Ipp16s; rFreqQ15:Ipp16s; phaseQ15:Ipp32s; asymQ15:Ipp32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{
//  Name:                ippsTriangleQ15_16s
//  Purpose:             generates a Triangle
//  Context:
//  Returns:             IppStatus
//    ippStsNoErr        Ok
//  Parameters:
//    pDst               The pointer to destination vector.
//    len                The length of vector
//    *pTriangleState    Pointer to the structure IppTriangleState_16s.
//  Notes:
}
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsTriangleQ15_16s(pDst:PIpp16s; len:integer; pTriangleState:PIppTriangleState_16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//  Name:           ippsToneQ15_Direct_16s
//  Purpose:        generates a tone
//  Context:
//  Returns:             IppStatus
//    ippStsNoErr        Ok
//    ippStsNullPtrErr   The pointer to the destination vector is NULL
//    ippStsSizeErr      The length of the vector is less than or equal to zero
//    ippStsToneMagnErr  The magn value is less than or equal to zero
//    ippStsToneFreqErr  The rFreqQ15 value is less than 0 or greater than 16383
//    ippStsTonePhaseErr The phaseQ15 value is less than 0 or greater than 205886

//  Parameters:
//    pDst          Pointer to the destination vector.
//    len           Length of the vector
//    magn          Magnitude of the tone; that is, the maximum value
//                  attained by the wave.It must be between 0 and 32767
//    rFreqQ15      Frequency of the tone relative to the sampling
//                  frequency. It must be between 0 and 16383
//    phaseQ15      Phase of the tone relative to a cosinewave. It must
//                  be between 0 and 205886.
}
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsToneQ15_Direct_16s(pDst:PIpp16s; len:integer; magn:Ipp16s; rFreqQ15:Ipp16s; phaseQ15:Ipp32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ /////////////////////////////////////////////////////////////////////////////
//  Name:           ippsTriangleQ15_Direct_16s
//  Purpose:        generates a Triangle
//  Context:
//  Returns:                 IppStatus
//    ippStsNoErr            Ok
//    ippStsNullPtrErr       The pointer to the destination vector is NULL
//    ippStsSizeErr          The length of the vector is less than or equal to zero
//    ippStsTriangleMagnErr  The magn value is less than or equal to zero
//    ippStsTriangleFreqErr  The rFfreqQ15 value is less than 0 or greater than 16383
//    ippStsTriangleAsymErr  The asymQ15 value is less than 0 or greater than 205886
//    ippStsTrianglePhaseErr The phaseQ15 value is less than -102943 or greater than 102943
//  Parameters:
//    pDst          Pointer to the destination vector.
//    len           Length of the vector
//    mag           Magnitude of the Triangle; that is, the maximum value
//                  attained by the wave. It must be between 0 and 32767.
//    rFreqQ15      Frequency of the Triangle relative to the sampling
//                  frequency. It must be between 0 and 16383
//    phaseQ15      The phase of the Triangle relative to a wave. It must
//                  be between 0 and 205886.
//    asymQ15       The asymmetry of the Triangle relative to a wave. It must
//                  be between -102943 and 102943.
//  Notes:
}
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsTriangleQ15_Direct_16s(pDst:PIpp16s; len:integer; magn:Ipp16s; rFreqQ15:Ipp16s; phaseQ15:Ipp32s; asymQ15:Ipp32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};



{ /////////////////////////////////////////////////////////////////////////
//  Name:               ippsVectorRamp_8u,  ippsVectorRamp_8s,
//                      ippsVectorRamp_16u, ippsVectorRamp_16s,
//                      ippsVectorRamp_32u, ippsVectorRamp_32s,
//                      ippsVectorRamp_32f, ippsVectorRamp_64f
//  Purpose:            Creates ramp vector
//
//  Parameters:
//    pDst              A pointer to the destination vector
//    len               Vector's length
//    offset            Offset value
//    slope             Slope coefficient
//
//  Return:
//    ippStsNoErr       No error
//    ippStsNullPtrErr  pDst pointer is NULL
//    ippStsBadSizeErr  Vector's length is less or equal zero
//    ippStsNoErr       No error
//
//  Notes:              Dst[n] = offset + slope * n
//
}
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use Slope function instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsVectorRamp_8u(pDst:PIpp8u; len:integer; offset:single; slope:single):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use Slope function instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsVectorRamp_8s(pDst:PIpp8s; len:integer; offset:single; slope:single):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use Slope function instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsVectorRamp_16u(pDst:PIpp16u; len:integer; offset:single; slope:single):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use Slope function instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsVectorRamp_16s(pDst:PIpp16s; len:integer; offset:single; slope:single):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use Slope function instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsVectorRamp_32u(pDst:PIpp32u; len:integer; offset:single; slope:single):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use Slope function instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsVectorRamp_32s(pDst:PIpp32s; len:integer; offset:single; slope:single):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use Slope function instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsVectorRamp_32f(pDst:PIpp32f; len:integer; offset:single; slope:single):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use Slope function instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsVectorRamp_64f(pDst:PIpp64f; len:integer; offset:single; slope:single):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};



{ /////////////////////////////////////////////////////////////////////////////
//                   Convert functions
///////////////////////////////////////////////////////////////////////////// }
{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippsReal
//  Purpose:    form vector with real part of the input complex vector
//  Parameters:
//    pSrc       pointer to the input complex vector
//    pDstRe     pointer to the output vector to store the real part
//    len        length of the vectors, number of items
//  Return:
//    ippStsNullPtrErr       pointer(s) to the data is NULL
//    ippStsSizeErr          length of the vectors is less or equal zero
//    ippStsNoErr            otherwise
}

function ippsReal_64fc(pSrc:PIpp64fc; pDstRe:PIpp64f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsReal_32fc(pSrc:PIpp32fc; pDstRe:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsReal_16sc(pSrc:PIpp16sc; pDstRe:PIpp16s; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippsImag
//  Purpose:    form vector with imaginary part of the input complex vector
//  Parameters:
//    pSrc       pointer to the input complex vector
//    pDstRe     pointer to the output vector to store the real part
//    len        length of the vectors, number of items
//  Return:
//    ippStsNullPtrErr       pointer(s) to the data is NULL
//    ippStsSizeErr          length of the vectors is less or equal zero
//    ippStsNoErr            otherwise
}

function ippsImag_64fc(pSrc:PIpp64fc; pDstIm:PIpp64f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsImag_32fc(pSrc:PIpp32fc; pDstIm:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsImag_16sc(pSrc:PIpp16sc; pDstIm:PIpp16s; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippsCplxToReal
//  Purpose:    form the real and imaginary parts of the input complex vector
//  Parameters:
//    pSrc       pointer to the input complex vector
//    pDstRe     pointer to output vector to store the real part
//    pDstIm     pointer to output vector to store the imaginary part
//    len        length of the vectors, number of items
//  Return:
//    ippStsNullPtrErr        pointer(s) to the data is NULL
//    ippStsSizeErr           length of the vectors is less or equal zero
//    ippStsNoErr             otherwise
}

function ippsCplxToReal_64fc(pSrc:PIpp64fc; pDstRe:PIpp64f; pDstIm:PIpp64f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsCplxToReal_32fc(pSrc:PIpp32fc; pDstRe:PIpp32f; pDstIm:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsCplxToReal_16sc(pSrc:PIpp16sc; pDstRe:PIpp16s; pDstIm:PIpp16s; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippsRealToCplx
//  Purpose:    form complex vector from the real and imaginary components
//  Parameters:
//    pSrcRe     pointer to the input vector with real part, may be NULL
//    pSrcIm     pointer to the input vector with imaginary part, may be NULL
//    pDst       pointer to the output complex vector
//    len        length of the vectors
//  Return:
//    ippStsNullPtrErr        pointer to the destination data is NULL
//    ippStsSizeErr           length of the vectors is less or equal zero
//    ippStsNoErr             otherwise
//
//  Notes:      one of the two input pointers may be NULL. In this case
//              the corresponding values of the output complex elements is 0
}

function ippsRealToCplx_64f(pSrcRe:PIpp64f; pSrcIm:PIpp64f; pDst:PIpp64fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsRealToCplx_32f(pSrcRe:PIpp32f; pSrcIm:PIpp32f; pDst:PIpp32fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsRealToCplx_16s(pSrcRe:PIpp16s; pSrcIm:PIpp16s; pDst:PIpp16sc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};




{ /////////////////////////////////////////////////////////////////////////////
//  Names:       ippsConj, ippsConjFlip
//  Purpose:     complex conjugate data vector
//  Parameters:
//    pSrc               pointer to the input vector
//    pDst               pointer to the output vector
//    len                length of the vectors
//  Return:
//    ippStsNullPtrErr      pointer(s) to the data is NULL
//    ippStsSizeErr         length of the vectors is less or equal zero
//    ippStsNoErr           otherwise
//  Notes:
//    the ConjFlip version conjugates and stores result in reverse order
}

function ippsConj_64fc_I(pSrcDst:PIpp64fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsConj_32fc_I(pSrcDst:PIpp32fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsConj_16sc_I(pSrcDst:PIpp16sc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsConj_64fc(pSrc:PIpp64fc; pDst:PIpp64fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsConj_32fc(pSrc:PIpp32fc; pDst:PIpp32fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsConj_16sc(pSrc:PIpp16sc; pDst:PIpp16sc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsConjFlip_64fc(pSrc:PIpp64fc; pDst:PIpp64fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsConjFlip_32fc(pSrc:PIpp32fc; pDst:PIpp32fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsConjFlip_16sc(pSrc:PIpp16sc; pDst:PIpp16sc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsConjCcs_64fc_I(pSrcDst:PIpp64fc; lenDst:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsConjCcs_32fc_I(pSrcDst:PIpp32fc; lenDst:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsConjCcs_16sc_I(pSrcDst:PIpp16sc; lenDst:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsConjCcs_64fc(pSrc:PIpp64f; pDst:PIpp64fc; lenDst:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsConjCcs_32fc(pSrc:PIpp32f; pDst:PIpp32fc; lenDst:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsConjCcs_16sc(pSrc:PIpp16s; pDst:PIpp16sc; lenDst:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsConjPack_64fc_I(pSrcDst:PIpp64fc; lenDst:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsConjPack_32fc_I(pSrcDst:PIpp32fc; lenDst:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsConjPack_16sc_I(pSrcDst:PIpp16sc; lenDst:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsConjPack_64fc(pSrc:PIpp64f; pDst:PIpp64fc; lenDst:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsConjPack_32fc(pSrc:PIpp32f; pDst:PIpp32fc; lenDst:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsConjPack_16sc(pSrc:PIpp16s; pDst:PIpp16sc; lenDst:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsConjPerm_64fc_I(pSrcDst:PIpp64fc; lenDst:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsConjPerm_32fc_I(pSrcDst:PIpp32fc; lenDst:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsConjPerm_16sc_I(pSrcDst:PIpp16sc; lenDst:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsConjPerm_64fc(pSrc:PIpp64f; pDst:PIpp64fc; lenDst:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsConjPerm_32fc(pSrc:PIpp32f; pDst:PIpp32fc; lenDst:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsConjPerm_16sc(pSrc:PIpp16s; pDst:PIpp16sc; lenDst:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippsConvert
//  Purpose:    Converts integer data to floating point data
//  Parameters:
//    pSrc        pointer to integer data to be converted
//    pDst        pointer to the destination vector
//    len         length of the vectors
//  Return:
//    ippStsNullPtrErr    pointer(s) to the data is NULL
//    ippStsSizeErr       length of the vectors is less or equal zero
//    ippStsNoErr         otherwise
}
function ippsConvert_8s16s(pSrc:PIpp8s; pDst:PIpp16s; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsConvert_16s32s(pSrc:PIpp16s; pDst:PIpp32s; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsConvert_32s16s(pSrc:PIpp32s; pDst:PIpp16s; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsConvert_8s32f(pSrc:PIpp8s; pDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsConvert_8u32f(pSrc:PIpp8u; pDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsConvert_16s32f(pSrc:PIpp16s; pDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsConvert_16u32f(pSrc:PIpp16u; pDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsConvert_32s64f(pSrc:PIpp32s; pDst:PIpp64f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsConvert_32s32f(pSrc:PIpp32s; pDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsConvert_64s64f(pSrc:PIpp64s; pDst:PIpp64f; len:Ipp32u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsConvert_16s8s_Sfs(pSrc:PIpp16s; pDst:PIpp8s; len:Ipp32u; rndMode:IppRoundMode; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippsConvert
//  Purpose:    convert floating point data to integer data
//  Parameters:
//    pSrc         pointer to the input floating point data to be converted
//    pDst         pointer to destination vector
//    len          length of the vectors
//    rndMode      Rounding mode which can be ippRndZero or ippRndNear
//    scaleFactor  scale factor value
//  Return:
//    ippStsNullPtrErr    pointer(s) to the data NULL
//    ippStsSizeErr       length of the vectors is less or equal zero
//    ippStsNoErr         otherwise
//  Note:
//    an out-of-range result will be saturated
}

function ippsConvert_32f8s_Sfs(pSrc:PIpp32f; pDst:PIpp8s; len:integer; rndMode:IppRoundMode; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsConvert_32f8u_Sfs(pSrc:PIpp32f; pDst:PIpp8u; len:integer; rndMode:IppRoundMode; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsConvert_32f16s_Sfs(pSrc:PIpp32f; pDst:PIpp16s; len:integer; rndMode:IppRoundMode; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsConvert_32f16u_Sfs(pSrc:PIpp32f; pDst:PIpp16u; len:integer; rndMode:IppRoundMode; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsConvert_64f32s_Sfs(pSrc:PIpp64f; pDst:PIpp32s; len:integer; rndMode:IppRoundMode; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsConvert_32f32s_Sfs(pSrc:PIpp32f; pDst:PIpp32s; len:integer; rndMode:IppRoundMode; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsConvert_64f16s_Sfs(pSrc:PIpp64f; pDst:PIpp16s; len:integer; rndMode:IppRoundMode; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsConvert_64f64s_Sfs(pSrc:PIpp64f; pDst:PIpp64s; len:Ipp32u; rndMode:IppRoundMode; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippsConvert_32f64f
//  Purpose:    Converts floating point data Ipp32f
//              to floating point data Ipp64f
//  Parameters:
//    pSrc          pointer to the input vector
//    pDst          pointer to the output vector
//    len           length of the vectors
//  Return:
//    ippStsNullPtrErr    pointer(s) to the data is NULL
//    ippStsSizeErr       length of the vectors is less or equal zero
//    ippStsNoErr         otherwise
}

function ippsConvert_32f64f(pSrc:PIpp32f; pDst:PIpp64f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippsConvert_64f32f
//  Purpose:    Converts floating point data Ipp64f
//              to floating point data Ipp32f
//  Parameters:
//    pSrc          pointer to the input vector
//    pDst          pointer to the output vector
//    len           length of the vectors
//  Return:
//    ippStsNullPtrErr    pointer(s) to the data is NULL
//    ippStsSizeErr       length of the vectors is less or equal zero
//    ippStsNoErr         otherwise
//  Note:
//    an out-of-range result will be saturated
}

function ippsConvert_64f32f(pSrc:PIpp64f; pDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippsConvert
//  Purpose:    Converts integer data to floating point data
//  Parameters:
//    pSrc          pointer to integer data to be converted
//    pDst          pointer to the destination vector
//    len           length of the vectors
//    scaleFactor   scale factor value
//  Return:
//    ippStsNullPtrErr    pointer(s) to the data is NULL
//    ippStsSizeErr       length of the vectors is less or equal zero
//    ippStsNoErr         otherwise
}

function ippsConvert_16s32f_Sfs(pSrc:PIpp16s; pDst:PIpp32f; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsConvert_16s64f_Sfs(pSrc:PIpp16s; pDst:PIpp64f; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsConvert_32s32f_Sfs(pSrc:PIpp32s; pDst:PIpp32f; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsConvert_32s64f_Sfs(pSrc:PIpp32s; pDst:PIpp64f; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsConvert_32s16s_Sfs(pSrc:PIpp32s; pDst:PIpp16s; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippsConvert
//  Purpose:    Converts 24u data to 32u or 32f data.
//              Converts 32u or 32f data to 24u data.
//              Converts 24s data to 32s or 32f data.
//              Converts 32s or 32f data to 24s data.
//  Parameters:
//    pSrc          pointer to the input vector
//    pDst          pointer to the output vector
//    len           length of the vectors
//    scaleFactor   scale factor value
//  Return:
//    ippStsNullPtrErr    pointer(s) to the data is NULL
//    ippStsSizeErr       length of the vectors is less or equal zero
//    ippStsNoErr         otherwise
}

function ippsConvert_24u32u(pSrc:PIpp8u; pDst:PIpp32u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsConvert_32u24u_Sfs(pSrc:PIpp32u; pDst:PIpp8u; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsConvert_24u32f(pSrc:PIpp8u; pDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsConvert_32f24u_Sfs(pSrc:PIpp32f; pDst:PIpp8u; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsConvert_24s32s(pSrc:PIpp8u; pDst:PIpp32s; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsConvert_32s24s_Sfs(pSrc:PIpp32s; pDst:PIpp8u; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsConvert_24s32f(pSrc:PIpp8u; pDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsConvert_32f24s_Sfs(pSrc:PIpp32f; pDst:PIpp8u; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

type
  Ipp16f = Ipp16s;

  PIpp16f = ^Ipp16f;

{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippsConvert_16s16f
//  Purpose:    Converts integer data to floating point data
//  Parameters:
//    pSrc        pointer to integer data to be converted
//    pDst        pointer to the destination vector
//    len         length of the vectors
//    rndMode      Rounding mode which can be ippRndZero or ippRndNear
//  Return:
//    ippStsNullPtrErr    pointer(s) to the data is NULL
//    ippStsSizeErr       length of the vectors is less or equal zero
//    ippStsNoErr         otherwise
}

function ippsConvert_16s16f(pSrc:PIpp16s; pDst:PIpp16f; len:integer; rndMode:IppRoundMode):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippsConvert_16f16s_Sfs
//  Purpose:    convert floating point data to integer data
//  Parameters:
//    pSrc         pointer to the input floating point data to be converted
//    pDst         pointer to destination vector
//    len          length of the vectors
//    rndMode      Rounding mode which can be ippRndZero or ippRndNear
//    scaleFactor  scale factor value
//  Return:
//    ippStsNullPtrErr    pointer(s) to the data NULL
//    ippStsSizeErr       length of the vectors is less or equal zero
//    ippStsNoErr         otherwise
//  Note:
//    an out-of-range result will be saturated
}
function ippsConvert_16f16s_Sfs(pSrc:PIpp16f; pDst:PIpp16s; len:integer; rndMode:IppRoundMode; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippsConvert_32f16f
//  Purpose:    Converts floating point data Ipp32f
//              to floating point data Ipp16f
//  Parameters:
//    pSrc          pointer to the input vector
//    pDst          pointer to the output vector
//    len           length of the vectors
//    rndMode       Rounding mode which can be ippRndZero or ippRndNear
//  Return:
//    ippStsNullPtrErr    pointer(s) to the data is NULL
//    ippStsSizeErr       length of the vectors is less or equal zero
//    ippStsNoErr         otherwise
}
function ippsConvert_32f16f(pSrc:PIpp32f; pDst:PIpp16f; len:integer; rndMode:IppRoundMode):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippsConvert_16f32f
//  Purpose:    Converts floating point data Ipp16f
//              to floating point data Ipp32f
//  Parameters:
//    pSrc          pointer to the input vector
//    pDst          pointer to the output vector
//    len           length of the vectors
Return:
//    ippStsNullPtrErr    pointer(s) to the data is NULL
//    ippStsSizeErr       length of the vectors is less or equal zero
//    ippStsNoErr         otherwise
}
function ippsConvert_16f32f(pSrc:PIpp16f; pDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippsConvert
//  Purpose:    convert integer data to integer data
//  Parameters:
//    pSrc         pointer to the input integer data to be converted
//    pDst         pointer to destination vector
//    len          length of the vectors
//    rndMode      Rounding mode which can be ippRndZero or ippRndNear
//    scaleFactor  scale factor value
//  Return:
//    ippStsNullPtrErr    pointer(s) to the data NULL
//    ippStsSizeErr       length of the vectors is less or equal zero
//    ippStsNoErr         otherwise
//  Note:
//    an out-of-range result will be saturated
}

function ippsConvert_64s32s_Sfs(pSrc:PIpp64s; pDst:PIpp32s; len:integer; rndMode:IppRoundMode; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};



{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippsThreshold
//  Purpose:    execute threshold operation on every element of the vector
//  Parameters:
//    level      level of the threshold operation
//    pSrcDst    pointer to the vector for in-place operation
//    pSrc       pointer to the input vector
//    pDst       pointer to the output vector
//    len        length of the vectors
//    relOp      comparison mode, cmpLess or cmpGreater
//  Return:
//    ippStsNullPtrErr          pointer(s) to the data is NULL
//    ippStsSizeErr             length of the vectors is less or equal zero
//    ippStsThreshNegLevelErr   negative level value in complex operation
//    ippStsBadArgErr           relOp is no cmpLess and no cmpGreater
//    ippStsNoErr               otherwise
//  Notes:
//  real data
//    cmpLess    : pDst[n] = pSrc[n] < level ? level : pSrc[n];
//    cmpGreater : pDst[n] = pSrc[n] > level ? level : pSrc[n];
//  complex data
//    cmpLess    : pDst[n] = abs(pSrc[n]) < level ? pSrc[n]*k : pSrc[n];
//    cmpGreater : pDst[n] = abs(pSrc[n]) > level ? pSrc[n]*k : pSrc[n];
//    where k = level / abs(pSrc[n]);
}

function ippsThreshold_32f_I(pSrcDst:PIpp32f; len:integer; level:Ipp32f; relOp:IppCmpOp):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_32fc_I(pSrcDst:PIpp32fc; len:integer; level:Ipp32f; relOp:IppCmpOp):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_64f_I(pSrcDst:PIpp64f; len:integer; level:Ipp64f; relOp:IppCmpOp):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_64fc_I(pSrcDst:PIpp64fc; len:integer; level:Ipp64f; relOp:IppCmpOp):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_16s_I(pSrcDst:PIpp16s; len:integer; level:Ipp16s; relOp:IppCmpOp):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_16sc_I(pSrcDst:PIpp16sc; len:integer; level:Ipp16s; relOp:IppCmpOp):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsThreshold_32f(pSrc:PIpp32f; pDst:PIpp32f; len:integer; level:Ipp32f; relOp:IppCmpOp):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_32fc(pSrc:PIpp32fc; pDst:PIpp32fc; len:integer; level:Ipp32f; relOp:IppCmpOp):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_64f(pSrc:PIpp64f; pDst:PIpp64f; len:integer; level:Ipp64f; relOp:IppCmpOp):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_64fc(pSrc:PIpp64fc; pDst:PIpp64fc; len:integer; level:Ipp64f; relOp:IppCmpOp):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_16s(pSrc:PIpp16s; pDst:PIpp16s; len:integer; level:Ipp16s; relOp:IppCmpOp):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_16sc(pSrc:PIpp16sc; pDst:PIpp16sc; len:integer; level:Ipp16s; relOp:IppCmpOp):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippsThresholdLT
//              ippsThresholdGT
//  Purpose:    execute threshold operation on every element of the vector,
//              "less than" for ippsThresoldLT
//              "greater than for ippsThresholdGT
//  Parameters:
//    pSrcDst    pointer to the vector for in-place operation
//    pSrc       pointer to the input vector
//    pDst       pointer to the output vector
//    len         length of the vectors
//    level      level of the threshold operation
//  Return:
//    ippStsNullPtrErr          pointer(s) to the data is NULL
//    ippStsSizeErr             length of the vectors is less or equal zero
//    ippStsThreshNegLevelErr   negative level value in complex operation
//    ippStsNoErr               otherwise
}
function ippsThreshold_LT_32f_I(pSrcDst:PIpp32f; len:integer; level:Ipp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_LT_32fc_I(pSrcDst:PIpp32fc; len:integer; level:Ipp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_LT_64f_I(pSrcDst:PIpp64f; len:integer; level:Ipp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_LT_64fc_I(pSrcDst:PIpp64fc; len:integer; level:Ipp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_LT_16s_I(pSrcDst:PIpp16s; len:integer; level:Ipp16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_LT_16sc_I(pSrcDst:PIpp16sc; len:integer; level:Ipp16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_LT_32f(pSrc:PIpp32f; pDst:PIpp32f; len:integer; level:Ipp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_LT_32fc(pSrc:PIpp32fc; pDst:PIpp32fc; len:integer; level:Ipp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_LT_64f(pSrc:PIpp64f; pDst:PIpp64f; len:integer; level:Ipp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_LT_64fc(pSrc:PIpp64fc; pDst:PIpp64fc; len:integer; level:Ipp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_LT_16s(pSrc:PIpp16s; pDst:PIpp16s; len:integer; level:Ipp16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_LT_16sc(pSrc:PIpp16sc; pDst:PIpp16sc; len:integer; level:Ipp16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsThreshold_LT_32s_I(pSrcDst:PIpp32s; len:integer; level:Ipp32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_LT_32s(pSrc:PIpp32s; pDst:PIpp32s; len:integer; level:Ipp32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsThreshold_GT_32f_I(pSrcDst:PIpp32f; len:integer; level:Ipp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_GT_32fc_I(pSrcDst:PIpp32fc; len:integer; level:Ipp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_GT_64f_I(pSrcDst:PIpp64f; len:integer; level:Ipp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_GT_64fc_I(pSrcDst:PIpp64fc; len:integer; level:Ipp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_GT_16s_I(pSrcDst:PIpp16s; len:integer; level:Ipp16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_GT_16sc_I(pSrcDst:PIpp16sc; len:integer; level:Ipp16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_GT_32f(pSrc:PIpp32f; pDst:PIpp32f; len:integer; level:Ipp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_GT_32fc(pSrc:PIpp32fc; pDst:PIpp32fc; len:integer; level:Ipp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_GT_64f(pSrc:PIpp64f; pDst:PIpp64f; len:integer; level:Ipp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_GT_64fc(pSrc:PIpp64fc; pDst:PIpp64fc; len:integer; level:Ipp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_GT_16s(pSrc:PIpp16s; pDst:PIpp16s; len:integer; level:Ipp16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_GT_16sc(pSrc:PIpp16sc; pDst:PIpp16sc; len:integer; level:Ipp16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippsThreshold_LTAbs
//              ippsThreshold_GTAbs
//  Purpose:    execute threshold by abolute value operation on every element
//              of the vector
//              "less than" for ippsThresold_LTAbs
//              "greater than for ippsThreshold_GTAbs
//  Parameters:
//    pSrcDst    pointer to the vector for in-place operation
//    pSrc       pointer to the input vector
//    pDst       pointer to the output vector
//    len         length of the vectors
//    level      level of the threshold operation
//  Return:
//    ippStsNullPtrErr          pointer(s) to the data is NULL
//    ippStsSizeErr             length of the vectors is less or equal zero
//    ippStsThreshNegLevelErr   negative level value in complex operation
//    ippStsNoErr               otherwise
}
function ippsThreshold_LTAbs_32f(pSrc:PIpp32f; pDst:PIpp32f; len:integer; level:Ipp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_LTAbs_64f(pSrc:PIpp64f; pDst:PIpp64f; len:integer; level:Ipp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_LTAbs_16s(pSrc:PIpp16s; pDst:PIpp16s; len:integer; level:Ipp16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_LTAbs_32s(pSrc:PIpp32s; pDst:PIpp32s; len:integer; level:Ipp32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_LTAbs_32f_I(pSrcDst:PIpp32f; len:integer; level:Ipp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_LTAbs_64f_I(pSrcDst:PIpp64f; len:integer; level:Ipp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_LTAbs_16s_I(pSrcDst:PIpp16s; len:integer; level:Ipp16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_LTAbs_32s_I(pSrcDst:PIpp32s; len:integer; level:Ipp32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_GTAbs_32f(pSrc:PIpp32f; pDst:PIpp32f; len:integer; level:Ipp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_GTAbs_64f(pSrc:PIpp64f; pDst:PIpp64f; len:integer; level:Ipp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_GTAbs_16s(pSrc:PIpp16s; pDst:PIpp16s; len:integer; level:Ipp16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_GTAbs_32s(pSrc:PIpp32s; pDst:PIpp32s; len:integer; level:Ipp32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_GTAbs_32f_I(pSrcDst:PIpp32f; len:integer; level:Ipp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_GTAbs_64f_I(pSrcDst:PIpp64f; len:integer; level:Ipp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_GTAbs_16s_I(pSrcDst:PIpp16s; len:integer; level:Ipp16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_GTAbs_32s_I(pSrcDst:PIpp32s; len:integer; level:Ipp32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippsThresholdLTValue
//              ippsThresholdGTValue
//  Purpose:    execute threshold operation on every element of the vector with
//              replace on value,
//              "less than" for ippsThresoldLTValue
//              "greater than for ippsThresholdGTValue
//  Parameters:
//    pSrcDst    pointer to the vector for in-place operation
//    pSrc       pointer to the input vector
//    pDst       pointer to the output vector
//    len         length of the vectors
//    level      level of the threshold operation
//    value      value of replace
//  Return:
//    ippStsNullPtrErr          pointer(s) to the data is NULL
//    ippStsSizeErr             length of the vectors is less or equal zero
//    ippStsThreshNegLevelErr   negative level value in complex operation
//    ippStsNoErr               otherwise
}
function ippsThreshold_LTVal_32f_I(pSrcDst:PIpp32f; len:integer; level:Ipp32f; value:Ipp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_LTVal_32fc_I(pSrcDst:PIpp32fc; len:integer; level:Ipp32f; value:Ipp32fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_LTVal_64f_I(pSrcDst:PIpp64f; len:integer; level:Ipp64f; value:Ipp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_LTVal_64fc_I(pSrcDst:PIpp64fc; len:integer; level:Ipp64f; value:Ipp64fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_LTVal_16s_I(pSrcDst:PIpp16s; len:integer; level:Ipp16s; value:Ipp16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_LTVal_16sc_I(pSrcDst:PIpp16sc; len:integer; level:Ipp16s; value:Ipp16sc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_LTVal_32f(pSrc:PIpp32f; pDst:PIpp32f; len:integer; level:Ipp32f; value:Ipp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_LTVal_32fc(pSrc:PIpp32fc; pDst:PIpp32fc; len:integer; level:Ipp32f; value:Ipp32fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_LTVal_64f(pSrc:PIpp64f; pDst:PIpp64f; len:integer; level:Ipp64f; value:Ipp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_LTVal_64fc(pSrc:PIpp64fc; pDst:PIpp64fc; len:integer; level:Ipp64f; value:Ipp64fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_LTVal_16s(pSrc:PIpp16s; pDst:PIpp16s; len:integer; level:Ipp16s; value:Ipp16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_LTVal_16sc(pSrc:PIpp16sc; pDst:PIpp16sc; len:integer; level:Ipp16s; value:Ipp16sc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_GTVal_32f_I(pSrcDst:PIpp32f; len:integer; level:Ipp32f; value:Ipp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_GTVal_32fc_I(pSrcDst:PIpp32fc; len:integer; level:Ipp32f; value:Ipp32fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_GTVal_64f_I(pSrcDst:PIpp64f; len:integer; level:Ipp64f; value:Ipp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_GTVal_64fc_I(pSrcDst:PIpp64fc; len:integer; level:Ipp64f; value:Ipp64fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_GTVal_16s_I(pSrcDst:PIpp16s; len:integer; level:Ipp16s; value:Ipp16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_GTVal_16sc_I(pSrcDst:PIpp16sc; len:integer; level:Ipp16s; value:Ipp16sc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_GTVal_32f(pSrc:PIpp32f; pDst:PIpp32f; len:integer; level:Ipp32f; value:Ipp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_GTVal_32fc(pSrc:PIpp32fc; pDst:PIpp32fc; len:integer; level:Ipp32f; value:Ipp32fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_GTVal_64f(pSrc:PIpp64f; pDst:PIpp64f; len:integer; level:Ipp64f; value:Ipp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_GTVal_64fc(pSrc:PIpp64fc; pDst:PIpp64fc; len:integer; level:Ipp64f; value:Ipp64fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_GTVal_16s(pSrc:PIpp16s; pDst:PIpp16s; len:integer; level:Ipp16s; value:Ipp16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_GTVal_16sc(pSrc:PIpp16sc; pDst:PIpp16sc; len:integer; level:Ipp16s; value:Ipp16sc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ /////////////////////////////////////////////////////////////////////////////
//  Names:      ippsThresholdLTInv
//
//  Purpose:    replace elements of vector values by their inversion after
//              threshold operation
//  Parameters:
//    level      level of threshold operation
//    pSrcDst    pointer to the vector in in-place operation
//    pSrc       pointer to the source vector
//    pDst       pointer to the destination vector
//    len        length of the vectors
//  Return:
//    ippStsNullPtrErr              pointer(s) to the data is NULL
//    ippStsSizeErr                 length of the vector is less or equal zero
//    ippStsThreshNegLevelErr       negative level value
//    ippStsInvZero                 level value and source element value are zero
//    ippStsNoErr                   otherwise
}

function ippsThreshold_LTInv_32f_I(pSrcDst:PIpp32f; len:integer; level:Ipp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_LTInv_32fc_I(pSrcDst:PIpp32fc; len:integer; level:Ipp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_LTInv_64f_I(pSrcDst:PIpp64f; len:integer; level:Ipp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_LTInv_64fc_I(pSrcDst:PIpp64fc; len:integer; level:Ipp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsThreshold_LTInv_32f(pSrc:PIpp32f; pDst:PIpp32f; len:integer; level:Ipp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_LTInv_32fc(pSrc:PIpp32fc; pDst:PIpp32fc; len:integer; level:Ipp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_LTInv_64f(pSrc:PIpp64f; pDst:PIpp64f; len:integer; level:Ipp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_LTInv_64fc(pSrc:PIpp64fc; pDst:PIpp64fc; len:integer; level:Ipp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ ///////////////////////////////////////////////////////////////////////////// }


function ippsThreshold_LTValGTVal_32f_I(pSrcDst:PIpp32f; len:integer; levelLT:Ipp32f; valueLT:Ipp32f; levelGT:Ipp32f; valueGT:Ipp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_LTValGTVal_64f_I(pSrcDst:PIpp64f; len:integer; levelLT:Ipp64f; valueLT:Ipp64f; levelGT:Ipp64f; valueGT:Ipp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_LTValGTVal_32f(pSrc:PIpp32f; pDst:PIpp32f; len:integer; levelLT:Ipp32f; valueLT:Ipp32f; levelGT:Ipp32f; valueGT:Ipp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_LTValGTVal_64f(pSrc:PIpp64f; pDst:PIpp64f; len:integer; levelLT:Ipp64f; valueLT:Ipp64f; levelGT:Ipp64f; valueGT:Ipp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsThreshold_LTValGTVal_16s_I(pSrcDst:PIpp16s; len:integer; levelLT:Ipp16s; valueLT:Ipp16s; levelGT:Ipp16s; valueGT:Ipp16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsThreshold_LTValGTVal_16s(pSrc:PIpp16s; pDst:PIpp16s; len:integer; levelLT:Ipp16s; valueLT:Ipp16s; levelGT:Ipp16s; valueGT:Ipp16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};



function ippsThreshold_GT_32s_I(pSrcDst:PIpp32s; len:integer; level:Ipp32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsThreshold_GT_32s(pSrc:PIpp32s; pDst:PIpp32s; len:integer; level:Ipp32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsThreshold_LTValGTVal_32s_I(pSrcDst:PIpp32s; len:integer; levelLT:Ipp32s; valueLT:Ipp32s; levelGT:Ipp32s; valueGT:Ipp32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsThreshold_LTValGTVal_32s(pSrc:PIpp32s; pDst:PIpp32s; len:integer; levelLT:Ipp32s; valueLT:Ipp32s; levelGT:Ipp32s; valueGT:Ipp32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};





{ /////////////////////////////////////////////////////////////////////////////
//  Names:      ippsCartToPolar
//
//  Purpose:    Convert cartesian coordinate to polar. Input data are formed as
//              a complex vector.
//
//  Parameters:
//   pSrc          an input complex vector
//   pDstMagn      an output vector to store the magnitude components
//   pDstPhase     an output vector to store the phase components (in radians)
//   len           a length of the array
//  Return:
//   ippStsNoErr           Ok
//   ippStsNullPtrErr      Some of pointers to input or output data are NULL
//   ippStsSizeErr         The length of the arrays is less or equal zero
//
}

function ippsCartToPolar_32fc(pSrc:PIpp32fc; pDstMagn:PIpp32f; pDstPhase:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsCartToPolar_64fc(pSrc:PIpp64fc; pDstMagn:PIpp64f; pDstPhase:PIpp64f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//  Names:      ippsCartToPolar
//
//  Purpose:    Convert cartesian coordinate to polar. Input data are formed as
//              two real vectors.
//
//  Parameters:
//   pSrcRe       an input vector containing the coordinates X
//   pSrcIm       an input vector containing the coordinates Y
//   pDstMagn     an output vector to store the magnitude components
//   pDstPhase    an output vector to store the phase components (in radians)
//   len          a length of the array
//  Return:
//   ippStsNoErr           Ok
//   ippStsNullPtrErr      Some of pointers to input or output data are NULL
//   ippStsSizeErr         The length of the arrays is less or equal zero
//
}

function ippsCartToPolar_32f(pSrcRe:PIpp32f; pSrcIm:PIpp32f; pDstMagn:PIpp32f; pDstPhase:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsCartToPolar_64f(pSrcRe:PIpp64f; pSrcIm:PIpp64f; pDstMagn:PIpp64f; pDstPhase:PIpp64f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//  Names:      ippsPolarToCart
//
//  Purpose:    Convert polar coordinate to cartesian. Output data are formed as
//              a complex vector.
//
//  Parameters:
//   pDstMagn      an input vector containing the magnitude components
//   pDstPhase     an input vector containing the phase components(in radians)
//   pDst          an output complex vector to store the cartesian coordinates
//   len           a length of the arrays
//  Return:
//   ippStsNoErr           Ok
//   ippStsNullPtrErr      Some of pointers to input or output data are NULL
//   ippStsSizeErr         The length of the arrays is less or equal zero
//
}

function ippsPolarToCart_32fc(pSrcMagn:PIpp32f; pSrcPhase:PIpp32f; pDst:PIpp32fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsPolarToCart_64fc(pSrcMagn:PIpp64f; pSrcPhase:PIpp64f; pDst:PIpp64fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsPolarToCart_32sc(pSrcMagn:PIpp32s; pSrcPhase:PIpp32s; phaseFixedPoint:integer; pDst:PIpp32sc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsPolarToCart_16sc(pSrcMagn:PIpp16s; pSrcPhase:PIpp16s; phaseFixedPoint:integer; pDst:PIpp16sc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ /////////////////////////////////////////////////////////////////////////////
//  Names:      ippsPolarToCart
//
//  Purpose:    Convert polar coordinate to cartesian. Output data are formed as
//              two real vectors.
//
//  Parameters:
//   pDstMagn     an input vector containing the magnitude components
//   pDstPhase    an input vector containing the phase components(in radians)
//   pSrcRe       an output complex vector to store the coordinates X
//   pSrcIm       an output complex vector to store the coordinates Y
//   len          a length of the arrays
//  Return:
//   ippStsNoErr           Ok
//   ippStsNullPtrErr      Some of pointers to input or output data are NULL
//   ippStsSizeErr         The length of the arrays is less or equal zero
//
}

function ippsPolarToCart_32f(pSrcMagn:PIpp32f; pSrcPhase:PIpp32f; pDstRe:PIpp32f; pDstIm:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsPolarToCart_64f(pSrcMagn:PIpp64f; pSrcPhase:PIpp64f; pDstRe:PIpp64f; pDstIm:PIpp64f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ /////////////////////////////////////////////////////////////////////////////
//  Names:      ippsCartToPolar
//
//  Purpose:    Convert cartesian coordinate to polar. Input data are formed as
//              a complex vector.
//
//  Parameters:
//   pSrc              an input complex vector
//   pDstMagn          an output vector to store the magnitude components
//   pDstPhase         an output vector to store the phase components (in radians)
//   len               a length of the array
//   magnScaleFactor   scale factor of the magnitude companents
//   phaseScaleFactor  scale factor of the phase companents
//  Return:
//   ippStsNoErr           Ok
//   ippStsNullPtrErr      Some of pointers to input or output data are NULL
//   ippStsSizeErr         The length of the arrays is less or equal zero
//
}
function ippsCartToPolar_16sc_Sfs(pSrc:PIpp16sc; pDstMagn:PIpp16s; pDstPhase:PIpp16s; len:integer; magnScaleFactor:integer; phaseScaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ /////////////////////////////////////////////////////////////////////////////
//  Names:      ippsPolarToCart
//
//  Purpose:    Convert polar coordinate to cartesian. Output data are formed as
//              a complex vector.
//
//  Parameters:
//   pDstMagn          an input vector containing the magnitude components
//   pDstPhase         an input vector containing the phase components(in radians)
//   pDst              an output complex vector to store the cartesian coordinates
//   len               a length of the arrays
//   magnScaleFactor   scale factor of the magnitude companents
//   phaseScaleFactor  scale factor of the phase companents
//  Return:
//   ippStsNoErr           Ok
//   ippStsNullPtrErr      Some of pointers to input or output data are NULL
//   ippStsSizeErr         The length of the arrays is less or equal zero
//
}
function ippsPolarToCart_16sc_Sfs(pSrcMagn:PIpp16s; pSrcPhase:PIpp16s; pDst:PIpp16sc; len:integer; magnScaleFactor:integer; phaseScaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ /////////////////////////////////////////////////////////////////////////////
//                          Companding functions
///////////////////////////////////////////////////////////////////////////// }
{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippsALawToLin
//  Purpose:    convert from A-Law to linear PCM value
//  Parameters:
//    pSrc        pointer to the input vector containing A-Law values
//    pDst        pointer to the output vector for store linear PCM values
//    len         length of the vectors, number of items
//  Return:
//    ippStsNullPtrErr        pointer(s) to the data is NULL
//    ippStsSizeErr           length of the vectors is less or equal zero
//    ippStsNoErr             otherwise
}
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsALawToLin_8u32f(pSrc:PIpp8u; pDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsALawToLin_8u16s(pSrc:PIpp8u; pDst:PIpp16s; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippsMuLawToLin
//  Purpose:    convert from Mu-Law to linear PCM value
//  Parameters:
//    pSrc        pointer to the input vector containing Mu-Law values
//    pDst        pointer to the output vector for store linear PCM values
//    len         length of the vectors, number of items
//  Return:
//    ippStsNullPtrErr        pointer(s) to the data is NULL
//    ippStsSizeErr           length of the vectors is less or equal zero
//    ippStsNoErr             otherwise
}
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsMuLawToLin_8u32f(pSrc:PIpp8u; pDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsMuLawToLin_8u16s(pSrc:PIpp8u; pDst:PIpp16s; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippsLinToALaw
//  Purpose:    convert from linear PCM to A-Law value
//  Parameters:
//    pSrc        pointer to the input vector containing linear PCM values
//    pDst        pointer to the output vector for store A-Law values
//    len         length of the vectors, number of items
//  Return:
//    ippStsNullPtrErr        pointer(s) to the data is NULL
//    ippStsSizeErr           length of the vectors is less or equal zero
//    ippStsNoErr             otherwise
}
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsLinToALaw_32f8u(pSrc:PIpp32f; pDst:PIpp8u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsLinToALaw_16s8u(pSrc:PIpp16s; pDst:PIpp8u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippsMuLawToLin
//  Purpose:    convert from linear PCM to Mu-Law value
//  Parameters:
//    pSrc        pointer to the input vector containing linear PCM values
//    pDst        pointer to the output vector for store Mu-Law values
//    len         length of the vectors, number of items
//  Return:
//    ippStsNullPtrErr        pointer(s) to the data is NULL
//    ippStsSizeErr           length of the vectors is less or equal zero
//    ippStsNoErr             otherwise
}
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsLinToMuLaw_32f8u(pSrc:PIpp32f; pDst:PIpp8u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsLinToMuLaw_16s8u(pSrc:PIpp16s; pDst:PIpp8u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippsALawToMuLaw, ippsMuLawToALaw
//  Purpose:    convert from A-Law to Mu-Law and vice-versa
//  Parameters:
//    pSrc        pointer to the input vector containing A-Law or Mu-Law values
//    pDst        pointer to the output vector for store Mu-Law or A-Law values
//    len         length of the vectors, number of items
//  Return:
//    ippStsNullPtrErr        pointer(s) to the data is NULL
//    ippStsSizeErr           length of the vectors is less or equal zero
//    ippStsNoErr             otherwise
}
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsALawToMuLaw_8u(pSrc:PIpp8u; pDst:PIpp8u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsMuLawToALaw_8u(pSrc:PIpp8u; pDst:PIpp8u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//  Names:
//    ippsPreemphasize_32f
//  Purpose:
//    Compute the preemphasizes a single precision real signal.
//  Parameters:
//    pSrcDst  pointer to the vector for in-place operation.
//    len      length of  the input vector.
//    val      The multiplier to be used in the preemphasis difference equation
//             y(n) = x(n) - a * x(n-1)  where y  is the preemphasized  output
//             and x is the input. Usually a value  of 0.95  is  used for speech
//             audio  signals.
//  Return:
//    ippStsNoErr         Ok
//    ippStsNullPtrErr    Some of pointers to input or output data are NULL
//    ippStsSizeErr       The length of the arrays is less or equal zero
}
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsPreemphasize_32f(pSrcDst:PIpp32f; len:integer; val:Ipp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsPreemphasize_16s(pSrcDst:PIpp16s; len:integer; val:Ipp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};



{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippsFlip
//  Purpose:    dst[i] = src[len-i-1], i=0..len-1
//  Parameters:
//    pSrc      pointer to the input vector
//    pDst      pointer to the output vector
//    len       length of the vectors, number of items
//  Return:
//    ippStsNullPtrErr        pointer(s) to the data is NULL
//    ippStsSizeErr           length of the vectors is less or equal zero
//    ippStsNoErr             otherwise
}

function ippsFlip_8u(pSrc:PIpp8u; pDst:PIpp8u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFlip_8u_I(pSrcDst:PIpp8u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFlip_16u(pSrc:PIpp16u; pDst:PIpp16u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFlip_16u_I(pSrcDst:PIpp16u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFlip_32f(pSrc:PIpp32f; pDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFlip_32f_I(pSrcDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFlip_64f(pSrc:PIpp64f; pDst:PIpp64f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFlip_64f_I(pSrcDst:PIpp64f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFlip_32fc(pSrc:PIpp32fc; pDst:PIpp32fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFlip_32fc_I(pSrcDst:PIpp32fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFlip_64fc(pSrc:PIpp64fc; pDst:PIpp64fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFlip_64fc_I(pSrcDst:PIpp64fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ ////////////////////////////////////////////////////////////////////////////
//  Names:      ippsUpdateLinear_16s32s_I
//  Purpose:    Calc Update Linear value
//  Return:
//   IPP_NO_ERR                 Ok
//   IPP_NULL_PTR_ERR           Pointer to pSrc or pointer to pSrcDst is NULL
//   IPP_BADSIZE_ERR            The length of the array is less or equal zero
//  Parameters:
//   pSrc           pointer to vector
//   len            a length of the array
//   pSrcDst        pointer to input and output
//   srcShiftRight  shiftright of src (0<=srcShiftRight<=15)
//   alpha          weight
//   hint           code specific use hints
//
}
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsUpdateLinear_16s32s_I(pSrc:PIpp16s; len:integer; pSrcDst:PIpp32s; srcShiftRight:integer; alpha:Ipp16s; hint:IppHintAlgorithm):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ ////////////////////////////////////////////////////////////////////////////
//  Names:      ippsUpdatePower_16s32s_I
//  Purpose:    Calc Update Power value
//  Return:
//   IPP_NO_ERR                 Ok
//   IPP_NULL_PTR_ERR           Pointer to pSrc or pointer to pSrcDst is NULL
//   IPP_BADSIZE_ERR            The length of the array is less or equal zero
//  Parameters:
//   pSrc           pointer to vector
//   len            a length of the array
//   pSrcDst        pointer to input and output
//   srcShiftRight  shiftright of src (0<=srcShiftRight<=31)
//   alpha          weight
//   hint           code specific use hints
//
}
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsUpdatePower_16s32s_I(pSrc:PIpp16s; len:integer; pSrcDst:PIpp32s; srcShiftRight:integer; alpha:Ipp16s; hint:IppHintAlgorithm):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippsJoinScaled_32f16s_D2L
//              ippsJoinScaled_32f24s_D2L
//
//  Purpose:    Join of vectors.
//  Parameters:
//      pSrc        pointer to pointers to the input vectors
//      pDst        pointer to the output vector
//      nChannels   number of channels
//      chanlen     length of the channel
//  Return:
//      ippStsNullPtrErr        pointer(s) to the data is NULL
//      ippStsSizeErr           nChannels or chanlen are less or equal zero
//      ippStsNoErr             otherwise
//
//      Note: Default region of the src data is [-1.0,1.0].
}

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsJoinScaled_32f16s_D2L(pSrc:PPIpp32f; nChannels:integer; chanLen:integer; pDst:PIpp16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsJoinScaled_32f24s_D2L(pSrc:PPIpp32f; nChannels:integer; chanLen:integer; pDst:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippsSplitScaled_16s32f_D2L
//              ippsSplitScaled_24s32f_D2L
//
//  Purpose:    Split of vector.
//  Parameters:
//      pSrc        pointer to the input vector
//      pDst        pointer to pointers to the output vectors
//      nChannels   number of channels
//      chanlen     length of the channel
//  Return:
//      ippStsNullPtrErr        pointer(s) to the data is NULL
//      ippStsSizeErr           nChannels or chanlen are less or equal zero
//      ippStsNoErr             otherwise
//
//      Note: Region of the dst data is [-1.0,1.0].
}

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsSplitScaled_16s32f_D2L(pSrc:PIpp16s; pDst:PPIpp32f; nChannels:integer; chanLen:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsSplitScaled_24s32f_D2L(pSrc:PIpp8u; pDst:PPIpp32f; nChannels:integer; chanLen:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippsSwapBytes
//  Purpose:    switches from a "big endian" order to the "little endian" order and vice-versa
//  Parameters:
//    pSrc                 pointer to the source vector
//    pSrcDst              pointer to the source/destination vector
//    pDst                 pointer to the destination vector
//    len                  length of the vectors
//  Return:
//    ippStsNullPtrErr     pointer to the vector is NULL
//    ippStsSizeErr        length of the vectors is less or equal zero
//    ippStsNoErr          otherwise
}

function ippsSwapBytes_16u_I(pSrcDst:PIpp16u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSwapBytes_24u_I(pSrcDst:PIpp8u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSwapBytes_32u_I(pSrcDst:PIpp32u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSwapBytes_64u_I(pSrcDst:PIpp64u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsSwapBytes_16u(pSrc:PIpp16u; pDst:PIpp16u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSwapBytes_24u(pSrc:PIpp8u; pDst:PIpp8u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSwapBytes_32u(pSrc:PIpp32u; pDst:PIpp32u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSwapBytes_64u(pSrc:PIpp64u; pDst:PIpp64u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//                  Arithmetic functions
///////////////////////////////////////////////////////////////////////////// }
{ ////////////////////////////////////////////////////////////////////////////
//  Names:       ippsAdd, ippsSub, ippsMul
//
//  Purpose:    add, subtract and multiply operations upon every element of
//              the source vector
//  Arguments:
//    pSrc                 pointer to the source vector
//    pSrcDst              pointer to the source/destination vector
//    pSrc1                pointer to the first source vector
//    pSrc2                pointer to the second source vector
//    pDst                 pointer to the destination vector
//    len                  length of the vectors
//    scaleFactor          scale factor value
//  Return:
//    ippStsNullPtrErr     pointer(s) to the data is NULL
//    ippStsSizeErr        length of the vectors is less or equal zero
//    ippStsNoErr          otherwise
//  Note:
//    AddC(X,v,Y)    :  Y[n] = X[n] + v
//    MulC(X,v,Y)    :  Y[n] = X[n] * v
//    SubC(X,v,Y)    :  Y[n] = X[n] - v
//    SubCRev(X,v,Y) :  Y[n] = v - X[n]
//    Sub(X,Y)       :  Y[n] = Y[n] - X[n]
//    Sub(X,Y,Z)     :  Z[n] = Y[n] - X[n]
}


function ippsAddC_16s_I(val:Ipp16s; pSrcDst:PIpp16s; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSubC_16s_I(val:Ipp16s; pSrcDst:PIpp16s; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMulC_16s_I(val:Ipp16s; pSrcDst:PIpp16s; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsAddC_32f_I(val:Ipp32f; pSrcDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsAddC_32fc_I(val:Ipp32fc; pSrcDst:PIpp32fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSubC_32f_I(val:Ipp32f; pSrcDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSubC_32fc_I(val:Ipp32fc; pSrcDst:PIpp32fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSubCRev_32f_I(val:Ipp32f; pSrcDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSubCRev_32fc_I(val:Ipp32fc; pSrcDst:PIpp32fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMulC_32f_I(val:Ipp32f; pSrcDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMulC_32fc_I(val:Ipp32fc; pSrcDst:PIpp32fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsAddC_64f_I(val:Ipp64f; pSrcDst:PIpp64f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsAddC_64fc_I(val:Ipp64fc; pSrcDst:PIpp64fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSubC_64f_I(val:Ipp64f; pSrcDst:PIpp64f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSubC_64fc_I(val:Ipp64fc; pSrcDst:PIpp64fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSubCRev_64f_I(val:Ipp64f; pSrcDst:PIpp64f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSubCRev_64fc_I(val:Ipp64fc; pSrcDst:PIpp64fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMulC_64f_I(val:Ipp64f; pSrcDst:PIpp64f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMulC_64fc_I(val:Ipp64fc; pSrcDst:PIpp64fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMulC_32f16s_Sfs(pSrc:PIpp32f; val:Ipp32f; pDst:PIpp16s; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMulC_Low_32f16s(pSrc:PIpp32f; val:Ipp32f; pDst:PIpp16s; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsAddC_8u_ISfs(val:Ipp8u; pSrcDst:PIpp8u; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSubC_8u_ISfs(val:Ipp8u; pSrcDst:PIpp8u; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSubCRev_8u_ISfs(val:Ipp8u; pSrcDst:PIpp8u; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMulC_8u_ISfs(val:Ipp8u; pSrcDst:PIpp8u; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsAddC_16s_ISfs(val:Ipp16s; pSrcDst:PIpp16s; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSubC_16s_ISfs(val:Ipp16s; pSrcDst:PIpp16s; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMulC_16s_ISfs(val:Ipp16s; pSrcDst:PIpp16s; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsAddC_16sc_ISfs(val:Ipp16sc; pSrcDst:PIpp16sc; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSubC_16sc_ISfs(val:Ipp16sc; pSrcDst:PIpp16sc; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMulC_16sc_ISfs(val:Ipp16sc; pSrcDst:PIpp16sc; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSubCRev_16s_ISfs(val:Ipp16s; pSrcDst:PIpp16s; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSubCRev_16sc_ISfs(val:Ipp16sc; pSrcDst:PIpp16sc; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsAddC_32s_ISfs(val:Ipp32s; pSrcDst:PIpp32s; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsAddC_32sc_ISfs(val:Ipp32sc; pSrcDst:PIpp32sc; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSubC_32s_ISfs(val:Ipp32s; pSrcDst:PIpp32s; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSubC_32sc_ISfs(val:Ipp32sc; pSrcDst:PIpp32sc; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSubCRev_32s_ISfs(val:Ipp32s; pSrcDst:PIpp32s; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSubCRev_32sc_ISfs(val:Ipp32sc; pSrcDst:PIpp32sc; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMulC_32s_ISfs(val:Ipp32s; pSrcDst:PIpp32s; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMulC_32sc_ISfs(val:Ipp32sc; pSrcDst:PIpp32sc; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsAddC_32f(pSrc:PIpp32f; val:Ipp32f; pDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsAddC_32fc(pSrc:PIpp32fc; val:Ipp32fc; pDst:PIpp32fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSubC_32f(pSrc:PIpp32f; val:Ipp32f; pDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSubC_32fc(pSrc:PIpp32fc; val:Ipp32fc; pDst:PIpp32fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSubCRev_32f(pSrc:PIpp32f; val:Ipp32f; pDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSubCRev_32fc(pSrc:PIpp32fc; val:Ipp32fc; pDst:PIpp32fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMulC_32f(pSrc:PIpp32f; val:Ipp32f; pDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMulC_32fc(pSrc:PIpp32fc; val:Ipp32fc; pDst:PIpp32fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsAddC_64f(pSrc:PIpp64f; val:Ipp64f; pDst:PIpp64f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsAddC_64fc(pSrc:PIpp64fc; val:Ipp64fc; pDst:PIpp64fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSubC_64f(pSrc:PIpp64f; val:Ipp64f; pDst:PIpp64f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSubC_64fc(pSrc:PIpp64fc; val:Ipp64fc; pDst:PIpp64fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSubCRev_64f(pSrc:PIpp64f; val:Ipp64f; pDst:PIpp64f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSubCRev_64fc(pSrc:PIpp64fc; val:Ipp64fc; pDst:PIpp64fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMulC_64f(pSrc:PIpp64f; val:Ipp64f; pDst:PIpp64f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMulC_64fc(pSrc:PIpp64fc; val:Ipp64fc; pDst:PIpp64fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsAddC_8u_Sfs(pSrc:PIpp8u; val:Ipp8u; pDst:PIpp8u; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSubC_8u_Sfs(pSrc:PIpp8u; val:Ipp8u; pDst:PIpp8u; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSubCRev_8u_Sfs(pSrc:PIpp8u; val:Ipp8u; pDst:PIpp8u; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMulC_8u_Sfs(pSrc:PIpp8u; val:Ipp8u; pDst:PIpp8u; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsAddC_16s_Sfs(pSrc:PIpp16s; val:Ipp16s; pDst:PIpp16s; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsAddC_16sc_Sfs(pSrc:PIpp16sc; val:Ipp16sc; pDst:PIpp16sc; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSubC_16s_Sfs(pSrc:PIpp16s; val:Ipp16s; pDst:PIpp16s; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSubC_16sc_Sfs(pSrc:PIpp16sc; val:Ipp16sc; pDst:PIpp16sc; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSubCRev_16s_Sfs(pSrc:PIpp16s; val:Ipp16s; pDst:PIpp16s; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSubCRev_16sc_Sfs(pSrc:PIpp16sc; val:Ipp16sc; pDst:PIpp16sc; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMulC_16s_Sfs(pSrc:PIpp16s; val:Ipp16s; pDst:PIpp16s; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMulC_16sc_Sfs(pSrc:PIpp16sc; val:Ipp16sc; pDst:PIpp16sc; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsAddC_32s_Sfs(pSrc:PIpp32s; val:Ipp32s; pDst:PIpp32s; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsAddC_32sc_Sfs(pSrc:PIpp32sc; val:Ipp32sc; pDst:PIpp32sc; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSubC_32s_Sfs(pSrc:PIpp32s; val:Ipp32s; pDst:PIpp32s; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSubC_32sc_Sfs(pSrc:PIpp32sc; val:Ipp32sc; pDst:PIpp32sc; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSubCRev_32s_Sfs(pSrc:PIpp32s; val:Ipp32s; pDst:PIpp32s; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSubCRev_32sc_Sfs(pSrc:PIpp32sc; val:Ipp32sc; pDst:PIpp32sc; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMulC_32s_Sfs(pSrc:PIpp32s; val:Ipp32s; pDst:PIpp32s; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMulC_32sc_Sfs(pSrc:PIpp32sc; val:Ipp32sc; pDst:PIpp32sc; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsAdd_16s_I(pSrc:PIpp16s; pSrcDst:PIpp16s; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSub_16s_I(pSrc:PIpp16s; pSrcDst:PIpp16s; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMul_16s_I(pSrc:PIpp16s; pSrcDst:PIpp16s; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsAdd_32f_I(pSrc:PIpp32f; pSrcDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsAdd_32fc_I(pSrc:PIpp32fc; pSrcDst:PIpp32fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSub_32f_I(pSrc:PIpp32f; pSrcDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSub_32fc_I(pSrc:PIpp32fc; pSrcDst:PIpp32fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMul_32f_I(pSrc:PIpp32f; pSrcDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMul_32fc_I(pSrc:PIpp32fc; pSrcDst:PIpp32fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsAdd_64f_I(pSrc:PIpp64f; pSrcDst:PIpp64f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsAdd_64fc_I(pSrc:PIpp64fc; pSrcDst:PIpp64fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSub_64f_I(pSrc:PIpp64f; pSrcDst:PIpp64f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSub_64fc_I(pSrc:PIpp64fc; pSrcDst:PIpp64fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMul_64f_I(pSrc:PIpp64f; pSrcDst:PIpp64f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMul_64fc_I(pSrc:PIpp64fc; pSrcDst:PIpp64fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsAddC_64u_Sfs(pSrc:PIpp64u; val:Ipp64u; pDst:PIpp64u; len:Ipp32u; scaleFactor:integer; rndMode:IppRoundMode):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsAddC_64s_Sfs(pSrc:PIpp64s; val:Ipp64s; pDst:PIpp64s; len:Ipp32u; scaleFactor:integer; rndMode:IppRoundMode):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsAdd_8u_ISfs(pSrc:PIpp8u; pSrcDst:PIpp8u; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSub_8u_ISfs(pSrc:PIpp8u; pSrcDst:PIpp8u; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMul_8u_ISfs(pSrc:PIpp8u; pSrcDst:PIpp8u; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsAdd_16s_ISfs(pSrc:PIpp16s; pSrcDst:PIpp16s; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsAdd_16sc_ISfs(pSrc:PIpp16sc; pSrcDst:PIpp16sc; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSub_16s_ISfs(pSrc:PIpp16s; pSrcDst:PIpp16s; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSub_16sc_ISfs(pSrc:PIpp16sc; pSrcDst:PIpp16sc; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMul_16s_ISfs(pSrc:PIpp16s; pSrcDst:PIpp16s; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMul_16sc_ISfs(pSrc:PIpp16sc; pSrcDst:PIpp16sc; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsAdd_32s_ISfs(pSrc:PIpp32s; pSrcDst:PIpp32s; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsAdd_32sc_ISfs(pSrc:PIpp32sc; pSrcDst:PIpp32sc; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSub_32s_ISfs(pSrc:PIpp32s; pSrcDst:PIpp32s; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSub_32sc_ISfs(pSrc:PIpp32sc; pSrcDst:PIpp32sc; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMul_32s_ISfs(pSrc:PIpp32s; pSrcDst:PIpp32s; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMul_32sc_ISfs(pSrc:PIpp32sc; pSrcDst:PIpp32sc; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsAdd_8u16u(pSrc1:PIpp8u; pSrc2:PIpp8u; pDst:PIpp16u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMul_8u16u(pSrc1:PIpp8u; pSrc2:PIpp8u; pDst:PIpp16u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsAdd_16s(pSrc1:PIpp16s; pSrc2:PIpp16s; pDst:PIpp16s; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSub_16s(pSrc1:PIpp16s; pSrc2:PIpp16s; pDst:PIpp16s; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMul_16s(pSrc1:PIpp16s; pSrc2:PIpp16s; pDst:PIpp16s; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsAdd_16u(pSrc1:PIpp16u; pSrc2:PIpp16u; pDst:PIpp16u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsAdd_32u(pSrc1:PIpp32u; pSrc2:PIpp32u; pDst:PIpp32u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsAdd_16s32f(pSrc1:PIpp16s; pSrc2:PIpp16s; pDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSub_16s32f(pSrc1:PIpp16s; pSrc2:PIpp16s; pDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMul_16s32f(pSrc1:PIpp16s; pSrc2:PIpp16s; pDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsAdd_32f(pSrc1:PIpp32f; pSrc2:PIpp32f; pDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsAdd_32fc(pSrc1:PIpp32fc; pSrc2:PIpp32fc; pDst:PIpp32fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSub_32f(pSrc1:PIpp32f; pSrc2:PIpp32f; pDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSub_32fc(pSrc1:PIpp32fc; pSrc2:PIpp32fc; pDst:PIpp32fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMul_32f(pSrc1:PIpp32f; pSrc2:PIpp32f; pDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMul_32fc(pSrc1:PIpp32fc; pSrc2:PIpp32fc; pDst:PIpp32fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsAdd_64f(pSrc1:PIpp64f; pSrc2:PIpp64f; pDst:PIpp64f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsAdd_64fc(pSrc1:PIpp64fc; pSrc2:PIpp64fc; pDst:PIpp64fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSub_64f(pSrc1:PIpp64f; pSrc2:PIpp64f; pDst:PIpp64f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSub_64fc(pSrc1:PIpp64fc; pSrc2:PIpp64fc; pDst:PIpp64fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMul_64f(pSrc1:PIpp64f; pSrc2:PIpp64f; pDst:PIpp64f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMul_64fc(pSrc1:PIpp64fc; pSrc2:PIpp64fc; pDst:PIpp64fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsAdd_8u_Sfs(pSrc1:PIpp8u; pSrc2:PIpp8u; pDst:PIpp8u; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSub_8u_Sfs(pSrc1:PIpp8u; pSrc2:PIpp8u; pDst:PIpp8u; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMul_8u_Sfs(pSrc1:PIpp8u; pSrc2:PIpp8u; pDst:PIpp8u; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsAdd_16s_Sfs(pSrc1:PIpp16s; pSrc2:PIpp16s; pDst:PIpp16s; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsAdd_16sc_Sfs(pSrc1:PIpp16sc; pSrc2:PIpp16sc; pDst:PIpp16sc; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSub_16s_Sfs(pSrc1:PIpp16s; pSrc2:PIpp16s; pDst:PIpp16s; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSub_16sc_Sfs(pSrc1:PIpp16sc; pSrc2:PIpp16sc; pDst:PIpp16sc; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMul_16s_Sfs(pSrc1:PIpp16s; pSrc2:PIpp16s; pDst:PIpp16s; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMul_16sc_Sfs(pSrc1:PIpp16sc; pSrc2:PIpp16sc; pDst:PIpp16sc; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMul_16s32s_Sfs(pSrc1:PIpp16s; pSrc2:PIpp16s; pDst:PIpp32s; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsAdd_32s_Sfs(pSrc1:PIpp32s; pSrc2:PIpp32s; pDst:PIpp32s; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsAdd_64s_Sfs(pSrc1:PIpp64s; pSrc2:PIpp64s; pDst:PIpp64s; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsAdd_32sc_Sfs(pSrc1:PIpp32sc; pSrc2:PIpp32sc; pDst:PIpp32sc; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSub_32s_Sfs(pSrc1:PIpp32s; pSrc2:PIpp32s; pDst:PIpp32s; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSub_32sc_Sfs(pSrc1:PIpp32sc; pSrc2:PIpp32sc; pDst:PIpp32sc; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMul_32s_Sfs(pSrc1:PIpp32s; pSrc2:PIpp32s; pDst:PIpp32s; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMul_32sc_Sfs(pSrc1:PIpp32sc; pSrc2:PIpp32sc; pDst:PIpp32sc; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMul_16u16s_Sfs(pSrc1:PIpp16u; pSrc2:PIpp16s; pDst:PIpp16s; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsMul_32s32sc_ISfs(pSrc:PIpp32s; pSrcDst:PIpp32sc; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsMul_32s32sc_Sfs(pSrc1:PIpp32s; pSrc2:PIpp32sc; pDst:PIpp32sc; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsMul_Low_32s_Sfs(pSrc1:PIpp32s; pSrc2:PIpp32s; pDst:PIpp32s; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMul_32f32fc_I(pSrc:PIpp32f; pSrcDst:PIpp32fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMul_32f32fc(pSrc1:PIpp32f; pSrc2:PIpp32fc; pDst:PIpp32fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsAdd_16s32s_I(pSrc:PIpp16s; pSrcDst:PIpp32s; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsAddC_16u_ISfs(val:Ipp16u; pSrcDst:PIpp16u; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsAddC_16u_Sfs(pSrc:PIpp16u; val:Ipp16u; pDst:PIpp16u; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsAdd_16u_ISfs(pSrc:PIpp16u; pSrcDst:PIpp16u; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsAdd_16u_Sfs(pSrc1:PIpp16u; pSrc2:PIpp16u; pDst:PIpp16u; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsSubC_16u_ISfs(val:Ipp16u; pSrcDst:PIpp16u; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSubC_16u_Sfs(pSrc:PIpp16u; val:Ipp16u; pDst:PIpp16u; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSubCRev_16u_ISfs(val:Ipp16u; pSrcDst:PIpp16u; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSubCRev_16u_Sfs(pSrc:PIpp16u; val:Ipp16u; pDst:PIpp16u; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSub_16u_ISfs(pSrc:PIpp16u; pSrcDst:PIpp16u; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSub_16u_Sfs(pSrc1:PIpp16u; pSrc2:PIpp16u; pDst:PIpp16u; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsMulC_16u_ISfs(val:Ipp16u; pSrcDst:PIpp16u; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMulC_16u_Sfs(pSrc:PIpp16u; val:Ipp16u; pDst:PIpp16u; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMul_16u_ISfs(pSrc:PIpp16u; pSrcDst:PIpp16u; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMul_16u_Sfs(pSrc1:PIpp16u; pSrc2:PIpp16u; pDst:PIpp16u; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsMulC_64s_ISfs(val:Ipp64s; pSrcDst:PIpp64s; len:Ipp32u; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsMulC_64f64s_ISfs(val:Ipp64f; pSrcDst:PIpp64s; len:Ipp32u; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippsAddProduct
//  Purpose:    multiplies elements of two source vectors and adds product to
//              the accumulator vector
//  Parameters:
//    pSrc1                pointer to the first source vector
//    pSrc2                pointer to the second source vector
//    pSrcDst              pointer to the source/destination (accumulator) vector
//    len                  length of the vectors
//    scaleFactor          scale factor value
//  Return:
//    ippStsNullPtrErr     pointer to the vector is NULL
//    ippStsSizeErr        length of the vectors is less or equal zero
//    ippStsNoErr          otherwise
//
//  Notes:                 pSrcDst[n] = pSrcDst[n] + pSrc1[n] * pSrc2[n], n=0,1,2,..len-1.
}

function ippsAddProduct_16s_Sfs(pSrc1:PIpp16s; pSrc2:PIpp16s; pSrcDst:PIpp16s; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsAddProduct_16s32s_Sfs(pSrc1:PIpp16s; pSrc2:PIpp16s; pSrcDst:PIpp32s; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsAddProduct_32s_Sfs(pSrc1:PIpp32s; pSrc2:PIpp32s; pSrcDst:PIpp32s; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsAddProduct_32f(pSrc1:PIpp32f; pSrc2:PIpp32f; pSrcDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsAddProduct_64f(pSrc1:PIpp64f; pSrc2:PIpp64f; pSrcDst:PIpp64f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsAddProduct_32fc(pSrc1:PIpp32fc; pSrc2:PIpp32fc; pSrcDst:PIpp32fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsAddProduct_64fc(pSrc1:PIpp64fc; pSrc2:PIpp64fc; pSrcDst:PIpp64fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ /////////////////////////////////////////////////////////////////////////////
//  Names:      ippsSqr
//  Purpose:    compute square value for every element of the source vector
//  Parameters:
//    pSrcDst          pointer to the source/destination vector
//    pSrc             pointer to the input vector
//    pDst             pointer to the output vector
//    len              length of the vectors
//   scaleFactor       scale factor value
//  Return:
//    ippStsNullPtrErr    pointer(s) the source data NULL
//    ippStsSizeErr       length of the vectors is less or equal zero
//    ippStsNoErr         otherwise
}
function ippsSqr_32f_I(pSrcDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSqr_32fc_I(pSrcDst:PIpp32fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSqr_64f_I(pSrcDst:PIpp64f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSqr_64fc_I(pSrcDst:PIpp64fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsSqr_32f(pSrc:PIpp32f; pDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSqr_32fc(pSrc:PIpp32fc; pDst:PIpp32fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSqr_64f(pSrc:PIpp64f; pDst:PIpp64f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSqr_64fc(pSrc:PIpp64fc; pDst:PIpp64fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsSqr_16s_ISfs(pSrcDst:PIpp16s; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSqr_16sc_ISfs(pSrcDst:PIpp16sc; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsSqr_16s_Sfs(pSrc:PIpp16s; pDst:PIpp16s; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSqr_16sc_Sfs(pSrc:PIpp16sc; pDst:PIpp16sc; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSqr_8u_ISfs(pSrcDst:PIpp8u; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSqr_8u_Sfs(pSrc:PIpp8u; pDst:PIpp8u; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSqr_16u_ISfs(pSrcDst:PIpp16u; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSqr_16u_Sfs(pSrc:PIpp16u; pDst:PIpp16u; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ ////////////////////////////////////////////////////////////////////////////
//  Name:       ippsDiv
//
//  Purpose:    divide every element of the source vector by the scalar value
//              or by corresponding element of the second source vector
//  Arguments:
//    val               the divisor value
//    pSrc              pointer to the divisor source vector
//    pSrc1             pointer to the divisor source vector
//    pSrc2             pointer to the dividend source vector
//    pDst              pointer to the destination vector
//    pSrcDst           pointer to the source/destination vector
//    len               vector's length, number of items
//    scaleFactor       scale factor parameter value
//  Return:
//    ippStsNullPtrErr     pointer(s) to the data vector is NULL
//    ippStsSizeErr        length of the vector is less or equal zero
//    ippStsDivByZeroErr   the scalar divisor value is zero
//    ippStsDivByZero      Warning status if an element of divisor vector is
//                      zero. If the dividend is zero than result is
//                      NaN, if the dividend is not zero than result
//                      is Infinity with correspondent sign. The
//                      execution is not aborted. For the integer operation
//                      zero instead of NaN and the corresponding bound
//                      values instead of Infinity
//    ippStsNoErr          otherwise
//  Note:
//    DivC(v,X,Y)  :    Y[n] = X[n] / v
//    DivC(v,X)    :    X[n] = X[n] / v
//    Div(X,Y)     :    Y[n] = Y[n] / X[n]
//    Div(X,Y,Z)   :    Z[n] = Y[n] / X[n]
}

function ippsDiv_32f(pSrc1:PIpp32f; pSrc2:PIpp32f; pDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsDiv_32fc(pSrc1:PIpp32fc; pSrc2:PIpp32fc; pDst:PIpp32fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsDiv_64f(pSrc1:PIpp64f; pSrc2:PIpp64f; pDst:PIpp64f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsDiv_64fc(pSrc1:PIpp64fc; pSrc2:PIpp64fc; pDst:PIpp64fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsDiv_16s_Sfs(pSrc1:PIpp16s; pSrc2:PIpp16s; pDst:PIpp16s; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsDiv_8u_Sfs(pSrc1:PIpp8u; pSrc2:PIpp8u; pDst:PIpp8u; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsDiv_16sc_Sfs(pSrc1:PIpp16sc; pSrc2:PIpp16sc; pDst:PIpp16sc; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsDivC_32f(pSrc:PIpp32f; val:Ipp32f; pDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsDivC_32fc(pSrc:PIpp32fc; val:Ipp32fc; pDst:PIpp32fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsDivC_64f(pSrc:PIpp64f; val:Ipp64f; pDst:PIpp64f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsDivC_64fc(pSrc:PIpp64fc; val:Ipp64fc; pDst:PIpp64fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsDivC_16s_Sfs(pSrc:PIpp16s; val:Ipp16s; pDst:PIpp16s; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsDivC_8u_Sfs(pSrc:PIpp8u; val:Ipp8u; pDst:PIpp8u; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsDivC_16sc_Sfs(pSrc:PIpp16sc; val:Ipp16sc; pDst:PIpp16sc; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsDiv_32f_I(pSrc:PIpp32f; pSrcDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsDiv_32fc_I(pSrc:PIpp32fc; pSrcDst:PIpp32fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsDiv_64f_I(pSrc:PIpp64f; pSrcDst:PIpp64f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsDiv_64fc_I(pSrc:PIpp64fc; pSrcDst:PIpp64fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsDiv_16s_ISfs(pSrc:PIpp16s; pSrcDst:PIpp16s; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsDiv_8u_ISfs(pSrc:PIpp8u; pSrcDst:PIpp8u; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsDiv_16sc_ISfs(pSrc:PIpp16sc; pSrcDst:PIpp16sc; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsDiv_32s_Sfs(pSrc1:PIpp32s; pSrc2:PIpp32s; pDst:PIpp32s; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsDiv_32s_ISfs(pSrc:PIpp32s; pSrcDst:PIpp32s; len:integer; ScaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsDiv_32s16s_Sfs(pSrc1:PIpp16s; pSrc2:PIpp32s; pDst:PIpp16s; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsDivC_32f_I(val:Ipp32f; pSrcDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsDivC_32fc_I(val:Ipp32fc; pSrcDst:PIpp32fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsDivC_64f_I(val:Ipp64f; pSrcDst:PIpp64f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsDivC_64fc_I(val:Ipp64fc; pSrcDst:PIpp64fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsDivC_16s_ISfs(val:Ipp16s; pSrcDst:PIpp16s; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsDivC_8u_ISfs(val:Ipp8u; pSrcDst:PIpp8u; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsDivC_16sc_ISfs(val:Ipp16sc; pSrcDst:PIpp16sc; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsDivCRev_16u(pSrc:PIpp16u; val:Ipp16u; pDst:PIpp16u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsDivCRev_32f(pSrc:PIpp32f; val:Ipp32f; pDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsDivCRev_16u_I(val:Ipp16u; pSrcDst:PIpp16u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsDivCRev_32f_I(val:Ipp32f; pSrcDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsDivC_16u_ISfs(val:Ipp16u; pSrcDst:PIpp16u; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsDivC_16u_Sfs(pSrc:PIpp16u; val:Ipp16u; pDst:PIpp16u; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsDiv_16u_ISfs(pSrc:PIpp16u; pSrcDst:PIpp16u; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsDiv_16u_Sfs(pSrc1:PIpp16u; pSrc2:PIpp16u; pDst:PIpp16u; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsDivC_64s_ISfs(val:Ipp64s; pSrcDst:PIpp64s; len:Ipp32u; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//  Names:      ippsSqrt
//  Purpose:    compute square root value for every element of the source vector
//   pSrc                 pointer to the source vector
//   pDst                 pointer to the destination vector
//   pSrcDst              pointer to the source/destination vector
//   len                  length of the vector(s), number of items
//   scaleFactor          scale factor value
//  Return:
//   ippStsNullPtrErr        pointer to vector is NULL
//   ippStsSizeErr           length of the vector is less or equal zero
//   ippStsSqrtNegArg        negative value in real sequence
//   ippStsNoErr             otherwise
}
function ippsSqrt_32f_I(pSrcDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSqrt_32fc_I(pSrcDst:PIpp32fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSqrt_64f_I(pSrcDst:PIpp64f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSqrt_64fc_I(pSrcDst:PIpp64fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsSqrt_32f(pSrc:PIpp32f; pDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSqrt_32fc(pSrc:PIpp32fc; pDst:PIpp32fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSqrt_64f(pSrc:PIpp64f; pDst:PIpp64f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSqrt_64fc(pSrc:PIpp64fc; pDst:PIpp64fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsSqrt_16s_ISfs(pSrcDst:PIpp16s; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSqrt_16sc_ISfs(pSrcDst:PIpp16sc; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsSqrt_16s_Sfs(pSrc:PIpp16s; pDst:PIpp16s; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSqrt_16sc_Sfs(pSrc:PIpp16sc; pDst:PIpp16sc; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsSqrt_64s_ISfs(pSrcDst:PIpp64s; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsSqrt_64s_Sfs(pSrc:PIpp64s; pDst:PIpp64s; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsSqrt_8u_ISfs(pSrcDst:PIpp8u; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSqrt_8u_Sfs(pSrc:PIpp8u; pDst:PIpp8u; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSqrt_16u_ISfs(pSrcDst:PIpp16u; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSqrt_16u_Sfs(pSrc:PIpp16u; pDst:PIpp16u; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSqrt_32s16s_Sfs(pSrc:PIpp32s; pDst:PIpp16s; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsSqrt_64s16s_Sfs(pSrc:PIpp64s; pDst:PIpp16s; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};



{ /////////////////////////////////////////////////////////////////////////////
//  Names:      ippsCubrt
//  Purpose:    Compute cube root of every elements of the source vector
//  Parameters:
//   pSrc                 pointer to the source vector
//   pDst                 pointer to the destination vector
//   len                  length of the vector(s)
//   ScaleFactor          scale factor value
//  Return:
//   ippStsNullPtrErr        pointer(s) to the data vector is NULL
//   ippStsSizeErr           length of the vector(s) is less or equal 0
//   ippStsNoErr             otherwise
}

function ippsCubrt_32s16s_Sfs(pSrc:PIpp32s; pDst:PIpp16s; Len:integer; sFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsCubrt_32f(pSrc:PIpp32f; pDst:PIpp32f; Len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//  Names:      ippsAbs
//  Purpose:    compute absolute value of each element of the source vector
//  Parameters:
//   pSrcDst            pointer to the source/destination vector
//   pSrc               pointer to the source vector
//   pDst               pointer to the destination vector
//   len                length of the vector(s), number of items
//  Return:
//   ippStsNullPtrErr      pointer(s) to data vector is NULL
//   ippStsSizeErr         length of a vector is less or equal 0
//   ippStsNoErr           otherwise
}
function ippsAbs_32f_I(pSrcDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsAbs_64f_I(pSrcDst:PIpp64f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsAbs_16s_I(pSrcDst:PIpp16s; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsAbs_32f(pSrc:PIpp32f; pDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsAbs_64f(pSrc:PIpp64f; pDst:PIpp64f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsAbs_16s(pSrc:PIpp16s; pDst:PIpp16s; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsAbs_32s_I(pSrcDst:PIpp32s; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsAbs_32s(pSrc:PIpp32s; pDst:PIpp32s; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};



{ /////////////////////////////////////////////////////////////////////////////
//  Names:      ippsMagnitude
//  Purpose:    compute magnitude of every complex element of the source
//  Parameters:
//   pSrcDst            pointer to the source/destination vector
//   pSrc               pointer to the source vector
//   pDst               pointer to the destination vector
//   len                length of the vector(s), number of items
//   scaleFactor        scale factor value
//  Return:
//   ippStsNullPtrErr      pointer(s) to data vector is NULL
//   ippStsSizeErr         length of a vector is less or equal 0
//   ippStsNoErr           otherwise
//  Notes:
//         dst = sqrt( src.re^2 + src.im^2 )
}
function ippsMagnitude_32fc(pSrc:PIpp32fc; pDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMagnitude_64fc(pSrc:PIpp64fc; pDst:PIpp64f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMagnitude_16sc32f(pSrc:PIpp16sc; pDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMagnitude_16sc_Sfs(pSrc:PIpp16sc; pDst:PIpp16s; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMagnitude_32f(pSrcRe:PIpp32f; pSrcIm:PIpp32f; pDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMagnitude_64f(pSrcRe:PIpp64f; pSrcIm:PIpp64f; pDst:PIpp64f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMagnitude_16s_Sfs(pSrcRe:PIpp16s; pSrcIm:PIpp16s; pDst:PIpp16s; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMagnitude_32sc_Sfs(pSrc:PIpp32sc; pDst:PIpp32s; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsMagnitude_16s32f(pSrcRe:PIpp16s; pSrcIm:PIpp16s; pDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use PowerSpectr functionality instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsMagSquared_32sc32s_Sfs(pSrc:PIpp32sc; pDst:PIpp32s; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use PowerSpectr functionality instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsMagSquared_32fc64f(pSrc:PIpp32fc; pDst:PIpp64f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ /////////////////////////////////////////////////////////////////////////////
//  Names:      ippsExp
//  Purpose:    compute exponent value for all elements of the source vector
//  Parameters:
//   pSrcDst            pointer to the source/destination vector
//   pSrc               pointer to the source vector
//   pDst               pointer to the destination vector
//   len                length of the vector(s)
//   scaleFactor        scale factor value
//  Return:
//   ippStsNullPtrErr      pointer(s) to the data vector is NULL
//   ippStsSizeErr         length of the vector(s) is less or equal 0
//   ippStsNoErr           otherwise
}
function ippsExp_32f_I(pSrcDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsExp_64f_I(pSrcDst:PIpp64f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsExp_16s_ISfs(pSrcDst:PIpp16s; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsExp_32s_ISfs(pSrcDst:PIpp32s; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsExp_64s_ISfs(pSrcDst:PIpp64s; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsExp_32f(pSrc:PIpp32f; pDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsExp_64f(pSrc:PIpp64f; pDst:PIpp64f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsExp_16s_Sfs(pSrc:PIpp16s; pDst:PIpp16s; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsExp_32s_Sfs(pSrc:PIpp32s; pDst:PIpp32s; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsExp_64s_Sfs(pSrc:PIpp64s; pDst:PIpp64s; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsExp_32f64f(pSrc:PIpp32f; pDst:PIpp64f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ /////////////////////////////////////////////////////////////////////////////
//  Names:      ippsLn
//  Purpose:    compute natural logarithm of every elements of the source vector
//  Parameters:
//   pSrcDst              pointer to the source/destination vector
//   pSrc                 pointer to the source vector
//   pDst                 pointer to the destination vector
//   len                  length of the vector(s)
//   ScaleFactor          scale factor value
//  Return:
//   ippStsNullPtrErr        pointer(s) to the data vector is NULL
//   ippStsSizeErr           length of the vector(s) is less or equal 0
//   ippStsLnZeroArg         zero value in the source vector
//   ippStsLnNegArg          negative value in the source vector
//   ippStsNoErr             otherwise
//  Notes:
//                Ln( x<0 ) = NaN
//                Ln( 0 ) = -Inf
}

function ippsLn_32f_I(pSrcDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsLn_64f_I(pSrcDst:PIpp64f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsLn_32f(pSrc:PIpp32f; pDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsLn_64f(pSrc:PIpp64f; pDst:PIpp64f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsLn_64f32f(pSrc:PIpp64f; pDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsLn_16s_ISfs(pSrcDst:PIpp16s; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsLn_16s_Sfs(pSrc:PIpp16s; pDst:PIpp16s; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsLn_32s16s_Sfs(pSrc:PIpp32s; pDst:PIpp16s; Len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsLn_32s_ISfs(pSrcDst:PIpp32s; Len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsLn_32s_Sfs(pSrc:PIpp32s; pDst:PIpp32s; Len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//  Names:      ipps10Log10_32s_ISfs
//              ipps10Log10_32s_Sfs
//
//  Purpose:    compute decimal logarithm multiplied by 10 of every elements
//              of the source vector (for integer only).
//
//  Parameters:
//   pSrcDst              pointer to the source/destination vector
//   pSrc                 pointer to the source vector
//   pDst                 pointer to the destination vector
//   len                  length of the vector(s)
//   ScaleFactor          scale factor value
//  Return:
//   ippStsNullPtrErr     pointer(s) to the data vector is NULL
//   ippStsSizeErr        length of the vector(s) is less or equal 0
//   ippStsLnZeroArg      zero value in the source vector
//   ippStsLnNegArg       negative value in the source vector
//   ippStsNoErr          otherwise
//
}
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ipps10Log10_32s_ISfs(pSrcDst:PIpp32s; Len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ipps10Log10_32s_Sfs(pSrc:PIpp32s; pDst:PIpp32s; Len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ /////////////////////////////////////////////////////////////////////////////
//  Names:      ippsSumLn
//  Purpose:    computes sum of natural logarithm every elements of the source vector
//  Parameters:
//   pSrc                 pointer to the source vector
//   pSum                 pointer to the result
//   len                  length of the vector
//  Return:
//   ippStsNullPtrErr     pointer(s) to the data vector is NULL
//   ippStsSizeErr        length of the vector(s) is less or equal 0
//   ippStsLnZeroArg      zero value in the source vector
//   ippStsLnNegArg       negative value in the source vector
//   ippStsNoErr          otherwise
}


function ippsSumLn_32f(pSrc:PIpp32f; len:integer; out pSum:Ipp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSumLn_64f(pSrc:PIpp64f; len:integer; out pSum:Ipp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSumLn_32f64f(pSrc:PIpp32f; len:integer; out pSum:Ipp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSumLn_16s32f(pSrc:PIpp16s; len:integer; out pSum:Ipp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ ////////////////////////////////////////////////////////////////////////////
//  Names:      ippsSortAscend, ippsSortDescend
//
//  Purpose:    Execute sorting of all elemens of the vector.
//              ippsSortAscend  is sorted in increasing order.
//              ippsSortDescend is sorted in decreasing order.
//  Arguments:
//    pSrcDst              pointer to the source/destination vector
//    len                  length of the vector
//  Return:
//    ippStsNullPtrErr     pointer to the data is NULL
//    ippStsSizeErr        length of the vector is less or equal zero
//    ippStsNoErr          otherwise
}

function ippsSortAscend_8u_I(pSrcDst:PIpp8u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSortAscend_16s_I(pSrcDst:PIpp16s; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSortAscend_16u_I(pSrcDst:PIpp16u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSortAscend_32s_I(pSrcDst:PIpp32s; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSortAscend_32f_I(pSrcDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSortAscend_64f_I(pSrcDst:PIpp64f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsSortDescend_8u_I(pSrcDst:PIpp8u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSortDescend_16s_I(pSrcDst:PIpp16s; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSortDescend_16u_I(pSrcDst:PIpp16u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSortDescend_32s_I(pSrcDst:PIpp32s; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSortDescend_32f_I(pSrcDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSortDescend_64f_I(pSrcDst:PIpp64f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsSortIndexAscend_8u_I(pSrcDst:PIpp8u; pDstIdx:PInteger; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSortIndexAscend_16s_I(pSrcDst:PIpp16s; pDstIdx:PInteger; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSortIndexAscend_16u_I(pSrcDst:PIpp16u; pDstIdx:PInteger; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSortIndexAscend_32s_I(pSrcDst:PIpp32s; pDstIdx:PInteger; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSortIndexAscend_32f_I(pSrcDst:PIpp32f; pDstIdx:PInteger; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSortIndexAscend_64f_I(pSrcDst:PIpp64f; pDstIdx:PInteger; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsSortIndexDescend_8u_I(pSrcDst:PIpp8u; pDstIdx:PInteger; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSortIndexDescend_16s_I(pSrcDst:PIpp16s; pDstIdx:PInteger; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSortIndexDescend_16u_I(pSrcDst:PIpp16u; pDstIdx:PInteger; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSortIndexDescend_32s_I(pSrcDst:PIpp32s; pDstIdx:PInteger; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSortIndexDescend_32f_I(pSrcDst:PIpp32f; pDstIdx:PInteger; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSortIndexDescend_64f_I(pSrcDst:PIpp64f; pDstIdx:PInteger; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////////////
//  Names:      ippsSortRadixAscend, ippsSortRadixDescend
//
//  Purpose:    Rearrange elements of input vector using radix sort algorithm.
//              ippsSortRadixAscend  - sorts input array in increasing order
//              ippsSortRadixDescend - sorts input array in decreasing order
//
//  Arguments:
//    pSrcDst              pointer to the source/destination vector
//    pTmp                 pointer to the temporary vector (same size as input one)
//    len                  length of the vectors
//  Return:
//    ippStsNullPtrErr     pointer to the data or temporary placeholders is NULL
//    ippStsSizeErr        length of the vectors is less or equal zero
//    ippStsNoErr          otherwise
}

function ippsSortRadixAscend_32f_I(pSrcDst:PIpp32f; pTmp:PIpp32f; len:Ipp32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSortRadixAscend_32s_I(pSrcDst:PIpp32s; pTmp:PIpp32s; len:Ipp32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSortRadixAscend_32u_I(pSrcDst:PIpp32u; pTmp:PIpp32u; len:Ipp32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSortRadixAscend_16s_I(pSrcDst:PIpp16s; pTmp:PIpp16s; len:Ipp32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSortRadixAscend_16u_I(pSrcDst:PIpp16u; pTmp:PIpp16u; len:Ipp32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSortRadixAscend_8u_I(pSrcDst:PIpp8u; pTmp:PIpp8u; len:Ipp32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSortRadixAscend_64f_I(pSrcDst:PIpp64f; pTmp:PIpp64f; len:Ipp32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsSortRadixDescend_32f_I(pSrcDst:PIpp32f; pTmp:PIpp32f; len:Ipp32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSortRadixDescend_32s_I(pSrcDst:PIpp32s; pTmp:PIpp32s; len:Ipp32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSortRadixDescend_32u_I(pSrcDst:PIpp32u; pTmp:PIpp32u; len:Ipp32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSortRadixDescend_16s_I(pSrcDst:PIpp16s; pTmp:PIpp16s; len:Ipp32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSortRadixDescend_16u_I(pSrcDst:PIpp16u; pTmp:PIpp16u; len:Ipp32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSortRadixDescend_8u_I(pSrcDst:PIpp8u; pTmp:PIpp8u; len:Ipp32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSortRadixDescend_64f_I(pSrcDst:PIpp64f; pTmp:PIpp64f; len:Ipp32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////////////
//  Names:      ippsSortRadixIndexAscend, ippsSortRadixIndexDescend
//
//  Purpose:    Indirectly sorts possibly sparse input vector, using indexes.
//              For a dense input array the following will be true:
//
//              ippsSortRadixIndexAscend  - pSrc[pDstIndx[i-1]] <= pSrc[pDstIndx[i]];
//              ippsSortRadixIndexDescend - pSrc[pDstIndx[i]] <= pSrc[pDstIndx[i-1]];
//
//  Arguments:
//    pSrc                 pointer to the first element of a sparse input vector;
//    srcStrideBytes       step between two consecutive elements of input vector in bytes;
//    pDstIndx             pointer to the output indexes vector;
//    pTmpIndx             pointer to the temporary indexes vector (same size as output one);
//    len                  length of the vectors;
//  Return:
//    ippStsNullPtrErr     pointer to the data or temporary placeholders is NULL
//    ippStsSizeErr        length of the vectors is less or equal zero
//    ippStsNoErr          otherwise
}

function ippsSortRadixIndexAscend_32f(pSrc:PIpp32f; srcStrideBytes:Ipp32s; pDstIndx:PIpp32s; pTmpIndx:PIpp32s; len:Ipp32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSortRadixIndexAscend_32s(pSrc:PIpp32s; srcStrideBytes:Ipp32s; pDstIndx:PIpp32s; pTmpIndx:PIpp32s; len:Ipp32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSortRadixIndexAscend_32u(pSrc:PIpp32u; srcStrideBytes:Ipp32s; pDstIndx:PIpp32s; pTmpIndx:PIpp32s; len:Ipp32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSortRadixIndexAscend_16s(pSrc:PIpp16s; srcStrideBytes:Ipp32s; pDstIndx:PIpp32s; pTmpIndx:PIpp32s; len:Ipp32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSortRadixIndexAscend_16u(pSrc:PIpp16u; srcStrideBytes:Ipp32s; pDstIndx:PIpp32s; pTmpIndx:PIpp32s; len:Ipp32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSortRadixIndexAscend_8u(pSrc:PIpp8u; srcStrideBytes:Ipp32s; pDstIndx:PIpp32s; pTmpIndx:PIpp32s; len:Ipp32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSortRadixIndexDescend_32f(pSrc:PIpp32f; srcStrideBytes:Ipp32s; pDstIndx:PIpp32s; pTmpIndx:PIpp32s; len:Ipp32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSortRadixIndexDescend_32s(pSrc:PIpp32s; srcStrideBytes:Ipp32s; pDstIndx:PIpp32s; pTmpIndx:PIpp32s; len:Ipp32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSortRadixIndexDescend_32u(pSrc:PIpp32u; srcStrideBytes:Ipp32s; pDstIndx:PIpp32s; pTmpIndx:PIpp32s; len:Ipp32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSortRadixIndexDescend_16s(pSrc:PIpp16s; srcStrideBytes:Ipp32s; pDstIndx:PIpp32s; pTmpIndx:PIpp32s; len:Ipp32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSortRadixIndexDescend_16u(pSrc:PIpp16u; srcStrideBytes:Ipp32s; pDstIndx:PIpp32s; pTmpIndx:PIpp32s; len:Ipp32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSortRadixIndexDescend_8u(pSrc:PIpp8u; srcStrideBytes:Ipp32s; pDstIndx:PIpp32s; pTmpIndx:PIpp32s; len:Ipp32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//                  Vector Measures Functions
///////////////////////////////////////////////////////////////////////////// }
{ /////////////////////////////////////////////////////////////////////////////
//  Names:      ippsSum
//  Purpose:    sum all elements of the source vector
//  Parameters:
//   pSrc                pointer to the source vector
//   pSum                pointer to the result
//   len                 length of the vector
//   scaleFactor         scale factor value
//  Return:
//   ippStsNullPtrErr       pointer to the vector or result is NULL
//   ippStsSizeErr          length of the vector is less or equal 0
//   ippStsNoErr            otherwise
}
function ippsSum_32f(pSrc:PIpp32f; len:integer; out pSum:Ipp32f; hint:IppHintAlgorithm):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSum_64f(pSrc:PIpp64f; len:integer; out pSum:Ipp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSum_32fc(pSrc:PIpp32fc; len:integer; out pSum:Ipp32fc; hint:IppHintAlgorithm):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSum_16s32s_Sfs(pSrc:PIpp16s; len:integer; out pSum:Ipp32s; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSum_16sc32sc_Sfs(pSrc:PIpp16sc; len:integer; out pSum:Ipp32sc; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSum_16s_Sfs(pSrc:PIpp16s; len:integer; out pSum:Ipp16s; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSum_16sc_Sfs(pSrc:PIpp16sc; len:integer; out pSum:Ipp16sc; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSum_32s_Sfs(pSrc:PIpp32s; len:integer; out pSum:Ipp32s; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsSum_64fc(pSrc:PIpp64fc; len:integer; out pSum:Ipp64fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};



{ /////////////////////////////////////////////////////////////////////////////
//  Names:      ippsMean
//  Purpose:    compute average value of all elements of the source vector
//  Parameters:
//   pSrc                pointer to the source vector
//   pMean               pointer to the result
//   len                 length of the source vector
//   scaleFactor         scale factor value
//  Return:
//   ippStsNullPtrErr       pointer(s) to the vector or the result is NULL
//   ippStsSizeErr          length of the vector is less or equal 0
//   ippStsNoErr            otherwise
}
function ippsMean_32f(pSrc:PIpp32f; len:integer; out pMean:Ipp32f; hint:IppHintAlgorithm):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMean_32fc(pSrc:PIpp32fc; len:integer; out pMean:Ipp32fc; hint:IppHintAlgorithm):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMean_64f(pSrc:PIpp64f; len:integer; out pMean:Ipp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMean_16s_Sfs(pSrc:PIpp16s; len:integer; out pMean:Ipp16s; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMean_16sc_Sfs(pSrc:PIpp16sc; len:integer; out pMean:Ipp16sc; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMean_64fc(pSrc:PIpp64fc; len:integer; out pMean:Ipp64fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMean_32s_Sfs(pSrc:PIpp32s; len:integer; out pMean:Ipp32s; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ /////////////////////////////////////////////////////////////////////////////
//  Names:      ippsStdDev
//  Purpose:    compute standard deviation value of all elements of the vector
//  Parameters:
//   pSrc               pointer to the vector
//   len                length of the vector
//   pStdDev            pointer to the result
//   scaleFactor        scale factor value
//  Return:
//   ippStsNoErr           Ok
//   ippStsNullPtrErr      pointer to the vector or the result is NULL
//   ippStsSizeErr         length of the vector is less than 2
//  Functionality:
//         std = sqrt( sum( (x[n] - mean(x))^2, n=0..len-1 ) / (len-1) )
}
function ippsStdDev_32f(pSrc:PIpp32f; len:integer; out pStdDev:Ipp32f; hint:IppHintAlgorithm):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsStdDev_64f(pSrc:PIpp64f; len:integer; out pStdDev:Ipp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsStdDev_16s32s_Sfs(pSrc:PIpp16s; len:integer; out pStdDev:Ipp32s; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsStdDev_16s_Sfs(pSrc:PIpp16s; len:integer; out pStdDev:Ipp16s; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ /////////////////////////////////////////////////////////////////////////////
//  Names:      ippsMeanStdDev
//  Purpose:    compute standard deviation value and mean value
//              of all elements of the vector
//  Parameters:
//   pSrc               pointer to the vector
//   len                length of the vector
//   pStdDev            pointer to the result
//   pMean              pointer to the result
//   scaleFactor        scale factor value
//  Return:
//   ippStsNoErr           Ok
//   ippStsNullPtrErr      pointer to the vector or the result is NULL
//   ippStsSizeErr         length of the vector is less than 2
//  Functionality:
//         std = sqrt( sum( (x[n] - mean(x))^2, n=0..len-1 ) / (len-1) )
}
function ippsMeanStdDev_32f(pSrc:PIpp32f; len:integer; out pMean:Ipp32f; out pStdDev:Ipp32f; hint:IppHintAlgorithm):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMeanStdDev_64f(pSrc:PIpp64f; len:integer; out pMean:Ipp64f; out pStdDev:Ipp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsMeanStdDev_16s32s_Sfs(pSrc:PIpp16s; len:integer; out pMean:Ipp32s; out pStdDev:Ipp32s; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMeanStdDev_16s_Sfs(pSrc:PIpp16s; len:integer; out pMean:Ipp16s; out pStdDev:Ipp16s; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ /////////////////////////////////////////////////////////////////////////////
//  Names:      ippsMax
//  Purpose:    find maximum value among all elements of the source vector
//  Parameters:
//   pSrc                 pointer to the source vector
//   pMax                 pointer to the result
//   len                  length of the vector
//  Return:
//   ippStsNullPtrErr        pointer(s) to the vector or the result is NULL
//   ippStsSizeErr           length of the vector is less or equal 0
//   ippStsNoErr             otherwise
}
function ippsMax_32f(pSrc:PIpp32f; len:integer; out pMax:Ipp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMax_64f(pSrc:PIpp64f; len:integer; out pMax:Ipp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMax_16s(pSrc:PIpp16s; len:integer; out pMax:Ipp16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//  Names:       ippsMaxIndx
//
//  Purpose:    find element with max value and return the value and the index
//  Parameters:
//   pSrc           pointer to the input vector
//   len            length of the vector
//   pMax           address to place max value found
//   pIndx          address to place index found, may be NULL
//  Return:
//   ippStsNullPtrErr        pointer(s) to the data is NULL
//   ippStsSizeErr           length of the vector is less or equal zero
//   ippStsNoErr             otherwise
}

function ippsMaxIndx_16s(pSrc:PIpp16s; len:integer; out pMax:Ipp16s; out pIndx:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMaxIndx_32f(pSrc:PIpp32f; len:integer; out pMax:Ipp32f; out pIndx:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMaxIndx_64f(pSrc:PIpp64f; len:integer; out pMax:Ipp64f; out pIndx:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//  Names:      ippsMin
//  Purpose:    find minimum value among all elements of the source vector
//  Parameters:
//   pSrc                 pointer to the source vector
//   pMin                 pointer to the result
//   len                  length of the vector
//  Return:
//   ippStsNullPtrErr        pointer(s) to the vector or the result is NULL
//   ippStsSizeErr           length of the vector is less or equal 0
//   ippStsNoErr             otherwise
}
function ippsMin_32f(pSrc:PIpp32f; len:integer; out pMin:Ipp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMin_64f(pSrc:PIpp64f; len:integer; out pMin:Ipp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMin_16s(pSrc:PIpp16s; len:integer; out pMin:Ipp16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//  Names:       ippsMinIndx
//
//  Purpose:    find element with min value and return the value and the index
//  Parameters:
//   pSrc           pointer to the input vector
//   len            length of the vector
//   pMin           address to place min value found
//   pIndx          address to place index found, may be NULL
//  Return:
//   ippStsNullPtrErr        pointer(s) to the data is NULL
//   ippStsSizeErr           length of the vector is less or equal zero
//   ippStsNoErr             otherwise
}
function ippsMinIndx_16s(pSrc:PIpp16s; len:integer; out pMin:Ipp16s; out pIndx:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMinIndx_32f(pSrc:PIpp32f; len:integer; out pMin:Ipp32f; out pIndx:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMinIndx_64f(pSrc:PIpp64f; len:integer; out pMin:Ipp64f; out pIndx:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ ////////////////////////////////////////////////////////////////////////////
//  Names:              ippsMinEvery, ippsMaxEvery
//  Purpose:            calculation min/max value for every element of two vectors
//  Parameters:
//   pSrc               pointer to input vector
//   pSrcDst            pointer to input/output vector
//   len                vector's length
//  Return:
//   ippStsNullPtrErr      pointer(s) to the data is NULL
//   ippStsSizeErr         vector`s length is less or equal zero
//   ippStsNoErr           otherwise
}


function ippsMinEvery_16s_I(pSrc:PIpp16s; pSrcDst:PIpp16s; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsMinEvery_32s_I(pSrc:PIpp32s; pSrcDst:PIpp32s; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMinEvery_32f_I(pSrc:PIpp32f; pSrcDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsMaxEvery_16s_I(pSrc:PIpp16s; pSrcDst:PIpp16s; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsMaxEvery_32s_I(pSrc:PIpp32s; pSrcDst:PIpp32s; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMaxEvery_32f_I(pSrc:PIpp32f; pSrcDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsMinEvery_64f_I(pSrc:PIpp64f; pSrcDst:PIpp64f; len:Ipp32u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMaxEvery_64f_I(pSrc:PIpp64f; pSrcDst:PIpp64f; len:Ipp32u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsMaxEvery_8u_I(pSrc:PIpp8u; pSrcDst:PIpp8u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMinEvery_8u_I(pSrc:PIpp8u; pSrcDst:PIpp8u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMaxEvery_16u_I(pSrc:PIpp16u; pSrcDst:PIpp16u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMinEvery_16u_I(pSrc:PIpp16u; pSrcDst:PIpp16u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsMinEvery_8u(pSrc1:PIpp8u; pSrc2:PIpp8u; pDst:PIpp8u; len:Ipp32u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMaxEvery_8u(pSrc1:PIpp8u; pSrc2:PIpp8u; pDst:PIpp8u; len:Ipp32u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMinEvery_16u(pSrc1:PIpp16u; pSrc2:PIpp16u; pDst:PIpp16u; len:Ipp32u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMaxEvery_16u(pSrc1:PIpp16u; pSrc2:PIpp16u; pDst:PIpp16u; len:Ipp32u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMinEvery_32f(pSrc1:PIpp32f; pSrc2:PIpp32f; pDst:PIpp32f; len:Ipp32u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMaxEvery_32f(pSrc1:PIpp32f; pSrc2:PIpp32f; pDst:PIpp32f; len:Ipp32u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMinEvery_64f(pSrc1:PIpp64f; pSrc2:PIpp64f; pDst:PIpp64f; len:Ipp32u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMaxEvery_64f(pSrc1:PIpp64f; pSrc2:PIpp64f; pDst:PIpp64f; len:Ipp32u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsMinMax_64f(pSrc:PIpp64f; len:integer; out pMin:Ipp64f; out pMax:Ipp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMinMax_32f(pSrc:PIpp32f; len:integer; out pMin:Ipp32f; out pMax:Ipp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMinMax_32s(pSrc:PIpp32s; len:integer; out pMin:Ipp32s; out pMax:Ipp32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMinMax_32u(pSrc:PIpp32u; len:integer; out pMin:Ipp32u; out pMax:Ipp32u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMinMax_16s(pSrc:PIpp16s; len:integer; out pMin:Ipp16s; out pMax:Ipp16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMinMax_16u(pSrc:PIpp16u; len:integer; out pMin:Ipp16u; out pMax:Ipp16u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMinMax_8u(pSrc:PIpp8u; len:integer; out pMin:Ipp8u; out pMax:Ipp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


function ippsMinMaxIndx_64f(pSrc:PIpp64f; len:integer; out pMin:Ipp64f; out pMinIndx:integer; out pMax:Ipp64f; out pMaxIndx:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMinMaxIndx_32f(pSrc:PIpp32f; len:integer; out pMin:Ipp32f; out pMinIndx:integer; out pMax:Ipp32f; out pMaxIndx:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMinMaxIndx_32s(pSrc:PIpp32s; len:integer; out pMin:Ipp32s; out pMinIndx:integer; out pMax:Ipp32s; out pMaxIndx:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMinMaxIndx_32u(pSrc:PIpp32u; len:integer; out pMin:Ipp32u; out pMinIndx:integer; out pMax:Ipp32u; out pMaxIndx:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMinMaxIndx_16s(pSrc:PIpp16s; len:integer; out pMin:Ipp16s; out pMinIndx:integer; out pMax:Ipp16s; out pMaxIndx:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMinMaxIndx_16u(pSrc:PIpp16u; len:integer; out pMin:Ipp16u; out pMinIndx:integer; out pMax:Ipp16u; out pMaxIndx:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMinMaxIndx_8u(pSrc:PIpp8u; len:integer; out pMin:Ipp8u; out pMinIndx:integer; out pMax:Ipp8u; out pMaxIndx:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};




function ippsMin_32s(pSrc:PIpp32s; len:integer; out pMin:Ipp32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsMax_32s(pSrc:PIpp32s; len:integer; out pMax:Ipp32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsMinIndx_32s(pSrc:PIpp32s; len:integer; out pMin:Ipp32s; out pIndx:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsMaxIndx_32s(pSrc:PIpp32s; len:integer; out pMax:Ipp32s; out pIndx:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};



function ippsMinAbs_16s(pSrc:PIpp16s; len:integer; out pMinAbs:Ipp16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsMaxAbs_16s(pSrc:PIpp16s; len:integer; out pMaxAbs:Ipp16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsMinAbsIndx_16s(pSrc:PIpp16s; len:integer; out pMinAbs:Ipp16s; out pIndx:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsMaxAbsIndx_16s(pSrc:PIpp16s; len:integer; out pMaxAbs:Ipp16s; out pIndx:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};



function ippsMinAbs_32s(pSrc:PIpp32s; len:integer; out pMinAbs:Ipp32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsMaxAbs_32s(pSrc:PIpp32s; len:integer; out pMaxAbs:Ipp32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsMinAbsIndx_32s(pSrc:PIpp32s; len:integer; out pMinAbs:Ipp32s; out pIndx:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsMaxAbsIndx_32s(pSrc:PIpp32s; len:integer; out pMaxAbs:Ipp32s; out pIndx:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};





{ /////////////////////////////////////////////////////////////////////////////
//  Names:
//    ippsPhase_64fc
//    ippsPhase_32fc
//    ippsPhase_16sc_Sfs
//    ippsPhase_16sc32f
//  Purpose:
//    Compute the phase (in radians) of complex vector elements.
//  Parameters:
//    pSrcRe    - an input complex vector
//    pDst      - an output vector to store the phase components;
//    len       - a length of the arrays.
//    scaleFactor   - a scale factor of output results (only for integer data)
//  Return:
//    ippStsNoErr               Ok
//    ippStsNullPtrErr          Some of pointers to input or output data are NULL
//    ippStsBadSizeErr          The length of the arrays is less or equal zero
}
function ippsPhase_64fc(pSrc:PIpp64fc; pDst:PIpp64f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsPhase_32fc(pSrc:PIpp32fc; pDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsPhase_16sc32f(pSrc:PIpp16sc; pDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsPhase_16sc_Sfs(pSrc:PIpp16sc; pDst:PIpp16s; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//  Names:
//    ippsPhase_64f
//    ippsPhase_32f
//    ippsPhase_16s_Sfs
//    ippsPhase_16s32f
//  Purpose:
//    Compute the phase of complex data formed as two real vectors.
//  Parameters:
//    pSrcRe    - an input vector containing a real part of complex data
//    pSrcIm    - an input vector containing an imaginary part of complex data
//    pDst      - an output vector to store the phase components
//    len       - a length of the arrays.
//    scaleFactor   - a scale factor of output results (only for integer data)
//  Return:
//    ippStsNoErr               Ok
//    ippStsNullPtrErr          Some of pointers to input or output data are NULL
//    ippStsBadSizeErr          The length of the arrays is less or equal zero
}
function ippsPhase_64f(pSrcRe:PIpp64f; pSrcIm:PIpp64f; pDst:PIpp64f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsPhase_32f(pSrcRe:PIpp32f; pSrcIm:PIpp32f; pDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsPhase_16s_Sfs(pSrcRe:PIpp16s; pSrcIm:PIpp16s; pDst:PIpp16s; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsPhase_16s32f(pSrcRe:PIpp16s; pSrcIm:PIpp16s; pDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//  Names:
//    ippsPhase_32sc_Sfs
//  Purpose:
//    Compute the phase (in radians) of complex vector elements.
//  Parameters:
//    pSrcRe    - an input complex vector
//    pDst      - an output vector to store the phase components;
//    len       - a length of the arrays.
//    scaleFactor   - a scale factor of output results (only for integer data)
//  Return:
//    ippStsNoErr               Ok
//    ippStsNullPtrErr          Some of pointers to input or output data are NULL
//    ippStsBadSizeErr          The length of the arrays is less or equal zero
}
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsPhase_32sc_Sfs(pSrc:PIpp32sc; pDst:PIpp32s; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//  Names:
//      ippsMaxOrder_64f
//      ippsMaxOrder_32f
//      ippsMaxOrder_32s
//      ippsMaxOrder_16s
//  Purpose:
//     Determines the maximal number of binary digits for data representation.
//  Parameters:
//    pSrc     The pointer on input signal vector.
//    pOrder   Pointer to result value.
//    len      The  length of  the input vector.
//  Return:
//    ippStsNoErr         Ok
//    ippStsNullPtrErr    Some of pointers to input or output data are NULL
//    ippStsSizeErr       The length of the arrays is less or equal zero
//    ippStsNanArg        If not a number is met in a input value
}

function ippsMaxOrder_64f(pSrc:PIpp64f; len:integer; out pOrder:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMaxOrder_32f(pSrc:PIpp32f; len:integer; out pOrder:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMaxOrder_32s(pSrc:PIpp32s; len:integer; out pOrder:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMaxOrder_16s(pSrc:PIpp16s; len:integer; out pOrder:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//  Names:      ippsArctan
//
//  Purpose: compute arctangent value for all elements of the source vector
//
//  Return:
//   stsNoErr           Ok
//   stsNullPtrErr      Some of pointers to input or output data are NULL
//   stsBadSizeErr      The length of the arrays is less or equal zero
//
//  Parameters:
//   pSrcDst            pointer to the source/destination vector
//   pSrc               pointer to the source vector
//   pDst               pointer to the destination vector
//   len                a length of the array
//
}

function ippsArctan_32f_I(pSrcDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsArctan_32f(pSrc:PIpp32f; pDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsArctan_64f_I(pSrcDst:PIpp64f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsArctan_64f(pSrc:PIpp64f; pDst:PIpp64f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};




{ /////////////////////////////////////////////////////////////////////////////
//  Name:           ippsFindNearestOne
//  Purpose:        Searches the table for an element closest to the reference value
//                  and returns its value and index
//  Context:
//  Returns:        IppStatus
//    ippStsNoErr        Ok
//    ippStsNullPtrErr   At least one of the specified pointers is NULL
//    ippStsSizeErr      The length of the table is less than or equal to zero
//  Parameters:
//    inpVal        reference Value
//    pOutVal       pointer to the found value
//    pOutIndx      pointer to the found index
//    pTable        table for search
//    tblLen        length of the table
//  Notes:
//                  The table should contain monotonically increasing values
}

function ippsFindNearestOne_16u(inpVal:Ipp16u; out pOutVal:Ipp16u; out pOutIndex:integer; pTable:PIpp16u; tblLen:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ /////////////////////////////////////////////////////////////////////////////
//  Name:           ippsFindNearest
//  Purpose:        Searches the table for elements closest to the reference values
//                  and the their indexes
//  Context:
//  Returns:        IppStatus
//    ippStsNoErr        Ok
//    ippStsNullPtrErr   At least one of the specified pointers is NULL
//    ippStsSizeErr      The length of table or pVals is less than or equal to zero
//  Parameters:
//    pVals         pointer to the reference values vector
//    pOutVals      pointer to the vector with the found values
//    pOutIndexes   pointer to the array with indexes of the found elements
//    len           length of the input vector
//    pTable        table for search
//    tblLen        length of the table
//  Notes:
//                  The table should contain monotonically increasing values
}


function ippsFindNearest_16u(pVals:PIpp16u; out pOutVals:Ipp16u; out pOutIndexes:integer; len:integer; pTable:PIpp16u; tblLen:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ /////////////////////////////////////////////////////////////////////////////
//                      Vector logical functions
///////////////////////////////////////////////////////////////////////////// }
{ ////////////////////////////////////////////////////////////////////////////
//  Names:              ippsAnd, ippsOr, ippsXor, ippsNot, ippsLShiftC, ippsRShiftC
//  Purpose:            logical operations and vector shifts
//  Parameters:
//   val                1) value to be ANDed/ORed/XORed with each element of the vector (And, Or, Xor);
//                      2) position`s number which vector elements to be SHIFTed on (ShiftC)
//   pSrc               pointer to input vector
//   pSrcDst            pointer to input/output vector
//   pSrc1              pointer to first input vector
//   pSrc2              pointer to second input vector
//   pDst               pointer to output vector
//   len                vector's length
//  Return:
//   ippStsNullPtrErr      pointer(s) to the data is NULL
//   ippStsSizeErr         vector`s length is less or equal zero
//   ippStsShiftErr        shift`s value is less zero
//   ippStsNoErr           otherwise
}

function ippsAndC_8u_I(val:Ipp8u; pSrcDst:PIpp8u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsAndC_8u(pSrc:PIpp8u; val:Ipp8u; pDst:PIpp8u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsAndC_16u_I(val:Ipp16u; pSrcDst:PIpp16u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsAndC_16u(pSrc:PIpp16u; val:Ipp16u; pDst:PIpp16u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsAndC_32u_I(val:Ipp32u; pSrcDst:PIpp32u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsAndC_32u(pSrc:PIpp32u; val:Ipp32u; pDst:PIpp32u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsAnd_8u_I(pSrc:PIpp8u; pSrcDst:PIpp8u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsAnd_8u(pSrc1:PIpp8u; pSrc2:PIpp8u; pDst:PIpp8u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsAnd_16u_I(pSrc:PIpp16u; pSrcDst:PIpp16u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsAnd_16u(pSrc1:PIpp16u; pSrc2:PIpp16u; pDst:PIpp16u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsAnd_32u_I(pSrc:PIpp32u; pSrcDst:PIpp32u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsAnd_32u(pSrc1:PIpp32u; pSrc2:PIpp32u; pDst:PIpp32u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsOrC_8u_I(val:Ipp8u; pSrcDst:PIpp8u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsOrC_8u(pSrc:PIpp8u; val:Ipp8u; pDst:PIpp8u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsOrC_16u_I(val:Ipp16u; pSrcDst:PIpp16u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsOrC_16u(pSrc:PIpp16u; val:Ipp16u; pDst:PIpp16u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsOrC_32u_I(val:Ipp32u; pSrcDst:PIpp32u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsOrC_32u(pSrc:PIpp32u; val:Ipp32u; pDst:PIpp32u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsOr_8u_I(pSrc:PIpp8u; pSrcDst:PIpp8u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsOr_8u(pSrc1:PIpp8u; pSrc2:PIpp8u; pDst:PIpp8u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsOr_16u_I(pSrc:PIpp16u; pSrcDst:PIpp16u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsOr_16u(pSrc1:PIpp16u; pSrc2:PIpp16u; pDst:PIpp16u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsOr_32u_I(pSrc:PIpp32u; pSrcDst:PIpp32u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsOr_32u(pSrc1:PIpp32u; pSrc2:PIpp32u; pDst:PIpp32u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsXorC_8u_I(val:Ipp8u; pSrcDst:PIpp8u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsXorC_8u(pSrc:PIpp8u; val:Ipp8u; pDst:PIpp8u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsXorC_16u_I(val:Ipp16u; pSrcDst:PIpp16u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsXorC_16u(pSrc:PIpp16u; val:Ipp16u; pDst:PIpp16u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsXorC_32u_I(val:Ipp32u; pSrcDst:PIpp32u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsXorC_32u(pSrc:PIpp32u; val:Ipp32u; pDst:PIpp32u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsXor_8u_I(pSrc:PIpp8u; pSrcDst:PIpp8u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsXor_8u(pSrc1:PIpp8u; pSrc2:PIpp8u; pDst:PIpp8u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsXor_16u_I(pSrc:PIpp16u; pSrcDst:PIpp16u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsXor_16u(pSrc1:PIpp16u; pSrc2:PIpp16u; pDst:PIpp16u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsXor_32u_I(pSrc:PIpp32u; pSrcDst:PIpp32u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsXor_32u(pSrc1:PIpp32u; pSrc2:PIpp32u; pDst:PIpp32u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsNot_8u_I(pSrcDst:PIpp8u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsNot_8u(pSrc:PIpp8u; pDst:PIpp8u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsNot_16u_I(pSrcDst:PIpp16u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsNot_16u(pSrc:PIpp16u; pDst:PIpp16u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsNot_32u_I(pSrcDst:PIpp32u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsNot_32u(pSrc:PIpp32u; pDst:PIpp32u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsLShiftC_8u_I(val:integer; pSrcDst:PIpp8u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsLShiftC_8u(pSrc:PIpp8u; val:integer; pDst:PIpp8u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsLShiftC_16u_I(val:integer; pSrcDst:PIpp16u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsLShiftC_16u(pSrc:PIpp16u; val:integer; pDst:PIpp16u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsLShiftC_16s_I(val:integer; pSrcDst:PIpp16s; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsLShiftC_16s(pSrc:PIpp16s; val:integer; pDst:PIpp16s; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsLShiftC_32s_I(val:integer; pSrcDst:PIpp32s; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsLShiftC_32s(pSrc:PIpp32s; val:integer; pDst:PIpp32s; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsRShiftC_8u_I(val:integer; pSrcDst:PIpp8u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsRShiftC_8u(pSrc:PIpp8u; val:integer; pDst:PIpp8u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsRShiftC_16u_I(val:integer; pSrcDst:PIpp16u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsRShiftC_16u(pSrc:PIpp16u; val:integer; pDst:PIpp16u; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsRShiftC_16s_I(val:integer; pSrcDst:PIpp16s; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsRShiftC_16s(pSrc:PIpp16s; val:integer; pDst:PIpp16s; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsRShiftC_32s_I(val:integer; pSrcDst:PIpp32s; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsRShiftC_32s(pSrc:PIpp32s; val:integer; pDst:PIpp32s; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};



{ /////////////////////////////////////////////////////////////////////////////
//                  Dot Product Functions
///////////////////////////////////////////////////////////////////////////// }
{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippsDotProd
//  Purpose:    compute Dot Product value
//  Arguments:
//     pSrc1               pointer to the source vector
//     pSrc2               pointer to the another source vector
//     len                 vector's length, number of items
//     pDp                 pointer to the result
//     scaleFactor         scale factor value
//  Return:
//     ippStsNullPtrErr       pointer(s) pSrc pDst is NULL
//     ippStsSizeErr          length of the vectors is less or equal 0
//     ippStsNoErr            otherwise
//  Notes:
//     the functions don't conjugate one of the source vectors
}

function ippsDotProd_32f(pSrc1:PIpp32f; pSrc2:PIpp32f; len:integer; pDp:PIpp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsDotProd_32fc(pSrc1:PIpp32fc; pSrc2:PIpp32fc; len:integer; pDp:PIpp32fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsDotProd_32f32fc(pSrc1:PIpp32f; pSrc2:PIpp32fc; len:integer; pDp:PIpp32fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsDotProd_64f(pSrc1:PIpp64f; pSrc2:PIpp64f; len:integer; pDp:PIpp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsDotProd_64fc(pSrc1:PIpp64fc; pSrc2:PIpp64fc; len:integer; pDp:PIpp64fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsDotProd_64f64fc(pSrc1:PIpp64f; pSrc2:PIpp64fc; len:integer; pDp:PIpp64fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDotProd_16s_Sfs(pSrc1:PIpp16s; pSrc2:PIpp16s; len:integer; pDp:PIpp16s; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDotProd_16sc_Sfs(pSrc1:PIpp16sc; pSrc2:PIpp16sc; len:integer; pDp:PIpp16sc; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDotProd_16s16sc_Sfs(pSrc1:PIpp16s; pSrc2:PIpp16sc; len:integer; pDp:PIpp16sc; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsDotProd_16s64s(pSrc1:PIpp16s; pSrc2:PIpp16s; len:integer; pDp:PIpp64s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsDotProd_16sc64sc(pSrc1:PIpp16sc; pSrc2:PIpp16sc; len:integer; pDp:PIpp64sc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsDotProd_16s16sc64sc(pSrc1:PIpp16s; pSrc2:PIpp16sc; len:integer; pDp:PIpp64sc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsDotProd_16s32f(pSrc1:PIpp16s; pSrc2:PIpp16s; len:integer; pDp:PIpp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDotProd_16sc32fc(pSrc1:PIpp16sc; pSrc2:PIpp16sc; len:integer; pDp:PIpp32fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDotProd_16s16sc32fc(pSrc1:PIpp16s; pSrc2:PIpp16sc; len:integer; pDp:PIpp32fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsDotProd_32f64f(pSrc1:PIpp32f; pSrc2:PIpp32f; len:integer; pDp:PIpp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsDotProd_32fc64fc(pSrc1:PIpp32fc; pSrc2:PIpp32fc; len:integer; pDp:PIpp64fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsDotProd_32f32fc64fc(pSrc1:PIpp32f; pSrc2:PIpp32fc; len:integer; pDp:PIpp64fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


function ippsDotProd_16s32s_Sfs(pSrc1:PIpp16s; pSrc2:PIpp16s; len:integer; pDp:PIpp32s; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDotProd_16sc32sc_Sfs(pSrc1:PIpp16sc; pSrc2:PIpp16sc; len:integer; pDp:PIpp32sc; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDotProd_16s16sc32sc_Sfs(pSrc1:PIpp16s; pSrc2:PIpp16sc; len:integer; pDp:PIpp32sc; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsDotProd_32s_Sfs(pSrc1:PIpp32s; pSrc2:PIpp32s; len:integer; pDp:PIpp32s; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDotProd_32sc_Sfs(pSrc1:PIpp32sc; pSrc2:PIpp32sc; len:integer; pDp:PIpp32sc; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDotProd_32s32sc_Sfs(pSrc1:PIpp32s; pSrc2:PIpp32sc; len:integer; pDp:PIpp32sc; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsDotProd_16s32s32s_Sfs(pSrc1:PIpp16s; pSrc2:PIpp32s; len:integer; pDp:PIpp32s; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//  Names:
//          ippsPowerSpectr_64fc
//          ippsPowerSpectr_32fc
//          ippsPowerSpectr_16sc_Sfs
//          ippsPowerSpectr_16sc32f
//  Purpose:
//    Compute the power spectrum of complex vector
//  Parameters:
//    pSrcRe    - pointer to the real part of input vector.
//    pSrcIm    - pointer to the image part of input vector.
//    pDst      - pointer to the result.
//    len       - vector length.
//    scaleFactor   - scale factor for rezult (only for integer data).
//  Return:
//   ippStsNullPtrErr  indicates that one or more pointers to the data is NULL.
//   ippStsSizeErr     indicates that vector length is less or equal zero.
//   ippStsNoErr       otherwise.
}



function ippsPowerSpectr_64fc(pSrc:PIpp64fc; pDst:PIpp64f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsPowerSpectr_32fc(pSrc:PIpp32fc; pDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsPowerSpectr_16sc_Sfs(pSrc:PIpp16sc; pDst:PIpp16s; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsPowerSpectr_16sc32f(pSrc:PIpp16sc; pDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//  Names:
//          ippsPowerSpectr_64f
//          ippsPowerSpectr_32f
//          ippsPowerSpectr_16s_Sfs
//          ippsPowerSpectr_16s32f
//  Purpose:
//    Compute the power spectrum of complex data formed as two real vectors
//  Parameters:
//    pSrcRe    - pointer to the real part of input vector.
//    pSrcIm    - pointer to the image part of input vector.
//    pDst      - pointer to the result.
//    len       - vector length.
//    scaleFactor   - scale factor for rezult (only for integer data).
//  Return:
//   ippStsNullPtrErr  indicates that one or more pointers to the data is NULL.
//   ippStsSizeErr     indicates that vector length is less or equal zero.
//   ippStsNoErr       otherwise.
}

function ippsPowerSpectr_64f(pSrcRe:PIpp64f; pSrcIm:PIpp64f; pDst:PIpp64f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsPowerSpectr_32f(pSrcRe:PIpp32f; pSrcIm:PIpp32f; pDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsPowerSpectr_16s_Sfs(pSrcRe:PIpp16s; pSrcIm:PIpp16s; pDst:PIpp16s; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsPowerSpectr_16s32f(pSrcRe:PIpp16s; pSrcIm:PIpp16s; pDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//                  Linear Transform
///////////////////////////////////////////////////////////////////////////// }
{ /////////////////////////////////////////////////////////////////////////////
//  Names:
//    ippsNormalize_64fc
//    ippsNormalize_32fc
//    ippsNormalize_16sc_Sfs
//  Purpose:
//    Complex vector normalization using offset and division method.
//  Parameters:
//    pSrc      - an input complex vector
//    pDst      - an output complex vector
//    len       - a length of the arrays.
//    vsub      - complex a subtrahend
//    vdiv      - denominator
//    scaleFactor   - a scale factor of output results (only for integer data)
//  Return:
//    ippStsNoErr            Ok
//    ippStsNullPtrErr       Some of pointers to input or output data are NULL
//    ippStsSizeErr          The length of the arrays is less or equal zero
//    ippStsDivByZeroErr     denominator equal zero or less than float
//                           format minimum
}
function ippsNormalize_64fc(pSrc:PIpp64fc; pDst:PIpp64fc; len:integer; vsub:Ipp64fc; vdiv:Ipp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsNormalize_32fc(pSrc:PIpp32fc; pDst:PIpp32fc; len:integer; vsub:Ipp32fc; vdiv:Ipp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsNormalize_16sc_Sfs(pSrc:PIpp16sc; pDst:PIpp16sc; len:integer; vsub:Ipp16sc; vdiv:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//  Names:
//    ippsNormalize_64f
//    ippsNormalize_32f
//    ippsNormalize_16s_Sfs
//  Purpose:
//    Normalize elements of real vector with the help of offset and division.
//  Parameters:
//    pSrc      - an input vector of real data
//    pDst      - an output vector of real data
//    len       - a length of the arrays.
//    vsub      - subtrahend
//    vdiv      - denominator
//    scaleFactor   - a scale factor of output results (only for integer data)
//  Return:
//    ippStsNoErr               Ok
//    ippStsNullPtrErr          Some of pointers to input or output data are NULL
//    ippStsSizeErr             The length of the arrays is less or equal zero
//    ippStsDivByZeroErr        denominator equal zero or less than float
//                           format minimum
}
function ippsNormalize_64f(pSrc:PIpp64f; pDst:PIpp64f; len:integer; vsub:Ipp64f; vdiv:Ipp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsNormalize_32f(pSrc:PIpp32f; pDst:PIpp32f; len:integer; vsub:Ipp32f; vdiv:Ipp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsNormalize_16s_Sfs(pSrc:PIpp16s; pDst:PIpp16s; len:integer; vsub:Ipp16s; vdiv:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ /////////////////////////////////////////////////////////////////////////////
//                  Definitions for FFT Functions
///////////////////////////////////////////////////////////////////////////// }

type
  PIppsFFTSpec_C_32fc = ^TIppsFFTSpec_C_32fc;
  TIppsFFTSpec_C_32fc = record end;

  PIppsFFTSpec_C_32f = ^TIppsFFTSpec_C_32f;
  TIppsFFTSpec_C_32f = record end;

  PIppsFFTSpec_R_32f = ^TIppsFFTSpec_R_32f;
  TIppsFFTSpec_R_32f = record end;


  PIppsFFTSpec_C_64fc = ^TIppsFFTSpec_C_64fc;
  TIppsFFTSpec_C_64fc = record end;

  PIppsFFTSpec_C_64f = ^TIppsFFTSpec_C_64f;
  TIppsFFTSpec_C_64f = record end;

  PIppsFFTSpec_R_64f = ^TIppsFFTSpec_R_64f;
  TIppsFFTSpec_R_64f = record end;


  PIppsFFTSpec_C_16sc = ^TIppsFFTSpec_C_16sc;
  TIppsFFTSpec_C_16sc = record end;

  PIppsFFTSpec_C_16s = ^TIppsFFTSpec_C_16s;
  TIppsFFTSpec_C_16s = record end;

  PIppsFFTSpec_R_16s = ^TIppsFFTSpec_R_16s;
  TIppsFFTSpec_R_16s = record end;


  PIppsFFTSpec_C_32sc = ^TIppsFFTSpec_C_32sc;
  TIppsFFTSpec_C_32sc = record end;

  PIppsFFTSpec_C_32s = ^TIppsFFTSpec_C_32s;
  TIppsFFTSpec_C_32s = record end;

  PIppsFFTSpec_R_32s = ^TIppsFFTSpec_R_32s;
  TIppsFFTSpec_R_32s = record end;


  PIppsFFTSpec_R_16s32s = ^TIppsFFTSpec_R_16s32s;
  TIppsFFTSpec_R_16s32s = record end;



{ /////////////////////////////////////////////////////////////////////////////
//                  FFT Get Size Functions
///////////////////////////////////////////////////////////////////////////// }
{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippsFFTGetSize_C, ippsFFTGetSize_R
//  Purpose:    Computes the size of the FFT context structure and the size
                of the required work buffer (in bytes)
//  Arguments:
//     order      Base-2 logarithm of the number of samples in FFT
//     flag       Flag to choose the results normalization factors
//     hint       Option to select the algorithmic implementation of the transform
//                function
//     pSizeSpec  Pointer to the size value of FFT specification structure
//     pSizeInit  Pointer to the size value of the buffer for FFT initialization function
//     pSizeBuf   Pointer to the size value of the FFT external work buffer
//  Return:
//     ippStsNoErr            No errors
//     ippStsNullPtrErr       One of the specified pointers is NULL
//     ippStsFftOrderErr      FFT order value is illegal
//     ippStsFFTFlagErr       Incorrect normalization flag value
}

function ippsFFTGetSize_C_32fc(order:integer; flag:integer; hint:IppHintAlgorithm; out pSpecSize:integer; out pSpecBufferSize:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFFTGetSize_C_32f(order:integer; flag:integer; hint:IppHintAlgorithm; out pSpecSize:integer; out pSpecBufferSize:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFFTGetSize_R_32f(order:integer; flag:integer; hint:IppHintAlgorithm; out pSpecSize:integer; out pSpecBufferSize:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsFFTGetSize_C_64fc(order:integer; flag:integer; hint:IppHintAlgorithm; out pSpecSize:integer; out pSpecBufferSize:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFFTGetSize_C_64f(order:integer; flag:integer; hint:IppHintAlgorithm; out pSpecSize:integer; out pSpecBufferSize:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFFTGetSize_R_64f(order:integer; flag:integer; hint:IppHintAlgorithm; out pSpecSize:integer; out pSpecBufferSize:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTGetSize_C_16sc(order:integer; flag:integer; hint:IppHintAlgorithm; out pSpecSize:integer; out pSpecBufferSize:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTGetSize_C_16s(order:integer; flag:integer; hint:IppHintAlgorithm; out pSpecSize:integer; out pSpecBufferSize:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTGetSize_R_16s(order:integer; flag:integer; hint:IppHintAlgorithm; out pSpecSize:integer; out pSpecBufferSize:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTGetSize_C_32sc(order:integer; flag:integer; hint:IppHintAlgorithm; out pSpecSize:integer; out pSpecBufferSize:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTGetSize_C_32s(order:integer; flag:integer; hint:IppHintAlgorithm; out pSpecSize:integer; out pSpecBufferSize:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTGetSize_R_32s(order:integer; flag:integer; hint:IppHintAlgorithm; out pSpecSize:integer; out pSpecBufferSize:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTGetSize_R_16s32s(order:integer; flag:integer; hint:IppHintAlgorithm; out pSpecSize:integer; out pSpecBufferSize:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//                  FFT Context Functions
///////////////////////////////////////////////////////////////////////////// }
{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippsFFTInit_C, ippsFFTInit_R
//  Purpose:    Initializes the FFT context structure
//  Arguments:
//     order        Base-2 logarithm of the number of samples in FFT
//     flag         Flag to choose the results normalization factors
//     hint         Option to select the algorithmic implementation of the transform
//                  function
//     ppFFTSpec    Double pointer to the FFT specification structure to be created
//     pSpec        Pointer to the FFT specification structure
//     pSpecBuffer  Pointer to the temporary work buffer
//  Return:
//     ippStsNoErr            No errors
//     ippStsNullPtrErr       One of the specified pointers is NULL
//     ippStsFftOrderErr      FFT order value is illegal
//     ippStsFFTFlagErr       Incorrect normalization flag value
}

function ippsFFTInit_C_32fc(out ppFFTSpec:PIppsFFTSpec_C_32fc; order:integer; flag:integer; hint:IppHintAlgorithm; pSpec:PIpp8u; pSpecBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFFTInit_C_32f(out ppFFTSpec:PIppsFFTSpec_C_32f; order:integer; flag:integer; hint:IppHintAlgorithm; pSpec:PIpp8u; pSpecBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFFTInit_R_32f(out ppFFTSpec:PIppsFFTSpec_R_32f; order:integer; flag:integer; hint:IppHintAlgorithm; pSpec:PIpp8u; pSpecBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsFFTInit_C_64fc(out ppFFTSpec:PIppsFFTSpec_C_64fc; order:integer; flag:integer; hint:IppHintAlgorithm; pSpec:PIpp8u; pSpecBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFFTInit_C_64f(out ppFFTSpec:PIppsFFTSpec_C_64f; order:integer; flag:integer; hint:IppHintAlgorithm; pSpec:PIpp8u; pSpecBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFFTInit_R_64f(out ppFFTSpec:PIppsFFTSpec_R_64f; order:integer; flag:integer; hint:IppHintAlgorithm; pSpec:PIpp8u; pSpecBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTInit_C_16sc(out ppFFTSpec:PIppsFFTSpec_C_16sc; order:integer; flag:integer; hint:IppHintAlgorithm; pSpec:PIpp8u; pSpecBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTInit_C_16s(out ppFFTSpec:PIppsFFTSpec_C_16s; order:integer; flag:integer; hint:IppHintAlgorithm; pSpec:PIpp8u; pSpecBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTInit_R_16s(out ppFFTSpec:PIppsFFTSpec_R_16s; order:integer; flag:integer; hint:IppHintAlgorithm; pSpec:PIpp8u; pSpecBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTInit_C_32sc(out ppFFTSpec:PIppsFFTSpec_C_32sc; order:integer; flag:integer; hint:IppHintAlgorithm; pSpec:PIpp8u; pSpecBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTInit_C_32s(out ppFFTSpec:PIppsFFTSpec_C_32s; order:integer; flag:integer; hint:IppHintAlgorithm; pSpec:PIpp8u; pSpecBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTInit_R_32s(out ppFFTSpec:PIppsFFTSpec_R_32s; order:integer; flag:integer; hint:IppHintAlgorithm; pSpec:PIpp8u; pSpecBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTInit_R_16s32s(out ppFFTSpec:PIppsFFTSpec_R_16s32s; order:integer; flag:integer; hint:IppHintAlgorithm; pSpec:PIpp8u; pSpecBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippsFFTInitAlloc_C, ippsFFTInitAlloc_R
//  Purpose:    Allocates and initializes the FFT specification structure
//  Arguments:
//     order       Base-2 logarithm of the number of samples in FFT
//     flag        Flag to choose the results normalization factors
//     hint        Option to select the algorithmic implementation of the transform
//                 function
//     ppFFTSpec   Double pointer to the FFT context structure
//  Return:
//     ippStsNoErr            No errors
//     ippStsNullPtrErr       ppFFTSpec == NULL
//     ippStsFftOrderErr      FFT order value is illegal
//     ippStsFFTFlagErr       Incorrect normalization flag value
//     ippStsMemAllocErr      Memory allocation fails
}

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTInitAlloc_C_32fc(out ppFFTSpec:PIppsFFTSpec_C_32fc; order:integer; flag:integer; hint:IppHintAlgorithm):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTInitAlloc_C_32f(out ppFFTSpec:PIppsFFTSpec_C_32f; order:integer; flag:integer; hint:IppHintAlgorithm):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTInitAlloc_R_32f(out ppFFTSpec:PIppsFFTSpec_R_32f; order:integer; flag:integer; hint:IppHintAlgorithm):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTInitAlloc_C_64fc(out ppFFTSpec:PIppsFFTSpec_C_64fc; order:integer; flag:integer; hint:IppHintAlgorithm):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTInitAlloc_C_64f(out ppFFTSpec:PIppsFFTSpec_C_64f; order:integer; flag:integer; hint:IppHintAlgorithm):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTInitAlloc_R_64f(out ppFFTSpec:PIppsFFTSpec_R_64f; order:integer; flag:integer; hint:IppHintAlgorithm):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTInitAlloc_C_16sc(out ppFFTSpec:PIppsFFTSpec_C_16sc; order:integer; flag:integer; hint:IppHintAlgorithm):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTInitAlloc_C_16s(out ppFFTSpec:PIppsFFTSpec_C_16s; order:integer; flag:integer; hint:IppHintAlgorithm):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTInitAlloc_R_16s(out ppFFTSpec:PIppsFFTSpec_R_16s; order:integer; flag:integer; hint:IppHintAlgorithm):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTInitAlloc_C_32sc(out ppFFTSpec:PIppsFFTSpec_C_32sc; order:integer; flag:integer; hint:IppHintAlgorithm):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTInitAlloc_C_32s(out ppFFTSpec:PIppsFFTSpec_C_32s; order:integer; flag:integer; hint:IppHintAlgorithm):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTInitAlloc_R_32s(out ppFFTSpec:PIppsFFTSpec_R_32s; order:integer; flag:integer; hint:IppHintAlgorithm):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTInitAlloc_R_16s32s(out ppFFTSpec:PIppsFFTSpec_R_16s32s; order:integer; flag:integer; hint:IppHintAlgorithm):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippsFFTFree_C, ippsFFTFree_R
//  Purpose:    Closes the DFT specification structure
//  Arguments:
//     pFFTSpec  Pointer to the FFT context structure
//  Return:
//     ippStsNoErr            No errors
//     ippStsNullPtrErr       pFFTSpec == NULL
//     ippStsContextMatchErr  Invalid context structure
}

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTFree_C_32fc(pFFTSpec:PIppsFFTSpec_C_32fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTFree_C_32f(pFFTSpec:PIppsFFTSpec_C_32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTFree_R_32f(pFFTSpec:PIppsFFTSpec_R_32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTFree_C_64fc(pFFTSpec:PIppsFFTSpec_C_64fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTFree_C_64f(pFFTSpec:PIppsFFTSpec_C_64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTFree_R_64f(pFFTSpec:PIppsFFTSpec_R_64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTFree_C_16sc(pFFTSpec:PIppsFFTSpec_C_16sc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTFree_C_16s(pFFTSpec:PIppsFFTSpec_C_16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTFree_R_16s(pFFTSpec:PIppsFFTSpec_R_16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTFree_C_32sc(pFFTSpec:PIppsFFTSpec_C_32sc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTFree_C_32s(pFFTSpec:PIppsFFTSpec_C_32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTFree_R_32s(pFFTSpec:PIppsFFTSpec_R_32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTFree_R_16s32s(pFFTSpec:PIppsFFTSpec_R_16s32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//                  FFT Buffer Size
///////////////////////////////////////////////////////////////////////////// }
{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippsFFTGetBufSize_C, ippsFFTGetBufSize_R
//  Purpose:    Computes the size of the FFT work buffer (in bytes)
//  Arguments:
//     pFFTSpec      Pointer to the FFT context structure
//     pBufferSize   Pointer to the size of the external buffer
//  Return:
//     ippStsNoErr            No errors
//     ippStsNullPtrErr       One of the specified pointers is NULL
//     ippStsContextMatchErr  Invalid context structure
}

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use Init function to get the size of the external buffer. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTGetBufSize_C_32fc(pFFTSpec:PIppsFFTSpec_C_32fc; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use Init function to get the size of the external buffer. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTGetBufSize_C_32f(pFFTSpec:PIppsFFTSpec_C_32f; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use Init function to get the size of the external buffer. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTGetBufSize_R_32f(pFFTSpec:PIppsFFTSpec_R_32f; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use Init function to get the size of the external buffer. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTGetBufSize_C_64fc(pFFTSpec:PIppsFFTSpec_C_64fc; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use Init function to get the size of the external buffer. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTGetBufSize_C_64f(pFFTSpec:PIppsFFTSpec_C_64f; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use Init function to get the size of the external buffer. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTGetBufSize_R_64f(pFFTSpec:PIppsFFTSpec_R_64f; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTGetBufSize_C_16sc(pFFTSpec:PIppsFFTSpec_C_16sc; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTGetBufSize_C_16s(pFFTSpec:PIppsFFTSpec_C_16s; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTGetBufSize_R_16s(pFFTSpec:PIppsFFTSpec_R_16s; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTGetBufSize_C_32sc(pFFTSpec:PIppsFFTSpec_C_32sc; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTGetBufSize_C_32s(pFFTSpec:PIppsFFTSpec_C_32s; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTGetBufSize_R_32s(pFFTSpec:PIppsFFTSpec_R_32s; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTGetBufSize_R_16s32s(pFFTSpec:PIppsFFTSpec_R_16s32s; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//                  FFT Complex Transforms
///////////////////////////////////////////////////////////////////////////// }
{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippsFFTFwd_CToC, ippsFFTInv_CToC
//  Purpose:    Computes forward and inverse FFT of a complex signal
//  Arguments:
//     pFFTSpec     Pointer to the FFT context
//     pSrc         Pointer to the source complex signal
//     pDst         Pointer to the destination complex signal
//     pSrcRe       Pointer to the real      part of source signal
//     pSrcIm       Pointer to the imaginary part of source signal
//     pDstRe       Pointer to the real      part of destination signal
//     pDstIm       Pointer to the imaginary part of destination signal
//     pSrcDst      Pointer to the complex signal
//     pSrcDstRe    Pointer to the real      part of signal
//     pSrcDstIm    Pointer to the imaginary part of signal
//     pBuffer      Pointer to the work buffer
//     scaleFactor  Scale factor for output result
//  Return:
//     ippStsNoErr            No errors
//     ippStsNullPtrErr       One of the specified pointers with the exception of
                              pBuffer is NULL
//     ippStsContextMatchErr  Invalid context structure
//     ippStsMemAllocErr      Memory allocation fails
}

function ippsFFTFwd_CToC_32fc(pSrc:PIpp32fc; pDst:PIpp32fc; pFFTSpec:PIppsFFTSpec_C_32fc; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFFTInv_CToC_32fc(pSrc:PIpp32fc; pDst:PIpp32fc; pFFTSpec:PIppsFFTSpec_C_32fc; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFFTFwd_CToC_32f(pSrcRe:PIpp32f; pSrcIm:PIpp32f; pDstRe:PIpp32f; pDstIm:PIpp32f; pFFTSpec:PIppsFFTSpec_C_32f; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFFTInv_CToC_32f(pSrcRe:PIpp32f; pSrcIm:PIpp32f; pDstRe:PIpp32f; pDstIm:PIpp32f; pFFTSpec:PIppsFFTSpec_C_32f; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsFFTFwd_CToC_32fc_I(pSrcDst:PIpp32fc; pFFTSpec:PIppsFFTSpec_C_32fc; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFFTInv_CToC_32fc_I(pSrcDst:PIpp32fc; pFFTSpec:PIppsFFTSpec_C_32fc; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFFTFwd_CToC_32f_I(pSrcDstRe:PIpp32f; pSrcDstIm:PIpp32f; pFFTSpec:PIppsFFTSpec_C_32f; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFFTInv_CToC_32f_I(pSrcDstRe:PIpp32f; pSrcDstIm:PIpp32f; pFFTSpec:PIppsFFTSpec_C_32f; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsFFTFwd_CToC_64fc(pSrc:PIpp64fc; pDst:PIpp64fc; pFFTSpec:PIppsFFTSpec_C_64fc; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFFTInv_CToC_64fc(pSrc:PIpp64fc; pDst:PIpp64fc; pFFTSpec:PIppsFFTSpec_C_64fc; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFFTFwd_CToC_64f(pSrcRe:PIpp64f; pSrcIm:PIpp64f; pDstRe:PIpp64f; pDstIm:PIpp64f; pFFTSpec:PIppsFFTSpec_C_64f; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFFTInv_CToC_64f(pSrcRe:PIpp64f; pSrcIm:PIpp64f; pDstRe:PIpp64f; pDstIm:PIpp64f; pFFTSpec:PIppsFFTSpec_C_64f; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsFFTFwd_CToC_64fc_I(pSrcDst:PIpp64fc; pFFTSpec:PIppsFFTSpec_C_64fc; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFFTInv_CToC_64fc_I(pSrcDst:PIpp64fc; pFFTSpec:PIppsFFTSpec_C_64fc; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFFTFwd_CToC_64f_I(pSrcDstRe:PIpp64f; pSrcDstIm:PIpp64f; pFFTSpec:PIppsFFTSpec_C_64f; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFFTInv_CToC_64f_I(pSrcDstRe:PIpp64f; pSrcDstIm:PIpp64f; pFFTSpec:PIppsFFTSpec_C_64f; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTFwd_CToC_16sc_Sfs(pSrc:PIpp16sc; pDst:PIpp16sc; pFFTSpec:PIppsFFTSpec_C_16sc; scaleFactor:integer; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTInv_CToC_16sc_Sfs(pSrc:PIpp16sc; pDst:PIpp16sc; pFFTSpec:PIppsFFTSpec_C_16sc; scaleFactor:integer; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTFwd_CToC_16s_Sfs(pSrcRe:PIpp16s; pSrcIm:PIpp16s; pDstRe:PIpp16s; pDstIm:PIpp16s; pFFTSpec:PIppsFFTSpec_C_16s; scaleFactor:integer; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTInv_CToC_16s_Sfs(pSrcRe:PIpp16s; pSrcIm:PIpp16s; pDstRe:PIpp16s; pDstIm:PIpp16s; pFFTSpec:PIppsFFTSpec_C_16s; scaleFactor:integer; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTFwd_CToC_16sc_ISfs(pSrcDst:PIpp16sc; pFFTSpec:PIppsFFTSpec_C_16sc; scaleFactor:integer; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTInv_CToC_16sc_ISfs(pSrcDst:PIpp16sc; pFFTSpec:PIppsFFTSpec_C_16sc; scaleFactor:integer; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTFwd_CToC_16s_ISfs(pSrcDstRe:PIpp16s; pSrcDstIm:PIpp16s; pFFTSpec:PIppsFFTSpec_C_16s; scaleFactor:integer; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTInv_CToC_16s_ISfs(pSrcDstRe:PIpp16s; pSrcDstIm:PIpp16s; pFFTSpec:PIppsFFTSpec_C_16s; scaleFactor:integer; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTFwd_CToC_32sc_Sfs(pSrc:PIpp32sc; pDst:PIpp32sc; pFFTSpec:PIppsFFTSpec_C_32sc; scaleFactor:integer; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTInv_CToC_32sc_Sfs(pSrc:PIpp32sc; pDst:PIpp32sc; pFFTSpec:PIppsFFTSpec_C_32sc; scaleFactor:integer; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTFwd_CToC_32s_Sfs(pSrcRe:PIpp32s; pSrcIm:PIpp32s; pDstRe:PIpp32s; pDstIm:PIpp32s; pFFTSpec:PIppsFFTSpec_C_32s; scaleFactor:integer; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTInv_CToC_32s_Sfs(pSrcRe:PIpp32s; pSrcIm:PIpp32s; pDstRe:PIpp32s; pDstIm:PIpp32s; pFFTSpec:PIppsFFTSpec_C_32s; scaleFactor:integer; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTFwd_CToC_32sc_ISfs(pSrcDst:PIpp32sc; pFFTSpec:PIppsFFTSpec_C_32sc; scaleFactor:integer; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTInv_CToC_32sc_ISfs(pSrcDst:PIpp32sc; pFFTSpec:PIppsFFTSpec_C_32sc; scaleFactor:integer; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTFwd_CToC_32s_ISfs(pSrcDstRe:PIpp32s; pSrcDstIm:PIpp32s; pFFTSpec:PIppsFFTSpec_C_32s; scaleFactor:integer; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTInv_CToC_32s_ISfs(pSrcDstRe:PIpp32s; pSrcDstIm:PIpp32s; pFFTSpec:PIppsFFTSpec_C_32s; scaleFactor:integer; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//                  FFT Real Packed Transforms
///////////////////////////////////////////////////////////////////////////// }
{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippsFFTFwd_RToPerm, ippsFFTFwd_RToPack, ippsFFTFwd_RToCCS
//              ippsFFTInv_PermToR, ippsFFTInv_PackToR, ippsFFTInv_CCSToR
//  Purpose:    Computes forward and inverse FFT of a real signal
//              using Perm, Pack or Ccs packed format
//  Arguments:
//     pFFTSpec       Pointer to the FFT context
//     pSrc           Pointer to the source signal
//     pDst           Pointer to thedestination signal
//     pSrcDst        Pointer to the source/destination signal (in-place)
//     pBuffer        Pointer to the work buffer
//     scaleFactor    Scale factor for output result
//  Return:
//     ippStsNoErr            No errors
//     ippStsNullPtrErr       One of the specified pointers with the exception of
                              pBuffer is NULL
//     ippStsContextMatchErr  Invalid context structure
//     ippStsMemAllocErr      Memory allocation fails
}

function ippsFFTFwd_RToPerm_32f(pSrc:PIpp32f; pDst:PIpp32f; pFFTSpec:PIppsFFTSpec_R_32f; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFFTFwd_RToPack_32f(pSrc:PIpp32f; pDst:PIpp32f; pFFTSpec:PIppsFFTSpec_R_32f; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFFTFwd_RToCCS_32f(pSrc:PIpp32f; pDst:PIpp32f; pFFTSpec:PIppsFFTSpec_R_32f; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFFTInv_PermToR_32f(pSrc:PIpp32f; pDst:PIpp32f; pFFTSpec:PIppsFFTSpec_R_32f; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFFTInv_PackToR_32f(pSrc:PIpp32f; pDst:PIpp32f; pFFTSpec:PIppsFFTSpec_R_32f; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFFTInv_CCSToR_32f(pSrc:PIpp32f; pDst:PIpp32f; pFFTSpec:PIppsFFTSpec_R_32f; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsFFTFwd_RToPerm_32f_I(pSrcDst:PIpp32f; pFFTSpec:PIppsFFTSpec_R_32f; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFFTFwd_RToPack_32f_I(pSrcDst:PIpp32f; pFFTSpec:PIppsFFTSpec_R_32f; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFFTFwd_RToCCS_32f_I(pSrcDst:PIpp32f; pFFTSpec:PIppsFFTSpec_R_32f; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFFTInv_PermToR_32f_I(pSrcDst:PIpp32f; pFFTSpec:PIppsFFTSpec_R_32f; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFFTInv_PackToR_32f_I(pSrcDst:PIpp32f; pFFTSpec:PIppsFFTSpec_R_32f; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFFTInv_CCSToR_32f_I(pSrcDst:PIpp32f; pFFTSpec:PIppsFFTSpec_R_32f; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsFFTFwd_RToPerm_64f(pSrc:PIpp64f; pDst:PIpp64f; pFFTSpec:PIppsFFTSpec_R_64f; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFFTFwd_RToPack_64f(pSrc:PIpp64f; pDst:PIpp64f; pFFTSpec:PIppsFFTSpec_R_64f; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFFTFwd_RToCCS_64f(pSrc:PIpp64f; pDst:PIpp64f; pFFTSpec:PIppsFFTSpec_R_64f; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFFTInv_PermToR_64f(pSrc:PIpp64f; pDst:PIpp64f; pFFTSpec:PIppsFFTSpec_R_64f; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFFTInv_PackToR_64f(pSrc:PIpp64f; pDst:PIpp64f; pFFTSpec:PIppsFFTSpec_R_64f; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFFTInv_CCSToR_64f(pSrc:PIpp64f; pDst:PIpp64f; pFFTSpec:PIppsFFTSpec_R_64f; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsFFTFwd_RToPerm_64f_I(pSrcDst:PIpp64f; pFFTSpec:PIppsFFTSpec_R_64f; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFFTFwd_RToPack_64f_I(pSrcDst:PIpp64f; pFFTSpec:PIppsFFTSpec_R_64f; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFFTFwd_RToCCS_64f_I(pSrcDst:PIpp64f; pFFTSpec:PIppsFFTSpec_R_64f; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFFTInv_PermToR_64f_I(pSrcDst:PIpp64f; pFFTSpec:PIppsFFTSpec_R_64f; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFFTInv_PackToR_64f_I(pSrcDst:PIpp64f; pFFTSpec:PIppsFFTSpec_R_64f; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFFTInv_CCSToR_64f_I(pSrcDst:PIpp64f; pFFTSpec:PIppsFFTSpec_R_64f; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTFwd_RToPerm_16s_Sfs(pSrc:PIpp16s; pDst:PIpp16s; pFFTSpec:PIppsFFTSpec_R_16s; scaleFactor:integer; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTFwd_RToPack_16s_Sfs(pSrc:PIpp16s; pDst:PIpp16s; pFFTSpec:PIppsFFTSpec_R_16s; scaleFactor:integer; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTFwd_RToCCS_16s_Sfs(pSrc:PIpp16s; pDst:PIpp16s; pFFTSpec:PIppsFFTSpec_R_16s; scaleFactor:integer; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTInv_PermToR_16s_Sfs(pSrc:PIpp16s; pDst:PIpp16s; pFFTSpec:PIppsFFTSpec_R_16s; scaleFactor:integer; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTInv_PackToR_16s_Sfs(pSrc:PIpp16s; pDst:PIpp16s; pFFTSpec:PIppsFFTSpec_R_16s; scaleFactor:integer; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTInv_CCSToR_16s_Sfs(pSrc:PIpp16s; pDst:PIpp16s; pFFTSpec:PIppsFFTSpec_R_16s; scaleFactor:integer; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTFwd_RToPerm_16s_ISfs(pSrcDst:PIpp16s; pFFTSpec:PIppsFFTSpec_R_16s; scaleFactor:integer; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTFwd_RToPack_16s_ISfs(pSrcDst:PIpp16s; pFFTSpec:PIppsFFTSpec_R_16s; scaleFactor:integer; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTFwd_RToCCS_16s_ISfs(pSrcDst:PIpp16s; pFFTSpec:PIppsFFTSpec_R_16s; scaleFactor:integer; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTInv_PermToR_16s_ISfs(pSrcDst:PIpp16s; pFFTSpec:PIppsFFTSpec_R_16s; scaleFactor:integer; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTInv_PackToR_16s_ISfs(pSrcDst:PIpp16s; pFFTSpec:PIppsFFTSpec_R_16s; scaleFactor:integer; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTInv_CCSToR_16s_ISfs(pSrcDst:PIpp16s; pFFTSpec:PIppsFFTSpec_R_16s; scaleFactor:integer; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTFwd_RToPerm_32s_Sfs(pSrc:PIpp32s; pDst:PIpp32s; pFFTSpec:PIppsFFTSpec_R_32s; scaleFactor:integer; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTFwd_RToPack_32s_Sfs(pSrc:PIpp32s; pDst:PIpp32s; pFFTSpec:PIppsFFTSpec_R_32s; scaleFactor:integer; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTFwd_RToCCS_32s_Sfs(pSrc:PIpp32s; pDst:PIpp32s; pFFTSpec:PIppsFFTSpec_R_32s; scaleFactor:integer; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTInv_PermToR_32s_Sfs(pSrc:PIpp32s; pDst:PIpp32s; pFFTSpec:PIppsFFTSpec_R_32s; scaleFactor:integer; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTInv_PackToR_32s_Sfs(pSrc:PIpp32s; pDst:PIpp32s; pFFTSpec:PIppsFFTSpec_R_32s; scaleFactor:integer; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTInv_CCSToR_32s_Sfs(pSrc:PIpp32s; pDst:PIpp32s; pFFTSpec:PIppsFFTSpec_R_32s; scaleFactor:integer; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTFwd_RToPerm_32s_ISfs(pSrcDst:PIpp32s; pFFTSpec:PIppsFFTSpec_R_32s; scaleFactor:integer; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTFwd_RToPack_32s_ISfs(pSrcDst:PIpp32s; pFFTSpec:PIppsFFTSpec_R_32s; scaleFactor:integer; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTFwd_RToCCS_32s_ISfs(pSrcDst:PIpp32s; pFFTSpec:PIppsFFTSpec_R_32s; scaleFactor:integer; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTInv_PermToR_32s_ISfs(pSrcDst:PIpp32s; pFFTSpec:PIppsFFTSpec_R_32s; scaleFactor:integer; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTInv_PackToR_32s_ISfs(pSrcDst:PIpp32s; pFFTSpec:PIppsFFTSpec_R_32s; scaleFactor:integer; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTInv_CCSToR_32s_ISfs(pSrcDst:PIpp32s; pFFTSpec:PIppsFFTSpec_R_32s; scaleFactor:integer; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTFwd_RToCCS_16s32s_Sfs(pSrc:PIpp16s; pDst:PIpp32s; pFFTSpec:PIppsFFTSpec_R_16s32s; scaleFactor:integer; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFFTInv_CCSToR_32s16s_Sfs(pSrc:PIpp32s; pDst:PIpp16s; pFFTSpec:PIppsFFTSpec_R_16s32s; scaleFactor:integer; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//                  Definitions for DFT Functions
///////////////////////////////////////////////////////////////////////////// }

type
  PIppsDFTSpec_C_16sc = ^TIppsDFTSpec_C_16sc;
  TIppsDFTSpec_C_16sc = record end;

  PIppsDFTSpec_C_16s = ^TIppsDFTSpec_C_16s;
  TIppsDFTSpec_C_16s = record end;

  PIppsDFTSpec_R_16s = ^TIppsDFTSpec_R_16s;
  TIppsDFTSpec_R_16s = record end;


  PIppsDFTSpec_C_32fc = ^TIppsDFTSpec_C_32fc;
  TIppsDFTSpec_C_32fc = record end;

  PIppsDFTSpec_C_32f = ^TIppsDFTSpec_C_32f;
  TIppsDFTSpec_C_32f = record end;

  PIppsDFTSpec_R_32f = ^TIppsDFTSpec_R_32f;
  TIppsDFTSpec_R_32f = record end;


  PIppsDFTSpec_C_64fc = ^TIppsDFTSpec_C_64fc;
  TIppsDFTSpec_C_64fc = record end;

  PIppsDFTSpec_C_64f = ^TIppsDFTSpec_C_64f;
  TIppsDFTSpec_C_64f = record end;

  PIppsDFTSpec_R_64f = ^TIppsDFTSpec_R_64f;
  TIppsDFTSpec_R_64f = record end;


  PIppsDFTOutOrdSpec_C_32fc = ^TIppsDFTOutOrdSpec_C_32fc;
  TIppsDFTOutOrdSpec_C_32fc = record end;


  PIppsDFTOutOrdSpec_C_64fc = ^TIppsDFTOutOrdSpec_C_64fc;
  TIppsDFTOutOrdSpec_C_64fc = record end;


{ /////////////////////////////////////////////////////////////////////////////
//                  DFT Context Functions
///////////////////////////////////////////////////////////////////////////// }
{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippsDFTGetSize_C, ippsDFTGetSize_R
//  Purpose:    Computes the size of the DFT context structure and the size
                of the required work buffer (in bytes)
//  Arguments:
//     length     Length of the DFT transform
//     flag       Flag to choose the results normalization factors
//     hint       Option to select the algorithmic implementation of the transform
//                function
//     pSizeSpec  Pointer to the size value of DFT specification structure
//     pSizeInit  Pointer to the size value of the buffer for DFT initialization function
//     pSizeBuf   Pointer to the size value of the DFT external work buffer
//  Return:
//     ippStsNoErr            No errors
//     ippStsNullPtrErr       One of the specified pointers is NULL
//     ippStsOrderErr         Invalid length value
//     ippStsFFTFlagErr       Incorrect normalization flag value
//     ippStsSizeErr          Indicates an error when length is less than or equal to 0
}

function ippsDFTGetSize_C_32fc(length:integer; flag:integer; hint:IppHintAlgorithm; out pSizeSpec:integer; out pSizeInit:integer; out pSizeBuf:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsDFTGetSize_C_32f(length:integer; flag:integer; hint:IppHintAlgorithm; out pSizeSpec:integer; out pSizeInit:integer; out pSizeBuf:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsDFTGetSize_R_32f(length:integer; flag:integer; hint:IppHintAlgorithm; out pSizeSpec:integer; out pSizeInit:integer; out pSizeBuf:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsDFTGetSize_C_64fc(length:integer; flag:integer; hint:IppHintAlgorithm; out pSizeSpec:integer; out pSizeInit:integer; out pSizeBuf:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsDFTGetSize_C_64f(length:integer; flag:integer; hint:IppHintAlgorithm; out pSizeSpec:integer; out pSizeInit:integer; out pSizeBuf:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsDFTGetSize_R_64f(length:integer; flag:integer; hint:IppHintAlgorithm; out pSizeSpec:integer; out pSizeInit:integer; out pSizeBuf:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
{ /////////////////////////////////////////////////////////////////////////////
//                  DFT Init Functions
///////////////////////////////////////////////////////////////////////////// }
{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippsDFTInit_C, ippsDFTInit_R
//  Purpose:    initialize of DFT context
//  Arguments:
//     length     Length of the DFT transform
//     flag       Flag to choose the results normalization factors
//     hint       Option to select the algorithmic implementation of the transform
//                function
//     pDFTSpec   Double pointer to the DFT context structure
//     pMemInit   Pointer to initialization buffer
//  Return:
//     ippStsNoErr            No errors
//     ippStsNullPtrErr       One of the specified pointers is NULL
//     ippStsOrderErr         Invalid length value
//     ippStsFFTFlagErr       Incorrect normalization flag value
//     ippStsSizeErr          Indicates an error when length is less than or equal to 0
}

function ippsDFTInit_C_32fc(length:integer; flag:integer; hint:IppHintAlgorithm; pDFTSpec:PIppsDFTSpec_C_32fc; pMemInit:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsDFTInit_C_32f(length:integer; flag:integer; hint:IppHintAlgorithm; pDFTSpec:PIppsDFTSpec_C_32f; pMemInit:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsDFTInit_R_32f(length:integer; flag:integer; hint:IppHintAlgorithm; pDFTSpec:PIppsDFTSpec_R_32f; pMemInit:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsDFTInit_C_64fc(length:integer; flag:integer; hint:IppHintAlgorithm; pDFTSpec:PIppsDFTSpec_C_64fc; pMemInit:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsDFTInit_C_64f(length:integer; flag:integer; hint:IppHintAlgorithm; pDFTSpec:PIppsDFTSpec_C_64f; pMemInit:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsDFTInit_R_64f(length:integer; flag:integer; hint:IppHintAlgorithm; pDFTSpec:PIppsDFTSpec_R_64f; pMemInit:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippsDFTInitAlloc_C, ippsDFTInitAlloc_R
//  Purpose:    Allocates and initializes the DFT specification structure
//  Arguments:
//     length     Length of the DFT transform
//     flag       Flag to choose the results normalization factors
//     hint       Option to select the algorithmic implementation of the transform
//                function
//     pDFTSpec   Double pointer to the DFT context structure
//  Return:
//     ippStsNoErr            No errors
//     ippStsNullPtrErr       pDFTSpec == NULL
//     ippStsFftOrderErr      FFT order value is illegal
//     ippStsFFTFlagErr       Incorrect normalization flag value
//     ippStsMemAllocErr      Memory allocation fails
}

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDFTInitAlloc_C_16sc(out pDFTSpec:PIppsDFTSpec_C_16sc; length:integer; flag:integer; hint:IppHintAlgorithm):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDFTInitAlloc_C_16s(out pDFTSpec:PIppsDFTSpec_C_16s; length:integer; flag:integer; hint:IppHintAlgorithm):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDFTInitAlloc_R_16s(out pDFTSpec:PIppsDFTSpec_R_16s; length:integer; flag:integer; hint:IppHintAlgorithm):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDFTInitAlloc_C_32fc(out pDFTSpec:PIppsDFTSpec_C_32fc; length:integer; flag:integer; hint:IppHintAlgorithm):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDFTInitAlloc_C_32f(out pDFTSpec:PIppsDFTSpec_C_32f; length:integer; flag:integer; hint:IppHintAlgorithm):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDFTInitAlloc_R_32f(out pDFTSpec:PIppsDFTSpec_R_32f; length:integer; flag:integer; hint:IppHintAlgorithm):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDFTInitAlloc_C_64fc(out pDFTSpec:PIppsDFTSpec_C_64fc; length:integer; flag:integer; hint:IppHintAlgorithm):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDFTInitAlloc_C_64f(out pDFTSpec:PIppsDFTSpec_C_64f; length:integer; flag:integer; hint:IppHintAlgorithm):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDFTInitAlloc_R_64f(out pDFTSpec:PIppsDFTSpec_R_64f; length:integer; flag:integer; hint:IppHintAlgorithm):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDFTOutOrdInitAlloc_C_32fc(out pDFTSpec:PIppsDFTOutOrdSpec_C_32fc; length:integer; flag:integer; hint:IppHintAlgorithm):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDFTOutOrdInitAlloc_C_64fc(out pDFTSpec:PIppsDFTOutOrdSpec_C_64fc; length:integer; flag:integer; hint:IppHintAlgorithm):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippsDFTFree_C, ippsDFTFree_R
//  Purpose:    Closes the DFT specification structure
//  Arguments:
//     pDFTSpec  Pointer to the DFT context structure
//  Returns:
//     ippStsNoErr            No errors
//     ippStsNullPtrErr       pDFTSpec == NULL
//     ippStsContextMatchErr  Invalid context structure
}

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDFTFree_C_16sc(pDFTSpec:PIppsDFTSpec_C_16sc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDFTFree_C_16s(pDFTSpec:PIppsDFTSpec_C_16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDFTFree_R_16s(pDFTSpec:PIppsDFTSpec_R_16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDFTFree_C_32fc(pDFTSpec:PIppsDFTSpec_C_32fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDFTFree_C_32f(pDFTSpec:PIppsDFTSpec_C_32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDFTFree_R_32f(pDFTSpec:PIppsDFTSpec_R_32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDFTFree_C_64fc(pDFTSpec:PIppsDFTSpec_C_64fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDFTFree_C_64f(pDFTSpec:PIppsDFTSpec_C_64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDFTFree_R_64f(pDFTSpec:PIppsDFTSpec_R_64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDFTOutOrdFree_C_32fc(pDFTSpec:PIppsDFTOutOrdSpec_C_32fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDFTOutOrdFree_C_64fc(pDFTSpec:PIppsDFTOutOrdSpec_C_64fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ /////////////////////////////////////////////////////////////////////////////
//                  DFT Buffer Size
///////////////////////////////////////////////////////////////////////////// }
{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippsDFTGetBufSize_C, ippsDFTGetBufSize_R
//  Purpose:    Computes the size of the DFT work buffer (in bytes)
//  Arguments:
//     pFFTSpec      Pointer to the DFT context structure
//     pBufferSize   Pointer to the size of the external buffer
//  Return:
//     ippStsNoErr            No errors
//     ippStsNullPtrErr       One of the specified pointers is NULL
//     ippStsContextMatchErr  Invalid context structure
}

// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDFTGetBufSize_C_16sc(pDFTSpec:PIppsDFTSpec_C_16sc; out pSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDFTGetBufSize_C_16s(pDFTSpec:PIppsDFTSpec_C_16s; out pSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDFTGetBufSize_R_16s(pDFTSpec:PIppsDFTSpec_R_16s; out pSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use Init function to get the size of the external buffer. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDFTGetBufSize_C_32fc(pDFTSpec:PIppsDFTSpec_C_32fc; out pSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use Init function to get the size of the external buffer. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDFTGetBufSize_C_32f(pDFTSpec:PIppsDFTSpec_C_32f; out pSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use Init function to get the size of the external buffer. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDFTGetBufSize_R_32f(pDFTSpec:PIppsDFTSpec_R_32f; out pSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use Init function to get the size of the external buffer. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDFTGetBufSize_C_64fc(pDFTSpec:PIppsDFTSpec_C_64fc; out pSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use Init function to get the size of the external buffer. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDFTGetBufSize_C_64f(pDFTSpec:PIppsDFTSpec_C_64f; out pSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use Init function to get the size of the external buffer. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDFTGetBufSize_R_64f(pDFTSpec:PIppsDFTSpec_R_64f; out pSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDFTOutOrdGetBufSize_C_32fc(pDFTSpec:PIppsDFTOutOrdSpec_C_32fc; out size:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDFTOutOrdGetBufSize_C_64fc(pDFTSpec:PIppsDFTOutOrdSpec_C_64fc; out size:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ /////////////////////////////////////////////////////////////////////////////
//                  DFT Complex Transforms
///////////////////////////////////////////////////////////////////////////// }
{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippsDFTFwd_CToC, ippsDFTInv_CToC
//  Purpose:    Computes forward and inverse DFT of a complex signal
//  Arguments:
//     pDFTSpec     Pointer to the DFT context
//     pSrc         Pointer to the source complex signal
//     pDst         Pointer to the destination complex signal
//     pSrcRe       Pointer to the real      part of source signal
//     pSrcIm       Pointer to the imaginary part of source signal
//     pDstRe       Pointer to the real      part of destination signal
//     pDstIm       Pointer to the imaginary part of destination signal
//     pBuffer      Pointer to the work buffer
//     scaleFactor  Scale factor for output result
//  Return:
//     ippStsNoErr            No errors
//     ippStsNullPtrErr       One of the specified pointers with the exception of
                              pBuffer is NULL
//     ippStsContextMatchErr  Invalid context structure
//     ippStsMemAllocErr      Memory allocation fails
}

// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDFTFwd_CToC_16sc_Sfs(pSrc:PIpp16sc; pDst:PIpp16sc; pDFTSpec:PIppsDFTSpec_C_16sc; scaleFactor:integer; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDFTInv_CToC_16sc_Sfs(pSrc:PIpp16sc; pDst:PIpp16sc; pDFTSpec:PIppsDFTSpec_C_16sc; scaleFactor:integer; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDFTFwd_CToC_16s_Sfs(pSrcRe:PIpp16s; pSrcIm:PIpp16s; pDstRe:PIpp16s; pDstIm:PIpp16s; pDFTSpec:PIppsDFTSpec_C_16s; scaleFactor:integer; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDFTInv_CToC_16s_Sfs(pSrcRe:PIpp16s; pSrcIm:PIpp16s; pDstRe:PIpp16s; pDstIm:PIpp16s; pDFTSpec:PIppsDFTSpec_C_16s; scaleFactor:integer; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsDFTFwd_CToC_32fc(pSrc:PIpp32fc; pDst:PIpp32fc; pDFTSpec:PIppsDFTSpec_C_32fc; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsDFTInv_CToC_32fc(pSrc:PIpp32fc; pDst:PIpp32fc; pDFTSpec:PIppsDFTSpec_C_32fc; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsDFTFwd_CToC_32f(pSrcRe:PIpp32f; pSrcIm:PIpp32f; pDstRe:PIpp32f; pDstIm:PIpp32f; pDFTSpec:PIppsDFTSpec_C_32f; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsDFTInv_CToC_32f(pSrcRe:PIpp32f; pSrcIm:PIpp32f; pDstRe:PIpp32f; pDstIm:PIpp32f; pDFTSpec:PIppsDFTSpec_C_32f; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsDFTFwd_CToC_64fc(pSrc:PIpp64fc; pDst:PIpp64fc; pDFTSpec:PIppsDFTSpec_C_64fc; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsDFTInv_CToC_64fc(pSrc:PIpp64fc; pDst:PIpp64fc; pDFTSpec:PIppsDFTSpec_C_64fc; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsDFTFwd_CToC_64f(pSrcRe:PIpp64f; pSrcIm:PIpp64f; pDstRe:PIpp64f; pDstIm:PIpp64f; pDFTSpec:PIppsDFTSpec_C_64f; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsDFTInv_CToC_64f(pSrcRe:PIpp64f; pSrcIm:PIpp64f; pDstRe:PIpp64f; pDstIm:PIpp64f; pDFTSpec:PIppsDFTSpec_C_64f; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDFTOutOrdFwd_CToC_32fc(pSrc:PIpp32fc; pDst:PIpp32fc; pDFTSpec:PIppsDFTOutOrdSpec_C_32fc; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDFTOutOrdInv_CToC_32fc(pSrc:PIpp32fc; pDst:PIpp32fc; pDFTSpec:PIppsDFTOutOrdSpec_C_32fc; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDFTOutOrdFwd_CToC_64fc(pSrc:PIpp64fc; pDst:PIpp64fc; pDFTSpec:PIppsDFTOutOrdSpec_C_64fc; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDFTOutOrdInv_CToC_64fc(pSrc:PIpp64fc; pDst:PIpp64fc; pDFTSpec:PIppsDFTOutOrdSpec_C_64fc; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ /////////////////////////////////////////////////////////////////////////////
//                  DFT Real Packed Transforms
///////////////////////////////////////////////////////////////////////////// }
{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippsDFTFwd_RToPerm, ippsDFTFwd_RToPack, ippsDFTFwd_RToCCS
//              ippsDFTInv_PermToR, ippsDFTInv_PackToR, ippsDFTInv_CCSToR
//  Purpose:    Compute forward and inverse DFT of a real signal
//              using Perm, Pack or Ccs packed format
//  Arguments:
//     pFFTSpec       Pointer to the DFT context
//     pSrc           Pointer to the source signal
//     pDst           Pointer to the destination signal
//     pSrcDst        Pointer to the source/destination signal (in-place)
//     pBuffer        Pointer to the work buffer
//     scaleFactor    Scale factor for output result
//  Return:
//     ippStsNoErr            No errors
//     ippStsNullPtrErr       One of the specified pointers with the exception of
                              pBuffer is NULL
//     ippStsContextMatchErr  Invalid context structure
//     ippStsMemAllocErr      Memory allocation fails
}

// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDFTFwd_RToPerm_16s_Sfs(pSrc:PIpp16s; pDst:PIpp16s; pDFTSpec:PIppsDFTSpec_R_16s; scaleFactor:integer; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDFTFwd_RToPack_16s_Sfs(pSrc:PIpp16s; pDst:PIpp16s; pDFTSpec:PIppsDFTSpec_R_16s; scaleFactor:integer; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDFTFwd_RToCCS_16s_Sfs(pSrc:PIpp16s; pDst:PIpp16s; pDFTSpec:PIppsDFTSpec_R_16s; scaleFactor:integer; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDFTInv_PermToR_16s_Sfs(pSrc:PIpp16s; pDst:PIpp16s; pDFTSpec:PIppsDFTSpec_R_16s; scaleFactor:integer; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDFTInv_PackToR_16s_Sfs(pSrc:PIpp16s; pDst:PIpp16s; pDFTSpec:PIppsDFTSpec_R_16s; scaleFactor:integer; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDFTInv_CCSToR_16s_Sfs(pSrc:PIpp16s; pDst:PIpp16s; pDFTSpec:PIppsDFTSpec_R_16s; scaleFactor:integer; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsDFTFwd_RToPerm_32f(pSrc:PIpp32f; pDst:PIpp32f; pDFTSpec:PIppsDFTSpec_R_32f; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsDFTFwd_RToPack_32f(pSrc:PIpp32f; pDst:PIpp32f; pDFTSpec:PIppsDFTSpec_R_32f; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsDFTFwd_RToCCS_32f(pSrc:PIpp32f; pDst:PIpp32f; pDFTSpec:PIppsDFTSpec_R_32f; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsDFTInv_PermToR_32f(pSrc:PIpp32f; pDst:PIpp32f; pDFTSpec:PIppsDFTSpec_R_32f; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsDFTInv_PackToR_32f(pSrc:PIpp32f; pDst:PIpp32f; pDFTSpec:PIppsDFTSpec_R_32f; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsDFTInv_CCSToR_32f(pSrc:PIpp32f; pDst:PIpp32f; pDFTSpec:PIppsDFTSpec_R_32f; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsDFTFwd_RToPerm_64f(pSrc:PIpp64f; pDst:PIpp64f; pDFTSpec:PIppsDFTSpec_R_64f; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsDFTFwd_RToPack_64f(pSrc:PIpp64f; pDst:PIpp64f; pDFTSpec:PIppsDFTSpec_R_64f; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsDFTFwd_RToCCS_64f(pSrc:PIpp64f; pDst:PIpp64f; pDFTSpec:PIppsDFTSpec_R_64f; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsDFTInv_PermToR_64f(pSrc:PIpp64f; pDst:PIpp64f; pDFTSpec:PIppsDFTSpec_R_64f; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsDFTInv_PackToR_64f(pSrc:PIpp64f; pDst:PIpp64f; pDFTSpec:PIppsDFTSpec_R_64f; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsDFTInv_CCSToR_64f(pSrc:PIpp64f; pDst:PIpp64f; pDFTSpec:PIppsDFTSpec_R_64f; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ /////////////////////////////////////////////////////////////////////////////
//              Vector multiplication in RCPack and in RCPerm formats
///////////////////////////////////////////////////////////////////////////// }
{ ////////////////////////////////////////////////////////////////////////////
//  Names:              ippsMulPack, ippsMulPerm
//  Purpose:            multiply two vectors stored in RCPack and RCPerm formats
//  Parameters:
//   pSrc               pointer to input vector (in-place case)
//   pSrcDst            pointer to output vector (in-place case)
//   pSrc1              pointer to first input vector
//   pSrc2              pointer to second input vector
//   pDst               pointer to output vector
//   length             vector's length
//   scaleFactor        scale factor
//  Return:
//   ippStsNullPtrErr      pointer(s) to the data is NULL
//   ippStsSizeErr         vector`s length is less or equal zero
//   ippStsNoErr           otherwise
}

// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsMulPack_16s_ISfs(pSrc:PIpp16s; pSrcDst:PIpp16s; length:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsMulPerm_16s_ISfs(pSrc:PIpp16s; pSrcDst:PIpp16s; length:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMulPack_32f_I(pSrc:PIpp32f; pSrcDst:PIpp32f; length:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMulPerm_32f_I(pSrc:PIpp32f; pSrcDst:PIpp32f; length:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMulPack_64f_I(pSrc:PIpp64f; pSrcDst:PIpp64f; length:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMulPerm_64f_I(pSrc:PIpp64f; pSrcDst:PIpp64f; length:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsMulPack_16s_Sfs(pSrc1:PIpp16s; pSrc2:PIpp16s; pDst:PIpp16s; length:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsMulPerm_16s_Sfs(pSrc1:PIpp16s; pSrc2:PIpp16s; pDst:PIpp16s; length:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMulPack_32f(pSrc1:PIpp32f; pSrc2:PIpp32f; pDst:PIpp32f; length:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMulPerm_32f(pSrc1:PIpp32f; pSrc2:PIpp32f; pDst:PIpp32f; length:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMulPack_64f(pSrc1:PIpp64f; pSrc2:PIpp64f; pDst:PIpp64f; length:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMulPerm_64f(pSrc1:PIpp64f; pSrc2:PIpp64f; pDst:PIpp64f; length:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ ////////////////////////////////////////////////////////////////////////////
//  Names:              ippsMulPackConj
//  Purpose:            multiply on a complex conjugate vector and store in RCPack format
//  Parameters:
//   pSrc               pointer to input vector (in-place case)
//   pSrcDst            pointer to output vector (in-place case)
//   length             vector's length
//  Return:
//   ippStsNullPtrErr      pointer(s) to the data is NULL
//   ippStsSizeErr         vector`s length is less or equal zero
//   ippStsNoErr           otherwise
}

function ippsMulPackConj_32f_I(pSrc:PIpp32f; pSrcDst:PIpp32f; length:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsMulPackConj_64f_I(pSrc:PIpp64f; pSrcDst:PIpp64f; length:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ /////////////////////////////////////////////////////////////////////////////
//  Names:        ippsGoertz
//  Purpose:      compute DFT for single frequency (Goertzel algorithm)
//  Parameters:
//    freq                 single relative frequency value [0, 1.0)
//    pSrc                 pointer to the input vector
//    len                  length of the vector
//    pVal                 pointer to the DFT result value computed
//    scaleFactor          scale factor value
//  Return:
//    ippStsNullPtrErr        pointer to the data is NULL
//    ippStsSizeErr           length of the vector is less or equal zero
//    ippStsRelFreqErr        frequency value out of range
//    ippStsNoErr             otherwise
}

function ippsGoertz_32fc(pSrc:PIpp32fc; len:integer; pVal:PIpp32fc; rFreq:Ipp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsGoertz_64fc(pSrc:PIpp64fc; len:integer; pVal:PIpp64fc; rFreq:Ipp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsGoertz_16sc_Sfs(pSrc:PIpp16sc; len:integer; pVal:PIpp16sc; rFreq:Ipp32f; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsGoertz_32f(pSrc:PIpp32f; len:integer; pVal:PIpp32fc; rFreq:Ipp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsGoertz_16s_Sfs(pSrc:PIpp16s; len:integer; pVal:PIpp16sc; rFreq:Ipp32f; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsGoertz_64f(pSrc:PIpp64f; len:integer; pVal:PIpp64fc; rFreq:Ipp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ /////////////////////////////////////////////////////////////////////////////
//  Names:        ippsGoertzTwo
//  Purpose:      compute DFT for dual frequency (Goertzel algorithm)
//  Parameters:
//    freq                 pointer to two relative frequency values [0, 1.0)
//    pSrc                 pointer to the input vector
//    len                  length of the vector
//    pVal                 pointer to the DFT result value computed
//    scaleFactor          scale factor value
//  Return:
//    ippStsNullPtrErr        pointer to the data is NULL
//    ippStsSizeErr           length of the vector is less or equal zero
//    ippStsRelFreqErr        frequency values out of range
//    ippStsNoErr             otherwise
}

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsGoertzTwo_32fc(pSrc:PIpp32fc; len:integer; out val:TIpp32fcArray2; var rFreq:TIpp32fArray2):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsGoertzTwo_64fc(pSrc:PIpp64fc; len:integer; out val:TIpp64fcArray2; var rFreq:TIpp64fArray2):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsGoertzTwo_16sc_Sfs(pSrc:PIpp16sc; len:integer; out val:TIpp16scArray2; var rFreq:TIpp32fArray2; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsGoertzTwo_32f(pSrc:PIpp32f; len:integer; out val:TIpp32fcArray2; var rFreq:TIpp32fArray2):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsGoertzTwo_64f(pSrc:PIpp64f; len:integer; out val:TIpp64fcArray2; var rFreq:TIpp64fArray2):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};



{ /////////////////////////////////////////////////////////////////////////////
//  Names:        ippsGoertzQ15
//  Purpose:      compute DFT for single frequency (Goertzel algorithm)
//  Parameters:
//    rFreqQ15             single relative frequency value [0, 32767]
//    pSrc                 pointer to the input vector
//    len                  length of the vector
//    pVal                 pointer to the DFT result value computed
//    scaleFactor          scale factor value
//  Return:
//    ippStsNullPtrErr        pointer to the data is NULL
//    ippStsSizeErr           length of the vector is less or equal zero
//    ippStsRelFreqErr        frequency value out of range
//    ippStsNoErr             otherwise
}

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsGoertzQ15_16sc_Sfs(pSrc:PIpp16sc; len:integer; pVal:PIpp16sc; rFreqQ15:Ipp16s; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//  Names:        ippsGoertzTwoQ15
//  Purpose:      compute DFT for dual frequency (Goertzel algorithm)
//  Parameters:
//    rFreqQ15             pointer to two relative frequency values [0, 32767]
//    pSrc                 pointer to the input vector
//    len                  length of the vector
//    pVal                 pointer to the DFT result value computed
//    scaleFactor          scale factor value
//  Return:
//    ippStsNullPtrErr        pointer to the data is NULL
//    ippStsSizeErr           length of the vector is less or equal zero
//    ippStsRelFreqErr        frequency values out of range
//    ippStsNoErr             otherwise
}

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsGoertzTwoQ15_16sc_Sfs(pSrc:PIpp16sc; len:integer; out pVal:TIpp16scArray2; var rFreqQ15:TIpp16sArray2; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ /////////////////////////////////////////////////////////////////////////////
//                  Definitions for DCT Functions
///////////////////////////////////////////////////////////////////////////// }

type
  PIppsDCTFwdSpec_16s = ^TIppsDCTFwdSpec_16s;
  TIppsDCTFwdSpec_16s = record end;

  PIppsDCTInvSpec_16s = ^TIppsDCTInvSpec_16s;
  TIppsDCTInvSpec_16s = record end;


  PIppsDCTFwdSpec_32f = ^TIppsDCTFwdSpec_32f;
  TIppsDCTFwdSpec_32f = record end;

  PIppsDCTInvSpec_32f = ^TIppsDCTInvSpec_32f;
  TIppsDCTInvSpec_32f = record end;


  PIppsDCTFwdSpec_64f = ^TIppsDCTFwdSpec_64f;
  TIppsDCTFwdSpec_64f = record end;

  PIppsDCTInvSpec_64f = ^TIppsDCTInvSpec_64f;
  TIppsDCTInvSpec_64f = record end;

{ /////////////////////////////////////////////////////////////////////////////
//                  DCT Get Size Functions
///////////////////////////////////////////////////////////////////////////// }
{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippsDCTFwdGetSize, ippsDCTInvGetSize
//  Purpose:    get sizes of the DCTSpec and buffers (on bytes)
//  Arguments:
//     len             - number of samples in DCT
//     hint            - code specific use hints
//     pSpecSize       - where write size of DCTSpec
//     pSpecBufferSize - where write size of buffer for DCTInit functions
//     pBufferSize     - where write size of buffer for DCT calculation
//  Return:
//     ippStsNoErr            no errors
//     ippStsNullPtrErr       pSpecSize == NULL or pSpecBufferSize == NULL or
//                            pBufferSize == NULL
//     ippStsSizeErr          bad the len value
}

// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDCTFwdGetSize_16s(len:integer; hint:IppHintAlgorithm; out pSpecSize:integer; out pSpecBufferSize:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDCTInvGetSize_16s(len:integer; hint:IppHintAlgorithm; out pSpecSize:integer; out pSpecBufferSize:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsDCTFwdGetSize_32f(len:integer; hint:IppHintAlgorithm; out pSpecSize:integer; out pSpecBufferSize:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsDCTInvGetSize_32f(len:integer; hint:IppHintAlgorithm; out pSpecSize:integer; out pSpecBufferSize:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsDCTFwdGetSize_64f(len:integer; hint:IppHintAlgorithm; out pSpecSize:integer; out pSpecBufferSize:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsDCTInvGetSize_64f(len:integer; hint:IppHintAlgorithm; out pSpecSize:integer; out pSpecBufferSize:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ /////////////////////////////////////////////////////////////////////////////
//                  DCT Context Functions
///////////////////////////////////////////////////////////////////////////// }
{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippsDCTFwdInit, ippsDCTInvInit
//  Purpose:    initialize of DCT context
//  Arguments:
//     len         - number of samples in DCT
//     hint        - code specific use hints
//     ppDCTSpec   - where write pointer to new context
//     pSpec       - pointer to area for DCTSpec
//     pSpecBuffer - pointer to work buffer
//  Return:
//     ippStsNoErr            no errors
//     ippStsNullPtrErr       ppDCTSpec == NULL or
//                            pSpec == NULL or pMemInit == NULL
//     ippStsSizeErr          bad the len value
}

// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDCTFwdInit_16s(out ppDCTSpec:PIppsDCTFwdSpec_16s; len:integer; hint:IppHintAlgorithm; pSpec:PIpp8u; pSpecBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDCTInvInit_16s(out ppDCTSpec:PIppsDCTInvSpec_16s; len:integer; hint:IppHintAlgorithm; pSpec:PIpp8u; pSpecBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsDCTFwdInit_32f(out ppDCTSpec:PIppsDCTFwdSpec_32f; len:integer; hint:IppHintAlgorithm; pSpec:PIpp8u; pSpecBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsDCTInvInit_32f(out ppDCTSpec:PIppsDCTInvSpec_32f; len:integer; hint:IppHintAlgorithm; pSpec:PIpp8u; pSpecBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsDCTFwdInit_64f(out ppDCTSpec:PIppsDCTFwdSpec_64f; len:integer; hint:IppHintAlgorithm; pSpec:PIpp8u; pSpecBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsDCTInvInit_64f(out ppDCTSpec:PIppsDCTInvSpec_64f; len:integer; hint:IppHintAlgorithm; pSpec:PIpp8u; pSpecBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippsDCTFwdInitAlloc, ippsDCTInvInitAlloc
//  Purpose:    create and initialize of DCT context
//  Arguments:
//     len       - number of samples in DCT
//     hint      - code specific use hints
//     ppDCTSpec - where write pointer to new context
//  Return:
//     ippStsNoErr            no errors
//     ippStsNullPtrErr       ppDCTSpec == NULL
//     ippStsSizeErr          bad the len value
//     ippStsMemAllocErr      memory allocation error
}

// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDCTFwdInitAlloc_16s(out ppDCTSpec:PIppsDCTFwdSpec_16s; len:integer; hint:IppHintAlgorithm):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDCTInvInitAlloc_16s(out ppDCTSpec:PIppsDCTInvSpec_16s; len:integer; hint:IppHintAlgorithm):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDCTFwdInitAlloc_32f(out ppDCTSpec:PIppsDCTFwdSpec_32f; len:integer; hint:IppHintAlgorithm):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDCTInvInitAlloc_32f(out ppDCTSpec:PIppsDCTInvSpec_32f; len:integer; hint:IppHintAlgorithm):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDCTFwdInitAlloc_64f(out ppDCTSpec:PIppsDCTFwdSpec_64f; len:integer; hint:IppHintAlgorithm):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDCTInvInitAlloc_64f(out ppDCTSpec:PIppsDCTInvSpec_64f; len:integer; hint:IppHintAlgorithm):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippsDCTFwdFree, ippsDCTInvFree
//  Purpose:    delete DCT context
//  Arguments:
//     pDCTSpec - pointer to DCT context to be deleted
//  Return:
//     ippStsNoErr            no errors
//     ippStsNullPtrErr       pDCTSpec == NULL
//     ippStsContextMatchErr  bad context identifier
}

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDCTFwdFree_16s(pDCTSpec:PIppsDCTFwdSpec_16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDCTInvFree_16s(pDCTSpec:PIppsDCTInvSpec_16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDCTFwdFree_32f(pDCTSpec:PIppsDCTFwdSpec_32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDCTInvFree_32f(pDCTSpec:PIppsDCTInvSpec_32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDCTFwdFree_64f(pDCTSpec:PIppsDCTFwdSpec_64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDCTInvFree_64f(pDCTSpec:PIppsDCTInvSpec_64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ /////////////////////////////////////////////////////////////////////////////
//                  DCT Buffer Size
///////////////////////////////////////////////////////////////////////////// }
{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippsDCTFwdGetBufSize, ippsDCTInvGetBufSize
//  Purpose:    get size of the DCT work buffer (on bytes)
//  Arguments:
//     pDCTSpec    - pointer to the DCT structure
//     pBufferSize - pointer to the DCT work buffer size value
//  Return:
//     ippStsNoErr            no errors
//     ippStsNullPtrErr       pDCTSpec == NULL or pSize == NULL
//     ippStsContextMatchErr  bad context identifier
}

// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDCTFwdGetBufSize_16s(pDCTSpec:PIppsDCTFwdSpec_16s; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDCTInvGetBufSize_16s(pDCTSpec:PIppsDCTInvSpec_16s; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use Init function to get the size of the external buffer. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDCTFwdGetBufSize_32f(pDCTSpec:PIppsDCTFwdSpec_32f; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use Init function to get the size of the external buffer. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDCTInvGetBufSize_32f(pDCTSpec:PIppsDCTInvSpec_32f; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use Init function to get the size of the external buffer. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDCTFwdGetBufSize_64f(pDCTSpec:PIppsDCTFwdSpec_64f; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use Init function to get the size of the external buffer. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDCTInvGetBufSize_64f(pDCTSpec:PIppsDCTInvSpec_64f; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ /////////////////////////////////////////////////////////////////////////////
//                  DCT Transforms
///////////////////////////////////////////////////////////////////////////// }
{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippsDCTFwd, ippsDCTInv
//  Purpose:    compute forward and inverse DCT of signal
//  Arguments:
//     pDCTSpec - pointer to DCT context
//     pSrc     - pointer to source signal
//     pDst     - pointer to destination signal
//     pSrcDst  - pointer to signal
//     pBuffer  - pointer to work buffer
//     scaleFactor
//              - scale factor for output result
//  Return:
//     ippStsNoErr            no errors
//     ippStsNullPtrErr       pDCTSpec == NULL or
//                            pSrc == NULL or pDst == NULL or pSrcDst == NULL
//     ippStsContextMatchErr  bad context identifier
//     ippStsMemAllocErr      memory allocation error
}

// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDCTFwd_16s_Sfs(pSrc:PIpp16s; pDst:PIpp16s; pDCTSpec:PIppsDCTFwdSpec_16s; scaleFactor:integer; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDCTInv_16s_Sfs(pSrc:PIpp16s; pDst:PIpp16s; pDCTSpec:PIppsDCTInvSpec_16s; scaleFactor:integer; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDCTFwd_16s_ISfs(pSrcDst:PIpp16s; pDCTSpec:PIppsDCTFwdSpec_16s; scaleFactor:integer; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Integer APIs for linear transforms are obsolete and will be removed in one of the future IPP releases. All linear-transform functions are FP internally - use FP variant of this function. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDCTInv_16s_ISfs(pSrcDst:PIpp16s; pDCTSpec:PIppsDCTInvSpec_16s; scaleFactor:integer; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsDCTFwd_32f(pSrc:PIpp32f; pDst:PIpp32f; pDCTSpec:PIppsDCTFwdSpec_32f; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsDCTInv_32f(pSrc:PIpp32f; pDst:PIpp32f; pDCTSpec:PIppsDCTInvSpec_32f; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsDCTFwd_32f_I(pSrcDst:PIpp32f; pDCTSpec:PIppsDCTFwdSpec_32f; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsDCTInv_32f_I(pSrcDst:PIpp32f; pDCTSpec:PIppsDCTInvSpec_32f; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsDCTFwd_64f(pSrc:PIpp64f; pDst:PIpp64f; pDCTSpec:PIppsDCTFwdSpec_64f; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsDCTInv_64f(pSrc:PIpp64f; pDst:PIpp64f; pDCTSpec:PIppsDCTInvSpec_64f; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsDCTFwd_64f_I(pSrcDst:PIpp64f; pDCTSpec:PIppsDCTFwdSpec_64f; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsDCTInv_64f_I(pSrDst:PIpp64f; pDCTSpec:PIppsDCTInvSpec_64f; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ /////////////////////////////////////////////////////////////////////////////
//          Wavelet Transform Functions for Fixed Filter Banks
///////////////////////////////////////////////////////////////////////////// }
{ //////////////////////////////////////////////////////////////////////
// Name:       ippsWTHaar
// Purpose:    one level Haar Wavelet Transform
// Arguments:
//   pSrc        - source vector;
//   len         - length of source vector;
//   pDstLow     - coarse "low frequency" component destination;
//   pDstHigh    - detail "high frequency" component destination;
//   pSrcLow     - coarse "low frequency" component source;
//   pSrcHigh    - detail "high frequency" component source;
//   pDst        - destination vector;
//   scaleFactor - scale factor value
//  Return:
//   ippStsNullPtrErr    pointer(s) to the data vector is NULL
//   ippStsSizeErr       the length is less or equal zero
//   ippStsNoErr         otherwise
}

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsWTHaarFwd_8s(pSrc:PIpp8s; len:integer; pDstLow:PIpp8s; pDstHigh:PIpp8s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsWTHaarFwd_16s(pSrc:PIpp16s; len:integer; pDstLow:PIpp16s; pDstHigh:PIpp16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsWTHaarFwd_32s(pSrc:PIpp32s; len:integer; pDstLow:PIpp32s; pDstHigh:PIpp32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsWTHaarFwd_64s(pSrc:PIpp64s; len:integer; pDstLow:PIpp64s; pDstHigh:PIpp64s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsWTHaarFwd_32f(pSrc:PIpp32f; len:integer; pDstLow:PIpp32f; pDstHigh:PIpp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsWTHaarFwd_64f(pSrc:PIpp64f; len:integer; pDstLow:PIpp64f; pDstHigh:PIpp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsWTHaarFwd_8s_Sfs(pSrc:PIpp8s; len:integer; pDstLow:PIpp8s; pDstHigh:PIpp8s; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsWTHaarFwd_16s_Sfs(pSrc:PIpp16s; len:integer; pDstLow:PIpp16s; pDstHigh:PIpp16s; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsWTHaarFwd_32s_Sfs(pSrc:PIpp32s; len:integer; pDstLow:PIpp32s; pDstHigh:PIpp32s; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsWTHaarFwd_64s_Sfs(pSrc:PIpp64s; len:integer; pDstLow:PIpp64s; pDstHigh:PIpp64s; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsWTHaarInv_8s(pSrcLow:PIpp8s; pSrcHigh:PIpp8s; pDst:PIpp8s; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsWTHaarInv_16s(pSrcLow:PIpp16s; pSrcHigh:PIpp16s; pDst:PIpp16s; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsWTHaarInv_32s(pSrcLow:PIpp32s; pSrcHigh:PIpp32s; pDst:PIpp32s; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsWTHaarInv_64s(pSrcLow:PIpp64s; pSrcHigh:PIpp64s; pDst:PIpp64s; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsWTHaarInv_32f(pSrcLow:PIpp32f; pSrcHigh:PIpp32f; pDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsWTHaarInv_64f(pSrcLow:PIpp64f; pSrcHigh:PIpp64f; pDst:PIpp64f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsWTHaarInv_8s_Sfs(pSrcLow:PIpp8s; pSrcHigh:PIpp8s; pDst:PIpp8s; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsWTHaarInv_16s_Sfs(pSrcLow:PIpp16s; pSrcHigh:PIpp16s; pDst:PIpp16s; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsWTHaarInv_32s_Sfs(pSrcLow:PIpp32s; pSrcHigh:PIpp32s; pDst:PIpp32s; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsWTHaarInv_64s_Sfs(pSrcLow:PIpp64s; pSrcHigh:PIpp64s; pDst:PIpp64s; len:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ /////////////////////////////////////////////////////////////////////////////
//          Wavelet Transform Fucntions for User Filter Banks
///////////////////////////////////////////////////////////////////////////// }

type
  PIppsWTFwdState_32f = ^TIppsWTFwdState_32f;
  TIppsWTFwdState_32f = record end;

  PIppsWTFwdState_8s32f = ^TIppsWTFwdState_8s32f;
  TIppsWTFwdState_8s32f = record end;

  PIppsWTFwdState_8u32f = ^TIppsWTFwdState_8u32f;
  TIppsWTFwdState_8u32f = record end;

  PIppsWTFwdState_16s32f = ^TIppsWTFwdState_16s32f;
  TIppsWTFwdState_16s32f = record end;

  PIppsWTFwdState_16u32f = ^TIppsWTFwdState_16u32f;
  TIppsWTFwdState_16u32f = record end;

  PIppsWTInvState_32f = ^TIppsWTInvState_32f;
  TIppsWTInvState_32f = record end;

  PIppsWTInvState_32f8s = ^TIppsWTInvState_32f8s;
  TIppsWTInvState_32f8s = record end;

  PIppsWTInvState_32f8u = ^TIppsWTInvState_32f8u;
  TIppsWTInvState_32f8u = record end;

  PIppsWTInvState_32f16s = ^TIppsWTInvState_32f16s;
  TIppsWTInvState_32f16s = record end;

  PIppsWTInvState_32f16u = ^TIppsWTInvState_32f16u;
  TIppsWTInvState_32f16u = record end;

{ //////////////////////////////////////////////////////////////////////
// Name:        ippsWTFwdInitAlloc_32f, ippsWTFwdInitAlloc_8s32f,
//              ippsWTFwdInitAlloc_8u32f, ippsWTFwdInitAlloc_16s32f,
//              ippsWTFwdInitAlloc_16u32f
//
// Purpose:     Allocate and initialize
//                forward wavelet transform pState structure.
// Parameters:
//   pState    - pointer to pointer to allocated and initialized
//                pState structure.
//   pTapsLow  - pointer to lowpass filter taps;
//   lenLow    - length of lowpass filter;
//   offsLow   - input delay of lowpass filter;
//   pTapsHigh - pointer to highpass filter taps;
//   lenHigh   - length of highpass filter;
//   offsHigh  - input delay of highpass filter;
//
// Returns:
//   ippStsNoErr        - Ok;
//   ippStsNullPtrErr   - pointer to filter taps are NULL
//                          or pointer to pState structure is NULL;
//   ippStsSizeErr      - filter length is less or equal zero;
//   ippStsWtOffsetErr  - filter delay is less than (-1).
//
// Notes:   filter input delay minimum value is (-1) that corresponds to
//            downsampling phase equal 1 (first sample excluded,
//            second included and so on);
}
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsWTFwdInitAlloc_32f(out pState:PIppsWTFwdState_32f; pTapsLow:PIpp32f; lenLow:integer; offsLow:integer; pTapsHigh:PIpp32f; lenHigh:integer; offsHigh:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsWTFwdInitAlloc_8s32f(out pState:PIppsWTFwdState_8s32f; pTapsLow:PIpp32f; lenLow:integer; offsLow:integer; pTapsHigh:PIpp32f; lenHigh:integer; offsHigh:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsWTFwdInitAlloc_8u32f(out pState:PIppsWTFwdState_8u32f; pTapsLow:PIpp32f; lenLow:integer; offsLow:integer; pTapsHigh:PIpp32f; lenHigh:integer; offsHigh:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsWTFwdInitAlloc_16s32f(out pState:PIppsWTFwdState_16s32f; pTapsLow:PIpp32f; lenLow:integer; offsLow:integer; pTapsHigh:PIpp32f; lenHigh:integer; offsHigh:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsWTFwdInitAlloc_16u32f(out pState:PIppsWTFwdState_16u32f; pTapsLow:PIpp32f; lenLow:integer; offsLow:integer; pTapsHigh:PIpp32f; lenHigh:integer; offsHigh:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ //////////////////////////////////////////////////////////////////////
// Name:        ippsWTFwdSetDlyLine_32f, ippsWTFwdSetDlyLine_8s32f,
//              ippsWTFwdSetDlyLine_8u32f, ippsWTFwdSetDlyLine_16s32f,
//              ippsWTFwdSetDlyLine_16u32f
//
// Purpose:     The function copies the pointed vectors to internal delay lines.
//
// Parameters:
//   pState   - pointer to pState structure;
//   pDlyLow  - pointer to delay line for lowpass filtering;
//   pDlyHigh - pointer to delay line for highpass filtering.
//
// Returns:
//   ippStsNoErr            - Ok;
//   ippStsNullPtrErr       - some of pointers pDlyLow
//                              or pDlyHigh vectors are NULL;
//   ippStspStateMatchErr   - mismatch pState structure.
//
// Notes: lengths of delay lines:
//          len(pDlyLow)  = lenLow  + offsLow  - 1;
//          len(pDlyHigh) = lenHigh + offsHigh - 1;
//  lenLow, offsLow, lenHigh, offsHigh - parameters
//    for ippsWTFwdInitAlloc function.
}
function ippsWTFwdSetDlyLine_32f(pState:PIppsWTFwdState_32f; pDlyLow:PIpp32f; pDlyHigh:PIpp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsWTFwdSetDlyLine_8s32f(pState:PIppsWTFwdState_8s32f; pDlyLow:PIpp32f; pDlyHigh:PIpp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsWTFwdSetDlyLine_8u32f(pState:PIppsWTFwdState_8u32f; pDlyLow:PIpp32f; pDlyHigh:PIpp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsWTFwdSetDlyLine_16s32f(pState:PIppsWTFwdState_16s32f; pDlyLow:PIpp32f; pDlyHigh:PIpp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsWTFwdSetDlyLine_16u32f(pState:PIppsWTFwdState_16u32f; pDlyLow:PIpp32f; pDlyHigh:PIpp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ //////////////////////////////////////////////////////////////////////
// Name:        ippsWTFwdGetDlyLine_32f, ippsWTFwdGetDlyLine_8s32f,
//              ippsWTFwdGetDlyLine_8u32f, ippsWTFwdGetDlyLine_16s32f,
//              ippsWTFwdGetDlyLine_16u32f
//
// Purpose:     The function copies data from interanl delay lines
//                to the pointed vectors.
// Parameters:
//   pState   - pointer to pState structure;
//   pDlyLow  - pointer to delay line for lowpass filtering;
//   pDlyHigh - pointer to delay line for highpass filtering.
//
// Returns:
//   ippStsNoErr            - Ok;
//   ippStsNullPtrErr       - some of pointers pDlyLow
//                              or pDlyHigh vectors are NULL;
//   ippStspStateMatchErr   - mismatch pState structure.
//
// Notes: lengths of delay lines:
//          len(pDlyLow)  = lenLow  + offsLow  - 1;
//          len(pDlyHigh) = lenHigh + offsHigh - 1;
//  lenLow, offsLow, lenHigh, offsHigh - parameters
//    for ippsWTFwdInitAlloc function.
}
function ippsWTFwdGetDlyLine_32f(pState:PIppsWTFwdState_32f; pDlyLow:PIpp32f; pDlyHigh:PIpp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsWTFwdGetDlyLine_8s32f(pState:PIppsWTFwdState_8s32f; pDlyLow:PIpp32f; pDlyHigh:PIpp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsWTFwdGetDlyLine_8u32f(pState:PIppsWTFwdState_8u32f; pDlyLow:PIpp32f; pDlyHigh:PIpp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsWTFwdGetDlyLine_16s32f(pState:PIppsWTFwdState_16s32f; pDlyLow:PIpp32f; pDlyHigh:PIpp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsWTFwdGetDlyLine_16u32f(pState:PIppsWTFwdState_16u32f; pDlyLow:PIpp32f; pDlyHigh:PIpp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ //////////////////////////////////////////////////////////////////////
// Name:        ippsWTFwd_32f, ippsWTFwd_16s32f, ippsWTFwd_16u32f,
//              ippsWTFwd_8s32f, ippsWTFwd_8u32f
//
// Purpose:     Forward wavelet transform.
//
// Parameters:
//   pSrc     - pointer to source block of data;
//   pDstLow  - pointer to destination block of
//                "low-frequency" component;
//   pDstHigh - pointer to destination block of
//                "high-frequency" component;
//   dstLen   - length of destination;
//   pState    - pointer to pState structure.
//
//  Returns:
//   ippStsNoErr            - Ok;
//   ippStsNullPtrErr       - some of pointers to pSrc, pDstLow
//                              or pDstHigh vectors are NULL;
//   ippStsSizeErr          - the length is less or equal zero;
//   ippStspStateMatchErr    - mismatch pState structure.
//
// Notes:      source block length must be 2 * dstLen.
}
function ippsWTFwd_32f(pSrc:PIpp32f; pDstLow:PIpp32f; pDstHigh:PIpp32f; dstLen:integer; pState:PIppsWTFwdState_32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsWTFwd_8s32f(pSrc:PIpp8s; pDstLow:PIpp32f; pDstHigh:PIpp32f; dstLen:integer; pState:PIppsWTFwdState_8s32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsWTFwd_8u32f(pSrc:PIpp8u; pDstLow:PIpp32f; pDstHigh:PIpp32f; dstLen:integer; pState:PIppsWTFwdState_8u32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsWTFwd_16s32f(pSrc:PIpp16s; pDstLow:PIpp32f; pDstHigh:PIpp32f; dstLen:integer; pState:PIppsWTFwdState_16s32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsWTFwd_16u32f(pSrc:PIpp16u; pDstLow:PIpp32f; pDstHigh:PIpp32f; dstLen:integer; pState:PIppsWTFwdState_16u32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ //////////////////////////////////////////////////////////////////////
// Name:        ippsWTFwdFree_32f, ippsWTFwdFree_8s32f, ippsWTFwdFree_8u32f,
//              ippsWTFwdFree_16s32f, ippsWTFwdFree_16u32f
//
// Purpose:     Free and Deallocate forward wavelet transofrm pState structure.
//
// Parameters:
//   IppsWTFwdState_32f *pState - pointer to pState structure.
//
//  Returns:
//   ippStsNoErr            - Ok;
//   ippStsNullPtrErr       - Pointer to pState structure is NULL;
//   ippStspStateMatchErr   - Mismatch pState structure.
//
// Notes:      if pointer to pState is NULL, ippStsNoErr will be returned.
}
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsWTFwdFree_32f(pState:PIppsWTFwdState_32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsWTFwdFree_8s32f(pState:PIppsWTFwdState_8s32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsWTFwdFree_8u32f(pState:PIppsWTFwdState_8u32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsWTFwdFree_16s32f(pState:PIppsWTFwdState_16s32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsWTFwdFree_16u32f(pState:PIppsWTFwdState_16u32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ //////////////////////////////////////////////////////////////////////
// Name:        ippsWTInvInitAlloc_32f,   ippsWTInvInitAlloc_32f8s,
//              ippsWTInvInitAlloc_32f8u, ippsWTInvInitAlloc_32f16s,
//              ippsWTInvInitAlloc_32f16u
//
// Purpose:     Allocate and initialize
//                inverse wavelet transform pState structure.
// Parameters:
//   pState    - pointer to pointer to allocated and initialized
//                pState structure.
//   pTapsLow  - pointer to lowpass filter taps;
//   lenLow    - length of lowpass filter;
//   offsLow   - input delay of lowpass filter;
//   pTapsHigh - pointer to highpass filter taps;
//   lenHigh   - length of highpass filter;
//   offsHigh  - input delay of highpass filter;
//
// Returns:
//   ippStsNoErr        - Ok;
//   ippStsNullPtrErr   - pointer to filter taps are NULL
//                          or pointer to pState structure is NULL;
//   ippStsSizeErr      - filter length is less or equal zero;
//   ippStsWtOffsetErr  - filter delay is less than (-1).
//
// Notes:       filter output delay minimum value is 0 that corresponds to
//             upsampling phase equal 0 (first sample included,
//                                          second sample is zero and so on);
//              pointer to returned error status may be NULL if no error
//             diagnostic required.
}
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsWTInvInitAlloc_32f(out pState:PIppsWTInvState_32f; pTapsLow:PIpp32f; lenLow:integer; offsLow:integer; pTapsHigh:PIpp32f; lenHigh:integer; offsHigh:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsWTInvInitAlloc_32f8s(out pState:PIppsWTInvState_32f8s; pTapsLow:PIpp32f; lenLow:integer; offsLow:integer; pTapsHigh:PIpp32f; lenHigh:integer; offsHigh:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsWTInvInitAlloc_32f8u(out pState:PIppsWTInvState_32f8u; pTapsLow:PIpp32f; lenLow:integer; offsLow:integer; pTapsHigh:PIpp32f; lenHigh:integer; offsHigh:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsWTInvInitAlloc_32f16s(out pState:PIppsWTInvState_32f16s; pTapsLow:PIpp32f; lenLow:integer; offsLow:integer; pTapsHigh:PIpp32f; lenHigh:integer; offsHigh:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsWTInvInitAlloc_32f16u(out pState:PIppsWTInvState_32f16u; pTapsLow:PIpp32f; lenLow:integer; offsLow:integer; pTapsHigh:PIpp32f; lenHigh:integer; offsHigh:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ //////////////////////////////////////////////////////////////////////
// Name:        ippsWTInvSetDlyLine_32f, ippsWTInvSetDlyLine_32f8s,
//              ippsWTInvSetDlyLine_32f8u, ippsWTInvSetDlyLine_32f16s,
//              ippsWTInvSetDlyLine_32f16u
//
// Purpose:     The function copies the pointed vectors to internal delay lines.
//
// Parameters:
//   pState   - pointer to pState structure;
//   pDlyLow  - pointer to delay line for lowpass filtering;
//   pDlyHigh - pointer to delay line for highpass filtering.
//
// Returns:
//   ippStsNoErr            - Ok;
//   ippStsNullPtrErr       - some of pointers pDlyLow
//                              or pDlyHigh vectors are NULL;
//   ippStspStateMatchErr   - mismatch pState structure.
//
// Notes: lengths of delay lines (as "C" expression):
//          len(pDlyLow)  = (lenLow   + offsLow  - 1) / 2;
//          len(pDlyHigh) = (lenHigh  + offsHigh - 1) / 2;
//  lenLow, offsLow, lenHigh, offsHigh - parameters
//    for ippsWTInvInitAlloc function.
}
function ippsWTInvSetDlyLine_32f(pState:PIppsWTInvState_32f; pDlyLow:PIpp32f; pDlyHigh:PIpp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsWTInvSetDlyLine_32f8s(pState:PIppsWTInvState_32f8s; pDlyLow:PIpp32f; pDlyHigh:PIpp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsWTInvSetDlyLine_32f8u(pState:PIppsWTInvState_32f8u; pDlyLow:PIpp32f; pDlyHigh:PIpp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsWTInvSetDlyLine_32f16s(pState:PIppsWTInvState_32f16s; pDlyLow:PIpp32f; pDlyHigh:PIpp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsWTInvSetDlyLine_32f16u(pState:PIppsWTInvState_32f16u; pDlyLow:PIpp32f; pDlyHigh:PIpp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ //////////////////////////////////////////////////////////////////////
// Name:        ippsWTInvGetDlyLine_32f, ippsWTInvGetDlyLine_32f8s,
//              ippsWTInvGetDlyLine_32f8u, ippsWTInvGetDlyLine_32f16s,
//              ippsWTInvGetDlyLine_32f16u
//
// Purpose:     The function copies data from interanl delay lines
//                to the pointed vectors.
// Parameters:
//   pState   - pointer to pState structure;
//   pDlyLow  - pointer to delay line for lowpass filtering;
//   pDlyHigh - pointer to delay line for highpass filtering.
//
// Returns:
//   ippStsNoErr            - Ok;
//   ippStsNullPtrErr       - some of pointers pDlyLow
//                              or pDlyHigh vectors are NULL;
//   ippStspStateMatchErr    - mismatch pState structure.
//
// Notes: lengths of delay lines (as "C" expression):
//          len(pDlyLow)  = (lenLow   + offsLow  - 1) / 2;
//          len(pDlyHigh) = (lenHigh  + offsHigh - 1) / 2;
//  lenLow, offsLow, lenHigh, offsHigh - parameters
//    for ippsWTInvInitAlloc function.
}
function ippsWTInvGetDlyLine_32f(pState:PIppsWTInvState_32f; pDlyLow:PIpp32f; pDlyHigh:PIpp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsWTInvGetDlyLine_32f8s(pState:PIppsWTInvState_32f8s; pDlyLow:PIpp32f; pDlyHigh:PIpp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsWTInvGetDlyLine_32f8u(pState:PIppsWTInvState_32f8u; pDlyLow:PIpp32f; pDlyHigh:PIpp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsWTInvGetDlyLine_32f16s(pState:PIppsWTInvState_32f16s; pDlyLow:PIpp32f; pDlyHigh:PIpp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsWTInvGetDlyLine_32f16u(pState:PIppsWTInvState_32f16u; pDlyLow:PIpp32f; pDlyHigh:PIpp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ //////////////////////////////////////////////////////////////////////
// Name:        ippsWTInv_32f, ippsWTInv_32f16s, ippsWTInv_32f16u,
//              ippsWTInv_32f8s, ippsWTInv_32f8u
//
// Purpose:     Inverse wavelet transform.
//
// Parameters:
//   srcLow  - pointer to source block of
//               "low-frequency" component;
//   srcHigh - pointer to source block of
//               "high-frequency" component;
//   dstLen  - length of components.
//   dst     - pointer to destination block of
//               reconstructed data;
//   pState  - pointer to pState structure;
//
//  Returns:
//   ippStsNoErr            - Ok;
//   ippStsNullPtrErr       - some of pointers to pDst pSrcLow
//                              or pSrcHigh vectors are NULL;
//   ippStsSizeErr          - the length is less or equal zero;
//   ippStspStateMatchErr    - mismatch pState structure.
//
// Notes:      destination block length must be 2 * srcLen.
}

function ippsWTInv_32f(pSrcLow:PIpp32f; pSrcHigh:PIpp32f; srcLen:integer; pDst:PIpp32f; pState:PIppsWTInvState_32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsWTInv_32f8s(pSrcLow:PIpp32f; pSrcHigh:PIpp32f; srcLen:integer; pDst:PIpp8s; pState:PIppsWTInvState_32f8s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsWTInv_32f8u(pSrcLow:PIpp32f; pSrcHigh:PIpp32f; srcLen:integer; pDst:PIpp8u; pState:PIppsWTInvState_32f8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsWTInv_32f16s(pSrcLow:PIpp32f; pSrcHigh:PIpp32f; srcLen:integer; pDst:PIpp16s; pState:PIppsWTInvState_32f16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsWTInv_32f16u(pSrcLow:PIpp32f; pSrcHigh:PIpp32f; srcLen:integer; pDst:PIpp16u; pState:PIppsWTInvState_32f16u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ //////////////////////////////////////////////////////////////////////
// Name:        ippsWTInvFree_32f, ippsWTInvFree_32f8s, ippsWTInvFree_32f8u,
//              ippsWTInvFree_32f16s, ippsWTInvFree_32f16u
//
// Purpose:     Free and Deallocate inverse wavelet transofrm pState structure.
//
// Parameters:
//   IppsWTInvState_32f *pState - pointer to pState structure.
//
//  Returns:
//   ippStsNoErr            - Ok;
//   ippStsNullPtrErr       - Pointer to pState structure is NULL;
//   ippStspStateMatchErr   - Mismatch pState structure.
//
// Notes:      if pointer to pState is NULL, ippStsNoErr will be returned.
}
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsWTInvFree_32f(pState:PIppsWTInvState_32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsWTInvFree_32f8s(pState:PIppsWTInvState_32f8s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsWTInvFree_32f8u(pState:PIppsWTInvState_32f8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsWTInvFree_32f16s(pState:PIppsWTInvState_32f16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsWTInvFree_32f16u(pState:PIppsWTInvState_32f16u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};



{ /////////////////////////////////////////////////////////////////////////////
//                  Filtering
///////////////////////////////////////////////////////////////////////////// }


{ /////////////////////////////////////////////////////////////////////////////
//                  Convolution functions
///////////////////////////////////////////////////////////////////////////// }

{ /////////////////////////////////////////////////////////////////////////////
//  Names:  ippsConvolveGetBufferSize
//
//  Purpose:     Get the size (in bytes) of the buffer for ippsConvolve's internal calculations.
//
//  Parameters:
//    src1Len     - Length of the first source vector.
//    src2Len     - Length of the second source vector.
//    dataType    - Data type for convolution (Ipp32f|Ipp64f).
//    algType     - Selector for the algorithm type. Contains IppAlgType values.
//    pBufferSize - Pointer to the calculated buffer size (in bytes).
//  Return:
//   ippStsNoErr       - OK
//   ippStsNullPtrErr  - pBufferSize is NULL.
//   ippStsSizeErr     - Vector's length is not positive.
//   ippStsDataTypeErr - Unsupported data type.
//   ippStsAlgTypeErr - Unsupported algorithm type.
}

function ippsConvolveGetBufferSize(src1Len:integer; src2Len:integer; dataType:IppDataType; algType:IppEnum; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ /////////////////////////////////////////////////////////////////////////////
// Name:       ippsConvolve_32f, ippsConvolve_64f
// Purpose:    Perform a linear convolution of 1D signals.
// Parameters:
//    pSrc1   - Pointer to the first source vector.
//    src1Len - Length of the first source vector.
//    pSrc2   - Pointer to the second source vector.
//    src2Len - Length of the second source vector.
//    pDst    - Pointer to the destination vector.
//    algType - Selector for the algorithm type. Contains IppAlgType values.
//    pBuffer - Pointer to the buffer for internal calculations.
// Returns:    IppStatus
//    ippStsNoErr       - OK.
//    ippStsNullPtrErr  - One of the pointers is NULL.
//    ippStsSizeErr     - Vector's length is not positive.
//    ippStsAlgTypeErr  - Unsupported algorithm type.
//  Notes:
//          Length of the destination data vector is src1Len+src2Len-1.
//          The input signals are exchangeable because of the commutative
//          property of convolution.
//          Some other values may be returned the by FFT transform functions.
}

function ippsConvolve_32f(pSrc1:PIpp32f; src1Len:integer; pSrc2:PIpp32f; src2Len:integer; pDst:PIpp32f; algType:IppEnum; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsConvolve_64f(pSrc1:PIpp64f; src1Len:integer; pSrc2:PIpp64f; src2Len:integer; pDst:PIpp64f; algType:IppEnum; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippsConv
//  Purpose:    Linear Convolution of 1D signals
//  Parameters:
//      pSrc1                pointer to the first source vector
//      pSrc2                pointer to the second source vector
//      lenSrc1              length of the first source vector
//      lenSrc2              length of the second source vector
//      pDst                 pointer to the destination vector
//  Returns:    IppStatus
//      ippStsNullPtrErr        pointer(s) to the data is NULL
//      ippStsSizeErr           length of the vectors is less or equal zero
//      ippStsMemAllocErr       no memory for internal buffers
//      ippStsNoErr             otherwise
//  Notes:
//          Length of the destination data vector is lenSrc1+lenSrc2-1.
//          The input signal are exchangeable because of
//          commutative convolution property.
//          Some other values may be returned by FFT transform functions
}

// DEPRECATED. Removal 2H 2014 or later. Replace with ippsConvolve_32f. For more details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsConv_32f(pSrc1:PIpp32f; lenSrc1:integer; pSrc2:PIpp32f; lenSrc2:integer; pDst:PIpp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Removal 2H 2014 or later. Replace with ippsConvolve_64f. For more details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsConv_64f(pSrc1:PIpp64f; lenSrc1:integer; pSrc2:PIpp64f; lenSrc2:integer; pDst:PIpp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use ippsConvert_16s32f and ippsConvolve_32f instead of this one. For more details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsConv_16s_Sfs(pSrc1:PIpp16s; lenSrc1:integer; pSrc2:PIpp16s; lenSrc2:integer; pDst:PIpp16s; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippsConvBiased_32f
//  Purpose:    Linear Convolution of 1D signals whith a bias.
//  Parameters:
//      pSrc1               pointer to the first source vector
//      pSrc2               pointer to the second source vector
//      lenSrc1             length of the first source vector
//      lenSrc2             length of the second source vector
//      pDst                pointer to the destination vector
//      lenDst              length of the destination vector
//      bias
//  Returns:    IppStatus
//      ippStsNullPtrErr        pointer(s) to the data is NULL
//      ippStsSizeErr           length of the vectors is less or equal zero
//      ippStsNoErr             otherwise
}

function ippsConvBiased_32f(pSrc1:PIpp32f; len1:integer; pSrc2:PIpp32f; len2:integer; pDst:PIpp32f; lenDst:integer; bias:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//  Names:      ippsConvCyclic
//  Purpose:    Cyclic Convolution of 1D signals of fixed size
//  Parameters: the pointers to data of fixed size
//  Returns:    IppStatus
//                ippStsNoErr    parameters are not checked
//  Notes:
//          The length of the convolution is given in the function name.
}

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsConvCyclic8x8_32f(x:PIpp32f; h:PIpp32f; y:PIpp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsConvCyclic8x8_16s_Sfs(x:PIpp16s; h:PIpp16s; y:PIpp16s; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsConvCyclic4x4_32f32fc(x:PIpp32f; h:PIpp32fc; y:PIpp32fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};



{ /////////////////////////////////////////////////////////////////////////////
//                     IIR filters (float and double taps versions)
///////////////////////////////////////////////////////////////////////////// }

type
  PIppsIIRState_32f = ^TIppsIIRState_32f;
  TIppsIIRState_32f = record end;

  PIppsIIRState_32fc = ^TIppsIIRState_32fc;
  TIppsIIRState_32fc = record end;

  PIppsIIRState32f_16s = ^TIppsIIRState32f_16s;
  TIppsIIRState32f_16s = record end;

  PIppsIIRState32fc_16sc = ^TIppsIIRState32fc_16sc;
  TIppsIIRState32fc_16sc = record end;

  PIppsIIRState_64f = ^TIppsIIRState_64f;
  TIppsIIRState_64f = record end;

  PIppsIIRState_64fc = ^TIppsIIRState_64fc;
  TIppsIIRState_64fc = record end;

  PIppsIIRState64f_32f = ^TIppsIIRState64f_32f;
  TIppsIIRState64f_32f = record end;

  PIppsIIRState64fc_32fc = ^TIppsIIRState64fc_32fc;
  TIppsIIRState64fc_32fc = record end;

  PIppsIIRState64f_32s = ^TIppsIIRState64f_32s;
  TIppsIIRState64f_32s = record end;

  PIppsIIRState64fc_32sc = ^TIppsIIRState64fc_32sc;
  TIppsIIRState64fc_32sc = record end;

  PIppsIIRState64f_16s = ^TIppsIIRState64f_16s;
  TIppsIIRState64f_16s = record end;

  PIppsIIRState64fc_16sc = ^TIppsIIRState64fc_16sc;
  TIppsIIRState64fc_16sc = record end;

  PIppsIIRState32s_16s = ^TIppsIIRState32s_16s;
  TIppsIIRState32s_16s = record end;

  PIppsIIRState32sc_16sc = ^TIppsIIRState32sc_16sc;
  TIppsIIRState32sc_16sc = record end;

type
  PPIppsIIRState_32f = ^PIppsIIRState_32f;
  PPIppsIIRState64f_32s = ^PIppsIIRState64f_32s;


{ /////////////////////////////////////////////////////////////////////////////
//  Initialize context
///////////////////////////////////////////////////////////////////////////// }
{ /////////////////////////////////////////////////////////////////////////////
//  Names:     ippsIIRInitAlloc, ippsIIRFree
//  Purpose:       initialize context arbitrary order IIR filter
//  Parameters:
//      ppState     - double pointer to filter context
//      pState      - pointer to filter context
//      pTaps       - pointer to filter coefficients
//      order       - arbitrary filter order
//      pDelay      - pointer to delay line data, can be NULL
//  Return: IppStatus
//      ippStsMemAllocErr    - memory allocation error
//      ippStsNullPtrErr     - pointer(s) to the data is NULL
//      ippStsIIROrderErr    - filter order < 0
//      ippStsDivByZeroErr   - A(0) is zero
//      ippStsContextMatchErr  - wrong context identifier
//      ippStsNoErr          - otherwise
//  Order of the coefficients in the input taps buffer:
//     B(0),B(1),B(2)..,B(order);
//     A(0),A(1),A(2)..,A(order);
//     . . .
//  Note:
//      A(0) != 0
//      ippsIIRClose function works for both AR and BQ contexts
}

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRInitAlloc_32f(out ppState:PIppsIIRState_32f; pTaps:PIpp32f; order:integer; pDlyLine:PIpp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRInitAlloc_32fc(out ppState:PIppsIIRState_32fc; pTaps:PIpp32fc; order:integer; pDlyLine:PIpp32fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRInitAlloc32f_16s(out ppState:PIppsIIRState32f_16s; pTaps:PIpp32f; order:integer; pDlyLine:PIpp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRInitAlloc32fc_16sc(out ppState:PIppsIIRState32fc_16sc; pTaps:PIpp32fc; order:integer; pDlyLine:PIpp32fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRInitAlloc_64f(out ppState:PIppsIIRState_64f; pTaps:PIpp64f; order:integer; pDlyLine:PIpp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRInitAlloc_64fc(out ppState:PIppsIIRState_64fc; pTaps:PIpp64fc; order:integer; pDlyLine:PIpp64fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRInitAlloc64f_32f(out ppState:PIppsIIRState64f_32f; pTaps:PIpp64f; order:integer; pDlyLine:PIpp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRInitAlloc64fc_32fc(out ppState:PIppsIIRState64fc_32fc; pTaps:PIpp64fc; order:integer; pDlyLine:PIpp64fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRInitAlloc64f_32s(out ppState:PIppsIIRState64f_32s; pTaps:PIpp64f; order:integer; pDlyLine:PIpp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRInitAlloc64fc_32sc(out ppState:PIppsIIRState64fc_32sc; pTaps:PIpp64fc; order:integer; pDlyLine:PIpp64fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRInitAlloc64f_16s(out ppState:PIppsIIRState64f_16s; pTaps:PIpp64f; order:integer; pDlyLine:PIpp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRInitAlloc64fc_16sc(out ppState:PIppsIIRState64fc_16sc; pTaps:PIpp64fc; order:integer; pDlyLine:PIpp64fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRFree_32f(pState:PIppsIIRState_32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRFree_32fc(pState:PIppsIIRState_32fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRFree32f_16s(pState:PIppsIIRState32f_16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRFree32fc_16sc(pState:PIppsIIRState32fc_16sc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRFree_64f(pState:PIppsIIRState_64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRFree_64fc(pState:PIppsIIRState_64fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRFree64f_32f(pState:PIppsIIRState64f_32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRFree64fc_32fc(pState:PIppsIIRState64fc_32fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRFree64f_32s(pState:PIppsIIRState64f_32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRFree64fc_32sc(pState:PIppsIIRState64fc_32sc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRFree64f_16s(pState:PIppsIIRState64f_16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRFree64fc_16sc(pState:PIppsIIRState64fc_16sc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//  Names:     ippsIIRInitAlloc_BiQuad
//  Purpose:   initialize biquad numBq-section filter
//  Parameters:
//      ppState     - double pointer to filter context
//      pTaps       - pointer to filter coefficients
//      numBq       - number biquads of BQ filter
//      pDelay      - pointer to delay line data, can be NULL
//  Return: IppStatus
//      ippStsMemAllocErr  - memory allocation error
//      ippStsNullPtrErr   - pointer(s) ppState or pTaps is NULL
//      ippStsIIROrderErr  - numBq <= 0
//      ippStsDivByZeroErr - A(n,0) or B(n,0) is zero
//      ippStsNoErr        - otherwise
//
//  Order of the coefficients in the input taps buffer:
//     B(0,0),B(0,1),B(0,2),A(0,0),A(0,1),A(0,2);
//     B(1,0),B(1,1),B(1,2),A(1,0),A(1,1),A(1,2);
//     . . .
//  Notice:
//      A(n,0) != 0 and B(n,0) != 0
}

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRInitAlloc_BiQuad_32f(out ppState:PIppsIIRState_32f; pTaps:PIpp32f; numBq:integer; pDlyLine:PIpp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRInitAlloc_BiQuad_32fc(out ppState:PIppsIIRState_32fc; pTaps:PIpp32fc; numBq:integer; pDlyLine:PIpp32fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRInitAlloc32f_BiQuad_16s(out ppState:PIppsIIRState32f_16s; pTaps:PIpp32f; numBq:integer; pDlyLine:PIpp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRInitAlloc32fc_BiQuad_16sc(out ppState:PIppsIIRState32fc_16sc; pTaps:PIpp32fc; numBq:integer; pDlyLine:PIpp32fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRInitAlloc_BiQuad_64f(out ppState:PIppsIIRState_64f; pTaps:PIpp64f; numBq:integer; pDlyLine:PIpp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRInitAlloc_BiQuad_64fc(out ppState:PIppsIIRState_64fc; pTaps:PIpp64fc; numBq:integer; pDlyLine:PIpp64fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRInitAlloc64f_BiQuad_32f(out ppState:PIppsIIRState64f_32f; pTaps:PIpp64f; numBq:integer; pDlyLine:PIpp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRInitAlloc64fc_BiQuad_32fc(out ppState:PIppsIIRState64fc_32fc; pTaps:PIpp64fc; numBq:integer; pDlyLine:PIpp64fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRInitAlloc64f_BiQuad_32s(out ppState:PIppsIIRState64f_32s; pTaps:PIpp64f; numBq:integer; pDlyLine:PIpp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRInitAlloc64fc_BiQuad_32sc(out ppState:PIppsIIRState64fc_32sc; pTaps:PIpp64fc; numBq:integer; pDlyLine:PIpp64fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRInitAlloc64f_BiQuad_16s(out ppState:PIppsIIRState64f_16s; pTaps:PIpp64f; numBq:integer; pDlyLine:PIpp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRInitAlloc64fc_BiQuad_16sc(out ppState:PIppsIIRState64fc_16sc; pTaps:PIpp64fc; numBq:integer; pDlyLine:PIpp64fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//  Names:     ippsIIRInitAlloc_BiQuad_DF1
//  Purpose:   initialize biquad numBq-section DF1 filter
//  Parameters:
//      ppState     - double pointer to filter context
//      pTaps       - pointer to filter coefficients
//      numBq       - number biquads of BQ filter
//      pDelay      - pointer to delay line data, can be NULL
//  Return: IppStatus
//      ippStsMemAllocErr  - memory allocation error
//      ippStsNullPtrErr   - pointer(s) ppState or pTaps is NULL
//      ippStsIIROrderErr  - numBq <= 0
//      ippStsDivByZeroErr - A(n,0) or B(n,0) is zero
//      ippStsNoErr        - otherwise
//
//  Order of the coefficients in the input taps buffer:
//    pTaps = B[0,0], B[0,1], B[0,2], A[0,0], A[0,1], A[0,2],
//            B[1,0], B[1,1], B[1,2], A[1,0], A[1,1], A[1,2],
//            ...
//            B[n,0], B[n,1], B[n,2], A[n,0], A[n,1], A[n,2]
//            ( n = numBq-1 );
//
//    pDLyLine = X[0,-2], X[0,-1], Y[0,-2], Y[0,-1],
//               X[1,-2], X[1,-1], Y[1,-2], Y[1,-1],
//               ...
//               X[n,-2], X[n,-1], Y[n,-2], Y[n,-1],
//               ( n = numBq-1 );
//     . . .
//  Notice:
//      A(n,0) != 0
//
//    Y[i] = X[i-2]*B[0,2] + X[i-1]*B[0,1] + X[i]*B[0,0] -
//           - Y[i-1]*A[0,1] - Y[i-2]*A[0,2];
//    Z[i] = Y[i];
//    Y[i] = Z[i-2]*B[1,2] + Z[i-1]*B[1,1] + Z[i]*B[1,0] -
//             - Y[i-1]*A[1,1] - Y[i-2]*A[1,2];
//    Z[i] = Y[i];
//    ...
//    Y[i] = Z[i-2]*B[j,2] + Z[i-1]*B[j,1] + Z[i]*B[j,0] -
//             - Y[i-1]*A[j,1] - Y[i-2]*A[j,2];
//    Z[i] = Y[i];
//    ...
//    Y[i] = Z[i-2]*B[n,2] + Z[i-1]*B[n,1] + Z[i]*B[n,0] -
//             - Y[i-1]*A[n,1] - Y[i-2]*A[n,2]; (n=numBq-1)
//    pDst[i] = Y[i];
}
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRInitAlloc_BiQuad_DF1_32f(out pState:PIppsIIRState_32f; pTaps:PIpp32f; numBq:integer; pDlyLine:PIpp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRInitAlloc64f_BiQuad_DF1_32s(out ppState:PIppsIIRState64f_32s; pTaps:PIpp64f; numBq:integer; pDlyLine:PIpp32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};



{ /////////////////////////////////////////////////////////////////////////////
//  Work with Delay Line
///////////////////////////////////////////////////////////////////////////// }
{ /////////////////////////////////////////////////////////////////////////////
//  Names:      ippsIIRGetDlyLine, ippsIIRSetDlyLine
//  Purpose:    set and get delay line
//  Parameters:
//      pState              - pointer to IIR filter context
//      pDelay              - pointer to delay line to be set
//  Return:
//      ippStsContextMatchErr  - wrong context identifier
//      ippStsNullPtrErr       - pointer(s) pState or pDelay is NULL
//      ippStsNoErr            - otherwise
}

function ippsIIRGetDlyLine_32f(pState:PIppsIIRState_32f; pDlyLine:PIpp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIRSetDlyLine_32f(pState:PIppsIIRState_32f; pDlyLine:PIpp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsIIRGetDlyLine_32fc(pState:PIppsIIRState_32fc; pDlyLine:PIpp32fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIRSetDlyLine_32fc(pState:PIppsIIRState_32fc; pDlyLine:PIpp32fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsIIRGetDlyLine32f_16s(pState:PIppsIIRState32f_16s; pDlyLine:PIpp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIRSetDlyLine32f_16s(pState:PIppsIIRState32f_16s; pDlyLine:PIpp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsIIRGetDlyLine32fc_16sc(pState:PIppsIIRState32fc_16sc; pDlyLine:PIpp32fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIRSetDlyLine32fc_16sc(pState:PIppsIIRState32fc_16sc; pDlyLine:PIpp32fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsIIRGetDlyLine_64f(pState:PIppsIIRState_64f; pDlyLine:PIpp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIRSetDlyLine_64f(pState:PIppsIIRState_64f; pDlyLine:PIpp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsIIRGetDlyLine_64fc(pState:PIppsIIRState_64fc; pDlyLine:PIpp64fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIRSetDlyLine_64fc(pState:PIppsIIRState_64fc; pDlyLine:PIpp64fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsIIRGetDlyLine64f_32f(pState:PIppsIIRState64f_32f; pDlyLine:PIpp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIRSetDlyLine64f_32f(pState:PIppsIIRState64f_32f; pDlyLine:PIpp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsIIRGetDlyLine64fc_32fc(pState:PIppsIIRState64fc_32fc; pDlyLine:PIpp64fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIRSetDlyLine64fc_32fc(pState:PIppsIIRState64fc_32fc; pDlyLine:PIpp64fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsIIRGetDlyLine64f_32s(pState:PIppsIIRState64f_32s; pDlyLine:PIpp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIRSetDlyLine64f_32s(pState:PIppsIIRState64f_32s; pDlyLine:PIpp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsIIRGetDlyLine64fc_32sc(pState:PIppsIIRState64fc_32sc; pDlyLine:PIpp64fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIRSetDlyLine64fc_32sc(pState:PIppsIIRState64fc_32sc; pDlyLine:PIpp64fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsIIRGetDlyLine64f_16s(pState:PIppsIIRState64f_16s; pDlyLine:PIpp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIRSetDlyLine64f_16s(pState:PIppsIIRState64f_16s; pDlyLine:PIpp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsIIRGetDlyLine64fc_16sc(pState:PIppsIIRState64fc_16sc; pDlyLine:PIpp64fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIRSetDlyLine64fc_16sc(pState:PIppsIIRState64fc_16sc; pDlyLine:PIpp64fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsIIRGetDlyLine64f_DF1_32s(pState:PIppsIIRState64f_32s; pDlyLine:PIpp32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIRSetDlyLine64f_DF1_32s(pState:PIppsIIRState64f_32s; pDlyLine:PIpp32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ /////////////////////////////////////////////////////////////////////////////
//  Filtering
///////////////////////////////////////////////////////////////////////////// }
{ /////////////////////////////////////////////////////////////////////////////
//  Names:           ippsIIROne
//  Purpose:         IIR filter with float or double taps. One sample operation
//  Parameters:
//      pState              - pointer to IIR filter context
//      src                 - input sample
//      pDstVal             - output sample
//      scaleFactor         - scale factor value
//  Return:
//      ippStsContextMatchErr  - wrong context identifier
//      ippStsNullPtrErr       - pointer(s) to the data is NULL
//      ippStsNoErr            - otherwise
//
//  Note: Don't modify scaleFactor value unless context is changed
}

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use vector function with vector length = 1 instead. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIROne_32f(src:Ipp32f; pDstVal:PIpp32f; pState:PIppsIIRState_32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use vector function with vector length = 1 instead. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIROne_32fc(src:Ipp32fc; pDstVal:PIpp32fc; pState:PIppsIIRState_32fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use vector function with vector length = 1 instead. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIROne32f_16s_Sfs(src:Ipp16s; pDstVal:PIpp16s; pState:PIppsIIRState32f_16s; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use vector function with vector length = 1 instead. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIROne32fc_16sc_Sfs(src:Ipp16sc; pDstVal:PIpp16sc; pState:PIppsIIRState32fc_16sc; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use vector function with vector length = 1 instead. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIROne_64f(src:Ipp64f; pDstVal:PIpp64f; pState:PIppsIIRState_64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use vector function with vector length = 1 instead. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIROne_64fc(src:Ipp64fc; pDstVal:PIpp64fc; pState:PIppsIIRState_64fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use vector function with vector length = 1 instead. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIROne64f_32f(src:Ipp32f; pDstVal:PIpp32f; pState:PIppsIIRState64f_32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use vector function with vector length = 1 instead. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIROne64fc_32fc(src:Ipp32fc; pDstVal:PIpp32fc; pState:PIppsIIRState64fc_32fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use vector function with vector length = 1 instead. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIROne64f_32s_Sfs(src:Ipp32s; pDstVal:PIpp32s; pState:PIppsIIRState64f_32s; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use vector function with vector length = 1 instead. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIROne64fc_32sc_Sfs(src:Ipp32sc; pDstVal:PIpp32sc; pState:PIppsIIRState64fc_32sc; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use vector function with vector length = 1 instead. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIROne64f_16s_Sfs(src:Ipp16s; pDstVal:PIpp16s; pState:PIppsIIRState64f_16s; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use vector function with vector length = 1 instead. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIROne64fc_16sc_Sfs(src:Ipp16sc; pDstVal:PIpp16sc; pState:PIppsIIRState64fc_16sc; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//  Names:         ippsIIR
//  Purpose:       IIR filter with float or double taps. Vector filtering
//  Parameters:
//      pState              - pointer to filter context
//      pSrcDst             - pointer to input/output vector in in-place ops
//      pSrc                - pointer to input vector
//      pDst                - pointer to output vector
//      len                 - length of the vectors
//      scaleFactor         - scale factor value
//  Return:
//      ippStsContextMatchErr  - wrong context identifier
//      ippStsNullPtrErr       - pointer(s) to the data is NULL
//      ippStsSizeErr          - length of the vectors <= 0
//      ippStsNoErr            - otherwise
//
//  Note: Don't modify scaleFactor value unless context is changed
}

function ippsIIR_32f(pSrc:PIpp32f; pDst:PIpp32f; len:integer; pState:PIppsIIRState_32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIR_32f_I(pSrcDst:PIpp32f; len:integer; pState:PIppsIIRState_32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIR_32fc(pSrc:PIpp32fc; pDst:PIpp32fc; len:integer; pState:PIppsIIRState_32fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIR_32fc_I(pSrcDst:PIpp32fc; len:integer; pState:PIppsIIRState_32fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsIIR32f_16s_Sfs(pSrc:PIpp16s; pDst:PIpp16s; len:integer; pState:PIppsIIRState32f_16s; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIR32f_16s_ISfs(pSrcDst:PIpp16s; len:integer; pState:PIppsIIRState32f_16s; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIR32fc_16sc_Sfs(pSrc:PIpp16sc; pDst:PIpp16sc; len:integer; pState:PIppsIIRState32fc_16sc; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIR32fc_16sc_ISfs(pSrcDst:PIpp16sc; len:integer; pState:PIppsIIRState32fc_16sc; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsIIR_64f(pSrc:PIpp64f; pDst:PIpp64f; len:integer; pState:PIppsIIRState_64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIR_64f_I(pSrcDst:PIpp64f; len:integer; pState:PIppsIIRState_64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIR_64fc(pSrc:PIpp64fc; pDst:PIpp64fc; len:integer; pState:PIppsIIRState_64fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIR_64fc_I(pSrcDst:PIpp64fc; len:integer; pState:PIppsIIRState_64fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsIIR64f_32f(pSrc:PIpp32f; pDst:PIpp32f; len:integer; pState:PIppsIIRState64f_32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIR64f_32f_I(pSrcDst:PIpp32f; len:integer; pState:PIppsIIRState64f_32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIR64fc_32fc(pSrc:PIpp32fc; pDst:PIpp32fc; len:integer; pState:PIppsIIRState64fc_32fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIR64fc_32fc_I(pSrcDst:PIpp32fc; len:integer; pState:PIppsIIRState64fc_32fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsIIR64f_32s_Sfs(pSrc:PIpp32s; pDst:PIpp32s; len:integer; pState:PIppsIIRState64f_32s; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIR64f_32s_ISfs(pSrcDst:PIpp32s; len:integer; pState:PIppsIIRState64f_32s; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIR64fc_32sc_Sfs(pSrc:PIpp32sc; pDst:PIpp32sc; len:integer; pState:PIppsIIRState64fc_32sc; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIR64fc_32sc_ISfs(pSrcDst:PIpp32sc; len:integer; pState:PIppsIIRState64fc_32sc; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsIIR64f_16s_Sfs(pSrc:PIpp16s; pDst:PIpp16s; len:integer; pState:PIppsIIRState64f_16s; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIR64f_16s_ISfs(pSrcDst:PIpp16s; len:integer; pState:PIppsIIRState64f_16s; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIR64fc_16sc_Sfs(pSrc:PIpp16sc; pDst:PIpp16sc; len:integer; pState:PIppsIIRState64fc_16sc; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIR64fc_16sc_ISfs(pSrcDst:PIpp16sc; len:integer; pState:PIppsIIRState64fc_16sc; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//  Names:         ippsIIR_32f_P, ippsIIR64f_32s_P
//  Purpose:       IIR filter for multi-channel data. Vector filtering.
//  Parameters:
//      ppSrc               - pointer to array of pointers to source vectors
//      ppDst               - pointer to array of pointers to destination vectors
//      ppSrcDst            - pointer to array of source/destination vectors in in-place ops
//      len                 - length of the vectors
//      nChannels           - number of processing channels
//      ppState             - pointer to array of filter contexts
//  Return:
//      ippStsContextMatchErr  - wrong context identifier
//      ippStsNullPtrErr       - pointer(s) to the data is NULL
//      ippStsSizeErr          - length of the vectors <= 0
//      ippStsChannelErr       - number of processing channels <= 0
//      ippStsNoErr            - otherwise
//
}
function ippsIIR_32f_P(ppSrc:PPIpp32f; ppDst:PPIpp32f; len:integer; nChannels:integer; ppState:PPIppsIIRState_32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIR_32f_IP(ppSrcDst:PPIpp32f; len:integer; nChannels:integer; ppState:PPIppsIIRState_32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIR64f_32s_PSfs(ppSrc:PPIpp32s; ppDst:PPIpp32s; len:integer; nChannels:integer; ppState:PPIppsIIRState64f_32s; pScaleFactor:PInteger):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIR64f_32s_IPSfs(ppSrcDst:PPIpp32s; len:integer; nChannels:integer; ppState:PPIppsIIRState64f_32s; pScaleFactor:PInteger):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};



{ /////////////////////////////////////////////////////////////////////////////
//                     IIR filters (integer taps version)
///////////////////////////////////////////////////////////////////////////// }


{ /////////////////////////////////////////////////////////////////////////////
//  Initialize context
///////////////////////////////////////////////////////////////////////////// }
{ /////////////////////////////////////////////////////////////////////////////
//  Names:         ippsIIRInitAlloc, ippsIIRInitAlloc_BiQuad, ippsIIRFree
//  Purpose:       create and initialize IIR context for AR filter
//  Parameters:
//      ppState     - double pointer to filter context
//      pState      - pointer to filter context
//      pTaps       - pointer to filter coefficients
//      order       - arbitrary filter order
//      tapsFactor  - scale factor for Ipp32s context taps
//      numBq       - number of biquads in BQ filter
//      pDelay      - pointer to delay line, may be NULL
//  Return:
//      ippStsNoErr        - Ok
//      ippStsMemAllocErr  - memory allocate error
//      ippStsNullPtrErr   - pointer(s) to ppState, pState or pTaps is NULL
//      ippStsIIROrderErr  - filter order < 0 or numBq <= 0
//      ippStsDivByZeroErr - A(0) or A(n,0) or B(n,0) is zero
//
//  the Ipp32s taps from the source Ipp32f taps and taps factor
//  may be prepared by this way, for example
//
//   ippsAbs_64f( taps, tmp, 6 );
//   ippsMax_64f( tmp, 6, &tmax );
//
//   tapsfactor = 0;
//   if( tmax > IPP_MAX_32S )
//      while( (tmax/=2) > IPP_MAX_32S ) ++tapsfactor;
//   else
//      while( (tmax*=2) < IPP_MAX_32S ) --tapsfactor;
//
//   if( tapsfactor > 0 )
//      ippsDivC_64f_I( (float)(1<<(++tapsfactor)), taps, 6 );
//   else if( tapsfactor < 0 )
//      ippsMulC_64f_I( (float)(1<<(-(tapsfactor))), taps, 6 );
//
//   ippsConvert_64f32s_Sfs ( taps, taps32s, 6, ippRndNear, 0 );
//
//  Order of coefficients is:
//     B(0),B(1),...,B(order),A(0),A(1),...,A(order)
//  A(0) != 0
}

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRInitAlloc32s_16s(out ppState:PIppsIIRState32s_16s; pTaps:PIpp32s; order:integer; tapsFactor:integer; pDlyLine:PIpp32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRInitAlloc32s_16s32f(out ppState:PIppsIIRState32s_16s; pTaps:PIpp32f; order:integer; pDlyLine:PIpp32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRInitAlloc32sc_16sc(out ppState:PIppsIIRState32sc_16sc; pTaps:PIpp32sc; order:integer; tapsFactor:integer; pDlyLine:PIpp32sc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRInitAlloc32sc_16sc32fc(out ppState:PIppsIIRState32sc_16sc; pTaps:PIpp32fc; order:integer; pDlyLine:PIpp32sc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRInitAlloc32s_BiQuad_16s(out ppState:PIppsIIRState32s_16s; pTaps:PIpp32s; numBq:integer; tapsFactor:integer; pDlyLine:PIpp32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRInitAlloc32s_BiQuad_16s32f(out ppState:PIppsIIRState32s_16s; pTaps:PIpp32f; numBq:integer; pDlyLine:PIpp32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRInitAlloc32sc_BiQuad_16sc(out ppState:PIppsIIRState32sc_16sc; pTaps:PIpp32sc; numBq:integer; tapsFactor:integer; pDlyLine:PIpp32sc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRInitAlloc32sc_BiQuad_16sc32fc(out ppState:PIppsIIRState32sc_16sc; pTaps:PIpp32fc; numBq:integer; pDlyLine:PIpp32sc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRFree32s_16s(pState:PIppsIIRState32s_16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRFree32sc_16sc(pState:PIppsIIRState32sc_16sc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ /////////////////////////////////////////////////////////////////////////////
//  Work with Delay Line
///////////////////////////////////////////////////////////////////////////// }
{ /////////////////////////////////////////////////////////////////////////////
//  Names:      ippsIIRGetDlyLine, ippsIIRSetDlyLine
//  Purpose:    set and get delay line
//  Parameters:
//      pState              - pointer to IIR filter context
//      pDelay              - pointer to delay line to be set
//  Return:
//      ippStsContextMatchErr  - wrong context identifier
//      ippStsNullPtrErr       - pointer(s) to the data is NULL
//      ippStsNoErr            - otherwise
}

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRGetDlyLine32s_16s(pState:PIppsIIRState32s_16s; pDlyLine:PIpp32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRSetDlyLine32s_16s(pState:PIppsIIRState32s_16s; pDlyLine:PIpp32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRGetDlyLine32sc_16sc(pState:PIppsIIRState32sc_16sc; pDlyLine:PIpp32sc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRSetDlyLine32sc_16sc(pState:PIppsIIRState32sc_16sc; pDlyLine:PIpp32sc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//  Filtering
///////////////////////////////////////////////////////////////////////////// }
{ /////////////////////////////////////////////////////////////////////////////
//  Names:         ippsIIROne
//  Purpose:       IIR filter. One sample operation
//  Parameters:
//      pState              - pointer to the filter context
//      src                 - the input sample
//      pDstVal             - pointer to the output sample
//      scaleFactor         - scale factor value
//  Return:
//      ippStsContextMatchErr  - wrong context
//      ippStsNullPtrErr       - pointer(s) to pState or pDstVal is NULL
//      ippStsNoErr            - otherwise
//
//  Note: Don't modify scaleFactor value unless context is changed
}

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIROne32s_16s_Sfs(src:Ipp16s; pDstVal:PIpp16s; pState:PIppsIIRState32s_16s; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIROne32sc_16sc_Sfs(src:Ipp16sc; pDstVal:PIpp16sc; pState:PIppsIIRState32sc_16sc; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//  Names:        ippsIIR
//  Purpose:      IIR filter. Vector filtering
//  Parameters:
//      pState              - pointer to the filter context
//      pSrc                - pointer to input data
//      pSrcDst             - pointer to input/ouput data
//      pDst                - pointer to output data
//      len                 - length of the vectors
//      scaleFactor         - scale factor value
//  Return:
//      ippStsContextMatchErr  - wrong context
//      ippStsNullPtrErr       - pointer(s) pState or pSrc or pDst is NULL
//      ippStsSizeErr          - length of the vectors <= 0
//      ippStsNoErr            - otherwise
//
//  Note: Don't modify scaleFactor value unless context is changed
}

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIR32s_16s_Sfs(pSrc:PIpp16s; pDst:PIpp16s; len:integer; pState:PIppsIIRState32s_16s; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIR32sc_16sc_Sfs(pSrc:PIpp16sc; pDst:PIpp16sc; len:integer; pState:PIppsIIRState32sc_16sc; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIR32s_16s_ISfs(pSrcDst:PIpp16s; len:integer; pState:PIppsIIRState32s_16s; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIR32sc_16sc_ISfs(pSrcDst:PIpp16sc; len:integer; pState:PIppsIIRState32sc_16sc; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//  Names:  ippsIIR_Direct_16s, ippsIIR_Direct_16s_I,
//          ippsIIROne_Direct_16s, ippsIIROne_Direct_16s_I,
//          ippsIIR_BiQuadDirect_16s, ippsIIR_BiQuadDirect_16s_I,
//          ippsIIROne_BiQuadDirect_16s, ippsIIROne_BiQuadDirect_16s_I.
//  Purpose: IIR filter with 16s taps. One sample (with suffix One), or vector
//           operation, direct (without State structure) form. Suffix "BiQuad"
//           means numBq-section filter, else the arbitrary coefficients IIR
//           filter.
//  Parameters:
//      pSrc        - pointer to the input array.
//      src         - input sample in 'One' case.
//      pDst        - pointer to the output array.
//      pDstVal     - pointer to the output sample in 'One' case.
//      pSrcDst     - pointer to the input and output array for the in-place
//                                                                   operation.
//      pSrcDstVal  - pointer to the input and output sample for in-place
//                                                     operation in 'One' case.
//      pTaps       - pointer to filter coefficients
//      order       - arbitrary filter order
//      numBq       - number biquads of BQ filter
//      pDlyLine    - pointer to delay line data
//  Return: IppStatus
//      ippStsNullPtrErr    - pointer(s) to the data is NULL
//      ippStsIIROrderErr   - filter order < 0
//      ippStsScaleRangeErr - if A(0) < 0, see "Note..."
//      ippStsMemAllocErr   - memory allocation error
//      ippStsSizeErr       - length of the vectors <= 0
//      ippStsNoErr         - otherwise
//
//  Order of the coefficients in the input taps buffer for the arbitrary
//                                                                      filter:
//     B(0),B(1),B(2)..,B(order);
//     A(0),A(1),A(2)..,A(order);
//     . . .
//  Note:
//      A(0) >= 0, and means the scale factor (not divisor !) for all the
//                                                                  other taps.
//  Order of the coefficients in the input taps buffer for BiQuad-section
//                                                                      filter:
//     B(0,0),B(0,1),B(0,2),A(0,0),A(0,1),A(0,2);
//     B(1,0),B(1,1),B(1,2),A(1,0),A(1,1),A(1,2);
//     ........
//  Note:
//      A(0,0) >= 0, A(1,0) >= 0..., and means the scale factor (not divisor !)
//      for all the other taps of each section.
}

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIR_Direct_16s(pSrc:PIpp16s; pDst:PIpp16s; len:integer; pTaps:PIpp16s; order:integer; pDlyLine:PIpp32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIR_Direct_16s_I(pSrcDst:PIpp16s; len:integer; pTaps:PIpp16s; order:integer; pDlyLine:PIpp32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIROne_Direct_16s(src:Ipp16s; pDstVal:PIpp16s; pTaps:PIpp16s; order:integer; pDlyLine:PIpp32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIROne_Direct_16s_I(pSrcDst:PIpp16s; pTaps:PIpp16s; order:integer; pDlyLine:PIpp32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIR_BiQuadDirect_16s(pSrc:PIpp16s; pDst:PIpp16s; len:integer; pTaps:PIpp16s; numBq:integer; pDlyLine:PIpp32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIR_BiQuadDirect_16s_I(pSrcDst:PIpp16s; len:integer; pTaps:PIpp16s; numBq:integer; pDlyLine:PIpp32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIROne_BiQuadDirect_16s(src:Ipp16s; pDstVal:PIpp16s; pTaps:PIpp16s; numBq:integer; pDlyLine:PIpp32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIROne_BiQuadDirect_16s_I(pSrcDstVal:PIpp16s; pTaps:PIpp16s; numBq:integer; pDlyLine:PIpp32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};



{ ////////////////////////////////////////////////////////////////////////////
//          Initialize IIR state with external memory buffer
//////////////////////////////////////////////////////////////////////////// }
{ ////////////////////////////////////////////////////////////////////////////
//  Name:         ippsIIRGetStateSize, ippsIIRGetStateSize_BiQuad,
//                ippsIIRGetStateSize_BiQuad_DF1_32f,
//                ippsIIRInit, ippsIIRInit_BiQuad,
//                ippsIIRInit_BiQuad_DF1_32f
//
//  Purpose:      ippsIIRGetStateSize - calculates the size of the IIR State
//                                                                   structure;
//                ippsIIRInit - initialize IIR state - set taps and delay line
//                using external memory buffer;
//  Parameters:
//      pTaps       - pointer to the filter coefficients;
//      order       - order of the filter;
//      numBq       - order of the filter;
//      pDlyLine    - pointer to the delay line values, can be NULL;
//      ppState     - double pointer to the IIR state created or NULL;
//      tapsFactor  - scaleFactor for taps (integer version);
//      pBufferSize - pointer where to store the calculated IIR State structure
//                                                             size (in bytes);
//   Return:
//      status      - status value returned, its value are
//         ippStsNullPtrErr       - pointer(s) to the data is NULL
//         ippStsIIROrderErr      - order <= 0 or numBq < 1
//         ippStsNoErr            - otherwise
}

{ ******************************** 32s_16s ******************************** }
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRGetStateSize32s_16s(order:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRGetStateSize32sc_16sc(order:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRGetStateSize32s_BiQuad_16s(numBq:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRGetStateSize32sc_BiQuad_16sc(numBq:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRInit32s_16s(out ppState:PIppsIIRState32s_16s; pTaps:PIpp32s; order:integer; tapsFactor:integer; pDlyLine:PIpp32s; pBuf:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRInit32sc_16sc(out ppState:PIppsIIRState32sc_16sc; pTaps:PIpp32sc; order:integer; tapsFactor:integer; pDlyLine:PIpp32sc; pBuf:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRInit32s_BiQuad_16s(out ppState:PIppsIIRState32s_16s; pTaps:PIpp32s; numBq:integer; tapsFactor:integer; pDlyLine:PIpp32s; pBuf:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRInit32sc_BiQuad_16sc(out ppState:PIppsIIRState32sc_16sc; pTaps:PIpp32sc; numBq:integer; tapsFactor:integer; pDlyLine:PIpp32sc; pBuf:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ ****************************** 32s_16s32f ******************************* }
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRGetStateSize32s_16s32f(order:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRGetStateSize32sc_16sc32fc(order:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRGetStateSize32s_BiQuad_16s32f(numBq:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRGetStateSize32sc_BiQuad_16sc32fc(numBq:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRInit32s_16s32f(out ppState:PIppsIIRState32s_16s; pTaps:PIpp32f; order:integer; pDlyLine:PIpp32s; pBuf:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRInit32sc_16sc32fc(out ppState:PIppsIIRState32sc_16sc; pTaps:PIpp32fc; order:integer; pDlyLine:PIpp32sc; pBuf:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRInit32s_BiQuad_16s32f(out ppState:PIppsIIRState32s_16s; pTaps:PIpp32f; numBq:integer; pDlyLine:PIpp32s; pBuf:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRInit32sc_BiQuad_16sc32fc(out ppState:PIppsIIRState32sc_16sc; pTaps:PIpp32fc; numBq:integer; pDlyLine:PIpp32sc; pBuf:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
{ ********************************** 32f ********************************** }
function ippsIIRGetStateSize_32f(order:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIRGetStateSize_32fc(order:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIRGetStateSize_BiQuad_32f(numBq:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIRGetStateSize_BiQuad_DF1_32f(numBq:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIRGetStateSize_BiQuad_32fc(numBq:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIRInit_32f(out ppState:PIppsIIRState_32f; pTaps:PIpp32f; order:integer; pDlyLine:PIpp32f; pBuf:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIRInit_32fc(out ppState:PIppsIIRState_32fc; pTaps:PIpp32fc; order:integer; pDlyLine:PIpp32fc; pBuf:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIRInit_BiQuad_32f(out ppState:PIppsIIRState_32f; pTaps:PIpp32f; numBq:integer; pDlyLine:PIpp32f; pBuf:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIRInit_BiQuad_DF1_32f(out pState:PIppsIIRState_32f; pTaps:PIpp32f; numBq:integer; pDlyLine:PIpp32f; pBuf:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIRInit_BiQuad_32fc(out ppState:PIppsIIRState_32fc; pTaps:PIpp32fc; numBq:integer; pDlyLine:PIpp32fc; pBuf:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
{ ******************************** 32f_16s ******************************** }
function ippsIIRGetStateSize32f_16s(order:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIRGetStateSize32fc_16sc(order:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIRGetStateSize32f_BiQuad_16s(numBq:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIRGetStateSize32fc_BiQuad_16sc(numBq:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIRInit32f_16s(out ppState:PIppsIIRState32f_16s; pTaps:PIpp32f; order:integer; pDlyLine:PIpp32f; pBuf:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIRInit32fc_16sc(out ppState:PIppsIIRState32fc_16sc; pTaps:PIpp32fc; order:integer; pDlyLine:PIpp32fc; pBuf:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIRInit32f_BiQuad_16s(out ppState:PIppsIIRState32f_16s; pTaps:PIpp32f; numBq:integer; pDlyLine:PIpp32f; pBuf:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIRInit32fc_BiQuad_16sc(out ppState:PIppsIIRState32fc_16sc; pTaps:PIpp32fc; numBq:integer; pDlyLine:PIpp32fc; pBuf:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
{ ********************************** 64f ********************************** }
function ippsIIRGetStateSize_64f(order:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIRGetStateSize_64fc(order:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIRGetStateSize_BiQuad_64f(numBq:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIRGetStateSize_BiQuad_64fc(numBq:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIRInit_64f(out ppState:PIppsIIRState_64f; pTaps:PIpp64f; order:integer; pDlyLine:PIpp64f; pBuf:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIRInit_64fc(out ppState:PIppsIIRState_64fc; pTaps:PIpp64fc; order:integer; pDlyLine:PIpp64fc; pBuf:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIRInit_BiQuad_64f(out ppState:PIppsIIRState_64f; pTaps:PIpp64f; numBq:integer; pDlyLine:PIpp64f; pBuf:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIRInit_BiQuad_64fc(out ppState:PIppsIIRState_64fc; pTaps:PIpp64fc; numBq:integer; pDlyLine:PIpp64fc; pBuf:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
{ ******************************** 64f_16s ******************************** }
function ippsIIRGetStateSize64f_16s(order:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIRGetStateSize64fc_16sc(order:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIRGetStateSize64f_BiQuad_16s(numBq:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIRGetStateSize64fc_BiQuad_16sc(numBq:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIRInit64f_16s(out ppState:PIppsIIRState64f_16s; pTaps:PIpp64f; order:integer; pDlyLine:PIpp64f; pBuf:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIRInit64fc_16sc(out ppState:PIppsIIRState64fc_16sc; pTaps:PIpp64fc; order:integer; pDlyLine:PIpp64fc; pBuf:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIRInit64f_BiQuad_16s(out ppState:PIppsIIRState64f_16s; pTaps:PIpp64f; numBq:integer; pDlyLine:PIpp64f; pBuf:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIRInit64fc_BiQuad_16sc(out ppState:PIppsIIRState64fc_16sc; pTaps:PIpp64fc; numBq:integer; pDlyLine:PIpp64fc; pBuf:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
{ ******************************** 64f_32s ******************************** }
function ippsIIRGetStateSize64f_32s(order:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIRGetStateSize64fc_32sc(order:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIRGetStateSize64f_BiQuad_32s(numBq:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIRGetStateSize64f_BiQuad_DF1_32s(numBq:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIRGetStateSize64fc_BiQuad_32sc(numBq:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIRInit64f_32s(out ppState:PIppsIIRState64f_32s; pTaps:PIpp64f; order:integer; pDlyLine:PIpp64f; pBuf:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIRInit64fc_32sc(out ppState:PIppsIIRState64fc_32sc; pTaps:PIpp64fc; order:integer; pDlyLine:PIpp64fc; pBuf:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIRInit64f_BiQuad_32s(out ppState:PIppsIIRState64f_32s; pTaps:PIpp64f; numBq:integer; pDlyLine:PIpp64f; pBuf:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIRInit64f_BiQuad_DF1_32s(out ppState:PIppsIIRState64f_32s; pTaps:PIpp64f; numBq:integer; pDlyLine:PIpp32s; pBuf:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIRInit64fc_BiQuad_32sc(out ppState:PIppsIIRState64fc_32sc; pTaps:PIpp64fc; numBq:integer; pDlyLine:PIpp64fc; pBuf:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
{ ******************************** 64f_32f ******************************** }
function ippsIIRGetStateSize64f_32f(order:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIRGetStateSize64fc_32fc(order:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIRGetStateSize64f_BiQuad_32f(numBq:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIRGetStateSize64fc_BiQuad_32fc(numBq:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIRInit64f_32f(out ppState:PIppsIIRState64f_32f; pTaps:PIpp64f; order:integer; pDlyLine:PIpp64f; pBuf:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIRInit64fc_32fc(out ppState:PIppsIIRState64fc_32fc; pTaps:PIpp64fc; order:integer; pDlyLine:PIpp64fc; pBuf:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIRInit64f_BiQuad_32f(out ppState:PIppsIIRState64f_32f; pTaps:PIpp64f; numBq:integer; pDlyLine:PIpp64f; pBuf:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsIIRInit64fc_BiQuad_32fc(out ppState:PIppsIIRState64fc_32fc; pTaps:PIpp64fc; numBq:integer; pDlyLine:PIpp64fc; pBuf:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//  Names:              ippsIIRSetTaps
//  Purpose:            set new IIR taps values to state
//  Parameters:
//      pTaps       -   pointer to new IIR taps
//      pState      -   pointer to the IIR filter state
//      tapsFactor  -   scaleFactor for taps (integer version only)
//  Return:
//      ippStsContextMatchErr  -   wrong state identifier
//      ippStsNullPtrErr       -   pointer(s) to the data is NULL
//      ippStsNoErr            -   otherwise
}
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use Init function instead of SetTaps for changing filter coefficients. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRSetTaps_32f(pTaps:PIpp32f; pState:PIppsIIRState_32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use Init function instead of SetTaps for changing filter coefficients. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRSetTaps_32fc(pTaps:PIpp32fc; pState:PIppsIIRState_32fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use Init function instead of SetTaps for changing filter coefficients. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRSetTaps32f_16s(pTaps:PIpp32f; pState:PIppsIIRState32f_16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use Init function instead of SetTaps for changing filter coefficients. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRSetTaps32fc_16sc(pTaps:PIpp32fc; pState:PIppsIIRState32fc_16sc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRSetTaps32s_16s(pTaps:PIpp32s; pState:PIppsIIRState32s_16s; tapsFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRSetTaps32sc_16sc(pTaps:PIpp32sc; pState:PIppsIIRState32sc_16sc; tapsFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRSetTaps32s_16s32f(pTaps:PIpp32f; pState:PIppsIIRState32s_16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRSetTaps32sc_16sc32fc(pTaps:PIpp32fc; pState:PIppsIIRState32sc_16sc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use Init function instead of SetTaps for changing filter coefficients. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRSetTaps_64f(pTaps:PIpp64f; pState:PIppsIIRState_64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use Init function instead of SetTaps for changing filter coefficients. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRSetTaps_64fc(pTaps:PIpp64fc; pState:PIppsIIRState_64fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use Init function instead of SetTaps for changing filter coefficients. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRSetTaps64f_32f(pTaps:PIpp64f; pState:PIppsIIRState64f_32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use Init function instead of SetTaps for changing filter coefficients. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRSetTaps64fc_32fc(pTaps:PIpp64fc; pState:PIppsIIRState64fc_32fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use Init function instead of SetTaps for changing filter coefficients. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRSetTaps64f_32s(pTaps:PIpp64f; pState:PIppsIIRState64f_32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use Init function instead of SetTaps for changing filter coefficients. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRSetTaps64fc_32sc(pTaps:PIpp64fc; pState:PIppsIIRState64fc_32sc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use Init function instead of SetTaps for changing filter coefficients. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRSetTaps64f_16s(pTaps:PIpp64f; pState:PIppsIIRState64f_16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use Init function instead of SetTaps for changing filter coefficients. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsIIRSetTaps64fc_16sc(pTaps:PIpp64fc; pState:PIppsIIRState64fc_16sc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ /////////////////////////////////////////////////////////////////////////////
//  Names:      ippsIIRGenLowpass_64f, ippsIIRGenHighpass_64f
//
//  Purpose:    This function computes the highpass and lowpass IIR filter coefficients
//
//  Parameters:
//      rFreq             cut off frequency (0 < rFreq < 0.5)
//
//      ripple            possible ripple in pass band for ippChebyshev1 type of filter
//
//      order             the order of future filter (1 <= order <= 12)
//
//      pTaps             pointer to the array which specifies
//                        the filter coefficients
//
//      filterType        type of required filter (ippButterworth or ippChebyshev1)
//
//
//  Return:
//   ippStsNullPtrErr           the null pointer to taps[] array pass to function
//   ippStsIIRPassbandRippleErr the ripple in passband for Chebyshev1 design is less zero,
//                              equal to zero or greater than 29
//   ippStsFilterFrequencyErr   the cut of frequency of filter is less zero, equal to zero
//                              or greater than 0.5
//   ippStsIIRGenOrderErr       the order of an IIR filter for design them is less than one
//                              or greater than 12
//   ippStsNoErr                otherwise
//
}

function ippsIIRGenLowpass_64f(rFreq:Ipp64f; ripple:Ipp64f; order:integer; pTaps:PIpp64f; filterType:IppsIIRFilterType):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsIIRGenHighpass_64f(rFreq:Ipp64f; ripple:Ipp64f; order:integer; pTaps:PIpp64f; filterType:IppsIIRFilterType):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ /////////////////////////////////////////////////////////////////////////////
//                     FIR filters (float and double taps versions)
///////////////////////////////////////////////////////////////////////////// }

type
  PIppsFIRState_32f = ^TIppsFIRState_32f;
  TIppsFIRState_32f = record end;

  PIppsFIRState_32fc = ^TIppsFIRState_32fc;
  TIppsFIRState_32fc = record end;

  PIppsFIRState32f_16s = ^TIppsFIRState32f_16s;
  TIppsFIRState32f_16s = record end;

  PIppsFIRState32fc_16sc = ^TIppsFIRState32fc_16sc;
  TIppsFIRState32fc_16sc = record end;

  PIppsFIRState_64f = ^TIppsFIRState_64f;
  TIppsFIRState_64f = record end;

  PIppsFIRState_64fc = ^TIppsFIRState_64fc;
  TIppsFIRState_64fc = record end;

  PIppsFIRState64f_32f = ^TIppsFIRState64f_32f;
  TIppsFIRState64f_32f = record end;

  PIppsFIRState64fc_32fc = ^TIppsFIRState64fc_32fc;
  TIppsFIRState64fc_32fc = record end;

  PIppsFIRState64f_32s = ^TIppsFIRState64f_32s;
  TIppsFIRState64f_32s = record end;

  PIppsFIRState64fc_32sc = ^TIppsFIRState64fc_32sc;
  TIppsFIRState64fc_32sc = record end;

  PIppsFIRState64f_16s = ^TIppsFIRState64f_16s;
  TIppsFIRState64f_16s = record end;

  PIppsFIRState64fc_16sc = ^TIppsFIRState64fc_16sc;
  TIppsFIRState64fc_16sc = record end;

  PIppsFIRState32s_16s = ^TIppsFIRState32s_16s;
  TIppsFIRState32s_16s = record end;

  PIppsFIRState32sc_16sc = ^TIppsFIRState32sc_16sc;
  TIppsFIRState32sc_16sc = record end;

  PIppsFIRState_32s = ^TIppsFIRState_32s;
  TIppsFIRState_32s = record end;

  PIppsFIRState_16s = ^TIppsFIRState_16s;
  TIppsFIRState_16s = record end;

  PIppsFIRSpec_32f = ^TIppsFIRSpec_32f;
  TIppsFIRSpec_32f = record end;

  PIppsFIRSpec_64f = ^TIppsFIRSpec_64f;
  TIppsFIRSpec_64f = record end;

  PIppsFIRSpec_32fc = ^IppsFIRSpec_32fc;
  IppsFIRSpec_32fc = record end;

  PIppsFIRSpec_64fc = ^IppsFIRSpec_64fc;
  IppsFIRSpec_64fc = record end;

{ /////////////////////////////////////////////////////////////////////////////
//  Initialize FIR state
///////////////////////////////////////////////////////////////////////////// }
{ /////////////////////////////////////////////////////////////////////////////
//  Name:         ippsFIRInitAlloc, ippsFIRMRInitAlloc, ippsFIRFree
//  Purpose:      create and initialize FIR state - set taps and delay line
//                and close it
//  Parameters:
//      pTaps       - pointer to the filter coefficients
//      tapsLen     - number of coefficients
//      pDlyLine    - pointer to the delay line values, can be NULL
//      state       - pointer to the FIR state created or NULL;
//   Return:
//      status      - status value returned, its value are
//         ippStsMemAllocErr      - memory allocation error
//         ippStsNullPtrErr       - pointer(s) to the data is NULL
//         ippStsFIRLenErr        - tapsLen <= 0
//         ippStsFIRMRFactorErr   - factor <= 0
//         ippStsFIRMRPhaseErr    - phase < 0 || factor <= phase
//         ippStsContextMatchErr  - wrong state identifier
//         ippStsNoErr            - otherwise
}

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRInitAlloc_32f(out pState:PIppsFIRState_32f; pTaps:PIpp32f; tapsLen:integer; pDlyLine:PIpp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMRInitAlloc_32f(out pState:PIppsFIRState_32f; pTaps:PIpp32f; tapsLen:integer; upFactor:integer; upPhase:integer; downFactor:integer; downPhase:integer; pDlyLine:PIpp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRInitAlloc_32fc(out pState:PIppsFIRState_32fc; pTaps:PIpp32fc; tapsLen:integer; pDlyLine:PIpp32fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMRInitAlloc_32fc(out pState:PIppsFIRState_32fc; pTaps:PIpp32fc; tapsLen:integer; upFactor:integer; upPhase:integer; downFactor:integer; downPhase:integer; pDlyLine:PIpp32fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRInitAlloc32f_16s(out pState:PIppsFIRState32f_16s; pTaps:PIpp32f; tapsLen:integer; pDlyLine:PIpp16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMRInitAlloc32f_16s(out pState:PIppsFIRState32f_16s; pTaps:PIpp32f; tapsLen:integer; upFactor:integer; upPhase:integer; downFactor:integer; downPhase:integer; pDlyLine:PIpp16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRInitAlloc32fc_16sc(out pState:PIppsFIRState32fc_16sc; pTaps:PIpp32fc; tapsLen:integer; pDlyLine:PIpp16sc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMRInitAlloc32fc_16sc(out pState:PIppsFIRState32fc_16sc; pTaps:PIpp32fc; tapsLen:integer; upFactor:integer; upPhase:integer; downFactor:integer; downPhase:integer; pDlyLine:PIpp16sc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRInitAlloc_64f(out pState:PIppsFIRState_64f; pTaps:PIpp64f; tapsLen:integer; pDlyLine:PIpp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMRInitAlloc_64f(out pState:PIppsFIRState_64f; pTaps:PIpp64f; tapsLen:integer; upFactor:integer; upPhase:integer; downFactor:integer; downPhase:integer; pDlyLine:PIpp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRInitAlloc_64fc(out pState:PIppsFIRState_64fc; pTaps:PIpp64fc; tapsLen:integer; pDlyLine:PIpp64fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMRInitAlloc_64fc(out pState:PIppsFIRState_64fc; pTaps:PIpp64fc; tapsLen:integer; upFactor:integer; upPhase:integer; downFactor:integer; downPhase:integer; pDlyLine:PIpp64fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRInitAlloc64f_32f(out pState:PIppsFIRState64f_32f; pTaps:PIpp64f; tapsLen:integer; pDlyLine:PIpp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMRInitAlloc64f_32f(out pState:PIppsFIRState64f_32f; pTaps:PIpp64f; tapsLen:integer; upFactor:integer; upPhase:integer; downFactor:integer; downPhase:integer; pDlyLine:PIpp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRInitAlloc64fc_32fc(out pState:PIppsFIRState64fc_32fc; pTaps:PIpp64fc; tapsLen:integer; pDlyLine:PIpp32fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMRInitAlloc64fc_32fc(out pState:PIppsFIRState64fc_32fc; pTaps:PIpp64fc; tapsLen:integer; upFactor:integer; upPhase:integer; downFactor:integer; downPhase:integer; pDlyLine:PIpp32fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRInitAlloc64f_32s(out pState:PIppsFIRState64f_32s; pTaps:PIpp64f; tapsLen:integer; pDlyLine:PIpp32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMRInitAlloc64f_32s(out pState:PIppsFIRState64f_32s; pTaps:PIpp64f; tapsLen:integer; upFactor:integer; upPhase:integer; downFactor:integer; downPhase:integer; pDlyLine:PIpp32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRInitAlloc64fc_32sc(out pState:PIppsFIRState64fc_32sc; pTaps:PIpp64fc; tapsLen:integer; pDlyLine:PIpp32sc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMRInitAlloc64fc_32sc(out pState:PIppsFIRState64fc_32sc; pTaps:PIpp64fc; tapsLen:integer; upFactor:integer; upPhase:integer; downFactor:integer; downPhase:integer; pDlyLine:PIpp32sc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRInitAlloc64f_16s(out pState:PIppsFIRState64f_16s; pTaps:PIpp64f; tapsLen:integer; pDlyLine:PIpp16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMRInitAlloc64f_16s(out pState:PIppsFIRState64f_16s; pTaps:PIpp64f; tapsLen:integer; upFactor:integer; upPhase:integer; downFactor:integer; downPhase:integer; pDlyLine:PIpp16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRInitAlloc64fc_16sc(out pState:PIppsFIRState64fc_16sc; pTaps:PIpp64fc; tapsLen:integer; pDlyLine:PIpp16sc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMRInitAlloc64fc_16sc(out pState:PIppsFIRState64fc_16sc; pTaps:PIpp64fc; tapsLen:integer; upFactor:integer; upPhase:integer; downFactor:integer; downPhase:integer; pDlyLine:PIpp16sc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRFree_32f(pState:PIppsFIRState_32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRFree_32fc(pState:PIppsFIRState_32fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRFree32f_16s(pState:PIppsFIRState32f_16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRFree32fc_16sc(pState:PIppsFIRState32fc_16sc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRFree_64f(pState:PIppsFIRState_64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRFree_64fc(pState:PIppsFIRState_64fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRFree64f_32f(pState:PIppsFIRState64f_32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRFree64fc_32fc(pState:PIppsFIRState64fc_32fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRFree64f_32s(pState:PIppsFIRState64f_32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRFree64fc_32sc(pState:PIppsFIRState64fc_32sc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRFree64f_16s(pState:PIppsFIRState64f_16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRFree64fc_16sc(pState:PIppsFIRState64fc_16sc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ ////////////////////////////////////////////////////////////////////////////
//          Initialize FIR state with external memory buffer
//////////////////////////////////////////////////////////////////////////// }
{ ////////////////////////////////////////////////////////////////////////////
//  Name:         ippsFIRGetStateSize, ippsFIRMRGetStateSize,
//                ippsFIRInit, ippsFIRMRInit
//  Purpose:      ippsFIRGetStateSize - calculates the size of the FIR State
//                                                                   structure;
//                ippsFIRInit - initialize FIR state - set taps and delay line
//                using external memory buffer;
//  Parameters:
//      pTaps       - pointer to the filter coefficients;
//      tapsLen     - number of coefficients;
//      pDlyLine    - pointer to the delay line values, can be NULL;
//      ppState     - pointer to the FIR state created or NULL;
//      upFactor    - multi-rate up factor;
//      upPhase     - multi-rate up phase;
//      downFactor  - multi-rate down factor;
//      downPhase   - multi-rate down phase;
//      pStateSize  - pointer where to store the calculated FIR State structure
//                                                             size (in bytes);
//   Return:
//      status      - status value returned, its value are
//         ippStsNullPtrErr       - pointer(s) to the data is NULL
//         ippStsFIRLenErr        - tapsLen <= 0
//         ippStsFIRMRFactorErr   - factor <= 0
//         ippStsFIRMRPhaseErr    - phase < 0 || factor <= phase
//         ippStsNoErr            - otherwise
}

{ ******************************** 32s_16s ******************************** }
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRGetStateSize32s_16s(tapsLen:integer; out pStateSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRInit32s_16s(out ppState:PIppsFIRState32s_16s; pTaps:PIpp32s; tapsLen:integer; tapsFactor:integer; pDlyLine:PIpp16s; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMRGetStateSize32s_16s(tapsLen:integer; upFactor:integer; downFactor:integer; out pStateSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMRInit32s_16s(out ppState:PIppsFIRState32s_16s; pTaps:PIpp32s; tapsLen:integer; tapsFactor:integer; upFactor:integer; upPhase:integer; downFactor:integer; downPhase:integer; pDlyLine:PIpp16s; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRInit32sc_16sc(out ppState:PIppsFIRState32sc_16sc; pTaps:PIpp32sc; tapsLen:integer; tapsFactor:integer; pDlyLine:PIpp16sc; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMRGetStateSize32sc_16sc(tapsLen:integer; upFactor:integer; downFactor:integer; out pStateSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMRInit32sc_16sc(out ppState:PIppsFIRState32sc_16sc; pTaps:PIpp32sc; tapsLen:integer; tapsFactor:integer; upFactor:integer; upPhase:integer; downFactor:integer; downPhase:integer; pDlyLine:PIpp16sc; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRGetStateSize32sc_16sc32fc(tapsLen:integer; out pStateSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
{ ****************************** 32s_16s32f ******************************* }
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRGetStateSize32s_16s32f(tapsLen:integer; out pStateSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRInit32s_16s32f(out ppState:PIppsFIRState32s_16s; pTaps:PIpp32f; tapsLen:integer; pDlyLine:PIpp16s; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMRGetStateSize32s_16s32f(tapsLen:integer; upFactor:integer; downFactor:integer; out pStateSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMRInit32s_16s32f(out ppState:PIppsFIRState32s_16s; pTaps:PIpp32f; tapsLen:integer; upFactor:integer; upPhase:integer; downFactor:integer; downPhase:integer; pDlyLine:PIpp16s; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRGetStateSize32sc_16sc(tapsLen:integer; out pStateSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRInit32sc_16sc32fc(out ppState:PIppsFIRState32sc_16sc; pTaps:PIpp32fc; tapsLen:integer; pDlyLine:PIpp16sc; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMRGetStateSize32sc_16sc32fc(tapsLen:integer; upFactor:integer; downFactor:integer; out pStateSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMRInit32sc_16sc32fc(out ppState:PIppsFIRState32sc_16sc; pTaps:PIpp32fc; tapsLen:integer; upFactor:integer; upPhase:integer; downFactor:integer; downPhase:integer; pDlyLine:PIpp16sc; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
{ ********************************** 32f ********************************** }
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRInit_32f(out ppState:PIppsFIRState_32f; pTaps:PIpp32f; tapsLen:integer; pDlyLine:PIpp32f; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRInit_32fc(out ppState:PIppsFIRState_32fc; pTaps:PIpp32fc; tapsLen:integer; pDlyLine:PIpp32fc; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRGetStateSize_32f(tapsLen:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRGetStateSize_32fc(tapsLen:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMRInit_32f(out ppState:PIppsFIRState_32f; pTaps:PIpp32f; tapsLen:integer; upFactor:integer; upPhase:integer; downFactor:integer; downPhase:integer; pDlyLine:PIpp32f; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMRGetStateSize_32f(tapsLen:integer; upFactor:integer; downFactor:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMRGetStateSize_32fc(tapsLen:integer; upFactor:integer; downFactor:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMRInit_32fc(out ppState:PIppsFIRState_32fc; pTaps:PIpp32fc; tapsLen:integer; upFactor:integer; upPhase:integer; downFactor:integer; downPhase:integer; pDlyLine:PIpp32fc; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
{ ******************************** 32f_16s ******************************** }
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRGetStateSize32f_16s(tapsLen:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRInit32f_16s(out ppState:PIppsFIRState32f_16s; pTaps:PIpp32f; tapsLen:integer; pDlyLine:PIpp16s; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRGetStateSize32fc_16sc(tapsLen:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRInit32fc_16sc(out ppState:PIppsFIRState32fc_16sc; pTaps:PIpp32fc; tapsLen:integer; pDlyLine:PIpp16sc; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMRGetStateSize32f_16s(tapsLen:integer; upFactor:integer; downFactor:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMRInit32f_16s(out ppState:PIppsFIRState32f_16s; pTaps:PIpp32f; tapsLen:integer; upFactor:integer; upPhase:integer; downFactor:integer; downPhase:integer; pDlyLine:PIpp16s; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMRGetStateSize32fc_16sc(tapsLen:integer; upFactor:integer; downFactor:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMRInit32fc_16sc(out ppState:PIppsFIRState32fc_16sc; pTaps:PIpp32fc; tapsLen:integer; upFactor:integer; upPhase:integer; downFactor:integer; downPhase:integer; pDlyLine:PIpp16sc; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
{ ********************************** 64f ********************************** }
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRInit_64f(out ppState:PIppsFIRState_64f; pTaps:PIpp64f; tapsLen:integer; pDlyLine:PIpp64f; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRInit_64fc(out ppState:PIppsFIRState_64fc; pTaps:PIpp64fc; tapsLen:integer; pDlyLine:PIpp64fc; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRGetStateSize_64f(tapsLen:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRGetStateSize_64fc(tapsLen:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMRInit_64f(out ppState:PIppsFIRState_64f; pTaps:PIpp64f; tapsLen:integer; upFactor:integer; upPhase:integer; downFactor:integer; downPhase:integer; pDlyLine:PIpp64f; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMRGetStateSize_64f(tapsLen:integer; upFactor:integer; downFactor:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMRGetStateSize_64fc(tapsLen:integer; upFactor:integer; downFactor:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMRInit_64fc(out ppState:PIppsFIRState_64fc; pTaps:PIpp64fc; tapsLen:integer; upFactor:integer; upPhase:integer; downFactor:integer; downPhase:integer; pDlyLine:PIpp64fc; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
{ ******************************** 64f_16s ******************************** }
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRGetStateSize64f_16s(tapsLen:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRInit64f_16s(out ppState:PIppsFIRState64f_16s; pTaps:PIpp64f; tapsLen:integer; pDlyLine:PIpp16s; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRGetStateSize64fc_16sc(tapsLen:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRInit64fc_16sc(out ppState:PIppsFIRState64fc_16sc; pTaps:PIpp64fc; tapsLen:integer; pDlyLine:PIpp16sc; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMRGetStateSize64f_16s(tapsLen:integer; upFactor:integer; downFactor:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMRInit64f_16s(out ppState:PIppsFIRState64f_16s; pTaps:PIpp64f; tapsLen:integer; upFactor:integer; upPhase:integer; downFactor:integer; downPhase:integer; pDlyLine:PIpp16s; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMRGetStateSize64fc_16sc(tapsLen:integer; upFactor:integer; downFactor:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMRInit64fc_16sc(out ppState:PIppsFIRState64fc_16sc; pTaps:PIpp64fc; tapsLen:integer; upFactor:integer; upPhase:integer; downFactor:integer; downPhase:integer; pDlyLine:PIpp16sc; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
{ ******************************** 64f_32s ******************************** }
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRGetStateSize64f_32s(tapsLen:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRInit64f_32s(out ppState:PIppsFIRState64f_32s; pTaps:PIpp64f; tapsLen:integer; pDlyLine:PIpp32s; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRGetStateSize64fc_32sc(tapsLen:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRInit64fc_32sc(out ppState:PIppsFIRState64fc_32sc; pTaps:PIpp64fc; tapsLen:integer; pDlyLine:PIpp32sc; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMRGetStateSize64f_32s(tapsLen:integer; upFactor:integer; downFactor:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMRInit64f_32s(out ppState:PIppsFIRState64f_32s; pTaps:PIpp64f; tapsLen:integer; upFactor:integer; upPhase:integer; downFactor:integer; downPhase:integer; pDlyLine:PIpp32s; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMRGetStateSize64fc_32sc(tapsLen:integer; upFactor:integer; downFactor:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMRInit64fc_32sc(out ppState:PIppsFIRState64fc_32sc; pTaps:PIpp64fc; tapsLen:integer; upFactor:integer; upPhase:integer; downFactor:integer; downPhase:integer; pDlyLine:PIpp32sc; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
{ ******************************** 64f_32f ******************************** }
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRGetStateSize64f_32f(tapsLen:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRInit64f_32f(out ppState:PIppsFIRState64f_32f; pTaps:PIpp64f; tapsLen:integer; pDlyLine:PIpp32f; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRGetStateSize64fc_32fc(tapsLen:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRInit64fc_32fc(out ppState:PIppsFIRState64fc_32fc; pTaps:PIpp64fc; tapsLen:integer; pDlyLine:PIpp32fc; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMRGetStateSize64f_32f(tapsLen:integer; upFactor:integer; downFactor:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMRInit64f_32f(out ppState:PIppsFIRState64f_32f; pTaps:PIpp64f; tapsLen:integer; upFactor:integer; upPhase:integer; downFactor:integer; downPhase:integer; pDlyLine:PIpp32f; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMRGetStateSize64fc_32fc(tapsLen:integer; upFactor:integer; downFactor:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMRInit64fc_32fc(out ppState:PIppsFIRState64fc_32fc; pTaps:PIpp64fc; tapsLen:integer; upFactor:integer; upPhase:integer; downFactor:integer; downPhase:integer; pDlyLine:PIpp32fc; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ /////////////////////////////////////////////////////////////////////////////
//  Names:              ippsFIRGetTaps
//  Purpose:            get FIR taps value from state
//  Parameters:
//      pTaps       -   pointer to buffer to get FIR taps
//      pState      -   pointer to the FIR filter state
//  Return:
//      ippStsContextMatchErr  -   wrong state identifier
//      ippStsNullPtrErr       -   pointer(s) to the data is NULL
//      ippStsNoErr            -   otherwise
}

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRGetTaps_32f(pState:PIppsFIRState_32f; pTaps:PIpp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRGetTaps_32fc(pState:PIppsFIRState_32fc; pTaps:PIpp32fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRGetTaps32f_16s(pState:PIppsFIRState32f_16s; pTaps:PIpp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRGetTaps32fc_16sc(pState:PIppsFIRState32fc_16sc; pTaps:PIpp32fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRGetTaps_64f(pState:PIppsFIRState_64f; pTaps:PIpp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRGetTaps_64fc(pState:PIppsFIRState_64fc; pTaps:PIpp64fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRGetTaps64f_32f(pState:PIppsFIRState64f_32f; pTaps:PIpp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRGetTaps64fc_32fc(pState:PIppsFIRState64fc_32fc; pTaps:PIpp64fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRGetTaps64f_32s(pState:PIppsFIRState64f_32s; pTaps:PIpp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRGetTaps64fc_32sc(pState:PIppsFIRState64fc_32sc; pTaps:PIpp64fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRGetTaps64f_16s(pState:PIppsFIRState64f_16s; pTaps:PIpp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRGetTaps64fc_16sc(pState:PIppsFIRState64fc_16sc; pTaps:PIpp64fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ /////////////////////////////////////////////////////////////////////////////
//  Names:              ippsFIRGSetTaps
//  Purpose:            set FIR taps value to state
//  Parameters:
//      pTaps       -   pointer to buffer to set FIR taps
//      pState      -   pointer to the FIR filter state
//  Return:
//      ippStsContextMatchErr  -   wrong state identifier
//      ippStsNullPtrErr       -   pointer(s) to the data is NULL
//      ippStsNoErr            -   otherwise
}

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use Init function instead of SetTaps for changing filter coefficients. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRSetTaps_32f(pTaps:PIpp32f; pState:PIppsFIRState_32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use Init function instead of SetTaps for changing filter coefficients. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRSetTaps_32fc(pTaps:PIpp32fc; pState:PIppsFIRState_32fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use Init function instead of SetTaps for changing filter coefficients. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRSetTaps32f_16s(pTaps:PIpp32f; pState:PIppsFIRState32f_16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use Init function instead of SetTaps for changing filter coefficients. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRSetTaps32fc_16sc(pTaps:PIpp32fc; pState:PIppsFIRState32fc_16sc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRSetTaps32s_16s(pTaps:PIpp32s; pState:PIppsFIRState32s_16s; tapsFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRSetTaps32sc_16sc(pTaps:PIpp32sc; pState:PIppsFIRState32sc_16sc; tapsFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRSetTaps32s_16s32f(pTaps:PIpp32f; pState:PIppsFIRState32s_16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRSetTaps32sc_16sc32fc(pTaps:PIpp32fc; pState:PIppsFIRState32sc_16sc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use Init function instead of SetTaps for changing filter coefficients. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRSetTaps_64f(pTaps:PIpp64f; pState:PIppsFIRState_64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use Init function instead of SetTaps for changing filter coefficients. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRSetTaps_64fc(pTaps:PIpp64fc; pState:PIppsFIRState_64fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use Init function instead of SetTaps for changing filter coefficients. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRSetTaps64f_32f(pTaps:PIpp64f; pState:PIppsFIRState64f_32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use Init function instead of SetTaps for changing filter coefficients. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRSetTaps64fc_32fc(pTaps:PIpp64fc; pState:PIppsFIRState64fc_32fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use Init function instead of SetTaps for changing filter coefficients. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRSetTaps64f_32s(pTaps:PIpp64f; pState:PIppsFIRState64f_32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use Init function instead of SetTaps for changing filter coefficients. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRSetTaps64fc_32sc(pTaps:PIpp64fc; pState:PIppsFIRState64fc_32sc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use Init function instead of SetTaps for changing filter coefficients. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRSetTaps64f_16s(pTaps:PIpp64f; pState:PIppsFIRState64f_16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use Init function instead of SetTaps for changing filter coefficients. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRSetTaps64fc_16sc(pTaps:PIpp64fc; pState:PIppsFIRState64fc_16sc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};



{ /////////////////////////////////////////////////////////////////////////////
//  Work with Delay Line
///////////////////////////////////////////////////////////////////////////// }
{ /////////////////////////////////////////////////////////////////////////////
//  Names:           ippsFIRGetDlyLine, ippsFIRSetDlyLine
//  Purpose:         set and get delay line
//  Parameters:
//      pDlyLine            - pointer to delay line
//      pState              - pointer to the filter state
//  Return:
//      ippStsContextMatchErr  - wrong state identifier
//      ippStsNullPtrErr       - pointer(s) to the data is NULL
//      ippStsNoErr            - otherwise
//  Note: pDlyLine may be NULL
}

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRGetDlyLine_32f(pState:PIppsFIRState_32f; pDlyLine:PIpp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRSetDlyLine_32f(pState:PIppsFIRState_32f; pDlyLine:PIpp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRGetDlyLine_32fc(pState:PIppsFIRState_32fc; pDlyLine:PIpp32fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRSetDlyLine_32fc(pState:PIppsFIRState_32fc; pDlyLine:PIpp32fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRGetDlyLine32f_16s(pState:PIppsFIRState32f_16s; pDlyLine:PIpp16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRSetDlyLine32f_16s(pState:PIppsFIRState32f_16s; pDlyLine:PIpp16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRGetDlyLine32fc_16sc(pState:PIppsFIRState32fc_16sc; pDlyLine:PIpp16sc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRSetDlyLine32fc_16sc(pState:PIppsFIRState32fc_16sc; pDlyLine:PIpp16sc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRGetDlyLine_64f(pState:PIppsFIRState_64f; pDlyLine:PIpp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRSetDlyLine_64f(pState:PIppsFIRState_64f; pDlyLine:PIpp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRGetDlyLine_64fc(pState:PIppsFIRState_64fc; pDlyLine:PIpp64fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRSetDlyLine_64fc(pState:PIppsFIRState_64fc; pDlyLine:PIpp64fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRGetDlyLine64f_32f(pState:PIppsFIRState64f_32f; pDlyLine:PIpp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRSetDlyLine64f_32f(pState:PIppsFIRState64f_32f; pDlyLine:PIpp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRGetDlyLine64fc_32fc(pState:PIppsFIRState64fc_32fc; pDlyLine:PIpp32fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRSetDlyLine64fc_32fc(pState:PIppsFIRState64fc_32fc; pDlyLine:PIpp32fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRGetDlyLine64f_32s(pState:PIppsFIRState64f_32s; pDlyLine:PIpp32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRSetDlyLine64f_32s(pState:PIppsFIRState64f_32s; pDlyLine:PIpp32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRGetDlyLine64fc_32sc(pState:PIppsFIRState64fc_32sc; pDlyLine:PIpp32sc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRSetDlyLine64fc_32sc(pState:PIppsFIRState64fc_32sc; pDlyLine:PIpp32sc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRGetDlyLine64f_16s(pState:PIppsFIRState64f_16s; pDlyLine:PIpp16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRSetDlyLine64f_16s(pState:PIppsFIRState64f_16s; pDlyLine:PIpp16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRGetDlyLine64fc_16sc(pState:PIppsFIRState64fc_16sc; pDlyLine:PIpp16sc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRSetDlyLine64fc_16sc(pState:PIppsFIRState64fc_16sc; pDlyLine:PIpp16sc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//  Filtering
///////////////////////////////////////////////////////////////////////////// }
{ /////////////////////////////////////////////////////////////////////////////
//  Names:         ippsFIROne
//  Purpose:       FIR filter. One point filtering
//  Parameters:
//      src            - input sample
//      pDstVal        - output sample
//      pState         - pointer to the filter state
//      scaleFactor    - scale factor value
//  Return:
//      ippStsContextMatchErr  - wrong state identifier
//      ippStsNullPtrErr       - pointer(s) to the data is NULL
//      ippStsNoErr            - otherwise
}

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use vector function with vector length = 1 instead. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIROne_32f(src:Ipp32f; pDstVal:PIpp32f; pState:PIppsFIRState_32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use vector function with vector length = 1 instead. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIROne_32fc(src:Ipp32fc; pDstVal:PIpp32fc; pState:PIppsFIRState_32fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use vector function with vector length = 1 instead. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIROne32f_16s_Sfs(src:Ipp16s; pDstVal:PIpp16s; pState:PIppsFIRState32f_16s; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use vector function with vector length = 1 instead. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIROne32fc_16sc_Sfs(src:Ipp16sc; pDstVal:PIpp16sc; pState:PIppsFIRState32fc_16sc; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use vector function with vector length = 1 instead. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIROne_64f(src:Ipp64f; pDstVal:PIpp64f; pState:PIppsFIRState_64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use vector function with vector length = 1 instead. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIROne_64fc(src:Ipp64fc; pDstVal:PIpp64fc; pState:PIppsFIRState_64fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use vector function with vector length = 1 instead. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIROne64f_32f(src:Ipp32f; pDstVal:PIpp32f; pState:PIppsFIRState64f_32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use vector function with vector length = 1 instead. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIROne64fc_32fc(src:Ipp32fc; pDstVal:PIpp32fc; pState:PIppsFIRState64fc_32fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use vector function with vector length = 1 instead. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIROne64f_32s_Sfs(src:Ipp32s; pDstVal:PIpp32s; pState:PIppsFIRState64f_32s; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use vector function with vector length = 1 instead. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIROne64fc_32sc_Sfs(src:Ipp32sc; pDstVal:PIpp32sc; pState:PIppsFIRState64fc_32sc; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use vector function with vector length = 1 instead. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIROne64f_16s_Sfs(src:Ipp16s; pDstVal:PIpp16s; pState:PIppsFIRState64f_16s; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use vector function with vector length = 1 instead. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIROne64fc_16sc_Sfs(src:Ipp16sc; pDstVal:PIpp16sc; pState:PIppsFIRState64fc_16sc; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//  Names:         ippsFIR
//  Purpose:       FIR filter. Vector filtering
//  Parameters:
//      pSrcDst     - pointer to the input/output vector in in-place operation
//      pSrc        - pointer to the input vector
//      pDst        - pointer to the output vector
//      numIters    - number iterations (for single-rate equal length data vector)
//      pState      - pointer to the filter state
//      scaleFactor - scale factor value
//  Return:
//      ippStsContextMatchErr  - wrong state identifier
//      ippStsNullPtrErr       - pointer(s) to the data is NULL
//      ippStsSizeErr          - numIters is less or equal zero
//      ippStsNoErr            - otherwise
//  Note: for Multi-Rate filtering
//          length pSrc = numIters*downFactor
//          length pDst = numIters*upFactor
//          for inplace functions max this values
}

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIR_32f(pSrc:PIpp32f; pDst:PIpp32f; numIters:integer; pState:PIppsFIRState_32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIR_32fc(pSrc:PIpp32fc; pDst:PIpp32fc; numIters:integer; pState:PIppsFIRState_32fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIR32f_16s_Sfs(pSrc:PIpp16s; pDst:PIpp16s; numIters:integer; pState:PIppsFIRState32f_16s; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIR32fc_16sc_Sfs(pSrc:PIpp16sc; pDst:PIpp16sc; numIters:integer; pState:PIppsFIRState32fc_16sc; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIR_32f_I(pSrcDst:PIpp32f; numIters:integer; pState:PIppsFIRState_32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIR_32fc_I(pSrcDst:PIpp32fc; numIters:integer; pState:PIppsFIRState_32fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIR32f_16s_ISfs(pSrcDst:PIpp16s; numIters:integer; pState:PIppsFIRState32f_16s; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIR32fc_16sc_ISfs(pSrcDst:PIpp16sc; numIters:integer; pState:PIppsFIRState32fc_16sc; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIR_64f(pSrc:PIpp64f; pDst:PIpp64f; numIters:integer; pState:PIppsFIRState_64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIR_64fc(pSrc:PIpp64fc; pDst:PIpp64fc; numIters:integer; pState:PIppsFIRState_64fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIR_64f_I(pSrcDst:PIpp64f; numIters:integer; pState:PIppsFIRState_64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIR_64fc_I(pSrcDst:PIpp64fc; numIters:integer; pState:PIppsFIRState_64fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIR64f_32f(pSrc:PIpp32f; pDst:PIpp32f; numIters:integer; pState:PIppsFIRState64f_32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIR64fc_32fc(pSrc:PIpp32fc; pDst:PIpp32fc; numIters:integer; pState:PIppsFIRState64fc_32fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIR64f_32f_I(pSrcDst:PIpp32f; numIters:integer; pState:PIppsFIRState64f_32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIR64fc_32fc_I(pSrcDst:PIpp32fc; numIters:integer; pState:PIppsFIRState64fc_32fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIR64f_32s_Sfs(pSrc:PIpp32s; pDst:PIpp32s; numIters:integer; pState:PIppsFIRState64f_32s; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIR64fc_32sc_Sfs(pSrc:PIpp32sc; pDst:PIpp32sc; numIters:integer; pState:PIppsFIRState64fc_32sc; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIR64f_32s_ISfs(pSrcDst:PIpp32s; numIters:integer; pState:PIppsFIRState64f_32s; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIR64fc_32sc_ISfs(pSrcDst:PIpp32sc; numIters:integer; pState:PIppsFIRState64fc_32sc; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIR64f_16s_Sfs(pSrc:PIpp16s; pDst:PIpp16s; numIters:integer; pState:PIppsFIRState64f_16s; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIR64fc_16sc_Sfs(pSrc:PIpp16sc; pDst:PIpp16sc; numIters:integer; pState:PIppsFIRState64fc_16sc; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIR64f_16s_ISfs(pSrcDst:PIpp16s; numIters:integer; pState:PIppsFIRState64f_16s; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIR64fc_16sc_ISfs(pSrcDst:PIpp16sc; numIters:integer; pState:PIppsFIRState64fc_16sc; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//                     FIR filters (integer taps version)
///////////////////////////////////////////////////////////////////////////// }

{ /////////////////////////////////////////////////////////////////////////////
//  Initialize State
///////////////////////////////////////////////////////////////////////////// }
(* /////////////////////////////////////////////////////////////////////////////
//  Names:       ippsFIRInitAlloc, ippsFIRMRInitAlloc, ippsFIRFree
//  Purpose:     create and initialize FIR state, set taps and delay line
//  Parameters:
//      pTaps          - pointer to the filter coefficients
//      tapsLen        - number of coefficients
//      tapsFactor     - scale factor of Ipp32s taps
//      pDlyLine       - pointer delay line, may be NULL
//      state          - pointer to the state created or NULL
//  Return:
//      status         - status returned, its values are
//          ippStsMemAllocErr  - memory allocation error
//          ippStsNullPtrErr   - pointer(s) to the data is NULL
//          ippStsFIRLenErr    - tapsLen <= 0
//          ippStsFIRMRFactorErr   - factor <= 0
//          ippStsFIRMRPhaseErr    - phase < 0 || factor <= phase
//          ippStsNoErr        - otherwise
//  Notes:   pTaps and tapsFactor for Ipp32s calculate as follows
//
//          Ipp64f mpy = 1.0;
//          Ipp32f pFTaps[tapsLen];     // true values of the coefficients
//          Ipp32s pTaps[tapsLen];      // values to be pass to integer FIR
//
//          ... calculate coefficients, filling pFTaps ...
//
//          max = MAX(abs(pFTaps[i]));   for i = 0..tapsLen-1
//
//          tapsFactor = 0;
//          if (max > IPP_MAX_32S) {
//              while (max > IPP_MAX_32S) {
//                  tapsFactor++;
//                  max *= 0.5;
//                  mpy *= 0.5;
//              }
//          } else {
//              while (max < IPP_MAX_32S && tapsFactor > -17) {
//                  tapsFactor--;
//                  max += max;
//                  mpy += mpy;
//              }
//              tapsFactor++;
//              mpy *= 0.5;
//          }
//
//          for (i = 0; i < tapsLen; i++)
//              if (pFTaps[i] < 0)
//                  pSTaps[i] = (Ipp32s)(mpy*pFTaps[i]-0.5);
//              else
//                  pSTaps[i] = (Ipp32s)(mpy*pFTaps[i]+0.5);
*)
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRInitAlloc32s_16s(out pState:PIppsFIRState32s_16s; pTaps:PIpp32s; tapsLen:integer; tapsFactor:integer; pDlyLine:PIpp16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMRInitAlloc32s_16s(out pState:PIppsFIRState32s_16s; pTaps:PIpp32s; tapsLen:integer; tapsFactor:integer; upFactor:integer; upPhase:integer; downFactor:integer; downPhase:integer; pDlyLine:PIpp16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRInitAlloc32s_16s32f(out pState:PIppsFIRState32s_16s; pTaps:PIpp32f; tapsLen:integer; pDlyLine:PIpp16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMRInitAlloc32s_16s32f(out pState:PIppsFIRState32s_16s; pTaps:PIpp32f; tapsLen:integer; upFactor:integer; upPhase:integer; downFactor:integer; downPhase:integer; pDlyLine:PIpp16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRInitAlloc32sc_16sc(out pState:PIppsFIRState32sc_16sc; pTaps:PIpp32sc; tapsLen:integer; tapsFactor:integer; pDlyLine:PIpp16sc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMRInitAlloc32sc_16sc(out pState:PIppsFIRState32sc_16sc; pTaps:PIpp32sc; tapsLen:integer; tapsFactor:integer; upFactor:integer; upPhase:integer; downFactor:integer; downPhase:integer; pDlyLine:PIpp16sc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRInitAlloc32sc_16sc32fc(out pState:PIppsFIRState32sc_16sc; pTaps:PIpp32fc; tapsLen:integer; pDlyLine:PIpp16sc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMRInitAlloc32sc_16sc32fc(out pState:PIppsFIRState32sc_16sc; pTaps:PIpp32fc; tapsLen:integer; upFactor:integer; upPhase:integer; downFactor:integer; downPhase:integer; pDlyLine:PIpp16sc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRFree32s_16s(pState:PIppsFIRState32s_16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRFree32sc_16sc(pState:PIppsFIRState32sc_16sc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//  Names:              ippsFIRGetTaps
//  Purpose:            get FIR taps value from state
//  Parameters:
//      pTaps       -   pointer to buffer to get FIR taps
//      pState      -   pointer to the FIR filter state
//  Return:
//      ippStsContextMatchErr  -   wrong state identifier
//      ippStsNullPtrErr       -   pointer(s) to the data is NULL
//      ippStsNoErr            -   otherwise
}

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRGetTaps32s_16s(pState:PIppsFIRState32s_16s; pTaps:PIpp32s; out tapsFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRGetTaps32sc_16sc(pState:PIppsFIRState32sc_16sc; pTaps:PIpp32sc; out tapsFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRGetTaps32s_16s32f(pState:PIppsFIRState32s_16s; pTaps:PIpp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRGetTaps32sc_16sc32fc(pState:PIppsFIRState32sc_16sc; pTaps:PIpp32fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ /////////////////////////////////////////////////////////////////////////////
//  Work with Delay Line
///////////////////////////////////////////////////////////////////////////// }
{ /////////////////////////////////////////////////////////////////////////////
//  Names:             ippsFIRGetDlyLine, ippsFIRSetDlyLine
//  Purpose:           set and get delay line
//  Parameters:
//      pDlyLine       - pointer to the delay line
//      pState         - pointer to the FIR filter state
//  Return:
//      ippStsContextMatchErr  -   wrong state identifier
//      ippStsNullPtrErr       -   pointer(s) to the data is NULL
//      ippStsNoErr            -   otherwise
//  Note: pDlyLine may be NULL
}

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRGetDlyLine32s_16s(pState:PIppsFIRState32s_16s; pDlyLine:PIpp16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRSetDlyLine32s_16s(pState:PIppsFIRState32s_16s; pDlyLine:PIpp16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRGetDlyLine32sc_16sc(pState:PIppsFIRState32sc_16sc; pDlyLine:PIpp16sc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRSetDlyLine32sc_16sc(pState:PIppsFIRState32sc_16sc; pDlyLine:PIpp16sc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//  Filtering
///////////////////////////////////////////////////////////////////////////// }
{ /////////////////////////////////////////////////////////////////////////////
//  Names:            ippsFIROne, ippsFIROne
//  Purpose:          FIR filter with integer taps. One sample filtering
//  Parameters:
//      src            - input sample
//      pDstVal        - pointer to the output sample
//      pState         - pointer to the FIR filter state
//      scaleFactor    - scale factor value
//  Return:
//      ippStsContextMatchErr  - wrong state identifier
//      ippStsNullPtrErr       - pointer(s) to the data is NULL
//      ippStsNoErr            - otherwise
}
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use vector function with vector length = 1 instead. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIROne32s_16s_Sfs(src:Ipp16s; pDstVal:PIpp16s; pState:PIppsFIRState32s_16s; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use vector function with vector length = 1 instead. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIROne32sc_16sc_Sfs(src:Ipp16sc; pDstVal:PIpp16sc; pState:PIppsFIRState32sc_16sc; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ /////////////////////////////////////////////////////////////////////////////
//  Names:        ippsFIR
//  Purpose:      FIR filter with integer taps. Vector filtering
//  Parameters:
//      pSrc          - pointer to the input vector
//      pDst          - pointer to the output vector
//      pSrcDst       - pointer to input/output vector in in-place operation
//      numIters      - number iterations (for single-rate equal length data vector)
//      pState        - pointer to the filter state
//      scaleFactor   - scale factor value
//  Return:
//      ippStsContextMatchErr  - wrong State identifier
//      ippStsNullPtrErr       - pointer(s) to the data is NULL
//      ippStsSizeErr          - numIters <= 0
//      ippStsNoErr            - otherwise
//  Note: for Multi-Rate filtering
//          length pSrc = numIters*downFactor
//          length pDst = numIters*upFactor
//          for inplace functions max this values
}

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIR32s_16s_Sfs(pSrc:PIpp16s; pDst:PIpp16s; numIters:integer; pState:PIppsFIRState32s_16s; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIR32sc_16sc_Sfs(pSrc:PIpp16sc; pDst:PIpp16sc; numIters:integer; pState:PIppsFIRState32sc_16sc; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. Removal 2H 2014 or later. Replace with ippsFIR32s_16s_Sfs. For more details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIR32s_16s_ISfs(pSrcDst:PIpp16s; numIters:integer; pState:PIppsFIRState32s_16s; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Removal 2H 2014 or later. Replace with ippsFIR32sc_16sc_Sfs. For more details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIR32sc_16sc_ISfs(pSrcDst:PIpp16sc; numIters:integer; pState:PIppsFIRState32sc_16sc; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRInitAlloc_32s(out pState:PIppsFIRState_32s; pTaps:PIpp32s; tapsLen:integer; pDlyLine:PIpp32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRGetStateSize_32s(tapsLen:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRInit_32s(out pState:PIppsFIRState_32s; pTaps:PIpp32s; tapsLen:integer; pDlyLine:PIpp32s; pBuf:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRSetTaps_32s(pTaps:PIpp32s; pState:PIppsFIRState_32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRGetTaps_32s(pState:PIppsFIRState_32s; pTaps:PIpp32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use vector function with vector length = 1 instead. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIROne_32s_Sfs(src:Ipp32s; pDstVal:PIpp32s; pState:PIppsFIRState_32s; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIR_32s_Sfs(pSrc:PIpp32s; pDst:PIpp32s; numIters:integer; pState:PIppsFIRState_32s; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIR_32s_ISfs(pSrcDst:PIpp32s; numIters:integer; pState:PIppsFIRState_32s; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRFree_32s(pState:PIppsFIRState_32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRGetStateSize_16s(tapsLen:integer; out pStateSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMRGetStateSize_16s(tapsLen:integer; upFactor:integer; downFactor:integer; out pStateSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRInit_16s(out ppState:PIppsFIRState_16s; pTaps:PIpp16s; tapsLen:integer; tapsFactor:integer; pDlyLine:PIpp16s; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMRInit_16s(out ppState:PIppsFIRState_16s; pTaps:PIpp16s; tapsLen:integer; tapsFactor:integer; upFactor:integer; upPhase:integer; downFactor:integer; downPhase:integer; pDlyLine:PIpp16s; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRInitAlloc_16s(out pState:PIppsFIRState_16s; pTaps:PIpp16s; tapsLen:integer; tapsFactor:integer; pDlyLine:PIpp16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMRInitAlloc_16s(out pState:PIppsFIRState_16s; pTaps:PIpp16s; tapsLen:integer; tapsFactor:integer; upFactor:integer; upPhase:integer; downFactor:integer; downPhase:integer; pDlyLine:PIpp16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRSetTaps_16s(pTaps:PIpp16s; pState:PIppsFIRState_16s; tapsFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRGetTaps_16s(pState:PIppsFIRState_16s; pTaps:PIpp16s; out tapsFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRSetDlyLine_16s(pState:PIppsFIRState_16s; pDlyLine:PIpp16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRGetDlyLine_16s(pState:PIppsFIRState_16s; pDlyLine:PIpp16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use vector function with vector length = 1 instead. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIROne_16s_Sfs(src:Ipp16s; pDstVal:PIpp16s; pState:PIppsFIRState_16s; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIR_16s_Sfs(pSrc:PIpp16s; pDst:PIpp16s; numIters:integer; pState:PIppsFIRState_16s; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIR_16s_ISfs(pSrcDst:PIpp16s; numIters:integer; pState:PIppsFIRState_16s; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRFree_16s(pState:PIppsFIRState_16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//  Names:        ippsFIRStream
//  Purpose:      FIR stream filter with integer taps. Vector filtering
//                It does not have delay line.
//  Parameters:
//      pSrc          - pointer to the input vector
//      pDst          - pointer to the output vector
//      numIters      - number iterations (for single-rate equal length data vector)
//      pState        - pointer to the filter state
//      scaleFactor   - scale factor value
//  Return:
//      ippStsContextMatchErr  - wrong State identifier
//      ippStsNullPtrErr       - pointer(s) to the data is NULL
//      ippStsSizeErr          - numIters <= 0
//      ippStsNoErr            - otherwise
//  Note: for Multi-Rate filtering
//          length pSrc = numIters*downFactor
//          length pDst = numIters*upFactor
//          for inplace functions max this values
}

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRStreamGetStateSize_16s(tapsLen:integer; out pStateSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMRStreamGetStateSize_16s(tapsLen:integer; upFactor:integer; downFactor:integer; out pStateSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRStreamInit_16s(out pState:PIppsFIRState_16s; pTaps:PIpp16s; tapsLen:integer; tapsFactor:integer; rndMode:IppRoundMode; pBuf:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMRStreamInit_16s(out ppState:PIppsFIRState_16s; pTaps:PIpp16s; tapsLen:integer; tapsFactor:integer; upFactor:integer; upPhase:integer; downFactor:integer; downPhase:integer; rndMode:IppRoundMode; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRStreamInitAlloc_16s(out pState:PIppsFIRState_16s; pTaps:PIpp16s; tapsLen:integer; tapsFactor:integer; rndMode:IppRoundMode):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMRStreamInitAlloc_16s(out pState:PIppsFIRState_16s; pTaps:PIpp16s; tapsLen:integer; tapsFactor:integer; upFactor:integer; upPhase:integer; downFactor:integer; downPhase:integer; rndMode:IppRoundMode):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//  Names:        ippsFIRStream
//  Purpose:      FIR stream filter with float taps. Vector filtering
//                It does not have delay line.
//  Parameters:
//      pSrc          - pointer to the input vector
//      pDst          - pointer to the output vector
//      numIters      - number iterations (for single-rate equal length data vector)
//      pState        - pointer to the filter state
//      scaleFactor   - scale factor value//  Return:
//      ippStsContextMatchErr  - wrong State identifier
//      ippStsNullPtrErr       - pointer(s) to the data is NULL
//      ippStsSizeErr          - numIters <= 0
//      ippStsNoErr            - otherwise
//  Note: for Multi-Rate filtering
//          length pSrc = numIters*downFactor
//          length pDst = numIters*upFactor
//          for inplace functions max this values
}
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRStreamGetStateSize_32f(tapsLen:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMRStreamGetStateSize_32f(tapsLen:integer; upFactor:integer; downFactor:integer; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRStreamInit_32f(out pState:PIppsFIRState_32f; pTaps:PIpp32f; tapsLen:integer; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMRStreamInit_32f(out pState:PIppsFIRState_32f; pTaps:PIpp32f; tapsLen:integer; upFactor:integer; upPhase:integer; downFactor:integer; downPhase:integer; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRStreamInitAlloc_32f(out pState:PIppsFIRState_32f; pTaps:PIpp32f; tapsLen:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMRStreamInitAlloc_32f(out pState:PIppsFIRState_32f; pTaps:PIpp32f; tapsLen:integer; upFactor:integer; upPhase:integer; downFactor:integer; downPhase:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//                  FIR LMS filters
///////////////////////////////////////////////////////////////////////////// }
{ /////////////////////////////////////////////////////////////////////////////
//   Names:     ippsFIRLMSOne_Direct
//   Purpose:   direct form of a FIR LMS filter. One point operation.
//   Parameters:
//      src          source signal sample
//      refval       desired signal sample
//      pTapsInv     FIR taps coefficient values to be fitted
//      tapsLen      number of the taps
//      pDlyLine     pointer to the delay line values
//      pDlyIndex    pointer to the current index of delay line
//      mu           adaptation step
//      muQ15        adaptation step, integer version
//                   muQ15 = (int)(mu * (1<<15) + 0.5f)
//      pDstVal      where write output sample to
//   Return:
//      ippStsNullPtrErr  pointer the the data is null
//      ippStsSizeErr     the taps length is equal or less zero
//      ippStsNoErr       otherwise
//   Note: adaptation error value has been deleted from the parameter
//         list because it can be computed as (refval - dst).
//         taps array is inverted, delay line is of double size = tapsLen * 2
}
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRLMSOne_Direct_32f(src:Ipp32f; refval:Ipp32f; pDstVal:PIpp32f; pTapsInv:PIpp32f; tapsLen:integer; mu:single; pDlyLine:PIpp32f; out pDlyIndex:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRLMSOne_Direct32f_16s(src:Ipp16s; refval:Ipp16s; pDstVal:PIpp16s; pTapsInv:PIpp32f; tapsLen:integer; mu:single; pDlyLine:PIpp16s; out pDlyIndex:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRLMSOne_DirectQ15_16s(src:Ipp16s; refval:Ipp16s; pDstVal:PIpp16s; pTapsInv:PIpp32s; tapsLen:integer; muQ15:integer; pDlyLine:PIpp16s; out pDlyIndex:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ context oriented functions }
type
  PIppsFIRLMSState_32f = ^TIppsFIRLMSState_32f;
  TIppsFIRLMSState_32f = record end;

  PIppsFIRLMSState32f_16s = ^TIppsFIRLMSState32f_16s;
  TIppsFIRLMSState32f_16s = record end;

{ /////////////////////////////////////////////////////////////////////////////
//   Names:      ippsFIRLMS
//   Purpose:    LMS filtering with context use
//   Parameters:
//      pState    pointer to the state
//      pSrc      pointer to the source signal
//      pRef      pointer to the desired signal
//      pDst      pointer to the output signal
//      len       length of the signals
//      mu        adaptation step
//   Return:
//      ippStsNullPtrErr       pointer to the data is null
//      ippStsSizeErr          the length of signals is equal or less zero
//      ippStsContextMatchErr    wrong state identifier
//      ippStsNoErr            otherwise
}
function ippsFIRLMS_32f(pSrc:PIpp32f; pRef:PIpp32f; pDst:PIpp32f; len:integer; mu:single; pState:PIppsFIRLMSState_32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsFIRLMS32f_16s(pSrc:PIpp16s; pRef:PIpp16s; pDst:PIpp16s; len:integer; mu:single; pStatel:PIppsFIRLMSState32f_16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ /////////////////////////////////////////////////////////////////////////////
//   Names:       ippsFIRLMSInitAlloc, ippsFIRLMSFree
//   Purpose:     LMS initialization functions
//   Parameters:
//      pTaps     pointer to the taps values. May be null
//      tapsLen   number of the taps
//      pDlyLine  pointer to the delay line. May be null
//      dlyLineIndex  current index value for the delay line
//      pState    address of pointer to the state returned
//   Return:
//      ippStsNullPtrErr       pointer is null
//      ippStsContextMatchErr    wrong state identifier
//      ippStsNoErr            otherwise
}

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRLMSInitAlloc_32f(out pState:PIppsFIRLMSState_32f; pTaps:PIpp32f; tapsLen:integer; pDlyLine:PIpp32f; dlyLineIndex:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRLMSInitAlloc32f_16s(out pState:PIppsFIRLMSState32f_16s; pTaps:PIpp32f; tapsLen:integer; pDlyLine:PIpp16s; dlyLineIndex:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRLMSFree_32f(pState:PIppsFIRLMSState_32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Internal memory allocation will not be supported - use Get<Buffer>Size and Init pair for this functionality. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRLMSFree32f_16s(pState:PIppsFIRLMSState32f_16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//   Names:        ippsFIRLMSGetTaps
//   Purpose:      get taps values
//   Parameters:
//      pstate          pointer to the state
//      pTaps           pointer to the array to store the taps values
//   Return:
//      ippStsNullPtrErr   pointer to the data is null
//      ippStsNoErr        otherwise
}

function ippsFIRLMSGetTaps_32f(pState:PIppsFIRLMSState_32f; pOutTaps:PIpp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFIRLMSGetTaps32f_16s(pState:PIppsFIRLMSState32f_16s; pOutTaps:PIpp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//   Names:       ippsFIRLMSGetDlyl, ippsFIRLMSSetDlyl
//   Purpose:     set or get delay line
//   Parameters:
//      pState         pointer to the state structure
//      pDlyLine       pointer to the delay line of the single size = tapsLen
//      pDlyLineIndex  pointer to get the current delay line index
//   Return:
//      ippStsNullPtrErr       pointer to the data is null
//      ippStsContextMatchErr    wrong state identifier
//      ippStsNoErr            otherwise
}

function ippsFIRLMSGetDlyLine_32f(pState:PIppsFIRLMSState_32f; pDlyLine:PIpp32f; out pDlyLineIndex:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFIRLMSGetDlyLine32f_16s(pState:PIppsFIRLMSState32f_16s; pDlyLine:PIpp16s; out pDlyLineIndex:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsFIRLMSSetDlyLine_32f(pState:PIppsFIRLMSState_32f; pDlyLine:PIpp32f; dlyLineIndex:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFIRLMSSetDlyLine32f_16s(pState:PIppsFIRLMSState32f_16s; pDlyLine:PIpp16s; dlyLineIndex:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ /////////////////////////////////////////////////////////////////////////////
//                  FIR LMS MR filters
///////////////////////////////////////////////////////////////////////////// }

{ context oriented functions }
type
  PIppsFIRLMSMRState32s_16s = ^TIppsFIRLMSMRState32s_16s;
  TIppsFIRLMSMRState32s_16s = record end;

  PIppsFIRLMSMRState32sc_16sc = ^TIppsFIRLMSMRState32sc_16sc;
  TIppsFIRLMSMRState32sc_16sc = record end;

{ /////////////////////////////////////////////////////////////////////////////
//   Names:      ippsFIRLMSMROne, ippsFIRLMSMROneVal
//   Purpose:    LMS MR filtering with context use
//   Parameters:
//      val       the source signal last value to update delay line
//      pDstVal   pointer to the output signal value
//      pState    pointer to the state
//   Return:
//      ippStsNullPtrErr        pointer to the data is null
//      ippStsContextMatchErr   wrong state identifier
//      ippStsNoErr             otherwise
}
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRLMSMROne32s_16s(pDstVal:PIpp32s; pState:PIppsFIRLMSMRState32s_16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRLMSMROneVal32s_16s(val:Ipp16s; pDstVal:PIpp32s; pState:PIppsFIRLMSMRState32s_16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRLMSMROne32sc_16sc(pDstVal:PIpp32sc; pState:PIppsFIRLMSMRState32sc_16sc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRLMSMROneVal32sc_16sc(val:Ipp16sc; pDstVal:PIpp32sc; pState:PIppsFIRLMSMRState32sc_16sc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//   Names:       ippsFIRLMSMRInitAlloc, ippsFIRLMSMRFree
//   Purpose:     LMS MR initialization functions
//   Parameters:
//      pState        address of pointer to the state returned
//      pTaps         pointer to the taps values. May be null
//      tapsLen       number of the taps
//      pDlyLine      pointer to the delay line. May be null
//      dlyLineIndex  current index value for the delay line
//      dlyStep       sample down factor
//      updateDly     update delay in samples
//      mu            adaptation step
//   Return:
//      ippStsNullPtrErr       pointer is null
//      ippStsContextMatchErr  wrong state identifier
//      ippStsNoErr            otherwise
}

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRLMSMRInitAlloc32s_16s(out pState:PIppsFIRLMSMRState32s_16s; pTaps:PIpp32s; tapsLen:integer; pDlyLine:PIpp16s; dlyLineIndex:integer; dlyStep:integer; updateDly:integer; mu:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRLMSMRFree32s_16s(pState:PIppsFIRLMSMRState32s_16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRLMSMRInitAlloc32sc_16sc(out pState:PIppsFIRLMSMRState32sc_16sc; pTaps:PIpp32sc; tapsLen:integer; pDlyLine:PIpp16sc; dlyLineIndex:integer; dlyStep:integer; updateDly:integer; mu:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRLMSMRFree32sc_16sc(pState:PIppsFIRLMSMRState32sc_16sc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//   Names:        ippsFIRLMSMRGetTaps, ippsFIRLMSMRSetTaps,
//                 ippsFIRLMSMRGetTapsPointer
//   Purpose:      get & set taps values
//   Parameters:
//      pState     pointer to the state
//      pOutTaps   pointer to the array to store the taps values
//      pInTaps    pointer to the taps values. May be null
//      pTaps      pointer to the state taps values. For direct access
//   Return:
//      ippStsNullPtrErr       pointer to the data is null
//      ippStsContextMatchErr  wrong state identifier
//      ippStsNoErr            otherwise
}

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRLMSMRSetTaps32s_16s(pState:PIppsFIRLMSMRState32s_16s; pInTaps:PIpp32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRLMSMRGetTaps32s_16s(pState:PIppsFIRLMSMRState32s_16s; pOutTaps:PIpp32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRLMSMRGetTapsPointer32s_16s(pState:PIppsFIRLMSMRState32s_16s; pTaps:Ipp32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRLMSMRSetTaps32sc_16sc(pState:PIppsFIRLMSMRState32sc_16sc; pInTaps:PIpp32sc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRLMSMRGetTaps32sc_16sc(pState:PIppsFIRLMSMRState32sc_16sc; pOutTaps:PIpp32sc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRLMSMRGetTapsPointer32sc_16sc(pState:PIppsFIRLMSMRState32sc_16sc; pTaps:Ipp32sc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//   Names:       ippsFIRLMSMRGetDlyLine, ippsFIRLMSMRSetDlyLine,
//                ippsFIRLMSMRGetDlyVal
//   Purpose:     set or get delay line, or get one delay line value from
//                specified position
//   Parameters:
//      pState          pointer to the state structure
//      pInDlyLine      pointer to the delay line of the (see state definition)
//                          size = tapsLen * dlyStep + updateDly (may be null)
//      pOutDlyLine     pointer to the delay line of the (see state definition)
//                      size = tapsLen * dlyStep + updateDly
//      pOutDlyLineIndex  pointer to get the current delay line index
//      dlyLineIndex    current index value for the delay line
//      index           to get one value posted into delay line "index" iterations ago
//   Return:
//      ippStsNullPtrErr       pointer to the data is null
//      ippStsContextMatchErr  wrong state identifier
//      ippStsNoErr            otherwise
}

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRLMSMRSetDlyLine32s_16s(pState:PIppsFIRLMSMRState32s_16s; pInDlyLine:PIpp16s; dlyLineIndex:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRLMSMRGetDlyLine32s_16s(pState:PIppsFIRLMSMRState32s_16s; pOutDlyLine:PIpp16s; out pOutDlyIndex:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRLMSMRGetDlyVal32s_16s(pState:PIppsFIRLMSMRState32s_16s; pOutVal:PIpp16s; index:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRLMSMRSetDlyLine32sc_16sc(pState:PIppsFIRLMSMRState32sc_16sc; pInDlyLine:PIpp16sc; dlyLineIndex:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRLMSMRGetDlyLine32sc_16sc(pState:PIppsFIRLMSMRState32sc_16sc; pOutDlyLine:PIpp16sc; out pOutDlyLineIndex:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRLMSMRGetDlyVal32sc_16sc(pState:PIppsFIRLMSMRState32sc_16sc; pOutVal:PIpp16sc; index:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//   Names:       ippsFIRLMSMRPutVal
//   Purpose:     put one value to the delay line
//   Parameters:
//      val       the source signal last value to update delay line
//      pState    pointer to the state structure
//   Return:
//      ippStsNullPtrErr       pointer to the data is null
//      ippStsContextMatchErr  wrong state identifier
//      ippStsNoErr            otherwise
}

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRLMSMRPutVal32s_16s(val:Ipp16s; pState:PIppsFIRLMSMRState32s_16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRLMSMRPutVal32sc_16sc(val:Ipp16sc; pState:PIppsFIRLMSMRState32sc_16sc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//   Names:       ippsFIRLMSMRSetMu
//   Purpose:     set new adaptation step
//   Parameters:
//      pState    pointer to the state structure
//      mu        new adaptation step
//   Return:
//      ippStsNullPtrErr       pointer to the data is null
//      ippStsContextMatchErr  wrong state identifier
//      ippStsNoErr            otherwise
}

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRLMSMRSetMu32s_16s(pState:PIppsFIRLMSMRState32s_16s; mu:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRLMSMRSetMu32sc_16sc(pState:PIppsFIRLMSMRState32sc_16sc; mu:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//   Names:       ippsFIRLMSMRUpdateTaps
//   Purpose:     recalculation of taps using Least Mean Square alg
//   Parameters:
//      ErrVal    difference between output and reference signal
//      pState    pointer to the state structure
//   Return:
//      ippStsNullPtrErr       pointer to the data is null
//      ippStsContextMatchErr  wrong state identifier
//      ippStsNoErr            otherwise
}

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRLMSMRUpdateTaps32s_16s(ErrVal:Ipp32s; pState:PIppsFIRLMSMRState32s_16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRLMSMRUpdateTaps32sc_16sc(ErrVal:Ipp32sc; pState:PIppsFIRLMSMRState32sc_16sc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};




{ /////////////////////////////////////////////////////////////////////////////
//                     FIR filters (direct version)
///////////////////////////////////////////////////////////////////////////// }
{ /////////////////////////////////////////////////////////////////////////////
//   Names:      ippsFIROne_Direct
//   Purpose:    Directly filters a single sample through a FIR filter.
//   Parameters:
//      src            input sample
//      pDstVal        pointer to the output sample
//      pSrcDstVal     pointer to the input and output sample for in-place operation.
//      pTaps          pointer to the array containing the taps values,
//                       the number of elements in the array is tapsLen
//      tapsLen        number of elements in the array containing the taps values.
//      tapsFactor     scale factor for the taps of Ipp32s data type
//                               (for integer versions only).
//      pDlyLine       pointer to the array containing the delay line values,
//                        the number of elements in the array is 2*tapsLen
//      pDlyLineIndex  pointer to the current delay line index
//      scaleFactor    integer scaling factor value
//   Return:
//      ippStsNullPtrErr       pointer(s) to data arrays is(are) NULL
//      ippStsFIRLenErr        tapsLen is less than or equal to 0
//      ippStsNoErr            otherwise
}

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIROne_Direct_32f(src:Ipp32f; pDstVal:PIpp32f; pTaps:PIpp32f; tapsLen:integer; pDlyLine:PIpp32f; out pDlyLineIndex:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIROne_Direct_32fc(src:Ipp32fc; pDstVal:PIpp32fc; pTaps:PIpp32fc; tapsLen:integer; pDlyLine:PIpp32fc; out pDlyLineIndex:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIROne_Direct_32f_I(pSrcDstVal:PIpp32f; pTaps:PIpp32f; tapsLen:integer; pDlyLine:PIpp32f; out pDlyLineIndex:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIROne_Direct_32fc_I(pSrcDstVal:PIpp32fc; pTaps:PIpp32fc; tapsLen:integer; pDlyLine:PIpp32fc; out pDlyLineIndex:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIROne32f_Direct_16s_Sfs(src:Ipp16s; pDstVal:PIpp16s; pTaps:PIpp32f; tapsLen:integer; pDlyLine:PIpp16s; out pDlyLineIndex:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIROne32fc_Direct_16sc_Sfs(src:Ipp16sc; pDstVal:PIpp16sc; pTaps:PIpp32fc; tapsLen:integer; pDlyLine:PIpp16sc; out pDlyLineIndex:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIROne32f_Direct_16s_ISfs(pSrcDstVal:PIpp16s; pTaps:PIpp32f; tapsLen:integer; pDlyLine:PIpp16s; out pDlyLineIndex:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIROne32fc_Direct_16sc_ISfs(pSrcDstVal:PIpp16sc; pTaps:PIpp32fc; tapsLen:integer; pDlyLine:PIpp16sc; out pDlyLineIndex:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIROne_Direct_64f(src:Ipp64f; pDstVal:PIpp64f; pTaps:PIpp64f; tapsLen:integer; pDlyLine:PIpp64f; out pDlyLineIndex:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIROne_Direct_64fc(src:Ipp64fc; pDstVal:PIpp64fc; pTaps:PIpp64fc; tapsLen:integer; pDlyLine:PIpp64fc; out pDlyLineIndex:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIROne_Direct_64f_I(pSrcDstVal:PIpp64f; pTaps:PIpp64f; tapsLen:integer; pDlyLine:PIpp64f; out pDlyLineIndex:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIROne_Direct_64fc_I(pSrcDstVal:PIpp64fc; pTaps:PIpp64fc; tapsLen:integer; pDlyLine:PIpp64fc; out pDlyLineIndex:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIROne64f_Direct_32f(src:Ipp32f; pDstVal:PIpp32f; pTaps:PIpp64f; tapsLen:integer; pDlyLine:PIpp32f; out pDlyLineIndex:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIROne64fc_Direct_32fc(src:Ipp32fc; pDstVal:PIpp32fc; pTaps:PIpp64fc; tapsLen:integer; pDlyLine:PIpp32fc; out pDlyLineIndex:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIROne64f_Direct_32f_I(pSrcDstVal:PIpp32f; pTaps:PIpp64f; tapsLen:integer; pDlyLine:PIpp32f; out pDlyLineIndex:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIROne64fc_Direct_32fc_I(pSrcDstVal:PIpp32fc; pTaps:PIpp64fc; tapsLen:integer; pDlyLine:PIpp32fc; out pDlyLineIndex:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIROne64f_Direct_32s_Sfs(src:Ipp32s; pDstVal:PIpp32s; pTaps:PIpp64f; tapsLen:integer; pDlyLine:PIpp32s; out pDlyLineIndex:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIROne64fc_Direct_32sc_Sfs(src:Ipp32sc; pDstVal:PIpp32sc; pTaps:PIpp64fc; tapsLen:integer; pDlyLine:PIpp32sc; out pDlyLineIndex:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIROne64f_Direct_32s_ISfs(pSrcDstVal:PIpp32s; pTaps:PIpp64f; tapsLen:integer; pDlyLine:PIpp32s; out pDlyLineIndex:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIROne64fc_Direct_32sc_ISfs(pSrcDstVal:PIpp32sc; pTaps:PIpp64fc; tapsLen:integer; pDlyLine:PIpp32sc; out pDlyLineIndex:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIROne64f_Direct_16s_Sfs(src:Ipp16s; pDstVal:PIpp16s; pTaps:PIpp64f; tapsLen:integer; pDlyLine:PIpp16s; out pDlyLineIndex:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIROne64fc_Direct_16sc_Sfs(src:Ipp16sc; pDstVal:PIpp16sc; pTaps:PIpp64fc; tapsLen:integer; pDlyLine:PIpp16sc; out pDlyLineIndex:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIROne64f_Direct_16s_ISfs(pSrcDstVal:PIpp16s; pTaps:PIpp64f; tapsLen:integer; pDlyLine:PIpp16s; out pDlyLineIndex:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIROne64fc_Direct_16sc_ISfs(pSrcDstVal:PIpp16sc; pTaps:PIpp64fc; tapsLen:integer; pDlyLine:PIpp16sc; out pDlyLineIndex:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIROne32s_Direct_16s_Sfs(src:Ipp16s; pDstVal:PIpp16s; pTaps:PIpp32s; tapsLen:integer; tapsFactor:integer; pDlyLine:PIpp16s; out pDlyLineIndex:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIROne32sc_Direct_16sc_Sfs(src:Ipp16sc; pDstVal:PIpp16sc; pTaps:PIpp32sc; tapsLen:integer; tapsFactor:integer; pDlyLine:PIpp16sc; out pDlyLineIndex:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIROne32s_Direct_16s_ISfs(pSrcDstVal:PIpp16s; pTaps:PIpp32s; tapsLen:integer; tapsFactor:integer; pDlyLine:PIpp16s; out pDlyLineIndex:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIROne32sc_Direct_16sc_ISfs(pSrcDstVal:PIpp16sc; pTaps:PIpp32sc; tapsLen:integer; tapsFactor:integer; pDlyLine:PIpp16sc; out pDlyLineIndex:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ ///////////////////////////////////////////////////////////////////////////////////////////
//   Names:      ippsFIR_Direct
//   Purpose:    Directly filters a block of samples through a single-rate FIR filter.
//   Parameters:
//      pSrc           pointer to the input array
//      pDst           pointer to the output array
//      pSrcDst        pointer to the input and output array for in-place operation.
//      numIters       number of samples in the input array
//      pTaps          pointer to the array containing the taps values,
//                       the number of elements in the array is tapsLen
//      tapsLen        number of elements in the array containing the taps values.
//      tapsFactor     scale factor for the taps of Ipp32s data type
//                               (for integer versions only).
//      pDlyLine       pointer to the array containing the delay line values,
//                        the number of elements in the array is 2*tapsLen
//      pDlyLineIndex  pointer to the current delay line index
//      scaleFactor    integer scaling factor value
//   Return:
//      ippStsNullPtrErr       pointer(s) to data arrays is(are) NULL
//      ippStsFIRLenErr        tapsLen is less than or equal to 0
//      ippStsSizeErr          numIters is less than or equal to 0
//      ippStsNoErr            otherwise
}

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIR_Direct_32f(pSrc:PIpp32f; pDst:PIpp32f; numIters:integer; pTaps:PIpp32f; tapsLen:integer; pDlyLine:PIpp32f; out pDlyLineIndex:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIR_Direct_32fc(pSrc:PIpp32fc; pDst:PIpp32fc; numIters:integer; pTaps:PIpp32fc; tapsLen:integer; pDlyLine:PIpp32fc; out pDlyLineIndex:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIR_Direct_32f_I(pSrcDst:PIpp32f; numIters:integer; pTaps:PIpp32f; tapsLen:integer; pDlyLine:PIpp32f; out pDlyLineIndex:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIR_Direct_32fc_I(pSrcDst:PIpp32fc; numIters:integer; pTaps:PIpp32fc; tapsLen:integer; pDlyLine:PIpp32fc; out pDlyLineIndex:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIR32f_Direct_16s_Sfs(pSrc:PIpp16s; pDst:PIpp16s; numIters:integer; pTaps:PIpp32f; tapsLen:integer; pDlyLine:PIpp16s; out pDlyLineIndex:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIR32fc_Direct_16sc_Sfs(pSrc:PIpp16sc; pDst:PIpp16sc; numIters:integer; pTaps:PIpp32fc; tapsLen:integer; pDlyLine:PIpp16sc; out pDlyLineIndex:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIR32f_Direct_16s_ISfs(pSrcDst:PIpp16s; numIters:integer; pTaps:PIpp32f; tapsLen:integer; pDlyLine:PIpp16s; out pDlyLineIndex:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIR32fc_Direct_16sc_ISfs(pSrcDst:PIpp16sc; numIters:integer; pTaps:PIpp32fc; tapsLen:integer; pDlyLine:PIpp16sc; out pDlyLineIndex:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIR_Direct_64f(pSrc:PIpp64f; pDst:PIpp64f; numIters:integer; pTaps:PIpp64f; tapsLen:integer; pDlyLine:PIpp64f; out pDlyLineIndex:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIR_Direct_64fc(pSrc:PIpp64fc; pDst:PIpp64fc; numIters:integer; pTaps:PIpp64fc; tapsLen:integer; pDlyLine:PIpp64fc; out pDlyLineIndex:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIR_Direct_64f_I(pSrcDst:PIpp64f; numIters:integer; pTaps:PIpp64f; tapsLen:integer; pDlyLine:PIpp64f; out pDlyLineIndex:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIR_Direct_64fc_I(pSrcDst:PIpp64fc; numIters:integer; pTaps:PIpp64fc; tapsLen:integer; pDlyLine:PIpp64fc; out pDlyLineIndex:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIR64f_Direct_32f(pSrc:PIpp32f; pDst:PIpp32f; numIters:integer; pTaps:PIpp64f; tapsLen:integer; pDlyLine:PIpp32f; out pDlyLineIndex:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIR64fc_Direct_32fc(pSrc:PIpp32fc; pDst:PIpp32fc; numIters:integer; pTaps:PIpp64fc; tapsLen:integer; pDlyLine:PIpp32fc; out pDlyLineIndex:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIR64f_Direct_32f_I(pSrcDst:PIpp32f; numIters:integer; pTaps:PIpp64f; tapsLen:integer; pDlyLine:PIpp32f; out pDlyLineIndex:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIR64fc_Direct_32fc_I(pSrcDst:PIpp32fc; numIters:integer; pTaps:PIpp64fc; tapsLen:integer; pDlyLine:PIpp32fc; out pDlyLineIndex:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIR64f_Direct_32s_Sfs(pSrc:PIpp32s; pDst:PIpp32s; numIters:integer; pTaps:PIpp64f; tapsLen:integer; pDlyLine:PIpp32s; out pDlyLineIndex:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIR64fc_Direct_32sc_Sfs(pSrc:PIpp32sc; pDst:PIpp32sc; numIters:integer; pTaps:PIpp64fc; tapsLen:integer; pDlyLine:PIpp32sc; out pDlyLineIndex:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIR64f_Direct_32s_ISfs(pSrcDst:PIpp32s; numIters:integer; pTaps:PIpp64f; tapsLen:integer; pDlyLine:PIpp32s; out pDlyLineIndex:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIR64fc_Direct_32sc_ISfs(pSrcDst:PIpp32sc; numIters:integer; pTaps:PIpp64fc; tapsLen:integer; pDlyLine:PIpp32sc; out pDlyLineIndex:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIR64f_Direct_16s_Sfs(pSrc:PIpp16s; pDst:PIpp16s; numIters:integer; pTaps:PIpp64f; tapsLen:integer; pDlyLine:PIpp16s; out pDlyLineIndex:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIR64fc_Direct_16sc_Sfs(pSrc:PIpp16sc; pDst:PIpp16sc; numIters:integer; pTaps:PIpp64fc; tapsLen:integer; pDlyLine:PIpp16sc; out pDlyLineIndex:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIR64f_Direct_16s_ISfs(pSrcDst:PIpp16s; numIters:integer; pTaps:PIpp64f; tapsLen:integer; pDlyLine:PIpp16s; out pDlyLineIndex:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIR64fc_Direct_16sc_ISfs(pSrcDst:PIpp16sc; numIters:integer; pTaps:PIpp64fc; tapsLen:integer; pDlyLine:PIpp16sc; out pDlyLineIndex:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIR32s_Direct_16s_Sfs(pSrc:PIpp16s; pDst:PIpp16s; numIters:integer; pTaps:PIpp32s; tapsLen:integer; tapsFactor:integer; pDlyLine:PIpp16s; out pDlyLineIndex:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIR32sc_Direct_16sc_Sfs(pSrc:PIpp16sc; pDst:PIpp16sc; numIters:integer; pTaps:PIpp32sc; tapsLen:integer; tapsFactor:integer; pDlyLine:PIpp16sc; out pDlyLineIndex:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIR32s_Direct_16s_ISfs(pSrcDst:PIpp16s; numIters:integer; pTaps:PIpp32s; tapsLen:integer; tapsFactor:integer; pDlyLine:PIpp16s; out pDlyLineIndex:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIR32sc_Direct_16sc_ISfs(pSrcDst:PIpp16sc; numIters:integer; pTaps:PIpp32sc; tapsLen:integer; tapsFactor:integer; pDlyLine:PIpp16sc; out pDlyLineIndex:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ ///////////////////////////////////////////////////////////////////////////////////////////
//   Names:      ippsFIRMR_Direct
//   Purpose:    Directly filters a block of samples through a multi-rate FIR filter.
//   Parameters:
//      pSrc           pointer to the input array
//      pDst           pointer to the output array
//      pSrcDst        pointer to the input and output array for in-place operation.
//      numIters       number of iterations in the input array
//      pTaps          pointer to the array containing the taps values,
//                       the number of elements in the array is tapsLen
//      tapsLen        number of elements in the array containing the taps values.
//      tapsFactor     scale factor for the taps of Ipp32s data type
//                               (for integer versions only).
//      pDlyLine       pointer to the array containing the delay line values
//      upFactor       up-sampling factor
//      downFactor     down-sampling factor
//      upPhase        up-sampling phase
//      downPhase      down-sampling phase
//      scaleFactor    integer scaling factor value
//   Return:
//      ippStsNullPtrErr       pointer(s) to data arrays is(are) NULL
//      ippStsFIRLenErr        tapsLen is less than or equal to 0
//      ippStsSizeErr          numIters is less than or equal to 0
//      ippStsFIRMRFactorErr   upFactor (downFactor) is less than or equal to 0
//      ippStsFIRMRPhaseErr    upPhase (downPhase) is negative,
//                                       or less than or equal to upFactor (downFactor).
//      ippStsNoErr            otherwise
}


// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMR_Direct_32f(pSrc:PIpp32f; pDst:PIpp32f; numIters:integer; pTaps:PIpp32f; tapsLen:integer; upFactor:integer; upPhase:integer; downFactor:integer; downPhase:integer; pDlyLine:PIpp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMR_Direct_32fc(pSrc:PIpp32fc; pDst:PIpp32fc; numIters:integer; pTaps:PIpp32fc; tapsLen:integer; upFactor:integer; upPhase:integer; downFactor:integer; downPhase:integer; pDlyLine:PIpp32fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMR_Direct_32f_I(pSrcDst:PIpp32f; numIters:integer; pTaps:PIpp32f; tapsLen:integer; upFactor:integer; upPhase:integer; downFactor:integer; downPhase:integer; pDlyLine:PIpp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMR_Direct_32fc_I(pSrcDst:PIpp32fc; numIters:integer; pTaps:PIpp32fc; tapsLen:integer; upFactor:integer; upPhase:integer; downFactor:integer; downPhase:integer; pDlyLine:PIpp32fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMR32f_Direct_16s_Sfs(pSrc:PIpp16s; pDst:PIpp16s; numIters:integer; pTaps:PIpp32f; tapsLen:integer; upFactor:integer; upPhase:integer; downFactor:integer; downPhase:integer; pDlyLine:PIpp16s; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMR32fc_Direct_16sc_Sfs(pSrc:PIpp16sc; pDst:PIpp16sc; numIters:integer; pTaps:PIpp32fc; tapsLen:integer; upFactor:integer; upPhase:integer; downFactor:integer; downPhase:integer; pDlyLine:PIpp16sc; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMR32f_Direct_16s_ISfs(pSrcDst:PIpp16s; numIters:integer; pTaps:PIpp32f; tapsLen:integer; upFactor:integer; upPhase:integer; downFactor:integer; downPhase:integer; pDlyLine:PIpp16s; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMR32fc_Direct_16sc_ISfs(pSrcDst:PIpp16sc; numIters:integer; pTaps:PIpp32fc; tapsLen:integer; upFactor:integer; upPhase:integer; downFactor:integer; downPhase:integer; pDlyLine:PIpp16sc; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMR_Direct_64f(pSrc:PIpp64f; pDst:PIpp64f; numIters:integer; pTaps:PIpp64f; tapsLen:integer; upFactor:integer; upPhase:integer; downFactor:integer; downPhase:integer; pDlyLine:PIpp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMR_Direct_64fc(pSrc:PIpp64fc; pDst:PIpp64fc; numIters:integer; pTaps:PIpp64fc; tapsLen:integer; upFactor:integer; upPhase:integer; downFactor:integer; downPhase:integer; pDlyLine:PIpp64fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMR_Direct_64f_I(pSrcDst:PIpp64f; numIters:integer; pTaps:PIpp64f; tapsLen:integer; upFactor:integer; upPhase:integer; downFactor:integer; downPhase:integer; pDlyLine:PIpp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMR_Direct_64fc_I(pSrcDst:PIpp64fc; numIters:integer; pTaps:PIpp64fc; tapsLen:integer; upFactor:integer; upPhase:integer; downFactor:integer; downPhase:integer; pDlyLine:PIpp64fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMR64f_Direct_32f(pSrc:PIpp32f; pDst:PIpp32f; numIters:integer; pTaps:PIpp64f; tapsLen:integer; upFactor:integer; upPhase:integer; downFactor:integer; downPhase:integer; pDlyLine:PIpp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMR64fc_Direct_32fc(pSrc:PIpp32fc; pDst:PIpp32fc; numIters:integer; pTaps:PIpp64fc; tapsLen:integer; upFactor:integer; upPhase:integer; downFactor:integer; downPhase:integer; pDlyLine:PIpp32fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMR64f_Direct_32f_I(pSrcDst:PIpp32f; numIters:integer; pTaps:PIpp64f; tapsLen:integer; upFactor:integer; upPhase:integer; downFactor:integer; downPhase:integer; pDlyLine:PIpp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMR64fc_Direct_32fc_I(pSrcDst:PIpp32fc; numIters:integer; pTaps:PIpp64fc; tapsLen:integer; upFactor:integer; upPhase:integer; downFactor:integer; downPhase:integer; pDlyLine:PIpp32fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMR64f_Direct_32s_Sfs(pSrc:PIpp32s; pDst:PIpp32s; numIters:integer; pTaps:PIpp64f; tapsLen:integer; upFactor:integer; upPhase:integer; downFactor:integer; downPhase:integer; pDlyLine:PIpp32s; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMR64fc_Direct_32sc_Sfs(pSrc:PIpp32sc; pDst:PIpp32sc; numIters:integer; pTaps:PIpp64fc; tapsLen:integer; upFactor:integer; upPhase:integer; downFactor:integer; downPhase:integer; pDlyLine:PIpp32sc; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMR64f_Direct_32s_ISfs(pSrcDst:PIpp32s; numIters:integer; pTaps:PIpp64f; tapsLen:integer; upFactor:integer; upPhase:integer; downFactor:integer; downPhase:integer; pDlyLine:PIpp32s; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMR64fc_Direct_32sc_ISfs(pSrcDst:PIpp32sc; numIters:integer; pTaps:PIpp64fc; tapsLen:integer; upFactor:integer; upPhase:integer; downFactor:integer; downPhase:integer; pDlyLine:PIpp32sc; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMR64f_Direct_16s_Sfs(pSrc:PIpp16s; pDst:PIpp16s; numIters:integer; pTaps:PIpp64f; tapsLen:integer; upFactor:integer; upPhase:integer; downFactor:integer; downPhase:integer; pDlyLine:PIpp16s; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMR64fc_Direct_16sc_Sfs(pSrc:PIpp16sc; pDst:PIpp16sc; numIters:integer; pTaps:PIpp64fc; tapsLen:integer; upFactor:integer; upPhase:integer; downFactor:integer; downPhase:integer; pDlyLine:PIpp16sc; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMR64f_Direct_16s_ISfs(pSrcDst:PIpp16s; numIters:integer; pTaps:PIpp64f; tapsLen:integer; upFactor:integer; upPhase:integer; downFactor:integer; downPhase:integer; pDlyLine:PIpp16s; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMR64fc_Direct_16sc_ISfs(pSrcDst:PIpp16sc; numIters:integer; pTaps:PIpp64fc; tapsLen:integer; upFactor:integer; upPhase:integer; downFactor:integer; downPhase:integer; pDlyLine:PIpp16sc; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMR32s_Direct_16s_Sfs(pSrc:PIpp16s; pDst:PIpp16s; numIters:integer; pTaps:PIpp32s; tapsLen:integer; tapsFactor:integer; upFactor:integer; upPhase:integer; downFactor:integer; downPhase:integer; pDlyLine:PIpp16s; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMR32sc_Direct_16sc_Sfs(pSrc:PIpp16sc; pDst:PIpp16sc; numIters:integer; pTaps:PIpp32sc; tapsLen:integer; tapsFactor:integer; upFactor:integer; upPhase:integer; downFactor:integer; downPhase:integer; pDlyLine:PIpp16sc; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMR32s_Direct_16s_ISfs(pSrcDst:PIpp16s; numIters:integer; pTaps:PIpp32s; tapsLen:integer; tapsFactor:integer; upFactor:integer; upPhase:integer; downFactor:integer; downPhase:integer; pDlyLine:PIpp16s; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIRMR32sc_Direct_16sc_ISfs(pSrcDst:PIpp16sc; numIters:integer; pTaps:PIpp32sc; tapsLen:integer; tapsFactor:integer; upFactor:integer; upPhase:integer; downFactor:integer; downPhase:integer; pDlyLine:PIpp16sc; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ ////////////////////////////////////////////////////////////////////////////
//  Names:      ippsFIR_Direct_16s_Sfs,
//              ippsFIR_Direct_16s_ISfs,
//              ippsFIROne_Direct_16s_Sfs,
//              ippsFIROne_Direct_16s_ISfs.
//  Purpose:    Directly filters a block of samples (or one sample in 'One'
//              case) through a single-rate FIR filter with fixed point taps
//              ( Q15 ).
//   Parameters:
//      pSrc            pointer to the input array.
//      src             input sample in 'One' case.
//      pDst            pointer to the output array.
//      pDstVal         pointer to the output sample in 'One' case.
//      pSrcDst         pointer to the input and output array for in-place
//                      operation.
//      pSrcDstVal      pointer to the input and output sample for in-place
//                      operation in 'One' case.
//      numIters        number of samples in the input array.
//      pTapsQ15        pointer to the array containing the taps values,
//                      the number of elements in the array is tapsLen.
//      tapsLen         number of elements in the array containing the taps
//                      values.
//      pDlyLine        pointer to the array containing the delay line values,
//                      the number of elements in the array is 2 * tapsLen.
//      pDlyLineIndex   pointer to the current delay line index.
//      scaleFactor     integer scaling factor value.
//   Return:
//      ippStsNullPtrErr       pointer(s) to data arrays is(are) NULL.
//      ippStsFIRLenErr        tapsLen is less than or equal to 0.
//      ippStsSizeErr          sampLen is less than or equal to 0.
//      ippStsDlyLineIndexErr  current delay line index is greater or equal
//                             tapsLen, or less than 0.
//      ippStsNoErr            otherwise.
}

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIR_Direct_16s_Sfs(pSrc:PIpp16s; pDst:PIpp16s; numIters:integer; pTapsQ15:PIpp16s; tapsLen:integer; pDlyLine:PIpp16s; out pDlyLineIndex:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIR_Direct_16s_ISfs(pSrcDst:PIpp16s; numIters:integer; pTapsQ15:PIpp16s; tapsLen:integer; pDlyLine:PIpp16s; out pDlyLineIndex:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIROne_Direct_16s_Sfs(src:Ipp16s; pDstVal:PIpp16s; pTapsQ15:PIpp16s; tapsLen:integer; pDlyLine:PIpp16s; out pDlyLineIndex:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases.  Use FIR function with State structure instead of this one. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsFIROne_Direct_16s_ISfs(pSrcDstVal:PIpp16s; pTapsQ15:PIpp16s; tapsLen:integer; pDlyLine:PIpp16s; out pDlyLineIndex:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//  Names:      ippsFIRGenLowpass_64f, ippsFIRGenHighpass_64f, ippsFIRGenBandpass_64f
//              ippsFIRGenBandstop_64f

//  Purpose:    This function computes the lowpass FIR filter coefficients
//              by windowing of ideal (infinite) filter coefficients segment
//
//  Parameters:
//      rfreq             cut off frequency (0 < rfreq < 0.5)
//
//      taps              pointer to the array which specifies
//                        the filter coefficients;
//
//      tapsLen           the number of taps in taps[] array (tapsLen>=5);
//
//      winType           the ippWindowType switch variable,
//                        which specifies the smoothing window type;
//
//      doNormal          if doNormal=0 the functions calculates
//                        non-normalized sequence of filter coefficients,
//                        in other cases the sequence of coefficients
//                        will be normalized.
//  Return:
//   ippStsNullPtrErr     the null pointer to taps[] array pass to function
//   ippStsSizeErr        the length of coefficient's array is less than five
//   ippStsSizeErr        the low or high frequency isn't satisfy
//                                    the condition 0 < rLowFreq < 0.5
//   ippStsNoErr          otherwise
//
}

function ippsFIRGenLowpass_64f(rfreq:Ipp64f; taps:PIpp64f; tapsLen:integer; winType:IppWinType; doNormal:IppBool):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


function ippsFIRGenHighpass_64f(rfreq:Ipp64f; taps:PIpp64f; tapsLen:integer; winType:IppWinType; doNormal:IppBool):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


function ippsFIRGenBandpass_64f(rLowFreq:Ipp64f; rHighFreq:Ipp64f; taps:PIpp64f; tapsLen:integer; winType:IppWinType; doNormal:IppBool):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


function ippsFIRGenBandstop_64f(rLowFreq:Ipp64f; rHighFreq:Ipp64f; taps:PIpp64f; tapsLen:integer; winType:IppWinType; doNormal:IppBool):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//                  Windowing functions
//  Note: to create the window coefficients you have to make two calls
//        Set(1,x,n) and Win(x,n)
///////////////////////////////////////////////////////////////////////////// }
{ /////////////////////////////////////////////////////////////////////////////
//  Names:            ippsWinBartlett
//  Parameters:
//   pSrcDst          pointer to the vector
//   len              length of the vector, window size
//  Return:
//   ippStsNullPtrErr    pointer to the vector is NULL
//   ippStsSizeErr       length of the vector is less 3
//   ippStsNoErr         otherwise
}

function ippsWinBartlett_16s_I(pSrcDst:PIpp16s; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsWinBartlett_16sc_I(pSrcDst:PIpp16sc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsWinBartlett_32f_I(pSrcDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsWinBartlett_32fc_I(pSrcDst:PIpp32fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsWinBartlett_16s(pSrc:PIpp16s; pDst:PIpp16s; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsWinBartlett_16sc(pSrc:PIpp16sc; pDst:PIpp16sc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsWinBartlett_32f(pSrc:PIpp32f; pDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsWinBartlett_32fc(pSrc:PIpp32fc; pDst:PIpp32fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsWinBartlett_64f(pSrc:PIpp64f; pDst:PIpp64f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsWinBartlett_64fc(pSrc:PIpp64fc; pDst:PIpp64fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsWinBartlett_64f_I(pSrcDst:PIpp64f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsWinBartlett_64fc_I(pSrcDst:PIpp64fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ /////////////////////////////////////////////////////////////////////////////
//  Names:            ippsWinHann
//  Parameters:
//   pSrcDst          pointer to the vector
//   len              length of the vector, window size
//  Return:
//   ippStsNullPtrErr    pointer to the vector is NULL
//   ippStsSizeErr       length of the vector is less 3
//   ippStsNoErr         otherwise
//  Functionality:    0.5*(1-cos(2*pi*n/(N-1)))
}

function ippsWinHann_16s_I(pSrcDst:PIpp16s; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsWinHann_16sc_I(pSrcDst:PIpp16sc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsWinHann_32f_I(pSrcDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsWinHann_32fc_I(pSrcDst:PIpp32fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsWinHann_16s(pSrc:PIpp16s; pDst:PIpp16s; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsWinHann_16sc(pSrc:PIpp16sc; pDst:PIpp16sc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsWinHann_32f(pSrc:PIpp32f; pDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsWinHann_32fc(pSrc:PIpp32fc; pDst:PIpp32fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsWinHann_64f_I(pSrcDst:PIpp64f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsWinHann_64fc_I(pSrcDst:PIpp64fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsWinHann_64f(pSrc:PIpp64f; pDst:PIpp64f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsWinHann_64fc(pSrc:PIpp64fc; pDst:PIpp64fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};



{ /////////////////////////////////////////////////////////////////////////////
//  Names:            ippsWinHamming
//  Parameters:
//   pSrcDst          pointer to the vector
//   len              length of the vector, window size
//  Return:
//   ippStsNullPtrErr    pointer to the vector is NULL
//   ippStsSizeErr       length of the vector is less 3
//   ippStsNoErr         otherwise
}

function ippsWinHamming_16s_I(pSrcDst:PIpp16s; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsWinHamming_16sc_I(pSrcDst:PIpp16sc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsWinHamming_32f_I(pSrcDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsWinHamming_32fc_I(pSrcDst:PIpp32fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsWinHamming_16s(pSrc:PIpp16s; pDst:PIpp16s; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsWinHamming_16sc(pSrc:PIpp16sc; pDst:PIpp16sc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsWinHamming_32f(pSrc:PIpp32f; pDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsWinHamming_32fc(pSrc:PIpp32fc; pDst:PIpp32fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsWinHamming_64f(pSrc:PIpp64f; pDst:PIpp64f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsWinHamming_64fc(pSrc:PIpp64fc; pDst:PIpp64fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsWinHamming_64f_I(pSrcDst:PIpp64f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsWinHamming_64fc_I(pSrcDst:PIpp64fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};



{ /////////////////////////////////////////////////////////////////////////////
//  Names:            ippsWinBlackman
//  Purpose:          multiply vector by Blackman windowing function
//  Parameters:
//   pSrcDst          pointer to the vector
//   len              length of the vector, window size
//   alpha            adjustable parameter associated with the
//                    Blackman windowing equation
//   alphaQ15         scaled (scale factor 15) version of the alpha
//   scaleFactor      scale factor of the output signal
//  Return:
//   ippStsNullPtrErr    pointer to the vector is NULL
//   ippStsSizeErr       length of the vector is less 3, for Opt it's 4
//   ippStsNoErr         otherwise
//  Notes:
//     parameter alpha value
//         WinBlackmaStd   : -0.16
//         WinBlackmaOpt   : -0.5 / (1+cos(2*pi/(len-1)))
}

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsWinBlackmanQ15_16s_ISfs(pSrcDst:PIpp16s; len:integer; alphaQ15:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsWinBlackmanQ15_16s_I(pSrcDst:PIpp16s; len:integer; alphaQ15:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsWinBlackmanQ15_16sc_I(pSrcDst:PIpp16sc; len:integer; alphaQ15:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsWinBlackman_16s_I(pSrcDst:PIpp16s; len:integer; alpha:single):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsWinBlackman_16sc_I(pSrcDst:PIpp16sc; len:integer; alpha:single):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsWinBlackman_32f_I(pSrcDst:PIpp32f; len:integer; alpha:single):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsWinBlackman_32fc_I(pSrcDst:PIpp32fc; len:integer; alpha:single):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsWinBlackmanQ15_16s(pSrc:PIpp16s; pDst:PIpp16s; len:integer; alphaQ15:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsWinBlackmanQ15_16sc(pSrc:PIpp16sc; pDst:PIpp16sc; len:integer; alphaQ15:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsWinBlackman_16s(pSrc:PIpp16s; pDst:PIpp16s; len:integer; alpha:single):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsWinBlackman_16sc(pSrc:PIpp16sc; pDst:PIpp16sc; len:integer; alpha:single):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsWinBlackman_32f(pSrc:PIpp32f; pDst:PIpp32f; len:integer; alpha:single):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsWinBlackman_32fc(pSrc:PIpp32fc; pDst:PIpp32fc; len:integer; alpha:single):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsWinBlackmanStd_16s_I(pSrcDst:PIpp16s; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsWinBlackmanStd_16sc_I(pSrcDst:PIpp16sc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsWinBlackmanStd_32f_I(pSrcDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsWinBlackmanStd_32fc_I(pSrcDst:PIpp32fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsWinBlackmanOpt_16s_I(pSrcDst:PIpp16s; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsWinBlackmanOpt_16sc_I(pSrcDst:PIpp16sc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsWinBlackmanOpt_32f_I(pSrcDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsWinBlackmanOpt_32fc_I(pSrcDst:PIpp32fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsWinBlackmanStd_16s(pSrc:PIpp16s; pDst:PIpp16s; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsWinBlackmanStd_16sc(pSrc:PIpp16sc; pDst:PIpp16sc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsWinBlackmanStd_32f(pSrc:PIpp32f; pDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsWinBlackmanStd_32fc(pSrc:PIpp32fc; pDst:PIpp32fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsWinBlackmanOpt_16s(pSrc:PIpp16s; pDst:PIpp16s; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsWinBlackmanOpt_16sc(pSrc:PIpp16sc; pDst:PIpp16sc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsWinBlackmanOpt_32f(pSrc:PIpp32f; pDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsWinBlackmanOpt_32fc(pSrc:PIpp32fc; pDst:PIpp32fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsWinBlackman_64f_I(pSrcDst:PIpp64f; len:integer; alpha:double):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsWinBlackman_64fc_I(pSrcDst:PIpp64fc; len:integer; alpha:double):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsWinBlackman_64f(pSrc:PIpp64f; pDst:PIpp64f; len:integer; alpha:double):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsWinBlackman_64fc(pSrc:PIpp64fc; pDst:PIpp64fc; len:integer; alpha:double):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsWinBlackmanStd_64f_I(pSrcDst:PIpp64f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsWinBlackmanStd_64fc_I(pSrcDst:PIpp64fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsWinBlackmanStd_64f(pSrc:PIpp64f; pDst:PIpp64f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsWinBlackmanStd_64fc(pSrc:PIpp64fc; pDst:PIpp64fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsWinBlackmanOpt_64f_I(pSrcDst:PIpp64f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsWinBlackmanOpt_64fc_I(pSrcDst:PIpp64fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsWinBlackmanOpt_64f(pSrc:PIpp64f; pDst:PIpp64f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsWinBlackmanOpt_64fc(pSrc:PIpp64fc; pDst:PIpp64fc; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};



{ /////////////////////////////////////////////////////////////////////////////
//  Names:            ippsWinKaiser
//  Purpose:          multiply vector by Kaiser windowing function
//  Parameters:
//   pSrcDst          pointer to the vector
//   len              length of the vector, window size
//   alpha            adjustable parameter associated with the
//                    Kaiser windowing equation
//   alphaQ15         scaled (scale factor 15) version of the alpha
//  Return:
//   ippStsNullPtrErr    pointer to the vector is NULL
//   ippStsSizeErr       length of the vector is less 1
//   ippStsHugeWinErr    window in function is huge
//   ippStsNoErr         otherwise
}

function ippsWinKaiser_16s(pSrc:PIpp16s; pDst:PIpp16s; len:integer; alpha:single):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsWinKaiser_16s_I(pSrcDst:PIpp16s; len:integer; alpha:single):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsWinKaiserQ15_16s(pSrc:PIpp16s; pDst:PIpp16s; len:integer; alphaQ15:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsWinKaiserQ15_16s_I(pSrcDst:PIpp16s; len:integer; alphaQ15:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsWinKaiser_16sc(pSrc:PIpp16sc; pDst:PIpp16sc; len:integer; alpha:single):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsWinKaiser_16sc_I(pSrcDst:PIpp16sc; len:integer; alpha:single):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsWinKaiserQ15_16sc(pSrc:PIpp16sc; pDst:PIpp16sc; len:integer; alphaQ15:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsWinKaiserQ15_16sc_I(pSrcDst:PIpp16sc; len:integer; alphaQ15:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsWinKaiser_32f(pSrc:PIpp32f; pDst:PIpp32f; len:integer; alpha:single):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsWinKaiser_32f_I(pSrcDst:PIpp32f; len:integer; alpha:single):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsWinKaiser_32fc(pSrc:PIpp32fc; pDst:PIpp32fc; len:integer; alpha:single):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsWinKaiser_32fc_I(pSrcDst:PIpp32fc; len:integer; alpha:single):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsWinKaiser_64f(pSrc:PIpp64f; pDst:PIpp64f; len:integer; alpha:Ipp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsWinKaiser_64f_I(pSrcDst:PIpp64f; len:integer; alpha:Ipp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsWinKaiser_64fc_I(pSrcDst:PIpp64fc; len:integer; alpha:Ipp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsWinKaiser_64fc(pSrc:PIpp64fc; pDst:PIpp64fc; len:integer; alpha:Ipp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//                  Median filter
///////////////////////////////////////////////////////////////////////////// }
{ /////////////////////////////////////////////////////////////////////////////
//  Names:      ippsFilterMedian
//  Purpose:    filter source data by the Median Filter
//  Parameters:
//   pSrcDst             pointer to the source vector
//   pSrc                pointer to the source vector
//   pDst                pointer to the destination vector
//   len                 length of the vector(s)
//   maskSize            median mask size (odd)
//  Return:
//   ippStsNullPtrErr              pointer(s) to the data is NULL
//   ippStsSizeErr                 length of the vector(s) is less or equal zero
//   ippStsEvenMedianMaskSize      median mask size is even warning
//   ippStsNoErr                   otherwise
//  Notes:
//      - if len is even than len=len-1
//      - value of not existed point equals to the last point value,
//        for example, x[-1]=x[0] or x[len]=x[len-1]
}
function ippsFilterMedian_32f_I(pSrcDst:PIpp32f; len:integer; maskSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFilterMedian_64f_I(pSrcDst:PIpp64f; len:integer; maskSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFilterMedian_16s_I(pSrcDst:PIpp16s; len:integer; maskSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFilterMedian_8u_I(pSrcDst:PIpp8u; len:integer; maskSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsFilterMedian_32f(pSrc:PIpp32f; pDst:PIpp32f; len:integer; maskSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFilterMedian_64f(pSrc:PIpp64f; pDst:PIpp64f; len:integer; maskSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFilterMedian_16s(pSrc:PIpp16s; pDst:PIpp16s; len:integer; maskSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFilterMedian_8u(pSrc:PIpp8u; pDst:PIpp8u; len:integer; maskSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsFilterMedian_32s_I(pSrcDst:PIpp32s; len:integer; maskSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFilterMedian_32s(pSrc:PIpp32s; pDst:PIpp32s; len:integer; maskSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ /////////////////////////////////////////////////////////////////////////////
//                  Statistic functions
///////////////////////////////////////////////////////////////////////////// }

{ /////////////////////////////////////////////////////////////////////////////
//  Name:            ippsNorm
//  Purpose:         calculate norm of vector
//     Inf   - calculate C-norm of vector:  n = MAX |src1|
//     L1    - calculate L1-norm of vector: n = SUM |src1|
//     L2    - calculate L2-norm of vector: n = SQRT(SUM |src1|^2)
//     L2Sqr - calculate L2-norm of vector: n = SUM |src1|^2
//  Parameters:
//    pSrc           source data pointer
//    len            length of vector
//    pNorm          pointer to result
//    scaleFactor    scale factor value
//  Returns:
//    ippStsNoErr       Ok
//    ippStsNullPtrErr  Some of pointers to input or output data are NULL
//    ippStsSizeErr     The length of vector is less or equal zero
//  Notes:
}
function ippsNorm_Inf_16s32f(pSrc:PIpp16s; len:integer; out pNorm:Ipp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsNorm_Inf_16s32s_Sfs(pSrc:PIpp16s; len:integer; out pNorm:Ipp32s; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsNorm_Inf_32f(pSrc:PIpp32f; len:integer; out pNorm:Ipp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsNorm_Inf_64f(pSrc:PIpp64f; len:integer; out pNorm:Ipp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsNorm_L1_16s32f(pSrc:PIpp16s; len:integer; out pNorm:Ipp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsNorm_L1_16s32s_Sfs(pSrc:PIpp16s; len:integer; out pNorm:Ipp32s; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsNorm_L1_32f(pSrc:PIpp32f; len:integer; out pNorm:Ipp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsNorm_L1_64f(pSrc:PIpp64f; len:integer; out pNorm:Ipp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsNorm_L2_16s32f(pSrc:PIpp16s; len:integer; out pNorm:Ipp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsNorm_L2_16s32s_Sfs(pSrc:PIpp16s; len:integer; out pNorm:Ipp32s; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsNorm_L2_32f(pSrc:PIpp32f; len:integer; out pNorm:Ipp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsNorm_L2_64f(pSrc:PIpp64f; len:integer; out pNorm:Ipp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsNorm_Inf_32fc32f(pSrc:PIpp32fc; len:integer; out pNorm:Ipp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsNorm_Inf_64fc64f(pSrc:PIpp64fc; len:integer; out pNorm:Ipp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsNorm_L1_32fc64f(pSrc:PIpp32fc; len:integer; out pNorm:Ipp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsNorm_L1_64fc64f(pSrc:PIpp64fc; len:integer; out pNorm:Ipp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsNorm_L2_32fc64f(pSrc:PIpp32fc; len:integer; out pNorm:Ipp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsNorm_L2_64fc64f(pSrc:PIpp64fc; len:integer; out pNorm:Ipp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsNorm_L1_16s64s_Sfs(pSrc:PIpp16s; len:integer; out pNorm:Ipp64s; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsNorm_L2Sqr_16s64s_Sfs(pSrc:PIpp16s; len:integer; out pNorm:Ipp64s; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//  Name:            ippsNormDiff
//  Purpose:         calculate norm of vectors
//     Inf   - calculate C-norm of vectors:  n = MAX |src1-src2|
//     L1    - calculate L1-norm of vectors: n = SUM |src1-src2|
//     L2    - calculate L2-norm of vectors: n = SQRT(SUM |src1-src2|^2)
//     L2Sqr - calculate L2-norm of vectors: n = SUM |src1-src2|^2
//  Parameters:
//    pSrc1, pSrc2   source data pointers
//    len            length of vector
//    pNorm          pointer to result
//    scaleFactor    scale factor value
//  Returns:
//    ippStsNoErr       Ok
//    ippStsNullPtrErr  Some of pointers to input or output data are NULL
//    ippStsSizeErr     The length of vector is less or equal zero
//  Notes:
}
function ippsNormDiff_Inf_16s32f(pSrc1:PIpp16s; pSrc2:PIpp16s; len:integer; out pNorm:Ipp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsNormDiff_Inf_16s32s_Sfs(pSrc1:PIpp16s; pSrc2:PIpp16s; len:integer; out pNorm:Ipp32s; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsNormDiff_Inf_32f(pSrc1:PIpp32f; pSrc2:PIpp32f; len:integer; out pNorm:Ipp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsNormDiff_Inf_64f(pSrc1:PIpp64f; pSrc2:PIpp64f; len:integer; out pNorm:Ipp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsNormDiff_L1_16s32f(pSrc1:PIpp16s; pSrc2:PIpp16s; len:integer; out pNorm:Ipp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsNormDiff_L1_16s32s_Sfs(pSrc1:PIpp16s; pSrc2:PIpp16s; len:integer; out pNorm:Ipp32s; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsNormDiff_L1_32f(pSrc1:PIpp32f; pSrc2:PIpp32f; len:integer; out pNorm:Ipp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsNormDiff_L1_64f(pSrc1:PIpp64f; pSrc2:PIpp64f; len:integer; out pNorm:Ipp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsNormDiff_L2_16s32f(pSrc1:PIpp16s; pSrc2:PIpp16s; len:integer; out pNorm:Ipp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsNormDiff_L2_16s32s_Sfs(pSrc1:PIpp16s; pSrc2:PIpp16s; len:integer; out pNorm:Ipp32s; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsNormDiff_L2_32f(pSrc1:PIpp32f; pSrc2:PIpp32f; len:integer; out pNorm:Ipp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsNormDiff_L2_64f(pSrc1:PIpp64f; pSrc2:PIpp64f; len:integer; out pNorm:Ipp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsNormDiff_Inf_32fc32f(pSrc1:PIpp32fc; pSrc2:PIpp32fc; len:integer; out pNorm:Ipp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsNormDiff_Inf_64fc64f(pSrc1:PIpp64fc; pSrc2:PIpp64fc; len:integer; out pNorm:Ipp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsNormDiff_L1_32fc64f(pSrc1:PIpp32fc; pSrc2:PIpp32fc; len:integer; out pNorm:Ipp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsNormDiff_L1_64fc64f(pSrc1:PIpp64fc; pSrc2:PIpp64fc; len:integer; out pNorm:Ipp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsNormDiff_L2_32fc64f(pSrc1:PIpp32fc; pSrc2:PIpp32fc; len:integer; out pNorm:Ipp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsNormDiff_L2_64fc64f(pSrc1:PIpp64fc; pSrc2:PIpp64fc; len:integer; out pNorm:Ipp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsNormDiff_L1_16s64s_Sfs(pSrc1:PIpp16s; pSrc2:PIpp16s; len:integer; out pNorm:Ipp64s; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsNormDiff_L2Sqr_16s64s_Sfs(pSrc1:PIpp16s; pSrc2:PIpp16s; len:integer; out pNorm:Ipp64s; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ /////////////////////////////////////////////////////////////////////////////
//                Cross-correlation Functions
///////////////////////////////////////////////////////////////////////////// }

{ /////////////////////////////////////////////////////////////////////////////
//  Names:  ippsCrossCorrNormGetBufferSize
//
//  Purpose:     Get the size (in bytes) of the buffer for ippsCrossCorrNorm's internal calculations.
//
//  Parameters:
//    src1Len     - Length of the first source vector.
//    src2Len     - Length of the second source vector.
//    dstLen      - Length of cross-correlation.
//    lowLag      - Cross-correlation lowest lag.
//    dataType    - Data type for convolution (Ipp32f|Ipp32fc|Ipp64f|Ipp64fc).
//    algType     - Selector for the algorithm type. Possible values are the results of composition
//                  of the  IppAlgType and IppsNormOp values.
//    pBufferSize - Pointer to the calculated buffer size (in bytes).
//  Return:
//    ippStsNoErr       - OK.
//    ippStsNullPtrErr  - pBufferSize is NULL.
//    ippStsSizeErr     - Vector's length is not positive.
//    ippStsDataTypeErr - Unsupported data type.
//    ippStsAlgTypeErr  - Unsupported algorithm or normalization type.
}

function ippsCrossCorrNormGetBufferSize(src1Len:integer; src2Len:integer; dstLen:integer; lowLag:integer; dataType:IppDataType; algType:IppEnum; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippsCrossCorrNorm_32f, ippsCrossCorrNorm_32fc
//              ippsCrossCorrNorm_64f, ippsCrossCorrNorm_64fc
//
//  Purpose:    Calculate the cross-correlation of two vectors.
//
//  Parameters:
//     pSrc1   - Pointer to the first source vector.
//     src1Len - Length of the first source vector.
//     pSrc2   - Pointer to the second source vector.
//     src2Len - Length of the second source vector.
//     pDst    - Pointer to the cross correlation.
//     dstLen  - Length of the cross-correlation.
//     lowLag  - Cross-correlation lowest lag.
//     algType - Selector for the algorithm type. Possible values are the results of composition
//               of the  IppAlgType and IppsNormOp values.
//     pBuffer - Pointer to the buffer for internal calculations.
//  Return:
//    ippStsNoErr      - OK.
//    ippStsNullPtrErr - One of the pointers is NULL.
//    ippStsSizeErr    - Vector's length is not positive.
//    ippStsAlgTypeErr - Unsupported algorithm or normalization type.
}

function ippsCrossCorrNorm_32f(pSrc1:PIpp32f; src1Len:integer; pSrc2:PIpp32f; src2Len:integer; pDst:PIpp32f; dstLen:integer; lowLag:integer; algType:IppEnum; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsCrossCorrNorm_64f(pSrc1:PIpp64f; src1Len:integer; pSrc2:PIpp64f; src2Len:integer; pDst:PIpp64f; dstLen:integer; lowLag:integer; algType:IppEnum; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsCrossCorrNorm_32fc(pSrc1:PIpp32fc; src1Len:integer; pSrc2:PIpp32fc; src2Len:integer; pDst:PIpp32fc; dstLen:integer; lowLag:integer; algType:IppEnum; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsCrossCorrNorm_64fc(pSrc1:PIpp64fc; src1Len:integer; pSrc2:PIpp64fc; src2Len:integer; pDst:PIpp64fc; dstLen:integer; lowLag:integer; algType:IppEnum; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippsCrossCorr_32f,  ippsCrossCorr_64f,
//              ippsCrossCorr_32fc, ippsCrossCorr_64fc
//
//  Purpose:    Calculate the cross-correlation of two vectors.
//
//  Arguments:
//     pSrc1   - pointer to the vector_1 source
//     src1Len - vector_1 source length
//     pSrc2   - pointer to the vector_2 source
//     src2Len - vector_2 source length
//     pDst    - pointer to the cross correlation
//     dstLen  - length of cross-correlation
//     lowLag  - cross-correlation lowest lag
//  Return:
//   ippStsNoErr       Ok
//   ippStsNullPtrErr  either pSrc1 or(and) pSrc2 are NULL
//   ippStsSizeErr     vector's length is not positive
//
}

// DEPRECATED. Removal 2H 2014 or later. Use ippsCrossCorrNorm_32f with algType=ippsNormNone instead. For more details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsCrossCorr_32f(pSrc1:PIpp32f; src1Len:integer; pSrc2:PIpp32f; src2Len:integer; pDst:PIpp32f; dstLen:integer; lowLag:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Removal 2H 2014 or later. Use ippsCrossCorrNorm_64f with algType=ippsNormNone instead. For more details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsCrossCorr_64f(pSrc1:PIpp64f; src1Len:integer; pSrc2:PIpp64f; src2Len:integer; pDst:PIpp64f; dstLen:integer; lowLag:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Removal 2H 2014 or later. Use ippsCrossCorrNorm_32fc with algType=ippsNormNone instead. For more details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsCrossCorr_32fc(pSrc1:PIpp32fc; src1Len:integer; pSrc2:PIpp32fc; src2Len:integer; pDst:PIpp32fc; dstLen:integer; lowLag:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Removal 2H 2014 or later. Use ippsCrossCorrNorm_64fc with algType=ippsNormNone instead. For more details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsCrossCorr_64fc(pSrc1:PIpp64fc; src1Len:integer; pSrc2:PIpp64fc; src2Len:integer; pDst:PIpp64fc; dstLen:integer; lowLag:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};



{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippsCrossCorr_16s_Sfs
//              ippsCrossCorr_16s64s
//
//  Purpose:    Calculate Cross Correlation and Scale Result (with saturate)
//
//  Arguments:
//     pSrc1   - pointer to the vector_1 source
//     src1Len - vector_1 source length
//     pSrc2   - pointer to the vector_2 source
//     src2Len - vector_2 source length
//     pDst    - pointer to the cross correlation
//     dstLen  - length of cross-correlation
//     lowLag  - cross-correlation lowest lag
//     scaleFactor - scale factor value
//  Return:
//   ippStsNoErr       Ok
//   ippStsNullPtrErr  either pSrc1 or(and) pSrc2 are NULL
//   ippStsSizeErr     vector's length is not positive
//
}
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use ippsConvert_16s32f and ippsCrossCorrNorm_32f with algType=ippsNormNone instead. For more details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsCrossCorr_16s_Sfs(pSrc1:PIpp16s; src1Len:integer; pSrc2:PIpp16s; src2Len:integer; pDst:PIpp16s; dstLen:integer; lowLag:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsCrossCorr_16s64s(pSrc1:PIpp16s; src1Len:integer; pSrc2:PIpp16s; src2Len:integer; pDst:PIpp64s; dstLen:integer; lowLag:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
{ /////////////////////////////////////////////////////////////////////////////
//                AutoCorrelation Functions
///////////////////////////////////////////////////////////////////////////// }

{ /////////////////////////////////////////////////////////////////////////////
//  Names:  ippsAutoCorrNormGetBufferSize
//
//  Purpose:     : Get the size (in bytes) of the buffer for ippsAutoCorrNorm's internal calculations.
//
//  Parameters:
//     srcLen      - Source vector length.
//     dstLen      - Length of auto-correlation.
//     dataType    - Data type for auto corelation (Ipp32f|Ipp32fc|Ipp64f|Ipp64fc).
//     algType     - Selector for the algorithm type.  Possible values are the results of
//                   composition of the IppAlgType and IppsNormOp values.
//     pBufferSize - Pointer to the calculated buffer size (in bytes).
//  Return:
//   ippStsNoErr       - OK.
//   ippStsNullPtrErr  - pBufferSize is NULL.
//   ippStsSizeErr     - Vector's length is not positive.
//   ippStsDataTypeErr - Unsupported data type.
//   ippStsAlgTypeErr  - Unsupported algorithm or normalization type.
}

function ippsAutoCorrNormGetBufferSize(srcLen:integer; dstLen:integer; dataType:IppDataType; algType:IppEnum; out pBufferSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ /////////////////////////////////////////////////////////////////////////////
//  Names:  ippsAutoCorrNorm_32f,  ippsAutoCorrNorm_64f
//          ippsAutoCorrNorm_32fc,  ippsAutoCorrNorm_64fc
//
//  Purpose:    Calculate the auto-correlation,
//              ippNormNone specifies the normal auto-correlation.
//              ippNormA specifies the biased auto-correlation
//              (the resulting values are divided by srcLen).
//              ippNormB specifies the unbiased auto-correlation
//              (the resulting values are divided by ( srcLen - n ),
//              where "n" indicates current iteration).
//
//  Parameters:
//     pSrc    - Pointer to the source vector.
//     srcLen  - Source vector length.
//     pDst    - Pointer to the auto-correlation result vector.
//     dstLen  - Length of auto-correlation.
//     algType - Selector for the algorithm type. Possible values are the results
//               of composition of the  IppAlgType and IppsNormOp values.
//     pBuffer - Pointer to the buffer for internal calculations.
//  Return:
//   ippStsNoErr      - OK.
//   ippStsNullPtrErr - One of the pointers is NULL.
//   ippStsSizeErr    - Vector's length is not positive.
//   ippStsAlgTypeErr - Unsupported algorithm or normalization type.
}

function ippsAutoCorrNorm_32f(pSrc:PIpp32f; srcLen:integer; pDst:PIpp32f; dstLen:integer; algType:IppEnum; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsAutoCorrNorm_64f(pSrc:PIpp64f; srcLen:integer; pDst:PIpp64f; dstLen:integer; algType:IppEnum; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsAutoCorrNorm_32fc(pSrc:PIpp32fc; srcLen:integer; pDst:PIpp32fc; dstLen:integer; algType:IppEnum; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsAutoCorrNorm_64fc(pSrc:PIpp64fc; srcLen:integer; pDst:PIpp64fc; dstLen:integer; algType:IppEnum; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};



{ /////////////////////////////////////////////////////////////////////////////
//  Names:  ippsAutoCorr_32f,  ippsAutoCorr_NormA_32f,  ippsAutoCorr_NormB_32f,
//          ippsAutoCorr_64f,  ippsAutoCorr_NormA_64f,  ippsAutoCorr_NormB_64f,
//          ippsAutoCorr_32fc, ippsAutoCorr_NormA_32fc, ippsAutoCorr_NormB_32fc,
//          ippsAutoCorr_64fc, ippsAutoCorr_NormA_64fc, ippsAutoCorr_NormB_64fc,
//
//  Purpose:    Calculate the autocorrelation,
//              without suffix NormX specifies that the normal autocorrelation to be
//              computed;
//              suffix NormA specifies that the biased autocorrelation to be
//              computed (the resulting values are to be divided on srcLen);
//              suffix NormB specifies that the unbiased autocorrelation to be
//              computed (the resulting values are to be divided on ( srcLen - n ),
//              where "n" means current iteration).
//
//  Arguments:
//     pSrc   - pointer to the source vector
//     srcLen - source vector length
//     pDst   - pointer to the auto-correlation result vector
//     dstLen - length of auto-correlation
//  Return:
//   ippStsNoErr       Ok
//   ippStsNullPtrErr  either pSrc or(and) pDst are NULL
//   ippStsSizeErr     vector's length is not positive
}

// DEPRECATED. Removal 2H 2014 or later. Use ippsAutoCorrNorm_32f with algType=ippsNormNone instead. For more details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsAutoCorr_32f(pSrc:PIpp32f; srcLen:integer; pDst:PIpp32f; dstLen:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Removal 2H 2014 or later. Use ippsAutoCorrNorm_32f with algType=ippsNormA instead. For more details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsAutoCorr_NormA_32f(pSrc:PIpp32f; srcLen:integer; pDst:PIpp32f; dstLen:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Removal 2H 2014 or later. Use ippsAutoCorrNorm_32f with algType=ippsNormB instead. For more details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsAutoCorr_NormB_32f(pSrc:PIpp32f; srcLen:integer; pDst:PIpp32f; dstLen:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Removal 2H 2014 or later. Use ippsAutoCorrNorm_64f with algType=ippsNormNone instead. For more details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsAutoCorr_64f(pSrc:PIpp64f; srcLen:integer; pDst:PIpp64f; dstLen:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Removal 2H 2014 or later. Use ippsAutoCorrNorm_64f with algType=ippsNormA instead. For more details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsAutoCorr_NormA_64f(pSrc:PIpp64f; srcLen:integer; pDst:PIpp64f; dstLen:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Removal 2H 2014 or later. Use ippsAutoCorrNorm_64f with algType=ippsNormB instead. For more details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsAutoCorr_NormB_64f(pSrc:PIpp64f; srcLen:integer; pDst:PIpp64f; dstLen:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Removal 2H 2014 or later. Use ippsAutoCorrNorm_32fc with algType=ippsNormNone instead. For more details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsAutoCorr_32fc(pSrc:PIpp32fc; srcLen:integer; pDst:PIpp32fc; dstLen:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Removal 2H 2014 or later. Use ippsAutoCorrNorm_32fc with algType=ippsNormA instead. For more details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsAutoCorr_NormA_32fc(pSrc:PIpp32fc; srcLen:integer; pDst:PIpp32fc; dstLen:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Removal 2H 2014 or later. Use ippsAutoCorrNorm_32fc with algType=ippsNormB instead. For more details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsAutoCorr_NormB_32fc(pSrc:PIpp32fc; srcLen:integer; pDst:PIpp32fc; dstLen:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Removal 2H 2014 or later. Use ippsAutoCorrNorm_64fc with algType=ippsNormNone instead. For more details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsAutoCorr_64fc(pSrc:PIpp64fc; srcLen:integer; pDst:PIpp64fc; dstLen:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Removal 2H 2014 or later. Use ippsAutoCorrNorm_64fc with algType=ippsNormA instead. For more details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsAutoCorr_NormA_64fc(pSrc:PIpp64fc; srcLen:integer; pDst:PIpp64fc; dstLen:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. Removal 2H 2014 or later. Use ippsAutoCorrNorm_64fc with algType=ippsNormB instead. For more details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsAutoCorr_NormB_64fc(pSrc:PIpp64fc; srcLen:integer; pDst:PIpp64fc; dstLen:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};



{ /////////////////////////////////////////////////////////////////////////////
//  Names:  ippsAutoCorr_16s_Sfs,
//          ippsAutoCorr_NormA_16s_Sfs,
//          ippsAutoCorr_NormB_16s_Sfs
//
//  Purpose:    Calculate the autocorrelation,
//              without suffix NormX specifies that the normal autocorrelation to be
//              computed;
//              suffix NormA specifies that the biased autocorrelation to be
//              computed (the resulting values are to be divided on srcLen);
//              suffix NormB specifies that the unbiased autocorrelation to be
//              computed (the resulting values are to be divided on ( srcLen - n ),
//              where n means current iteration).
//
//  Arguments:
//     pSrc   - pointer to the source vector
//     srcLen - source vector length
//     pDst   - pointer to the auto-correlation result vector
//     dstLen - length of auto-correlation
//     scaleFactor - scale factor value
//  Return:
//   ippStsNoErr       Ok
//   ippStsNullPtrErr  either pSrc or(and) pDst are NULL
//   ippStsSizeErr     vector's length is not positive
}

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use ippsConvert_16s32f and ippsAutoCorrNorm_32f with algType=ippsNormNone instead. For more details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsAutoCorr_16s_Sfs(pSrc:PIpp16s; srcLen:integer; pDst:PIpp16s; dstLen:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use ippsConvert_16s32f and ippsAutoCorrNorm_32f with algType=ippsNormA instead. For more details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsAutoCorr_NormA_16s_Sfs(pSrc:PIpp16s; srcLen:integer; pDst:PIpp16s; dstLen:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use ippsConvert_16s32f and ippsAutoCorrNorm_32f with algType=ippsNormB instead. For more details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsAutoCorr_NormB_16s_Sfs(pSrc:PIpp16s; srcLen:integer; pDst:PIpp16s; dstLen:integer; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};



{ /////////////////////////////////////////////////////////////////////////////
//                  Sampling functions
///////////////////////////////////////////////////////////////////////////// }
{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippsSampleUp
//  Purpose:    upsampling, i.e. expansion of input vector to get output vector
//              by simple adding zeroes between input elements
//  Parameters:
//   pSrc   (in)   pointer to the input vector
//   pDst   (in)   pointer to the output vector
//   srcLen (in)   length of input vector
//   dstLen (out)  pointer to the length of output vector
//   factor (in)   the number of output elements, corresponding to one element
//                 of input vector.
//   phase(in-out) pointer to value, that is the position (0, ..., factor-1) of
//                 element from input vector in the group of factor elements of
//                 output vector. Out value is ready to continue upsampling with
//                 the same factor (out = in).
//
//  Return:
//   ippStsNullPtrErr        one or several pointers pSrc, pDst, dstLen or phase
//                         is NULL
//   ippStsSizeErr           length of input vector is less or equal zero
//   ippStsSampleFactorErr   factor <= 0
//   ippStsSamplePhaseErr    *phase < 0 or *phase >= factor
//   ippStsNoErr             otherwise
}
function ippsSampleUp_32f(pSrc:PIpp32f; srcLen:integer; pDst:PIpp32f; out dstLen:integer; factor:integer; var phase:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSampleUp_32fc(pSrc:PIpp32fc; srcLen:integer; pDst:PIpp32fc; out dstLen:integer; factor:integer; var phase:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSampleUp_64f(pSrc:PIpp64f; srcLen:integer; pDst:PIpp64f; out dstLen:integer; factor:integer; var phase:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSampleUp_64fc(pSrc:PIpp64fc; srcLen:integer; pDst:PIpp64fc; out dstLen:integer; factor:integer; var phase:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSampleUp_16s(pSrc:PIpp16s; srcLen:integer; pDst:PIpp16s; out dstLen:integer; factor:integer; var phase:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSampleUp_16sc(pSrc:PIpp16sc; srcLen:integer; pDst:PIpp16sc; out dstLen:integer; factor:integer; var phase:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippsSampleDown
//  Purpose:    subsampling, i.e. only one of "factor" elements of input vector
//              are placed to output vector
//  Parameters:
//   pSrc   (in)   pointer to the input vector
//   pDst   (in)   pointer to the output vector
//   srcLen (in)   length of input vector
//   dstLen (out)  pointer to the length of output vector
//   factor (in)   the number of input elements, corresponding to one element
//                 of output vector.
//   phase(in-out) pointer to value, that is the position (0, ..., factor-1) of
//                 chosen element in the group of "factor" elements. Out value
//                 of *phase is ready to continue subsampling with the same
//                 factor.
//
//  Return:
//   ippStsNullPtrErr        one or several pointers pSrc, pDst, dstLen or phase
//                        is NULL
//   ippStsSizeErr           length of input vector is less or equal zero
//   ippStsSampleFactorErr   factor <= 0
//   ippStsSamplePhaseErr    *phase < 0 or *phase >=factor
//   ippStsNoErr             otherwise
}
function ippsSampleDown_32f(pSrc:PIpp32f; srcLen:integer; pDst:PIpp32f; out dstLen:integer; factor:integer; var phase:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSampleDown_32fc(pSrc:PIpp32fc; srcLen:integer; pDst:PIpp32fc; out dstLen:integer; factor:integer; var phase:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSampleDown_64f(pSrc:PIpp64f; srcLen:integer; pDst:PIpp64f; out dstLen:integer; factor:integer; var phase:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSampleDown_64fc(pSrc:PIpp64fc; srcLen:integer; pDst:PIpp64fc; out dstLen:integer; factor:integer; var phase:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSampleDown_16s(pSrc:PIpp16s; srcLen:integer; pDst:PIpp16s; out dstLen:integer; factor:integer; var phase:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSampleDown_16sc(pSrc:PIpp16sc; srcLen:integer; pDst:PIpp16sc; out dstLen:integer; factor:integer; var phase:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};



{ ///////////////////////////////////////////////////////////////////////////
//  Names:      ippsGetVarPointDV_16sc
//  Purpose:    Fills the array VariantPoint with information about 8
//              (if State = 32,64) or 4 (if State = 16) closest to the
//              refPoint complex points (stores the indexes in the
//              offset table and errors between refPoint and the
//              current point)
//  Return:
//  ippStsNoErr         Ok
//  ippStsNullPtrErr    Any of the specified pointers is NULL
//  Parameters:
//  pSrc            pointer to the reference point in format 9:7
//  pDst            pointer to the closest to the reference point left
//                  and bottom comlexpoint in format 9:7
//  pVariantPoint   pointer to the array where the information is stored
//  pLabel          pointer to the labels table
//  state           number of states of the convolution coder
}
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsGetVarPointDV_16sc(pSrc:PIpp16sc; pDst:PIpp16sc; pVariantPoint:PIpp16sc; pLabel:PIpp8u; state:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ ///////////////////////////////////////////////////////////////////////////
//  Names:      ippsCalcStatesDV_16sc
//  Purpose:    Computes possible states of the Viterbi decoder
//  Return:
//  ippStsNoErr         OK
//  ippStsNullPtrErr    Any of the specified pointers is NULL
//  Parameters:
//  pPathError          pointer to the table of path error metrics
//  pNextState          pointer to the next state table
//  pBranchError        pointer to the branch error table
//  pCurrentSubsetPoint pointer to the current 4D subset
//  pPathTable          pointer to the Viterbi path table
//  state               number of states of the convolution coder
//  presentIndex        start index in Viterbi Path table
}
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsCalcStatesDV_16sc(pathError:PIpp16u; pNextState:PIpp8u; pBranchError:PIpp16u; pCurrentSubsetPoint:PIpp16s; pPathTable:PIpp16s; state:integer; presentIndex:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ ///////////////////////////////////////////////////////////////////////////
//  Names:      ippsBuildSymblTableDV4D_16s
//  Purpose:    Fills the array with an information of possible 4D symbols
//  Return:
//  ippStsNoErr         OK
//  ippStsNullPtrErr    Any of the specified pointers is NULL
//  Parameters:
//  pVariantPoint       pointer to the array of possible 2D symbols
//  pCurrentSubsetPoint pointer to the current array of 4D symbols
//  state               number of states of the convolution coder
//  bitInversion        bit Inversion
}
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsBuildSymblTableDV4D_16sc(pVariantPoint:PIpp16sc; pCurrentSubsetPoint:PIpp16sc; state:integer; bitInversion:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ ///////////////////////////////////////////////////////////////////////////
//  Names:      ippsUpdatePathMetricsDV_16u
//  Purpose:    Searches for the minimum path metric and updates states of the decoder
//  Return:
//  ippStsNoErr         OK
//  ippStsNullPtrErr    Any of the specified pointers is NULL
//  Parameters:
//  pBranchError        pointer to the branch error table
//  pMinPathError       pointer to the current minimum path error metric
//  pMinSost            pointer to the state with minimum path metric
//  pPathError          pointer to table of path error metrics
//  state               number of states of the convolution coder
}
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsUpdatePathMetricsDV_16u(pBranchError:PIpp16u; pMinPathError:PIpp16u; pMinSost:PIpp8u; pPathError:PIpp16u; state:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ /////////////////////////////////////////////////////////////////////////////
//                  Definitions for Hilbert Functions
///////////////////////////////////////////////////////////////////////////// }

type
  PIppsHilbertSpec_32f32fc = ^TIppsHilbertSpec_32f32fc;
  TIppsHilbertSpec_32f32fc = record end;

  PIppsHilbertSpec_16s32fc = ^TIppsHilbertSpec_16s32fc;
  TIppsHilbertSpec_16s32fc = record end;

  PIppsHilbertSpec_16s16sc = ^TIppsHilbertSpec_16s16sc;
  TIppsHilbertSpec_16s16sc = record end;

{ /////////////////////////////////////////////////////////////////////////////
//                  Hilbert Context Functions
///////////////////////////////////////////////////////////////////////////// }
{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippsHilbertInitAlloc_32f32fc, ippsHilbertFree_32f32fc,
//              ippsHilbertInitAlloc_16s32fc, ippsHilbertFree_16s32fc,
//              ippsHilbertInitAlloc_16s16sc, ippsHilbertFree_16s16sc
//  Purpose:    create, initialize and delete Hilbert context
//  Arguments:
//     pSpec    - where write pointer to new context
//     length   - number of samples in Hilbert
//     hint     - code specific use hints (DFT)
//  Return:
//     ippStsNoErr            no errors
//     ippStsNullPtrErr       pSpec == NULL
//     ippStsSizeErr          bad the length value
//     ippStsContextMatchErr  bad context identifier
//     ippStsMemAllocErr      memory allocation error
}

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsHilbertInitAlloc_32f32fc(out pSpec:PIppsHilbertSpec_32f32fc; length:integer; hint:IppHintAlgorithm):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsHilbertInitAlloc_16s32fc(out pSpec:PIppsHilbertSpec_16s32fc; length:integer; hint:IppHintAlgorithm):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsHilbertInitAlloc_16s16sc(out pSpec:PIppsHilbertSpec_16s16sc; length:integer; hint:IppHintAlgorithm):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsHilbertFree_32f32fc(pSpec:PIppsHilbertSpec_32f32fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsHilbertFree_16s32fc(pSpec:PIppsHilbertSpec_16s32fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsHilbertFree_16s16sc(pSpec:PIppsHilbertSpec_16s16sc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ /////////////////////////////////////////////////////////////////////////////
//                  Hilbert Transform Functions
///////////////////////////////////////////////////////////////////////////// }
{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippsHilbert_32f32fc,
//              ippsHilbert_16s32fc,
//              ippsHilbert_16s16sc_Sfs
//  Purpose:    compute Hilbert transform of the real signal
//  Arguments:
//     pSrc     - pointer to source real signal
//     pDst     - pointer to destination complex signal
//     pSpec    - pointer to Hilbert context
//     scaleFactor - scale factor for output signal
//  Return:
//     ippStsNoErr            no errors
//     ippStsNullPtrErr       pointer(s) to the data is NULL
//     ippStsContextMatchErr  bad context identifier
//     ippStsMemAllocErr      memory allocation error
}

function ippsHilbert_32f32fc(pSrc:PIpp32f; pDst:PIpp32fc; pSpec:PIppsHilbertSpec_32f32fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsHilbert_16s32fc(pSrc:PIpp16s; pDst:PIpp32fc; pSpec:PIppsHilbertSpec_16s32fc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsHilbert_16s16sc_Sfs(pSrc:PIpp16s; pDst:PIpp16sc; pSpec:PIppsHilbertSpec_16s16sc; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

type
  PIppsFIRSparseState_32f = ^TIppsFIRSparseState_32f;
  TIppsFIRSparseState_32f = record end;

  PIppsIIRSparseState_32f = ^TIppsIIRSparseState_32f;
  TIppsIIRSparseState_32f = record end;

{ ////////////////////////////////////////////////////////////////////////////
//  Name:         ippsFIRSparseGetStateSize,
//                ippsFIRSparseInit
//  Purpose:      ippsFIRSparseGetStateSize - calculates the size of the FIRSparse
//                                            State  structure;
//                ippsFIRSparseInit - initialize FIRSparse state - set non-zero taps,
//                their positions and delay line using external memory buffer;
//  Parameters:
//      pNZTaps     - pointer to the non-zero filter coefficients;
//      pNZTapPos   - pointer to the positions of non-zero filter coefficients;
//      nzTapsLen   - number of non-zero coefficients;
//      pDlyLine    - pointer to the delay line values, can be NULL;
//      pState      - pointer to the FIRSparse state created or NULL;
//      order       - order of FIRSparse filter
//      pStateSize  - pointer where to store the calculated FIRSparse State
//                    structuresize (in bytes);
//   Return:
//      status      - status value returned, its value are
//         ippStsNullPtrErr       - pointer(s) to the data is NULL
//         ippStsFIRLenErr        - nzTapsLen <= 0
//         ippStsSparseErr        - non-zero tap positions are not in ascending order,
//                                  negative or repeated.
//         ippStsNoErr            - otherwise
}

function ippsFIRSparseGetStateSize_32f(nzTapsLen:integer; order:integer; out pStateSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsFIRSparseInit_32f(out pState:PIppsFIRSparseState_32f; pNZTaps:PIpp32f; pNZTapPos:PIpp32s; nzTapsLen:integer; pDlyLine:PIpp32f; pBuffer:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ ////////////////////////////////////////////////////////////////////////////
//  Name:         ippsIIRSparseGetStateSize,
//                ippsIIRSparseInit
//  Purpose:      ippsIIRSparseGetStateSize - calculates the size of the
//                                            IIRSparse State structure;
//                ippsIIRSparseInit - initialize IIRSparse state - set non-zero taps,
//                their positions and delay line using external memory buffer;
//  Parameters:
//      pNZTaps     - pointer to the non-zero filter coefficients;
//      pNZTapPos   - pointer to the positions of non-zero filter coefficients;
//      nzTapsLen1,
//      nzTapsLen2  - number of non-zero coefficients according to the IIRSparseformula;
//      pDlyLine    - pointer to the delay line values, can be NULL;
//      pState      - pointer to the IIR state created or NULL;
//      pStateSize  - pointer where to store the calculated IIR State structure
//                                                             size (in bytes);
//   Return:
//      status      - status value returned, its value are
//         ippStsNullPtrErr       - pointer(s) to the data is NULL
//         ippStsIIROrderErr      - nzTapsLen1 <= 0 or nzTapsLen2 < 0
//         ippStsSparseErr        - non-zero tap positions are not in ascending order,
//                                  negative or repeated.
//         ippStsNoErr            - otherwise
}

function ippsIIRSparseGetStateSize_32f(nzTapsLen1:integer; nzTapsLen2:integer; order1:integer; order2:integer; out pStateSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsIIRSparseInit_32f(out pState:PIppsIIRSparseState_32f; pNZTaps:PIpp32f; pNZTapPos:PIpp32s; nzTapsLen1:integer; nzTapsLen2:integer; pDlyLine:PIpp32f; pBuf:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//  Names:         ippsFIRSparse
//  Purpose:       FIRSparse filter with float taps. Vector filtering
//  Parameters:
//      pSrc        - pointer to the input vector
//      pDst        - pointer to the output vector
//      len         - length data vector
//      pState      - pointer to the filter state
//  Return:
//      ippStsNullPtrErr       - pointer(s) to the data is NULL
//      ippStsSizeErr          - length of the vectors <= 0
//      ippStsNoErr            - otherwise
}

function ippsFIRSparse_32f(pSrc:PIpp32f; pDst:PIpp32f; len:integer; pState:PIppsFIRSparseState_32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//  Names:         ippsFIRSparseSetDlyLine_32f
//                 ippsFIRSparseGetDlyLine_32f
//  Purpose:       Get(set) delay line
//  Parameters:
//      pState      - pointer to the filter state
//      pDlyLine    - pointer to the delay line values, can be NULL;
//  Return:
//      ippStsNullPtrErr       - pointer(s) to the data is NULL
}

function ippsFIRSparseSetDlyLine_32f(pState:PIppsFIRSparseState_32f; pDlyLine:PIpp32f):IppStatus; stdcall; external  ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFIRSparseGetDlyLine_32f(pState:PIppsFIRSparseState_32f; pDlyLine:PIpp32f):IppStatus; stdcall; external  ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
{ /////////////////////////////////////////////////////////////////////////////
//  Names:         ippsIIRSparse
//  Purpose:       IIRSparse filter with float taps. Vector filtering
//  Parameters:
//      pSrc                - pointer to input vector
//      pDst                - pointer to output vector
//      len                 - length of the vectors
//      pState              - pointer to the filter state
//  Return:
//      ippStsNullPtrErr       - pointer(s) to the data is NULL
//      ippStsSizeErr          - length of the vectors <= 0
//      ippStsNoErr            - otherwise
}

function ippsIIRSparse_32f(pSrc:PIpp32f; pDst:PIpp32f; len:integer; pState:PIppsIIRSparseState_32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};



{ /////////////////////////////////////////////////////////////////////////////
//  Name:       ippsAddProductC
//  Purpose:    multiplies elements of of a vector by a constant and adds product to
//              the accumulator vector
//  Parameters:
//    pSrc                 pointer to the source vector
//    val                  constant value
//    pSrcDst              pointer to the source/destination (accumulator) vector
//    len                  length of the vectors
//  Return:
//    ippStsNullPtrErr     pointer to the vector is NULL
//    ippStsSizeErr        length of the vectors is less or equal zero
//    ippStsNoErr          otherwise
//
//  Notes:                 pSrcDst[n] = pSrcDst[n] + pSrc[n] * val, n=0,1,2,..len-1.
}

function ippsAddProductC_32f(pSrc:PIpp32f; val:Ipp32f; pSrcDst:PIpp32f; len:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
{ ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  Name:  ippsSumWindow_8u32f      ippsSumWindow_16s32f
//  Purpose:
//  Return:
//    ippStsNoErr        Ok
//    ippStsNullPtrErr   one or more pointers are NULL
//    ippStsMaskSizeErr  maskSize has a field with zero, or negative value
//  Arguments:
//   pSrc        Pointer to the source vector
//   pDst        Pointer to the destination vector
//   maskSize    Size of the mask in pixels
}
function ippsSumWindow_8u32f(pSrc:PIpp8u; pDst:PIpp32f; len:integer; maskSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsSumWindow_16s32f(pSrc:PIpp16s; pDst:PIpp32f; len:integer; maskSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  Name:  ippsCountInRange_32s
//  Purpose: Computes the number of vector elements falling within the specified range.
//  Return:
//     ippStsNoErr       No errors, it's OK
//     ippStsNullPtrErr  Either pSrc or pCounts equals to zero.
//     ippStsLengthErr   The vector's length is less than or equals to zero.
//  Arguments:
//     pSrc              A pointer to the source vector.
//     len               Number of the vector elements.
//     pCounts           A pointer to the output result.
//     lowerBound        The upper boundary of the range.
//     uppreBound        The lower boundary of the range.
}
function ippsCountInRange_32s(pSrc:PIpp32s; len:integer; out pCounts:integer; lowerBound:Ipp32s; upperBound:Ipp32s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{
//  Purpose:            Creates ramp vector
//
//  Parameters:
//    pDst              A pointer to the destination vector
//    len               Vector's length
//    offset            Offset value
//    slope             Slope coefficient
//
//  Return:
//    ippStsNoErr       No error
//    ippStsNullPtrErr  pDst pointer is NULL
//    ippStsBadSizeErr  Vector's length is less or equal zero
//    ippStsNoErr       No error
//
//  Notes:              Dst[n] = offset + slope * n
//
}

function ippsVectorSlope_8u(pDst:PIpp8u; len:integer; offset:Ipp32f; slope:Ipp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsVectorSlope_8s(pDst:PIpp8s; len:integer; offset:Ipp32f; slope:Ipp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsVectorSlope_16u(pDst:PIpp16u; len:integer; offset:Ipp32f; slope:Ipp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsVectorSlope_16s(pDst:PIpp16s; len:integer; offset:Ipp32f; slope:Ipp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsVectorSlope_32u(pDst:PIpp32u; len:integer; offset:Ipp64f; slope:Ipp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsVectorSlope_32s(pDst:PIpp32s; len:integer; offset:Ipp64f; slope:Ipp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsVectorSlope_32f(pDst:PIpp32f; len:integer; offset:Ipp32f; slope:Ipp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsVectorSlope_64f(pDst:PIpp64f; len:integer; offset:Ipp64f; slope:Ipp64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ ////////////////////////////////////////////////////////////////////////////
//  Name:       ippsDiv_Round_8u_Sfs
//              ippsDiv_Round_16u_Sfs
//              ippsDiv_Round_16s_Sfs
//              ippsDiv_Round_8u_ISfs
//              ippsDiv_Round_16u_ISfs
//              ippsDiv_Round_16s_ISfs
//
//
//  Purpose:    divide every element of the source vector by the scalar value
//              or by corresponding element of the second source vector and
//              round to zero, near or financial
//  Arguments:
//    val               the divisor value
//    pSrc              pointer to the divisor source vector
//    pSrc1             pointer to the divisor source vector
//    pSrc2             pointer to the dividend source vector
//    pDst              pointer to the destination vector
//    pSrcDst           pointer to the source/destination vector
//    len               vector's length, number of items
//    rndMode           Rounding mode (ippRndZero, ippRndNear or ippRndFinancial)
//    scaleFactor       scale factor parameter value
//  Return:
//    ippStsNullPtrErr     pointer(s) to the data vector is NULL
//    ippStsSizeErr        length of the vector is less or equal zero
//    ippStsDivByZeroErr   the scalar divisor value is zero
//    ippStsDivByZero      Warning status if an element of divisor vector is
//                      zero. If the dividend is zero than result is
//                      NaN, if the dividend is not zero than result
//                      is Infinity with correspondent sign. The
//                      execution is not aborted. For the integer operation
//                      zero instead of NaN and the corresponding bound
//                      values instead of Infinity
//   ippStsRoundModeNotSupportedErr Unsupported round mode
//   ippStsNoErr          otherwise

//  Note:
//    DivC(v,X,Y)  :    Y[n] = X[n] / v
//    DivC(v,X)    :    X[n] = X[n] / v
//    Div(X,Y)     :    Y[n] = Y[n] / X[n]
//    Div(X,Y,Z)   :    Z[n] = Y[n] / X[n]
}
function ippsDiv_Round_8u_Sfs(pSrc1:PIpp8u; pSrc2:PIpp8u; pDst:PIpp8u; len:integer; rndMode:IppRoundMode; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsDiv_Round_16s_Sfs(pSrc1:PIpp16s; pSrc2:PIpp16s; pDst:PIpp16s; len:integer; rndMode:IppRoundMode; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsDiv_Round_16u_Sfs(pSrc1:PIpp16u; pSrc2:PIpp16u; pDst:PIpp16u; len:integer; rndMode:IppRoundMode; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsDiv_Round_8u_ISfs(pSrc:PIpp8u; pSrcDst:PIpp8u; len:integer; rndMode:IppRoundMode; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsDiv_Round_16s_ISfs(pSrc:PIpp16s; pSrcDst:PIpp16s; len:integer; rndMode:IppRoundMode; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsDiv_Round_16u_ISfs(pSrc:PIpp16u; pSrcDst:PIpp16u; len:integer; rndMode:IppRoundMode; scaleFactor:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//  Names:      ippsDemodulateFM_CToR_16s
//  Purpose:    FM demodulate
//  Return:
//   IPP_NO_ERR                 Ok
//   IPP_NULL_PTR_ERR           Some of pointers are NULL
//   IPP_BADSIZE_ERR            The length of the array is less or equal zero
//  Parameters:
//   pSrcRe     pointer to input vector of Real data
//   pSrcIm     pointer to input vector of Image data
//   pDst       pointer to output vector
//   len        a length of the array
//   pDlyPoint  pointer to earlier data
}
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsDemodulateFM_CToR_16s(pSrcRe:PIpp16s; pSrcIm:PIpp16s; pDst:PIpp16s; len:integer; pDlyPoint:PIpp16sc):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};



{ ///////////////////////////////////////////////////////////////////////////
//  Name:    ippsCauchy_32f_I, ippsCauchyD_32f_I, ippsCauchyDD2_32f_I
//
//  Purpose: Compute Cauchy robust error function or its 1st, 2nd derivatives
//
//  Return:
//    ippStsNoErr         Ok
//    ippStsNullPtrErr    Some of the pointers are NULL's
//    ippStsSizeErr       Length is negative
//    ippStsOutOfRangeErr C is negative
//
//  Arguments:
//    pSrcDst          The input/output array of function arguments/values.
//    pD2F             The array of values of the 2nd derivative.
//    len              Length of srcdst and d2fval
//    C                Cauchy function parameter
}

// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsCauchy_32f_I(pSrcDst:PIpp32f; len:integer; C:Ipp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsCauchyD_32f_I(pSrcDst:PIpp32f; len:integer; C:Ipp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
// DEPRECATED. This function is obsolete and will be removed in one of the future IPP releases. Use the following link for details: https://software.intel.com/sites/products/ipp-deprecated-features-feedback/
function ippsCauchyDD2_32f_I(pSrcDst:PIpp32f; pD2F:PIpp32f; len:integer; C:Ipp32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ ///////////////////////////////////////////////////////////////////////////
//  Name:              ippsZeroCrossing_*
//  Purpose:           Counts the zero-cross measure for the input signal.
//
//  Parameters:
//    pSrc             Pointer to the input signal [len].
//    len              Number of elements in the input signal.
//    pValZCR          Pointer to the result value.
//    zcType           Zero crossing measure type.
//  Return:
//    ippStsNoErr      Indicates no error.
//    ippStsNullPtrErr Indicates an error when the pSrc or pRes pointer is null.
//    ippStsRangeErr   Indicates an error when zcType is not equal to
//                     ippZCR, ippZCXor or ippZCC
}

function ippsZeroCrossing_16s32f(pSrc:PIpp16s; len:Ipp32u; pValZCR:PIpp32f; zcType:IppsZCType):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsZeroCrossing_32f(pSrc:PIpp32f; len:Ipp32u; pValZCR:PIpp32f; zcType:IppsZCType):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>.<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< }

type
  PIppsResamplingPolyphase_16s = ^TIppsResamplingPolyphase_16s;
  TIppsResamplingPolyphase_16s = record end;

  PIppsResamplingPolyphaseFixed_16s = ^TIppsResamplingPolyphaseFixed_16s;
  TIppsResamplingPolyphaseFixed_16s = record end;

  PIppsResamplingPolyphase_32f = ^TIppsResamplingPolyphase_32f;
  TIppsResamplingPolyphase_32f = record end;

  PIppsResamplingPolyphaseFixed_32f = ^TIppsResamplingPolyphaseFixed_32f;
  TIppsResamplingPolyphaseFixed_32f = record end;

type
  PIppsResamlingPolyphase_16s = PIppsResamplingPolyphase_16s;
  PIppsResamlingPolyphaseFixed_16s = PIppsResamplingPolyphaseFixed_16s;
  PIppsResamlingPolyphase_32f = PIppsResamplingPolyphase_32f;
  PIppsResamlingPolyphaseFixed_32f = PIppsResamplingPolyphaseFixed_32f;

{ /////////////////////////////////////////////////////////////////////////////
//  Name:           ippsResamplePolyphase, ippsResamplePolyphaseFixed
//  Purpose:        Resample input data.
//   Arguments:
//      pSrc      The pointer to the input vector.
//      pDst      The pointer to the output vector.
//      len       The number of input vector elements to resample.
//      norm      The norming factor for output samples.
//      factor    The resampling factor.
//      pTime     The pointer to the start time of resampling (in input vector elements).
//      pOutlen   The number of calculated output vector elements
//      pSpec     The pointer to the resampling specification structure.
//   Return Value
//      ippStsNoErr        Indicates no error.
//      ippStsNullPtrErr   Indicates an error when pSpec, pSrc, pDst, pTime or pOutlen is NULL.
//      ippStsSizeErr      Indicates an error when len is less than or equal to 0.
//      ippStsBadArgErr    Indicates an error when factor is less than or equal to.
}

function ippsResamplePolyphase_16s(pSrc:PIpp16s; len:integer; pDst:PIpp16s; factor:Ipp64f; norm:Ipp32f; pTime:PIpp64f; out pOutlen:integer; pSpec:PIppsResamplingPolyphase_16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsResamplePolyphase_32f(pSrc:PIpp32f; len:integer; pDst:PIpp32f; factor:Ipp64f; norm:Ipp32f; pTime:PIpp64f; out pOutlen:integer; pSpec:PIppsResamplingPolyphase_32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsResamplePolyphaseFixed_16s(pSrc:PIpp16s; len:integer; pDst:PIpp16s; norm:Ipp32f; pTime:PIpp64f; out pOutlen:integer; pSpec:PIppsResamplingPolyphaseFixed_16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsResamplePolyphaseFixed_32f(pSrc:PIpp32f; len:integer; pDst:PIpp32f; norm:Ipp32f; pTime:PIpp64f; out pOutlen:integer; pSpec:PIppsResamplingPolyphaseFixed_32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ /////////////////////////////////////////////////////////////////////////////
//  Name:           ippsResamplePolyphaseGetSize, ippsResamplePolyphaseFixedGetSize
//  Purpose:        Determines the size required for the ResamplePolyphase or ResamplePolyphaseFixed.
//   Arguments:
//      window          The size of the ideal lowpass filter window.
//      nStep           The discretization step for filter coefficients
//      inRate          The input rate for resampling with fixed factor.
//      outRate         The output rate for resampling with fixed factor.
//      len             The filter length for resampling with fixed factor.
//      pSize           Required size in bytes
//      pLen            Filter len
//      pHeight         Number of filter
//      hint            Suggests using specific code. The values for the hint argument are described in "Flag and Hint Arguments"
//
//   Return Value
//      ippStsNoErr       Indicates no error.
//      ippStsNullPtrErr  Indicates an error when pSize, pLen or pHeight are NULL.
//      ippStsSizeErr     Indicates an error when inRate, outRate or len is less than or equal to 0.
}
function ippsResamplePolyphaseGetSize_16s(window:Ipp32f; nStep:integer; out pSize:integer; hint:IppHintAlgorithm):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsResamplePolyphaseGetSize_32f(window:Ipp32f; nStep:integer; out pSize:integer; hint:IppHintAlgorithm):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsResamplePolyphaseFixedGetSize_16s(inRate:integer; outRate:integer; len:integer; out pSize:integer; out pLen:integer; out pHeight:integer; hint:IppHintAlgorithm):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsResamplePolyphaseFixedGetSize_32f(inRate:integer; outRate:integer; len:integer; out pSize:integer; out pLen:integer; out pHeight:integer; hint:IppHintAlgorithm):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


{ /////////////////////////////////////////////////////////////////////////////
//  Name:           ippsResamplePolyphaseInit, ippsResamplePolyphaseFixedInit
//  Purpose:        Initializes ResamplePolyphase of ResamplePolyphaseFixed structures
//   Arguments:
//      window          The size of the ideal lowpass filter window.
//      nStep           The discretization step for filter coefficients
//      inRate          The input rate for resampling with fixed factor.
//      outRate         The output rate for resampling with fixed factor.
//      len             The filter length for resampling with fixed factor.
//      rollf           The roll-off frequency of the filter.
//      alpha           The parameter of the Kaiser window.
//      pSpec           The pointer to the resampling specification structure to be created.
//      hint            Suggests using specific code. The values for the hint argument are described in "Flag and Hint Arguments"
//   Return Value
//      ippStsNoErr       Indicates no error.
//      ippStsNullPtrErr  Indicates an error when pSpec is NULL.
//      ippStsSizeErr     Indicates an error when inRate, outRate or len is less than or equal to 0.
//
}
function ippsResamplePolyphaseInit_16s(window:Ipp32f; nStep:integer; rollf:Ipp32f; alpha:Ipp32f; pSpec:PIppsResamplingPolyphase_16s; hint:IppHintAlgorithm):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsResamplePolyphaseInit_32f(window:Ipp32f; nStep:integer; rollf:Ipp32f; alpha:Ipp32f; pSpec:PIppsResamplingPolyphase_32f; hint:IppHintAlgorithm):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsResamplePolyphaseFixedInit_16s(inRate:integer; outRate:integer; len:integer; rollf:Ipp32f; alpha:Ipp32f; pSpec:PIppsResamplingPolyphaseFixed_16s; hint:IppHintAlgorithm):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsResamplePolyphaseFixedInit_32f(inRate:integer; outRate:integer; len:integer; rollf:Ipp32f; alpha:Ipp32f; pSpec:PIppsResamplingPolyphaseFixed_32f; hint:IppHintAlgorithm):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//  Name:           ippsResamplePolyphaseSetFixedFilter
//  Purpose:        Set filter coefficient
//   Arguments:
//      pSpec           The pointer to the resampling specification structure to be created.
//      pSrc            Input vector of filter coefficients [height][step]
//      step            Lenght of filter
//      height          Number of filter
//   Return Value
//      ippStsNoErr       Indicates no error.
//      ippStsNullPtrErr  Indicates an error when pSpec or pSrc are NULL.
//      ippStsSizeErr     Indicates an error when step or height is less than or equal to 0.
}
function ippsResamplePolyphaseSetFixedFilter_16s(pSrc:PIpp16s; step:integer; height:integer; pSpec:PIppsResamplingPolyphaseFixed_16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsResamplePolyphaseSetFixedFilter_32f(pSrc:PIpp32f; step:integer; height:integer; pSpec:PIppsResamplingPolyphaseFixed_32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//  Name:           ippsResamplePolyphaseGetFixedFilter
//  Purpose:        Get filter coefficient
//   Arguments:
//      pSpec           The pointer to the resampling specification structure to be created.
//      pDst            Input vector of filter coefficients [height][step]
//      step            Lenght of filter
//      height          Number of filter
//   Return Value
//      ippStsNoErr       Indicates no error.
//      ippStsNullPtrErr  Indicates an error when pSpec or pSrc are NULL.
//      ippStsSizeErr     Indicates an error when step or height is less than or equal to 0.
}
function ippsResamplePolyphaseGetFixedFilter_16s(pDst:PIpp16s; step:integer; height:integer; pSpec:PIppsResamplingPolyphaseFixed_16s):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


function ippsResamplePolyphaseGetFixedFilter_32f(pDst:PIpp32f; step:integer; height:integer; pSpec:PIppsResamplingPolyphaseFixed_32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{FIR API New Design}
{ /////////////////////////////////////////////////////////////////////////////
//  Name:         ippsFIRSRGetSize, ippsFIRSRInit_32f, ippsFIRSRInit_64f
//                ippsFIRSR_32f, ippsFIRSR_64f
//  Purpose:      Get sizes of the FIR spec structure and temporary buffer
//                initialize FIR spec structure - set taps and delay line
//                perform FIR filtering
//                and close it
//  Parameters:
//      pTaps       - pointer to the filter coefficients
//      tapsLen     - number of coefficients
//      tapsType    - type of coefficients (ipp32f or ipp64f)
//      pSpecSize   - pointer to the size of FIR spec
//      pBufSize    - pointer to the size of temporal buffer
//      aType       - mask for the algorithm type definition (direct, fft, auto)
//      pDlySrc     - pointer to the input  delay line values, can be NULL
//      pDlyDst     - pointer to the output delay line values, can be NULL
//      pSpec       - pointer to the constant internal structure
//      pSrc        - pointer to the source vector.
//      pDst        - pointer to the destination vector
//      numIters    - length  of the destination vector
//      pBuf        - pointer to the work buffer
//   Return:
//      status      - status value returned, its value are
//         ippStsNullPtrErr       - one of the specified pointer is NULL
//         ippStsFIRLenErr        - tapsLen <= 0
//         ippStsContextMatchErr  - wrong state identifier
//         ippStsNoErr            - OK
//         ippStsSizeErr          - numIters is not positive
//         ippStsAlgTypeErr       - unsupported algorithm type
//         ippStsMismatch         - not effective algorithm.
}

function ippsFIRSRGetSize(tapsLen:integer; tapsType:IppDataType; out pSpecSize:integer; out pBufSize:integer):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFIRSRInit_32f(pTaps:PIpp32f; tapsLen:integer; aType:IppAlgType; pSpec:PIppsFIRSpec_32f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFIRSRInit_64f(pTaps:PIpp64f; tapsLen:integer; aType:IppAlgType; pSpec:PIppsFIRSpec_64f):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFIRSRInit_32fc(pTaps:PIpp32fc; tapsLen:integer; aType:IppAlgType; pSpec:PIppsFIRSpec_32fc):IppStatus; stdcall; external  ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFIRSRInit_64fc(pTaps:PIpp64fc; tapsLen:integer; aType:IppAlgType; pSpec:PIppsFIRSpec_64fc):IppStatus; stdcall; external  ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFIRSR_32f(pSrc:PIpp32f; pDst:PIpp32f; numIters:integer; pSpec:PIppsFIRSpec_32f; pDlySrc:PIpp32f; pDlyDst:PIpp32f; pBuf:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFIRSR_64f(pSrc:PIpp64f; pDst:PIpp64f; numIters:integer; pSpec:PIppsFIRSpec_64f; pDlySrc:PIpp64f; pDlyDst:PIpp64f; pBuf:PIpp8u):IppStatus; stdcall; external ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFIRSR_32fc(pSrc:PIpp32fc; pDst:PIpp32fc; numIters:integer; pSpec:PIppsFIRSpec_32fc; pDlySrc:PIpp32fc; pDlyDst:PIpp32fc; pBuf:PIpp8u):IppStatus; stdcall; external  ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFIRSR_64fc(pSrc:PIpp64fc; pDst:PIpp64fc; numIters:integer; pSpec:PIppsFIRSpec_64fc; pDlySrc:PIpp64fc; pDlyDst:PIpp64fc; pBuf:PIpp8u):IppStatus; stdcall; external  ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFIRSR_16s(pSrc:PIpp16s; pDst:PIpp16s; numIters:integer; pSpec:PIppsFIRSpec_32f; pDlySrc:PIpp16s; pDlyDst:PIpp16s; pBuf:PIpp8u):IppStatus; stdcall; external  ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFIRSR_16sc(pSrc:PIpp16sc; pDst:PIpp16sc; numIters:integer; pSpec:PIppsFIRSpec_32fc; pDlySrc:PIpp16sc; pDlyDst:PIpp16sc; pBuf:PIpp8u):IppStatus; stdcall; external  ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

{ /////////////////////////////////////////////////////////////////////////////
//  Name:         ippsFIRMRGetSize,
//                ippsFIRMRInit_32f, ippsFIRMRInit_64f, ippsFIRMRInit_32fc, ippsFIRMRInit_64fc
//                ippsFIRMR_32f, ippsFIRMR_32fc, ippsFIRMR_64f, ippsFIRMR_64fc, ippsFIRMR_16s, ippsFIRMR_16sc,
//  Purpose:      Get sizes of the FIR spec structure and temporary buffer,
//                initialize FIR spec structure - set taps and delay line,
//                perform multi rate FIR filtering
//
//  Parameters:
//      pTaps       - pointer to the filter coefficients
//      tapsLen     - number of coefficients
//      tapsType    - type of coefficients (ipp32f or ipp64f)
//      pSpecSize   - pointer to the size of FIR spec
//      pBufSize    - pointer to the size of temporal buffer
//      pDlySrc     - pointer to the input  delay line values, can be NULL
//      pDlyDst     - pointer to the output delay line values, can be NULL
//      upFactor    - multi-rate up factor;
//      upPhase     - multi-rate up phase;
//      downFactor  - multi-rate down factor;
//      downPhase   - multi-rate down phase;
//      pSpec       - pointer to the constant internal structure
//      pSrc        - pointer to the source vector.
//      pDst        - pointer to the destination vector
//      numIters    - length  of the destination vector
//      pBuf        - pointer to the work buffer
//   Return:
//      status      - status value returned, its value are
//         ippStsNullPtrErr       - one of the specified pointer is NULL
//         ippStsFIRLenErr        - tapsLen <= 0
//         ippStsFIRMRFactorErr   - factor <= 0
//         ippStsFIRMRPhaseErr    - phase < 0 || factor <= phase
//         ippStsContextMatchErr  - wrong state identifier
//         ippStsNoErr            - OK
//         ippStsSizeErr          - numIters is not positive
}

function ippsFIRMRGetSize(tapsLen:integer; upFactor:integer; downFactor:integer; tapsType:IppDataType; out pSpecSize:integer; out pBufSize:integer):IppStatus; stdcall; external  ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFIRMR_Init_32f(pTaps:PIpp32f; tapsLen:integer; upFactor:integer; upPhase:integer; downFactor:integer; downPhase:integer; pSpec:PIppsFIRSpec_32f):IppStatus; stdcall; external  ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFIRMR_Init_64f(pTaps:PIpp64f; tapsLen:integer; upFactor:integer; upPhase:integer; downFactor:integer; downPhase:integer; pSpec:PIppsFIRSpec_64f):IppStatus; stdcall; external  ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFIRMR_Init_32fc(pTaps:PIpp32fc; tapsLen:integer; upFactor:integer; upPhase:integer; downFactor:integer; downPhase:integer; pSpec:PIppsFIRSpec_32fc):IppStatus; stdcall; external  ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFIRMR_Init_64fc(pTaps:PIpp64fc; tapsLen:integer; upFactor:integer; upPhase:integer; downFactor:integer; downPhase:integer; pSpec:PIppsFIRSpec_64fc):IppStatus; stdcall; external  ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsFIRMR_32f(pSrc:PIpp32f; pDst:PIpp32f; numIters:integer; pSpec:PIppsFIRSpec_32f; pDlySrc:PIpp32f; pDlyDst:PIpp32f; pBuf:PIpp8u):IppStatus; stdcall; external  ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFIRMR_64f(pSrc:PIpp64f; pDst:PIpp64f; numIters:integer; pSpec:PIppsFIRSpec_64f; pDlySrc:PIpp64f; pDlyDst:PIpp64f; pBuf:PIpp8u):IppStatus; stdcall; external  ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFIRMR_32fc(pSrc:PIpp32fc; pDst:PIpp32fc; numIters:integer; pSpec:PIppsFIRSpec_32fc; pDlySrc:PIpp32fc; pDlyDst:PIpp32fc; pBuf:PIpp8u):IppStatus; stdcall; external  ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFIRMR_64fc(pSrc:PIpp64fc; pDst:PIpp64fc; numIters:integer; pSpec:PIppsFIRSpec_64fc; pDlySrc:PIpp64fc; pDlyDst:PIpp64fc; pBuf:PIpp8u):IppStatus; stdcall; external  ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};

function ippsFIRMR_16s(pSrc:PIpp16s; pDst:PIpp16s; numIters:integer; pSpec:PIppsFIRSpec_32f; pDlySrc:PIpp16s; pDlyDst:PIpp16s; pBuf:PIpp8u):IppStatus; stdcall; external  ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};
function ippsFIRMR_16sc(pSrc:PIpp16sc; pDst:PIpp16sc; numIters:integer; pSpec:PIppsFIRSpec_32fc; pDlySrc:PIpp16sc; pDlyDst:PIpp16sc; pBuf:PIpp8u):IppStatus; stdcall; external  ippsdll {$IFDEF IPPDELAYED}delayed{$ENDIF};


implementation

end.
