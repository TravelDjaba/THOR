unit libToupcam;

interface
uses
  Winapi.Windows;
const
  toupcam_ports = 'toupcam.dll';
{ Version: 1.6.5962.20150806 }

const
 TOUPCAM_MAX =  15; //16;

 TOUPCAM_FLAG_CMOS =              $00000001;  //* cmos sensor
 TOUPCAM_FLAG_CCD_PROGRESSIVE =   $00000002;  //* progressive ccd sensor */
 TOUPCAM_FLAG_CCD_INTERLACED =    $00000004;  //* interlaced ccd sensor */
 TOUPCAM_FLAG_ROI_HARDWARE =      $00000008;  //* support hardware ROI */
 TOUPCAM_FLAG_MONO =              $00000010;  //* monochromatic */
 TOUPCAM_FLAG_BINSKIP_SUPPORTED = $00000020;  //* support bin/skip mode, see Toupcam_put_Mode and Toupcam_get_Mode */
 TOUPCAM_FLAG_USB30 =             $00000040;  //* USB 3.0 */
 TOUPCAM_FLAG_COOLED =            $00000080;  //* Cooled */
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
 //TOUPCAM_FLAG_TRIGGER =           $00080000;  //* support the trigger mode */
  //Triggers
 TOUPCAM_FLAG_TRIGGER_SOFTWARE  = $00080000;  //* support software trigger */
 TOUPCAM_FLAG_TRIGGER_EXTERNAL  = $00100000;  //* support external trigger */
 TOUPCAM_FLAG_TRIGGER_SINGLE    = $00200000;  //* only support trigger single: one trigger, one image */


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



//{$A8}
{$OLDTYPELAYOUT ON}

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


type PRECT = ^TRECT;
     TRECT =  record
     left:  Integer;
     top:   Integer;
     right: Integer;
     bottom:Integer;
end;


//typedef struct ToupcamT { int unused; } *HToupCam;
type ToupcamT =  record
  unused:Integer;
end;
type HToupCam=^ToupcamT;

type ToupcamResolution =  record
   width:Cardinal;
   height:Cardinal;
end;

type ToupcamModel =  record
   name: PChar;         //* model name */
   flag: Cardinal;      //* TOUPCAM_FLAG_xxx */
   maxspeed: Cardinal;  //* number of speed level, same as Toupcam_get_MaxSpeed(), the speed range = [0, maxspeed], closed interval */
   preview: Cardinal;   //* number of preview resolution, same as Toupcam_get_ResolutionNumber() */
   still: Cardinal;     //* number of still resolution, same as Toupcam_get_StillResolutionNumber() */
   res: array[0..TOUPCAM_MAX] of ToupcamResolution;
end;

type ToupcamInst =  record
  displayname : array[0..63] of Char;    //* display name */
  id : array[0..63] of Char;             ///* unique and opaque id of a connected camera, for Toupcam_Open */
  model: ^ToupcamModel;
end;

type HRESULT = Integer;
type PPByte = ^PByte;

{
    get the version of this dll, which is: 1.6.5962.20150806
}
function Toupcam_Version():PChar; stdcall; external toupcam_ports delayed;

{ enumerate the cameras connected to the computer, return the number of enumerated.

    ToupcamInst arr[TOUPCAM_MAX];
    unsigned cnt = Toupcam_Enum(arr);
    for (unsigned i = 0; i < cnt; ++i)
        ...

    if pti == NULL, then, only the number is returned.      }
type TToupcamInst = array [0..TOUPCAM_MAX] of ToupcamInst;
type PToupcamInst = ^TToupcamInst;

function Toupcam_Enum(pti:PToupcamInst): Cardinal; stdcall; external toupcam_ports delayed;

{ use the id of ToupcamInst, which is enumerated by Toupcam_Enum.
    if id is NULL, Toupcam_Open will open the first camera. }
function Toupcam_Open( id:PChar):HToupCam; stdcall; external toupcam_ports delayed;

{ the same with Toupcam_Open, but use the index as the parameter. such as:
    index == 0, open the first camera,
    index == 1, open the second camera,
    etc  }
function Toupcam_OpenByIndex(index:cardinal):HToupCam;  stdcall; external toupcam_ports delayed;

procedure Toupcam_Close(h:HToupCam); stdcall; external toupcam_ports delayed; //* close the handle */

