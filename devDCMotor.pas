unit devDCMotor;

interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.ExtCtrls , Vcl.Forms, Vcl.Dialogs, MaxonDefinitions,
   System.Threading, System.SyncObjs;

  type THomingParams = record
    HomingAcceleration: LongWord;
    SpeedSwitch: LongWord;
    SpeedIndex: LongWord;
    HomeOffset: Longint;
    CurrentThreshold: Word;
    HomePosition: Longint;
  end;

   TPositionProfileParams = record
     ProfileVelocity: LongWord;
     ProfileAcceleration: LongWord;
     ProfileDeceleration: LongWord;
    end;

   TVelocityProfileParams = record
     ProfileAcceleration: LongWord;
     ProfileDeceleration: LongWord
    end;


  type TDCMotor = class
    private
     fOwner:TComponent;
     fKeyHandle:Integer;
     fNodeId:Word;
     fPortName : PAnsiChar;
     fConnected:Boolean;
     fTimer:TTimer;
     fOperationMode:Shortint;
     fMovementState:LongBool;

     function Err(ErrorCode: Longword):Boolean;
     procedure Log(str:string);
     function ShowErrorInformation(dErrorCode:longword): boolean;
     function GetState: Word;
     procedure SetState(const Value: Word);



    public
     constructor Create(AOwner: TComponent);
     destructor Destroy; override;

     function Find:Boolean;
     function Open:Boolean;
     procedure Close;
     procedure CloseAllDevices;

     procedure InitMotor;

     procedure SetEnable;
     procedure SetDisable;
     procedure SetQuickStop;

     procedure ClearFault;
     procedure ResetDevice;

     property State:Word read GetState write SetState;

     property Connected:Boolean read fConnected;

    public
     function GetOperationMode:Boolean;
     function OperationModeToText(opMode:ShortInt):String;
     property OperationMode:ShortInt read fOperationMode;

     //Homing Mode
    private
     fHomingAttained:LongBool;
     fHomingError:LongBool;
    public
     HomingParams:THomingParams;
     function ActivateHomingMode:Boolean;
     function GetHomingParameter:Boolean;
     function SetHomingParameter:Boolean;
     procedure FindHome(HomingMethod:Shortint);
     procedure StopHome;
     function IdxToHomingMethod(const idx:Integer):ShortInt;
     function HomingMethodToIdx(const HomingMethod:ShortInt):integer;
     function WaitForHomingAttained(Timeout:Integer):Boolean;
     function GetHomingState:Boolean;

     property HomingAttained:LongBool read fHomingAttained;
     property HomingError:LongBool read fHomingError;

    // ProfilePosition Mode
    private
     fTargetPosition:Integer;
     fPositionWindow:Integer;
     fPositionWindowTime:SmallInt;

    public
     PositionProfileParams:TPositionProfileParams;
     function ActivatePositionProfileMode:Boolean;
     function GetPositionProfile:Boolean;
     function SetPositionProfile:Boolean;
     function MoveToPosition(TargetPosition: Longint; Absolute: LongBool; Immediately: LongBool):Boolean;
     function GetTargetPosition:Boolean;
     procedure HaltPositionMovement;
     function EnablePositionWindow:Boolean;
     function DisablePositionWindow:Boolean;

     property TargetPosition:Integer read fTargetPosition;
     property PositionWindow:Integer read fPositionWindow write fPositionWindow;
     property PositionWindowTime:SmallInt read fPositionWindowTime write fPositionWindowTime;

   // ProfileVelocity Mode
    private
     fTargetVelocity:Integer;
     fVelocityWindow:Integer;
     fVelocityWindowTime:SmallInt;
    public
     VelocityProfileParams:TVelocityProfileParams;
     function ActivateVelocityProfileMode:Boolean;
     function GetVelocityProfile:Boolean;
     function SetVelocityProfile:Boolean;
     function MoveWithVelocity(TargetVelocity: Integer):Boolean;
     function GetTargetVelocity:Boolean;
     procedure HaltVelocityMovement;
     function EnableVelocityWindow:Boolean;
     function DisableVelocityWindow:Boolean;

     property TargetVelocity:Integer read fTargetVelocity;
     property VelocityWindow:Integer read fVelocityWindow write fVelocityWindow;
     property VelocityWindowTime:SmallInt read fVelocityWindowTime write fVelocityWindowTime;

     //Movement
    private
     fPositionIs, fVelocityIs, fVelocityIsAvg:Integer;

    public
     function ReachTarget:Boolean;

     function GetPositionIs:Boolean;
     function GetVelocityIs:Boolean;
     function GetVelocityIsAvg:Boolean;
     function WaitForTargetReached(Timeout:integer):Boolean;

     property MovementState:LongBool read fMovementState;

     property PositionIs:integer read fPositionIs;
     property VelocityIs:integer read fVelocityIs;
     property VelocityIsAvg:integer read fVelocityIsAvg;


  end;

