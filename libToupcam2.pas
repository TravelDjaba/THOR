unit libToupcam2;

interface
uses
  Winapi.Windows;
const
  toupcam_ports = 'toupcam.dll';
{ Version: 1.9.7892.20160919 }

type HRESULT = Integer;

type PPBITMAPINFOHEADER = ^PBITMAPINFOHEADER;
  PBITMAPINFOHEADER = ^BITMAPINFOHEADER;

  BITMAPINFOHEADER = record
  biSize:           Cardinal;
  biWidth:          Integer;
  biHeight:         Integer;
  biPlanes:         Word;
  biBitCount:       Word;
  biCompression:    Cardinal;
  biSizeImage:      Cardinal;
  biXPelsPerMeter:  Integer;
  biYPelsPerMeter:  Integer;
  biClrUsed:        Cardinal;
  biClrImportant:   Cardinal;
end;

type PRECT = ^RECT;
     RECT =  record
     left:  Integer;
     top:   Integer;
     right: Integer;
     bottom:Integer;
end;



//#define TDIBWIDTHBYTES(bits)  ((unsigned)(((bits) + 31) & (~31)) / 8)


{/*******************************************************************************/
/* HRESULT                                                                     */
/*    |---------------|---------------------------------------|------------|   */
/*    | S_OK          |   Operation successful                | 0x00000000 |   */
/*    | S_FALSE       |   Operation successful                | 0x00000001 |   */
/*    | E_FAIL        |   Unspecified failure                 | 0x80004005 |   */
/*    | E_INVALIDARG  |   One or more arguments are not valid | 0x80070057 |   */
/*    | E_NOTIMPL     |   Not supported or not implemented    | 0x80004001 |   */
/*    | E_POINTER     |   Pointer that is not valid           | 0x80004003 |   */
/*    | E_UNEXPECTED  |   Unexpected failure                  | 0x8000FFFF |   */
/*    |---------------|---------------------------------------|------------|   */
/*******************************************************************************/}

//* handle */


//typedef struct ToupcamT { int unused; } *HToupCam;
type ToupcamT =  record
  unused:Integer;
end;
type HToupCam=^ToupcamT;


#define TOUPCAM_TEMP_DEF                6503
#define TOUPCAM_TEMP_MIN                2000
#define TOUPCAM_TEMP_MAX                15000
#define TOUPCAM_TINT_DEF                1000
#define TOUPCAM_TINT_MIN                200
#define TOUPCAM_TINT_MAX                2500
#define TOUPCAM_HUE_DEF                 0
#define TOUPCAM_HUE_MIN                 (-180)
#define TOUPCAM_HUE_MAX                 180
#define TOUPCAM_SATURATION_DEF          128
#define TOUPCAM_SATURATION_MIN          0
#define TOUPCAM_SATURATION_MAX          255
#define TOUPCAM_BRIGHTNESS_DEF          0
#define TOUPCAM_BRIGHTNESS_MIN          (-64)
#define TOUPCAM_BRIGHTNESS_MAX          64
#define TOUPCAM_CONTRAST_DEF            0
#define TOUPCAM_CONTRAST_MIN            (-100)
#define TOUPCAM_CONTRAST_MAX            100
#define TOUPCAM_GAMMA_DEF               100
#define TOUPCAM_GAMMA_MIN               20
#define TOUPCAM_GAMMA_MAX               180
#define TOUPCAM_AETARGET_DEF            120
#define TOUPCAM_AETARGET_MIN            16
#define TOUPCAM_AETARGET_MAX            220
#define TOUPCAM_WBGAIN_DEF              0
#define TOUPCAM_WBGAIN_MIN              (-128)
#define TOUPCAM_WBGAIN_MAX              128

