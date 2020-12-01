unit uController;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, sGroupBox, Vcl.StdCtrls, sEdit,
  sSpinEdit, sComboBox, Vcl.ExtCtrls, sButton, Vcl.ComCtrls, sTrackBar, sLabel,
  sStatusBar, Vcl.Buttons, sSpeedButton, sPanel, ControllerSettings, System.Threading,
  devController;

type
  TFormController = class(TForm)
    TimerOneSec: TTimer;
    procedure trbLed1Change(Sender: TObject);
    procedure trbLed2Change(Sender: TObject);
    procedure btnFlip1UpClick(Sender: TObject);
    procedure btnFlip1DownClick(Sender: TObject);
    procedure btnFlip2UpClick(Sender: TObject);
    procedure btnFlip2DownClick(Sender: TObject);
    procedure btnPointClick(Sender: TObject);
    procedure btnLineClick(Sender: TObject);
    procedure btnFindControllerClick(Sender: TObject);
    procedure btnStepperSettingsClick(Sender: TObject);
    procedure edtSlitKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSlitSetClick(Sender: TObject);
    procedure sSpeedButton2Click(Sender: TObject);
    procedure sSpeedButton3Click(Sender: TObject);
    procedure sSpeedButton4Click(Sender: TObject);
    procedure sSpeedButton1Click(Sender: TObject);
    procedure sSpeedButton5Click(Sender: TObject);
    procedure sSpeedButton6Click(Sender: TObject);
    procedure btnBFupClick(Sender: TObject);
    procedure btnBFdwnClick(Sender: TObject);
    procedure btnSlitCalClick(Sender: TObject);
    procedure btnFWcalClick(Sender: TObject);
    procedure btnXYZcalClick(Sender: TObject);
    procedure rgFilterWheelChanging(Sender: TObject; NewIndex: Integer;
      var AllowChange: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FLoaded:    Boolean;

     procedure OnControllerConnect(Sender:TObject);
     procedure OnControllerDisconnect(Sender:TObject);
     procedure OnControllerMotoDone(Sender:TObject; ev: TMotoDoneEv);

     procedure InitControllerControls;


     procedure BlinkES(idx:integer);
     procedure CheckXYZcalibration;


  public
    { Public declarations }
    Controller:TController;
    procedure UpdateFilterWheelLabels;
    procedure UpdateControllerLabels;
  end;

var canChange:boolean = True;

implementation

{$R *.dfm}

uses main;

{ TFormController }

procedure TFormController.BlinkES(idx: integer);
begin
//TTask.Run(procedure
//     var i:Integer;
//     begin
//     for i:=0 to 2 do
//         begin
//           //if idx=1 then
//          pnlES.Color:=clRed; //else pnlES.Color:=clRed;
//          sleep(200);
//           //           if idx=1 then
//          pnlES.Color:=clMenuText; //else pnlES2.Color:=clMenuText;
//
//          sleep(200);
//         end;
//
//     end);
end;

procedure TFormController.btnBFdwnClick(Sender: TObject);
begin
// Controller.SendCmdAsync('M3 MOVAR -'+ cboxBFstep.Text);
end;

procedure TFormController.btnBFupClick(Sender: TObject);
begin
//  Controller.SendCmdAsync('M3 MOVAR '+ cboxBFstep.Text);
end;

procedure TFormController.btnFindControllerClick(Sender: TObject);
begin
TTask.Run(procedure
          begin
          if Controller.FindController then
           begin
           Controller.InitParams;
           InitControllerControls;
           end;
          end);
end;

procedure TFormController.btnFlip1DownClick(Sender: TObject);
begin
  Controller.SetFlipValueAsync(1,0);
end;

procedure TFormController.btnFlip1UpClick(Sender: TObject);
begin
Controller.SetFlipValueAsync(1,1);
end;

procedure TFormController.btnFlip2DownClick(Sender: TObject);
begin
  Controller.SetFlipValueAsync(2,0);
end;

procedure TFormController.btnFlip2UpClick(Sender: TObject);
begin
 Controller.SetFlipValueAsync(2,1);
end;

procedure TFormController.btnFWcalClick(Sender: TObject);
begin
  Controller.FilterWheel.DoCalibration;
end;

procedure TFormController.btnLineClick(Sender: TObject);
begin
Controller.SetFlipValueAsync(1,0);
Controller.SetFlipValueAsync(2,0);
end;

procedure TFormController.btnPointClick(Sender: TObject);
begin
Controller.SetFlipValueAsync(1,1);
Controller.SetFlipValueAsync(2,1);
end;

procedure TFormController.btnSlitCalClick(Sender: TObject);
begin
 Controller.Slit.DoCalibration;
end;

procedure TFormController.btnSlitSetClick(Sender: TObject);
begin
//Controller.Slit.SetSlit(edtSlit.Value);
end;

procedure TFormController.btnStepperSettingsClick(Sender: TObject);
begin
if FormControllerSettings=nil then  FormControllerSettings:=TFormControllerSettings.Create(Self);
FormControllerSettings.Show;
end;

procedure TFormController.btnXYZcalClick(Sender: TObject);
begin
 Controller.CalibrateXYZasync;
end;

procedure TFormController.CheckXYZcalibration;
var
    buttonSelected : Integer;
begin
if Controller.CanUseLastPosition(0) and
   Controller.CanUseLastPosition(1) and
   Controller.CanUseLastPosition(2) then

//  StatusBarController.Panels[1].Text:='Microscope calibrated'
  else
    begin
    buttonSelected := MessageDlg('Calibrate microscope stage',mtWarning, mbOKCancel, 0);
//    if buttonSelected = mrCancel then   StatusBarController.Panels[1].Text:='Microscope uncalibrated!';
     if buttonSelected = mrOK  then
         begin
         buttonSelected := MessageDlg('Remove disk from sample compartment',mtWarning, [mbOK], 0);
         if buttonSelected = mrOK  then
              begin
              ShowMessage('Calibration');
              Controller.SendCmdAnsw('M0 CALR1');
              sleep(50);
              Controller.SendCmdAnsw('M1 CALR1');
              sleep(50);
              Controller.SendCmdAnsw('M2 CALR1');
              sleep(50);
              end;

         end;
    end;
end;

procedure TFormController.edtSlitKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//if Key=13 then
//  if Assigned(btnSlitSet.OnClick) then
//      btnSlitSet.OnClick(Self);
end;

procedure TFormController.FormCreate(Sender: TObject);
begin
Controller:=TController.Create(Self);
Controller.OnConnect:=OnControllerConnect;
Controller.OnDisconnect:=OnControllerDisconnect;
Controller.OnMotoDone:=OnControllerMotoDone;
OnControllerDisconnect(Self);
FLoaded:=False;
end;

procedure TFormController.FormDestroy(Sender: TObject);
begin
Controller.Free;
end;

procedure TFormController.FormShow(Sender: TObject);
begin
if FLoaded then exit;

Controller.FilterWheel.LoadSettings;
Controller.Slit.LoadSettings;

UpdateFilterWheelLabels;

TTask.Run(procedure

          begin
          if Controller.FindController then
           begin
           Controller.InitParams;
           InitControllerControls;

           Controller.fCritSection.Acquire;
           CheckXYZcalibration;

           Controller.FilterWheel.DoCalibration;
           Controller.fCritSection.Release;
           sleep(1000);
           Controller.fCritSection.Acquire;
           Controller.Slit.DoCalibration;
           Controller.fCritSection.Release;

           end;

          end);

FLoaded:=True;
end;

procedure TFormController.InitControllerControls;
begin
 canChange:=False;
// trbLed1.Position:=Controller.Led1Value;
// trbLed2.Position:=Controller.Led2Value;
 canChange:=True;
end;

procedure TFormController.OnControllerConnect(Sender: TObject);
begin
//StatusBarController.Panels[0].Text:='Controller on '+Controller.WorkPort;
end;

procedure TFormController.OnControllerDisconnect(Sender: TObject);
begin
//StatusBarController.Panels[0].Text:='Controller Disconnected';
end;


////////////////////
///  MOTO DONE
////////////////////

procedure TFormController.OnControllerMotoDone(Sender: TObject;  ev: TMotoDoneEv);
begin
if FormControllerSettings.Visible then
    begin
    if (ev=mdES1)  then  FormControllerSettings.BlinkES(1)
     else
    if (ev=mdES2)  then  FormControllerSettings.BlinkES(2);

    FormControllerSettings.UpdateMotoPosition(FormControllerSettings.cboxStepper.ItemIndex);
    end;

if (ev=mdES1)or (ev=mdES2) then BlinkES(1);

if (ev=mdFWCalDone) then
    begin
//    rgFilterWheel.Enabled:=True;
//    canChange:=false;
//    rgFilterWheel.ItemIndex:=Controller.FilterWheel.Position;
//    rgFilterWheel.Update;
    canChange:=True;
    end;


if (ev=mdSlitCalDone) then
     begin
//     gbSlit.Enabled:=True;
//     edtSlit.Value:=0;
     end;

//if (ev=mdSlitDone) then edtSlit.Value:=Controller.Slit.SlitMicrons;

end;

procedure TFormController.rgFilterWheelChanging(Sender: TObject;
  NewIndex: Integer; var AllowChange: Boolean);
begin
//if canChange then
//  Controller.FilterWheel.GotoFilter(rgFilterWheel.ItemIndex);
end;

procedure TFormController.sSpeedButton1Click(Sender: TObject);
begin
//  Controller.SendCmdAsync('M1 MOVAR '+ cboxXYStep.Text);
end;

procedure TFormController.sSpeedButton2Click(Sender: TObject);
begin
//Controller.SendCmdAsync('M0 MOVAR -'+ cboxXYStep.Text);
end;

procedure TFormController.sSpeedButton3Click(Sender: TObject);
begin
//Controller.SendCmdAsync('M1 MOVAR -'+ cboxXYStep.Text);
end;

procedure TFormController.sSpeedButton4Click(Sender: TObject);
begin
// Controller.SendCmdAsync('M0 MOVAR '+ cboxXYStep.Text);
end;

procedure TFormController.sSpeedButton5Click(Sender: TObject);
begin
//  Controller.SendCmdAsync('M2 MOVAR -'+ cboxZStep.Text);
end;

procedure TFormController.sSpeedButton6Click(Sender: TObject);
begin
// Controller.SendCmdAsync('M2 MOVAR '+ cboxZStep.Text);
end;

procedure TFormController.trbLed1Change(Sender: TObject);
begin
//Controller.SetLedValueAsync(1,trbLed1.Position);
end;

procedure TFormController.trbLed2Change(Sender: TObject);
begin
//Controller.SetLedValueAsync(2,trbLed2.Position);
end;

procedure TFormController.UpdateControllerLabels;
begin
if Controller.Connected then
       begin
            if Controller.Flip1Value=0 then
                begin
//                 shpFlip1Up.Brush.Color:=clDkGray;
//                 shpFlip1Dwn.Brush.Color:=clGreen;
                end
              else
                begin
//                 shpFlip1Up.Brush.Color:=clGreen;
//                 shpFlip1Dwn.Brush.Color:=clDkGray;
                end ;

            if Controller.Flip2Value=0 then
                begin
//                 shpFlip2Up.Brush.Color:=clDkGray;
//                 shpFlip2Dwn.Brush.Color:=clGreen;
                end
              else
                begin
//                 shpFlip2Up.Brush.Color:=clGreen;
//                 shpFlip2Dwn.Brush.Color:=clDkGray;
                end ;

//        if Controller.FilterWheel.Calibrating then
//            begin
//             if shpFWCal.Brush.Color=clBlue then
//                     shpFWCal.Brush.Color:=clDkGray
//                  else shpFWCal.Brush.Color:=clBlue;
//            end
//          else shpFWCal.Brush.Color:=clGreen;
//
//        if Controller.FilterWheel.Moving then
//            begin
//             if shpFWMov.Brush.Color=clMaroon then
//                     shpFWMov.Brush.Color:=clDkGray
//                  else shpFWMov.Brush.Color:=clMaroon;
//            end
//          else shpFWMov.Brush.Color:=clGreen;
//
//
//          if Controller.Slit.Calibrating then
//            begin
//             if shpSlitCal.Brush.Color=clBlue then
//                     shpSlitCal.Brush.Color:=clDkGray
//                  else shpSlitCal.Brush.Color:=clBlue;
//            end
//          else shpSlitCal.Brush.Color:=clGreen;
//
//        if Controller.Slit.Moving then
//            begin
//             if shpSlitMov.Brush.Color=clMaroon then
//                     shpSlitMov.Brush.Color:=clDkGray
//                  else shpSlitMov.Brush.Color:=clMaroon;
//            end
//          else shpSlitMov.Brush.Color:=clGreen;
//       //// Line & Point
//          if (Controller.Flip1Value=1) and (Controller.Flip2Value=1) then
//                begin
//                 shpLine.Brush.Color:=clDkGray;
//                 shpPoint.Brush.Color:=clGreen;
//                end
//           else
//          if (Controller.Flip1Value=0) and (Controller.Flip2Value=0) then
//                begin
//                 shpLine.Brush.Color:=clGreen;
//                 shpPoint.Brush.Color:=clDkGray;
//                end
//           else
//               begin
//                 shpLine.Brush.Color:=clDkGray;
//                 shpPoint.Brush.Color:=clDkGray;
//                end;
//
//
       end
    else
       begin
//        shpFlip1Up.Brush.Color:=clDkGray;
//        shpFlip1Dwn.Brush.Color:=clDkGray;
//        shpFlip2Up.Brush.Color:=clDkGray;
//        shpFlip2Dwn.Brush.Color:=clDkGray;
//        shpLine.Brush.Color:=clDkGray;
//        shpPoint.Brush.Color:=clDkGray;
       end;
end;

procedure TFormController.UpdateFilterWheelLabels;
var
  i: Integer;
begin
//for i := 0 to 7 do
//  rgFilterWheel.Items[i]:=Controller.FilterWheel.Filter[i].Name;
end;

end.
