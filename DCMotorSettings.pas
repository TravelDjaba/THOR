unit DCMotorSettings;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, sPageControl, devDCMotor,
  Vcl.StdCtrls, sGroupBox, sButton, sEdit, sLabel, sComboBox, Vcl.Buttons,
  sBitBtn, Vcl.ExtCtrls, sPanel, sTabControl;

type
  TFormDCMotorSettings = class(TForm)
    pcSettings: TsPageControl;
    tsHoming: TsTabSheet;
    tsProfilePosition: TsTabSheet;
    tsProfileVelocity: TsTabSheet;
    gbHomeProfile: TsGroupBox;
    gbParameters: TsGroupBox;
    gbActualValues: TsGroupBox;
    cboxHomingMode: TsComboBox;
    edtHomeOffset: TsEdit;
    edtSpeedforSwitchSearch: TsEdit;
    edtSpeedforIndexSearch: TsEdit;
    edtAcceleration: TsEdit;
    edtCurrentTreshold: TsEdit;
    edtHomePosition: TsEdit;
    sLabel1: TsLabel;
    sLabel2: TsLabel;
    sLabel3: TsLabel;
    sLabel4: TsLabel;
    sLabel5: TsLabel;
    sLabel6: TsLabel;
    edtMaxProfileVelocity: TsEdit;
    edtMaxFollowingError: TsEdit;
    edtQuickStopDeceleration: TsEdit;
    sLabel7: TsLabel;
    sLabel8: TsLabel;
    sLabel9: TsLabel;
    edtPositionActualValue: TsEdit;
    sLabel10: TsLabel;
    edtPositionDemandValue: TsEdit;
    sLabel11: TsLabel;
    gbOperationMode: TsGroupBox;
    edtActiveOperationMode: TsEdit;
    btnActivateOperationMode: TsButton;
    btnEnable: TsBitBtn;
    btnStopHoming: TsBitBtn;
    btnStartHoming: TsBitBtn;
    btnHalt: TsBitBtn;
    gbProfilePos: TsGroupBox;
    sLabel12: TsLabel;
    sLabel14: TsLabel;
    sLabel15: TsLabel;
    cboxProfileTypePos: TsComboBox;
    edtTargetPositionPos: TsEdit;
    edtProfileVelocityPos: TsEdit;
    edtDecelerationPos: TsEdit;
    gbParametersPos: TsGroupBox;
    sLabel18: TsLabel;
    sLabel19: TsLabel;
    sLabel20: TsLabel;
    edtMaxProfileVelocityPos: TsEdit;
    edtMaxFollowingErrorPos: TsEdit;
    edtQuickStopDecelerationPos: TsEdit;
    gbActualValuesPos: TsGroupBox;
    sLabel21: TsLabel;
    sLabel22: TsLabel;
    edtPositionActualValuePos: TsEdit;
    edtPositionDemandValuePos: TsEdit;
    edtAccelerationPos: TsEdit;
    sLabel13: TsLabel;
    btnMoveAbsolute: TsBitBtn;
    btnMoveRelative: TsBitBtn;
    gbProfileVel: TsGroupBox;
    sLabel16: TsLabel;
    sLabel23: TsLabel;
    sLabel24: TsLabel;
    cboxProfileTypeVel: TsComboBox;
    edtTargetVelocity: TsEdit;
    edtDecelerationVel: TsEdit;
    edtAccelerationVel: TsEdit;
    gbParametersVel: TsGroupBox;
    sLabel25: TsLabel;
    sLabel26: TsLabel;
    edtMaxProfileVelocityVel: TsEdit;
    edtQuickStopDecelerationVel: TsEdit;
    gbActualValuesVel: TsGroupBox;
    sLabel28: TsLabel;
    sLabel29: TsLabel;
    edtVelocityActualValueAVG: TsEdit;
    edtVelocityDemandValue: TsEdit;
    btnSetVelocity: TsBitBtn;
    Timer1: TTimer;
    btnResetDevice: TsBitBtn;
    btnClearFault: TsBitBtn;
    gbState: TsGroupBox;
    lblState: TsLabel;
    procedure FormShow(Sender: TObject);
    procedure btnClearFaultClick(Sender: TObject);
    procedure btnResetDeviceClick(Sender: TObject);
    procedure pcSettingsChange(Sender: TObject);
    procedure btnActivateOperationModeClick(Sender: TObject);
    procedure btnSetVelocityClick(Sender: TObject);
    procedure btnHaltClick(Sender: TObject);
    procedure btnEnableClick(Sender: TObject);
    procedure btnMoveAbsoluteClick(Sender: TObject);
    procedure btnMoveRelativeClick(Sender: TObject);
    procedure btnStartHomingClick(Sender: TObject);
    procedure btnStopHomingClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormHide(Sender: TObject);
  private
    { Private declarations }
    procedure UpdateHomingParamsControls;
    procedure UpdateProfilePositionParamsControls;
    procedure UpdateProfileVelocityParamsControls;

    procedure UpdateState;
  public
    { Public declarations }
    DCMotor:TDCMotor;
  end;

