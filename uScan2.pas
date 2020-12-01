unit uScan2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, sPanel, Vcl.Grids,
  Vcl.StdCtrls, sEdit, sToolEdit, Vcl.Mask, sMaskEdit, sCustomComboEdit,
  AdvUtil, AdvObj, BaseGrid, AdvGrid, sButton, sMemo, Vcl.ComCtrls, Vcl.ToolWin,
  sToolBar, sLabel, acProgressBar, sPageControl, devAndor, FrameData,
  NumArray, NumIPP, System.Threading, System.SyncObjs, System.IniFiles,
  sSplitter, GR32, System.ZLib, sCheckBox;

const
   SCAN_TYPE_ADV=10;
   SCAN_TYPE_ADVXYZ=11;

   WM_SCANNER_FRAME =WM_USER+12;


const XmotStepSize = 1.25/8.0;
      YmotStepSize = 1.25/8.0;
      ZmotStepSize = 1.25/8.0;

type

  TMeasurementInfo = record
    LaserNm:Single;
    LaserPower:Single;
    Exposure:Single;
    DateTime:TDateTime;
    Description: string[60];
  end;


  TDimensionProcedure = procedure(Sender: TObject; dimNo:integer) of object;

  TDimension = record
    steps:Cardinal;
    curStep,
    prevStep:Integer;
    zigZag,
    dir:Boolean;

    name:string[15];
    units:string[15];
    axisVal:TNumArray1<Single>;
    AxisValsHasNames:Boolean;
    axisValNames:array of string[25];

    DimProcedure:TDimensionProcedure;
    end;

type
  TScanThread = class;

  TIterScanner= class
    private
      ScanThread:TScanThread;

    public

      MeasurementInfo:TMeasurementInfo;

      headDimCnt, dimCnt:Cardinal;
      headDimensions, dimensions:array of TDimension;

      curTotalStep,
      totalSteps:Cardinal;

      ScanType: Cardinal;
      headerSize:Cardinal; //jump to data region

      timeStart, time1point:Cardinal;

      M: TMemoryStream;
      F: TFileStream;

    public


    public
      procedure Start;
      procedure Stop;
      procedure Pause;

      function PrepareDimData:boolean;

      function PrepareDimDataXYZ:Boolean;
      function PrepareDimDataAdvanced:Boolean;

      function WriteHeader(filename:string):Boolean;
      function ReadHeader(filename:string):Boolean;
      procedure CalcTimes;

      function CalcDim(dimIdx:byte):byte;
      procedure MovDim;
      procedure TakeShot();

      destructor Destroy; override;



  end;

    TScanThread = class(TThread)
    private
      Scanner:TIterScanner;
      fPause:Boolean;
      fStop:Boolean;

      fOnStart:TNotifyEvent;
      fOnStop:TNotifyEvent;
      fOnAfterFrame:TNotifyEvent;
      fOnAfterWriteHeader:TNotifyEvent;

    protected
      procedure Execute; override;
    public
      property OnStart:TNotifyEvent read fOnStart write fOnStart;
      property OnStop:TNotifyEvent read fOnStop write fOnStop;
      property OnAfterFrame:TNotifyEvent read fOnAfterFrame write fOnAfterFrame;
 //     property OnAfterWriteHeader:TNotifyEvent read fOnAfterWriteHeader write fOnAfterWriteHeader;

      property isPaused:Boolean read fPause;

      constructor Create(AOwner: TIterScanner);

  end;