const
 TOUPCAM_MAX =  15; //16;

 TOUPCAM_FLAG_CMOS =              $00000001;  //* cmos sensor
 TOUPCAM_FLAG_CCD_PROGRESSIVE =   $00000002;  //* progressive ccd sensor */
 TOUPCAM_FLAG_CCD_INTERLACED =    $00000004;  //* interlaced ccd sensor */
 TOUPCAM_FLAG_ROI_HARDWARE =      $00000008;  //* support hardware ROI */
 TOUPCAM_FLAG_MONO =              $00000010;  //* monochromatic */
 TOUPCAM_FLAG_BINSKIP_SUPPORTED = $00000020;  //* support bin/skip mode, see Toupcam_put_Mode and Toupcam_get_Mode */
 TOUPCAM_FLAG_USB30 =             $00000040;  //* USB 3.0 */
 TOUPCAM_FLAG_COOLED =            $00000080;  //* Thermoelectric Cooler */
 TOUPCAM_FLAG_USB30_OVER_USB20 =  $00000100;  //* usb3.0 camera connected to usb2.0 port */
 TOUPCAM_FLAG_ST4 =               $00000200;  //* ST4 */

 TOUPCAM_FLAG_GETTEMPERATURE =    $00000400;  //* support to get the temperature of sensor */
 TOUPCAM_FLAG_PUTTEMPERATURE =    $00000800;  //* support to put the temperature of sensor */
 TOUPCAM_FLAG_BITDEPTH10 =        $00001000;  //* Maximum Bit Depth = 10 */
 TOUPCAM_FLAG_BITDEPTH12 =        $00002000;  //* Maximum Bit Depth = 12 */
 TOUPCAM_FLAG_BITDEPTH14 =        $00004000;  //* Maximum Bit Depth = 14 */
 TOUPCAM_FLAG_BITDEPTH16 =        $00008000;  //* Maximum Bit Depth = 16 */
 TOUPCAM_FLAG_FAN =               $00010000;  //* cooling fan */
 TOUPCAM_FLAG_TEC_ONOFF =         $00020000;  //* Thermoelectric Cooler can be turn on or off */
 TOUPCAM_FLAG_ISP =               $00040000;  //* image signal processing supported */
 TOUPCAM_FLAG_TRIGGER_SOFTWARE =  $00080000;  //* support software trigger */
 TOUPCAM_FLAG_TRIGGER_EXTERNAL =  $00100000;  //* support external trigger */
 TOUPCAM_FLAG_TRIGGER_SINGLE =    $00200000;  //* only support trigger single: one trigger, one image */


 TOUPCAM_TEMP_DEF =               6503 ;
 TOUPCAM_TEMP_MIN =               2000 ;
 TOUPCAM_TEMP_MAX =               15000 ;
 TOUPCAM_TINT_DEF =               1000 ;
 TOUPCAM_TINT_MIN =               200 ;
 TOUPCAM_TINT_MAX =               2500 ;
 TOUPCAM_HUE_DEF =                0 ;
 TOUPCAM_HUE_MIN =                -180;
 TOUPCAM_HUE_MAX =                180 ;
 TOUPCAM_SATURATION_DEF =         128 ;
 TOUPCAM_SATURATION_MIN =         0   ;
 TOUPCAM_SATURATION_MAX =         255 ;
 TOUPCAM_BRIGHTNESS_DEF =         0   ;
 TOUPCAM_BRIGHTNESS_MIN =         -64;
 TOUPCAM_BRIGHTNESS_MAX =         64   ;
 TOUPCAM_CONTRAST_DEF =           0    ;
 TOUPCAM_CONTRAST_MIN =           -100;
 TOUPCAM_CONTRAST_MAX =           100 ;
 TOUPCAM_GAMMA_DEF =              100 ;
 TOUPCAM_GAMMA_MIN =              20  ;
 TOUPCAM_GAMMA_MAX =              180 ;
 TOUPCAM_AETARGET_DEF =           120 ;
 TOUPCAM_AETARGET_MIN =           16  ;
 TOUPCAM_AETARGET_MAX =           235 ;
 TOUPCAM_WBGAIN_DEF =             0 ;
 TOUPCAM_WBGAIN_MIN =             -128 ;
 TOUPCAM_WBGAIN_MAX =             128 ;

 TOUPCAM_OPTION_NOFRAME_TIMEOUT = $01;    //* iValue: 1 = enable; 0 = disable. default: enable */
 TOUPCAM_OPTION_THREAD_PRIORITY = $02;    //* set the priority of the internal thread which grab data from the usb device.
                                          //  iValue: 0 = THREAD_PRIORITY_NORMAL; 1 = THREAD_PRIORITY_ABOVE_NORMAL; 2 = THREAD_PRIORITY_HIGHEST; default: 0; see: msdn SetThreadPriority */
 TOUPCAM_OPTION_PROCESSMODE =     $03;    //*  0 = better image quality, more cpu usage. this is the default value
                                          // 1 = lower image quality, less cpu usage */
 TOUPCAM_OPTION_RAW =             $04;    //* raw mode, read the sensor data. This can be set only BEFORE Toupcam_StartXXX() */
 TOUPCAM_OPTION_HISTOGRAM =       $05;    //* 0 = only one, 1 = continue mode */
 TOUPCAM_OPTION_BITDEPTH =        $06;    //* 0 = 8bits mode, 1 = 16bits mode */
 TOUPCAM_OPTION_FAN =             $07;    //* 0 = turn off the cooling fan, 1 = turn on the cooling fan */
 TOUPCAM_OPTION_TEC =             $08;    //* 0 = turn off the thermoelectric cooler, 1 = turn on the thermoelectric cooler */
 TOUPCAM_OPTION_LINEAR =          $09;    //* 0 = turn off the builtin linear tone mapping, 1 = turn on the builtin linear tone mapping, default value: 1 */
 TOUPCAM_OPTION_CURVE =           $0a;    //* 0 = turn off the builtin curve tone mapping, 1 = turn on the builtin curve tone mapping, default value: 1 */
 TOUPCAM_OPTION_TRIGGER =         $0b;    //* 0 = continuous mode, 1 = trigger mode, default value =  0 */
 TOUPCAM_OPTION_RGB48 =           $0c;    //* enable RGB48 format when bitdepth > 8 */
 TOUPCAM_OPTION_COLORMATIX =      $0d;    //* enable or disable the builtin color matrix, default value: 1 */
 TOUPCAM_OPTION_WBGAIN =          $0e;    //* enable or disable the builtin white balance gain, default value: 1 */
 TOUPCAM_OPTION_TECTARGET =       $0f;    //* get or set the target temperature of the thermoelectric cooler, in degree Celsius */

 TOUPCAM_PROCESSMODE_FULL =       $00;    //* better image quality, more cpu usage. this is the default value */
 TOUPCAM_PROCESSMODE_FAST =       $01;    //* lower image quality, less cpu usage */

 //Errors
 TOUPCAM_EVENT_EXPOSURE             = $0001; //* exposure time changed */
 TOUPCAM_EVENT_TEMPTINT             = $0002; //* white balance changed, Temp/Tint mode */
 TOUPCAM_EVENT_CHROME               = $0003; //* reversed, do not use it */
 TOUPCAM_EVENT_IMAGE                = $0004; //* live image arrived, use Toupcam_PullImage to get this image */
 TOUPCAM_EVENT_STILLIMAGE           = $0005; //* snap (still) frame arrived, use Toupcam_PullStillImage to get this frame */
 TOUPCAM_EVENT_WBGAIN               = $0006; //* white balance changed, RGB Gain mode */
 TOUPCAM_EVENT_ERROR                = $0080; //* something error happens */
 TOUPCAM_EVENT_DISCONNECTED         = $0081;  //* camera disconnected */