var
  FormDCMotorSettings: TFormDCMotorSettings;

implementation

uses
  MaxonDefinitions, Main ;

{$R *.dfm}

procedure TFormDCMotorSettings.btnActivateOperationModeClick(Sender: TObject);
begin
if pcSettings.ActivePage=tsHoming then
     DCMotor.ActivateHomingMode
else
if pcSettings.ActivePage=tsProfilePosition then
     DCMotor.ActivatePositionProfileMode
else  if pcSettings.ActivePage=tsProfileVelocity then
     DCMotor.ActivateVelocityProfileMode;

pcSettings.OnChange(Self);
end;

procedure TFormDCMotorSettings.btnClearFaultClick(Sender: TObject);
begin
DCMotor.ClearFault;
end;

procedure TFormDCMotorSettings.btnEnableClick(Sender: TObject);
begin
if DCMotor.State <> ST_ENABLED then
   DCMotor.State := ST_ENABLED
else
if DCMotor.State <> ST_DISABLED then
   DCMotor.State := ST_DISABLED;

if DCMotor.State = ST_ENABLED then
   btnEnable.Caption:='Enabled'
else
   btnEnable.Caption:='Disabled';

end;

procedure TFormDCMotorSettings.btnHaltClick(Sender: TObject);
begin
if pcSettings.ActivePage=tsHoming then
     DCMotor.HaltVelocityMovement
else if pcSettings.ActivePage=tsProfilePosition then
     DCMotor.HaltPositionMovement
else  if pcSettings.ActivePage=tsProfileVelocity then
     DCMotor.HaltVelocityMovement;
end;

procedure TFormDCMotorSettings.btnMoveAbsoluteClick(Sender: TObject);
begin
DCMotor.PositionProfileParams.ProfileVelocity := StrToIntDef(edtProfileVelocityPos.Text, 0);
DCMotor.PositionProfileParams.ProfileAcceleration := StrToIntDef(edtAccelerationPos.Text, 0);
DCMotor.PositionProfileParams.ProfileDeceleration := StrToIntDef(edtDecelerationPos.Text, 0);

DCMotor.SetPositionProfile;
DCMotor.MoveToPosition(StrToIntDef(edtTargetPositionPos.Text, 0), True, True);
end;

procedure TFormDCMotorSettings.btnMoveRelativeClick(Sender: TObject);
begin
DCMotor.PositionProfileParams.ProfileVelocity := StrToIntDef(edtProfileVelocityPos.Text, 0);
DCMotor.PositionProfileParams.ProfileAcceleration := StrToIntDef(edtAccelerationPos.Text, 0);
DCMotor.PositionProfileParams.ProfileDeceleration := StrToIntDef(edtDecelerationPos.Text, 0);

DCMotor.SetPositionProfile;
DCMotor.MoveToPosition(StrToIntDef(edtTargetPositionPos.Text, 0), False, True);
end;

procedure TFormDCMotorSettings.btnResetDeviceClick(Sender: TObject);
begin
DCMotor.ResetDevice;
DCMotor.CloseAllDevices;
if DCMotor.Find then
    if DCMotor.Open then
        begin
        DCMotor.InitMotor;
        end;
end;

procedure TFormDCMotorSettings.btnSetVelocityClick(Sender: TObject);
begin
DCMotor.VelocityProfileParams.ProfileAcceleration := StrToIntDef(edtAccelerationVel.Text, 0);
DCMotor.VelocityProfileParams.ProfileDeceleration := StrToIntDef(edtDecelerationVel.Text, 0);

