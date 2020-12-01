unit devAndor;

interface

uses ATMCD32D, Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
     System.Classes, Vcl.Forms, System.Threading, System.SyncObjs, StrUtils, Vcl.Graphics,
  NumArray;

//const lineLen=256;

const RandomTrackMax=12;    //12-1

type THeadModel=array[0..31]of AnsiChar;

     TReadMode = ( rmFVB=0, rmSingleTrack=3, rmMultiTrack=1, rmRandomTrack=2, rmImage=4);
     TAcquisitionMode = (amSingleScan=1, amAccumulate=2, amKineticSeries=3, amRunTillAbort=5 );
     TFanMode = (fanOnFull=0, fanOnHalf=1, fanOff=2);

     TShutterMode = ( smodAuto=0, smodOpen=1, smodClose=2);
     TShutterTTL = ( ttlLow=0, ttlHigh=1 );

     TTriggerMode = ( tmInternal=0, tmExternal=1, tmExternalStart=6, tmExternalExposure=7, tmExternalFVB_EM=9, tmSoftware=10, tmExternalChargeShifting=12 );

     TTemperatureStatus = (tstDisable=0, tstNotReached=1, tstDrift=2, tstStabilized=3);

type TShutterParams = record
    ttl:TShutterTTL;
    mode:TShutterMode;
    closingTime:integer;
    openingTime:integer;
end;


type
     THorizontalSpeeds = record
         value:Single;
         NumGains:Integer;
         Gains:array of Single;
         end;

     TOutputAmplifiers = record
        value:Integer;
        NumHSpeeds:Integer;
        HSpeeds: array of THorizontalSpeeds;
     end;

     TADChannels = record
         value:Integer;
         NumAmp:Integer;
         BitDepth:Integer;
         OutAmplifiers:array of TOutputAmplifiers;
         end;

     TSpeeds = record
         NumChannels:Integer;
         Channels:array of TADChannels;
     end;

     TRandomTrackParam = record
         used:Boolean;
         color:TColor;
         name:string;
         centralLine:Integer;
         width:Integer;
         koef:Double;
     end;


type
     TAndor = class
    private
      FHandle: Integer;
      FHandleArray: array of Integer;
      FAvailableCamNum:integer;

      FCapabilities: TAndorCapabilities ;  // AndorCapabilities
      FModel:THeadModel;  // headmodel
      FgblXPixels:integer;       				// dims of
			FgblYPixels:integer;       				// CCD chip

      FVSnumber:integer;                 // Vertical Speed Index
      FHSnumber:integer;                 // Horizontal Speed Index
      FADnumber:integer;                 // AD Index

      FBinX, FBinY,FBinFVBX,FBinSinTrX:integer;
      FSoftBinX, FSoftBinY:Integer;
      fBufferSize:integer;
      fXdim, fYdim:integer;

      FVspeed, FHspeed: Single;
      FReadMode:TReadMode;
      fAcquisitionMode:TAcquisitionMode;

      FShutterParams:TShutterParams;
      FTriggerMode:TTriggerMode;

      fMonitoringTask:array[0..0]of ITask;
      fStopMonitoring:Boolean;
      fCritSection:TCriticalSection;

      fCurADChannelIdx:integer;
      fCurOutAmplifierIdx:integer;
      fCurHSSpeedIdx:integer;
      fCurPreAmpGainIdx:integer;


      fTemperature:Single;
      fMinTemp,fMaxTemp:Integer;

      fExposureTime,fAccumTime,fKineticTime:Single;
      fAccumNumber:Integer;

      gblCooler:boolean;
      gblData:boolean;

      fTempStatus:TTemperatureStatus;
      FCosmicFilter:Boolean;

      fRandomTrackArray:array of Integer;
      fRandomTrackCount:Word;  // lines of track


      function GetHandleArray(idx: integer): integer;
      function GetVSSpeed:Single;
      function GetHSSpeed:Single;

    procedure WaitImage;
    function  AcquireImageData:boolean; overload;
    function  AcquireImageData(const idx:integer):boolean; overload;

    procedure SetExposureTime(const Value: Single);
    procedure SetAccumTime(const accumtime:Single);
    procedure SetKineticTime(const kinetictime:Single);

    function GetCosmicFilter: Boolean;
    procedure SetCosmicFilter(const Value: Boolean);
    function GetPreamplifierGain: Single;

   public
     pImageArray:TNumArray2<integer>;
     SpeedParams:TSpeeds;

     RandomTrackParams:array[0..RandomTrackMax-1] of TRandomTrackParam;

     constructor Create(AOwner: TComponent);
     destructor Destroy; override;

     function GetAvailableCameras:integer;
     property Handle:integer read FHandle;
     property HandleArray[idx:integer]:integer read GetHandleArray;
     property RandomTrackCount:Word read fRandomTrackCount;

     function SelectCameraByHandle(hndl:Integer=-1):boolean;
     function SelectCameraByIdx(idx:Integer=-1):boolean;

     function Initialize:boolean;
     function InitializeSpeeds:Boolean;

     function SetADChannel(idx:integer):Boolean;
     function SetOutAmplifier(idx:integer):Boolean;
     function SetHSSpeed(idx:integer):Boolean;
     function SetPreAmpGain(idx:integer):Boolean;
     function GetPreAmpGain:Boolean;

     function ShutDown:boolean;
     function GetCapabilities:boolean;
     function GetHeadModel:boolean;
     function GetDetector:boolean;
     function GetInfo:boolean;
     function SetAcquisitionMode(acquisitionMode:TAcquisitionMode):boolean;
     property AcquisitionMode:TAcquisitionMode read fAcquisitionMode;

     function SetReadMode(readMode:TReadMode):boolean;
     property ReadMode:TReadMode read FReadMode;
     function SetSingleTrack(const centralRow, height:integer):boolean;


     procedure SetAccumNumber(const number:integer);
     function SetKineticNumber(const number:integer):boolean;

     function SetRecommendedVSSpeed:boolean;
     function SetMaxHSpeed:boolean;

     function AllocateBuffers:integer;
     procedure FreeBuffers;

     //Temperature
     function CoolerOFF:boolean;
     function CoolerON:boolean;

     function SetFanMode(mode:TFanMode):boolean;

     procedure UpdateTemp;
     function GetTemperatureRange:boolean;
     function SetTemperature(const Temp:integer):boolean;
     property TempStatus:TTemperatureStatus read fTempStatus;

     function SetImage( ):boolean;

     property Xdim:integer read fXdim;
     property Ydim:integer read fYdim;

     function StartAcquisition:boolean;
     procedure AbortAcquisition;

     procedure SetImageBinning(const binX, binY: integer);
     function SetFVBBinning(const binX: integer):boolean;
     function SetSingleTrackBinX(const binX:integer):boolean;
     function SetCustomTrackBinX(const binX:integer):boolean;

     property Model:THeadModel read FModel;
     property Capabilities: TAndorCapabilities read FCapabilities;
     property gblXPixels:integer read FgblXPixels;
     property gblYPixels:integer read FgblYPixels;
     property Vspeed: Single read GetVSSpeed;
     property Hspeed: Single read GetHSSpeed;

     function MaxBinX:integer;
     function MaxBinY:integer;

     function FormRandomTrackParams:Boolean;
     function SetRandomTracks:boolean;

     property BinX:Integer read FBinX;
     property BinY:Integer read FBinY;

     property SoftBinX:Integer read FSoftBinX ;
     property SoftBinY:Integer read FSoftBinY;

     procedure SetSoftBinning(SBinX, SBinY:integer);

     property CosmicFilter:Boolean read GetCosmicFilter write SetCosmicFilter;
     function GetAcquisitionTimings: boolean;
     property ExposureTime:Single read FExposureTime write SetExposureTime;
     property AccumTime:Single read FAccumTime write SetAccumTime;
     property AccumNumber:Integer read fAccumNumber write SetAccumNumber;
     property KineticTime:Single read fKineticTime write SetKineticTime;

     property Temperature:Single read fTemperature;

     property CurADChannelIdx:integer read fCurADChannelIdx;
     property CurOutAmplifierIdx:integer read fCurOutAmplifierIdx;
     property CurHSSpeedIdx:integer read fCurHSSpeedIdx;
     property CurPreAmpGainIdx:integer read fCurPreAmpGainIdx;

     property Shutter:TShutterParams read FShutterParams;
     function SetShutter(const ttl:TShutterTTL; const mode:TShutterMode; const openCloseTime:integer):boolean;

     property TriggerMode:TTriggerMode read FTriggerMode;
     function SetTriggerMode(const trig: TTriggerMode):boolean;
     property Running:boolean read gblData;

     property PreamplifierGain:Single read GetPreamplifierGain;

     property CritSectionAcq:TCriticalSection read fCritSection write fCritSection;

     procedure Log(str:string) ;
     end;

