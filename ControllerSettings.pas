unit ControllerSettings;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, sEdit, sGroupBox,
  Vcl.Buttons, sSpeedButton, sComboBox,
  Log, {devController,}  System.Threading, System.SyncObjs, Vcl.ExtCtrls, sPanel,
  Vcl.Grids, sSpinEdit, sCheckBox, sButton, devControllerM;

type
  TFormControllerSettings = class(TForm)
    TimerES: TTimer;
    sGroupBox4: TsGroupBox;
    sgFilters: TStringGrid;
    gbSlit: TsGroupBox;
    edtSlitProportion: TsDecimalSpinEdit;
    sGroupBox3: TsGroupBox;
    btnError: TsSpeedButton;
    btnReset: TsSpeedButton;
    btnSend: TsSpeedButton;
    cboxStepper: TsComboBox;
    gb: TsGroupBox;
    btnStop: TsSpeedButton;
    btnCal1: TsSpeedButton;
    btnCal2: TsSpeedButton;
    btnES: TsSpeedButton;
    btnSetCurrent: TsSpeedButton;
    btnSetSpeed: TsSpeedButton;
    btnSetMaxSpeed: TsSpeedButton;
    btnSetAcceleration: TsSpeedButton;
    btnUpdate: TsSpeedButton;
    cboxStepMode: TsComboBox;
    edtCurrent: TsEdit;
    cboxEndStopType: TsComboBox;
    edtSpeed: TsEdit;
    edtMaxSpeed: TsEdit;
    edtAcceleration: TsEdit;
    sGroupBox1: TsGroupBox;
    btnGetPos: TsSpeedButton;
    btnStepperRigth: TsSpeedButton;
    btnStepperLeft: TsSpeedButton;
    btnMovAbs: TsSpeedButton;
    btnSetPosition: TsSpeedButton;
    edtPosition: TsEdit;
    cboxStep: TsComboBox;
    edtMovAbs: TsEdit;
    sGroupBox2: TsGroupBox;
    btnEncGetPos: TsSpeedButton;
    btnEncRigth: TsSpeedButton;
    btnEncLeft: TsSpeedButton;
    btnEncMovAbs: TsSpeedButton;
    btnEncSetPosition: TsSpeedButton;
    edtEncPosition: TsEdit;
    cboxEncStep: TsComboBox;
    edtEncMovAbs: TsEdit;
    pnlES1: TsPanel;
    pnlES2: TsPanel;
    edtCmd: TsEdit;
    pnlXYZaddSettings: TsPanel;
    edtLimit1: TsEdit;
    edtLimit2: TsEdit;
    btnLim1Set: TsSpeedButton;
    btnLim1Get: TsSpeedButton;
    btnLim2Set: TsSpeedButton;
    btnLim2Get: TsSpeedButton;
    cbReverse: TsCheckBox;
    cbCanUseLastPos: TsCheckBox;
    btnReconnect: TsButton;
    procedure FormCreate(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure cboxStepperChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnErrorClick(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
    procedure cboxStepModeChange(Sender: TObject);
    procedure edtCurrentExit(Sender: TObject);
    procedure edtCurrentKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSetCurrentClick(Sender: TObject);
    procedure cboxEndStopTypeChange(Sender: TObject);
    procedure edtSpeedExit(Sender: TObject);
    procedure edtSpeedKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSetSpeedClick(Sender: TObject);
    procedure edtMaxSpeedExit(Sender: TObject);
    procedure edtMaxSpeedKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSetMaxSpeedClick(Sender: TObject);
    procedure edtAccelerationExit(Sender: TObject);
    procedure edtAccelerationKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSetAccelerationClick(Sender: TObject);
    procedure edtPositionExit(Sender: TObject);
    procedure edtPositionKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSetPositionClick(Sender: TObject);
    procedure btnGetPosClick(Sender: TObject);
    procedure btnStepperLeftClick(Sender: TObject);
    procedure btnStepperRigthClick(Sender: TObject);
    procedure edtMovAbsExit(Sender: TObject);
    procedure edtMovAbsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnMovAbsClick(Sender: TObject);
    procedure edtEncPositionExit(Sender: TObject);
    procedure edtEncPositionKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnEncSetPositionClick(Sender: TObject);
    procedure btnEncGetPosClick(Sender: TObject);


    procedure edtEncMovAbsExit(Sender: TObject);
    procedure edtEncMovAbsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

    procedure btnCal1Click(Sender: TObject);
    procedure btnCal2Click(Sender: TObject);
    procedure btnESClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure edtCmdKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnSendClick(Sender: TObject);
    procedure sgFiltersSetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: string);
    procedure sgFiltersRowMoved(Sender: TObject; FromIndex, ToIndex: Integer);
    procedure edtSlitProportionChange(Sender: TObject);
    procedure edtLimit1Exit(Sender: TObject);
    procedure edtLimit2Exit(Sender: TObject);
    procedure edtLimit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtLimit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnLim1SetClick(Sender: TObject);
    procedure btnLim2SetClick(Sender: TObject);
    procedure btnLim1GetClick(Sender: TObject);
    procedure btnLim2GetClick(Sender: TObject);
    procedure cbReverseClick(Sender: TObject);
    procedure btnReconnectClick(Sender: TObject);
  private
    { Private declarations }
    Controller:TControllerM;
    MotArray:array[0..6] of TMotor;

    procedure UpdateMotoInfo(idx:integer);
    procedure UpdateFWGrid;
    procedure UpdateSlitData;
  public
    { Public declarations }
    procedure UpdateMotoPosition(idx:integer);
    procedure BlinkES(idx:integer);
  end;

var
  FormControllerSettings: TFormControllerSettings;
  canChangeFWgrid:Boolean=True;

implementation

{$R *.dfm}
uses Main;

{ TFormControllerSettings }

procedure TFormControllerSettings.BlinkES(idx: integer);
begin
TTask.Run(procedure
     var i:Integer;
     begin
     for i:=0 to 2 do
         begin
          if idx=1 then pnlES1.Color:=clRed else pnlES2.Color:=clRed;
         sleep(200);
           if idx=1 then pnlES1.Color:=clMenuText else pnlES2.Color:=clMenuText;
         sleep(200);
         end;
     end);
end;

procedure TFormControllerSettings.btnCal1Click(Sender: TObject);
begin

TTask.Run(procedure()
          begin
          (MotArray[cboxStepper.ItemIndex] as TMotor).FCritSection.Acquire;
          (MotArray[cboxStepper.ItemIndex] as TMotor).Cal1;
          (MotArray[cboxStepper.ItemIndex] as TMotor).FCritSection.Release;
          end);
end;

procedure TFormControllerSettings.btnCal2Click(Sender: TObject);
begin
TTask.Run(procedure()
          begin
          (MotArray[cboxStepper.ItemIndex] as TMotor).FCritSection.Acquire;
          (MotArray[cboxStepper.ItemIndex] as TMotor).Cal2;
          (MotArray[cboxStepper.ItemIndex] as TMotor).FCritSection.Release;
          end);
end;

procedure TFormControllerSettings.btnEncGetPosClick(Sender: TObject);
begin
TTask.Run(procedure()
          var encpos:Integer;
          begin
          (MotArray[cboxStepper.ItemIndex] as TMotor).FCritSection.Acquire;
          encpos:=(MotArray[cboxStepper.ItemIndex] as TMotor).EncPosition;
          canChange:=False;
          edtEncPosition.Text:=encpos.ToString;
          canChange:=True;
          (MotArray[cboxStepper.ItemIndex] as TMotor).FCritSection.Release;
          end);

end;


procedure TFormControllerSettings.btnEncSetPositionClick(Sender: TObject);
begin
TTask.Run(procedure()
          begin
          (MotArray[cboxStepper.ItemIndex] as TMotor).FCritSection.Acquire;
          (MotArray[cboxStepper.ItemIndex] as TMotor).EncPosition:=StrToIntDef(edtEncPosition.Text,0) ;
          (MotArray[cboxStepper.ItemIndex] as TMotor).FCritSection.Release;
          end);
end;

procedure TFormControllerSettings.btnErrorClick(Sender: TObject);
begin
TTask.Run(procedure()
          begin
          (MotArray[cboxStepper.ItemIndex] as TMotor).FCritSection.Acquire;
          (MotArray[cboxStepper.ItemIndex] as TMotor).ShowError;
          (MotArray[cboxStepper.ItemIndex] as TMotor).FCritSection.Release;
          end);
end;

procedure TFormControllerSettings.btnESClick(Sender: TObject);
begin
TTask.Run(procedure()
          begin
          (MotArray[cboxStepper.ItemIndex] as TMotor).FCritSection.Acquire;
          (MotArray[cboxStepper.ItemIndex] as TMotor).ShowEndStop;
          (MotArray[cboxStepper.ItemIndex] as TMotor).FCritSection.Release;
          end);
end;

procedure TFormControllerSettings.btnGetPosClick(Sender: TObject);
begin
TTask.Run(procedure()
          var pos:Integer;
          begin
          (MotArray[cboxStepper.ItemIndex] as TMotor).FCritSection.Acquire;
          pos:=(MotArray[cboxStepper.ItemIndex] as TMotor).Position;
          canChange:=False;
          edtPosition.Text:=pos.ToString;
          canChange:=True;
          (MotArray[cboxStepper.ItemIndex] as TMotor).FCritSection.Release;
          end);
end;

procedure TFormControllerSettings.btnLim1GetClick(Sender: TObject);
begin
TTask.Run(procedure()
          var lim:Integer;
          begin
          (MotArray[cboxStepper.ItemIndex] as TMotor).FCritSection.Acquire;
          lim:=(MotArray[cboxStepper.ItemIndex] as TMotor).Limit1;
          canChange:=False;
          edtLimit1.Text:=lim.ToString;
          canChange:=True;
          (MotArray[cboxStepper.ItemIndex] as TMotor).FCritSection.Release;
          end);
end;

procedure TFormControllerSettings.btnLim1SetClick(Sender: TObject);
begin
TTask.Run(procedure()
          begin
          (MotArray[cboxStepper.ItemIndex] as TMotor).FCritSection.Acquire;
          (MotArray[cboxStepper.ItemIndex] as TMotor).Limit1:=StrToIntDef(edtLimit1.Text,0) ;
          (MotArray[cboxStepper.ItemIndex] as TMotor).FCritSection.Release;
          end);
end;

procedure TFormControllerSettings.btnLim2GetClick(Sender: TObject);
begin
TTask.Run(procedure()
          var lim:Integer;
          begin
          MotArray[cboxStepper.ItemIndex].FCritSection.Acquire;
          lim:=MotArray[cboxStepper.ItemIndex].Limit2;
          canChange:=False;
          edtLimit2.Text:=lim.ToString;
          canChange:=True;
          MotArray[cboxStepper.ItemIndex].FCritSection.Release;
          end);
end;

procedure TFormControllerSettings.btnLim2SetClick(Sender: TObject);
begin
TTask.Run(procedure()
          begin
          MotArray[cboxStepper.ItemIndex].FCritSection.Acquire;
          MotArray[cboxStepper.ItemIndex].Limit2:=StrToIntDef(edtLimit2.Text,0) ;
          MotArray[cboxStepper.ItemIndex].FCritSection.Release;
          end);
end;

procedure TFormControllerSettings.btnMovAbsClick(Sender: TObject);
var tmp:Integer;
begin

try
tmp:=StrToInt(edtMovAbs.Text);

TTask.Run(procedure()
          begin
          MotArray[cboxStepper.ItemIndex].FCritSection.Acquire;
          MotArray[cboxStepper.ItemIndex].MovAbs(tmp);
          MotArray[cboxStepper.ItemIndex].FCritSection.Release;
          end);
except
//Log('Position value incorrect!');
end;

end;

procedure TFormControllerSettings.btnReconnectClick(Sender: TObject);
begin
//TTask.Run(procedure
//          begin
//          Controller.CloseController;
//
//          if Controller.FindController then
//           begin
//           Controller.InitParams;
//           formMain.InitControllerControls;
//           end;
//          end);
end;

procedure TFormControllerSettings.btnResetClick(Sender: TObject);
begin
TTask.Run(procedure()
          begin
          MotArray[cboxStepper.ItemIndex].FCritSection.Acquire;
          MotArray[cboxStepper.ItemIndex].ResetDriver;
          MotArray[cboxStepper.ItemIndex].FCritSection.Release;
          end);
end;

procedure TFormControllerSettings.btnSendClick(Sender: TObject);
begin
Controller.SendCmdToConsole(edtCmd.Text);
end;

procedure TFormControllerSettings.btnSetAccelerationClick(Sender: TObject);
var tmp:Integer;
begin

try
tmp:=StrToInt(edtAcceleration.Text);

TTask.Run(procedure()
          begin
          MotArray[cboxStepper.ItemIndex].FCritSection.Acquire;
          MotArray[cboxStepper.ItemIndex].Acceleration:=tmp;
          MotArray[cboxStepper.ItemIndex].FCritSection.Release;
          end);
except
//Log('Acc value incorrect!');
end;
end;

procedure TFormControllerSettings.btnSetCurrentClick(Sender: TObject);
var tmp:Integer;
begin

try
tmp:=StrToInt(edtCurrent.Text);

TTask.Run(procedure()
          begin
          MotArray[cboxStepper.ItemIndex].FCritSection.Acquire;
          MotArray[cboxStepper.ItemIndex].Current:=tmp;
          MotArray[cboxStepper.ItemIndex].FCritSection.Release;
          end);
except
//Log('Cur value incorrect!');
end;

end;

procedure TFormControllerSettings.btnSetMaxSpeedClick(Sender: TObject);
var tmp:Integer;
begin

try
tmp:=StrToInt(edtMaxSpeed.Text);

TTask.Run(procedure()
          begin
          MotArray[cboxStepper.ItemIndex].FCritSection.Acquire;
          MotArray[cboxStepper.ItemIndex].MaxSpeed:=tmp;
          MotArray[cboxStepper.ItemIndex].FCritSection.Release;
          end);
except
//Log('MaxSpeed value incorrect!');
end;

end;

procedure TFormControllerSettings.btnSetPositionClick(Sender: TObject);
var tmp:Integer;
begin

try
tmp:=StrToInt(edtPosition.Text);

TTask.Run(procedure()
          begin
          MotArray[cboxStepper.ItemIndex].FCritSection.Acquire;
          MotArray[cboxStepper.ItemIndex].Position:=tmp;
          MotArray[cboxStepper.ItemIndex].FCritSection.Release;
          end);
except
//Log('Position value incorrect!');
end;

end;

procedure TFormControllerSettings.btnSetSpeedClick(Sender: TObject);
var tmp:Integer;
begin

try
tmp:=StrToInt(edtSpeed.Text);

TTask.Run(procedure()
          begin
          MotArray[cboxStepper.ItemIndex].FCritSection.Acquire;
          MotArray[cboxStepper.ItemIndex].Speed:=tmp;
          MotArray[cboxStepper.ItemIndex].FCritSection.Release;
          end);
except
//Log('Speed value incorrect!');
end;

end;

procedure TFormControllerSettings.btnStepperLeftClick(Sender: TObject);
var tmp:Integer;
begin

try
tmp:=StrToInt(cboxStep.Text);

TTask.Run(procedure()
          begin
          MotArray[cboxStepper.ItemIndex].FCritSection.Acquire;
          MotArray[cboxStepper.ItemIndex].MovRel(-tmp);
          MotArray[cboxStepper.ItemIndex].FCritSection.Release;
          end);
except
//Log('Step value incorrect!');
end;

end;

procedure TFormControllerSettings.btnStepperRigthClick(Sender: TObject);
var tmp:Integer;
begin

try
tmp:=StrToInt(cboxStep.Text);

TTask.Run(procedure()
          begin
          MotArray[cboxStepper.ItemIndex].FCritSection.Acquire;
          MotArray[cboxStepper.ItemIndex].MovRel(tmp);
          MotArray[cboxStepper.ItemIndex].FCritSection.Release;
          end);
except
//Log('Step value incorrect!');
end;

end;

procedure TFormControllerSettings.btnStopClick(Sender: TObject);
begin
TTask.Run(procedure()
          begin
          MotArray[cboxStepper.ItemIndex].FCritSection.Acquire;
          MotArray[cboxStepper.ItemIndex].Stop;
          MotArray[cboxStepper.ItemIndex].FCritSection.Release;
          end);
end;

procedure TFormControllerSettings.btnUpdateClick(Sender: TObject);
begin
UpdateMotoInfo(cboxStepper.ItemIndex);
end;

procedure TFormControllerSettings.cboxEndStopTypeChange(Sender: TObject);
begin
if not canChange then Exit;
TTask.Run(procedure()
          begin
          MotArray[cboxStepper.ItemIndex].FCritSection.Acquire;
          MotArray[cboxStepper.ItemIndex].EndStopType:= cboxEndStopType.ItemIndex;
          MotArray[cboxStepper.ItemIndex].FCritSection.Release;
          end);

end;

procedure TFormControllerSettings.cboxStepModeChange(Sender: TObject);
begin
if not canChange then Exit;

TTask.Run( procedure
           var vI:Integer;
               s:string;
           begin
           case cboxStepMode.ItemIndex of
           0: vI:=1;
           1: vI:=2;
           2: vI:=4;
           3: vI:=8;
           4: vI:=16;
           5: vI:=32;
           end;
           MotArray[cboxStepper.ItemIndex].FCritSection.Acquire;
           MotArray[cboxStepper.ItemIndex].StepMode:=vI;
           MotArray[cboxStepper.ItemIndex].fCritSection.Release;
           end);
end;

procedure TFormControllerSettings.cboxStepperChange(Sender: TObject);
begin
UpdateMotoInfo(cboxStepper.ItemIndex);
if (cboxStepper.ItemIndex=0) or (cboxStepper.ItemIndex=1) or (cboxStepper.ItemIndex=2)  then pnlXYZaddSettings.Enabled:=true
   else pnlXYZaddSettings.Enabled:=false;
end;

procedure TFormControllerSettings.cbReverseClick(Sender: TObject);
begin
if canChange then
  TTask.Run( procedure
        begin
        MotArray[cboxStepper.ItemIndex].FCritSection.Acquire;
        MotArray[cboxStepper.ItemIndex].Reverse:= cbReverse.Checked;
        MotArray[cboxStepper.ItemIndex].fCritSection.Release;
        end);
end;

procedure TFormControllerSettings.edtAccelerationExit(Sender: TObject);
begin
  with Sender as TsEdit do begin
    try
      Text:=FloatToStr(StrToFloat(Text));
    except
      on E: EConvertError do ;
    end;
  end;
end;

procedure TFormControllerSettings.edtAccelerationKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key=13 then begin
    if Assigned((Sender as TsEdit).OnExit) then
      (Sender as TsEdit).OnExit(Sender);

    if Assigned(btnSetAcceleration.OnClick) then
      btnSetAcceleration.OnClick(Sender);
  end;
end;

procedure TFormControllerSettings.edtCmdKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key=13  then
  if Assigned(btnSend.OnClick) then
     btnSend.OnClick(Self);
end;

procedure TFormControllerSettings.edtCurrentExit(Sender: TObject);
begin
  with Sender as TsEdit do begin
    try
      Text:=IntToStr(StrToInt(Text));
    except
      on E: EConvertError do ;
    end;
  end;
end;
procedure TFormControllerSettings.edtCurrentKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key=13 then begin
    if Assigned((Sender as TsEdit).OnExit) then
      (Sender as TsEdit).OnExit(Sender);

    if Assigned(btnSetCurrent.OnClick) then
      btnSetCurrent.OnClick(Sender);
  end;
end;

procedure TFormControllerSettings.edtEncMovAbsExit(Sender: TObject);
begin
  with Sender as TsEdit do begin
    try
      Text:=IntToStr(StrToInt(Text));
    except
      on E: EConvertError do ;
    end;
  end;
end;

procedure TFormControllerSettings.edtEncMovAbsKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key=13 then begin
    if Assigned((Sender as TsEdit).OnExit) then
      (Sender as TsEdit).OnExit(Sender);

    if Assigned(btnEncMovAbs.OnClick) then
      btnEncMovAbs.OnClick(Sender);
  end;
end;

procedure TFormControllerSettings.edtEncPositionExit(Sender: TObject);
begin
  with Sender as TsEdit do begin
    try
      Text:=IntToStr(StrToInt(Text));
    except
      on E: EConvertError do ;
    end;
  end;
end;

procedure TFormControllerSettings.edtEncPositionKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key=13 then begin
    if Assigned((Sender as TsEdit).OnExit) then
      (Sender as TsEdit).OnExit(Sender);

    if Assigned(btnEncSetPosition.OnClick) then
      btnEncSetPosition.OnClick(Sender);
  end;
end;

procedure TFormControllerSettings.edtLimit1Exit(Sender: TObject);
begin
  with Sender as TsEdit do begin
    try
      Text:=IntToStr(StrToInt(Text));
    except
      on E: EConvertError do ;
    end;
  end;
end;

procedure TFormControllerSettings.edtLimit1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key=13 then begin
    if Assigned((Sender as TsEdit).OnExit) then
      (Sender as TsEdit).OnExit(Sender);

    if Assigned(btnLim1Set.OnClick) then
      btnLim1Set.OnClick(Sender);
  end;
end;

procedure TFormControllerSettings.edtLimit2Exit(Sender: TObject);
begin
  with Sender as TsEdit do begin
    try
      Text:=IntToStr(StrToInt(Text));
    except
      on E: EConvertError do ;
    end;
  end;
end;

procedure TFormControllerSettings.edtLimit2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key=13 then begin
    if Assigned((Sender as TsEdit).OnExit) then
      (Sender as TsEdit).OnExit(Sender);

    if Assigned(btnLim2Set.OnClick) then
      btnLim2Set.OnClick(Sender);
  end;
end;

procedure TFormControllerSettings.edtMaxSpeedExit(Sender: TObject);
begin
  with Sender as TsEdit do begin
    try
      Text:=FloatToStr(StrToFloat(Text));
    except
      on E: EConvertError do ;
    end;
  end;
end;

procedure TFormControllerSettings.edtMaxSpeedKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key=13 then begin
    if Assigned((Sender as TsEdit).OnExit) then
      (Sender as TsEdit).OnExit(Sender);

    if Assigned(btnSetMaxSpeed.OnClick) then
      btnSetMaxSpeed.OnClick(Sender);
  end;
end;

procedure TFormControllerSettings.edtMovAbsExit(Sender: TObject);
begin
  with Sender as TsEdit do begin
    try
      Text:=IntToStr(StrToInt(Text));
    except
      on E: EConvertError do ;
    end;
  end;
end;

procedure TFormControllerSettings.edtMovAbsKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key=13 then begin
    if Assigned((Sender as TsEdit).OnExit) then
      (Sender as TsEdit).OnExit(Sender);

    if Assigned(btnMovAbs.OnClick) then
      btnMovAbs.OnClick(Sender);
  end;
end;

procedure TFormControllerSettings.edtPositionExit(Sender: TObject);
begin
  with Sender as TsEdit do begin
    try
      Text:=IntToStr(StrToInt(Text));
    except
      on E: EConvertError do ;
    end;
  end;
end;

procedure TFormControllerSettings.edtPositionKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key=13 then begin
    if Assigned((Sender as TsEdit).OnExit) then
      (Sender as TsEdit).OnExit(Sender);

    if Assigned(btnSetPosition.OnClick) then
      btnSetPosition.OnClick(Sender);
  end;
end;

procedure TFormControllerSettings.edtSlitProportionChange(Sender: TObject);
begin
Controller.Slit.Proportion:= edtSlitProportion.Value;
end;

procedure TFormControllerSettings.edtSpeedExit(Sender: TObject);
begin
  with Sender as TsEdit do begin
    try
      Text:=FloatToStr(StrToFloat(Text));
    except
      on E: EConvertError do ;
    end;
  end;
end;

procedure TFormControllerSettings.edtSpeedKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key=13 then begin
    if Assigned((Sender as TsEdit).OnExit) then
      (Sender as TsEdit).OnExit(Sender);

    if Assigned(btnSetSpeed.OnClick) then
      btnSetSpeed.OnClick(Sender);
  end;
end;

procedure TFormControllerSettings.FormCreate(Sender: TObject);
var
  I: Integer;
begin
Controller:=FormMain.Controller;
sgFilters.Cells[0,0]:='Position';
sgFilters.Cells[1,0]:='Name';
sgFilters.Cells[2,0]:='Steps';

  for I := 1 to 8 do
  sgFilters.Cells[0,i]:=IntToStr(i);
end;

procedure TFormControllerSettings.FormShow(Sender: TObject);
begin
MotArray[0]:=Controller.MotX;
MotArray[1]:=Controller.MotY;
MotArray[2]:=Controller.MotZ;
MotArray[3]:=Controller.BF;
MotArray[4]:=Controller.FilterWheel;
MotArray[5]:=Controller.Slit;
MotArray[6]:=Controller.MotColim;


canChangeFWgrid:=False;
UpdateFWGrid;
UpdateSlitData;
canChangeFWgrid:=True;

UpdateMotoInfo(0);
pnlXYZaddSettings.Enabled:=true;
end;



procedure TFormControllerSettings.sgFiltersRowMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
var i:Integer;
begin
for i := 0 to 7 do
 begin
  sgFilters.Cells[0, i+1]:=IntToStr(i+1) ;
  Controller.FilterWheel.Filter[i].Name:=sgFilters.Cells[1, i+1] ;
  Controller.FilterWheel.Filter[i].Position:= StrToIntDef(sgFilters.Cells[2, i+1],0)  ;
 end;

FormMain.UpdateFilterWheelLabels;
end;

procedure TFormControllerSettings.sgFiltersSetEditText(Sender: TObject; ACol,
  ARow: Integer; const Value: string);
begin
if   canChangeFWgrid then
 begin
    case ACol of
      1: Controller.FilterWheel.Filter[ARow-1].Name := sgFilters.Cells[ACol, ARow];
      2: Controller.FilterWheel.Filter[ARow-1].Position:=StrToIntDef(sgFilters.Cells[ACol, ARow],0)  ;
      end;

      FormMain.UpdateFilterWheelLabels;
 end;
end;

procedure TFormControllerSettings.UpdateFWGrid;
var
  I: Integer;
begin
for I := 0 to 7 do
begin
  sgFilters.Cells[1, i+1]:=Controller.FilterWheel.Filter[i].Name ;
  sgFilters.Cells[2, i+1]:=IntToStr(Controller.FilterWheel.Filter[i].Position ) ;
end;
end;

procedure TFormControllerSettings.UpdateMotoInfo(idx: integer);
//begin

//      TTask.Run(procedure
      var str:string;
          vI:Integer;
          vF:Single;
      begin
       (MotArray[idx] as TMotor).FCritSection.Acquire;
       canChange:=False;

       edtCurrent.Text:=(MotArray[idx] as TMotor).Current.ToString;

          case (MotArray[idx] as TMotor).StepMode of
            1:cboxStepMode.ItemIndex:=0;
            2:cboxStepMode.ItemIndex:=1;
            4:cboxStepMode.ItemIndex:=2;
            8:cboxStepMode.ItemIndex:=3;
            16:cboxStepMode.ItemIndex:=4;
            32:cboxStepMode.ItemIndex:=5;
            else cboxStepMode.Text:='---';
            end;

          case (MotArray[idx] as TMotor).EndStopType of
            0:cboxEndStopType.ItemIndex:=0;
            1:cboxEndStopType.ItemIndex:=1;
            else cboxEndStopType.Text:='---';
            end;


       edtSpeed.Text:=(MotArray[idx] as TMotor).Speed.ToString;

       edtMaxSpeed.Text:=(MotArray[idx] as TMotor).MaxSpeed.ToString;

       edtAcceleration.Text:=(MotArray[idx] as TMotor).Acceleration.ToString;

       edtPosition.Text:=(MotArray[idx] as TMotor).Position.ToString;

       edtEncPosition.Text:=(MotArray[idx] as TMotor).EncPosition.ToString;


      if (idx=0) or (idx=1) or (idx=2) then   //X or Y or Z
       begin
         edtLimit1.Text:=(MotArray[idx] as TMotor).Limit1.ToString;
         edtLimit2.Text:=(MotArray[idx] as TMotor).Limit2.ToString;
         cbCanUseLastPos.Checked:= (MotArray[idx] as TMotor).CanUseLastPosition;
         cbReverse.Checked:= (MotArray[idx] as TMotor).Reverse;
       end;

       canChange:=True;
       (MotArray[idx] as TMotor).FCritSection.Release;
//      end);
end;

procedure TFormControllerSettings.UpdateMotoPosition(idx: integer);
begin
   TTask.Run( procedure
           var
               s:string;
           begin
           (MotArray[idx] as TMotor).fCritSection.Acquire;
           canChange:=False;

           edtPosition.Text:=(MotArray[idx] as TMotor).Position.ToString;
           if (idx>=0) and (idx<3) then   edtEncPosition.Text:=(MotArray[idx] as TMotor).EncPosition.ToString;

           canChange:=True;
           (MotArray[idx] as TMotor).fCritSection.Release;
           end);
end;

procedure TFormControllerSettings.UpdateSlitData;
begin
  edtSlitProportion.Value:= Controller.Slit.Proportion;
end;

end.