function Toupcam_StartPullModeWithWndMsg(h:HToupCam; Wnd:HWND; nMsg:Cardinal ):HRESULT;  stdcall; external toupcam_ports delayed;

type TOUPCAM_EVENT_CALLBACK = procedure(nEvent:Cardinal; pCallbackCtx:Pointer);stdcall;
type PTOUPCAM_EVENT_CALLBACK=^TOUPCAM_EVENT_CALLBACK;

function Toupcam_StartPullModeWithCallback(h:HToupCam; pEventCallback:PTOUPCAM_EVENT_CALLBACK; pCallbackContext:Pointer): HRESULT;  stdcall; external toupcam_ports delayed;

{   bits: 24 (RGB24), 32 (RGB32), or 8 (Grey). Int RAW mode, this parameter is ignored.
    pnWidth, pnHeight: OUT parameter  }

function Toupcam_PullImage(h:HToupCam; pImageData:Pointer; bits:Integer; pnWidth:PCardinal; pnHeight:PCardinal): HRESULT;  stdcall; external toupcam_ports delayed;
function Toupcam_PullStillImage(h:HToupCam; pImageData:Pointer; bits:Integer; pnWidth:PCardinal; pnHeight:PCardinal): HRESULT;  stdcall; external toupcam_ports delayed;

{  (NULL == pData) means that something is error
    pCallbackCtx is the callback context which is passed by Toupcam_Start
    bSnap: TRUE if Toupcam_Snap

    pDataCallback is callbacked by an internal thread of toupcam.dll, so please pay attention to multithread problem }

type TOUPCAM_DATA_CALLBACK = procedure(const pData:PCardinal; const pHeader:PBITMAPINFOHEADER; bSnap:LongBool; pCallbackCtx:Pointer); stdcall;
type PTOUPCAM_DATA_CALLBACK = ^TOUPCAM_DATA_CALLBACK;

function Toupcam_StartPushMode(h:HToupCam; pDataCallback:PTOUPCAM_DATA_CALLBACK; pCallbackCtx:Pointer): HRESULT;  stdcall; external toupcam_ports delayed;

function Toupcam_Stop(h:HToupCam): HRESULT;  stdcall; external toupcam_ports delayed;
function Toupcam_Pause(h:HToupCam; bPause:LongBool): HRESULT;  stdcall; external toupcam_ports delayed;

{ for pull mode: TOUPCAM_EVENT_STILLIMAGE, and then Toupcam_PullStillImage
    for push mode: the snapped image will be return by PTOUPCAM_DATA_CALLBACK, with the parameter 'bSnap' set to 'TRUE' }
function Toupcam_Snap(h:HToupCam; nResolutionIndex:Cardinal): HRESULT;  stdcall; external toupcam_ports delayed;  //* still image snap */

function Toupcam_Trigger(h:HToupCam): HRESULT;  stdcall; external toupcam_ports delayed; //* soft trigger */

{   put_Size, put_eSize, can be used to set the video output resolution BEFORE ToupCam_Start.
    put_Size use width and height parameters, put_eSize use the index parameter.
    for example, UCMOS03100KPA support the following resolutions:
            index 0:    2048,   1536
            index 1:    1024,   768
            index 2:    680,    510
    so, we can use put_Size(h, 1024, 768) or put_eSize(h, 1). Both have the same effect. }
function Toupcam_put_Size(h:HToupCam; nWidth:Integer; nHeight:integer): HRESULT;  stdcall; external toupcam_ports delayed;
function  Toupcam_get_Size(h:HToupCam; pWidth:PInteger; pHeight:PInteger): HRESULT;  stdcall; external toupcam_ports delayed;

function  Toupcam_put_eSize(h:HToupCam; nResolutionIndex:Cardinal): HRESULT;  stdcall; external toupcam_ports delayed;
function  Toupcam_get_eSize(h:HToupCam; pnResolutionIndex:PCardinal): HRESULT;  stdcall; external toupcam_ports delayed;

function  Toupcam_get_ResolutionNumber(h:HToupCam): HRESULT;  stdcall; external toupcam_ports delayed;
function  Toupcam_get_Resolution(h:HToupCam; nResolutionIndex:Cardinal; pWidth:PInteger; pHeight:PInteger): HRESULT;  stdcall; external toupcam_ports delayed;
function  Toupcam_get_ResolutionRatio(h:HToupCam; nResolutionIndex:Cardinal; pNumerator:PInteger; pDenominator:PInteger): HRESULT;  stdcall; external toupcam_ports delayed;