typedef struct{
    unsigned    width;
    unsigned    height;
}ToupcamResolution;

/* In Windows platform, we always use UNICODE wchar_t */
/* In Linux or macOS, we use char */
typedef struct{
#ifdef _WIN32
    const wchar_t*      name;       /* model name, in Windows, we use unicode */
#else
    const char*         name;       /* model name */
#endif
    unsigned            flag;       /* TOUPCAM_FLAG_xxx */
    unsigned            maxspeed;   /* number of speed level, same as Toupcam_get_MaxSpeed(), the speed range = [0, maxspeed], closed interval */
    unsigned            preview;    /* number of preview resolution, same as Toupcam_get_ResolutionNumber() */
    unsigned            still;      /* number of still resolution, same as Toupcam_get_StillResolutionNumber() */
    ToupcamResolution   res[TOUPCAM_MAX];
}ToupcamModel;

typedef struct{
#ifdef _WIN32
    wchar_t             displayname[64];    /* display name */
    wchar_t             id[64];             /* unique and opaque id of a connected camera, for Toupcam_Open */
#else
    char                displayname[64];    /* display name */
    char                id[64];             /* unique and opaque id of a connected camera, for Toupcam_Open */
#endif
    const ToupcamModel* model;
}ToupcamInst;

/*
    get the version of this dll, which is: 1.9.7892.20160919
*/
#ifdef _WIN32
toupcam_ports(const wchar_t*)   Toupcam_Version();
#else
toupcam_ports(const char*)      Toupcam_Version();
#endif

/*
    enumerate the cameras connected to the computer, return the number of enumerated.

    ToupcamInst arr[TOUPCAM_MAX];
    unsigned cnt = Toupcam_Enum(arr);
    for (unsigned i = 0; i < cnt; ++i)
        ...

    if pti == NULL, then, only the number is returned.
*/
toupcam_ports(unsigned) Toupcam_Enum(ToupcamInst pti[TOUPCAM_MAX]);

/* use the id of ToupcamInst, which is enumerated by Toupcam_Enum.
    if id is NULL, Toupcam_Open will open the first camera.
*/
#ifdef _WIN32
toupcam_ports(HToupCam) Toupcam_Open(const wchar_t* id);
#else
toupcam_ports(HToupCam) Toupcam_Open(const char* id);
#endif

/*
    the same with Toupcam_Open, but use the index as the parameter. such as:
    index == 0, open the first camera,
    index == 1, open the second camera,
    etc
*/
toupcam_ports(HToupCam) Toupcam_OpenByIndex(unsigned index);

toupcam_ports(void)     Toupcam_Close(HToupCam h); /* close the handle */

#define TOUPCAM_EVENT_EXPOSURE      0x0001    /* exposure time changed */
#define TOUPCAM_EVENT_TEMPTINT      0x0002    /* white balance changed, Temp/Tint mode */
#define TOUPCAM_EVENT_CHROME        0x0003    /* reversed, do not use it */
#define TOUPCAM_EVENT_IMAGE         0x0004    /* live image arrived, use Toupcam_PullImage to get this image */
#define TOUPCAM_EVENT_STILLIMAGE    0x0005    /* snap (still) frame arrived, use Toupcam_PullStillImage to get this frame */
#define TOUPCAM_EVENT_WBGAIN        0x0006    /* white balance changed, RGB Gain mode */
#define TOUPCAM_EVENT_ERROR         0x0080    /* something error happens */
#define TOUPCAM_EVENT_DISCONNECTED  0x0081    /* camera disconnected */

#ifdef _WIN32
toupcam_ports(HRESULT)      Toupcam_StartPullModeWithWndMsg(HToupCam h, HWND hWnd, UINT nMsg);
#endif

typedef void (__stdcall*    PTOUPCAM_EVENT_CALLBACK)(unsigned nEvent, void* pCallbackCtx);
toupcam_ports(HRESULT)      Toupcam_StartPullModeWithCallback(HToupCam h, PTOUPCAM_EVENT_CALLBACK pEventCallback, void* pCallbackContext);