implementation

uses
  main, Log;

{ TDCMotor }


function TDCMotor.ActivateHomingMode: Boolean;
var ErrorCode: Longword;
begin
 Result:=False;
 if fConnected then
 begin
 Result:=VCS_ActivateHomingMode(fKeyHandle, fNodeId, ErrorCode);
 Err(ErrorCode);
 end;

end;

function TDCMotor.ActivatePositionProfileMode: Boolean;
var ErrorCode: Longword;
begin
 Result:=False;
 if fConnected then
 begin
 VCS_ActivateProfilePositionMode(fKeyHandle, fNodeId, ErrorCode);
 Result:=Err(ErrorCode);
 end;

end;

function TDCMotor.ActivateVelocityProfileMode: Boolean;
var ErrorCode: Longword;
begin
 Result:=False;
 if fConnected then
 begin
 VCS_ActivateProfileVelocityMode(fKeyHandle, fNodeId, ErrorCode);
 Result:=Err(ErrorCode);
 end;
end;


procedure TDCMotor.ClearFault;
var ErrorCode: Longword;
begin

  VCS_ClearFault(fKeyHandle, fNodeId, ErrorCode);
  if Err(ErrorCode) then
     fConnected:=False;

end;

procedure TDCMotor.Close;
var ErrorCode: Longword;
begin

  VCS_CloseDevice(fKeyHandle, ErrorCode);
  if Err(ErrorCode) then
     fConnected:=False;

end;

procedure TDCMotor.CloseAllDevices;
var ErrorCode: Longword;
begin

  VCS_CloseAllDevices( ErrorCode);
  if Err(ErrorCode) then
     fConnected:=False;

end;

constructor TDCMotor.Create(AOwner: TComponent);
begin
  fOwner:=AOwner;
  fKeyHandle:=0;
  fNodeId:=1;
  fConnected:=False;
  GetMem(fPortName, 100);
  fTimer:=TTimer.Create(AOwner);
  fTimer.Interval:=1000;
  fTimer.Enabled:=False;
end;

destructor TDCMotor.Destroy;
begin
  if fConnected then
  Close;
  fTimer.Free;
  FreeMem(fPortName);
  inherited;
end;

function TDCMotor.DisablePositionWindow: Boolean;
var ErrorCode: Longword;
begin
 Result:=False;
if fConnected then
    begin
    VCS_DisablePositionWindow(fKeyHandle,fNodeId,ErrorCode);
      Result:=Err(ErrorCode);
    end;
end;

function TDCMotor.DisableVelocityWindow: Boolean;
var ErrorCode: Longword;
begin
 Result:=False;
if fConnected then
    begin
    VCS_DisableVelocityWindow(fKeyHandle,fNodeId,ErrorCode);
      Result:=Err(ErrorCode);
    end;
end;

function TDCMotor.EnablePositionWindow: Boolean;
var
    ErrorCode: Longword;
begin
 Result:=False;

 if fConnected then
    begin
    VCS_EnablePositionWindow(fKeyHandle,fNodeId, fPositionWindow, fPositionWindowTime, ErrorCode);
    Result:= Err(ErrorCode);
    end;
end;