type
  TFormScan2 = class(TForm)
    pnlTop: TsPanel;
    sgInfo: TStringGrid;
    edtFileName: TsEdit;
    edtDescription: TsEdit;
    edtSaveDir: TsDirectoryEdit;
    sPanel1: TsPanel;
    btnStart: TsButton;
    btnPause: TsButton;
    btnStop: TsButton;
    pbScanProgress: TsProgressBar;
    sLabel1: TsLabel;
    lblScanProgress: TsLabel;
    pcScanType: TsPageControl;
    tsXYZ: TsTabSheet;
    tsAdvanced: TsTabSheet;
    sToolBar2: TsToolBar;
    btnDimX: TToolButton;
    btnDimY: TToolButton;
    btnDimZ: TToolButton;
    btnDimLaserPower: TToolButton;
    sgXYZparams: TAdvStringGrid;
    btnDimTimer: TToolButton;
    sgAdvancedParams: TAdvStringGrid;
    sButton1: TsButton;
    btnDimColimator: TToolButton;
    sPanel2: TsPanel;
    sgDimCoord: TAdvStringGrid;
    shpDim4: TShape;
    shpDim3: TShape;
    shpDim2: TShape;
    shpDim1: TShape;
    shpDim0: TShape;
    lblScannerStatus: TsLabel;
    pnlViewer: TsPanel;
    sSplitter1: TsSplitter;
    btnDimGoniometer: TToolButton;
    btnTerminate: TsButton;
    cbExpTiming: TsCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure sgXYZparamsGetEditorType(Sender: TObject; ACol, ARow: Integer;
      var AEditor: TEditorType);
    procedure FormDestroy(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
    procedure btnPauseClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure sButton1Click(Sender: TObject);
    procedure btnDimXClick(Sender: TObject);
    procedure sgAdvancedParamsGetEditorType(Sender: TObject; ACol,
      ARow: Integer; var AEditor: TEditorType);
    procedure sgAdvancedParamsEditCellDone(Sender: TObject; ACol,
      ARow: Integer);
    procedure FormShow(Sender: TObject);
    procedure edtSaveDirChange(Sender: TObject);
    procedure btnTerminateClick(Sender: TObject);  private
    { Private declarations }

    Andor:TAndor;
    arrDimCoordShapes:array of TShape;
    firstTimeShow:Boolean;

    procedure FillInfoTable;
    procedure FillParamsXYZTable;

    procedure FillParamsAdvancedTable;
    procedure ClearDimShapesColor;



  public
    { Public declarations }
    Scanner:TIterScanner;
    SaveDirectory:string;
    isTakeFrame:Boolean;

    procedure OnScannerStart(Sender:TObject);
    procedure OnScannerStop(Sender:TObject);
    procedure OnAfterFrame(Sender:TObject);

    // procedures of dimensions
    procedure Xmovement(Sender: TObject; dimIdx:integer);
    procedure Ymovement(Sender: TObject; dimIdx:integer);
    procedure Zmovement(Sender: TObject; dimIdx:integer);
    procedure LaserPoWmovement(Sender: TObject; dimIdx:integer);
    procedure TimeRmovement(Sender: TObject; dimIdx:integer);
    procedure ColimatoRmovement(Sender: TObject; dimIdx:integer);
    procedure GoniometeRmovement(Sender: TObject; dimIdx:integer);


    function GetFrame:Boolean;

    function LoadSettings:Boolean;
    function SaveSettings:Boolean;

    procedure Log(str:string);

    procedure AttachViewer;

  end;

var
  FormScan2: TFormScan2;

implementation

uses
  main, Log, uViewer, uSetttings;

{$R *.dfm}

var LocalViewer:TViewer;

{ TFormScan2 }

procedure TFormScan2.AttachViewer;
begin
LocalViewer:=formMain.Viewer;
end;

procedure TFormScan2.btnDimXClick(Sender: TObject);
var dimName:string;
begin

case (Sender as TToolButton).Tag of
0: dimName:='X';
1: dimName:='Y';
2: dimName:='Z';
3: dimName:='LaserPower';
4: dimName:='Timer';
5: dimName:='Colimator';
6: dimName:='Goniometer';

end;

sgAdvancedParams.AddRow;
sgAdvancedParams.AddCheckBox(4,sgAdvancedParams.RowCount-1, False, False);
sgAdvancedParams.Cells[1, sgAdvancedParams.RowCount-1]:=dimName;
sgAdvancedParams.Cells[2, sgAdvancedParams.RowCount-1]:='1';
sgAdvancedParams.Cells[3, sgAdvancedParams.RowCount-1]:='1';
sgAdvancedParams.Cells[5, sgAdvancedParams.RowCount-1]:='1';
sgAdvancedParams.Cells[6, sgAdvancedParams.RowCount-1]:= (Sender as TToolButton).Tag.ToString;

end;

procedure TFormScan2.btnPauseClick(Sender: TObject);
begin
if Scanner.ScanThread=nil then Exit;
if Scanner.ScanThread.Terminated then Exit;
if Scanner.ScanThread.Finished then Exit;


Scanner.Pause;
if Scanner.ScanThread.isPaused then
   lblScannerStatus.Caption:='Paused'
   else
   lblScannerStatus.Caption:='Started';
end;

procedure TFormScan2.btnStartClick(Sender: TObject);
begin
Scanner.Start;

end;

procedure TFormScan2.btnStopClick(Sender: TObject);
begin
Scanner.Stop;
end;

procedure TFormScan2.btnTerminateClick(Sender: TObject);
begin
btnStart.Enabled:=True;
btnStop.Enabled:=True;

if Scanner.ScanThread<>nil then
   begin
   Scanner.ScanThread.Terminate;
   FreeAndNil(Scanner.ScanThread);
   end;

if Scanner.ScanThread<>nil then
   begin
   FormScan2.Log('Scanner is already started');
   Exit;
   end;
end;

procedure TFormScan2.ClearDimShapesColor;
var i:Integer;
begin
for i := 0 to 4 do
      begin
      FormScan2.arrDimCoordShapes[i].Brush.Color:=clDkGray;
      FormScan2.sgDimCoord.Cells[i,1]:='';
      sgInfo.Cells[1,5]:='0';
      sgInfo.Cells[1,6]:='';
      sgInfo.Cells[1,7]:='';

      end;

end;

procedure TFormScan2.ColimatoRmovement(Sender: TObject; dimIdx: integer);
var
    diffNm:Single;
    diffSteps:Integer;
begin
  if Scanner.dimensions[dimIdx].curStep<>Scanner.dimensions[dimIdx].prevStep then
    begin
//    XmotStepSize
//    diffNm:= Scanner.dimensions[dimIdx].axisVal[Scanner.dimensions[dimIdx].curStep] - Scanner.dimensions[dimIdx].axisVal[Scanner.dimensions[dimIdx].prevStep];
    diffSteps:=round( Scanner.dimensions[dimIdx].axisVal[Scanner.dimensions[dimIdx].curStep] - Scanner.dimensions[dimIdx].axisVal[Scanner.dimensions[dimIdx].prevStep] );
    formMain.Controller.MotColim.MovRel(diffSteps);
    Log( Format('X mov on %d steps  [%d]  ',[ Scanner.dimensions[dimIdx].curStep-Scanner.dimensions[dimIdx].prevStep, diffSteps ]) );
    while formMain.Controller.MotColim.Moving do
        Sleep(20);
    end;
end;

procedure TFormScan2.edtSaveDirChange(Sender: TObject);
begin
SaveDirectory:=edtSaveDir.Text;
end;

procedure TFormScan2.FillInfoTable;
begin
sgInfo.RowCount := 8;

sgInfo.Cells[1,0]:='Info';
sgInfo.Cells[0,1]:='Laser nm';
sgInfo.Cells[0,2]:='Laser power';
sgInfo.Cells[0,3]:='Exposure';
sgInfo.Cells[0,4]:='Date';
sgInfo.Cells[0,5]:='Current point';
sgInfo.Cells[0,6]:='Left time';
sgInfo.Cells[0,7]:='Elapsed time';


end;

procedure TFormScan2.FillParamsAdvancedTable;
begin
  sgAdvancedParams.RowCount := 1;
  sgAdvancedParams.ColCount := 7;
  sgAdvancedParams.ColWidths[1]:=65;
  sgAdvancedParams.ColWidths[2]:=45;
  sgAdvancedParams.ColWidths[3]:=80;
  sgAdvancedParams.ColWidths[4]:=45;
  sgAdvancedParams.ColWidths[5]:=50;
  sgAdvancedParams.ColWidths[6]:=1;


  sgAdvancedParams.ShowSelection := false;

  sgAdvancedParams.SpinEdit.MinValue:=1;
  sgAdvancedParams.SpinEdit.MaxValue:=9999;
  sgAdvancedParams.SpinEdit.Increment:=1;

  sgAdvancedParams.Cells[1,0]:='Dimension';
  sgAdvancedParams.Cells[2,0]:='Count';
  sgAdvancedParams.Cells[3,0]:='StepSize';
  sgAdvancedParams.Cells[4,0]:='ZigZag';
  sgAdvancedParams.Cells[5,0]:='Max';
  sgAdvancedParams.Cells[6,0]:='Code';

end;

procedure TFormScan2.FillParamsXYZTable;
begin
  sgXYZparams.Options := sgXYZparams.Options + [goEditing];
  sgXYZparams.RowCount := 4;
  sgXYZparams.ShowSelection := false;

  sgXYZparams.SpinEdit.MinValue:=1;
  sgXYZparams.SpinEdit.MaxValue:=9999;
  sgXYZparams.SpinEdit.Increment:=1;

  sgXYZparams.ColWidths[1]:=45;
  sgXYZparams.ColWidths[2]:=80;
  sgXYZparams.Cells[0,0]:='Dim';
  sgXYZparams.Cells[1,0]:='Count';
  sgXYZparams.Cells[2,0]:='StepSize,um';
  sgXYZparams.Cells[0,1]:='X';
  sgXYZparams.Cells[0,2]:='Y';
  sgXYZparams.Cells[0,3]:='Z';

  sgXYZparams.Cells[1,1]:='1';
  sgXYZparams.Cells[1,2]:='1';
  sgXYZparams.Cells[1,3]:='1';
  sgXYZparams.Cells[2,1]:='1';
  sgXYZparams.Cells[2,2]:='1';
  sgXYZparams.Cells[2,3]:='1';



end;

procedure TFormScan2.FormCreate(Sender: TObject);

begin

FillInfoTable;
FillParamsXYZTable;
FillParamsAdvancedTable;
Scanner:=TIterScanner.Create;

SetLength(arrDimCoordShapes, 5);

arrDimCoordShapes[0]:=shpDim0;
arrDimCoordShapes[1]:=shpDim1;
arrDimCoordShapes[2]:=shpDim2;
arrDimCoordShapes[3]:=shpDim3;
arrDimCoordShapes[4]:=shpDim4;

firstTimeShow:=True;

end;


procedure TFormScan2.FormDestroy(Sender: TObject);
begin

Scanner.Free;
SaveSettings;
end;


procedure TFormScan2.FormShow(Sender: TObject);
begin
Andor:=formMain.Andor;
if firstTimeShow then
   begin
    firstTimeShow:=False;
    ClearDimShapesColor;
   end;
end;

function TFormScan2.GetFrame: Boolean;
var t1:Cardinal;
begin
Result:=False;

TThread.Synchronize(nil,
                    procedure()
                      begin
                      isTakeFrame:=False;
                      if not Andor.StartAcquisition then
                        begin
                           sleep(100);
                            if not Andor.StartAcquisition then
                               begin
                               sleep(100);
                               if not Andor.StartAcquisition then
                               Log('Can''t start Andor for next frame');
                               Exit;
                               end;

                        end;

                      end);

t1:=GetTickCount;
while not isTakeFrame do
  begin
  if GetTickCount-t1>5{min}*60{sec}*1000 then
         Exit(False);

  Sleep(50);
  if FormScan2.Scanner.ScanThread.Terminated then
    begin
      Exit(False);
    end;
  end;
Result:=True;

end;

procedure TFormScan2.GoniometeRmovement(Sender: TObject; dimIdx: integer);
var
    diffNm:Single;
    diffSteps:Integer;
begin
  if Scanner.dimensions[dimIdx].curStep<>Scanner.dimensions[dimIdx].prevStep then
    begin
//    XmotStepSize
//    diffNm:= Scanner.dimensions[dimIdx].axisVal[Scanner.dimensions[dimIdx].curStep] - Scanner.dimensions[dimIdx].axisVal[Scanner.dimensions[dimIdx].prevStep];
    diffSteps:=round( (Scanner.dimensions[dimIdx].axisVal[Scanner.dimensions[dimIdx].curStep] - Scanner.dimensions[dimIdx].axisVal[Scanner.dimensions[dimIdx].prevStep])*3.333333333333  );
    formMain.Controller.FilterWheel.MovRel(diffSteps);
    Log( Format('FW mov on %d steps  [%d]  ',[ Scanner.dimensions[dimIdx].curStep-Scanner.dimensions[dimIdx].prevStep, diffSteps ]) );
    while formMain.Controller.FilterWheel.Moving do
        Sleep(20);
    end;
end;

procedure TFormScan2.LaserPoWmovement(Sender: TObject; dimIdx: integer);
var setPower:Integer;
begin
setPower:= Round( Scanner.dimensions[dimIdx].axisVal[Scanner.dimensions[dimIdx].curStep]);
if setPower>500 then
   setPower:=500;

//setPower:=Round(ScanParams.fPowerStart+ stepIdx*ScanParams.fPowerStep);

if (setPower>=0) and (setPower<=500) then
  begin
  formMain.Laser.SetPower( setPower );
  formMain.spinedtLaserPower.Value:=setPower;
  end;

end;

function TFormScan2.LoadSettings: Boolean;
 var Ini:TIniFile;
  section:string;

  i,j:integer;
begin
result:=False;
Ini:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'ControllerSettings.ini');
  try
      section:='Scan';