/*
    bits: 24 (RGB24), 32 (RGB32), or 8 (Grey). Int RAW mode, this parameter is ignored.
    pnWidth, pnHeight: OUT parameter
*/
toupcam_ports(HRESULT)      Toupcam_PullImage(HToupCam h, void* pImageData, int bits, unsigned* pnWidth, unsigned* pnHeight);
toupcam_ports(HRESULT)      Toupcam_PullStillImage(HToupCam h, void* pImageData, int bits, unsigned* pnWidth, unsigned* pnHeight);

/*
    (NULL == pData) means that something is error
    pCallbackCtx is the callback context which is passed by Toupcam_Start
    bSnap: TRUE if Toupcam_Snap

    pDataCallback is callbacked by an internal thread of toupcam.dll, so please pay attention to multithread problem
*/
typedef void (__stdcall*    PTOUPCAM_DATA_CALLBACK)(const void* pData, const BITMAPINFOHEADER* pHeader, BOOL bSnap, void* pCallbackCtx);
toupcam_ports(HRESULT)  Toupcam_StartPushMode(HToupCam h, PTOUPCAM_DATA_CALLBACK pDataCallback, void* pCallbackCtx);

toupcam_ports(HRESULT)  Toupcam_Stop(HToupCam h);
toupcam_ports(HRESULT)  Toupcam_Pause(HToupCam h, BOOL bPause);

/*  for pull mode: TOUPCAM_EVENT_STILLIMAGE, and then Toupcam_PullStillImage
    for push mode: the snapped image will be return by PTOUPCAM_DATA_CALLBACK, with the parameter 'bSnap' set to 'TRUE' */
toupcam_ports(HRESULT)  Toupcam_Snap(HToupCam h, unsigned nResolutionIndex);  /* still image snap */

/*
    soft trigger:
    nNumber:    0xffff:     trigger continuously
                0:          cancel trigger
                others:     number of images to be triggered
*/
toupcam_ports(HRESULT)  Toupcam_Trigger(HToupCam h, unsigned short nNumber);
/*
    put_Size, put_eSize, can be used to set the video output resolution BEFORE ToupCam_Start.
    put_Size use width and height parameters, put_eSize use the index parameter.
    for example, UCMOS03100KPA support the following resolutions:
            index 0:    2048,   1536
            index 1:    1024,   768
            index 2:    680,    510
    so, we can use put_Size(h, 1024, 768) or put_eSize(h, 1). Both have the same effect.
*/
toupcam_ports(HRESULT)  Toupcam_put_Size(HToupCam h, int nWidth, int nHeight);
toupcam_ports(HRESULT)  Toupcam_get_Size(HToupCam h, int* pWidth, int* pHeight);
toupcam_ports(HRESULT)  Toupcam_put_eSize(HToupCam h, unsigned nResolutionIndex);
toupcam_ports(HRESULT)  Toupcam_get_eSize(HToupCam h, unsigned* pnResolutionIndex);

toupcam_ports(HRESULT)  Toupcam_get_ResolutionNumber(HToupCam h);
toupcam_ports(HRESULT)  Toupcam_get_Resolution(HToupCam h, unsigned nResolutionIndex, int* pWidth, int* pHeight);
toupcam_ports(HRESULT)  Toupcam_get_ResolutionRatio(HToupCam h, unsigned nResolutionIndex, int* pNumerator, int* pDenominator);
toupcam_ports(HRESULT)  Toupcam_get_Field(HToupCam h);

/*
FourCC:
    MAKEFOURCC('G', 'B', 'R', 'G')
    MAKEFOURCC('R', 'G', 'G', 'B')
    MAKEFOURCC('B', 'G', 'G', 'R')
    MAKEFOURCC('G', 'R', 'B', 'G')
    MAKEFOURCC('Y', 'U', 'Y', 'V')
    MAKEFOURCC('Y', 'Y', 'Y', 'Y')
*/
toupcam_ports(HRESULT)  Toupcam_get_RawFormat(HToupCam h, unsigned* nFourCC, unsigned* bitdepth);

/*
    ------------------------------------------------------------------|
    | Parameter               |   Range       |   Default             |
    |-----------------------------------------------------------------|
    | Auto Exposure Target    |   10~230      |   120                 |
    | Temp                    |   2000~15000  |   6503                |
    | Tint                    |   200~2500    |   1000                |
    | LevelRange              |   0~255       |   Low = 0, High = 255 |
    | Contrast                |   -100~100    |   0                   |
    | Hue                     |   -180~180    |   0                   |
    | Saturation              |   0~255       |   128                 |
    | Brightness              |   -64~64      |   0                   |
    | Gamma                   |   20~180      |   100                 |
    | WBGain                  |   -128~128    |   0                   |
    ------------------------------------------------------------------|
*/

#ifndef __TOUPCAM_CALLBACK_DEFINED__
#define __TOUPCAM_CALLBACK_DEFINED__
typedef void (__stdcall* PITOUPCAM_EXPOSURE_CALLBACK)(void* pCtx);
typedef void (__stdcall* PITOUPCAM_WHITEBALANCE_CALLBACK)(const int aGain[3], void* pCtx);
typedef void (__stdcall* PITOUPCAM_TEMPTINT_CALLBACK)(const int nTemp, const int nTint, void* pCtx);
typedef void (__stdcall* PITOUPCAM_HISTOGRAM_CALLBACK)(const float aHistY[256], const float aHistR[256], const float aHistG[256], const float aHistB[256], void* pCtx);
typedef void (__stdcall* PITOUPCAM_CHROME_CALLBACK)(void* pCtx);
#endif