DCMotor.SetVelocityProfile;
DCMotor.MoveWithVelocity(StrToIntDef(edtTargetVelocity.Text, 0 ) );

end;

procedure TFormDCMotorSettings.btnStartHomingClick(Sender: TObject);
begin
DCMotor.HomingParams.HomingAcceleration := StrToIntDef(edtAcceleration.Text, 0);
DCMotor.HomingParams.SpeedSwitch := StrToIntDef(edtSpeedforSwitchSearch.Text, 0);
DCMotor.HomingParams.SpeedIndex := StrToIntDef(edtSpeedforIndexSearch.Text, 0);
DCMotor.HomingParams.HomeOffset := StrToIntDef(edtHomeOffset.Text, 0);
DCMotor.HomingParams.CurrentThreshold := StrToIntDef(edtCurrentTreshold.Text, 0);
DCMotor.HomingParams.HomePosition := StrToIntDef(edtHomePosition.Text, 0);

DCMotor.SetHomingParameter;
DCMotor.FindHome(DCMotor.IdxToHomingMethod(cboxHomingMode.ItemIndex));
end;

procedure TFormDCMotorSettings.btnStopHomingClick(Sender: TObject);
begin
DCMotor.StopHome;
end;

procedure TFormDCMotorSettings.FormHide(Sender: TObject);
begin
Timer1.Enabled:=False;
end;

procedure TFormDCMotorSettings.FormShow(Sender: TObject);
begin
DCMotor:=FormMain.DCMotor;
cboxHomingMode.ItemIndex:=1;
pcSettings.OnChange(self);
Timer1.Enabled:=True;

end;

procedure TFormDCMotorSettings.pcSettingsChange(Sender: TObject);
begin
if DCMotor.GetOperationMode then
 edtActiveOperationMode.Text:=DCMotor.OperationModeToText(DCMotor.OperationMode);

UpdateState;


 if pcSettings.ActivePage=tsHoming then
    begin
    btnActivateOperationMode.Caption:='Activate Homing Mode';
    if DCMotor.OperationMode=OMD_HOMING_MODE then
        begin
        btnActivateOperationMode.Enabled:=False;
        gbHomeProfile.Enabled:=True;
        gbParameters.Enabled:=True;
        btnStartHoming.Enabled:=True;
        btnStopHoming.Enabled:=True;

        if DCMotor.GetHomingParameter then
           UpdateHomingParamsControls;

        end else begin
        btnActivateOperationMode.Enabled:=True;
        gbHomeProfile.Enabled:=False;
        gbParameters.Enabled:=False;
        btnStartHoming.Enabled:=False;
        btnStopHoming.Enabled:=False;
        end;
    end
  else
 if pcSettings.ActivePage=tsProfilePosition then
    begin
    btnActivateOperationMode.Caption:='Activate Profile Position Mode';
    if DCMotor.OperationMode=OMD_PROFILE_POSITION_MODE then
        begin
        btnActivateOperationMode.Enabled:=False;
        gbProfilePos.Enabled:=True;
        gbParametersPos.Enabled:=True;
        btnMoveAbsolute.Enabled:=True;
        btnMoveRelative.Enabled:=True;

        if DCMotor.GetPositionProfile then
         begin
           DCMotor.GetTargetPosition;
           UpdateProfilePositionParamsControls;
         end;
        end else begin
        btnActivateOperationMode.Enabled:=True;
        gbProfilePos.Enabled:=False;
        gbParametersPos.Enabled:=False;
        btnMoveAbsolute.Enabled:=False;
        btnMoveRelative.Enabled:=False;
        end;
    end
  else
 if pcSettings.ActivePage=tsProfileVelocity then
    begin
    btnActivateOperationMode.Caption:='Activate Profile Velocity Mode';
    if DCMotor.OperationMode=OMD_PROFILE_VELOCITY_MODE then
        begin
        btnActivateOperationMode.Enabled:=False;
        gbProfileVel.Enabled:=True;
        gbParametersVel.Enabled:=True;
        btnSetVelocity.Enabled:=True;

        if DCMotor.GetVelocityProfile then
           begin
           DCMotor.GetTargetVelocity;
           UpdateProfileVelocityParamsControls;
           end;

        end else begin
        btnActivateOperationMode.Enabled:=True;
        gbProfileVel.Enabled:=False;
        gbParametersVel.Enabled:=False;
        btnSetVelocity.Enabled:=False;
        end;
    end;