{
FourCC:
    MAKEFOURCC('G', 'B', 'R', 'G')
    MAKEFOURCC('R', 'G', 'G', 'B')
    MAKEFOURCC('B', 'G', 'G', 'R')
    MAKEFOURCC('G', 'R', 'B', 'G')
    MAKEFOURCC('Y', 'U', 'Y', 'V')
    MAKEFOURCC('Y', 'Y', 'Y', 'Y')
}
function Toupcam_get_RawFormat(h:HToupCam; nFourCC:PCardinal; bitdepth:PCardinal): HRESULT;  stdcall; external toupcam_ports delayed;

{
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
}

type ITOUPCAM_EXPOSURE_CALLBACK = procedure(pCtx:Pointer);stdcall;
type PITOUPCAM_EXPOSURE_CALLBACK = ^ITOUPCAM_EXPOSURE_CALLBACK;

type TGain = array[0..3] of Integer;
type ITOUPCAM_WHITEBALANCE_CALLBACK = procedure(const aGain:TGain; pCtx:Pointer);stdcall;
type PITOUPCAM_WHITEBALANCE_CALLBACK = ^ITOUPCAM_WHITEBALANCE_CALLBACK;

type ITOUPCAM_TEMPTINT_CALLBACK = procedure(const nTemp:Integer; const nTint:Integer; pCtx:Pointer);stdcall;
type PITOUPCAM_TEMPTINT_CALLBACK = ^ITOUPCAM_TEMPTINT_CALLBACK;

type THist = array[0..256] of Double;
type ITOUPCAM_HISTOGRAM_CALLBACK = procedure(const aHistY:THist; const aHistR:THist; const aHistG:THist; const aHistB:THist; pCtx:Pointer);
type PITOUPCAM_HISTOGRAM_CALLBACK = ^ITOUPCAM_HISTOGRAM_CALLBACK;

type ITOUPCAM_CHROME_CALLBACK = procedure(pCtx:Pointer);stdcall;
type PITOUPCAM_CHROME_CALLBACK = ^ITOUPCAM_CHROME_CALLBACK;

function Toupcam_get_AutoExpoEnable(h:HToupCam; bAutoExposure:PLongBool): HRESULT;  stdcall; external toupcam_ports delayed;
function Toupcam_put_AutoExpoEnable(h:HToupCam; bAutoExposure:LongBool): HRESULT;  stdcall; external toupcam_ports delayed;
function Toupcam_get_AutoExpoTarget(h:HToupCam; Target:PWord): HRESULT;  stdcall; external toupcam_ports delayed;
function Toupcam_put_AutoExpoTarget(h:HToupCam; Target:Word): HRESULT;  stdcall; external toupcam_ports delayed;

{set the maximum auto exposure time and analog agin. The default maximum auto exposure time is 350ms }
function Toupcam_put_MaxAutoExpoTimeAGain(h:HToupCam; maxTime:Cardinal; maxAGain:Word): HRESULT;  stdcall; external toupcam_ports delayed;

function Toupcam_get_ExpoTime(h:HToupCam; Time:PCardinal): HRESULT;  stdcall; external toupcam_ports delayed;  //* in microseconds */
function Toupcam_put_ExpoTime(h:HToupCam; Time:Cardinal): HRESULT;  stdcall; external toupcam_ports delayed;  //* in microseconds */
function Toupcam_get_ExpTimeRange(h:HToupCam; nMin:PCardinal; nMax:PCardinal; nDef:PCardinal): HRESULT;  stdcall; external toupcam_ports delayed;

function Toupcam_get_ExpoAGain(h:HToupCam; AGain:PWord): HRESULT;  stdcall; external toupcam_ports delayed;  //* percent, such as 300 */
function Toupcam_put_ExpoAGain(h:HToupCam; AGain:Word): HRESULT;  stdcall; external toupcam_ports delayed; //* percent */
function Toupcam_get_ExpoAGainRange(h:HToupCam; nMin:PWord; nMax:PWord; nDef:PWord): HRESULT;  stdcall; external toupcam_ports delayed;