var errorFlag:boolean=false;

implementation
uses Main, Log, Math;

{ TAndor }

function TAndor.GetHandleArray(idx: integer): integer;
begin
result:=FHandleArray[idx];
end;



function TAndor.GetHeadModel: boolean;
var errorValue:integer;
begin
result:=True;
errorValue:= atmcdGetHeadModel(FModel);
    if(errorValue<>DRV_SUCCESS) then  begin
      Log(Format('Andor GetHeadModel Error [%d]',[errorValue]));
      errorFlag:=TRUE;
      result:=false;
    end;

end;

function TAndor.GetHSSpeed: Single;
var
    errorValue:integer;
    speed:Single;
begin

    errorValue:= atmcdGetHSSpeed(FADnumber, 0, FHSnumber, speed);
          if (errorValue <> DRV_SUCCESS) then begin
        Log(Format('Andor Get Horizontal Speed Error [%d]',[errorValue]));
        errorFlag:=TRUE;
        result:=-1;
      end
   else
    result:=speed;

end;

function TAndor.GetInfo: boolean;
var num,i,depth,errorValue:integer;
    sn:integer;
begin
result:=True;

errorValue:= atmcdGetCameraSerialNumber(sn);
    if(errorValue<>DRV_SUCCESS) then  begin
      Log(Format('Andor GetSerialNumbe Error [%d]',[errorValue]));
      errorFlag:=TRUE;
      result:=false;
    end
     else
      begin
      Log(Format('SerialNumber = %d',[sn]));
      end;

errorValue:= atmcdGetNumberADChannels(num);
    if(errorValue<>DRV_SUCCESS) then  begin
      Log(Format('Andor GetNumberADChannels Error [%d]',[errorValue]));
      errorFlag:=TRUE;
      result:=false;
    end
     else Log(Format('NumberADChannels=%d',[num]));

errorValue:= atmcdGetBitDepth(0, depth);
    if(errorValue<>DRV_SUCCESS) then  begin
      Log(Format('Andor GetBitDepth Error [%d]',[errorValue]));
      errorFlag:=TRUE;
      result:=false;
    end
     else Log(Format('GetBitDepth=%d',[depth]));


end;




function TAndor.GetPreAmpGain: Boolean;
var
     errorValue:integer;
     idx:Integer;
begin

//   errorValue:=atmcdGetPreAmpGain( idx );
//   if(errorValue<>DRV_SUCCESS) then  begin
//      Log(Format('Andor SetPreAmpGain Error [%d]',[errorValue]));
//      errorFlag:=TRUE;
//      Result:=False;
//    end
//   else
//     begin
//      Result:=True;
//      fCurPreAmpGainIdx:=idx;
//      end;

end;

function TAndor.GetPreamplifierGain: Single;
begin
//      33kHz  |   50kHz   |   100 kHz
//      _______|___________|________________
// PAG0  0.7   |   1.5     |   5
// PAG1   -    |   0.85    |   3.4


