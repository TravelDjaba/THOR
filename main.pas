unit main;

interface


//################################################
//##                                            ##
//##         Author: Roman Slipets              ##
//##         email:  traveldjaba@gmail.com      ##
//##         date:   2019                       ##
//##                                            ##
//################################################

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, sStatusBar,
  sSplitter,  sPanel,  Vcl.StdCtrls, AdvPanel, uBottomGraph,
  uImageGraph, uLeftGraph, Vcl.ToolWin, acCoolBar, Vcl.AppEvnts, Vcl.Buttons,
  sSpeedButton, System.ImageList, Vcl.ImgList,
  NumArray, NumIPP, devAndor, sEdit, sSpinEdit, sComboBox, sGroupBox, Vcl.Menus,
  System.Threading, System.SyncObjs, sButton, Vcl.Grids, Vcl.ValEdit, sLabel,
  devLaserRBOXX, devLaser680,  devController, uCCD, sTrackBar,   FrameData, uScan,
  sRadioButton, sDialogs, sCheckBox, acProgressBar, GR32_Image, GR32,
  hyiedefs, hyieutils, imageenio,  uToupcam, sSkinManager, sSkinProvider, sBitBtn, devControllerM, devDCMotor, uToupcamG32, uScan2, uViewer;

const WM_ANDOR_IMG = WM_USER+1;
      WM_ANDOR_CALCIMG = WM_USER+2;
      WM_ANDOR_START = WM_USER+3;
      WM_ANDOR_STOP = WM_USER+4;
      WM_SCAN_START = WM_USER+5;
      WM_SCAN_FINISH = WM_USER+6;
      WM_SCAN_BEF_FRAME = WM_USER+7;
      WM_SCAN_AFT_FRAME = WM_USER+8;
      WM_ANDOR_SCANNING = WM_USER+9;
      WM_PROGRESS = WM_USER+10;

   //   WM_SCANNER_FRAME =WM_USER+12; >> move to uScan2

      //ToupCam
//      MSG_CAMEVENT = WM_APP + 1;
//      WM_CCDPAINT = WM_USER+11;

type
   TBGType = (bgLight, bgDark);

type
  TformMain = class(TForm)
    pnlTriGraph: TAdvPanel;
    pnlGraphMain: TsPanel;
    splitterGraph2: TsSplitter;
    pnlGraphTop: TsPanel;
    splitterGraph1: TsSplitter;
    pnlLGraph: TsPanel;
    pnlIGraph: TPanel;
    pnlGraphBottomLeft: TsPanel;
    pnlHGraph: TsPanel;
    StatusBarGraph: TsStatusBar;
    ControlBarTriGraph: TControlBar;
    ApplicationEvents1: TApplicationEvents;
    ImageList1: TImageList;
    pnlAndorControls: TAdvPanel;
    pnlReadMode: TsPanel;
    cboxBinX: TsComboBox;
    cboxBinY: TsComboBox;
    edtSingleTrackCentre: TsSpinEdit;
    edtSingleTrackHigh: TsSpinEdit;
    pnlAcquisitionMode: TsPanel;
    rgAcquisitionMode: TsRadioGroup;
    edtExposure: TsDecimalSpinEdit;
    btnSetExposure: TButton;
    edtKineticTime: TsDecimalSpinEdit;
    edtAccumulationTime: TsDecimalSpinEdit;
    btnSetAccumTime: TButton;
    edtAccumulationNumber: TsSpinEdit;
    edtKineticNumber: TsSpinEdit;
    Timer1sec: TTimer;
    MainMenu1: TMainMenu;
    L1: TMenuItem;
    pnlStartStopAcq: TsPanel;
    btnStartAcq: TsButton;
    btnAbortAcq: TsButton;
    pnlLaser: TAdvPanel;
    pnlController: TAdvPanel;
    pnlCCD: TAdvPanel;
    pnlCCDparent: TsPanel;
    sPanel1: TsPanel;
    gbLaserAlarm: TsGroupBox;
    shpLaserAlarmPWR: TShape;
    lblLaserAlarmPWR: TsLabel;
    lblLaserAlarmLASER_TEC: TsLabel;
    shpLaserAlarmLASER_TEC: TShape;
    lblLaserAlarmLASER: TsLabel;
    shpLaserAlarmLASER: TShape;
    lblLaserAlarmTEMP: TsLabel;
    shpLaserAlarmTEMP: TShape;
    lblLaserAlarmBIAS: TsLabel;
    shpLaserAlarmBIAS: TShape;
    gbLaserPower: TsGroupBox;
    shpLaserPowOn: TShape;
    shpLaserPowOff: TShape;
    shpLaserPowAutoShD: TShape;
    sLabel1: TsLabel;
    btnLaserPowOn: TsButton;
    btnLaserPowOff: TsButton;
    gbLaserOpMode: TsGroupBox;
    shpLaserOpCPow: TShape;
    shpLaserOpCCur: TShape;
    shpLaserOpModul: TShape;
    btnLaserOpModeCPower: TsButton;
    btnLaserOpModeCCurr: TsButton;
    btnLaserOpModeModulation: TsButton;
    gbLaserStatus: TsGroupBox;
    vleLaserStatus: TValueListEditor;
    spinedtLaserPower: TsSpinEdit;
    spinedtLaserBias: TsSpinEdit;
    btnLaserSetPow: TsButton;
    btnLaserSetBias: TsButton;
    btnFindLaser: TsButton;
    btnSendCmd: TsButton;
    sEdit1: TsEdit;
    StatusBarLaser: TsStatusBar;
    sPanel2: TsPanel;
    btnStepperSettings: TsSpeedButton;
    btnSlitCal: TsSpeedButton;
    btnFWcal: TsSpeedButton;
    btnXYZcal: TsSpeedButton;
    sGroupBox1: TsGroupBox;
    sLabel2: TsLabel;
    sLabel3: TsLabel;
    trbLed1: TsTrackBar;
    trbLed2: TsTrackBar;
    btnFindController: TsButton;
    gbFlip1: TsGroupBox;
    shpFlip1Up: TShape;
    shpFlip1Dwn: TShape;
    btnFlip1Up: TsButton;
    btnFlip1Down: TsButton;
    gbFlip2: TsGroupBox;
    shpFlip2Up: TShape;
    shpFlip2Dwn: TShape;
    btnFlip2Up: TsButton;
    btnFlip2Down: TsButton;
    gbXYZ: TsGroupBox;
    sSpeedButton1: TsSpeedButton;
    sSpeedButton2: TsSpeedButton;
    sSpeedButton3: TsSpeedButton;
    sSpeedButton4: TsSpeedButton;
    sSpeedButton5: TsSpeedButton;
    sSpeedButton6: TsSpeedButton;
    btnBFup: TsSpeedButton;
    btnBFdwn: TsSpeedButton;
    cboxXYstep: TsComboBox;
    cboxZstep: TsComboBox;
    pnlES: TsPanel;
    cboxBFstep: TsComboBox;
    gbSlit: TsGroupBox;
    shpSlitCal: TShape;
    sLabel6: TsLabel;
    shpSlitMov: TShape;
    sLabel7: TsLabel;
    edtSlit: TsSpinEdit;
    btnSlitSet: TsButton;
    gbFilters: TsGroupBox;
    shpFWCal: TShape;
    shpFWMov: TShape;
    sLabel4: TsLabel;
    sLabel5: TsLabel;
    rgFilterWheel: TsRadioGroup;
    gbGeometry: TsGroupBox;
    shpPoint: TShape;
    shpLine: TShape;
    btnPoint: TsButton;
    btnLine: TsButton;
    StatusBarController: TsStatusBar;
    pnlPowerOnSample: TAdvPanel;
    TimerOnesec: TTimer;

    S1: TMenuItem;
    pnlCCD2: TAdvPanel;
    pnlCCDparent2: TsPanel;
    sPanel3: TsPanel;
    rbPixels: TsRadioButton;
    rbNm: TsRadioButton;
    rbCm: TsRadioButton;
    F1: TMenuItem;
    S2: TMenuItem;
    N1: TMenuItem;
    E1: TMenuItem;
    toCsv1: TMenuItem;
    SaveDialog: TsSaveDialog;
    t1: TMenuItem;
    t2: TMenuItem;
    sPanel4: TsPanel;
    cbUseQE: TsCheckBox;
    btnPlotQE: TsButton;
    btnPlotImage: TsButton;
    A1: TMenuItem;
    btnBackground: TsButton;
    sPanel5: TsPanel;
    rbADU: TsRadioButton;
    rbWatt: TsRadioButton;
    rbPhotons: TsRadioButton;
    rbWattRelative: TsRadioButton;
    rbPhotonsRelative: TsRadioButton;
    rbCrossSection: TsRadioButton;
    rbCrossSectionSERS: TsRadioButton;
    pbProgressFrame: TsProgressBar;
    TimerProgress: TTimer;
    S3: TMenuItem;
    cbUseLineCorrection: TsCheckBox;
    PaintBoxPalette: TPaintBox32;
    gbSoftBin: TsGroupBox;
    cboxSoftBinX: TsComboBox;
    cboxSoftBinY: TsComboBox;
    rgShutterMode: TsRadioGroup;
    sSkinManager1: TsSkinManager;
    AdvPanelStyler1: TAdvPanelStyler;
    rgReadMode: TsRadioGroup;
    gbAndorTemperature1: TsGroupBox;
    lblGetTemperature: TLabel;
    edtSetTemperature: TsSpinEdit;
    btnSetTemperature: TButton;
    btnCoolerOn: TButton;
    btnCoolerOff: TButton;
    sPanel6: TsPanel;
    sPanel7: TsPanel;
    lblPowerOnSample: TsLabel;
    sPanel8: TsPanel;
    btnVScaleTriGraph: TsSpeedButton;
    btnAutoscaleTriGraph: TsSpeedButton;
    sSkinProvider1: TsSkinProvider;
    btnAver: TsBitBtn;
    pnlSNR: TAdvPanel;
    sPanel9: TsPanel;
    lblSNR: TsLabel;
    gbADC: TsGroupBox;
    cboxADChannel: TsComboBox;
    edtADBitDepth: TsEdit;
    cboxOutputAmplifier: TsComboBox;
    cboxHSpeed: TsComboBox;
    cboxPreAmpGain: TsComboBox;
    D1: TMenuItem;
    S4: TMenuItem;
    N2: TMenuItem;
    R1: TMenuItem;
    btnFanModeOn: TButton;
    btnFanModeOff: TButton;
    S6: TMenuItem;
    pnlLaser680: TAdvPanel;
    sPanel10: TsPanel;
    sGroupBox3: TsGroupBox;
    shpLaser680PowOn: TShape;
    shpLaser680PowOff: TShape;
    btnLaser680PowOn: TsButton;
    btnLaser680PowOff: TsButton;
    sGroupBox5: TsGroupBox;
    vleLaser680Status: TValueListEditor;
    spinedtLaser680Power: TsSpinEdit;
    btnLaser680SetPow: TsButton;
    StatusBarLaser680: TsStatusBar;
    btnFindLaser680: TsButton;
    trbLaser680Power: TsTrackBar;
    procedure pnlLGraphResize(Sender: TObject);
    procedure pnlTriGraphResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ApplicationEvents1Message(var Msg: tagMSG; var Handled: Boolean);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnSetTemperatureClick(Sender: TObject);
    procedure edtSetTemperatureKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCoolerOnClick(Sender: TObject);
    procedure btnCoolerOffClick(Sender: TObject);
    procedure rgReadModeClick(Sender: TObject);
    procedure cboxBinXChange(Sender: TObject);
    procedure edtSingleTrackCentreChange(Sender: TObject);
    procedure edtSingleTrackHighChange(Sender: TObject);
    procedure rgAcquisitionModeChange(Sender: TObject);
    procedure edtExposureKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSetExposureClick(Sender: TObject);
    procedure edtAccumulationTimeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSetAccumTimeClick(Sender: TObject);
    procedure edtAccumulationNumberChange(Sender: TObject);
    procedure edtKineticNumberChange(Sender: TObject);
    procedure rgShutterModeChange(Sender: TObject);
    procedure Timer1secTimer(Sender: TObject);
    procedure L1Click(Sender: TObject);
    procedure btnStartAcqClick(Sender: TObject);
    procedure btnAbortAcqClick(Sender: TObject);
    procedure spinedtLaserPowerKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure spinedtLaserBiasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnLaserSetPowClick(Sender: TObject);
    procedure btnLaserSetBiasClick(Sender: TObject);
    procedure btnLaserPowOnClick(Sender: TObject);
    procedure btnLaserPowOffClick(Sender: TObject);
    procedure btnFindLaserClick(Sender: TObject);
    procedure btnLaserOpModeCPowerClick(Sender: TObject);
    procedure btnLaserOpModeModulationClick(Sender: TObject);
    procedure btnLaserOpModeCCurrClick(Sender: TObject);
    procedure sEdit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnSendCmdClick(Sender: TObject);
    procedure btnFlip1UpClick(Sender: TObject);
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
    procedure rgFilterWheelChange(Sender: TObject);
    procedure TimerOnesecTimer(Sender: TObject);
    procedure S1Click(Sender: TObject);
    procedure rbPixelsClick(Sender: TObject);
    procedure E1Click(Sender: TObject);
    procedure toCsv1Click(Sender: TObject);
    procedure t2Click(Sender: TObject);
    procedure t1Click(Sender: TObject);
    procedure btnPlotQEClick(Sender: TObject);
    procedure btnPlotImageClick(Sender: TObject);
    procedure A1Click(Sender: TObject);
    procedure btnBackgroundClick(Sender: TObject);
    procedure rbADUClick(Sender: TObject);
    procedure btnFlip1DownClick(Sender: TObject);
    procedure TimerProgressTimer(Sender: TObject);
    procedure S3Click(Sender: TObject);
    procedure cbUseQEClick(Sender: TObject);
    procedure cbUseLineCorrectionClick(Sender: TObject);
    procedure cboxSoftBinYChange(Sender: TObject);
    procedure rgReadModeChange(Sender: TObject);
    procedure btnVScaleTriGraphClick(Sender: TObject);
    procedure btnAutoscaleTriGraphClick(Sender: TObject);
    procedure btnAverClick(Sender: TObject);
    procedure cboxADChannelChange(Sender: TObject);
    procedure cboxOutputAmplifierChange(Sender: TObject);
    procedure cboxHSpeedChange(Sender: TObject);
    procedure cboxPreAmpGainChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure R1Click(Sender: TObject);
    procedure S4Click(Sender: TObject);
    procedure btnFanModeOnClick(Sender: TObject);
    procedure btnFanModeOffClick(Sender: TObject);
    procedure S6Click(Sender: TObject);
    procedure btnFindLaser680Click(Sender: TObject);
    procedure btnLaser680PowOffClick(Sender: TObject);
    procedure btnLaser680PowOnClick(Sender: TObject);
    procedure spinedtLaser680PowerKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnLaser680SetPowClick(Sender: TObject);
    procedure trbLaser680PowerChange(Sender: TObject);


  private //Images
    { Private declarations }

    procedure OnChangeBordersIGraph(Sender:TObject);
    procedure OnChangeBordersHGraph(Sender:TObject);
    procedure OnChangeBordersVGraph(Sender:TObject);

    procedure OnOverColRowIGraph(Sender:TObject; const ACol, ARow:integer);
    procedure OnOverColRowHVGraph(Sender:TObject; const ACol, ARow:string);
    procedure OnSelectColRowIGraph(Sender:TObject; const ACol, ARow:integer);

    procedure RepaintIntensityIGraph;
    procedure RepaintHVGraph;
    procedure Autoscale;
    procedure AutoscaleVert;

  private  //Andor
    isTakeBG:Boolean;

    procedure OnImageMessage(var Msg: TMessage); message WM_ANDOR_IMG;
    procedure OnCalcImage(var Msg: TMessage); message WM_ANDOR_CALCIMG;
    procedure OnScanImage(var Msg: TMessage); message WM_ANDOR_SCANNING;
    procedure OnStartImage(var Msg: TMessage); message WM_ANDOR_START;
    procedure OnStopImage(var Msg: TMessage); message WM_ANDOR_STOP;
    procedure OnStartScan(var Msg: TMessage); message WM_SCAN_START;
    procedure OnFinishScan(var Msg: TMessage); message WM_SCAN_FINISH;
    procedure OnScanBeforeFrame(var Msg: TMessage); message WM_SCAN_BEF_FRAME;
    procedure OnScanAfterFrame(var Msg: TMessage); message WM_SCAN_AFT_FRAME;
    procedure OnProgress(var Msg: TMessage); message WM_PROGRESS;


    procedure FindAndor;
    procedure SetSystem;
    procedure SetSystemForBG(BGtype:TBGType);
    procedure SetTimings;
    procedure UpdateTimings;
    procedure UpdateADControls;

    procedure RecalcSoftBin;
    function CalcSNR(const fromPix, toPix:Integer ):Single;

    procedure Log(str: string);

  public
    { Public declarations }
    ExpBGlayer:Integer;
    expN :Integer;
    expTstart, expTfinish, expK :Single;

    IGraph:TIGraph;
    HGraph:THGraph;
    VGraph: TVGraph;
    Andor:TAndor;

    XScaleUnits:TXscaleUnits;
    YScaleUnits:TYscaleUnits;

    Laser:TLaserRBOXX;
    Laser680:TLaser680;

    Controller:TControllerM;
    FrameData:TFrameData;
    BackgroundType: TBGType;

    selectedRow, selectedCol:integer;
    isFirstFrame:boolean;

    progressPcnt:Single;

    procedure CalcData;
    procedure PlotData;

    procedure SaveToCSV(const FileName:string; ACol, ARow:integer);
    procedure SaveAllToCSV(const FileName:string);
    procedure RescaleTriGraph;
    procedure FillPalette(plType:TPalette);

  private //Laser
    procedure OnLaserConnect(Sender:TObject);
    procedure OnLaserDisconnect(Sender:TObject);
    procedure InitLaserControls;
    procedure OnChangeMode;
    procedure UpdateLaserLabels;
    procedure UpdateLaser680Labels;

    procedure OnLaser680Connect(Sender:TObject);
    procedure OnLaser680Disconnect(Sender:TObject);
    procedure InitLaser680Controls;

  private //Controller
    procedure OnControllerConnect(Sender:TObject);
    procedure OnControllerDisconnect(Sender:TObject);
    procedure OnControllerMotoDone(Sender:TObject; ev: TMotoDoneEv);
    procedure OnControllerFWDone(Sender:TObject; ev: TMotoDoneEv);
    procedure OnControllerSlitDone(Sender:TObject; ev: TMotoDoneEv);


    procedure BlinkES(idx:integer);
    procedure CheckXYZcalibration;
  public
    procedure UpdateFilterWheelLabels;
    procedure UpdateControllerLabels;
    procedure UpdatePowerOnSample;
    procedure InitControllerControls;

  public
