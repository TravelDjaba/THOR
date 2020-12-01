unit uLaser;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, sStatusBar, Vcl.StdCtrls,
  sEdit, sSpinEdit, Vcl.Grids, Vcl.ValEdit, sButton, sLabel, Vcl.ExtCtrls,
  sGroupBox, sPanel, devLaserRBOXX, System.Threading;

type
  TFormLaser = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure btnLaserPowOnClick(Sender: TObject);
    procedure btnLaserPowOffClick(Sender: TObject);
    procedure btnLaserOpModeCPowerClick(Sender: TObject);
    procedure btnLaserOpModeCCurrClick(Sender: TObject);
    procedure btnLaserOpModeModulationClick(Sender: TObject);
    procedure spinedtLaserPowerKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure spinedtLaserBiasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnLaserSetPowClick(Sender: TObject);
    procedure btnLaserSetBiasClick(Sender: TObject);
    procedure btnFindLaserClick(Sender: TObject);
    procedure sEdit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnSendCmdClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }

     FLoaded:    Boolean;
     procedure OnLaserConnect(Sender:TObject);
     procedure OnLaserDisconnect(Sender:TObject);

     procedure InitLaserControls;

     procedure OnChangeMode;

  public
    { Public declarations }
    Laser:TLaserRBOXX;
    procedure UpdateLaserLabels;
  end;

implementation

{$R *.dfm}

procedure TFormLaser.btnFindLaserClick(Sender: TObject);
begin
 TTask.Run(procedure
          begin
          if Laser.FindLaser then
           begin
           Laser.InitParams;
           InitLaserControls;
           end;
          end);
end;

procedure TFormLaser.btnLaserOpModeCCurrClick(Sender: TObject);
begin
   if Laser.CM_MODE=Modulation then
      Laser.SetModulation(False);
   Laser.SetMode(AutoCurCtrl);
   OnChangeMode;
end;

procedure TFormLaser.btnLaserOpModeCPowerClick(Sender: TObject);
begin
   if Laser.CM_MODE=Modulation then
      Laser.SetModulation(False);
    Laser.SetMode(AutoPowCtrl);
    OnChangeMode;
end;

procedure TFormLaser.btnLaserOpModeModulationClick(Sender: TObject);
begin
   if Laser.CM_MODE<>Modulation then
      Laser.SetMode(AutoCurCtrl);
   Laser.SetModulation(True);
     OnChangeMode;
end;

procedure TFormLaser.btnLaserPowOffClick(Sender: TObject);
begin
Laser.SetOnOff(false);
end;

procedure TFormLaser.btnLaserPowOnClick(Sender: TObject);
begin
Laser.SetOnOff(true);
end;

procedure TFormLaser.btnLaserSetBiasClick(Sender: TObject);
begin
//Laser.SetBias(spinedtLaserBias.Value);
end;

procedure TFormLaser.btnLaserSetPowClick(Sender: TObject);
begin
//Laser.SetPower(spinedtLaserPower.Value);
end;

procedure TFormLaser.btnSendCmdClick(Sender: TObject);
begin
//Laser.Send(sEdit1.Text);
end;

procedure TFormLaser.FormCreate(Sender: TObject);
begin
Laser:=TLaserRBOXX.Create;
Laser.OnConnect:=OnLaserConnect;
Laser.OnDisconnect:=OnLaserDisconnect;
OnLaserDisconnect(Self);

FLoaded:=False;
end;

procedure TFormLaser.FormDestroy(Sender: TObject);
begin
Laser.Free;
end;

procedure TFormLaser.FormShow(Sender: TObject);
begin
//if FLoaded then exit;

TTask.Run(procedure

          begin
          if Laser.FindLaser then
           begin
           Laser.InitParams;
           InitLaserControls;
           end;

         end);
end;

procedure TFormLaser.InitLaserControls;
begin
//TThread.Synchronize(nil,
//          procedure()
//              begin
//              vleLaserStatus.Cells[1,0]:=Format('%d mW',[Laser.Power_mW ]);
//              vleLaserStatus.Cells[1,1]:=Format('%d mA',[Laser.Bias_mA ]);
//              vleLaserStatus.Cells[1,2]:=Format('%.1f %sC',[Laser.Temp,#176 ]);
//              vleLaserStatus.Cells[1,3]:=Format('%.1f %sC',[Laser.CaseTemp,#176 ]);
//
//              spinedtLaserPower.MinValue:=Laser.MinOptPow_mW;
//              spinedtLaserPower.MaxValue:=Laser.MaxOptPow_mW;
//              spinedtLaserPower.Value:=Laser.RefPower_mW;
//
//              spinedtLaserBias.Value:=Laser.RefBias_mA;
//              end);
end;

procedure TFormLaser.OnChangeMode;
begin
//  if Laser.CM_MODE=AutoPowCtrl then
//          begin
//              spinedtLaserPower.Enabled:=True;
//              btnLaserSetPow.Enabled:=True;
//              spinedtLaserBias.Enabled:=False;
//              btnLaserSetBias.Enabled:=False;
//          end
//else
//          begin
//              spinedtLaserPower.Enabled:=False;
//              btnLaserSetPow.Enabled:=False;
//              spinedtLaserBias.Enabled:=True;
//              btnLaserSetBias.Enabled:=True;
//          end;
end;