toupcam_ports(HRESULT)  Toupcam_get_AutoExpoEnable(HToupCam h, BOOL* bAutoExposure);
toupcam_ports(HRESULT)  Toupcam_put_AutoExpoEnable(HToupCam h, BOOL bAutoExposure);
toupcam_ports(HRESULT)  Toupcam_get_AutoExpoTarget(HToupCam h, unsigned short* Target);
toupcam_ports(HRESULT)  Toupcam_put_AutoExpoTarget(HToupCam h, unsigned short Target);

/*set the maximum auto exposure time and analog agin. The default maximum auto exposure time is 350ms */
toupcam_ports(HRESULT)  Toupcam_put_MaxAutoExpoTimeAGain(HToupCam h, unsigned maxTime, unsigned short maxAGain);

toupcam_ports(HRESULT)  Toupcam_get_ExpoTime(HToupCam h, unsigned* Time); /* in microseconds */
toupcam_ports(HRESULT)  Toupcam_put_ExpoTime(HToupCam h, unsigned Time); /* in microseconds */
toupcam_ports(HRESULT)  Toupcam_get_ExpTimeRange(HToupCam h, unsigned* nMin, unsigned* nMax, unsigned* nDef);

toupcam_ports(HRESULT)  Toupcam_get_ExpoAGain(HToupCam h, unsigned short* AGain); /* percent, such as 300 */
toupcam_ports(HRESULT)  Toupcam_put_ExpoAGain(HToupCam h, unsigned short AGain); /* percent */
toupcam_ports(HRESULT)  Toupcam_get_ExpoAGainRange(HToupCam h, unsigned short* nMin, unsigned short* nMax, unsigned short* nDef);

/* Auto White Balance, Temp/Tint Mode */
toupcam_ports(HRESULT)  Toupcam_AwbOnePush(HToupCam h, PITOUPCAM_TEMPTINT_CALLBACK fnTTProc, void* pTTCtx); /* auto white balance "one push". The function must be called AFTER Toupcam_StartXXXX */

/* Auto White Balance, RGB Gain Mode */
toupcam_ports(HRESULT)  Toupcam_AwbInit(HToupCam h, PITOUPCAM_WHITEBALANCE_CALLBACK fnWBProc, void* pWBCtx);

/* White Balance, Temp/Tint mode */
toupcam_ports(HRESULT)  Toupcam_put_TempTint(HToupCam h, int nTemp, int nTint);
toupcam_ports(HRESULT)  Toupcam_get_TempTint(HToupCam h, int* nTemp, int* nTint);

/* White Balance, RGB Gain mode */
toupcam_ports(HRESULT)  Toupcam_put_WhiteBalanceGain(HToupCam h, int aGain[3]);
toupcam_ports(HRESULT)  Toupcam_get_WhiteBalanceGain(HToupCam h, int aGain[3]);

toupcam_ports(HRESULT)  Toupcam_put_Hue(HToupCam h, int Hue);
toupcam_ports(HRESULT)  Toupcam_get_Hue(HToupCam h, int* Hue);
toupcam_ports(HRESULT)  Toupcam_put_Saturation(HToupCam h, int Saturation);
toupcam_ports(HRESULT)  Toupcam_get_Saturation(HToupCam h, int* Saturation);
toupcam_ports(HRESULT)  Toupcam_put_Brightness(HToupCam h, int Brightness);
toupcam_ports(HRESULT)  Toupcam_get_Brightness(HToupCam h, int* Brightness);
toupcam_ports(HRESULT)  Toupcam_get_Contrast(HToupCam h, int* Contrast);
toupcam_ports(HRESULT)  Toupcam_put_Contrast(HToupCam h, int Contrast);
toupcam_ports(HRESULT)  Toupcam_get_Gamma(HToupCam h, int* Gamma); /* percent */
toupcam_ports(HRESULT)  Toupcam_put_Gamma(HToupCam h, int Gamma);  /* percent */

toupcam_ports(HRESULT)  Toupcam_get_Chrome(HToupCam h, BOOL* bChrome);  /* monochromatic mode */
toupcam_ports(HRESULT)  Toupcam_put_Chrome(HToupCam h, BOOL bChrome);

toupcam_ports(HRESULT)  Toupcam_get_VFlip(HToupCam h, BOOL* bVFlip);  /* vertical flip */
toupcam_ports(HRESULT)  Toupcam_put_VFlip(HToupCam h, BOOL bVFlip);
toupcam_ports(HRESULT)  Toupcam_get_HFlip(HToupCam h, BOOL* bHFlip);
toupcam_ports(HRESULT)  Toupcam_put_HFlip(HToupCam h, BOOL bHFlip); /* horizontal flip */

toupcam_ports(HRESULT)  Toupcam_get_Negative(HToupCam h, BOOL* bNegative);  /* negative film */
toupcam_ports(HRESULT)  Toupcam_put_Negative(HToupCam h, BOOL bNegative);

toupcam_ports(HRESULT)  Toupcam_put_Speed(HToupCam h, unsigned short nSpeed);
toupcam_ports(HRESULT)  Toupcam_get_Speed(HToupCam h, unsigned short* pSpeed);
toupcam_ports(HRESULT)  Toupcam_get_MaxSpeed(HToupCam h); /* get the maximum speed, see "Frame Speed Level", the speed range = [0, max], closed interval */