//    Toupcam: TdevToupcam;
     ToupcamG: TdevToupcamG;
//    procedure OnMsgCamEvent(var Msg: TMessage); message MSG_CAMEVENT;
//    procedure CamPaint(var Msg:TMessage); message WM_CCDPAINT;

  public
    DCMotor:TDCMotor;

    Viewer: TViewer;

    FormScan: TFormScan;
    FormScan1:TFormScan;
  end;

var
  formMain: TformMain;
  firstTimeRun:boolean=true;
  tprev:cardinal;

  FormCCD,FormCCD2: TFormCCD;

var canChange:boolean = True;
      isNeedAutoscale:boolean = True;

implementation

{$R *.dfm}

uses Log, ControllerSettings, uWelcome, uSetttings, uBGwait, uProgress, libToupcam, DCMotorSettings;

procedure TformMain.A1Click(Sender: TObject);
begin
if IGraph.isLoaded then
  begin
  SaveDialog.Filter:='csv|*.csv';
  SaveDialog.DefaultExt:='csv';
  SaveDialog.FileName:='PlotData';

  if SaveDialog.Execute then
     SaveAllToCSV(SaveDialog.FileName);
  end
else
  sShowMessage('No data');
end;

procedure TformMain.ApplicationEvents1Message(var Msg: tagMSG;
  var Handled: Boolean);
var mousePos: TPoint;
wc: TWinControl;
begin
if Msg.message = WM_MOUSEWHEEL then
  begin
  mousePos.X := Word(Msg.lParam);
  mousePos.Y := HiWord(Msg.lParam);
  wc := FindVCLWindow(mousePos);

  if wc = nil then
     Handled := True
  else
      if wc.Handle <> Msg.hwnd then
      begin
      SendMessage(wc.Handle, WM_MOUSEWHEEL, Msg.wParam, Msg.lParam);
      Handled := True;
      end;
 end;
end;

procedure TformMain.Autoscale;
begin

    IGraph.minX:=0;
    IGraph.maxX:= FrameData.DataS.Width;
    IGraph.minY:=0;
    IGraph.maxY:= FrameData.DataS.Height;

    HGraph.MinX:=IGraph.minX;
    HGraph.MaxX:=IGraph.maxX;
    HGraph.MinY:=FrameData.minV;
    HGraph.MaxY:=FrameData.maxV;

    VGraph.MinY:=IGraph.minY;
    VGraph.MaxY:=IGraph.maxY;
    VGraph.MinX:=FrameData.minV;
    VGraph.MaxX:=FrameData.maxV;

    HGraph.SetLimits(IGraph.MinX, IGraph.MaxX);
    VGraph.SetLimits(IGraph.MinY, IGraph.MaxY);

    RepaintIntensityIGraph;
    RepaintHVGraph;
end;

procedure TformMain.AutoscaleVert;
begin
if  IGraph.isLoaded then
  begin
    // RepaintIntensityIGraph;

      HGraph.minY:=FrameData.minV;
      HGraph.maxY:=FrameData.maxV;

      VGraph.minX:=FrameData.minV;
      VGraph.maxX:=FrameData.maxV;

      RepaintHVGraph;
      RepaintIntensityIGraph;

  end;
end;

procedure TformMain.BlinkES(idx: integer);
begin
TTask.Run(procedure
     var i:Integer;
     begin
     for i:=0 to 2 do
         begin
           //if idx=1 then
          pnlES.Color:=clRed; //else pnlES.Color:=clRed;
          sleep(200);
           //           if idx=1 then
          pnlES.Color:=clMenuText; //else pnlES2.Color:=clMenuText;

          sleep(200);
         end;

     end);
end;

procedure TformMain.btnAbortAcqClick(Sender: TObject);
begin
 Andor.AbortAcquisition;
end;

procedure TformMain.btnBackgroundClick(Sender: TObject);
begin
FormWaitBG.Show;
isTakeBG:=True;
SetSystemForBG(BackgroundType);
Andor.StartAcquisition;

end;

procedure TformMain.btnBFdwnClick(Sender: TObject);
var tmp:Integer;
begin

try
tmp:=StrToInt(cboxBFStep.Text);

TTask.Run(procedure()
          begin
          Controller.BF.FCritSection.Acquire;
          Controller.BF.MovRel(-tmp);
          Controller.BF.FCritSection.Release;
          end);
except
//Log('Step value incorrect!');
end;

end;

procedure TformMain.btnBFupClick(Sender: TObject);
var tmp:Integer;
begin

try
tmp:=StrToInt(cboxBFStep.Text);

TTask.Run(procedure()
          begin
          Controller.BF.FCritSection.Acquire;
          Controller.BF.MovRel(tmp);
          Controller.BF.FCritSection.Release;
          end);
except
//Log('Step value incorrect!');

end;
end;

procedure TformMain.btnCoolerOffClick(Sender: TObject);
begin
 Andor.CoolerOFF;
end;

procedure TformMain.btnCoolerOnClick(Sender: TObject);
begin
if Andor.SetFanMode(fanOnFull) then
   Andor.CoolerON;
end;

procedure TformMain.btnFanModeOffClick(Sender: TObject);
begin
if  Andor.CoolerOFF then

Andor.SetFanMode(fanOff);
end;

procedure TformMain.btnFanModeOnClick(Sender: TObject);
begin
Andor.SetFanMode(fanOnFull);

end;

procedure TformMain.btnFindControllerClick(Sender: TObject);
begin
TTask.Run(procedure
          begin
          Controller.DisconnectControllers;
          OnControllerDisconnect(self);

          Controller.FindControllers;
          if Controller.CheckControllers then
           begin
           //Controller.InitParams;
           OnControllerConnect(self);
           InitControllerControls;
           end;
          end);
end;

procedure TformMain.btnFindLaser680Click(Sender: TObject);
begin
TTask.Run(procedure
          begin
          if Laser680.FindLaser then
           begin
           Laser680.InitParams;
           InitLaser680Controls;
           end;
          end);
end;

procedure TformMain.btnFindLaserClick(Sender: TObject);
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

procedure TformMain.btnFlip1DownClick(Sender: TObject);
begin
TTask.Run(procedure
    begin
     Controller.Periph.Flip1:=False;
    end);
end;

procedure TformMain.btnFlip1UpClick(Sender: TObject);
begin
TTask.Run(procedure
    begin
     Controller.Periph.Flip1:=True;
    end);
end;

procedure TformMain.btnFlip2DownClick(Sender: TObject);
begin
TTask.Run(procedure
    begin
     Controller.Periph.Flip2:=False;
    end);
end;

procedure TformMain.btnFlip2UpClick(Sender: TObject);
begin
TTask.Run(procedure
    begin
     Controller.Periph.Flip2:=True;
    end);
end;

procedure TformMain.btnFWcalClick(Sender: TObject);
begin
  Controller.FilterWheel.DoCalibration;
end;

procedure TformMain.btnLaser680PowOffClick(Sender: TObject);
begin
Laser680.SetOnOff(false);
end;

procedure TformMain.btnLaser680PowOnClick(Sender: TObject);
begin
Laser680.SetOnOff(true);
end;

procedure TformMain.btnLaser680SetPowClick(Sender: TObject);
begin
Laser680.SetPower(spinedtLaser680Power.Value);
end;

procedure TformMain.btnLaserOpModeCCurrClick(Sender: TObject);
begin
    if Laser.CM_MODE=Modulation then
      Laser.SetModulation(False);
   Laser.SetMode(AutoCurCtrl);
   OnChangeMode;
end;

procedure TformMain.btnLaserOpModeCPowerClick(Sender: TObject);
begin
   if Laser.CM_MODE=Modulation then
      Laser.SetModulation(False);
    Laser.SetMode(AutoPowCtrl);
    OnChangeMode;
end;

procedure TformMain.btnLaserOpModeModulationClick(Sender: TObject);
begin
   if Laser.CM_MODE<>Modulation then
      Laser.SetMode(AutoCurCtrl);
   Laser.SetModulation(True);
     OnChangeMode;
end;

procedure TformMain.btnLaserPowOffClick(Sender: TObject);
begin
  Laser.SetOnOff(false);
end;

procedure TformMain.btnLaserPowOnClick(Sender: TObject);
begin
   Laser.SetOnOff(true);
end;

procedure TformMain.btnLaserSetBiasClick(Sender: TObject);
begin
  Laser.SetBias(spinedtLaserBias.Value);
end;

procedure TformMain.btnLaserSetPowClick(Sender: TObject);
begin
Laser.SetPower(spinedtLaserPower.Value);
end;

procedure TformMain.btnLineClick(Sender: TObject);
begin
TTask.Run(procedure
    begin
     Controller.Periph.Flip1:=False;
     Controller.Periph.Flip2:=False;
    end);
end;

procedure TformMain.btnPlotImageClick(Sender: TObject);
begin

if not FrameData.Allocated then Exit;

CalcData;
isFirstFrame:=True;
PlotData;
end;

procedure TformMain.btnPlotQEClick(Sender: TObject);
var
    i:Integer;
begin
if not FrameData.Allocated then Exit;