Result:=5.0;
end;

function TAndor.GetTemperatureRange:boolean;
var errorValue:integer;
begin
// check if temp is in valid range
  errorValue:=atmcdGetTemperatureRange(fMinTemp,fMaxTemp);
      if(errorValue<>DRV_SUCCESS) then  begin
      Log(Format('Andor GetTemperatureRange Error [%d]',[errorValue]));
      errorFlag:=TRUE;
      result:=false;
    end
    else
     begin
     Log(Format('TemperatureRange [ %d - %d ]',[fMinTemp, fMaxTemp]));
     result:=true;
     end;

end;

function TAndor.GetVSSpeed: Single;
var errorValue:integer;
    speed:Single;
begin
errorValue:=atmcdGetVSSpeed(FVSnumber, speed);
    if(errorValue<>DRV_SUCCESS) then  begin
      Log(Format('Andor GetVSSpeed Error [%d]',[errorValue]));
      errorFlag:=TRUE;
      result:=-1;
    end
 else result:=speed;

end;

function TAndor.Initialize: boolean;
var dir:AnsiString;
    errorValue:integer;


begin
result:=true;
dir:=AnsiString(GetCurrentDir);

errorValue:=atmcdInitialize( PAnsiChar(dir));
 if(errorValue<>DRV_SUCCESS) then
      begin
        Log(Format('Andor Initialize Error [%d]',[errorValue]));
        errorFlag:=TRUE;
        result:=False;
      end
  else
    begin

      fMonitoringTask[0]:=TTask.Create( procedure()
      const tempInterval=500;
      var i:Integer;
          tempT:cardinal;
       begin
        fStopMonitoring:=False;
        TempT:=GetTickCount;
        while true do
          begin
          if TTask.CurrentTask.Status=TTaskStatus.Canceled then Break;
          if fStopMonitoring then Break;

         // if (gblData=False) then
          if (GetTickCount-TempT>tempInterval) then
            begin
              fCritSection.Acquire;
//              if (Self<>nil) then
                UpdateTemp;
              fCritSection.Release;
              TempT:=GetTickCount;
            end;

          if gblData then
            begin
              fCritSection.Acquire;
              WaitImage;
              fCritSection.Release;
            end;


          for i := 0 to 0 do
              begin
              if TTask.CurrentTask.Status=TTaskStatus.Canceled then Break;
              if fStopMonitoring then Break;
              sleep(50);
              end;
          end;
       end);

    fMonitoringTask[0].Start;
    end;

end;

function TAndor.InitializeSpeeds: Boolean;
var NumChannels, NumAmp, NumPreAmpGains:Integer;
    BitDepth, NumHSpeeds: Integer;
    IsPreAmpAvailable:Integer;
    PreAmpGain, HSSpeed:Single;
    i, j, k, m , len:Integer;
begin
    atmcdGetNumberADChannels(NumChannels);
    Log('NumChannels = '+NumChannels.ToString);
    atmcdGetNumberAmp(NumAmp);
    Log('NumAmp = '+NumAmp.ToString);
    atmcdGetNumberPreAmpGains(NumPreAmpGains);
    Log('NumPreAmpGains = '+NumPreAmpGains.ToString);
    Log(' ');

    SpeedParams.NumChannels:= NumChannels;
    SetLength(SpeedParams.Channels, NumChannels );


    for i := 0 to NumChannels-1 do
     begin
     Log('Channel '+i.ToString);
        atmcdGetBitDepth(i, BitDepth);
        SpeedParams.Channels[i].value:=i;
        SpeedParams.Channels[i].BitDepth:= BitDepth;
        Log(' BitDepth '+BitDepth.ToString);
        SpeedParams.Channels[i].NumAmp:=NumAmp;
        SetLength(SpeedParams.Channels[i].OutAmplifiers, NumAmp );

        for j := 0 to NumAmp-1 do
          begin
          Log(' NumAmp '+NumAmp.ToString);
          atmcdGetNumberHSSpeeds(i,j,NumHSpeeds);
          SpeedParams.Channels[i].OutAmplifiers[j].value:=j;
          SpeedParams.Channels[i].OutAmplifiers[j].NumHSpeeds:=NumHSpeeds;
          SetLength(SpeedParams.Channels[i].OutAmplifiers[j].HSpeeds, NumHSpeeds );

          for k := 0 to NumHSpeeds-1 do
            begin
            atmcdGetHSSpeed(i,j,k,HSSpeed);
            Log(Format(' HSSpeed[%d] = %.3f',[k,  HSSpeed]));
            SpeedParams.Channels[i].OutAmplifiers[j].HSpeeds[k].value:=HSSpeed;
            for m := 0 to NumPreAmpGains-1 do
              begin
              atmcdGetPreAmpGain(m, PreAmpGain);
              atmcdIsPreAmpGainAvailable(i,j,k,m, IsPreAmpAvailable);
              Log(Format('PreAmpGain %f Is Available %d ',[PreAmpGain, IsPreAmpAvailable ]));
              if IsPreAmpAvailable<>0 then
                 begin
                  len:= Length(SpeedParams.Channels[i].OutAmplifiers[j].HSpeeds[k].Gains);
                  SpeedParams.Channels[i].OutAmplifiers[j].HSpeeds[k].NumGains:=len+1;
                  SetLength(SpeedParams.Channels[i].OutAmplifiers[j].HSpeeds[k].Gains, len+1 );
                  SpeedParams.Channels[i].OutAmplifiers[j].HSpeeds[k].Gains[len]:= PreAmpGain;
               //   Log(Format('PreAmpGain %f Is Available  ',[PreAmpGain]));
                 end;
              end;
            end;
          end;
     end;



end;

procedure TAndor.Log(str: string);
begin
  TTask.Run( procedure
      begin
       TThread.Synchronize( nil, procedure
          begin
          if FormLog<>nil then
          if FormLog.MemoLog<>nil then
          FormLog.MemoLog.Lines.Add('Andor  '+str);
          end);
      end);