function TDCMotor.EnableVelocityWindow: Boolean;
var
    ErrorCode: Longword;
begin
 Result:=False;

 if fConnected then
    begin
    VCS_EnableVelocityWindow(fKeyHandle,fNodeId, fVelocityWindow, fVelocityWindowTime, ErrorCode);
    Result:= Err(ErrorCode);
    end;
end;

function TDCMotor.Err(ErrorCode: Longword): Boolean;
begin
if ErrorCode=0 then Result:=True
  else
   begin
    ShowErrorInformation(ErrorCode);
    Result:=False;
   end;
end;

function TDCMotor.Find: Boolean;
const
     Size : WORD = 100;
var
    DeviceName, ProtocolStackName, InterfaceName : PAnsiChar;
    ErrorCode: Longword;

    EndOfSelection:LongBool;

begin
   DeviceName:=PAnsiChar('EPOS2');
   ProtocolStackName:=PAnsiChar('MAXON SERIAL V2');
   interfaceName:=PAnsiChar('USB');

   fKeyHandle:=0;
   Result:=False;

   EndOfSelection:=False;

  if VCS_ResetPortNameSelection(DeviceName, ProtocolStackName, InterfaceName, ErrorCode) then
   if VCS_GetPortNameSelection(DeviceName, ProtocolStackName, interfaceName, True, fPortName, Size, EndOfSelection, ErrorCode) then
   begin
//     FormMain.MemoLog.Lines.Add(string(fPortName) );
     Log('port - '+string(fPortName));
     Result:=True;

//  Select to the first founded device

//    while not EndOfSelection do
//      if VCS_GetPortNameSelection(DeviceName, ProtocolStackName, interfaceName, False, PortName, Size, EndOfSelection, ErrorCode) then
//      FormMain.MemoLog.Lines.Add(string(PortName) );
   end;
end;

procedure TDCMotor.FindHome(HomingMethod: Shortint);
var
    ErrorCode: Longword;
begin

if fConnected then
  if fOperationMode=OMD_HOMING_MODE then
  begin
    VCS_FindHome(fKeyHandle, fNodeId, HomingMethod, ErrorCode);
    Err(ErrorCode);
  end;

end;

function TDCMotor.GetHomingParameter: Boolean;
var
    ErrorCode: Longword;
begin
 Result:=False;
if fConnected then
  with HomingParams do
  VCS_GetHomingParameter(fKeyHandle, fNodeId, HomingAcceleration, SpeedSwitch, SpeedIndex, HomeOffset, CurrentThreshold, HomePosition, ErrorCode );
    Result:= Err(ErrorCode);

end;

function TDCMotor.GetHomingState: Boolean;
var
    ErrorCode: Longword;
begin

 Result:=False;
if fConnected then
  if fOperationMode=OMD_HOMING_MODE then
  begin
    Result:= VCS_GetHomingState(fKeyHandle, fNodeId, fHomingAttained, fHomingError, ErrorCode);
    Err(ErrorCode);
  end;

end;

function TDCMotor.ReachTarget: Boolean;
var
    ErrorCode: Longword;
begin
//checks if the drive has reached target
 Result:=False;
if fConnected then
 begin
  VCS_GetMovementState(fKeyHandle,fNodeId,fMovementState,ErrorCode);
  Result:=fMovementState;
 end;

end;

function TDCMotor.GetOperationMode: Boolean;
var
    ErrorCode: Longword;
begin
 Result:=False;
if fConnected then
 begin
  Result:= VCS_GetOperationMode(fKeyHandle,fNodeId,fOperationMode,ErrorCode);
  Err(ErrorCode);
 end;


end;

function TDCMotor.GetPositionIs: Boolean;
var
    ErrorCode: Longword;
begin
 Result:=False;
if fConnected then
  begin
  VCS_GetPositionIs(fKeyHandle, fNodeId, fPositionIs, ErrorCode );
    Result:= Err(ErrorCode);
  end;

end;

function TDCMotor.GetPositionProfile: Boolean;
var
    ErrorCode: Longword;