for i := 0 to FrameData.DataS.Width-1 do
 HGraph.Curve[0].data.y[i]:=1/FrameData.AndorQE[i];

 HGraph.RepaintGraph;
 HGraph.AutoScaleAllLocal;
end;

procedure TformMain.btnPointClick(Sender: TObject);
begin
TTask.Run(procedure
    begin
     Controller.Periph.Flip1:=True;
     Controller.Periph.Flip2:=True;
    end);
end;

procedure TformMain.btnSendCmdClick(Sender: TObject);
begin
 Laser.Send(sEdit1.Text);
end;

procedure TformMain.btnSetAccumTimeClick(Sender: TObject);
var run:boolean;
begin
run:=andor.Running;
if run then
   Andor.AbortAcquisition;

SetTimings;
UpdateTimings;

if run then
   Andor.StartAcquisition;
end;

procedure TformMain.btnSetExposureClick(Sender: TObject);
var run:boolean;
begin
run:=andor.Running;
if run then
   Andor.AbortAcquisition;
SetTimings;
UpdateTimings;

if run then
   Andor.StartAcquisition;
end;

procedure TformMain.btnSetTemperatureClick(Sender: TObject);
begin
Andor.SetTemperature(edtSetTemperature.Value);
end;

procedure TformMain.btnSlitCalClick(Sender: TObject);
begin
TTask.Run(procedure
    begin
    Controller.Slit.DoCalibration;
    end);
end;

procedure TformMain.btnSlitSetClick(Sender: TObject);
begin
TTask.Run(procedure
    begin
    Controller.Slit.SlitMicrons:=edtSlit.Value;
    end);
end;

procedure TformMain.btnStartAcqClick(Sender: TObject);
begin
ExpBGlayer:=-1;
Andor.StartAcquisition;
end;

procedure TformMain.btnStepperSettingsClick(Sender: TObject);
begin
FormControllerSettings.Show;
end;

procedure TformMain.btnXYZcalClick(Sender: TObject);
begin
  TTask.Run(procedure
    begin
    Controller.MotX.CalR1;
    Controller.MotY.CalR1;
    Controller.MotZ.CalR1;
    end);
end;

procedure TformMain.CalcData;
const kpd = 0.92;
      h = 6.62607041E-34;
      c = 2.99792458E8;
      hc=h*c;
      NAvogadro = 6.022140857E23; {mol-1}
      pi = 3.14159265359;

var calcLine, firstLine:TNumArray1<Single>;
    i,j,k:Integer;
    scale:Single;

  begin
  calcLine:=TNumArray1<Single>.Create(nil, FrameData.CalcData.Width);
    try

                   //CalcData = DataS - DataBG
    if ExpBGlayer<0 then
    NumSub( FrameData.DataBG, FrameData.DataS, FrameData.CalcData)
    else
    NumSub( FrameData.DataBGarray[ExpBGlayer], FrameData.DataS, FrameData.CalcData);


    //QE correction
    if cbUseQE.Checked then
      begin

        for i := 0 to FrameData.CalcData.Height-1 do
         begin
         FrameData.CalcData.SingleRow(i, calcLine);
         NumMul( calcLine, FrameData.AndorQE);
         end;

      end;


    //Calibration Y
    if FrameData.UseCalY then
      begin
        for i := 0 to FrameData.CalcData.Height-1 do
         begin
         FrameData.CalcData.SingleRow(i, calcLine);
         NumMul( calcLine, FrameData.CalYsized);
         end;

      end;


      //Line Correction
       if cbUseLineCorrection.Checked then
          case FrameData.lineCorr.usedType of
          1: begin    //Default
              for i := 0 to FrameData.CalcData.Height-1 do
               begin
               scale:=0.0;

               for j := i*Andor.BinY to (i+1)*Andor.BinY-1 do
                 scale:=scale+FrameData.lineCorr.Def.Values[j];
               scale:=scale/Andor.BinY;

               FrameData.CalcData.SingleRow(i, calcLine);
               NumMulC(calcLine, 1.0/scale);
               end;
             end;

          2: begin    //User
              for i := 0 to FrameData.CalcData.Height-1 do
               begin
               scale:=0.0;

               for j := i*Andor.BinY to (i+1)*Andor.BinY-1 do
                 scale:=scale+FrameData.lineCorr.Usr.Values[j];
               scale:=scale/Andor.BinY;

               FrameData.CalcData.SingleRow(i, calcLine);

               if scale<>0 then
               NumMulC(calcLine, 1.0/scale);
               end;
             end;
          end;

      if Andor.SoftBinY>1 then
       begin
        firstLine:=TNumArray1<Single>.Create( FrameData.CalcData.Width);

         for j := 0 to (Andor.Ydim div Andor.SoftBinY) -1 do
            begin
              NumSet(0.0,firstLine);

              for i := 0 to Andor.SoftBinY-1 do
                begin
                FrameData.CalcData.SingleRow(j*Andor.SoftBinY+i, calcLine);
                NumAdd(calcLine,firstLine);
                end;

              for i := 0 to Andor.SoftBinY-1 do
                begin
                FrameData.CalcData.SingleRow(j*Andor.SoftBinY+i, calcLine);
                NumCopy(firstLine,calcLine);
                end;
             end;

         firstLine.Free;
       end;

      if Andor.SoftBinX>1 then
       begin
        firstLine:=TNumArray1<Single>.Create( FrameData.CalcData.Height);

         for j := 0 to (Andor.Xdim div Andor.SoftBinX) -1 do
            begin
              NumSet(0.0, firstLine);

              for i := 0 to Andor.SoftBinX-1 do
               for k := 0 to FrameData.CalcData.Height-1 do
                firstLine[k]:=firstLine[k]+FrameData.CalcData[k,j*Andor.SoftBinX+i];

              for i := 0 to Andor.SoftBinX-1 do
               for k := 0 to FrameData.CalcData.Height-1 do
                FrameData.CalcData[k,j*Andor.SoftBinX+i] := firstLine[k];
             end;

         firstLine.Free;

       end;

      if (Andor.AcquisitionMode=amAccumulate) or (Andor.AcquisitionMode=amKineticSeries) then
        NumMulC(FrameData.CalcData, 1.0/Andor.AccumNumber);

    if Andor.ReadMode=rmRandomTrack then
       begin
       j:=0;
       for i := 0 to High(Andor.RandomTrackParams) do
          if Andor.RandomTrackParams[i].used then
                   begin
                    FrameData.CalcData.SingleRow(j, calcLine);
                    NumMulC( calcLine, Andor.RandomTrackParams[i].koef );
                    Inc(j);
                   end;

       end;


      case  YScaleUnits of
        ysADU: ;
        ysWatt: begin    {femtoWatt}
//                scale:=2.14/kpd/Andor.ExposureTime;
//                NumMulC(FrameData.CalcData, scale );

                  scale := Andor.PreamplifierGain*hc/Andor.ExposureTime* 1E15 {fWatt} /1E-9{nm};
                  NumMulC(FrameData.CalcData, scale );

                  for i := 0 to FrameData.CalcData.Height-1 do
                   begin
                    FrameData.CalcData.SingleRow(i, calcLine);
                    NumDiv( calcLine, FrameData.ScaleNm );
                   end;

                end;
        ysPhotons: begin
//                scale:=2.14/kpd/hc * 1E-9{nm}*1E-15{fWatt} ;
//                NumMulC(FrameData.CalcData, scale );
//
//                for i := 0 to FrameData.CalcData.Height-1 do
//                   begin
//                    FrameData.CalcData.SingleRow(i, calcLine);
//                    NumMul(calcLine, FrameData.ScaleNm);
//                   end;

                  scale:=Andor.PreamplifierGain;
                  NumMulC(FrameData.CalcData, scale );

                end;

        ysWattRelative:
                begin    {femtoWatt/Watt}
//                scale:=2.14/kpd/Andor.ExposureTime/FrameData.PowerOnSample;
//                NumMulC(FrameData.CalcData, scale );

                  scale := Andor.PreamplifierGain*hc/1E-9{nm}/Andor.ExposureTime /FrameData.PowerOnSample* 1E15 {fWatt}/FrameData.csSystemThroughput/ FrameData.csSampleAttenuation;
                  NumMulC(FrameData.CalcData, scale );

                  for i := 0 to FrameData.CalcData.Height-1 do
                   begin
                    FrameData.CalcData.SingleRow(i, calcLine);
                    NumDiv( calcLine, FrameData.ScaleNm );
                   end;

                end;

        ysPhotonsRelative:
                begin
//                scale:=2.14/kpd/Andor.ExposureTime *1E-15{fWatt}/FrameData.PowerOnSample/FrameData.LaserNm;
//                NumMulC(FrameData.CalcData, scale );
//
//                for i := 0 to FrameData.CalcData.Height-1 do
//                   begin
//                    FrameData.CalcData.SingleRow(i, calcLine);
//                    NumMul(calcLine, FrameData.ScaleNm);
//                   end;

                  scale := Andor.PreamplifierGain*hc/(FrameData.LaserNm *1E-9{nm} * Andor.ExposureTime *FrameData.PowerOnSample )/FrameData.csSystemThroughput/ FrameData.csSampleAttenuation* 1E15 {fWatt};
                  NumMulC(FrameData.CalcData, scale );
                end;

        ysCrossSection:
                begin
//                scale:=2.14/kpd/Andor.ExposureTime *1E-15{fWatt}/FrameData.PowerOnSample/FrameData.LaserNm;
//                scale:=scale*2*pi*(1-sqrt(1- Sqr(FrameData.csNA/FrameData.csRI)))* FrameData.csMolecularWeight/FrameData.csDensity/FrameData.csPSF/NAvogadro;
//
//                NumMulC(FrameData.CalcData, scale );
//
//                for i := 0 to FrameData.CalcData.Height-1 do
//                   begin
//                    FrameData.CalcData.SingleRow(i, calcLine);
//                    NumMul(calcLine, FrameData.ScaleNm);
//                   end;

                  scale := Andor.PreamplifierGain*hc/(FrameData.LaserNm *1E-9{nm} * Andor.ExposureTime *FrameData.PowerOnSample )/FrameData.csSystemThroughput/ FrameData.csSampleAttenuation;
                  scale:=scale*4*pi*(1-sqrt(1- Sqr(FrameData.csNA/FrameData.csRI)))* FrameData.csMolecularWeight/FrameData.csDensity/FrameData.csPSF/NAvogadro;
                  NumMulC(FrameData.CalcData, scale );

                end;

        ysCrossSectionSERS:
                begin
//                scale:=2.14/kpd/Andor.ExposureTime *1E-15{fWatt}/FrameData.PowerOnSample/FrameData.LaserNm;
//                scale:=scale*2*pi*(1-sqrt(1- Sqr(FrameData.csNA/FrameData.csRI)))* FrameData.csMolecularWeight/FrameData.csDensity/FrameData.csSERSmonolayer/NAvogadro;
//
//                NumMulC(FrameData.CalcData, scale );
//
//                for i := 0 to FrameData.CalcData.Height-1 do
//                   begin
//                    FrameData.CalcData.SingleRow(i, calcLine);
//                    NumMul(calcLine, FrameData.ScaleNm);
//                   end;

                  scale := Andor.PreamplifierGain*hc/(FrameData.LaserNm *1E-9{nm} * Andor.ExposureTime *FrameData.PowerOnSample )/FrameData.csSystemThroughput/ FrameData.csSampleAttenuation;
                  scale:=scale*4*pi*(1-sqrt(1- Sqr(FrameData.csNA/FrameData.csRI)))* FrameData.csMolecularWeight/FrameData.csDensity/FrameData.csSERSmonolayer/NAvogadro;
                  NumMulC(FrameData.CalcData, scale );

                end;

      end;

     finally
     calcLine.Free;
     end;

  end;

function TformMain.CalcSNR(const fromPix, toPix: Integer): Single;
const window = 5;
var Xmean, Ymean:Single;
   arrX, arrY, arrAver:TNumArray1<Single>;
   i,j,len:Integer;
   tmp:Double;
   min,max:single;
   a, a1, b ,c, c1:Double;

begin
with HGraph.Curve[0] do
  begin
    if (fromPix<data.x.Count) and (toPix<data.x.Count) then
     begin
     len:= toPix-fromPix+1;
     arrX:=TNumArray1<Single>.Create(len);
     arrY:=TNumArray1<Single>.Create(len);
     arrAver:=TNumArray1<Single>.Create(len);


//     HGraph.DeleteCurve('aver');
//     HGraph.CreateCurve('aver', clBlue, len);
//     NumCopy(arrAver, HGraph.Curve[1].data.y);


     tmp:=0;
     for i := 0 to len-1 do
       begin
       arrX[i]:=data.x[i+fromPix];
       arrY[i]:=data.y[i+fromPix];
       end;

     for i := 0 to len-1 do
     begin
     tmp:=0;
      for j := 0 to window-1 do
       begin
       tmp:=tmp+ data.y[i+j+fromPix];
       end;
       arrAver[i]:=tmp/window;
     end;

     tmp:=0.0;
     for i := 0 to len-1 do
       tmp:=tmp+sqr(arrAver[i]-arrY[i]);

     result:=Sqrt(tmp/(len-1));

//     log('RMSnoise='+result.ToString);

     NumMinMax(arrY, min, max);

     if Result<>0 then
     result:=max/result
     else Result:=0;

//     log('SNR='+result.ToString);

      arrX.Free;
     arrY.Free;
     arrAver.Free;
     end;

  end;

end;

//procedure TformMain.CamPaint(var Msg: TMessage);
//var pHeader:PBITMAPINFOHEADER;
//    pData:PByte;
//begin
//    pHeader:=nil;
//    pData:=nil;
//   if Toupcam.GetData(@pHeader, @pData) then
//      begin
//      Toupcam.ievCCD.io.LoadFromBuffer(pData,pHeader.biWidth*pHeader.biHeight*3, ioBMPRAW );
//      end;
//end;

procedure TformMain.cboxADChannelChange(Sender: TObject);
begin
if canChange then
  begin
  Andor.SetADChannel(cboxADChannel.ItemIndex);
  UpdateADControls;
  end;