end;

function TAndor.MaxBinX: integer;
const HorzVert:integer=0;
var   errorValue, MaxBin:integer;
begin
errorValue:=atmcdGetMaximumBinning(integer(FReadMode), HorzVert, MaxBin);
      if(errorValue<>DRV_SUCCESS) then  begin
        Log(Format('Andor GetMaximumBinning Error [%d]',[errorValue]));
        errorFlag:=TRUE;
        result:=0;
      end
  else result:=MaxBin;

end;

function TAndor.MaxBinY: integer;
const HorzVert:integer=1;
var   errorValue, MaxBin:integer;
begin
errorValue:=atmcdGetMaximumBinning(integer(FReadMode), HorzVert, MaxBin);
      if(errorValue<>DRV_SUCCESS) then  begin
        Log(Format('Andor GetMaximumBinning Error [%d]',[errorValue]));
        errorFlag:=TRUE;
        result:=0;
      end
  else result:=MaxBin;
end;

function TAndor.SelectCameraByHandle(hndl: Integer=-1): boolean;
var i:integer;
    errorValue:integer;
begin
if (hndl=-1) then     // First available camera
    begin
       FHandle:=FHandleArray[0];
       result:=true;
    end
  else
    begin
      result:=False;
      for i :=0 to Length(FHandleArray)-1 do
        if (hndl=FHandleArray[i]) then
           begin
            FHandle:=FHandleArray[i];
            Result:=true;
            break;
           end;
    end;

if Result then
   begin
   errorValue:=atmcdSetCurrentCamera(FHandle);
      if(errorValue<>DRV_SUCCESS) then  begin
        Log(Format('Andor SetCurrentCamera Error [%d]',[errorValue]));
        errorFlag:=TRUE;
        result:=False;
      end;
    end
  else Log('Andor open handle Error');

end;


function TAndor.SelectCameraByIdx(idx: Integer): boolean;
var
    errorValue:integer;
begin
if (idx<0) then     // First available camera
    begin
       FHandle:=FHandleArray[0];
       result:=true;
    end
  else
    begin
      if (idx <Length(FHandleArray)) then
           begin
            FHandle:=FHandleArray[idx];
            Result:=true;
            end
        else
          begin
          result:=False;
          Log('Andor open index Error');
          end;
    end;


if Result then
   begin
   errorValue:=atmcdSetCurrentCamera(FHandle);
      if(errorValue<>DRV_SUCCESS) then  begin
        Log(Format('Andor SetCurrentCamera Error [%d]',[errorValue]));
        errorFlag:=TRUE;
        result:=False;
      end;
    end;

end;

procedure TAndor.SetAccumTime(const accumtime: Single);
var errorValue:integer;
begin
errorValue:= atmcdSetAccumulationCycleTime(accumtime);
    if(errorValue<>DRV_SUCCESS) then  begin
      Log(Format('Andor SetAccumulationCycleTime Error [%d]',[errorValue]));
      errorFlag:=TRUE;
    end;
end;


function TAndor.SetAcquisitionMode(acquisitionMode: TAcquisitionMode): boolean;
var errorValue:integer;
begin
errorValue:= atmcdSetAcquisitionMode(integer(acquisitionMode));
    if(errorValue<>DRV_SUCCESS) then  begin
      Log(Format('Andor SetAcquisitionMode Error [%d]',[errorValue]));
      errorFlag:=TRUE;
      result:=false;
    end
    else
     begin
     result:=True;
     fAcquisitionMode:=acquisitionMode;
     end;
end;

function TAndor.SetADChannel(idx: integer): Boolean;
var
     errorValue, mode:integer;
begin

if idx< Length(SpeedParams.Channels) then
   begin
   errorValue:=atmcdSetADChannel(SpeedParams.Channels[idx].value);
   if(errorValue<>DRV_SUCCESS) then  begin
      Log(Format('Andor SetADChannel Error [%d]',[errorValue]));
      errorFlag:=TRUE;
      Result:=False;
    end
   else
      Result:=True;
      fCurADChannelIdx:=idx;
   end;
end;

procedure TAndor.SetCosmicFilter(const Value: Boolean);
var
     errorValue, mode:integer;
begin
if value then mode:=2
    else mode :=0;

errorValue:= atmcdSetFilterMode (mode);
    if(errorValue<>DRV_SUCCESS) then  begin
      Log(Format('Andor SetCosmicFilterMode Error [%d]',[errorValue]));
      errorFlag:=TRUE;
    end;
end;

function TAndor.SetCustomTrackBinX(const binX: integer): boolean;
var errorValue:integer;
    hstart, hend:integer;
begin
 errorValue:=atmcdSetCustomTrackHBin(binX);
    if(errorValue<>DRV_SUCCESS) then  begin
      Log(Format('Andor SetCustomTrack BinX Error [%d]',[errorValue]));
      errorFlag:=TRUE;
      result:=False;
    end
    else result:=true;
     begin
     FBinSinTrX:=binX;
     hstart:=1;
     hend:=gblXPixels;
     fXDim := round((hend-hstart+1)/FBinSinTrX);
     Result:=True;
    end;
end;

procedure TAndor.SetImageBinning(const binX, binY: integer);
var hstart, vstart, hend, vend:integer;
begin
FBinX:=binX;
FBinY:=binY;
hstart:=1;
vstart:=1;
vend:=gblYPixels;
hend:=gblXPixels;

  fXDim := round((hend-hstart+1)/FBinX);
  fYDim := round((vend-vstart+1)/FBinY);
end;

function TAndor.SetKineticNumber(const number: integer): boolean;
var errorValue:integer;
begin
 errorValue := atmcdSetNumberKinetics(number);
    if(errorValue<>DRV_SUCCESS) then  begin
      Log(Format('Andor Set Number kinetic Error [%d]',[errorValue]));
      errorFlag:=TRUE;
      result:=false;
    end
    else
      begin
      result:=True;
      end;