//     if Ini.SectionExists(section) then
//         begin
           SaveDirectory :=Ini.ReadString(section,'SaveDirectory','C:\ProjectIDTU\Scan' );
           edtSaveDir.Text:= SaveDirectory;
//         end;

  result:=True;
  finally
  Ini.Free;
  end;
end;

procedure TFormScan2.Log(str: string);
begin
// MemoLog.Lines.Add(str);
  TTask.Run( procedure
      begin
       TThread.Synchronize( nil, procedure
          begin
          if FormLog<>nil then
          if FormLog.MemoLog<>nil then
          FormLog.MemoLog.Lines.Add('Scanner  '+str);
          end);
      end);
end;

procedure TFormScan2.OnAfterFrame(Sender: TObject);
var progress:Single;
begin

if Assigned(LocalViewer) then
   if LocalViewer.IsReadyForAcquiring then
     begin
     LocalViewer.WriteFrame(nil, 0) ;
     LocalViewer.UpdateViewers;
     end;

progress:= Scanner.curTotalStep/Scanner.totalSteps*100.0;
lblScanProgress.Caption := Format('%.1f',[progress]);
pbScanProgress.Position := Trunc(progress);
sgInfo.Cells[1,5] := Format('%d of %d ',[Scanner.curTotalStep, Scanner.totalSteps]);
Scanner.CalcTimes;

end;

procedure TFormScan2.OnScannerStart(Sender: TObject);
begin
btnStart.Enabled:=False;
lblScanProgress.Caption := Format('%.1f%',[0.0]);
pbScanProgress.Position := 0;
lblScannerStatus.Caption:='Started';
//Log('Scanner start');
ClearDimShapesColor;
//


if Assigned(LocalViewer) then
   begin
   LocalViewer.Clear;
   if LocalViewer.ReadHeader(FormScan2.SaveDirectory+'\'+ FormScan2.edtFileName.Text+'.scn2') then
   LocalViewer.PrepareStreams;
   LocalViewer.LoadViewers;
   end;

end;

procedure TFormScan2.OnScannerStop(Sender: TObject);
begin
btnStart.Enabled:=True;
lblScannerStatus.Caption:='Stopped';
//Log('Scanner stop');
end;

function TFormScan2.SaveSettings: Boolean;
 var Ini:TIniFile;
  section:string;

  i,j:integer;
begin
result:=False;
Ini:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'ControllerSettings.ini');
  try
      section:='Scan';
      Ini.WriteString(section,'SaveDirectory',SaveDirectory );

  result:=True;
  finally
  Ini.UpdateFile;
  Ini.Free;
  end;
end;

procedure TFormScan2.sButton1Click(Sender: TObject);
begin
if sgAdvancedParams.RowCount>1 then
  sgAdvancedParams.RemoveRows(sgAdvancedParams.RowCount-1, 1);
end;

procedure TFormScan2.sgAdvancedParamsEditCellDone(Sender: TObject; ACol,
  ARow: Integer);