{ Auto White Balance, Temp/Tint Mode }
function Toupcam_AwbOnePush(h:HToupCam; fnTTProc:PITOUPCAM_TEMPTINT_CALLBACK; pTTCtx:Pointer): HRESULT;  stdcall; external toupcam_ports delayed; //* auto white balance "one push". The function must be called AFTER Toupcam_StartXXXX */

{ Auto White Balance, RGB Gain Mode }
function  Toupcam_AwbInit(h:HToupCam; fnWBProc:PITOUPCAM_WHITEBALANCE_CALLBACK; pWBCtx:Pointer): HRESULT;  stdcall; external toupcam_ports delayed;

{ White Balance, Temp/Tint mode }
function  Toupcam_put_TempTint(h:HToupCam; nTemp:Integer; nTint:Integer): HRESULT;  stdcall; external toupcam_ports delayed;
function  Toupcam_get_TempTint(h:HToupCam; nTemp:PInteger; nTint:PInteger): HRESULT;  stdcall; external toupcam_ports delayed;

{ White Balance, RGB Gain mode }
function  Toupcam_put_WhiteBalanceGain(h:HToupCam; aGain:TGain): HRESULT;  stdcall; external toupcam_ports delayed;
function  Toupcam_get_WhiteBalanceGain(h:HToupCam; aGain:TGain): HRESULT;  stdcall; external toupcam_ports delayed;

function  Toupcam_put_Hue(h:HToupCam; Hue:Integer): HRESULT;  stdcall; external toupcam_ports delayed;
function  Toupcam_get_Hue(h:HToupCam; Hue:PInteger): HRESULT;  stdcall; external toupcam_ports delayed;
function  Toupcam_put_Saturation(h:HToupCam; Saturation:Integer): HRESULT;  stdcall; external toupcam_ports delayed;
function  Toupcam_get_Saturation(h:HToupCam; Saturation:PInteger): HRESULT;  stdcall; external toupcam_ports delayed;
function  Toupcam_put_Brightness(h:HToupCam; Brightness:Integer): HRESULT;  stdcall; external toupcam_ports delayed;
function  Toupcam_get_Brightness(h:HToupCam; Brightness:PInteger): HRESULT;  stdcall; external toupcam_ports delayed;
function  Toupcam_get_Contrast(h:HToupCam; Contrast:PInteger): HRESULT;  stdcall; external toupcam_ports delayed;
function  Toupcam_put_Contrast(h:HToupCam; Contrast:Integer): HRESULT;  stdcall; external toupcam_ports delayed;
function  Toupcam_get_Gamma(h:HToupCam; Gamma:PInteger): HRESULT;  stdcall; external toupcam_ports delayed; ///* percent */
function  Toupcam_put_Gamma(h:HToupCam; Gamma:Integer): HRESULT;  stdcall; external toupcam_ports delayed;  //* percent */

function  Toupcam_get_Chrome(h:HToupCam; bChrome:PLongBool): HRESULT;  stdcall; external toupcam_ports delayed;  //* monochromatic mode */
function  Toupcam_put_Chrome(h:HToupCam; bChrome:LongBool): HRESULT;  stdcall; external toupcam_ports delayed;

function  Toupcam_get_VFlip(h:HToupCam; bVFlip:PLongBool): HRESULT;  stdcall; external toupcam_ports delayed;  //* vertical flip */
function  Toupcam_put_VFlip(h:HToupCam; bVFlip:LongBool): HRESULT;  stdcall; external toupcam_ports delayed;
function  Toupcam_get_HFlip(h:HToupCam; bHFlip:PLongBool): HRESULT;  stdcall; external toupcam_ports delayed;
function  Toupcam_put_HFlip(h:HToupCam; bHFlip:LongBool): HRESULT;  stdcall; external toupcam_ports delayed; //* horizontal flip */

function  Toupcam_get_Negative(h:HToupCam; bNegative:PLongBool): HRESULT;  stdcall; external toupcam_ports delayed;  //* negative film */
function  Toupcam_put_Negative(h:HToupCam; bNegative:LongBool): HRESULT;  stdcall; external toupcam_ports delayed;

function  Toupcam_put_Speed(h:HToupCam; nSpeed:Word): HRESULT;  stdcall; external toupcam_ports delayed;
function  Toupcam_get_Speed(h:HToupCam; pSpeed:PWord): HRESULT;  stdcall; external toupcam_ports delayed;
function  Toupcam_get_MaxSpeed(h:HToupCam): HRESULT;  stdcall; external toupcam_ports delayed; //* get the maximum speed, see "Frame Speed Level", the speed range = [0, max], closed interval */