toupcam_ports(HRESULT)  Toupcam_get_FanMaxSpeed(HToupCam h); /* get the maximum fan speed, the fan speed range = [0, max], closed interval */

toupcam_ports(HRESULT)  Toupcam_get_MaxBitDepth(HToupCam h); /* get the max bit depth of this camera, such as 8, 10, 12, 14, 16 */

        /* power supply:
                0 -> 60HZ AC
                1 -> 50Hz AC
                2 -> DC
        */
toupcam_ports(HRESULT)  Toupcam_put_HZ(HToupCam h, int nHZ);
toupcam_ports(HRESULT)  Toupcam_get_HZ(HToupCam h, int* nHZ);

toupcam_ports(HRESULT)  Toupcam_put_Mode(HToupCam h, BOOL bSkip); /* skip or bin */
toupcam_ports(HRESULT)  Toupcam_get_Mode(HToupCam h, BOOL* bSkip); /* If the model don't support bin/skip mode, return E_NOTIMPL */

toupcam_ports(HRESULT)  Toupcam_put_AWBAuxRect(HToupCam h, const RECT* pAuxRect); /* auto white balance ROI */
toupcam_ports(HRESULT)  Toupcam_get_AWBAuxRect(HToupCam h, RECT* pAuxRect);
toupcam_ports(HRESULT)  Toupcam_put_AEAuxRect(HToupCam h, const RECT* pAuxRect);  /* auto exposure ROI */
toupcam_ports(HRESULT)  Toupcam_get_AEAuxRect(HToupCam h, RECT* pAuxRect);

        /*
            S_FALSE:    color mode
            S_OK:       mono mode, such as EXCCD00300KMA and UHCCD01400KMA
        */
toupcam_ports(HRESULT)  Toupcam_get_MonoMode(HToupCam h);

toupcam_ports(HRESULT)  Toupcam_get_StillResolutionNumber(HToupCam h);
toupcam_ports(HRESULT)  Toupcam_get_StillResolution(HToupCam h, unsigned nResolutionIndex, int* pWidth, int* pHeight);

/* default: FALSE */
toupcam_ports(HRESULT)  Toupcam_put_RealTime(HToupCam h, BOOL bEnable);
toupcam_ports(HRESULT)  Toupcam_get_RealTime(HToupCam h, BOOL* bEnable);

toupcam_ports(HRESULT)  Toupcam_Flush(HToupCam h);  /* discard the current internal frame cache */

/* get the temperature of sensor, in 0.1 degrees Celsius (32 means 3.2 degrees Celsius)
    return E_NOTIMPL if not supported
*/
toupcam_ports(HRESULT)  Toupcam_get_Temperature(HToupCam h, short* pTemperature);

/* set the temperature of sensor, in 0.1 degrees Celsius (32 means 3.2 degrees Celsius)
    return E_NOTIMPL if not supported
*/
toupcam_ports(HRESULT)  Toupcam_put_Temperature(HToupCam h, short nTemperature);

/*
    get the serial number which is always 32 chars which is zero-terminated such as "TP110826145730ABCD1234FEDC56787"
*/
toupcam_ports(HRESULT)  Toupcam_get_SerialNumber(HToupCam h, char sn[32]);

/*
    get the camera firmware version, such as: 3.2.1.20140922
*/
toupcam_ports(HRESULT)  Toupcam_get_FwVersion(HToupCam h, char fwver[16]);

/*
    get the camera hardware version, such as: 3.2.1.20140922
*/
toupcam_ports(HRESULT)  Toupcam_get_HwVersion(HToupCam h, char hwver[16]);

/*
    get the production date, such as: 20150327
*/
toupcam_ports(HRESULT)  Toupcam_get_ProductionDate(HToupCam h, char pdate[10]);

/*
    get the sensor pixel size, such as: 2.4um
*/
toupcam_ports(HRESULT)  Toupcam_get_PixelSize(HToupCam h, unsigned nResolutionIndex, float* x, float* y);

toupcam_ports(HRESULT)  Toupcam_put_LevelRange(HToupCam h, unsigned short aLow[4], unsigned short aHigh[4]);
toupcam_ports(HRESULT)  Toupcam_get_LevelRange(HToupCam h, unsigned short aLow[4], unsigned short aHigh[4]);

toupcam_ports(HRESULT)  Toupcam_put_ExpoCallback(HToupCam h, PITOUPCAM_EXPOSURE_CALLBACK fnExpoProc, void* pExpoCtx);
toupcam_ports(HRESULT)  Toupcam_put_ChromeCallback(HToupCam h, PITOUPCAM_CHROME_CALLBACK fnChromeProc, void* pChromeCtx);

/*
    The following functions must be called AFTER Toupcam_StartPushMode or Toupcam_StartPullModeWithWndMsg or Toupcam_StartPullModeWithCallback
*/
toupcam_ports(HRESULT)  Toupcam_LevelRangeAuto(HToupCam h);
toupcam_ports(HRESULT)  Toupcam_GetHistogram(HToupCam h, PITOUPCAM_HISTOGRAM_CALLBACK fnHistogramProc, void* pHistogramCtx);