begin
if (ACol=2) or (ACol=3) then
   // Recalculate Max value
  sgAdvancedParams.Cells[5, ARow]:= FloatToStr(sgAdvancedParams.Cells[2, ARow].ToSingle * sgAdvancedParams.Cells[3, ARow].ToSingle );

end;

procedure TFormScan2.sgAdvancedParamsGetEditorType(Sender: TObject; ACol,
  ARow: Integer; var AEditor: TEditorType);
begin
  if ARow=0 then
      AEditor:=edNone
  else
  case ACol of
  2:AEditor:=edSpinEdit;
  3:AEditor:=edFloat;
  1,5,6:AEditor:=edNone;
  end;
end;

procedure TFormScan2.sgXYZparamsGetEditorType(Sender: TObject; ACol,
  ARow: Integer; var AEditor: TEditorType);
begin
 if ARow>0 then
  begin
  case ACol of
  1:AEditor:=edSpinEdit;
  2:AEditor:=edFloat;
  end;
  end
   else
   AEditor:=edNone;

end;



procedure TFormScan2.TimeRmovement(Sender: TObject; dimIdx: integer);
var  delay:Single;
     timerDelay:Single;
     i:Integer;
begin
if Scanner.curTotalStep>0 then
       begin
       timerDelay:= Scanner.dimensions[dimIdx].axisVal[Scanner.dimensions[dimIdx].curStep]-Scanner.dimensions[dimIdx].axisVal[Scanner.dimensions[dimIdx].prevStep];
       if timerDelay>Andor.AccumTime then
       delay :=  timerDelay-Andor.AccumTime
       else
        delay:= 0; // Andor.AccumTime;

        if delay > 0 then
        for i := 0 to 50 do
           begin
             Sleep( Round(delay)*20);     //1000ms = 100 * 10
             if Scanner.ScanThread.Terminated  then Break;
           end;
       end;
end;

procedure TFormScan2.Xmovement(Sender: TObject; dimIdx: integer);
var
    diffNm:Single;
    diffSteps:Integer;
begin
  if Scanner.dimensions[dimIdx].curStep<>Scanner.dimensions[dimIdx].prevStep then
    begin
//    XmotStepSize
//    diffNm:= Scanner.dimensions[dimIdx].axisVal[Scanner.dimensions[dimIdx].curStep] - Scanner.dimensions[dimIdx].axisVal[Scanner.dimensions[dimIdx].prevStep];
    diffSteps:=round( Scanner.dimensions[dimIdx].axisVal[Scanner.dimensions[dimIdx].curStep]/XmotStepSize) -
               round( Scanner.dimensions[dimIdx].axisVal[Scanner.dimensions[dimIdx].prevStep]/XmotStepSize) ;
    formMain.Controller.MotX.MovRel(diffSteps);
//    Log( Format('X mov on %d steps  [%d]  ',[ Scanner.dimensions[dimIdx].curStep-Scanner.dimensions[dimIdx].prevStep, diffSteps ]) );
    while formMain.Controller.MotX.Moving do
        Sleep(20);
    end;
end;

procedure TFormScan2.Ymovement(Sender: TObject; dimIdx: integer);
var
    diffNm:Single;
    diffSteps:Integer;
begin
  if Scanner.dimensions[dimIdx].curStep<>Scanner.dimensions[dimIdx].prevStep then
    begin
//    YmotStepSize
    diffSteps:=round( Scanner.dimensions[dimIdx].axisVal[Scanner.dimensions[dimIdx].curStep]/XmotStepSize) -
               round( Scanner.dimensions[dimIdx].axisVal[Scanner.dimensions[dimIdx].prevStep]/XmotStepSize) ;
    formMain.Controller.MotY.MovRel(-diffSteps);
    Log( Format('Y mov on %d steps  [%d]  ',[ Scanner.dimensions[dimIdx].curStep-Scanner.dimensions[dimIdx].prevStep, diffSteps ]) );
    while formMain.Controller.MotY.Moving do
        Sleep(20);
    end;
end;

procedure TFormScan2.Zmovement(Sender: TObject; dimIdx: integer);
var
    diffNm:Single;
    diffSteps:Integer;
begin
  if Scanner.dimensions[dimIdx].curStep<>Scanner.dimensions[dimIdx].prevStep then
    begin
//    ZmotStepSize
    diffSteps:=round( Scanner.dimensions[dimIdx].axisVal[Scanner.dimensions[dimIdx].curStep]/XmotStepSize) -
               round( Scanner.dimensions[dimIdx].axisVal[Scanner.dimensions[dimIdx].prevStep]/XmotStepSize) ;
    formMain.Controller.MotZ.MovRel(-diffSteps);
//    Log( Format('Z mov on %d steps  [%d]  ',[ Scanner.dimensions[dimIdx].curStep-Scanner.dimensions[dimIdx].prevStep, diffSteps ]) );
    while formMain.Controller.MotZ.Moving do
       Sleep(20);
    end;

    //  Add exponential timing
    if not cbExpTiming.Checked then
    formMain.ExpBGlayer:=-1
    else
     begin
      TThread.Synchronize(nil, procedure
        begin
        formMain.ExpBGlayer:= dimIdx;
        Log('ExpBGlayer='+formMain.ExpBGlayer.toString);
        formMain.edtExposure.Text := Format('%.2f',[FormMain.expTstart*exp(FormMain.expK*Scanner.dimensions[dimIdx].curStep)]);
        formMain.btnSetExposure.OnClick(Self);
       end);
     end;

end;

{ TIterScanner }

function TIterScanner.CalcDim(dimIdx: byte):byte;
var
  i: Integer;
begin
  if dimIdx=0 then
    begin
    for i := 0 to dimCnt-1 do
     dimensions[i].prevStep:=dimensions[i].curStep;

    result:=0;
    end;

if curTotalStep>0 then
  begin
    //check ZigZag
        if dimensions[dimIdx].zigZag then
            begin
              if dimensions[dimIdx].dir then
                Dec(dimensions[dimIdx].curStep)
              else
                Inc(dimensions[dimIdx].curStep);
            end
         else
           Inc(dimensions[dimIdx].curStep);

     //check Overflow
     if (dimensions[dimIdx].curStep = dimensions[dimIdx].steps) or (dimensions[dimIdx].curStep<0 ) then
         begin // overflow
          //check ZigZag
          if dimensions[dimIdx].zigZag then
             begin
               if dimensions[dimIdx].dir then
                dimensions[dimIdx].curStep:=0
              else
                dimensions[dimIdx].curStep:=dimensions[dimIdx].steps-1;

              dimensions[dimIdx].dir:=not dimensions[dimIdx].dir;
             end
           else
             dimensions[dimIdx].curStep:=0;

             CalcDim(dimIdx+1);
         end;

  end;

end;