function  Toupcam_get_MaxBitDepth(h:HToupCam): HRESULT;  stdcall; external toupcam_ports delayed; //* get the max bit depth of this camera, such as 8, 10, 12, 14, 16 */
        { power supply:
                0 -> 60HZ AC
                1 -> 50Hz AC
                2 -> DC
        }
function  Toupcam_put_HZ(h:HToupCam; nHZ:Integer): HRESULT;  stdcall; external toupcam_ports delayed;
function  Toupcam_get_HZ(h:HToupCam; nHZ:PInteger): HRESULT;  stdcall; external toupcam_ports delayed;

function  Toupcam_put_Mode(h:HToupCam; bSkip:LongBool): HRESULT;  stdcall; external toupcam_ports delayed; //* skip or bin */
function  Toupcam_get_Mode(h:HToupCam; bSkip:PLongBool): HRESULT;  stdcall; external toupcam_ports delayed; //* If the model don't support bin/skip mode, return E_NOTIMPL */

function  Toupcam_put_AWBAuxRect(h:HToupCam; const pAuxRect:PRECT): HRESULT;  stdcall; external toupcam_ports delayed; //* auto white balance ROI */
function  Toupcam_get_AWBAuxRect(h:HToupCam; pAuxRect:PRECT): HRESULT;  stdcall; external toupcam_ports delayed;
function  Toupcam_put_AEAuxRect(h:HToupCam; const pAuxRect:PRECT): HRESULT;  stdcall; external toupcam_ports delayed;  //* auto exposure ROI */
function  Toupcam_get_AEAuxRect(h:HToupCam; pAuxRect:PRECT): HRESULT;  stdcall; external toupcam_ports delayed;

        {
            S_FALSE:    color mode
            S_OK:       mono mode, such as EXCCD00300KMA and UHCCD01400KMA
        }
function  Toupcam_get_MonoMode(h:HToupCam): HRESULT;  stdcall; external toupcam_ports delayed;

function  Toupcam_get_StillResolutionNumber(h:HToupCam): HRESULT;  stdcall; external toupcam_ports delayed;
function  Toupcam_get_StillResolution(h:HToupCam; nIndex:Cardinal; pWidth:PInteger; pHeight:PInteger): HRESULT;  stdcall; external toupcam_ports delayed;

{ default: FALSE }
function  Toupcam_put_RealTime(h:HToupCam; bEnable:LongBool): HRESULT;  stdcall; external toupcam_ports delayed;
function  Toupcam_get_RealTime(h:HToupCam; bEnable:PLongBool): HRESULT;  stdcall; external toupcam_ports delayed;

function  Toupcam_Flush(h:HToupCam): HRESULT;  stdcall; external toupcam_ports delayed;  //* discard the current internal frame cache */

{ get the temperature of sensor, in 0.1 degrees Celsius (32 means 3.2 degrees Celsius)
    return E_NOTIMPL if not supported }
function  Toupcam_get_Temperature(h:HToupCam; pTemperature:PSmallInt): HRESULT;  stdcall; external toupcam_ports delayed;

{ set the temperature of sensor, in 0.1 degrees Celsius (32 means 3.2 degrees Celsius)
    return E_NOTIMPL if not supported }
function  Toupcam_put_Temperature(h:HToupCam; nTemperature:SmallInt): HRESULT;  stdcall; external toupcam_ports delayed;

{   get the serial number which is always 32 chars which is zero-terminated such as "TP110826145730ABCD1234FEDC56787" }
type T32Achar = array[0..31] of AnsiChar;
type P32Achar = ^T32Achar;
function  Toupcam_get_SerialNumber(h:HToupCam; sn:P32Achar): HRESULT;  stdcall; external toupcam_ports delayed;

// !!!works with not all cameras!!!
{    get the camera firmware version, such as: 3.2.1.20140922 }
type T16Achar = array[0..15] of AnsiChar;
type P16Achar = ^T16Achar;
function  Toupcam_get_FwVersion(h:HToupCam; fwver:P16Achar): HRESULT;  stdcall; external toupcam_ports delayed;

{    get the camera hardware version, such as: 3.2.1.20140922}
function  Toupcam_get_HwVersion(h:HToupCam; hwver:P16Achar): HRESULT;  stdcall; external toupcam_ports delayed;