procedure TFormLaser.OnLaserConnect(Sender: TObject);
begin
//StatusBarLaser.Panels[0].Text:='Laser on '+Laser.WorkPort;
end;

procedure TFormLaser.OnLaserDisconnect(Sender: TObject);
begin
//StatusBarLaser.Panels[0].Text:='Laser Disconnected';
end;

procedure TFormLaser.sEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//if Key= VK_RETURN then
//   Laser.Send(sEdit1.Text);
end;

procedure TFormLaser.spinedtLaserBiasKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//if Key=VK_RETURN then
//   btnLaserSetBias.OnClick(Self);
end;

procedure TFormLaser.spinedtLaserPowerKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//if Key=VK_RETURN then
//   btnLaserSetPow.OnClick(Self);
end;

procedure TFormLaser.UpdateLaserLabels;
begin
//if Laser.Connected then
//   begin
//       // Alarms
//    if Laser.Alarm.PWR then shpLaserAlarmPWR.Brush.Color:=clMaroon
//                       else shpLaserAlarmPWR.Brush.Color:=clGreen;
//    if Laser.Alarm.LASER_TEC then shpLaserAlarmLASER_TEC.Brush.Color:=clMaroon
//                             else shpLaserAlarmLASER_TEC.Brush.Color:=clGreen;
//    if Laser.Alarm.LASER then shpLaserAlarmLASER.Brush.Color:=clMaroon
//                         else shpLaserAlarmLASER.Brush.Color:=clGreen;
//    if Laser.Alarm.TEMP then shpLaserAlarmTEMP.Brush.Color:=clMaroon
//                        else shpLaserAlarmTEMP.Brush.Color:=clGreen;
//    if Laser.Alarm.BIAS then shpLaserAlarmBIAS.Brush.Color:=clMaroon
//                        else shpLaserAlarmBIAS.Brush.Color:=clGreen;
//     // OperatingMode
//      case Laser.CM_MODE of
//      AutoPowCtrl:begin
//                  shpLaserOpCPow.Brush.Color:=clGreen;
//                  shpLaserOpCCur.Brush.Color:=clDkGray;
//                  shpLaserOpModul.Brush.Color:=clDkGray;
//                  end;
//      AutoCurCtrl:begin
//                  shpLaserOpCPow.Brush.Color:=clDkGray;
//                  shpLaserOpCCur.Brush.Color:=clGreen;
//                  shpLaserOpModul.Brush.Color:=clDkGray;
//                  end;
//      Modulation: begin
//                  shpLaserOpCPow.Brush.Color:=clDkGray;
//                  shpLaserOpCCur.Brush.Color:=clDkGray;
//                  shpLaserOpModul.Brush.Color:=clGreen;
//                  end;
//      end;
//
//      OnChangeMode;
//
//      // Power
//      case Laser.OP_MODE of
//      AutoLaserShutDown:begin
//                  shpLaserPowAutoShD.Brush.Color:=clMaroon;
//                  shpLaserPowOn.Brush.Color:=clDkGray;
//                  shpLaserPowOff.Brush.Color:=clDkGray;
//                  end;
//      LaserOn    :begin
//                  shpLaserPowAutoShD.Brush.Color:=clDkGray;
//                  shpLaserPowOn.Brush.Color:=clGreen;
//                  shpLaserPowOff.Brush.Color:=clDkGray;
//                  end;
//      LaserOff  : begin
//                  shpLaserPowAutoShD.Brush.Color:=clDkGray;
//                  shpLaserPowOn.Brush.Color:=clDkGray;
//                  shpLaserPowOff.Brush.Color:=clMaroon;
//                  end;
//      end;
//
//      //Status
//      vleLaserStatus.Cells[1,0]:=Format('%d mW',[Laser.Power_mW ]);
//      vleLaserStatus.Cells[1,1]:=Format('%d mA',[Laser.Bias_mA ]);
//      vleLaserStatus.Cells[1,2]:=Format('%.1f %sC',[Laser.Temp, #176 ]);
//      vleLaserStatus.Cells[1,3]:=Format('%.1f %sC',[Laser.CaseTemp,#176 ]);
//   end
// else
//   begin
//     shpLaserAlarmPWR.Brush.Color:=clDkGray ;
//     shpLaserAlarmLASER_TEC.Brush.Color:=clDkGray ;
//     shpLaserAlarmLASER.Brush.Color:=clDkGray ;
//     shpLaserAlarmTEMP.Brush.Color:=clDkGray;
//     shpLaserAlarmBIAS.Brush.Color:=clDkGray;
//
//     shpLaserOpCPow.Brush.Color:=clDkGray;
//     shpLaserOpCCur.Brush.Color:=clDkGray;
//     shpLaserOpModul.Brush.Color:=clDkGray;
//
//     shpLaserPowAutoShD.Brush.Color:=clDkGray;
//     shpLaserPowOn.Brush.Color:=clDkGray;
//     shpLaserPowOff.Brush.Color:=clDkGray;
//
//      vleLaserStatus.Cells[1,0]:=Format('--- mW',[]);
//      vleLaserStatus.Cells[1,1]:=Format('--- mA',[]);
//      vleLaserStatus.Cells[1,2]:=Format('--- %sC',[ #176 ]);
//      vleLaserStatus.Cells[1,3]:=Format('--- %sC',[#176 ]);
//   end;
end;

end.