end;

procedure TformMain.cboxBinXChange(Sender: TObject);
var run:boolean;
begin
run:=andor.Running;
if run then
   Andor.AbortAcquisition;

SetSystem;

if run then
   Andor.StartAcquisition;
end;

procedure TformMain.cboxHSpeedChange(Sender: TObject);
begin
if canChange then
  begin
  Andor.SetHSSpeed(cboxHSpeed.ItemIndex);
  Andor.SetPreAmpGain(0);

  UpdateADControls;
  end;
end;

procedure TformMain.cboxOutputAmplifierChange(Sender: TObject);
begin
if canChange then
  begin
  Andor.SetOutAmplifier(cboxOutputAmplifier.ItemIndex);
  UpdateADControls;
  end;
end;

procedure TformMain.cboxPreAmpGainChange(Sender: TObject);
begin
if canChange then
  begin
  Andor.SetPreAmpGain(cboxPreAmpGain.ItemIndex);
  UpdateADControls;
  end;
end;

procedure TformMain.cboxSoftBinYChange(Sender: TObject);
begin
Andor.SetSoftBinning(StrToIntDef(cboxSoftBinX.Items[cboxSoftBinX.ItemIndex],1), StrToIntDef(cboxSoftBinY.Items[cboxSoftBinY.ItemIndex],1));
isNeedAutoscale:=false;
btnPlotImage.OnClick(nil);
isNeedAutoscale:=True;
end;

procedure TformMain.cbUseLineCorrectionClick(Sender: TObject);
begin
isNeedAutoscale:=false;
btnPlotImage.OnClick(nil);
isNeedAutoscale:=True;
end;

procedure TformMain.cbUseQEClick(Sender: TObject);
begin
isNeedAutoscale:=false;
btnPlotImage.OnClick(nil);
isNeedAutoscale:=True;
end;

procedure TformMain.CheckXYZcalibration;
var
    buttonSelected : Integer;
begin
if Controller.MotX.CanUseLastPosition and
   Controller.MotY.CanUseLastPosition and
   Controller.MotZ.CanUseLastPosition then

  StatusBarController.Panels[1].Text:='Microscope calibrated'
  else
    begin
    buttonSelected := MessageDlg('Calibrate microscope stage',mtWarning, mbOKCancel, 0);
    if buttonSelected = mrCancel then   StatusBarController.Panels[1].Text:='Microscope uncalibrated!';
     if buttonSelected = mrOK  then
         begin
         buttonSelected := MessageDlg('Remove disk from sample compartment',mtWarning, [mbOK], 0);
         if buttonSelected = mrOK  then
              begin
//              ShowMessage('Calibration');
              Controller.MotX.CalR1;
              sleep(50);
              Controller.MotY.CalR1;
              sleep(50);
              Controller.MotZ.CalR1;
              end;

         end;
    end;
end;


procedure TformMain.E1Click(Sender: TObject);
begin
Close;
end;

procedure TformMain.edtAccumulationNumberChange(Sender: TObject);
var run:boolean;
begin
run:=andor.Running;
if run then
   Andor.AbortAcquisition;
SetSystem;
if run then
   Andor.StartAcquisition;
end;

procedure TformMain.edtAccumulationTimeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=VK_RETURN then
  if Assigned(btnSetAccumTime.OnClick) then
      btnSetAccumTime.OnClick(Self);
end;

procedure TformMain.edtExposureKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=VK_RETURN then
  if Assigned(btnSetExposure.OnClick) then
      btnSetExposure.OnClick(Self);
end;

procedure TformMain.edtKineticNumberChange(Sender: TObject);
var run:boolean;
begin
run:=andor.Running;
if run then
   Andor.AbortAcquisition;
SetSystem;
if run then
   Andor.StartAcquisition;
end;

procedure TformMain.edtSetTemperatureKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key=VK_RETURN then
  if Assigned(btnSetTemperature.OnClick)  then
      btnSetTemperature.OnClick(Self);
end;

procedure TformMain.edtSingleTrackCentreChange(Sender: TObject);
var run:boolean;
begin
run:=andor.Running;
if run then
   Andor.AbortAcquisition;

SetSystem;

if run then
   Andor.StartAcquisition;
end;

procedure TformMain.edtSingleTrackHighChange(Sender: TObject);
var run:boolean;
begin
run:=andor.Running;
if run then
   Andor.AbortAcquisition;

SetSystem;

if run then
   Andor.StartAcquisition;
end;

procedure TformMain.edtSlitKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key=13 then
  if Assigned(btnSlitSet.OnClick) then
      btnSlitSet.OnClick(Self);
end;

procedure TformMain.FillPalette(plType: TPalette);
var
  I: Integer;
  v:Integer;
begin
case plType of
  plGray:for I := 0 to PaintBoxPalette.Height-1 do
         begin
          v:=255-Round(i/PaintBoxPalette.Height*255);
          PaintBoxPalette.Buffer.Line(0,i,PaintBoxPalette.Width-1,i, Gray32(v)) ;
         end;
  plWYRB:for I := 0 to PaintBoxPalette.Height-1 do
         begin
          v:=255-Round(i/PaintBoxPalette.Height*255);
          PaintBoxPalette.Buffer.Line(0,i,PaintBoxPalette.Width-1,i, IGraph.WYRB(v)) ;
         end;
  plWYRGBB:for I := 0 to PaintBoxPalette.Height-1 do
         begin
          v:=255-Round(i/PaintBoxPalette.Height*255);
          PaintBoxPalette.Buffer.Line(0,i,PaintBoxPalette.Width-1,i, IGraph.WYRGBB(v)) ;
         end;
  plRYGLB:for I := 0 to PaintBoxPalette.Height-1 do
         begin
          v:=255-Round(i/PaintBoxPalette.Height*255);
          PaintBoxPalette.Buffer.Line(0,i,PaintBoxPalette.Width-1,i, IGraph.RYGLB(v)) ;
         end;
  plDRYGLBD:for I := 0 to PaintBoxPalette.Height-1 do
         begin
          v:=255-Round(i/PaintBoxPalette.Height*255);
          PaintBoxPalette.Buffer.Line(0,i,PaintBoxPalette.Width-1,i, IGraph.DRYGLBD(v)) ;
         end;
end;
PaintBoxPalette.Invalidate;


end;

procedure TformMain.FindAndor;
var
    i,num, maxBinX, maxBinY:integer;
    test,test2:Cardinal;
begin
num:= Andor.GetAvailableCameras;
Log('CamNum = '+ IntToStr( num));

if num>0 then
 for i:=0 to num-1 do
   Log( IntToStr( Andor.HandleArray[i]));

if num>0 then
if Andor.SelectCameraByIdx(-1) then     //any present
  begin
  Log('Initializing Andor MCD system');
  Andor.Initialize;

  Andor.InitializeSpeeds;
  UpdateADControls;

  Andor.GetCapabilities;
  if Andor.GetHeadModel then
     Log(Format('HeadModel-%s',[Andor.Model]) );

  if Andor.GetDetector then
   Log(Format('Size of CCD: %d x %d pixels',[Andor.gblXPixels, Andor.gblYPixels]) );

  Andor.GetInfo;

  //Set binning params
  maxBinX:=Andor.MaxBinX;
  maxBinY:=Andor.MaxBinY;

  cboxBinX.Items.Clear;
  cboxBinY.Items.Clear;

  for i := 1 to Andor.gblXPixels do
     begin
     if i>maxBinX then Break;

     if (Andor.gblXPixels mod i=0) then
       cboxBinX.Items.Add( i.ToString);
     end;

  for i := 1 to Andor.gblYPixels do
     begin
     if i>maxBinY then Break;
     if (Andor.gblYPixels mod i=0) then
       cboxBinY.Items.Add(i.ToString);
     end;

  edtSingleTrackCentre.MaxValue:= maxBinY;
  edtSingleTrackHigh.MaxValue:=maxBinY;

  cboxBinX.ItemIndex:=0;
  cboxBinY.ItemIndex:=0;

  Andor.GetTemperatureRange;

  if Andor.SetFanMode(fanOnFull) then
  Andor.CoolerON;

  Andor.SetTemperature(-70);

  SetSystem;

  cboxSoftBinX.ItemIndex:=0;
  cboxSoftBinY.ItemIndex:=0;
    // Wait for 2 seconds to allow MCD to calibrate fully before allowing an
  // acquisition to begin
    test:=GetTickCount();
    repeat
      test2:=GetTickCount()-test;
    until (test2>1000) ;

  Timer1sec.Enabled:=true;
  end;

  FormWelcome.Close;

end;

procedure TformMain.FormActivate(Sender: TObject);
begin
if firstTimeRun then
  begin
  IGraph.OnChangeBorders:=OnChangeBordersIGraph;
  HGraph.OnChangeBorders:=OnChangeBordersHGraph;
  VGraph.OnChangeBorders:=OnChangeBordersVGraph;

  IGraph.OnSelectColRow:=OnSelectColRowIGraph;
  IGraph.OnOverColRow:=OnOverColRowIGraph;
  HGraph.OnOverColRow:=OnOverColRowHVGraph;
  VGraph.OnOverColRow:=OnOverColRowHVGraph;

  Controller.FilterWheel.LoadSettings;
  Controller.Slit.LoadSettings;
  Controller.Periph.LoadSettings;

  FormCCD.LoadSettings;
  FormScan.LoadSettings;
//  FormCCD2.LoadSettings;

//  if
//   Toupcam.FindDevice;
//  ToupcamG.Show;


//   then   Toupcam.OpenDevice;

  UpdateFilterWheelLabels;

  FormSettings.LoadLayouts;
  FrameData.LoadLineCorrection;
  FormSettings.LoadOther;
  FillPalette(IGraph.Palette);

  Application.ProcessMessages;
{  TTask.Run(procedure
            begin
             FindAndor;
            end);


   TTask.Run(procedure
          begin
             if DCMotor.Find then
              if DCMotor.Open then
                  begin
                  DCMotor.InitMotor;
                  end;

          Sleep(5000);

          Controller.FindControllers;
          if Controller.CheckControllers then
           begin
           OnControllerConnect(Self);
          // Controller.InitParams;
           InitControllerControls;

           Controller.Slit.DoCalibration;

           Controller.FilterWheel.DoCalibration;

//           CheckXYZcalibration;

           end;

           if Laser.FindLaser then
           begin
           Laser.InitParams;
           InitLaserControls;
           end;

          if Laser680.FindLaser then
           begin
           Laser680.InitParams;
           InitLaser680Controls;
           end;

          end);
}

  tprev:=GetTickCount;
  firstTimeRun:=false;
  end;
end;

procedure TformMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var t1:Single;
  i: Integer;
begin
FormSettings.SaveLayouts;

if Andor.CoolerOFF then

//t1:=Andor.Temperature;
//for i := 0 to 40 do
//   begin
//  Sleep(100);
//  Application.ProcessMessages;
//  end;
//if Andor.Temperature > t1 then
Andor.SetFanMode(fanOff);

Andor.ShutDown;
Andor.FreeBuffers;

FormCCD.CamDisconnect;
//FormCCD2.CamDisconnect;

Controller.SaveXYZpos;

sleep(100);
Controller.FilterWheel.SaveSettings;
Controller.Slit.SaveSettings;
Controller.Periph.SaveSettings;

FormCCD.SaveSettings;
FormScan.SaveSettings;
//FormCCD2.SaveSettings;
//Toupcam.CloseDevice;
ToupcamG.Free;

Laser.CloseLaser;
Laser680.CloseLaser;

DCMotor.SetDisable;

Controller.DisconnectControllers;
//if (checkTemperatureRizing) then
    CanClose:=true;

end;

procedure TformMain.FormCreate(Sender: TObject);
begin
Laser:=TLaserRBOXX.Create;
Laser.OnConnect:=OnLaserConnect;
Laser.OnDisconnect:=OnLaserDisconnect;
OnLaserDisconnect(Self);

Laser680:=TLaser680.Create;
Laser680.OnConnect:=OnLaser680Connect;
Laser680.OnDisconnect:=OnLaser680Disconnect;
OnLaser680Disconnect(Self);

Controller:=TControllerM.Create(Self);
//Controller.OnConnect:=OnControllerConnect;
//Controller.OnDisconnect:=OnControllerDisconnect;
//Controller.OnMotoDone:=OnControllerMotoDone;
OnControllerDisconnect(Self);
Controller.MotX.OnMotoDone:=OnControllerMotoDone;
Controller.MotY.OnMotoDone:=OnControllerMotoDone;
Controller.MotZ.OnMotoDone:=OnControllerMotoDone;
Controller.BF.OnMotoDone:=OnControllerMotoDone;

Controller.FilterWheel.OnMotoDone:=OnControllerFWDone;
Controller.Slit.OnMotoDone:=OnControllerSlitDone;

DCMotor:=TDCMotor.Create(Self);

FormCCD:= TFormCCD.Create(Self);
FormCCD.Parent:= pnlCCDparent;
FormCCD.Align:=alClient;
FormCCD.Show;


    //**Toupcam
//Toupcam:= TdevToupcam.Create(Self);
//Toupcam.hWnd:=Self.Handle;
//Toupcam.Parent:=pnlCCDparent2;
//Toupcam.Align:=alClient;
//Toupcam.Show;

ToupcamG:= TdevToupcamG.Create(Self);
ToupcamG.Parent:=pnlCCDparent2;
ToupcamG.Align:=alClient;
//ToupcamG.Show; => move to formActivate


 // Toupcam **

//FormCCD2:= TFormCCD.Create(Self);
//FormCCD2.Parent:= pnlCCDparent2;
//FormCCD2.Align:=alClient;
//FormCCD2.Show;

Andor:=TAndor.Create(Self);

XScaleUnits:=xsPixels;
YScaleUnits:=ysADU;

IGraph:=TIGraph.Create(Self);
IGraph.Parent:=pnlIGraph;
IGraph.Align:=alClient;
IGraph.Show;