{    get the production date, such as: 20150327 }
type T10Achar = array[0..9] of AnsiChar;
type P10Achar = ^T10Achar;
function  Toupcam_get_ProductionDate(h:HToupCam; pdate:P10Achar): HRESULT;  stdcall; external toupcam_ports delayed;

type T4Word = array[0..4] of word;
type P4Word = ^T4Word;
function  Toupcam_put_LevelRange(h:HToupCam;  aLow:P4Word;  aHigh:P4Word): HRESULT;  stdcall; external toupcam_ports delayed;
function  Toupcam_get_LevelRange(h:HToupCam;  aLow:P4Word; aHigh:P4Word): HRESULT;  stdcall; external toupcam_ports delayed;

function  Toupcam_put_ExpoCallback(h:HToupCam;  fnExpoProc:PITOUPCAM_EXPOSURE_CALLBACK; pExpoCtx:Pointer): HRESULT;  stdcall; external toupcam_ports delayed;
function  Toupcam_put_ChromeCallback(h:HToupCam; fnChromeProc:PITOUPCAM_CHROME_CALLBACK; pChromeCtx:Pointer): HRESULT;  stdcall; external toupcam_ports delayed;

{    The following functions must be called AFTER Toupcam_StartPushMode or Toupcam_StartPullModeWithWndMsg or Toupcam_StartPullModeWithCallback }
function  Toupcam_LevelRangeAuto(h:HToupCam): HRESULT;  stdcall; external toupcam_ports delayed;
function  Toupcam_GetHistogram(h:HToupCam; fnHistogramProc:PITOUPCAM_HISTOGRAM_CALLBACK; pHistogramCtx:Pointer): HRESULT;  stdcall; external toupcam_ports delayed;

{ led state:
    iLed: Led index, (0, 1, 2, ...)
    iState: 1 -> Ever bright; 2 -> Flashing; other -> Off
    iPeriod: Flashing Period (>= 500ms) }
function  Toupcam_put_LEDState(h:HToupCam; iLed:word; iState:word; iPeriod:word): HRESULT;  stdcall; external toupcam_ports delayed;

function  Toupcam_write_EEPROM(h:HToupCam; addr:Cardinal; const pData:PAnsiChar; nDataLen:Cardinal): HRESULT;  stdcall; external toupcam_ports delayed;
function  Toupcam_read_EEPROM(h:HToupCam; addr:Cardinal; pBuffer:PAnsiChar; nBufferLen:Cardinal): HRESULT;  stdcall; external toupcam_ports delayed;

function  Toupcam_put_Option(h:HToupCam; iOption:Cardinal; iValue:Cardinal): HRESULT;  stdcall; external toupcam_ports delayed;
function  Toupcam_get_Option(h:HToupCam; iOption:Cardinal; piValue:PCardinal): HRESULT;  stdcall; external toupcam_ports delayed;

function  Toupcam_put_Roi(h:HToupCam; xOffset:Cardinal; yOffset:Cardinal; xWidth:Cardinal; yHeight:Cardinal): HRESULT;  stdcall; external toupcam_ports delayed;
function  Toupcam_get_Roi(h:HToupCam; pxOffset:PCardinal; pyOffset:PCardinal; pxWidth:PCardinal; pyHeight:PCardinal): HRESULT;  stdcall; external toupcam_ports delayed;

{ astronomy: for ST4 guide, please see: ASCOM Platform Help ICameraV2.
    nDirect: 0 = North, 1 = South, 2 = East, 3 = West, 4 = Stop
    nDuration: in milliseconds
}
function  Toupcam_ST4PlusGuide(h:HToupCam; nDirect:Cardinal; nDuration:Cardinal): HRESULT;  stdcall; external toupcam_ports delayed;

{ S_OK: pulse guiding
   S_FALSE: not pulse guiding
}
function  Toupcam_ST4PlusGuideState(h:HToupCam): HRESULT;  stdcall; external toupcam_ports delayed;

{
    calculate the clarity factor:
    pImageData: pointer to the image data
    bits: 8(Grey), 24 (RGB24), 32(RGB32)
    nImgWidth, nImgHeight: the image width and height
}
function   Toupcam_calc_ClarityFactor(const pImageData:Pointer; bits:Integer; nImgWidth:Cardinal; nImgHeight:Cardinal):Double; stdcall; external toupcam_ports delayed;