/* led state:
    iLed: Led index, (0, 1, 2, ...)
    iState: 1 -> Ever bright; 2 -> Flashing; other -> Off
    iPeriod: Flashing Period (>= 500ms)
*/
toupcam_ports(HRESULT)  Toupcam_put_LEDState(HToupCam h, unsigned short iLed, unsigned short iState, unsigned short iPeriod);

toupcam_ports(HRESULT)  Toupcam_write_EEPROM(HToupCam h, unsigned addr, const unsigned char* pBuffer, unsigned nBufferLen);
toupcam_ports(HRESULT)  Toupcam_read_EEPROM(HToupCam h, unsigned addr, unsigned char* pBuffer, unsigned nBufferLen);

toupcam_ports(HRESULT)  Toupcam_write_UART(HToupCam h, const unsigned char* pData, unsigned nDataLen);
toupcam_ports(HRESULT)  Toupcam_read_UART(HToupCam h, unsigned char* pBuffer, unsigned nBufferLen);

#define TOUPCAM_TEC_TARGET_MIN      -300 /* -30.0 degrees Celsius */
#define TOUPCAM_TEC_TARGET_DEF      0 /* 0.0 degrees Celsius */
#define TOUPCAM_TEC_TARGET_MAX      300  /* 30.0 degrees Celsius */

#define TOUPCAM_OPTION_NOFRAME_TIMEOUT      0x01    /* iValue: 1 = enable; 0 = disable. default: enable */
#define TOUPCAM_OPTION_THREAD_PRIORITY      0x02    /* set the priority of the internal thread which grab data from the usb device. iValue: 0 = THREAD_PRIORITY_NORMAL; 1 = THREAD_PRIORITY_ABOVE_NORMAL; 2 = THREAD_PRIORITY_HIGHEST; default: 0; see: msdn SetThreadPriority */
#define TOUPCAM_OPTION_PROCESSMODE          0x03    /*  0 = better image quality, more cpu usage. this is the default value
                                                        1 = lower image quality, less cpu usage */
#define TOUPCAM_OPTION_RAW                  0x04    /* raw mode, read the sensor data. This can be set only BEFORE Toupcam_StartXXX() */
#define TOUPCAM_OPTION_HISTOGRAM            0x05    /* 0 = only one, 1 = continue mode */
#define TOUPCAM_OPTION_BITDEPTH             0x06    /* 0 = 8 bits mode, 1 = 16 bits mode */
#define TOUPCAM_OPTION_FAN                  0x07    /* 0 = turn off the cooling fan, [1, max] = fan speed */
#define TOUPCAM_OPTION_TEC                  0x08    /* 0 = turn off the thermoelectric cooler, 1 = turn on the thermoelectric cooler */
#define TOUPCAM_OPTION_LINEAR               0x09    /* 0 = turn off the builtin linear tone mapping, 1 = turn on the builtin linear tone mapping, default value: 1 */
#define TOUPCAM_OPTION_CURVE                0x0a    /* 0 = turn off the builtin curve tone mapping, 1 = turn on the builtin curve tone mapping, default value: 1 */
#define TOUPCAM_OPTION_TRIGGER              0x0b    /* 0 = video mode, 1 = software or simulated trigger mode, 2 = external trigger mode, default value =  0 */
#define TOUPCAM_OPTION_RGB48                0x0c    /* enable RGB48 format when bitdepth > 8 */
#define TOUPCAM_OPTION_COLORMATIX           0x0d    /* enable or disable the builtin color matrix, default value: 1 */
#define TOUPCAM_OPTION_WBGAIN               0x0e    /* enable or disable the builtin white balance gain, default value: 1 */
#define TOUPCAM_OPTION_TECTARGET            0x0f    /* get or set the target temperature of the thermoelectric cooler, in 0.1 degree Celsius. For example, 125 means 12.5 degree Celsius */
#define TOUPCAM_OPTION_AGAIN                0x10    /* enable or disable adjusting the analog gain when auto exposure is enabled. default value: enable */
#define TOUPCAM_OPTION_FRAMERATE            0x11    /* limit the frame rate, range=[0, 63], the default value 0 means no limit */
#define TOUPCAM_OPTION_DEMOSAIC             0x12    /* demosaic method: BILINEAR = 0, VNG(Variable Number of Gradients interpolation) = 1, PPG(Patterned Pixel Grouping interpolation) = 2, AHD(Adaptive Homogeneity-Directed interpolation) = 3, see https://en.wikipedia.org/wiki/Demosaicing, default value: 0 */

toupcam_ports(HRESULT)  Toupcam_put_Option(HToupCam h, unsigned iOption, int iValue);
toupcam_ports(HRESULT)  Toupcam_get_Option(HToupCam h, unsigned iOption, int* piValue);

toupcam_ports(HRESULT)  Toupcam_put_Roi(HToupCam h, unsigned xOffset, unsigned yOffset, unsigned xWidth, unsigned yHeight);
toupcam_ports(HRESULT)  Toupcam_get_Roi(HToupCam h, unsigned* pxOffset, unsigned* pyOffset, unsigned* pxWidth, unsigned* pyHeight);

/*
    get the frame rate: framerate (fps) = Frame * 1000.0 / nTime
*/
toupcam_ports(HRESULT)  Toupcam_get_FrameRate(HToupCam h, unsigned* nFrame, unsigned* nTime, unsigned* nTotalFrame);