begin
 Result:=False;
if fConnected then
  with PositionProfileParams do
  VCS_GetPositionProfile(fKeyHandle, fNodeId, ProfileVelocity, ProfileAcceleration, ProfileDeceleration, ErrorCode );
    Result:= Err(ErrorCode);

end;

function TDCMotor.GetState: Word;
var
    ErrorCode: Longword;
    State:Word;
begin
if fConnected then
 begin
    VCS_GetState(fKeyHandle, fNodeId, State, ErrorCode) ;
    if Err(ErrorCode) then
      result:=State;
 end;

end;

function TDCMotor.GetTargetPosition: Boolean;
var
    ErrorCode: Longword;
begin
 Result:=False;
if fConnected then
  begin
  VCS_GetTargetPosition(fKeyHandle, fNodeId, fTargetPosition, ErrorCode );
    Result:= Err(ErrorCode);
  end;

end;

function TDCMotor.GetTargetVelocity: Boolean;
var
    ErrorCode: Longword;
begin
 Result:=False;
if fConnected then
  begin
  VCS_GetTargetVelocity(fKeyHandle, fNodeId, fTargetVelocity, ErrorCode );
    Result:= Err(ErrorCode);
  end;
end;

function TDCMotor.GetVelocityIs: Boolean;
var
    ErrorCode: Longword;
begin
 Result:=False;
if fConnected then
  begin
  VCS_GetVelocityIs(fKeyHandle, fNodeId, fVelocityIs, ErrorCode );
    Result:= Err(ErrorCode);
  end;
end;

function TDCMotor.GetVelocityIsAvg: Boolean;
var
    ErrorCode: Longword;
begin
 Result:=False;
if fConnected then
  begin
  VCS_GetVelocityIsAveraged(fKeyHandle, fNodeId, fVelocityIsAvg, ErrorCode );
    Result:= Err(ErrorCode);
  end;
end;

function TDCMotor.GetVelocityProfile: Boolean;
var
    ErrorCode: Longword;
begin
 Result:=False;
if fConnected then
  with VelocityProfileParams do
  VCS_GetVelocityProfile(fKeyHandle, fNodeId, ProfileAcceleration, ProfileDeceleration, ErrorCode );
    Result:= Err(ErrorCode);

end;

procedure TDCMotor.HaltPositionMovement;
var ErrorCode: Longword;
begin
 if fConnected then
    begin
    VCS_HaltPositionMovement(fKeyHandle,fNodeId,ErrorCode);
    Err(ErrorCode);
    end;
end;

procedure TDCMotor.HaltVelocityMovement;
var ErrorCode: Longword;
begin
 if fConnected then
    begin
    VCS_HaltVelocityMovement(fKeyHandle,fNodeId,ErrorCode);
    Err(ErrorCode);
    end;
end;

function TDCMotor.HomingMethodToIdx(const HomingMethod: ShortInt): integer;
begin
  if HomingMethod=HM_ACTUAL_POSITION  then Result:= 0
  else if  HomingMethod=HM_INDEX_POSITIVE_SPEED  then Result:= 1
  else if  HomingMethod=HM_INDEX_NEGATIVE_SPEED  then Result:= 2
  else if  HomingMethod=HM_HOME_SWITCH_NEGATIVE_SPEED  then Result:= 3
  else if  HomingMethod=HM_HOME_SWITCH_POSITIVE_SPEED  then Result:= 4
  else if  HomingMethod=HM_POSITIVE_LIMIT_SWITCH  then Result:= 5
  else if  HomingMethod=HM_NEGATIVE_LIMIT_SWITCH  then Result:= 6
  else if  HomingMethod=HM_HOME_SWITCH_NEGATIVE_SPEED_AND_INDEX  then Result:= 7
  else if  HomingMethod=HM_HOME_SWITCH_POSITIVE_SPEED_AND_INDEX  then Result:= 8
  else if  HomingMethod=HM_POSITIVE_LIMIT_SWITCH_AND_INDEX  then Result:= 9
  else if  HomingMethod=HM_NEGATIVE_LIMIT_SWITCH_AND_INDEX  then Result:= 10
  else if  HomingMethod=HM_CURRENT_THRESHOLD_POSITIVE_SPEED_AND_INDEX  then Result:= 11
  else if  HomingMethod=HM_CURRENT_THRESHOLD_NEGATIVE_SPEED_AND_INDEX  then Result:= 12
  else if  HomingMethod=HM_CURRENT_THRESHOLD_POSITIVE_SPEED  then Result:= 13
  else if  HomingMethod=HM_CURRENT_THRESHOLD_NEGATIVE_SPEED  then Result:= 14
  else Result:= 0;