//CheckBox1.Checked:=IGraph.UseLimits;

HGraph:=THGraph.Create(Self);
HGraph.Parent:=pnlHGraph;
HGraph.Align:=alClient;
HGraph.Show;

VGraph:= TVGraph.Create(Self);
VGraph.Parent:=pnlLGraph;
VGraph.Align:=alClient;
VGraph.Show;

FrameData:=TFrameData.Create(self);
isTakeBG:=False;
ExpBGlayer:=-1;
BackgroundType:=bgDark;


FormScan:= TFormScan.Create(Self);
end;

procedure TformMain.FormDestroy(Sender: TObject);
begin
IGraph.Free;
HGraph.Free;
VGraph.Free;

FrameData.Free;

Andor.Free;
Laser.Free;
Laser680.Free;

Controller.Free;

DCMotor.Free;

FormCCD.Free;

FormScan.Free;
FormScan1.Free;

Viewer.Free;
FormScan2.Free;

//FormCCD2.Free;

end;

procedure TformMain.InitControllerControls;
var bF:Boolean;
begin
 canChange:=False;
 trbLed1.Position:=Controller.Periph.Led1;
 trbLed2.Position:=Controller.Periph.Led2;

 Controller.Periph.Flip1:=Controller.Periph.LastFlip1;
 Controller.Periph.Flip2:=Controller.Periph.LastFlip2;
// bF:=Controller.Periph.Flip1;
// bF:=Controller.Periph.Flip2;

 canChange:=True;
end;

procedure TformMain.InitLaser680Controls;
begin
TThread.Synchronize(nil,
          procedure()
              begin
                Laser680.InitParams;
                spinedtLaser680Power.Value:=Laser680.RefPower_mW;
                trbLaser680Power.Position :=Laser680.RefPower_mW;

                vleLaser680Status.Cells[1,0]:=Format('%d mW',[Laser680.Power_mW ]);
              end);

end;