/* astronomy: for ST4 guide, please see: ASCOM Platform Help ICameraV2.
    nDirect: 0 = North, 1 = South, 2 = East, 3 = West, 4 = Stop
    nDuration: in milliseconds
*/
toupcam_ports(HRESULT)  Toupcam_ST4PlusGuide(HToupCam h, unsigned nDirect, unsigned nDuration);

/* S_OK: pulse guiding
   S_FALSE: not pulse guiding
*/
toupcam_ports(HRESULT)  Toupcam_ST4PlusGuideState(HToupCam h);

/*
    calculate the clarity factor:
    pImageData: pointer to the image data
    bits: 8(Grey), 24 (RGB24), 32(RGB32)
    nImgWidth, nImgHeight: the image width and height
*/
toupcam_ports(double)   Toupcam_calc_ClarityFactor(const void* pImageData, int bits, unsigned nImgWidth, unsigned nImgHeight);

toupcam_ports(void)     Toupcam_deBayer(unsigned nBayer, int nW, int nH, const void* input, void* output, unsigned char nBitDepth);

typedef void (__stdcall*    PTOUPCAM_DEMOSAIC_CALLBACK)(unsigned nBayer, int nW, int nH, const void* input, void* output, unsigned char nBitDepth, void* pCallbackCtx);
toupcam_ports(HRESULT)  Toupcam_put_Demosaic(HToupCam h, PTOUPCAM_DEMOSAIC_CALLBACK pCallback, void* pCallbackCtx);

#ifndef _WIN32

typedef void (*PTOUPCAM_HOTPLUG)(void* pCallbackCtx);
toupcam_ports(void)   Toupcam_HotPlug(PTOUPCAM_HOTPLUG pHotPlugCallback, void* pCallbackCtx);

#else
/*
    strRegPath, such as: Software\xxxCompany\yyyApplication.
    If we call this function to enable this feature, the camera parameters will be save in the Registry at HKEY_CURRENT_USER\Software\XxxCompany\yyyApplication\{CameraModelName} when we close the handle,
    and then, the next time, we open the camera, the parameters will be loaded automatically.
*/
toupcam_ports(void)     Toupcam_EnableReg(const wchar_t* strRegPath);

/* Toupcam_Start is obsolete, it's a synonyms for Toupcam_StartPushMode. */
toupcam_ports(HRESULT)  Toupcam_Start(HToupCam h, PTOUPCAM_DATA_CALLBACK pDataCallback, void* pCallbackCtx);

/* Toupcam_put_TempTintInit is obsolete, it's a synonyms for Toupcam_AwbOnePush. */
toupcam_ports(HRESULT)  Toupcam_put_TempTintInit(HToupCam h, PITOUPCAM_TEMPTINT_CALLBACK fnTTProc, void* pTTCtx);

/*
    obsolete, please use Toupcam_put_Option or Toupcam_get_Option to set or get the process mode: TOUPCAM_PROCESSMODE_FULL or TOUPCAM_PROCESSMODE_FAST.
    default is TOUPCAM_PROCESSMODE_FULL.
*/
#ifndef __TOUPCAM_PROCESSMODE_DEFINED__
#define __TOUPCAM_PROCESSMODE_DEFINED__
#define TOUPCAM_PROCESSMODE_FULL        0x00    /* better image quality, more cpu usage. this is the default value */
#define TOUPCAM_PROCESSMODE_FAST        0x01    /* lower image quality, less cpu usage */
#endif

toupcam_ports(HRESULT)  Toupcam_put_ProcessMode(HToupCam h, unsigned nProcessMode);
toupcam_ports(HRESULT)  Toupcam_get_ProcessMode(HToupCam h, unsigned* pnProcessMode);

#endif

/* obsolete, please use Toupcam_put_Roi and Toupcam_get_Roi */
toupcam_ports(HRESULT)  Toupcam_put_RoiMode(HToupCam h, BOOL bRoiMode, int xOffset, int yOffset);
toupcam_ports(HRESULT)  Toupcam_get_RoiMode(HToupCam h, BOOL* pbRoiMode, int* pxOffset, int* pyOffset);

/* obsolete:
            ------------------------------------------------------------|
            | Parameter         |   Range       |   Default             |
            |-----------------------------------------------------------|
            | VidgetAmount      |   -100~100    |   0                   |
            | VignetMidPoint    |   0~100       |   50                  |
            -------------------------------------------------------------
*/
toupcam_ports(HRESULT)  Toupcam_put_VignetEnable(HToupCam h, BOOL bEnable);
toupcam_ports(HRESULT)  Toupcam_get_VignetEnable(HToupCam h, BOOL* bEnable);
toupcam_ports(HRESULT)  Toupcam_put_VignetAmountInt(HToupCam h, int nAmount);
toupcam_ports(HRESULT)  Toupcam_get_VignetAmountInt(HToupCam h, int* nAmount);
toupcam_ports(HRESULT)  Toupcam_put_VignetMidPointInt(HToupCam h, int nMidPoint);
toupcam_ports(HRESULT)  Toupcam_get_VignetMidPointInt(HToupCam h, int* nMidPoint);


implementation

end.