end;

function TDCMotor.IdxToHomingMethod(const idx:Integer): ShortInt;
begin
    {Homing method}
case idx of
    0: Result:= HM_ACTUAL_POSITION ;
    1: Result:= HM_INDEX_POSITIVE_SPEED ;
    2: Result:= HM_INDEX_NEGATIVE_SPEED ;
    3: Result:= HM_HOME_SWITCH_NEGATIVE_SPEED ;
    4: Result:= HM_HOME_SWITCH_POSITIVE_SPEED ;
    5: Result:= HM_POSITIVE_LIMIT_SWITCH ;
    6: Result:= HM_NEGATIVE_LIMIT_SWITCH ;
    7: Result:= HM_HOME_SWITCH_NEGATIVE_SPEED_AND_INDEX ;
    8: Result:= HM_HOME_SWITCH_POSITIVE_SPEED_AND_INDEX ;
    9: Result:= HM_POSITIVE_LIMIT_SWITCH_AND_INDEX ;
    10:Result:= HM_NEGATIVE_LIMIT_SWITCH_AND_INDEX ;

    11:Result:= HM_CURRENT_THRESHOLD_POSITIVE_SPEED_AND_INDEX ;
    12:Result:= HM_CURRENT_THRESHOLD_NEGATIVE_SPEED_AND_INDEX ;
    13:Result:= HM_CURRENT_THRESHOLD_POSITIVE_SPEED ;
    14:Result:= HM_CURRENT_THRESHOLD_NEGATIVE_SPEED ;
   else
   Result:= 0;
end;

end;

procedure TDCMotor.InitMotor;
var MotorType: SmallInt;
    ErrorCode: Longword;
    NominalCurrent,MaxOutputCurrent, ThermalTimeConstant : SmallInt;
    SensorType:SmallInt;
    EncoderResolution, InvertedPolarity:Integer;
begin
//  if not fConnected then Exit;
    VCS_SetMotorType(fKeyHandle, fNodeId, MT_DC_MOTOR, ErrorCode);
    VCS_GetMotorType(fKeyHandle, fNodeId, MotorType, ErrorCode);
    if Err(ErrorCode) then
     Log('MotorType='+MotorType.ToString );

    VCS_GetDcMotorParameter(fKeyHandle, fNodeId, NominalCurrent, MaxOutputCurrent, ThermalTimeConstant, ErrorCode);
    if Err(ErrorCode) then
    begin
     Log('NominalCurrent='+NominalCurrent.ToString );
     Log('MaxOutputCurrent='+MaxOutputCurrent.ToString );
     Log('ThermalTimeConstant='+ThermalTimeConstant.ToString );
    end;

   VCS_SetSensorType(fKeyHandle, fNodeId, ST_INC_ENCODER_3CHANNEL, ErrorCode);
   VCS_GetSensorType(fKeyHandle, fNodeId, SensorType, ErrorCode);
      if Err(ErrorCode) then
      Log('SensorType='+SensorType.ToString );

  // VCS_SetIncEncoderParameter(fKeyHandle, fNodeId, 1024, 1, ErrorCode);
   VCS_GetIncEncoderParameter(fKeyHandle, fNodeId, EncoderResolution, InvertedPolarity, ErrorCode);
       if Err(ErrorCode) then
    begin
    Log('EncoderResolution='+EncoderResolution.ToString );
    Log('InvertedPolarity='+InvertedPolarity.ToString );
    end;