procedure TIterScanner.CalcTimes;
var timeDelta, timeElapsed :Cardinal;
    timeOneFrame:Single;
    h,m,s, hh,mm,ss :Integer;
begin
timeDelta:=(GetTickCount-timeStart) div 1000;
if curTotalStep=1 then time1point:=GetTickCount;

h:=timeDelta div 3600;
m:=(timeDelta-h*3600) div 60;
s:= timeDelta-h*3600-m*60;

FormScan2.sgInfo.Cells[1,6]:=Format('%2dh:%2dm:%2ds',[h,m,s]);

if curTotalStep>1 then
  begin
  timeDelta:=(GetTickCount-time1point) div 1000;

  timeOneFrame:= timeDelta / (curTotalStep-1);
  timeElapsed:= round((totalSteps-curTotalStep)*timeOneFrame);

  hh:=timeElapsed div 3600;
  mm:=(timeElapsed-hh*3600) div 60;
  ss:= timeElapsed-hh*3600-mm*60;

  FormScan2.sgInfo.Cells[1,7]:=Format('%2dh:%2dm:%2ds',[hh,mm,ss]);
  end;

end;

destructor TIterScanner.Destroy;
var i, len:Integer;
begin
len := Length(headDimensions);

if len>0 then
  begin
  for i := 0 to len-1 do
   begin
   if headDimensions[i].axisVal<>nil then headDimensions[i].axisVal.Free;
   SetLength(headDimensions[i].axisValNames,0);
   end;
  SetLength(headDimensions,0);
  end;

len := Length(dimensions);

if len>0 then
  begin
  for i := 0 to len-1 do
   begin
   if dimensions[i].axisVal<>nil then dimensions[i].axisVal.Free;
      SetLength(dimensions[i].axisValNames,0);
   end;
  SetLength(dimensions,0);
  end;

  inherited;
end;

procedure TIterScanner.MovDim;
var i:Integer;
    s,d:string;
begin
//s:='';
//d:='';
for i := 0 to dimCnt-1 do
   if i<Length(FormScan2.arrDimCoordShapes) then
  begin
//   s:=dimensions[i].curStep.ToString+' '+ s;
//   d:=IntToStr(dimensions[i].curStep-dimensions[i].prevStep)+' '+d;
   FormScan2.sgDimCoord.Cells[FormScan2.sgDimCoord.ColCount-1-i, 1]:=dimensions[i].curStep.ToString;

   if dimensions[i].curStep-dimensions[i].prevStep =0 then
      FormScan2.arrDimCoordShapes[i].Brush.Color:=clDkGray
   else
   if dimensions[i].curStep-dimensions[i].prevStep >0 then
      FormScan2.arrDimCoordShapes[i].Brush.Color:=clGreen
   else
      FormScan2.arrDimCoordShapes[i].Brush.Color:=clRed;
  end;
//  Log(s+'   '+d);


  for i := 0 to dimCnt-1 do
    if Assigned(dimensions[i].DimProcedure) then
      dimensions[i].DimProcedure(Self, i);

  //wait for end of movement
end;

procedure TIterScanner.Pause;
begin
ScanThread.fPause:=not ScanThread.fPause;
end;

function TIterScanner.PrepareDimData: boolean;
var cnt, i :integer;
  j: Integer;
  dx,dy:TNumArray1<Single>;
begin
  result:=False;

  if (formMain.Andor.Xdim=0) or (formMain.Andor.Ydim=0) then
     Exit(False);
  if Length(formMain.HGraph.Curve)=0 then
    Exit(False);

   // Header Dimensions