procedure TformMain.InitLaserControls;
begin
TThread.Synchronize(nil,
          procedure()
              begin
              vleLaserStatus.Cells[1,0]:=Format('%d mW',[Laser.Power_mW ]);
              vleLaserStatus.Cells[1,1]:=Format('%d mA',[Laser.Bias_mA ]);
              vleLaserStatus.Cells[1,2]:=Format('%.1f %sC',[Laser.Temp,#176 ]);
              vleLaserStatus.Cells[1,3]:=Format('%.1f %sC',[Laser.CaseTemp,#176 ]);

              spinedtLaserPower.MinValue:=Laser.MinOptPow_mW;
              spinedtLaserPower.MaxValue:=Laser.MaxOptPow_mW;
              spinedtLaserPower.Value:=Laser.RefPower_mW;

              spinedtLaserBias.Value:=Laser.RefBias_mA;
              end);
end;

procedure TformMain.L1Click(Sender: TObject);
begin
FormLog.Show;
end;

procedure TformMain.Log(str: string);
begin
  TTask.Run( procedure
      begin
       TThread.Synchronize( nil, procedure
          begin
          if FormLog<>nil then
          if FormLog.MemoLog<>nil then
          FormLog.MemoLog.Lines.Add('Main: '+str);
          end);
      end);
end;



procedure TformMain.OnCalcImage(var Msg: TMessage);
begin
if FormScan<>nil then
FormScan.isTakeFrame:=True;

if FormScan1<>nil then
FormScan1.isTakeFrame:=True;

if FormScan2<>nil then
FormScan2.isTakeFrame:=True;

end;

procedure TformMain.OnChangeBordersHGraph(Sender: TObject);
var min, max:Double;
begin
    if GetTickCount-tprev > 20 then
      begin
      tprev :=GetTickCount;
//      IGraph.minX:=HGraph.MinX;
//      IGraph.maxX:=HGraph.MaxX;

      case XScaleUnits of
         xsPixels: begin
                    IGraph.minX:=HGraph.MinX;
                    IGraph.maxX:=HGraph.MaxX;
                   end;
          xsNm:     begin
                    min:=FrameData.ScaleNm[0];
                    max:=FrameData.ScaleNm[FrameData.ScaleNm.Count-1];

                    IGraph.MinX:=  (HGraph.minX-min)/(max-min)*Andor.Xdim;
                    IGraph.MaxX:=  Andor.Xdim - (max-HGraph.maxX)/(max-min)*Andor.Xdim;
                    end ;

          xsCm:     begin
                    min:=FrameData.ScaleCm[0];
                    max:=FrameData.ScaleCm[FrameData.ScaleCm.Count-1];
                    IGraph.MinX:=  (HGraph.minX-min)/(max-min)*Andor.Xdim;
                    IGraph.MaxX:=  Andor.Xdim - (max-HGraph.maxX)/(max-min)*Andor.Xdim;
                    end;
        end;

     //IGraphIntensity
      RepaintIntensityIGraph;

      VGraph.minX:=HGraph.MinY;
      VGraph.maxX:=HGraph.MaxY;

      VGraph.CalcResize(false);
      end;
end;

procedure TformMain.OnChangeBordersIGraph(Sender: TObject);
var min, max:Double;
begin
   if GetTickCount-tprev > 20 then
      begin
      tprev :=GetTickCount;

//        HGraph.MinX:=IGraph.minX;
//        HGraph.MaxX:=IGraph.maxX;

        case XScaleUnits of
          xsPixels: begin
                    HGraph.MinX:=IGraph.minX;
                    HGraph.MaxX:=IGraph.maxX;
                    end ;

          xsNm:     begin
                    min:=FrameData.ScaleNm[0];
                    max:=FrameData.ScaleNm[FrameData.ScaleNm.Count-1];

                    HGraph.MinX:=min+ IGraph.minX *(max-min)/Andor.Xdim;
                    HGraph.MaxX:=max-(max-min)*(Andor.Xdim-IGraph.maxX)/Andor.Xdim;
                    end ;

          xsCm:     begin
                    min:=FrameData.ScaleCm[0];
                    max:=FrameData.ScaleCm[FrameData.ScaleCm.Count-1];

                    HGraph.MinX:=min+ IGraph.minX*(max-min)/Andor.Xdim;
                    HGraph.MaxX:=max-(max-min)*(Andor.Xdim-IGraph.maxX)/Andor.Xdim;
                    end ;
        end;



        HGraph.CalcResize(false);

        VGraph.MinY:=IGraph.minY;
        VGraph.MaxY:=IGraph.maxY;

        VGraph.CalcResize(false);
      end;
end;

procedure TformMain.OnChangeBordersVGraph(Sender: TObject);
begin
 if GetTickCount-tprev > 20 then
      begin
      tprev :=GetTickCount;
      IGraph.minY:=VGraph.MinY;
      IGraph.maxY:=VGraph.MaxY;

      //IGraphIntensity
      RepaintIntensityIGraph;

      HGraph.minY:=VGraph.MinX;
      HGraph.maxY:=VGraph.MaxX;

      HGraph.CalcResize(false);
      end;
end;

procedure TformMain.OnChangeMode;
begin
 if Laser.CM_MODE=AutoPowCtrl then
          begin
              spinedtLaserPower.Enabled:=True;
              btnLaserSetPow.Enabled:=True;
              spinedtLaserBias.Enabled:=False;
              btnLaserSetBias.Enabled:=False;
          end
else
          begin
              spinedtLaserPower.Enabled:=False;
              btnLaserSetPow.Enabled:=False;
              spinedtLaserBias.Enabled:=True;
              btnLaserSetBias.Enabled:=True;
          end;
end;

procedure TformMain.OnControllerConnect(Sender: TObject);
begin
  StatusBarController.Panels[0].Text:='Controller Connected ';
end;

procedure TformMain.OnControllerDisconnect(Sender: TObject);
begin
  StatusBarController.Panels[0].Text:='Controller Disconnected';
end;


procedure TformMain.OnControllerFWDone(Sender: TObject; ev: TMotoDoneEv);
begin
if FormControllerSettings.Visible then
    begin
    if (ev=mdES1)  then  FormControllerSettings.BlinkES(1)
     else
    if (ev=mdES2)  then  FormControllerSettings.BlinkES(2);

    FormControllerSettings.UpdateMotoPosition(FormControllerSettings.cboxStepper.ItemIndex);
    end;

if (ev=mdES1)or (ev=mdES2) then BlinkES(1);

if (ev=mdCal1) or (ev=mdCal2) then
    begin
    rgFilterWheel.Enabled:=True;
    canChange:=false;
    rgFilterWheel.ItemIndex:=Controller.FilterWheel.Position;
    Controller.FilterWheel.GotoFilter(Controller.FilterWheel.Position);
    rgFilterWheel.Update;
    canChange:=True;
    end;
end;

////////////////////
///  MOTO DONE
////////////////////

procedure TformMain.OnControllerMotoDone(Sender: TObject; ev: TMotoDoneEv);
begin
if FormControllerSettings.Visible then
    begin
    if (ev=mdES1)  then  FormControllerSettings.BlinkES(1)
     else
    if (ev=mdES2)  then  FormControllerSettings.BlinkES(2);

    FormControllerSettings.UpdateMotoPosition(FormControllerSettings.cboxStepper.ItemIndex);
    end;

if (ev=mdES1)or (ev=mdES2) then BlinkES(1);

if (not Controller.MotX.Moving) and (not Controller.MotY.Moving) then
   TThread.Synchronize(nil, procedure
   begin
     ToupcamG.CorrectPosByEncoders;
     ToupcamG.RepaintMap;
   end);

end;


procedure TformMain.OnControllerSlitDone(Sender: TObject; ev: TMotoDoneEv);
begin
if FormControllerSettings.Visible then
    begin
    if (ev=mdES1)  then  FormControllerSettings.BlinkES(1)
     else
    if (ev=mdES2)  then  FormControllerSettings.BlinkES(2);

    FormControllerSettings.UpdateMotoPosition(FormControllerSettings.cboxStepper.ItemIndex);
    end;

if (ev=mdES1)or (ev=mdES2) then BlinkES(1);

if (ev=mdCal1) or (ev=mdCal2) then
     begin
     gbSlit.Enabled:=True;
     edtSlit.Value:=0;
     end;

if (ev=mdDone) then edtSlit.Value:=Controller.Slit.SlitMicrons;

end;

procedure TformMain.OnFinishScan(var Msg: TMessage);
begin

end;

procedure TformMain.OnImageMessage(var Msg: TMessage);
//var calcLine:TNumArray1<Single>;
//    i:Integer;

begin

if not FrameData.Allocated then Exit;

Andor.CritSectionAcq.Acquire;
progressPcnt:=100;
pbProgressFrame.Position:=100;

NumConvert32s_32f(Andor.pImageArray, FrameData.DataS);

if isTakeBG then
  begin
    if ExpBGlayer<0 then
    begin
      NumCopy(FrameData.DataS, FrameData.DataBG);
      NumCopy(FrameData.DataS, FrameData.CalcData);
      FormWaitBG.Close;
    end
    else
    begin
    NumCopy(FrameData.DataS, FrameData.DataBGarray[ExpBGlayer]);
    NumCopy(FrameData.DataS, FrameData.CalcData);
    FormWaitBG.Close;
    FormSettings.sgExpGrid.Cells[2,ExpBGlayer+1]:='*';
    ExpBGlayer:=-1;
    end;

  end;
Andor.CritSectionAcq.Release;


if not isTakeBG then
  begin
  CalcData;
//   //  NumSub(FrameData.DataBG, FrameData.DataS);                 //CalcData = DataS - DataBG
//      NumSub( FrameData.DataBG, FrameData.DataS, FrameData.CalcData);
//
//  if cbUseQE.Checked then
//    begin
//      calcLine:=TNumArray1<Single>.Create(nil, FrameData.CalcData.Width);
//
//      for i := 0 to FrameData.CalcData.Height-1 do
//       begin
//       FrameData.CalcData.SingleRow(i, calcLine);
//       NumMul( calcLine, FrameData.AndorQE);
//       end;
//      calcLine.Free;
//    end;
  end;

PlotData;
//CalcSNR(0, Andor.Xdim-1);

if isTakeBG then
  begin
    isFirstFrame:=true;
    isTakeBG:=False;
    SetSystem;
  end;

 PostMessage(FormMain.Handle,WM_ANDOR_CALCIMG, 0,0);
end;

procedure TformMain.OnLaser680Connect(Sender: TObject);
begin
StatusBarLaser680.Panels[0].Text:='Laser on '+Laser680.WorkPort;
end;

procedure TformMain.OnLaser680Disconnect(Sender: TObject);
begin
StatusBarLaser680.Panels[0].Text:='Laser Disconnected';
end;

procedure TformMain.OnLaserConnect(Sender: TObject);
begin
StatusBarLaser.Panels[0].Text:='Laser on '+Laser.WorkPort;
end;

procedure TformMain.OnLaserDisconnect(Sender: TObject);
begin
StatusBarLaser.Panels[0].Text:='Laser Disconnected';
end;

//procedure TformMain.OnMsgCamEvent(var Msg: TMessage);
//begin
//     case Msg.WParam of
//    TOUPCAM_EVENT_ERROR:
//      Toupcam.OnEventUsbError();
//    TOUPCAM_EVENT_DISCONNECTED:
//      Toupcam.OnEventUsbDisconnected();
//    TOUPCAM_EVENT_EXPOSURE:
//      Toupcam.OnEventExpo();
//    TOUPCAM_EVENT_TEMPTINT:
//      Toupcam.OnEventTemptint();
//    TOUPCAM_EVENT_IMAGE:
//      Toupcam.OnEventImage();
//    TOUPCAM_EVENT_STILLIMAGE:
//      Toupcam.OnEventSnap();
//  end;
//end;

procedure TformMain.OnOverColRowHVGraph(Sender: TObject; const ACol, ARow: string);
begin
StatusBarGraph.Panels[0].Text:=Format('X=%s Y=%s',[ACol, ARow]);
end;

procedure TformMain.OnOverColRowIGraph(Sender: TObject; const ACol, ARow: integer);
begin
StatusBarGraph.Panels[0].Text:=Format('X=%d Y=%d',[ACol, ARow]);
end;

procedure TformMain.OnProgress(var Msg: TMessage);
begin
if FormProgress<>nil then
 if not FormProgress.Visible then FormProgress.Show;
   FormProgress.ProgressBar.Position:=round(Msg.LParam/100);
   FormProgress.edtProgress.Text :=Format('%.2f %%',[Msg.LParam/100]);
   if Msg.LParam = 10100 then FormProgress.Hide;

end;

procedure TformMain.OnScanAfterFrame(var Msg: TMessage);
begin
if FormScan<>nil then
  if FormScan.StopScanning<>true then
   FormScan.vleStatus.Cells[1,1]:=Format('%d of %d',[Msg.LParam,  FormScan.ScanParams.totalPoints ]);

if FormScan1<>nil then
  if FormScan1.StopScanning<>true then
   FormScan1.vleStatus.Cells[1,1]:=Format('%d of %d',[Msg.LParam,  FormScan1.ScanParams.totalPoints ]);



end;

procedure TformMain.OnScanBeforeFrame(var Msg: TMessage);
begin
   Log('Scan BeforeFrame '+Msg.LParam.ToString);
end;

procedure TformMain.OnScanImage(var Msg: TMessage);
begin
if FormScan<>nil then
if FormScan.StopScanning <> True then
    FormScan.DrawImage;

if FormScan1<>nil then
   if FormScan1.StopScanning <> True then
     FormScan1.DrawImage;

end;

procedure TformMain.OnSelectColRowIGraph(Sender: TObject; const ACol,   ARow: integer);
begin
StatusBarGraph.Panels[1].Text:=Format('Col=%d Row=%d',[ACol, ARow]);

selectedCol:=ACol;
selectedRow:=ARow;

RepaintHVGraph;
end;

procedure TformMain.OnStartImage(var Msg: TMessage);
begin
TimerProgress.Enabled:=True;
progressPcnt:=0;
pbProgressFrame.Position:=0;

end;

procedure TformMain.OnStartScan(var Msg: TMessage);
begin

end;

procedure TformMain.OnStopImage(var Msg: TMessage);
begin
TimerProgress.Enabled:=False;
progressPcnt:=100;
pbProgressFrame.Position:=100;
end;

procedure TformMain.PlotData;
var i:Integer;
begin

 NumMinMax(FrameData.CalcData, FrameData.minV, FrameData.maxV);

    if (FrameData.maxV<=FrameData.minV+1E-38)  then
     FrameData.maxV:=FrameData.minV+1E-38;


//Log(Format('%f  %f',[minV, maxV]));

  if isFirstFrame then
    begin
    if selectedRow>FrameData.CalcData.Height-1 then
    selectedRow:=trunc(FrameData.CalcData.Height/2);

    if selectedCol>FrameData.CalcData.Width-1 then
    selectedCol:=trunc(FrameData.CalcData.Width/2);

    HGraph.DeleteAll;
    if Andor.ReadMode=rmRandomTrack then
     begin
        for i := 0 to High(Andor.RandomTrackParams) do
          if Andor.RandomTrackParams[i].used then

         HGraph.CreateCurve( Andor.RandomTrackParams[i].name,  Andor.RandomTrackParams[i].color, FrameData.CalcData.Width);
     end
       else
    HGraph.CreateCurve('data', clRed, FrameData.CalcData.Width);

    VGraph.DeleteAll;
    VGraph.CreateCurve('data', clRed, FrameData.CalcData.Height);

    if isNeedAutoscale then
    
    Autoscale;
    RescaleTriGraph;

    isFirstFrame:=false;
    end;

 RepaintIntensityIGraph;
 RepaintHVGraph;
 btnAver.OnClick(Self);

end;

procedure TformMain.pnlLGraphResize(Sender: TObject);
begin
pnlGraphBottomLeft.Width:=pnlLGraph.Width-40;
end;

procedure TformMain.pnlTriGraphResize(Sender: TObject);
begin
//if pnlTriGraph.Height<pnlGraphMain.Height+StatusBarGraph.Height+ControlBarTriGraph.Height+20 then
//   pnlTriGraph.Height:=pnlGraphMain.Height+StatusBarGraph.Height+ControlBarTriGraph.Height+20;
end;

procedure TformMain.R1Click(Sender: TObject);
begin
DCMotor.CloseAllDevices;
if DCMotor.Find then
    if DCMotor.Open then
        begin
        DCMotor.InitMotor;
        end;
end;

procedure TformMain.rbADUClick(Sender: TObject);
begin
YScaleUnits:= TYscaleUnits((Sender as TsRadioButton).Tag);
if not IGraph.isLoaded then Exit;

CalcData;
isFirstFrame:=True;
PlotData;

end;

procedure TformMain.rbPixelsClick(Sender: TObject);
begin
XScaleUnits:= TXscaleUnits((Sender as TsRadioButton).Tag);
if not IGraph.isLoaded then Exit;
RescaleTriGraph;
RepaintHVGraph;
end;

procedure TformMain.RecalcSoftBin;
var i:integer;
begin
  cboxSoftBinX.Items.Clear;
  cboxSoftBinY.Items.Clear;

  for i := 1 to Andor.Xdim do
     begin
     if (Andor.Xdim mod i=0) then
       cboxSoftBinX.Items.Add( i.ToString);
     end;

  for i := 1 to Andor.Ydim do
     begin
     if (Andor.Ydim mod i=0) then
       cboxSoftBinY.Items.Add(i.ToString);
     end;
end;

procedure TformMain.RepaintHVGraph;
var i,j:Integer;
begin
//if Andor.BinY =1 then
  j:=0;
 if Andor.ReadMode=rmRandomTrack then
    begin
    for i := 0 to High(Andor.RandomTrackParams) do
      if Andor.RandomTrackParams[i].used then
        begin
          FrameData.CalcData.SingleRow(j, HGraph.Curve[j].data.y);

            case XScaleUnits of
             xsPixels: NumCopy( FrameData.ScalePix, HGraph.Curve[j].data.x);
             xsNm: NumCopy( FrameData.ScaleNm, HGraph.Curve[j].data.x);
             xsCm: NumCopy( FrameData.ScaleCm, HGraph.Curve[j].data.x);
            end;

         Inc(j);
        end;
    end
  else
   begin
          FrameData.CalcData.SingleRow(SelectedRow, HGraph.Curve[0].data.y);

        if Andor.BinX = 1 then
          begin
            case XScaleUnits of
             xsPixels: NumCopy( FrameData.ScalePix, HGraph.Curve[0].data.x);
             xsNm: NumCopy( FrameData.ScaleNm, HGraph.Curve[0].data.x);
             xsCm: NumCopy( FrameData.ScaleCm, HGraph.Curve[0].data.x);
            end;
          end
         else
          begin
            case XScaleUnits of
             xsPixels:  begin
                         for i := 0 to Andor.Xdim-1 do
                         HGraph.Curve[0].data.x[i]:=i;
                        end;
             xsNm    :  begin
                         for i := 0 to Andor.Xdim-1 do
                         HGraph.Curve[0].data.x[i]:= FrameData.ScaleNm[i*Andor.BinX];
                        end;
             xsCm    :  begin
                         for i := 0 to Andor.Xdim-1 do
                         HGraph.Curve[0].data.x[i]:= FrameData.ScaleCm[i*Andor.BinX];
                        end;
            end;
          end;

   end;
  HGraph.RepaintGraph;

  FrameData.CalcData.SingleColumn(selectedCol, VGraph.Curve[0].data.y);

  VGraph.RepaintGraph;
  btnAver.OnClick(Self);
end;

procedure TformMain.RepaintIntensityIGraph;
const lim=45;
var
    vSub, vDiv:Single;
begin
  if HGraph.MaxY=HGraph.MinY then exit;

  vSub:= HGraph.MinY;
  vDiv:=(HGraph.MaxY-HGraph.MinY)/256;
  NumNormalize(FrameData.CalcData, FrameData.DataSnorm,vSub,vDiv);

  NumConvert32f_8u(FrameData.DataSnorm, FrameData.ImageData);


  IGraph.LoadData(FrameData.ImageData);
end;

procedure TformMain.RescaleTriGraph;
var min, max:Double;
begin
if not IGraph.isLoaded then Exit;

case XScaleUnits of
  xsPixels: begin
            HGraph.MinX:=IGraph.minX;
            HGraph.MaxX:=IGraph.maxX;

            HGraph.SetLimits(0, Andor.Xdim);
            end ;

  xsNm:     begin
            min:=FrameData.ScaleNm[0];
            max:=FrameData.ScaleNm[FrameData.ScaleNm.Count-1];
            HGraph.SetLimits(min, max);

            HGraph.MinX:=min+ IGraph.minX*(max-min)/Andor.Xdim;
            HGraph.MaxX:=max-(max-min)*(Andor.Xdim-IGraph.maxX)/Andor.Xdim;
            end ;

  xsCm:     begin
            min:=FrameData.ScaleCm[0];
            max:=FrameData.ScaleCm[FrameData.ScaleNm.Count-1];
            HGraph.SetLimits(min, max);

            HGraph.MinX:=min+ IGraph.minX*(max-min)/Andor.Xdim;
            HGraph.MaxX:=max-(max-min)*(Andor.Xdim-IGraph.maxX)/Andor.Xdim;
            end ;
end;
HGraph.CalcResize(false);
end;

procedure TformMain.rgAcquisitionModeChange(Sender: TObject);
var run:boolean;
begin
run:=andor.Running;
if run then
   Andor.AbortAcquisition;

SetSystem;

if run then
   Andor.StartAcquisition;

end;

procedure TformMain.rgFilterWheelChange(Sender: TObject);
begin
if canChange then
  begin
  Controller.FilterWheel.GotoFilter(rgFilterWheel.ItemIndex);

  end;
end;

procedure TformMain.rgReadModeChange(Sender: TObject);
var run:boolean;
begin
if rgReadMode.ItemIndex=0 then
  begin
  cboxBinX.Enabled:=true;
  cboxBinY.Enabled:=true;
  end
  else
  begin
  cboxBinX.Enabled:=false;
  cboxBinY.Enabled:=false;
  end;


run:=andor.Running;
if run then
   Andor.AbortAcquisition;

SetSystem;

if run then
   Andor.StartAcquisition;
end;

procedure TformMain.rgReadModeClick(Sender: TObject);
var run:boolean;
begin
if rgReadMode.ItemIndex=0 then
  begin
  cboxBinX.Enabled:=true;
  cboxBinY.Enabled:=true;
  end
  else
  begin
  cboxBinX.Enabled:=false;
  cboxBinY.Enabled:=false;
  end;


run:=andor.Running;
if run then
   Andor.AbortAcquisition;

SetSystem;

if run then
   Andor.StartAcquisition;
end;

procedure TformMain.rgShutterModeChange(Sender: TObject);
var run:boolean;
begin
run:=andor.Running;
if run then
   Andor.AbortAcquisition;

SetSystem;

if run then
   Andor.StartAcquisition;
end;

procedure TformMain.S1Click(Sender: TObject);
begin
FormSettings.ShowModal;
end;

procedure TformMain.S3Click(Sender: TObject);
begin
FormScan.Show;
end;

procedure TformMain.S4Click(Sender: TObject);
begin
FormDCMotorSettings.Show;
end;

procedure TformMain.S6Click(Sender: TObject);
begin
if FormScan2 = nil then
     begin
      FormScan2:= TFormScan2.Create(Self);
      FormScan2.LoadSettings;
     end;

  FormScan2.Show;

if  Viewer=nil then
   begin
    Viewer:= TViewer.Create(Self);
    FormScan2.AttachViewer;
    Viewer.Parent:=FormScan2.pnlViewer;
    Viewer.Align:=alClient;
    Viewer.Show;
   end;


end;

procedure TformMain.SaveAllToCSV(const FileName: string);
var i,j:Integer;
    FS : TFileStream;
    aStr:AnsiString;
begin
    FormatSettings.DecimalSeparator:='.';
    try
    FS := TFileStream.Create(FileName, fmCreate, fmShareDenyWrite);
    for i := 0 to HGraph.Curve[0].data.X.Count-1 do
      begin
      aStr:= HGraph.Curve[0].data.X[i].ToString ;

        for j := 0 to FrameData.CalcData.Height-1 do
         aStr:=aStr+ ',' + FrameData.CalcData.Values[j,i].ToString;

      aStr:= aStr + #13#10;
      FS.Write(Pointer(aStr)^, Length(aStr) * SizeOf(AnsiChar));
      end;
   finally
    FS.Free;
  end;
end;

procedure TformMain.SaveToCSV(const FileName: string; ACol, ARow:integer);
var i:Integer;
    FS : TFileStream;
    aStr:AnsiString;
begin
   FormatSettings.DecimalSeparator:='.';
    try
    FS := TFileStream.Create(FileName, fmCreate, fmShareDenyWrite);
    for i := 0 to HGraph.Curve[0].data.X.Count-1 do
      begin
      aStr:= HGraph.Curve[0].data.X[i].ToString + ',' + HGraph.Curve[0].data.Y[i].ToString + #13#10;
      FS.Write(Pointer(aStr)^, Length(aStr) * SizeOf(AnsiChar));
      end;
   finally
    FS.Free;
  end;

end;

procedure TformMain.sEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key= VK_RETURN then
   Laser.Send(sEdit1.Text);
end;

procedure TformMain.SetSystem;
var ttl:TShutterTTL;
    mode:TShutterMode;
    closingTime:integer;
    trig:TTriggerMode;
begin

  case rgAcquisitionMode.ItemIndex of
  0: begin  //Single
       Andor.SetAcquisitionMode(amSingleScan);
       Log('Single Scan Selected');
     end;
  1:begin  //Accumulation
       Andor.SetAcquisitionMode(amAccumulate);


       Log('Accumulation Selected');
     end;
  2:begin  //Kinetic
       Andor.SetAcquisitionMode(amKineticSeries);
       Log('Kinetic Selected');
     end;
  3: begin  //RunTillAbort
       Andor.SetAcquisitionMode(amRunTillAbort);
       Log('TillAbort Selected');
  end;

  end;


  case rgReadMode.ItemIndex of
  0: begin
       Andor.SetReadMode(rmImage);
       Log('Set to Image Mode');
     end;

  1: begin
     Andor.SetReadMode(rmFVB);
     Log('Set to FVB');
     end;

  2: begin
     Andor.SetReadMode(rmSingleTrack);
     Log('Set to SingleTrack');
     end;

  3: begin
     Andor.SetReadMode(rmRandomTrack);
     Log('Set to RandomTrack');
     end;

  end;




  if Andor.SetRecommendedVSSpeed then
   Log(Format('Vertical Speed set to %f microseconds per pixel shift',[Andor.Vspeed]) );

//  if Andor.SetMaxHSpeed then
//   begin
//    if(Andor.Capabilities.ulCameraType = 1) then      // if using an iXon the speed is given in MHz
//       Log(Format('Horizontal Speed set to %f MHz',[Andor.Hspeed]) )
//    else
//       Log(Format('Horizontal Speed set to %f microseconds per pixel shift',[Andor.Hspeed]) );
//   end;


  // Set shutter
//case rgShutterTTL.ItemIndex of
//0: ttl:=ttlLow;
//1: ttl:=ttlHigh;
//else
   ttl:=ttlLow;

//end;
Andor.SetPreAmpGain(0);
Andor.SetPreAmpGain(1);
Andor.SetPreAmpGain(0);
Andor.SetPreAmpGain(1);
Andor.SetPreAmpGain(cboxPreAmpGain.ItemIndex);

case rgShutterMode.ItemIndex of
0: mode := smodAuto;
1: mode := smodOpen;
2: mode := smodClose;
else mode := smodAuto;
end;

closingTime:=0;// StrToInt(edtOpenClose.Text);
if closingTime=0 then closingTime:=1;

Andor.SetShutter(ttl, mode, closingTime );

//case cboxTrigger.ItemIndex of
//0: trig:=tmInternal;
//1: trig:=tmExternal;
//2: trig:=tmSoftware;
//else
  trig:=tmInternal;
//end;
Andor.SetTriggerMode(trig);


  case Andor.ReadMode of
    rmFVB:
            begin
          //  Andor.SetFVBBinning(StrToIntDef(cboxBinX.Items[cboxBinX.ItemIndex],1)); //Doesn`t work in this camera
            end;
    rmSingleTrack:
            begin
            Andor.SetSingleTrack(edtSingleTrackCentre.Value, edtSingleTrackHigh.Value);
            Andor.SetSingleTrackBinX(1); //StrToIntDef(cboxBinX.Items[cboxBinX.ItemIndex],1));
            end;

    rmMultiTrack: ;
    rmRandomTrack:
            begin
            if Andor.FormRandomTrackParams then
                Andor.SetRandomTracks;
            Andor.SetCustomTrackBinX(1); //StrToIntDef(cboxBinX.Items[cboxBinX.ItemIndex],1));
            //
            end;

    rmImage:
            begin
            Andor.SetImageBinning(StrToIntDef(cboxBinX.Items[cboxBinX.ItemIndex],1), StrToIntDef(cboxBinY.Items[cboxBinY.ItemIndex],1));
            Andor.SetImage;
            end;
  end;

  Andor.SetSoftBinning(StrToIntDef(cboxSoftBinX.Items[cboxSoftBinX.ItemIndex],1), StrToIntDef(cboxSoftBinY.Items[cboxSoftBinY.ItemIndex],1));


  Andor.AllocateBuffers;
   if not FrameData.AllocateCalcBuffers(Andor.pImageArray.Width, Andor.pImageArray.Height) then
     if not FrameData.AllocateCalcBuffers(Andor.pImageArray.Width, Andor.pImageArray.Height) then
       ShowMessage('Data buffer allocation Error!');

  FrameData.CalcQE(Andor.gblXPixels, Andor.BinX, XScaleUnits );
  FrameData.CalcCalYSized(Andor.gblXPixels, Andor.BinX);
  //  AllocateCalcBuffers;
  SetTimings;

   // It is necessary to get the actual times as the system will calculate the
   // nearest possible time. eg if you set exposure time to be 0, the system
   // will use the closest value (around 0.01s)
  UpdateTimings;

  RecalcSoftBin;

  isFirstFrame:=true;
end;

procedure TformMain.SetSystemForBG(BGtype:TBGType);
var ttl:TShutterTTL;
    mode:TShutterMode;
    closingTime:integer;
    trig:TTriggerMode;
begin

  if Andor.AcquisitionMode <> amAccumulate then
   Andor.SetAcquisitionMode(amSingleScan);

//  Andor.SetAcquisitionMode(amSingleScan);

  case rgReadMode.ItemIndex of
  0: begin
       Andor.SetReadMode(rmImage);
     end;

  1: begin
     Andor.SetReadMode(rmFVB);
     end;

  2: begin
     Andor.SetReadMode(rmSingleTrack);
     end;
  3: begin
     Andor.SetReadMode(rmRandomTrack);
     end;
  end;


  if Andor.SetRecommendedVSSpeed then
   Log(Format('Vertical Speed set to %f microseconds per pixel shift',[Andor.Vspeed]) );

//  if Andor.SetMaxHSpeed then
//   begin
//    if(Andor.Capabilities.ulCameraType = 1) then      // if using an iXon the speed is given in MHz
//       Log(Format('Horizontal Speed set to %f MHz',[Andor.Hspeed]) )
//    else
//       Log(Format('Horizontal Speed set to %f microseconds per pixel shift',[Andor.Hspeed]) );
//   end;


  // Set shutter
//case rgShutterTTL.ItemIndex of
//0: ttl:=ttlLow;
//1: ttl:=ttlHigh;
//else
   ttl:=ttlLow;

//end;

case BGtype of
  bgLight: mode := smodOpen;
  bgDark: mode := smodClose;
end;

closingTime:=0;// StrToInt(edtOpenClose.Text);
if closingTime=0 then closingTime:=1;

Andor.SetShutter(ttl, mode, closingTime );

Andor.SetPreAmpGain(cboxPreAmpGain.ItemIndex);

//case cboxTrigger.ItemIndex of
//0: trig:=tmInternal;
//1: trig:=tmExternal;
//2: trig:=tmSoftware;
//else
  trig:=tmInternal;
//end;
Andor.SetTriggerMode(trig);


  case Andor.ReadMode of
    rmFVB:
            begin
            Andor.SetFVBBinning(1); //StrToIntDef(cboxBinX.Items[cboxBinX.ItemIndex],1)); //Doesn`t work in this camera
            end;
    rmSingleTrack:
            begin
            Andor.SetImageBinning(1,1);
            Andor.SetImage;   // due to some behaviour of Andor camera it is need to set ImageBinning 1:1

            Andor.SetSingleTrack(edtSingleTrackCentre.Value, edtSingleTrackHigh.Value);
            Andor.SetSingleTrackBinX(1); //StrToIntDef(cboxBinX.Items[cboxBinX.ItemIndex],1));
            end;

    rmMultiTrack: ;

    rmRandomTrack:
            begin
            Andor.SetImageBinning(1,1);
            Andor.SetImage;   // due to some behaviour of Andor camera it is need to set ImageBinning 1:1

            if Andor.FormRandomTrackParams then
                Andor.SetRandomTracks;
            Andor.SetCustomTrackBinX(1); // StrToIntDef(cboxBinX.Items[cboxBinX.ItemIndex],1));
            //
            end;
    rmImage:
            begin
            Andor.SetImageBinning(StrToIntDef(cboxBinX.Items[cboxBinX.ItemIndex],1), StrToIntDef(cboxBinY.Items[cboxBinY.ItemIndex],1));
            Andor.SetImage;
            end;
  end;

  Andor.AllocateBuffers;
   if not FrameData.AllocateCalcBuffers(Andor.pImageArray.Width, Andor.pImageArray.Height) then
     if not FrameData.AllocateCalcBuffers(Andor.pImageArray.Width, Andor.pImageArray.Height) then
       ShowMessage('Data buffer allocation Error!');

 // FrameData.CalcQE(Andor.gblXPixels, Andor.BinX, XScaleUnits );
  //  AllocateCalcBuffers;
  SetTimings;

   // It is necessary to get the actual times as the system will calculate the
   // nearest possible time. eg if you set exposure time to be 0, the system
   // will use the closest value (around 0.01s)
  UpdateTimings;

  isFirstFrame:=true;
end;

procedure TformMain.SetTimings;
begin
           // Set Times
  Andor.ExposureTime:= edtExposure.Value;

  case Andor.AcquisitionMode of
    amSingleScan: ;
    amAccumulate:
                 begin
                  Andor.SetAccumNumber(edtAccumulationNumber.Value);
                  Andor.GetAcquisitionTimings;
                  Andor.AccumTime:=edtAccumulationTime.Value;
                 end;
    amKineticSeries:
                 begin
                 Andor.SetAccumNumber(edtAccumulationNumber.Value);
                 Andor.GetAcquisitionTimings;
                 Andor.AccumTime:=edtAccumulationTime.Value;

                 Andor.SetKineticNumber(edtKineticNumber.Value);
                 Andor.KineticTime:=edtAccumulationTime.Value;
                 end;
    amRunTillAbort: ;
  end;
// Andor.CosmicFilter:=true;

  UpdateTimings;
end;

procedure TformMain.spinedtLaser680PowerKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key=VK_RETURN then
   btnLaser680SetPow.OnClick(Self);
end;

procedure TformMain.spinedtLaserBiasKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key=VK_RETURN then
   btnLaserSetBias.OnClick(Self);
end;

procedure TformMain.spinedtLaserPowerKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key=VK_RETURN then
   btnLaserSetPow.OnClick(Self);
end;

procedure TformMain.sSpeedButton1Click(Sender: TObject);
var tmp:Integer;
begin

try
tmp:=Round(StrToInt(cboxXYStep.Text)/0.1569);

TTask.Run(procedure()
          begin
          Controller.MotY.FCritSection.Acquire;
          Controller.MotY.MovRel(tmp);
          Controller.MotY.FCritSection.Release;
          end);
except
//Log('Step value incorrect!');
end;

end;

procedure TformMain.sSpeedButton2Click(Sender: TObject);
var tmp:Integer;
begin

try
tmp:=Round(StrToInt(cboxXYStep.Text)/0.1569);

TTask.Run(procedure()
          begin
          Controller.MotX.FCritSection.Acquire;
          Controller.MotX.MovRel(-tmp);
          Controller.MotX.FCritSection.Release;
          end);
except
//Log('Step value incorrect!');
end;

end;

procedure TformMain.sSpeedButton3Click(Sender: TObject);
var tmp:Integer;
begin

try
tmp:=Round(StrToInt(cboxXYStep.Text)/0.1569);

TTask.Run(procedure()
          begin
          Controller.MotY.FCritSection.Acquire;
          Controller.MotY.MovRel(-tmp);
          Controller.MotY.FCritSection.Release;
          end);
except
//Log('Step value incorrect!');
end;

end;

procedure TformMain.sSpeedButton4Click(Sender: TObject);
var tmp:Integer;
begin

try
tmp:=Round(StrToInt(cboxXYStep.Text)/0.1569);

TTask.Run(procedure()
          begin
          Controller.MotX.FCritSection.Acquire;
          Controller.MotX.MovRel(tmp);
          Controller.MotX.FCritSection.Release;
          end);
except
//Log('Step value incorrect!');
end;

end;

procedure TformMain.sSpeedButton5Click(Sender: TObject);
var tmp:Integer;
begin

try
tmp:=Round(StrToInt(cboxZStep.Text)/0.1569);

TTask.Run(procedure()
          begin
          Controller.MotZ.FCritSection.Acquire;
          Controller.MotZ.MovRel(-tmp);
          Controller.MotZ.FCritSection.Release;
          end);
except
//Log('Step value incorrect!');
end;

end;

procedure TformMain.sSpeedButton6Click(Sender: TObject);
var tmp:Integer;
begin

try
tmp:=Round(StrToInt(cboxZStep.Text)/0.1569);

TTask.Run(procedure()
          begin
          Controller.MotZ.FCritSection.Acquire;
          Controller.MotZ.MovRel(tmp);
          Controller.MotZ.FCritSection.Release;
          end);
except
//Log('Step value incorrect!');
end;

end;

procedure TformMain.btnVScaleTriGraphClick(Sender: TObject);
begin
if  IGraph.isLoaded then
  AutoscaleVert;
end;

procedure TformMain.btnAutoscaleTriGraphClick(Sender: TObject);
begin
if  IGraph.isLoaded then
  begin
  Autoscale;
  RescaleTriGraph;
  end;
end;

procedure TformMain.btnAverClick(Sender: TObject);
var snr:single;
begin
snr:= CalcSNR(0, Andor.Xdim-5);
lblSNR.Caption:=Format('%.2f',[  snr]);
//HGraph.RepaintGraph;
end;

procedure TformMain.t1Click(Sender: TObject);
begin
SaveDialog.Filter:='bmp|*.bmp';
SaveDialog.DefaultExt:='*.bmp';
SaveDialog.FileName:='PlotImage';

if SaveDialog.Execute then
   HGraph.PaintBox.Buffer.SaveToFile(SaveDialog.FileName);

end;

procedure TformMain.t2Click(Sender: TObject);
begin
SaveDialog.Filter:='bmp|*.bmp';
SaveDialog.DefaultExt:='*.bmp';
SaveDialog.FileName:='AndorImage';

if SaveDialog.Execute then
     IGraph.DataBuffer.SaveToFile(SaveDialog.FileName);

end;

procedure TformMain.Timer1secTimer(Sender: TObject);
begin
lblGetTemperature.Caption:=Format('%.1f C',[ Andor.Temperature]);
 case Andor.TempStatus of
  tstDisable:lblGetTemperature.Font.Color:=clBlack ;
  tstNotReached,tstDrift: lblGetTemperature.Font.Color:=clOlive;
  tstStabilized: lblGetTemperature.Font.Color:=clGreen;
 end;

end;

procedure TformMain.TimerOnesecTimer(Sender: TObject);
begin
   UpdateControllerLabels;
   UpdateLaserLabels;
   UpdateLaser680Labels;

   UpdatePowerOnSample;

   if canChange then
   if Laser680.Power_mW <> trbLaser680Power.Position then
   Laser680.SetPower(trbLaser680Power.Position);
end;

procedure TformMain.TimerProgressTimer(Sender: TObject);
begin
if pbProgressFrame.Position=100 then
   begin
   progressPcnt:=0;
   pbProgressFrame.Position:=0;
   end
 else
   begin
   progressPcnt:=progressPcnt+ ( TimerProgress.Interval*0.1/Andor.AccumTime);
   pbProgressFrame.Position:= Trunc(progressPcnt);
   end;
end;

procedure TformMain.toCsv1Click(Sender: TObject);
begin
if IGraph.isLoaded then
  begin
  SaveDialog.Filter:='csv|*.csv';
  SaveDialog.DefaultExt:='csv';
  SaveDialog.FileName:='PlotData';

  if SaveDialog.Execute then
     SaveToCSV(SaveDialog.FileName,-1,-1);
  end
else
  sShowMessage('No data');

end;

procedure TformMain.trbLaser680PowerChange(Sender: TObject);
begin
spinedtLaser680Power.Value:=trbLaser680Power.Position;

end;

procedure TformMain.UpdateADControls;
var i, len:Integer;
begin
  canChange:=False;

  cboxADChannel.Items.Clear;
  cboxOutputAmplifier.Items.Clear;
  cboxHSpeed.Items.Clear;
  cboxPreAmpGain.Items.Clear;

  len:=Andor.SpeedParams.NumChannels;
  for i := 0 to len-1 do
   cboxADChannel.Items.Add(Andor.SpeedParams.Channels[i].value.ToString);

  len:=Andor.SpeedParams.Channels[Andor.CurADChannelIdx].NumAmp;
  for i := 0 to len-1 do
   cboxOutputAmplifier.Items.Add(Andor.SpeedParams.Channels[Andor.CurADChannelIdx].OutAmplifiers[i].value.ToString);

  len:=Andor.SpeedParams.Channels[Andor.CurADChannelIdx].OutAmplifiers[Andor.CurOutAmplifierIdx].NumHSpeeds;
  for i := 0 to len-1 do
   cboxHSpeed.Items.Add( Format('%.0f',[Andor.SpeedParams.Channels[Andor.CurADChannelIdx].OutAmplifiers[Andor.CurOutAmplifierIdx].HSpeeds[i].value*1000]));

  len:=Andor.SpeedParams.Channels[Andor.CurADChannelIdx].OutAmplifiers[Andor.CurOutAmplifierIdx].HSpeeds[Andor.CurHSSpeedIdx].NumGains;
  for i := 0 to len-1 do
   cboxPreAmpGain.Items.Add( Format('%.1f',[Andor.SpeedParams.Channels[Andor.CurADChannelIdx].OutAmplifiers[Andor.CurOutAmplifierIdx].HSpeeds[Andor.CurPreAmpGainIdx].Gains[i]]) );

  cboxADChannel.ItemIndex:=Andor.CurADChannelIdx;
  cboxOutputAmplifier.ItemIndex:=Andor.CurOutAmplifierIdx;
  cboxHSpeed.ItemIndex:=Andor.CurHSSpeedIdx ;
  cboxPreAmpGain.ItemIndex:=Andor.CurPreAmpGainIdx;

  canChange:=True;
end;

procedure TformMain.UpdateControllerLabels;
begin
if Controller.Periph.Connected then
       begin
            if not Controller.Periph.LastFlip1 then
                begin
                 shpFlip1Up.Brush.Color:=clDkGray;
                 shpFlip1Dwn.Brush.Color:=clGreen;
                end
              else
                begin
                 shpFlip1Up.Brush.Color:=clGreen;
                 shpFlip1Dwn.Brush.Color:=clDkGray;
                end ;

            if not Controller.Periph.LastFlip2 then
                begin
                 shpFlip2Up.Brush.Color:=clDkGray;
                 shpFlip2Dwn.Brush.Color:=clGreen;
                end
              else
                begin
                 shpFlip2Up.Brush.Color:=clGreen;
                 shpFlip2Dwn.Brush.Color:=clDkGray;
                end ;

        if trbLed1.Position<>Controller.Periph.LastLed1 then
          if canChange then
          TTask.Run(procedure()
          begin
           Controller.Periph.Led1:= trbLed1.Position;
          end);

        if trbLed2.Position<>Controller.Periph.LastLed2 then
          if canChange then
          TTask.Run(procedure()
          begin
           Controller.Periph.Led2:= trbLed2.Position;
          end);

       end;

if Controller.FilterWheel.Connected then
       begin
        if Controller.FilterWheel.Calibrating then
            begin
             if shpFWCal.Brush.Color=clBlue then
                     shpFWCal.Brush.Color:=clDkGray
                  else shpFWCal.Brush.Color:=clBlue;
            end
          else shpFWCal.Brush.Color:=clGreen;

        if Controller.FilterWheel.Moving then
            begin
             if shpFWMov.Brush.Color=clMaroon then
                     shpFWMov.Brush.Color:=clDkGray
                  else shpFWMov.Brush.Color:=clMaroon;
            end
          else shpFWMov.Brush.Color:=clGreen;

       end;
if Controller.Slit.Connected then
       begin
          if Controller.Slit.Calibrating then
            begin
             if shpSlitCal.Brush.Color=clBlue then
                     shpSlitCal.Brush.Color:=clDkGray
                  else shpSlitCal.Brush.Color:=clBlue;
            end
          else shpSlitCal.Brush.Color:=clGreen;

        if Controller.Slit.Moving then
            begin
             if shpSlitMov.Brush.Color=clMaroon then
                     shpSlitMov.Brush.Color:=clDkGray
                  else shpSlitMov.Brush.Color:=clMaroon;
            end
          else shpSlitMov.Brush.Color:=clGreen;

       //// Line & Point
          if ( Controller.Periph.LastFlip1) and ( Controller.Periph.LastFlip2) then
                begin
                 shpLine.Brush.Color:=clDkGray;
                 shpPoint.Brush.Color:=clGreen;
                end
           else
          if (not Controller.Periph.LastFlip1) and (not Controller.Periph.LastFlip2) then
                begin
                 shpLine.Brush.Color:=clGreen;
                 shpPoint.Brush.Color:=clDkGray;
                end
           else
               begin
                 shpLine.Brush.Color:=clDkGray;
                 shpPoint.Brush.Color:=clDkGray;
                end;


       end
    else
       begin
        shpFlip1Up.Brush.Color:=clDkGray;
        shpFlip1Dwn.Brush.Color:=clDkGray;
        shpFlip2Up.Brush.Color:=clDkGray;
        shpFlip2Dwn.Brush.Color:=clDkGray;
        shpLine.Brush.Color:=clDkGray;
        shpPoint.Brush.Color:=clDkGray;
       end;
end;

procedure TformMain.UpdateFilterWheelLabels;
var
  i: Integer;
begin
for i := 0 to 7 do
  rgFilterWheel.Items[i]:=Controller.FilterWheel.Filter[i].Name;
end;


procedure TformMain.UpdateLaser680Labels;
begin
 if Laser680.Connected then
   begin

      // Power
      if Laser680.SwitchedOn then
             begin
                  shpLaser680PowOn.Brush.Color:=clGreen;
                  shpLaser680PowOff.Brush.Color:=clDkGray;
             end
         else
             begin
                  shpLaser680PowOn.Brush.Color:=clDkGray;
                  shpLaser680PowOff.Brush.Color:=clMaroon;
             end;


      //Status
      vleLaser680Status.Cells[1,0]:=Format('%d pap',[Laser680.Power_mW ]);
   end
 else
   begin
     shpLaser680PowOn.Brush.Color:=clDkGray;
     shpLaser680PowOff.Brush.Color:=clDkGray;

      vleLaser680Status.Cells[1,0]:=Format('--- pap',[]);
   end;
end;

procedure TformMain.UpdateLaserLabels;
begin
if Laser.Connected then
   begin
       // Alarms
    if Laser.Alarm.PWR then shpLaserAlarmPWR.Brush.Color:=clMaroon
                       else shpLaserAlarmPWR.Brush.Color:=clGreen;
    if Laser.Alarm.LASER_TEC then shpLaserAlarmLASER_TEC.Brush.Color:=clMaroon
                             else shpLaserAlarmLASER_TEC.Brush.Color:=clGreen;
    if Laser.Alarm.LASER then shpLaserAlarmLASER.Brush.Color:=clMaroon
                         else shpLaserAlarmLASER.Brush.Color:=clGreen;
    if Laser.Alarm.TEMP then shpLaserAlarmTEMP.Brush.Color:=clMaroon
                        else shpLaserAlarmTEMP.Brush.Color:=clGreen;
    if Laser.Alarm.BIAS then shpLaserAlarmBIAS.Brush.Color:=clMaroon
                        else shpLaserAlarmBIAS.Brush.Color:=clGreen;
     // OperatingMode
      case Laser.CM_MODE of
      AutoPowCtrl:begin
                  shpLaserOpCPow.Brush.Color:=clGreen;
                  shpLaserOpCCur.Brush.Color:=clDkGray;
                  shpLaserOpModul.Brush.Color:=clDkGray;
                  end;
      AutoCurCtrl:begin
                  shpLaserOpCPow.Brush.Color:=clDkGray;
                  shpLaserOpCCur.Brush.Color:=clGreen;
                  shpLaserOpModul.Brush.Color:=clDkGray;
                  end;
      Modulation: begin
                  shpLaserOpCPow.Brush.Color:=clDkGray;
                  shpLaserOpCCur.Brush.Color:=clDkGray;
                  shpLaserOpModul.Brush.Color:=clGreen;
                  end;
      end;

      OnChangeMode;

      // Power
      case Laser.OP_MODE of
      AutoLaserShutDown:begin
                  shpLaserPowAutoShD.Brush.Color:=clMaroon;
                  shpLaserPowOn.Brush.Color:=clDkGray;
                  shpLaserPowOff.Brush.Color:=clDkGray;
                  end;
      LaserOn    :begin
                  shpLaserPowAutoShD.Brush.Color:=clDkGray;
                  shpLaserPowOn.Brush.Color:=clGreen;
                  shpLaserPowOff.Brush.Color:=clDkGray;
                  end;
      LaserOff  : begin
                  shpLaserPowAutoShD.Brush.Color:=clDkGray;
                  shpLaserPowOn.Brush.Color:=clDkGray;
                  shpLaserPowOff.Brush.Color:=clMaroon;
                  end;
      end;

      //Status
      vleLaserStatus.Cells[1,0]:=Format('%d mW',[Laser.Power_mW ]);
      vleLaserStatus.Cells[1,1]:=Format('%d mA',[Laser.Bias_mA ]);
      vleLaserStatus.Cells[1,2]:=Format('%.1f %sC',[Laser.Temp, #176 ]);
      vleLaserStatus.Cells[1,3]:=Format('%.1f %sC',[Laser.CaseTemp,#176 ]);
   end
 else
   begin
     shpLaserAlarmPWR.Brush.Color:=clDkGray ;
     shpLaserAlarmLASER_TEC.Brush.Color:=clDkGray ;
     shpLaserAlarmLASER.Brush.Color:=clDkGray ;
     shpLaserAlarmTEMP.Brush.Color:=clDkGray;
     shpLaserAlarmBIAS.Brush.Color:=clDkGray;

     shpLaserOpCPow.Brush.Color:=clDkGray;
     shpLaserOpCCur.Brush.Color:=clDkGray;
     shpLaserOpModul.Brush.Color:=clDkGray;

     shpLaserPowAutoShD.Brush.Color:=clDkGray;
     shpLaserPowOn.Brush.Color:=clDkGray;
     shpLaserPowOff.Brush.Color:=clDkGray;

      vleLaserStatus.Cells[1,0]:=Format('--- mW',[]);
      vleLaserStatus.Cells[1,1]:=Format('--- mA',[]);
      vleLaserStatus.Cells[1,2]:=Format('--- %sC',[ #176 ]);
      vleLaserStatus.Cells[1,3]:=Format('--- %sC',[#176 ]);
   end;
end;

procedure TformMain.UpdatePowerOnSample;
var powos, scaleSm, scaleGeom:single;
    powUnits, intUnits:string;

begin
scaleGeom:=100;

if shpPoint.Brush.Color=clGreen then
 scaleGeom:=100;
if shpLine.Brush.Color=clGreen then
 scaleGeom:=4000;


if rgFilterWheel.ItemIndex>=0 then
  begin
  powos:=Laser.Power_mW*strToFloatDef(rgFilterWheel.Items[rgFilterWheel.ItemIndex], 0.3);
  FrameData.PowerOnSample:=powos*1E-3; //watts

  if powos>0.9 then begin powUnits:='mW'; intUnits:='uW/um2'; scaleSm:=1; end
  else
  if powos>0.0009 then begin powUnits:='uW'; intUnits:='nW/um2'; scaleSm:=1e3; end
  else
  if powos>0.0000009 then begin powUnits:='nW'; intUnits:='pW/um2'; scaleSm:=1e6; end;

  lblPowerOnSample.Caption:=  Format('Power'+#13#10+'%.1f %s'+#13#10+#13#10+'Intensity'+#13#10+'%.1f %s' ,[powos*scaleSm, powUnits, powos*scaleSm/scaleGeom*1000, intUnits ]);
  end;

end;

procedure TformMain.UpdateTimings;
begin
 Andor.GetAcquisitionTimings;
 edtExposure.Value:= Andor.ExposureTime;
 edtAccumulationTime.Value:=Andor.AccumTime;
 edtKineticTime.Value:=Andor.KineticTime;
end;

end.