end;

procedure TAndor.SetKineticTime(const kinetictime: Single);
var errorValue:integer;
begin
errorValue:= atmcdSetKineticCycleTime(kinetictime);
    if(errorValue<>DRV_SUCCESS) then  begin
      Log(Format('Andor SetKineticCycleTime Error [%d]',[errorValue]));
      errorFlag:=TRUE;
    end;
end;

procedure TAndor.SetExposureTime(const Value: Single);
var
    errorValue:integer;
begin
  errorValue := atmcdSetExposureTime(Value);
      if (errorValue <> DRV_SUCCESS) then begin
        Log(Format('Andor Exposure time error Error [%d]',[errorValue]));
        errorFlag:=TRUE;
      end;
end;

function TAndor.SetFanMode(mode: TFanMode):boolean;
var
    errorValue:integer;
begin
 result:=false;

    errorValue:=atmcdSetFanMode(Integer(mode));        // Change fan (if used)
      if(errorValue<>DRV_SUCCESS) then  begin
      Log(Format('Andor fanmode Error [%d]',[errorValue]));
      errorFlag:=TRUE;
      result:=false;
    end
    else
      begin
      result:=true;
      end;
end;

function TAndor.SetFVBBinning(const binX: integer):boolean;
var
    errorValue:integer;
    hstart, hend:integer;
begin
errorValue:= atmcdSetFVBHBin(BinX);
 if (errorValue <> DRV_SUCCESS) then begin
        Log(Format('Andor SetFVB Binning Error [%d]',[errorValue]));
        errorFlag:=TRUE;
        result:=false;
      end
  else
    begin
     FBinFVBX:=binX;
     hstart:=1;
     hend:=gblXPixels;
     fXDim := round((hend-hstart+1)/FBinFVBX);
     Result:=True;
    end;
end;

function TAndor.SetHSSpeed(idx: integer): Boolean;
var
     errorValue:integer;
begin

if idx< Length(SpeedParams.Channels[fCurADChannelIdx].OutAmplifiers[fCurOutAmplifierIdx].HSpeeds) then
   begin
   errorValue:=atmcdSetHSSpeed(SpeedParams.Channels[fCurADChannelIdx].OutAmplifiers[fCurOutAmplifierIdx].value, idx );
   if(errorValue<>DRV_SUCCESS) then  begin
      Log(Format('Andor SetHSSpeed Error [%d]',[errorValue]));
      errorFlag:=TRUE;
      Result:=False;
    end
   else
      Result:=True;
      fCurHSSpeedIdx:=idx;
   end;
end;

function TAndor.SetImage: boolean;
var
    errorValue:integer;
begin
// This function only needs to be called when acquiring an image. It sets
  // the horizontal and vertical binning and the area of the image to be
  // captured. In this example it is set to 1x1 binning and is acquiring the
  // whole image

//FBinX:=1;FBinY:=1;

errorValue:= atmcdSetImage(FBinX,FBinY, 1, FgblXPixels, 1, FgblYPixels);
 if (errorValue <> DRV_SUCCESS) then begin
        Log(Format('Andor SetImage Error [%d]',[errorValue]));
        errorFlag:=TRUE;
        result:=false;
      end
  else Result:=True;
end;

function TAndor.SetMaxHSpeed: boolean;
var
    errorValue, index:integer;
    iSpeed, iAD, nAD:integer;
    STemp:Single;
begin
    result:=True;
 // Set Horizontal Speed to max
    STemp := 0;
    FHSnumber := 0;
    FADnumber := 0;

    errorValue := atmcdGetNumberADChannels(nAD);
      if (errorValue <> DRV_SUCCESS) then begin
        Log(Format('Andor Get number AD Channel Error [%d]',[errorValue]));
        errorFlag:=TRUE;
        result:=false;
      end

    else  begin
      for iAD := 0 to nAD-1  do
       begin
        atmcdGetNumberHSSpeeds(iAD, 0, index);
        for iSpeed := 0 to index-1 do
           begin
            atmcdGetHSSpeed(iAD, 0, iSpeed, FHspeed);
            if(FHspeed > STemp) then
                begin
                  STemp := FHspeed;
                  FHSnumber := iSpeed;
                  FADnumber := iAD;
                end;
          end;
      end;
    end;

    errorValue:=atmcdSetADChannel(FADnumber);
      if (errorValue <> DRV_SUCCESS) then begin
        Log(Format('Andor Set AD Channel Error [%d]',[errorValue]));
        errorFlag:=TRUE;
        result:=false;
      end;


    errorValue:=atmcdSetHSSpeed(0,FHSnumber);
      if (errorValue <> DRV_SUCCESS) then begin
        Log(Format('Andor Set Horizontal Speed Error [%d]',[errorValue]));
        errorFlag:=TRUE;
        result:=false;
      end;


    if (FCapabilities.ulSetFunctions and AC_SETFUNCTION_BASELINECLAMP)>0 then
      errorValue:=atmcdSetBaselineClamp(1);
      if (errorValue <> DRV_SUCCESS) then begin
        Log(Format('Andor Set Baseline Clamp Error [%d]',[errorValue]));
        errorFlag:=TRUE;
        result:=false;
      end;

end;

function TAndor.SetOutAmplifier(idx: integer): Boolean;
var
     errorValue:integer;
begin

if idx< Length(SpeedParams.Channels[fCurADChannelIdx].OutAmplifiers) then
   begin
   errorValue:=atmcdSetOutputAmplifier(SpeedParams.Channels[fCurADChannelIdx].OutAmplifiers[idx].value);
   if(errorValue<>DRV_SUCCESS) then  begin
      Log(Format('Andor SetOutputAmplifie Error [%d]',[errorValue]));
      errorFlag:=TRUE;
      Result:=False;
    end
   else
      Result:=True;
      fCurOutAmplifierIdx:=idx;
   end;