end;

procedure TFormDCMotorSettings.Timer1Timer(Sender: TObject);
begin
if DCMotor<>nil then
if DCMotor.Connected then
   begin
   UpdateState;
    if DCMotor.State =ST_ENABLED then
    begin
  //  if not DCMotor.ReachTarget then
         begin
               if pcSettings.ActivePage=tsHoming then
                 begin
                  DCMotor.GetPositionIs;
                  DCMotor.GetTargetPosition;
                  edtPositionActualValue.Text:= DCMotor.PositionIs.ToString;
                  edtPositionDemandValue.Text:= DCMotor.TargetPosition.ToString;
                 end
              else
              if pcSettings.ActivePage=tsProfilePosition then
                 begin
                  DCMotor.GetPositionIs;
                  DCMotor.GetTargetPosition;
                  edtPositionActualValuePos.Text:= DCMotor.PositionIs.ToString;
                  edtPositionDemandValuePos.Text:= DCMotor.TargetPosition.ToString;
                 end
              else  if pcSettings.ActivePage=tsProfileVelocity then
                 begin
                  DCMotor.GetVelocityIsAvg;
                  DCMotor.GetTargetVelocity;
                  edtVelocityActualValueAVG.Text:= DCMotor.VelocityIsAvg.ToString;
                  edtVelocityDemandValue.Text:= DCMotor.TargetVelocity.ToString;
                 end;
         end;

    end;
  end;
end;

procedure TFormDCMotorSettings.UpdateHomingParamsControls;
begin
edtHomeOffset.Text:=DCMotor.HomingParams.HomeOffset.ToString;
edtSpeedforSwitchSearch.Text:= DCMotor.HomingParams.SpeedSwitch.ToString;
edtSpeedforIndexSearch.Text:= DCMotor.HomingParams.SpeedIndex.ToString;
edtAcceleration.Text:= DCMotor.HomingParams.HomingAcceleration.ToString;
edtCurrentTreshold.Text:= DCMotor.HomingParams.CurrentThreshold.ToString;
edtHomePosition.Text:= DCMotor.HomingParams.HomePosition.ToString;
end;

procedure TFormDCMotorSettings.UpdateProfilePositionParamsControls;
begin
edtTargetPositionPos.Text:=DCMotor.TargetPosition.ToString;
edtProfileVelocityPos.Text:=DCMotor.PositionProfileParams.ProfileVelocity.ToString;
edtAccelerationPos.Text:=DCMotor.PositionProfileParams.ProfileAcceleration.ToString;
edtDecelerationPos.Text:=DCMotor.PositionProfileParams.ProfileDeceleration.ToString;
end;

procedure TFormDCMotorSettings.UpdateProfileVelocityParamsControls;
begin
edtTargetVelocity.Text:=DCMotor.TargetVelocity.ToString;
edtAccelerationVel.Text:=DCMotor.VelocityProfileParams.ProfileAcceleration.ToString;
edtDecelerationVel.Text:=DCMotor.VelocityProfileParams.ProfileDeceleration.ToString;
end;

procedure TFormDCMotorSettings.UpdateState;
begin
 {States}
//    ST_DISABLED
//    ST_ENABLED
//    ST_QUICKSTOP
//    ST_FAULT


if DCMotor.State=ST_ENABLED then
   begin
    lblState.Caption:='Enabled';
    btnEnable.Caption:='Enabled';
    btnEnable.Down:=True;
   end else
if DCMotor.State=ST_DISABLED then
   begin
    lblState.Caption:='Disabled';
    btnEnable.Caption:='Disabled';
    btnEnable.Down:=False;
   end else
if DCMotor.State=ST_QUICKSTOP then
   begin
    lblState.Caption:='QuickStop';
    btnEnable.Caption:='Disabled';
    btnEnable.Down:=False;
   end else
if DCMotor.State=ST_FAULT then
   begin
    lblState.Caption:='Fault';
    btnEnable.Caption:='Disabled';
    btnEnable.Down:=False;
   end;
end;

end.