end;

procedure TDCMotor.Log(str: string);
begin
//  FormMain.MemoLog.Lines.Add('DC Motor: '+str);
  TTask.Run( procedure
      begin
       TThread.Synchronize( nil, procedure
          begin
          if FormLog<>nil then
          if FormLog.MemoLog<>nil then
          FormLog.MemoLog.Lines.Add('DCMotor: '+ str);

          end);
      end);

end;

function TDCMotor.MoveToPosition(TargetPosition: Longint; Absolute: LongBool; Immediately: LongBool): Boolean;
var
    ErrorCode: Longword;
begin
  Result:=False;
if fConnected then
  if fOperationMode=OMD_PROFILE_POSITION_MODE then
  begin
    VCS_MoveToPosition(fKeyHandle, fNodeId, TargetPosition, Absolute, Immediately, ErrorCode);
    if Err(ErrorCode) then
    Result:=True;
  end;

end;

function TDCMotor.MoveWithVelocity(TargetVelocity: Integer): Boolean;
var
    ErrorCode: Longword;
begin
  Result:=False;
if fConnected then
  if fOperationMode=OMD_PROFILE_VELOCITY_MODE then
  begin
    VCS_MoveWithVelocity(fKeyHandle, fNodeId, TargetVelocity, ErrorCode);
    if Err(ErrorCode) then
    Result:=True;
  end;

end;

function TDCMotor.Open: Boolean;
var
    DeviceName, ProtocolStackName, InterfaceName : PAnsiChar;
    ErrorCode: Longword;

begin
   DeviceName:=PAnsiChar('EPOS2');
   ProtocolStackName:=PAnsiChar('MAXON SERIAL V2');
   interfaceName:=PAnsiChar('USB');

  if string(fPortName)<>'' then
  fKeyHandle:=VCS_OpenDevice(DeviceName, ProtocolStackName, InterfaceName, fPortName, ErrorCode);

  if Err(ErrorCode) and (fKeyHandle>0) then begin
    fConnected:=True;
    Log('Connected');
    Result:=True;
    fTimer.Enabled:=True;

    end  else  begin
    fConnected:=False;
    Result:=False;
    end;

end;

function TDCMotor.OperationModeToText(opMode: ShortInt): String;
begin
if opMode= OMD_PROFILE_POSITION_MODE  then Result:='Profile Position Mode'
else if opMode= OMD_PROFILE_VELOCITY_MODE  then Result:='Profile Velocity Mode'
else if opMode= OMD_HOMING_MODE            then Result:='Homing Mode'
else if opMode= OMD_INTERPOLATED_POSITION_MODE then Result:='Interpolated Position Mode'
else if opMode= OMD_POSITION_MODE           then Result:='Position Mode'
else if opMode= OMD_VELOCITY_MODE           then Result:='Velocity Mode'
else if opMode= OMD_CURRENT_MODE            then Result:='Current Mode'
else if opMode= OMD_MASTER_ENCODER_MODE     then Result:='Master Encoder Mode'
else if opMode= OMD_STEP_DIRECTION_MODE     then Result:='Step Direction Mode'
else Result:='Unknow Mode';
end;

procedure TDCMotor.ResetDevice;
var ErrorCode: Longword;
begin

     if(VCS_ResetDevice(fKeyHandle,fNodeId,ErrorCode)=false) then
       begin
          fTimer.Enabled := false;
          Application.MessageBox('Communication Error!','Error',mb_OK);
     end
end;

procedure TDCMotor.SetDisable;
var ErrorCode: Longword;
begin

     if(VCS_SetDisableState(fKeyHandle,fNodeId,ErrorCode)=false) then
       begin
          fTimer.Enabled := false;
//!!!!!?          Application.MessageBox('Communication Error!','Error',mb_OK);
     end
end;

procedure TDCMotor.SetEnable;
var
     oFault : LongBool;
     ErrorCode: Longword;