procedure   Toupcam_deBayer(nBayer:Cardinal; nW:Integer; nH:Integer; const input:Pointer; output:Pointer; nBitDepth:AnsiChar); stdcall; external toupcam_ports delayed;


//typedef void (*PTOUPCAM_HOTPLUG)(void* pCallbackCtx);
//toupcam_ports(void)   Toupcam_HotPlug(PTOUPCAM_HOTPLUG pHotPlugCallback, void* pCallbackCtx);
type TTOUPCAM_HOTPLUG = procedure(pCallbackCtx:Pointer);
type PTOUPCAM_HOTPLUG = ^TTOUPCAM_HOTPLUG;
procedure Toupcam_HotPlug(pHotPlugCallback:PTOUPCAM_HOTPLUG; pCallbackCtx:Pointer); stdcall; external toupcam_ports delayed;
{
    strRegPath, such as: Software\xxxCompany\yyyApplication.
    If we call this function to enable this feature, the camera parameters will be save in the Registry at HKEY_CURRENT_USER\Software\XxxCompany\yyyApplication\(CameraModelName) when we close the handle,
    and then, the next time, we open the camera, the parameters will be loaded automatically.
}
procedure  Toupcam_EnableReg( strRegPath:PChar); stdcall; external toupcam_ports delayed;

{ Toupcam_Start is obsolete, it's a synonyms for Toupcam_StartPushMode. They are exactly the same. }
function  Toupcam_Start(h:HToupCam; pDataCallback:PTOUPCAM_DATA_CALLBACK; pCallbackCtx:Pointer): HRESULT;  stdcall; external toupcam_ports delayed;

{ Toupcam_put_TempTintInit is obsolete, it's a synonyms for Toupcam_AwbOnePush. They are exactly the same. }
function  Toupcam_put_TempTintInit(h:HToupCam; fnTTProc:PITOUPCAM_TEMPTINT_CALLBACK; pTTCtx:Pointer): HRESULT;  stdcall; external toupcam_ports delayed;

{
    This is obsolete, please use:
    set or get the process mode: TOUPCAM_PROCESSMODE_FULL or TOUPCAM_PROCESSMODE_FAST. default is TOUPCAM_PROCESSMODE_FULL.
}

function  Toupcam_put_ProcessMode(h:HToupCam;  nProcessMode:Cardinal): HRESULT;  stdcall; external toupcam_ports delayed;
function  Toupcam_get_ProcessMode(h:HToupCam; pnProcessMode:PCardinal): HRESULT;  stdcall; external toupcam_ports delayed;


{ This is obsolete }
function  Toupcam_put_RoiMode(h:HToupCam; bRoiMode:LongBool; xOffset:Integer; yOffset:integer): HRESULT;  stdcall; external toupcam_ports delayed;
function  Toupcam_get_RoiMode(h:HToupCam; pbRoiMode:PLongBool; pxOffset:PInteger; pyOffset:PInteger): HRESULT;  stdcall; external toupcam_ports delayed;

{ This is obsolete
            ------------------------------------------------------------|
            | Parameter         |   Range       |   Default             |
            |-----------------------------------------------------------|
            | VidgetAmount      |   -100~100    |   0                   |
            | VignetMidPoint    |   0~100       |   50                  |
            -------------------------------------------------------------
}
function  Toupcam_put_VignetEnable(h:HToupCam; bEnable:LongBool): HRESULT;  stdcall; external toupcam_ports delayed;
function  Toupcam_get_VignetEnable(h:HToupCam; bEnable:PLongBool): HRESULT;  stdcall; external toupcam_ports delayed;
function  Toupcam_put_VignetAmountInt(h:HToupCam; nAmount:Integer): HRESULT;  stdcall; external toupcam_ports delayed;
function  Toupcam_get_VignetAmountInt(h:HToupCam; nAmount:PInteger): HRESULT;  stdcall; external toupcam_ports delayed;
function  Toupcam_put_VignetMidPointInt(h:HToupCam; nMidPoint:Integer): HRESULT;  stdcall; external toupcam_ports delayed;
function  Toupcam_get_VignetMidPointInt(h:HToupCam; nMidPoint:PInteger): HRESULT;  stdcall; external toupcam_ports delayed;


implementation

end.