end;

function TAndor.SetPreAmpGain(idx: integer): Boolean;
var
     errorValue:integer;
begin

if idx< Length(SpeedParams.Channels[fCurADChannelIdx].OutAmplifiers[fCurOutAmplifierIdx].HSpeeds[fCurHSSpeedIdx].Gains) then
   begin
   errorValue:=atmcdSetPreAmpGain( idx );
   if(errorValue<>DRV_SUCCESS) then  begin
      Log(Format('Andor SetPreAmpGain Error [%d]',[errorValue]));
      errorFlag:=TRUE;
      Result:=False;
    end
   else
      Result:=True;
      fCurPreAmpGainIdx:=idx;
   end;
end;

procedure TAndor.SetAccumNumber(const number: integer);
var errorValue:integer;
begin
 errorValue := atmcdSetNumberAccumulations(number);
    if(errorValue<>DRV_SUCCESS) then  begin
      Log(Format('Andor Set Number accumulation Error [%d]',[errorValue]));
      errorFlag:=TRUE;
//      result:=false;
    end
    else
      begin
      fAccumNumber:=number;
//      result:=True;
      end;
end;

function TAndor.FormRandomTrackParams: Boolean;
var len:Integer;
  i,j: Integer;
begin

if Length(RandomTrackParams)=0 then Exit(False);

   len := 0;
   for i := 0 to Length(RandomTrackParams)-1 do
     if RandomTrackParams[i].used then
        inc(len);

   SetLength(fRandomTrackArray, 2*len);

   j:=0;
   for i := 0 to Length(RandomTrackParams)-1 do
     if RandomTrackParams[i].used then
        begin
        fRandomTrackArray[2*j]:= Max(0, RandomTrackParams[i].centralLine - Trunc(RandomTrackParams[i].width/2) );
        fRandomTrackArray[2*j+1]:= Min(299, fRandomTrackArray[2*j] + RandomTrackParams[i].width);
        Inc(j);
        end;

  Result:=True;
end;


function TAndor.SetRandomTracks: boolean;
var errorValue:integer;
    num:Integer;
begin

num:=Length(fRandomTrackArray) div 2;

errorValue:= atmcdSetRandomTracks(num, @fRandomTrackArray[0]);
    if(errorValue<>DRV_SUCCESS) then  begin
      Log(Format('Andor SetRandomTrack Error [%d]',[errorValue]));
      errorFlag:=TRUE;
      result:=false;
    end
    else
      begin
      result:=True;
      fRandomTrackCount:=num;
      end;

end;

function TAndor.SetReadMode(readMode: TReadMode): boolean;
var errorValue:integer;
begin
errorValue:= atmcdSetReadMode(integer(readMode));
    if(errorValue<>DRV_SUCCESS) then  begin
      Log(Format('Andor SetReadMode Error [%d]',[errorValue]));
      errorFlag:=TRUE;
      result:=false;
    end
    else
      begin
      FReadMode:=readMode;
      result:=True;
      end;

end;

function TAndor.SetRecommendedVSSpeed: boolean;
var errorValue:integer;
begin
// Set Vertical speed to recommended
atmcdGetFastestRecommendedVSSpeed(FVSnumber, FVspeed);

Result:=true;
errorValue:=atmcdSetVSSpeed(FVSnumber);
    if(errorValue<>DRV_SUCCESS) then  begin
      Log(Format('Andor SetVSSpeed Error [%d]',[errorValue]));
      errorFlag:=TRUE;
      result:=false;
    end;

end;


function TAndor.SetShutter(const ttl:TShutterTTL; const mode:TShutterMode; const openCloseTime:integer): boolean;
var errorValue:integer;
begin
 errorValue:=atmcdSetShutter(integer(ttl),integer(mode),openCloseTime,openCloseTime);
  if(errorValue<>DRV_SUCCESS) then begin
      Log(Format('Andor Shutter Error [%d]',[errorValue]));
      errorFlag:=TRUE;
      result:=false;
      end
   else
    begin
      FShutterParams.ttl:= ttl;
      FShutterParams.mode:=mode;
      FShutterParams.closingTime:= openCloseTime;
      FShutterParams.openingTime:= openCloseTime;

     Log('Shutter set to specifications');
     result:=true;
    end;
end;

function TAndor.SetSingleTrack(const centralRow, height:integer): boolean;
var errorValue:integer;
begin
 errorValue:=atmcdSetSingleTrack(centralRow, height);
    if(errorValue<>DRV_SUCCESS) then  begin
      Log(Format('Andor SetSingleTrack Error [%d]',[errorValue]));
      errorFlag:=TRUE;
      result:=False;
    end
    else result:=true;
end;

function TAndor.SetSingleTrackBinX(const binX: integer): boolean;
var errorValue:integer;
    hstart, hend:integer;
begin
 errorValue:=atmcdSetSingleTrackHBin(binX);
    if(errorValue<>DRV_SUCCESS) then  begin
      Log(Format('Andor SetSingleTrack BinX Error [%d]',[errorValue]));
      errorFlag:=TRUE;
      result:=False;
    end
    else result:=true;
     begin
     FBinSinTrX:=binX;
     hstart:=1;
     hend:=gblXPixels;
     fXDim := round((hend-hstart+1)/FBinSinTrX);
     Result:=True;
    end;

end;

procedure TAndor.SetSoftBinning(SBinX, SBinY:integer);
begin
if SBinX> fXdim then FSoftBinX:= fXdim else FSoftBinX:= SBinX;
if SBinY> fYdim then FSoftBinY:= fYdim else FSoftBinY:= SBinY;
end;