begin
     oFault := false;

     if(VCS_GetFaultState(fKeyHandle,fNodeId,oFault,ErrorCode)=false) then
     begin
     	Err(ErrorCode);
     	exit
     end;

     if(oFault=true) then
     begin
     	if(VCS_ClearFault(fKeyHandle, fNodeId, ErrorCode)=false) then
     	begin
     		Err(ErrorCode);
     		exit
     	end
     end;

     if(VCS_SetEnableState(fKeyHandle,fNodeId,ErrorCode)=false) then
     begin
     	Err(ErrorCode);
     end;
end;

function TDCMotor.SetHomingParameter: Boolean;
var
    ErrorCode: Longword;
begin
 Result:=False;
if fConnected then
  with HomingParams do
  VCS_SetHomingParameter(fKeyHandle, fNodeId, HomingAcceleration, SpeedSwitch, SpeedIndex, HomeOffset, CurrentThreshold, HomePosition, ErrorCode );
    Result:= Err(ErrorCode);

end;



function TDCMotor.SetPositionProfile: Boolean;
var
    ErrorCode: Longword;
begin
 Result:=False;
if fConnected then
  with PositionProfileParams do
  VCS_SetPositionProfile(fKeyHandle, fNodeId, ProfileVelocity, ProfileAcceleration, ProfileDeceleration, ErrorCode );
    Result:= Err(ErrorCode);

end;

procedure TDCMotor.SetQuickStop;
var ErrorCode: Longword;
begin

     if(VCS_SetQuickStopState(fKeyHandle,fNodeId,ErrorCode)=false) then
       begin
          fTimer.Enabled := false;
          Application.MessageBox('Communication Error!','Error',mb_OK);
     end
end;

procedure TDCMotor.SetState(const Value: Word);
var
    ErrorCode: Longword;
    State:Word;
begin
 VCS_SetState(fKeyHandle, fNodeId, Value, ErrorCode) ;
 Err(ErrorCode);

end;

function TDCMotor.SetVelocityProfile: Boolean;
var
    ErrorCode: Longword;
begin
 Result:=False;
if fConnected then
  with VelocityProfileParams do
  VCS_SetVelocityProfile(fKeyHandle, fNodeId, ProfileAcceleration, ProfileDeceleration, ErrorCode );
    Result:= Err(ErrorCode);

end;

function TDCMotor.ShowErrorInformation(dErrorCode: longword): boolean;
const
     Size : WORD = 100;
var
     pStrErrorInfo: PAnsiChar;
     pWideStrErrorInfo: PWideChar;

begin
     GetMem(pStrErrorInfo, Size);
     pWideStrErrorInfo := WideStrAlloc(Size);

     if(VCS_GetErrorInfo(dErrorCode, pStrErrorInfo, Size))then
       begin
          StrPCopy(pWideStrErrorInfo, pStrErrorInfo);
          Log('Err:'+pWideStrErrorInfo);
          FreeMem(pStrErrorInfo,Size);
          result := True;
       end
     else
       begin
          Log('Error information can not be read!');
          FreeMem(pStrErrorInfo,Size);
          result := False;
       end;
end;
procedure TDCMotor.StopHome;
var
    ErrorCode: Longword;
begin
if fConnected then
  if fOperationMode=OMD_HOMING_MODE then
  begin
    VCS_StopHoming(fKeyHandle, fNodeId, ErrorCode);
    Err(ErrorCode);
  end;
end;

function TDCMotor.WaitForHomingAttained(Timeout: Integer): Boolean;
var
    ErrorCode: Longword;
begin
Result:= False;
if fConnected then
  if fOperationMode=OMD_HOMING_MODE then
  begin
    Result:= VCS_WaitForHomingAttained(fKeyHandle, fNodeId, Timeout, ErrorCode);
    Err(ErrorCode);
  end;

end;

function TDCMotor.WaitForTargetReached(Timeout: integer): Boolean;
var
    ErrorCode: Longword;
begin
Result:= False;
if fConnected then
  begin
    Result:= VCS_WaitForTargetReached(fKeyHandle, fNodeId, Timeout, ErrorCode);
    Err(ErrorCode);
  end;

end;

end.