if (formMain.Andor.ReadMode=rmImage) or (formMain.Andor.ReadMode=rmRandomTrack) then
   headDimCnt:=2
  else
   headDimCnt:=1;

  SetLength(headDimensions, headDimCnt);

  /// WaveLength Dim


    cnt:=formMain.Andor.Xdim;
    headDimensions[0].steps:=cnt;
    headDimensions[0].zigZag:=False;
    headDimensions[0].curStep:=0;
    headDimensions[0].prevStep:=0;
    headDimensions[0].dir:=False;
    headDimensions[0].name:='WaveLength';

    headDimensions[0].axisVal :=TNumArray1<Single>.Create(cnt);

    if Length(formMain.HGraph.Curve)>0 then
    for i := 0 to cnt-1 do
        headDimensions[0].axisVal[i]:=formMain.HGraph.Curve[0].data.x.Values[i];

    case formMain.XScaleUnits of
             xsPixels:begin
                      headDimensions[0].units:='pix';
                      end;
             xsNm:    begin
                      headDimensions[0].units:='nm';
                      end;
             xsCm:    begin
                      headDimensions[0].units:='cm-1';
                      end;
    end;
    headDimensions[0].AxisValsHasNames:=False;

  /// MultiLine Dim
 if (formMain.Andor.ReadMode=rmImage)then
   begin
    cnt:=formMain.Andor.Ydim;
    headDimensions[1].steps:=cnt;
    headDimensions[1].zigZag:=False;
    headDimensions[1].name:='Line';

    headDimensions[1].curStep:=0;
    headDimensions[1].prevStep:=0;
    headDimensions[1].dir:=False;

    headDimensions[1].axisVal :=TNumArray1<Single>.Create(cnt);
    for i := 0 to cnt-1 do
     headDimensions[1].axisVal[i]:=i;

   headDimensions[1].AxisValsHasNames:=False;
   end;

 if (formMain.Andor.ReadMode=rmRandomTrack) then
   begin
    cnt:=formMain.Andor.Ydim;
    headDimensions[1].steps:=cnt;
    headDimensions[1].zigZag:=False;
    headDimensions[1].name:='CrystalRow';

    headDimensions[1].curStep:=0;
    headDimensions[1].prevStep:=0;
    headDimensions[1].dir:=False;

    headDimensions[1].axisVal :=TNumArray1<Single>.Create(cnt);
    for i := 0 to cnt-1 do
     headDimensions[1].axisVal[i]:=i;

    headDimensions[1].AxisValsHasNames:=True;
    i:=0;
    SetLength(headDimensions[1].axisValNames, cnt);
    for j := 0 to Length(formMain.Andor.RandomTrackParams)-1 do
       if formMain.Andor.RandomTrackParams[j].used then
          begin
          headDimensions[1].axisValNames[i]:=formMain.Andor.RandomTrackParams[j].name;
          Inc(i);
          end;

   end;

  // + Scan Dimensions

  if FormScan2.pcScanType.ActivePage = FormScan2.tsAdvanced then
    result:= PrepareDimDataAdvanced
  else
    if FormScan2.pcScanType.ActivePage = FormScan2.tsXYZ then
    result:= PrepareDimDataXYZ;

  if not Result then
     begin
      ShowMessage('Incorrect input data');
      Exit;
     end;

  if result then
  result:= WriteHeader(FormScan2.SaveDirectory+'\'+ FormScan2.edtFileName.Text+'.scn2');


end;

function TIterScanner.PrepareDimDataAdvanced: Boolean;
var i,j,k, cnt, dimType:Integer;
   stepSize:Single;
begin
ScanType:=SCAN_TYPE_ADV;
result:=False;
dimCnt:=0;

 for i := 1 to FormScan2.sgAdvancedParams.RowCount-1 do
    if FormScan2.sgAdvancedParams.Cells[2,i].ToInteger >1 then
    begin
    Inc(dimCnt);
    SetLength(dimensions, dimCnt);
    cnt:=FormScan2.sgAdvancedParams.Cells[2,i].ToInteger;
    dimType:=FormScan2.sgAdvancedParams.Cells[6,i].ToInteger;

    dimensions[dimCnt-1].steps:=cnt;
    dimensions[dimCnt-1].curStep:=0;
    dimensions[dimCnt-1].prevStep:=0;
    dimensions[dimCnt-1].dir:=False;
    dimensions[dimCnt-1].zigZag:=FormScan2.sgAdvancedParams.IsChecked(4,i);

    stepSize:=FormScan2.sgAdvancedParams.Cells[3,i].ToSingle;
     dimensions[dimCnt-1].axisVal :=TNumArray1<Single>.Create(cnt);

    for j := 0 to cnt-1 do
     dimensions[dimCnt-1].axisVal[j]:=j*stepSize;    //formula in the future

     dimensions[dimCnt-1].AxisValsHasNames:=False; //depends of future instrument


    ///!!!!! if AxisValsHasNames  uncomment

//    SetLength(dimensions[dimCnt-1].axisValNames, cnt);
//    for j := 0 to cnt-1 do
//          begin
//          dimensions[dimCnt-1].axisValNames[j]:='AxisName '+j.ToString;
//          end;



        //0: dimName:='X';
        //1: dimName:='Y';
        //2: dimName:='Z';
        //3: dimName:='LaserPower';
        //4: dimName:='Timer';
        //5: dimName:='Colimator';

    case dimType of
    0:begin
      dimensions[dimCnt-1].name:='X';
      dimensions[dimCnt-1].units:='um';
      dimensions[dimCnt-1].DimProcedure:=FormScan2.Xmovement;
      end;
    1:begin
      dimensions[dimCnt-1].name:='Y';
      dimensions[dimCnt-1].units:='um';
      dimensions[dimCnt-1].DimProcedure:=FormScan2.Ymovement;
      end;
    2:begin
      dimensions[dimCnt-1].name:='Z';
      dimensions[dimCnt-1].units:='um';
      dimensions[dimCnt-1].DimProcedure:=FormScan2.Zmovement;
      end;
    3:begin
      dimensions[dimCnt-1].name:='LaserPower';
      dimensions[dimCnt-1].units:='mW';
      dimensions[dimCnt-1].DimProcedure:=FormScan2.LaserPoWmovement;
      end;
    4:begin
      dimensions[dimCnt-1].name:='Timer';
      dimensions[dimCnt-1].units:='s';
      dimensions[dimCnt-1].DimProcedure:=FormScan2.TimeRmovement;
      end;
    5:begin
      dimensions[dimCnt-1].name:='Colim';
      dimensions[dimCnt-1].units:='steps';
      dimensions[dimCnt-1].DimProcedure:=FormScan2.ColimatoRmovement;
      end;
    6:begin
      dimensions[dimCnt-1].name:='Goniometer';
      dimensions[dimCnt-1].units:='grad';
      dimensions[dimCnt-1].DimProcedure:=FormScan2.GoniometeRmovement;
      end;
    end;


    end;

  Result:=True;

end;

function TIterScanner.PrepareDimDataXYZ: Boolean;
var i,j, cnt:Integer;
   stepSize:Single;
begin
  ScanType:=SCAN_TYPE_ADVXYZ;
  result:=False;
  dimCnt:=0;

 for i := 1 to FormScan2.sgXYZparams.RowCount-1 do
    if FormScan2.sgXYZparams.Cells[1,i].ToInteger >1 then
    begin
    Inc(dimCnt);
    SetLength(dimensions, dimCnt);
    cnt:=FormScan2.sgXYZparams.Cells[1,i].ToInteger;
    dimensions[dimCnt-1].steps:=cnt;
    dimensions[dimCnt-1].units:='um';
    dimensions[dimCnt-1].zigZag:=True;
    dimensions[dimCnt-1].curStep:=0;
    dimensions[dimCnt-1].prevStep:=0;
    dimensions[dimCnt-1].dir:=False;

    dimensions[dimCnt-1].name:=FormScan2.sgXYZparams.Cells[0,i];
    dimensions[dimCnt-1].axisVal :=TNumArray1<Single>.Create(cnt);

    case i of
    1:dimensions[dimCnt-1].DimProcedure:=FormScan2.Xmovement;
    2:dimensions[dimCnt-1].DimProcedure:=FormScan2.Ymovement;
    3:dimensions[dimCnt-1].DimProcedure:=FormScan2.Zmovement;
    end;

    stepSize:=FormScan2.sgXYZparams.Cells[2,i].ToSingle;
    for j := 0 to cnt-1 do
     dimensions[dimCnt-1].axisVal[j]:=j*stepSize;

    dimensions[dimCnt-1].AxisValsHasNames:=False;
    end;


  Result:=True;
end;

function TIterScanner.ReadHeader(filename: string): Boolean;
var FIni:TMemIniFile;
    tmpS, section:string;

    HmeasurementInfo:TMeasurementInfo;
    Hdimensions:array of TDimension;

    Hscantype,
    HSize,
    HdimCount:Cardinal;
    Fmt     : TFormatSettings;
    i,len:Integer;

procedure ReadDim(var dimension:TDimension; dimIdx:integer);
var
  I: Integer;
  SL: TStringList;
  begin
  section:='Dim'+dimIdx.ToString;

  dimension.name:=FIni.ReadString(section,'Name', 'Dim'+dimIdx.ToString);
  dimension.units:=FIni.ReadString(section,'Units', '');
  dimension.steps:=FIni.ReadInteger(section,'Steps', 0);
  dimension.zigZag:=FIni.ReadBool(section,'ZigZag', false);

  if dimension.steps=0 then Exit;

  dimension.axisVal:=TNumArray1<Single>.Create(dimension.steps);

  SL := TStringList.Create;
  try
    SL.StrictDelimiter := True;
    SL.CommaText:= FIni.ReadString(section, 'axisVal', '');

    if SL.Count<>dimension.steps then FormScan2.Log('Dim['+dimension.name+'] axis read error');

    for I := 0 to SL.Count - 1 do // dimension.steps-1
      dimension.axisVal[I]:= SL.Strings[I].ToSingle;  //Hope its equal
  finally
    SL.Free;
  end;



  dimension.AxisValsHasNames:=FIni.ReadBool(section,'AxisValsHasNames', False);

  if dimension.steps>0 then
  if dimension.AxisValsHasNames then
   begin
     SetLength(dimension.axisValNames, dimension.steps );

     SL := TStringList.Create;
      try
        SL.StrictDelimiter := True;

        SL.CommaText:=FIni.ReadString(section, 'axisValNames', '');

        if SL.Count<>dimension.steps then FormScan2.Log('Dim['+dimension.name+'] axisName read error');


        for I := 0 to SL.Count - 1 do  //dimension.steps - 1 do
          dimension.axisValNames[I]:= SL.Strings[I];

      finally
        SL.Free;
      end;

   end;

  end;


begin
  if not FileExists(filename) then Exit(False);

  FIni:=TMemIniFile.Create(filename);
  try
  section:='Main';

  Hscantype:=FIni.ReadInteger(section,'ScanType', SCAN_TYPE_ADV );
     tmpS:=FIni.ReadString(section, 'HeaderSize', '0');
  HSize:=StrToIntDef(Trim(tmpS),0);
  HdimCount:=FIni.ReadInteger(section,'DimCount', 0);

  HmeasurementInfo.LaserNm:=FIni.ReadFloat(section, 'LaserNm', 785);
  HmeasurementInfo.LaserPower:=FIni.ReadFloat(section,  'LaserPower', 0);
  HmeasurementInfo.Exposure:=FIni.ReadFloat(section, 'Exposure', 0);
     tmpS:=FIni.ReadString(section, 'DateTime', '');

  Fmt.ShortDateFormat:='dd/mm/yyyy';
  Fmt.DateSeparator:='/';
  Fmt.LongTimeFormat:='hh:nn:ss';
  Fmt.TimeSeparator:=':';

  try
  HmeasurementInfo.DateTime:=StrToDateTime(tmpS, Fmt);
  except
  HmeasurementInfo.DateTime:= Now;
  end;

  HmeasurementInfo.Description:=FIni.ReadString(section,'Description','' );

  if HdimCount>0 then

  Result:=True;

//  FormScan2.MemoLog.Lines.Add(Hscantype.ToString);
//  FormScan2.MemoLog.Lines.Add(HSize.ToString);
//  FormScan2.MemoLog.Lines.Add(HdimCount.ToString);
//  FormScan2.MemoLog.Lines.Add('');
//  FormScan2.MemoLog.Lines.Add(HmeasurementInfo.LaserNm.ToString);
//  FormScan2.MemoLog.Lines.Add(HmeasurementInfo.LaserPower.ToString);
//  FormScan2.MemoLog.Lines.Add(HmeasurementInfo.Exposure.ToString);
//  FormScan2.MemoLog.Lines.Add( FormatDateTime('dd/mm/yyyy hh:nn:ss',HmeasurementInfo.DateTime) );

  SetLength(Hdimensions, HdimCount);
  for i := 0 to HdimCount-1 do
   ReadDim(Hdimensions[i], i);

  finally
  FIni.Free;
  end;

if HdimCount>0 then
  begin
  for i := 0 to HdimCount-1 do
   begin
   if Hdimensions[i].axisVal<>nil then Hdimensions[i].axisVal.Free;
   SetLength(HDimensions[i].axisValNames,0);
   end;
  SetLength(Hdimensions,0);
  end;

end;

procedure TIterScanner.Start;
begin

if not PrepareDimData then
       begin
       Exit;
       end;


if FormScan2.Andor.AcquisitionMode=amRunTillAbort then
formMain.rgAcquisitionMode.ItemIndex:=0;
// FormScan2.Andor.SetAcquisitionMode(amSingleScan);

//if Assigned(OnAfterWriteHeader) then
//     OnAfterFrame(OnAfterWriteHeader);

if ScanThread<>nil then
if ScanThread.Finished then
   FreeAndNil(ScanThread);

if ScanThread<>nil then
   begin
   FormScan2.Log('Scanner is already started');
   Exit;
   end;

ScanThread:=TScanThread.Create(Self);
ScanThread.fPause:=False;
ScanThread.fStop:=False;

ScanThread.OnStart:=FormScan2.OnScannerStart;
ScanThread.OnStop:=FormScan2.OnScannerStop;
ScanThread.OnAfterFrame:=FormScan2.OnAfterFrame;

//ScanThread.FreeOnTerminate:=True;
ScanThread.Start;

end;

procedure TIterScanner.Stop;
begin
if ScanThread=nil then
  begin
  FormScan2.OnScannerStop(Self);
  Exit;
  end;
//if ScanThread.Finished then Exit;


ScanThread.Terminate;
//Scanner.fStop:=True;
ScanThread.WaitFor;

FreeAndNil(ScanThread);
end;

procedure TIterScanner.TakeShot;
begin
if FormScan2.GetFrame then
  begin
    F := TFileStream.Create(FormScan2.SaveDirectory+'\'+ FormScan2.edtFileName.Text+'.scn2', fmOpenWrite or fmShareDenyWrite );
//      if F=nil then FormScan2.Log('Can`t open fileStream to add next point')
//      else
        try
        F.Seek(0,soEnd);
        F.WriteBuffer(FormMain.FrameData.CalcData.Buffer^, FormMain.FrameData.CalcData.UsedSize);
        finally
        FreeAndNil(F);
        end;

        //  FormScan2.Log('     TakeShot');
//    Sleep(500);
//    Application.ProcessMessages;
  end;

end;

function TIterScanner.WriteHeader(filename:string): Boolean;
var
  FIni:TMemIniFile;
  i: Integer;
  buttonSelected:integer;
  section, tmpStr:string;
  HeaderSize:Cardinal;

  ImgStream, ZipStream:TMemoryStream;
  LZip: TZCompressionStream;

  ssize:Integer;
  tmpSize, preHeaderSize:Int64;

  btmHeader:TBitmap32;
  imgOffset:Integer;

  preHeader:array of Int64;
  lsIni:TStringList;


procedure UpdatePreHeader;
begin
//  F := TFileStream.Create(filename, fmCreate or fmShareDenyWrite );
  try
  F.Position:=0;
  F.WriteBuffer(preHeader[0], Length(preHeader)*sizeOf(Int64) );
  finally
//  F.Free;
  end;
end;

procedure WriteDim({var} dimension:TDimension; dimIdx:integer);
var
  I: Integer;
  SL: TStringList;
  begin
  section:='Dim'+dimIdx.ToString;

  FIni.WriteString(section,'Name', dimension.name);
  FIni.WriteString(section,'Units', dimension.units);
  FIni.WriteInteger(section,'Steps', dimension.steps);
  FIni.WriteBool(section,'ZigZag', dimension.zigZag);

  SL := TStringList.Create;
  try
    SL.StrictDelimiter := True;

    for I := 0 to dimension.steps - 1 do
      SL.Add(dimension.axisVal[I].ToString);

    FIni.WriteString(section, 'axisVal', SL.CommaText);
  finally
    SL.Free;
  end;

  FIni.WriteBool(section,'AxisValsHasNames', dimension.AxisValsHasNames);

  if dimension.AxisValsHasNames then
   begin
     SL := TStringList.Create;
      try
        SL.StrictDelimiter := True;

        for I := 0 to dimension.steps - 1 do
          SL.Add(dimension.axisValNames[I]);

        FIni.WriteString(section, 'axisValNames', SL.CommaText);
      finally
        SL.Free;
      end;

   end;

  end;

begin


  if FileExists(filename) then
  begin
    buttonSelected := MessageDlg('Overwrite Existing file?',mtWarning, mbYesNo, 0);
    if buttonSelected <> mrYes then  Exit(False)
      else DeleteFile(filename);
  end;

  F := TFileStream.Create(filename, fmCreate or fmShareDenyWrite );

  //Write preHeader layout
  preHeaderSize:=32;
  SetLength(preHeader, preHeaderSize);
  for i := 0 to preHeaderSize-1 do
     preHeader[i]:=0;

  preHeader[0]:=7767; //Magic number
  preHeader[1]:=preHeaderSize; //
  preHeader[2]:=010; // version

  preHeader[3]:=preHeaderSize*SizeOf(Int64); // Header offset
  preHeader[4]:=0;  // Header size

//  preHeader[5]:=0;  // Bitmap offset
//  preHeader[6]:=0;  // Bitmap size
//
//  preHeader[7]:=0;  // Bitmap width
//  preHeader[8]:=0;  // Bitmap height

//
//  preHeader[9]:=0;  // Scan offset
//  preHeader[10]:=0;  // Scan size
//
//  preHeader[11]:=0;  // Decomposition header offset
//  preHeader[12]:=0;  // Decomp header size
//
//  preHeader[13]:=0;  // Decomposition offset
//  preHeader[14]:=0;  // Decomp size

  UpdatePreHeader;


  FIni:=TMemIniFile.Create('tmp.ini');

  section:='Main';

  FIni.WriteInteger(section, 'ScanType', ScanType);
  FIni.WriteString(section, 'HeaderSize', Format('%.9d',[ HeaderSize]) );
  FIni.WriteInteger(section, 'DimCount', headDimCnt+dimCnt);

  MeasurementInfo.LaserNm:=formMain.Laser.WaveLength;
  MeasurementInfo.LaserPower:=formMain.Laser.Power_mW;
  MeasurementInfo.Exposure:=formMain.Andor.ExposureTime;

  MeasurementInfo.DateTime:=Now;
  MeasurementInfo.Description:=FormScan2.edtDescription.Text;

  FormScan2.sgInfo.Cells[1,1]:= MeasurementInfo.LaserNm.ToString;
  FormScan2.sgInfo.Cells[1,2]:= MeasurementInfo.LaserPower.ToString;
  FormScan2.sgInfo.Cells[1,3]:= Format('%.1f',[MeasurementInfo.Exposure]);
  FormScan2.sgInfo.Cells[1,4]:= FormatDateTime('dd/mm/yyyy hh:nn:ss', MeasurementInfo.DateTime ); //    DateTimeToStr( MeasurementInfo.DateTime);

  FIni.WriteFloat(section, 'LaserNm', MeasurementInfo.LaserNm);
  FIni.WriteFloat(section, 'LaserPower', MeasurementInfo.LaserPower);
  FIni.WriteFloat(section, 'Exposure', MeasurementInfo.Exposure);
  FIni.WriteDateTime(section, 'DateTime', MeasurementInfo.DateTime);
  FIni.WriteString(section, 'Description', MeasurementInfo.Description);

// HeaderDimensions
  if headDimCnt>0 then
  for i := 0 to headDimCnt-1 do
    WriteDim( headDimensions[i], i);

// ScanDimensions
  if dimCnt>0 then
  for i := 0 to dimCnt-1 do
    WriteDim( dimensions[i], i+headDimCnt);

  Result:= True;

  lsIni:=TStringList.Create;
  lsIni.Add('');

  try
    try
      FIni.GetStrings(lsIni);
      F.Seek(0, soEnd);
      lsIni.SaveToStream(F);

     // FIni.UpdateFile;
    except
       Result:=False;
    end;
  finally
    FIni.Free;
    lsIni.Free;
  end;


  preHeader[4]:=F.Size-preHeader[3];  // Header size
  preHeader[5]:=F.Size;               // Bitmap offset

  ///  Write image to Header
   btmHeader:= formMain.ToupcamG.GetImageToHeader;
  //
 if btmHeader<>nil then
   begin
      preHeader[7]:=btmHeader.Width;
      preHeader[8]:=btmHeader.Height;


      ImgStream:=TMemoryStream.Create;
      ZipStream:=TMemoryStream.Create;
      try
       btmHeader.SaveToStream(ImgStream);

       LZip := TZCompressionStream.Create(clDefault, ZipStream);
        try
         { Compress data. }
         LZip.CopyFrom(ImgStream, 0);

         F.Seek(0, soFromEnd);
         F.CopyFrom(ZipStream, 0);

         finally
         LZip.Free;
         end;

      finally
       ImgStream.Free;
       btmHeader.Free;
       ZipStream.Free;
      end;
   end;

   preHeader[6]:=F.Size-preHeader[5];   // Bitmap ZIP size = FileSize-Bitmap offset
   preHeader[9]:=F.Size;

  UpdatePreHeader;

  if not Result then
    begin
    ShowMessage('Save file access error');
    end;

 F.Free;

end;

{ TScanThread }

constructor TScanThread.Create(AOwner: TIterScanner);
begin
inherited Create(True);
Scanner:=AOwner;
end;


procedure TScanThread.Execute;
var i:Integer;
begin
with Scanner do
begin

curTotalStep:=0;
totalSteps:=1;

if dimCnt>0 then
  for i := 0 to dimCnt-1 do
  totalSteps:=totalSteps*dimensions[i].steps;
end;

Scanner.timeStart:=GetTickCount;

if Assigned(OnStart) then
   OnStart(Self);

repeat
 Scanner.CalcDim(0);
 Scanner.MovDim;

 while fPause do
   begin
   sleep(100);
   if fStop or Terminated then
      Break;
   end;

 if not Terminated then
   begin

     Scanner.TakeShot;
     inc(Scanner.curTotalStep);

     if Assigned(OnAfterFrame) then
       OnAfterFrame(Self);

       Scanner.CalcTimes;

   end;

 while fPause do
   begin
   sleep(100);
   if fStop or Terminated then
      Break;
   end;

Until (Scanner.curTotalStep = Scanner.totalSteps) or fStop or Terminated;

if Assigned(OnStop) then
   OnStop(Self);
end;



end.