function TAndor.SetTemperature(const Temp: integer): boolean;
var errorValue:integer;
begin
if(Temp<fMinTemp) or (Temp>fMaxTemp) then
    begin
    Log('Temperature is out of range');
    result:=false;
    exit;
    end
 else
   begin
     if gblCooler then
        begin
        errorValue:=atmcdSetTemperature(Temp);
        if(errorValue<>DRV_SUCCESS) then
         Log(Format('Andor set temperature Error [%d]',[errorValue]));
         errorFlag:=TRUE;
         result:=False;
        end
        else
          begin
           Log(Format('Temperature has been set to %d (C)',[Temp]));
           result:=True;
         end;
   end;

end;

function TAndor.SetTriggerMode(const trig: TTriggerMode):boolean;
var errorValue:integer;
begin
   errorValue:=atmcdSetTriggerMode(integer(trig));
    if(errorValue<>DRV_SUCCESS) then  begin
      Log(Format('Andor Set Trigger Mode Error [%d]',[errorValue]));
      errorFlag:=TRUE;
      result:=False;
    end
    else begin
    FTriggerMode := trig;
        case trig  of
          tmInternal: Log('Trigger set to Internal');
          tmExternal: Log('Trigger set to External');
          tmSoftware: Log('Trigger set to Software');
        end;
    result:=True;
    end;
end;


function TAndor.ShutDown: boolean;
var errorValue:integer;
begin
Result:=true;
if Assigned(fMonitoringTask[0]) and (fMonitoringTask[0].Status = TTaskStatus.Running) then
        begin
        fStopMonitoring:=True;

        if not fMonitoringTask[0].Wait(1000) then
           begin
           fMonitoringTask[0].Cancel;
           Sleep(500);
          end;
        end;

errorValue:=atmcdShutDown;
    if(errorValue<>DRV_SUCCESS) then  begin
      Log(Format('Andor ShutDown Error [%d]',[errorValue]));
      errorFlag:=TRUE;
      result:=false;
    end

end;


function TAndor.StartAcquisition:boolean;
var status, errorValue:integer;
begin
   errorValue:=atmcdGetStatus(status);
   if(errorValue<>DRV_SUCCESS) then exit(False);
   if status<>DRV_IDLE then exit(False);

  errorValue:=atmcdStartAcquisition();
  if(FTriggerMode=tmExternal) then
    Log('Waiting for external trigger');
  if(errorValue<>DRV_SUCCESS) then begin
    Log(Format('Andor Start acquisition Error [%d]',[errorValue]));
    atmcdAbortAcquisition();
    gblData:=False;
    Result:=False;
  end
  else begin
    Log('Starting acquisition........');
    PostMessage(FormMain.Handle,WM_ANDOR_START, 0,0);
    gblData:=true;
    Result:=True;
    //fMonitoringTask[0].Start;
  end;

end;


procedure TAndor.UpdateTemp;
var errorValue:integer;
begin
errorValue:=atmcdGetTemperatureF(fTemperature);
      case errorValue of
      DRV_TEMPERATURE_STABILIZED: fTempStatus:=tstStabilized;    // "Temperature has stabilized at %d (C)",temperature
      DRV_TEMP_DRIFT: fTempStatus:=tstDrift;
      DRV_TEMPERATURE_NOT_REACHED: fTempStatus:=tstNotReached;   // "Current temperature is %d (C)",temperature
      else  fTempStatus:=tstDisable;                             // "Temperature control is disabled",temperature

      end;


end;

procedure TAndor.WaitImage;
var errorValue,status:integer;
   vf,vl:integer;
begin
   atmcdGetStatus(status);

//  if(status=DRV_IDLE) then
//    begin
//    if(AcquireImageData()=FALSE) then
//      begin
//       Log('Acquisition Error!');
//      end;
//    gblData:=false;
//    end
//  else
    begin
    errorValue := atmcdGetNumberNewImages(vf, vl); //Signal main application
    	if (errorValue = DRV_SUCCESS) then
        if vf>0 then
           begin
         if(AcquireImageData(vf)=FALSE) then
          begin
           Log('Acquisition Error!');
          end
          else
           begin
           if(status=DRV_IDLE) then
            begin
             gblData:=false;
             PostMessage(FormMain.Handle,WM_ANDOR_STOP, 0,0);
            end;
        //   Log('Acquisition Finished');
           end;

         end;

    end;

end;


procedure TAndor.AbortAcquisition;
var
    errorValue, status:integer;
begin
    atmcdGetStatus(status);
    if(status=DRV_ACQUIRING) then
     begin
      errorValue:=atmcdAbortAcquisition();
      if(errorValue<>DRV_SUCCESS) then begin
        Log(Format('Andor aborting acquistion Error [%d]',[errorValue]));
        errorFlag:=TRUE;
      end
       else
      begin
       Log('Aborting Acquisition....');
       PostMessage(FormMain.Handle,WM_ANDOR_STOP, 0,0);
       gblData:=false;
       while True do
        begin
        atmcdGetStatus(status);
        if status=DRV_IDLE then break;

        end;

      end;
    end
     else
     begin
     Log ('System not Acquiring');
     PostMessage(FormMain.Handle,WM_ANDOR_STOP, 0,0);
     end;

//  if Assigned(OnAbortAcq) then OnAbortAcq(Self);

end;


function TAndor.AcquireImageData: boolean;
var errorValue:integer;
begin

  errorValue:=atmcdGetAcquiredData(pImageArray.Buffer,fBufferSize);
  if(errorValue<>DRV_SUCCESS) then  begin
      Log(Format('Andor GetAcquiredData Error [%d]',[errorValue]));
      errorFlag:=TRUE;
      result:=false;
      exit;
    end
    else
     begin
     result:=true;
     PostMessage(FormMain.Handle,WM_ANDOR_IMG, 0,0);
     Log('Andor GetFrame');
     end;

end;


function TAndor.AcquireImageData(const idx: integer): boolean;
var  errorValue:integer;
    vf, vl:integer;
begin

  errorValue:=atmcdGetImages(idx, idx, pImageArray.Buffer, fBufferSize, vf, vl );
  if(errorValue<>DRV_SUCCESS) then  begin
      Log(Format('Andor GetAcquiredData Error [%d]',[errorValue]));
      errorFlag:=TRUE;
      result:=false;
      exit;
    end
    else
     begin
     result:=true;
     PostMessage(FormMain.Handle,WM_ANDOR_IMG, 0,0);
     Log('Andor GetFrame Multi');
     end;

end;

function TAndor.AllocateBuffers: integer;
var i,size:integer;
begin
 FreeBuffers;

 if FReadMode=rmImage then
    begin
    size:=fXDim*fYDim;  // Needs to hold full image
     // only allocate if necessary
    end;

 if (FReadMode=rmFVB) or (FReadMode=rmSingleTrack ) then
    begin
    size:= gblXPixels; // fXDim; - doesn`t work in this camera
    fXDim:=gblXPixels;
//    //try one more time
//    size:= fXDim;
//    fXDim:=fXDim;

    fYDim:=1;
    end;

if (FReadMode=rmRandomTrack ) then
    begin
    fYDim:=0;
    for i := 0 to High(RandomTrackParams) do
      if RandomTrackParams[i].used then
       inc(fYDim);
    size:=fXDim*fYDim;
    end;


   if(pImageArray=nil) then
    	 pImageArray:=TNumArray2<integer>.Create(fYDim, fXDim);

 fBufferSize:=size;
 result:= size;
end;

function TAndor.CoolerOFF:Boolean;
var
    errorValue:integer;
begin
result:=false;
 if (Capabilities.ulSetFunctions and AC_SETFUNCTION_TEMPERATURE)>0 then
  begin
    errorValue:=atmcdCoolerOFF();        // Switch off cooler (if used)
      if(errorValue<>DRV_SUCCESS) then  begin
      Log(Format('Andor switching cooler off Error [%d]',[errorValue]));
      errorFlag:=TRUE;
    end
    else
      begin
       gblCooler:=false;
       result:=true;
      end;
  end;

end;

function TAndor.CoolerON:boolean;
var
    errorValue:integer;
begin
 result:=false;
 if (Capabilities.ulSetFunctions and AC_SETFUNCTION_TEMPERATURE)>0 then
  begin
    errorValue:=atmcdCoolerON();        // Switch off cooler (if used)
      if(errorValue<>DRV_SUCCESS) then  begin
      Log(Format('Andor switching cooler on Error [%d]',[errorValue]));
      errorFlag:=TRUE;
      result:=false;
    end
    else
      begin
      gblCooler:=true;
      result:=true;
      end;
  end;

end;

constructor TAndor.Create(AOwner: TComponent);
begin
FCapabilities.ulSize := sizeof(TAndorCapabilities);
FBinX:=1;
FBinY:=1;
FSoftBinX:=1;
FSoftBinY:=1;

gblCooler:=false;
gblData:=false;

fCritSection:=TCriticalSection.Create;

fCurADChannelIdx:=0;
fCurOutAmplifierIdx:=0;
fCurHSSpeedIdx:=0;
fCurPreAmpGainIdx:=0;

end;

destructor TAndor.Destroy;
begin

FreeBuffers;
fCritSection.Free;
inherited Destroy;
end;

procedure TAndor.FreeBuffers;
begin
  if( pImageArray<>nil) then
    begin
//     FreeAndNil(pImageArray);
     pImageArray.Free;
     pImageArray := nil;
    end;

end;

function TAndor.GetAvailableCameras: integer;
var i:integer;
    errorValue:integer;
begin
FAvailableCamNum:=0;
errorValue:= atmcdGetAvailableCameras(FAvailableCamNum);
    if(errorValue<>DRV_SUCCESS) then  begin
      Log(Format('Andor GetAvailableCameras Error [%d]',[errorValue]));
      errorFlag:=TRUE;
      FAvailableCamNum:=0;
      result:=0;
    end;

SetLength(FHandleArray, FAvailableCamNum);
for i := 0 to FAvailableCamNum-1 do
  begin
  errorValue:=atmcdGetCameraHandle(i, FHandleArray[i]);
      if(errorValue<>DRV_SUCCESS) then  begin
      Log(Format('Andor GetCameraHandle Error [%d]',[errorValue]));
      errorFlag:=TRUE;
    end;
  end;

Result:=FAvailableCamNum;
end;

function TAndor.GetCapabilities: boolean;
var errorValue:integer;
begin
result:=True;
errorValue:= atmcdGetCapabilities(FCapabilities);
    if(errorValue<>DRV_SUCCESS) then  begin
      Log(Format('Andor GetCapabilities Error [%d]',[errorValue]));
      errorFlag:=TRUE;
      result:=false;
    end;

end;

function TAndor.GetCosmicFilter: Boolean;
var errorValue, mode:integer;
begin
errorValue:= atmcdGetFilterMode (mode);
    if(errorValue<>DRV_SUCCESS) then  begin
      Log(Format('Andor GetCosmicFilterMode Error [%d]',[errorValue]));
      errorFlag:=TRUE;
      result:=false;
    end
  else
    begin
    if mode = 2  then  result:=true
    else
    result:= false;
    end;
end;

function TAndor.GetDetector: boolean;
var errorValue:integer;
begin
result:=True;
errorValue:= atmcdGetDetector(FgblXPixels, FgblYPixels);
    if(errorValue<>DRV_SUCCESS) then  begin
      Log(Format('Andor GetDetector Error [%d]',[errorValue]));
      errorFlag:=TRUE;
      result:=false;
    end;
end;


function TAndor.GetAcquisitionTimings: boolean;
var errorValue:integer;

begin
  errorValue:= atmcdGetAcquisitionTimings(fExposureTime,fAccumTime,fKineticTime);

    if(errorValue<>DRV_SUCCESS) then  begin
      Log(Format('Andor GetAcquisitionTimings Error [%d]',[errorValue]));
      errorFlag:=TRUE;
      result:=false;
    end
     else result:=true;
end;


end.
