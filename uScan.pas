unit uScan;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,  devAndor, devController, FrameData,
  Vcl.StdCtrls, sGroupBox, Vcl.ExtCtrls, Vcl.Grids, Vcl.ValEdit, Vcl.ComCtrls,
  sPageControl, sToolEdit, Vcl.Mask, sMaskEdit, sCustomComboEdit, acPathDialog,
  sEdit, sPanel, Vcl.Buttons, sBitBtn, sSpeedButton, System.Threading, System.SyncObjs,
  sButton, NumArray, NumIPP, sSplitter, uImageGraph, uLeftGraph, uBottomGraph,
  sTrackBar, Vcl.Menus, sStatusBar, sDialogs, uSaveMultiCSV, sSkinProvider, devControllerM, System.IniFiles;

type TScanType = (stXY=0, stKinetic=1, stXZ=2, stLaserPower=3, stOneAxisScan=4);
type TAutoScale = (asGlobal=0, asLocal=1, asCustom=2);


type TScanParams = class (TPersistent)
    private
        /// ScanParams
    fRowCnt, fColCnt, fTCnt:integer;
    fdimY, fdimX:integer;
    fLi:integer;
    fXstep, fYstep, fZstep, fTstep :single;
    fZigZag:Boolean;

    fPowerStep, fPowerStart, fPowerFinish:Single;
    fPowerCnt:Integer;

    public
    Exposure:Single;
    scanPoints, totalPoints:Integer;
    ScanType:TScanType;
    Xaxis:TNumArray1<Single>;
    property RowCnt:Integer read fRowCnt;
    property ColCnt:Integer read fColCnt;

    constructor Create;

  end;


type
  TFormScan = class(TForm)
    sPanel1: TsPanel;
    pcScanType: TsPageControl;
    tsXY: TsTabSheet;
    sGroupBox1: TsGroupBox;
    vleScanParamsXY: TValueListEditor;
    tsKinetic: TsTabSheet;
    DirectoryEdit: TsDirectoryEdit;
    FileNameEdit: TsEdit;
    sPanel2: TsPanel;
    btnStart: TsBitBtn;
    btnStop: TsBitBtn;
    gbStatus: TsGroupBox;
    btnPause: TsSpeedButton;
    vleStatus: TValueListEditor;
    sGroupBox3: TsGroupBox;
    vleScanParamsKinetic: TValueListEditor;
    pnlGraphMain: TsPanel;
    splitterGraph2: TsSplitter;
    pnlGraphTop: TsPanel;
    splitterGraph1: TsSplitter;
    pnlLGraph: TsPanel;
    pnlIGraph: TPanel;
    pnlGraphBottomLeft: TsPanel;
    pnlHGraph: TsPanel;
    pnlSpectra: TsPanel;
    sSplitter1: TsSplitter;
    pnlBottom: TsPanel;
    MainMenu1: TMainMenu;
    F1: TMenuItem;
    rgAutoScale: TsRadioGroup;
    StatusBarGraph: TsStatusBar;
    S1: TMenuItem;
    t1: TMenuItem;
    SaveDialog: TsSaveDialog;
    E1: TMenuItem;
    N1: TMenuItem;
    OpenDialog: TsOpenDialog;
    L1: TMenuItem;
    O1: TMenuItem;
    ValueListEditor1: TValueListEditor;
    A1: TMenuItem;
    sSkinProvider1: TsSkinProvider;
    tsXZ: TsTabSheet;
    sGroupBox2: TsGroupBox;
    vleScanParamsXZ: TValueListEditor;
    tsPower: TsTabSheet;
    sGroupBox4: TsGroupBox;
    vleScanParamsPower: TValueListEditor;
    btnReturnToStart: TsButton;
    tsConf: TsTabSheet;
    vleScanParamsOneAxis: TValueListEditor;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure vleScanParamsXYSetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: string);
    procedure btnPauseClick(Sender: TObject);
    procedure vleScanParamsKineticSetEditText(Sender: TObject; ACol,
      ARow: Integer; const Value: string);
    procedure pnlLGraphResize(Sender: TObject);
    procedure rgAutoScaleChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure t1Click(Sender: TObject);
    procedure E1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure O1Click(Sender: TObject);
    procedure A1Click(Sender: TObject);
    procedure vleScanParamsXZSetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: string);
    procedure vleScanParamsPowerSetEditText(Sender: TObject; ACol,
      ARow: Integer; const Value: string);
    procedure vleScanParamsPowerKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure vleScanParamsPowerExit(Sender: TObject);
    procedure vleScanParamsPowerSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure btnReturnToStartClick(Sender: TObject);
    procedure DirectoryEditChange(Sender: TObject);
  private
    { Private declarations }
    Andor:TAndor;
    Controller:TControllerM;
    FrameData:TFrameData;
    fScanTask:array[0..0]of ITask;
    fStopScanning:Boolean;
    fPaused:Boolean;

    M: TMemoryStream;
    F: TFileStream;
    AutoScale:TAutoScale;

    SpectraData:TNumArray2<Single>;
    NormData:TNumArray2<Single>;
    ImgData:TNumArray2<Byte>;

    stepsWellDone:TPoint;


    procedure StartScan;
    procedure StopScan;
    function AllocScanBuffers:Boolean;
    function OpenMap(const FileName: string):integer;

    function GetFrame: Boolean;

    function MakeStepXY(const x,y:integer): Boolean;
    function MakeStepXZ(const x,z:integer): Boolean;
    function MakeStepLaserPower(const stepIdx:Integer):Boolean;
    function MakeStepOneAxis(stepSize:Integer):Boolean;
//    function MakeStepT(const T:Single): Boolean;

    procedure Log(str:string) ;

    procedure FormImageXY;
    procedure FormImageKinetic;

    procedure OnSelectColRowIGraph(Sender:TObject; const ACol, ARow:integer);
    procedure OnOverColRowIGraph(Sender:TObject; const ACol, ARow:integer);
    procedure OnOverColRowHVGraph(Sender:TObject; const ACol, ARow:string);

    procedure OnChangeBordersIGraph(Sender:TObject);
    procedure OnChangeBordersHGraph(Sender:TObject);
    procedure OnChangeBordersVGraph(Sender:TObject);

    procedure RepaintHVGraph;

    procedure OnSelectColRowSGraph(Sender:TObject; const ACol, ARow:integer);
    procedure RepaintSGraph(x, y:integer );
    procedure SaveMapToCSV(const FileName: string);
    procedure SaveMultilayerKineticMapToCSV(const FileName: string);
    procedure SaveMultilayerXYMapToCSV(const FileName: string);
    procedure AverageMultilayerXYMapToCSV(const FileName: string);


    procedure ExportAsLineCorrection(FileName:string);

    procedure OnCellChanded(const ACol, ARow:integer; Value:String);

  private

    HGraph:THGraph;
    VGraph: TVGraph;
    SGraph:THGraph;

  public
    { Public declarations }

    IGraph:TIGraph;

    ScanParams:TScanParams;
    isTakeFrame:Boolean;
    fCritSection:TCriticalSection;

    localMin, localMax, gblMin, gblMax:Single;

    selectedRow, selectedCol:integer;

    SaveDirectory:string;

    tprev:cardinal;
    firstTimeRun:Boolean;
    CellChandedRow,CellChandedCol:Integer;
    CellChandedValue:String;

    procedure DrawImage;

    procedure SerialXYToXY(const i:integer; var x, y:integer);
    procedure SerialKineticToXY(const i:integer; var x, y:integer);

    function  XYXYToSerial(const x, y: integer):integer;
    function  KineticXYToSerial(const x, y: integer):integer;

    function LoadSettings:Boolean;
    function SaveSettings:Boolean;

    property  StopScanning:Boolean read  fStopScanning;


  end;



implementation

uses
  main, Log, System.Math;


{$R *.dfm}

procedure TFormScan.A1Click(Sender: TObject);
begin
if IGraph.isLoaded then
  begin
  SaveDialog.Filter:='csv|*.csv';
  SaveDialog.DefaultExt:='csv';
  SaveDialog.FileName:='ScanDataAveraging';

   case ScanParams.ScanType of
                stXY, stXZ: begin
                       if SaveDialog.Execute then
                       TTask.Run(procedure()
                            begin
                              AverageMultilayerXYMapToCSV(SaveDialog.FileName);
                            end);
                      end;
                stKinetic,stLaserPower, stOneAxisScan:
                      begin
                   //   AverageMultilayerXYMapToCSV(SaveDialog.FileName);
                      end ;
              end;



  end
else
  sShowMessage('No data');
end;

function TFormScan.AllocScanBuffers: Boolean;
var ImgHeight, ImgWidth:Integer;
begin
 Result:=True;

    try
      case ScanParams.ScanType of
          stXY,stXZ: begin
                 ImgWidth:= ScanParams.fColCnt*ScanParams.fdimY;
                 ImgHeight:=ScanParams.fRowCnt;
                 ScanParams.totalPoints:=ScanParams.fColCnt*ScanParams.fRowCnt;
                end;
          stKinetic,stOneAxisScan:
                begin
                 ImgWidth:= ScanParams.fTCnt;
                 ImgHeight:=ScanParams.fdimY;
                 ScanParams.totalPoints:= ScanParams.fTCnt;
                end;
          stLaserPower:
                begin
                 ImgWidth:= ScanParams.fPowerCnt;
                 ImgHeight:=ScanParams.fdimY;
                 ScanParams.totalPoints:= ScanParams.fPowerCnt;
                end;
       end;

        if SpectraData<>nil  then
          SpectraData.Free;

        SpectraData:=TNumArray2<Single>.Create(ImgHeight, ImgWidth);
        NumSet(0.0, SpectraData);

       if NormData<>nil  then
           NormData.Free;

        NormData:=TNumArray2<Single>.Create(ImgHeight, ImgWidth);
        NumSet(0.0, NormData);

        if ImgData<>nil  then
           ImgData.Free;

        ImgData:=TNumArray2<Byte>.Create(ImgHeight, ImgWidth);
        NumSet(0, ImgData);

        Log('ScanBuffers created successfully');

        IGraph.minX:=0;
        IGraph.maxX:=ImgWidth;
        IGraph.minY:=0;
        IGraph.maxY:=ImgHeight;

        HGraph.SetLimits(IGraph.minX,IGraph.maxX);
        VGraph.SetLimits(IGraph.minY,IGraph.maxY);

        HGraph.DeleteAll;
        HGraph.CreateCurve('data', clRed, ImgWidth );

        VGraph.DeleteAll;
        VGraph.CreateCurve('data', clRed, ImgHeight );

        SGraph.DeleteAll;
        SGraph.CreateCurve('data', clRed, ScanParams.fdimX );

    except
      Result:=False;
    end;

end;

procedure TFormScan.AverageMultilayerXYMapToCSV(const FileName: string);
var i,j,l, prog:Integer;
    addr:Int64;
    FS : TFileStream;
    aStr:AnsiString;
    val:Single;
    inside:Boolean;

    AverArr,TempArr, AverArrTotal:TNumArray1<Single>;

begin
  if M = nil then Exit;

    FormatSettings.DecimalSeparator:='.';

    try
    FS := TFileStream.Create(FileName, fmCreate, fmShareDenyWrite);

    prog:=0;
    PostMessage(FormMain.Handle, WM_PROGRESS, 0, prog);

          aStr:= 'X axis' + #13#10;
          FS.Write(Pointer(aStr)^, Length(aStr) * SizeOf(AnsiChar));

          aStr:= ScanParams.Xaxis.Values[0].ToString;
          for l := 1 to ScanParams.fdimX-1 do
            aStr:=aStr+ ',' + ScanParams.Xaxis.Values[l].ToString;

          aStr:= aStr + #13#10+ #13#10;
          FS.Write(Pointer(aStr)^, Length(aStr) * SizeOf(AnsiChar));

    AverArr:=TNumArray1<Single>.Create(ScanParams.fdimX);
    AverArrTotal:=TNumArray1<Single>.Create(ScanParams.fdimX);
    TempArr:=TNumArray1<Single>.Create(ScanParams.fdimX);

    aStr:=Format('Column averaging'+#13#10,[]);
    FS.Write(Pointer(aStr)^, Length(aStr) * SizeOf(AnsiChar));

    for i := 0 to SpectraData.Width-1 do
      begin

        NumSet(0.0, AverArr);

        for j := 0 to SpectraData.Height-1  do
          begin
          addr:=XYXYToSerial(i,j); //*ScanParams.fdimX*sizeOf(Single);

          if addr<ScanParams.scanPoints*ScanParams.fdimY then
            begin
            M.Position:= addr*ScanParams.fdimX*SizeOf(Single);
            M.ReadBuffer(TempArr.Buffer^, TempArr.UsedSize);
            NumAdd(TempArr, AverArr);
            end;
           end;

          NumMulC(AverArr, 1.0/SpectraData.Height);

          aStr:=AverArr.Values[0].ToString;

          for l := 1 to ScanParams.fdimX-1 do
          aStr:=aStr+','+AverArr.Values[l].ToString;

          aStr:= aStr + #13#10;
          FS.Write(Pointer(aStr)^, Length(aStr) * SizeOf(AnsiChar));

          Inc(prog);
          PostMessage(FormMain.Handle, WM_PROGRESS, 0, trunc(10000*prog/(SpectraData.Height+SpectraData.Width)));

      end;


    NumSet(0.0, AverArrTotal);
    aStr:=Format('Row averaging'+#13#10,[]);  // Format('X=%d'+#13#10,[i]);
    FS.Write(Pointer(aStr)^, Length(aStr) * SizeOf(AnsiChar));
    for j := 0 to SpectraData.Height-1 do
      begin

        NumSet(0.0, AverArr);

        for i := 0 to SpectraData.Width-1  do
          begin
          addr:=XYXYToSerial(i,j); //*ScanParams.fdimX*sizeOf(Single);

          if addr<=ScanParams.scanPoints*ScanParams.fdimY then   
            begin
            M.Position:= addr*ScanParams.fdimX*SizeOf(Single);
            M.ReadBuffer(TempArr.Buffer^, TempArr.UsedSize);
            NumAdd(TempArr, AverArr);
            end;

           end;

          NumMulC(AverArr, 1.0/SpectraData.Width);
          NumAdd(AverArr, AverArrTotal);

          aStr:=AverArr.Values[0].ToString;

          for l := 1 to ScanParams.fdimX-1 do
          aStr:=aStr+','+AverArr.Values[l].ToString;

          aStr:= aStr + #13#10;
          FS.Write(Pointer(aStr)^, Length(aStr) * SizeOf(AnsiChar));

          Inc(prog);
          PostMessage(FormMain.Handle, WM_PROGRESS, 0, trunc(10000*prog/(SpectraData.Height+SpectraData.Width)));
      end;

      NumMulC(AverArrTotal, 1.0/SpectraData.Height);
      aStr:=Format('Total averaging'+#13#10,[]);
      FS.Write(Pointer(aStr)^, Length(aStr) * SizeOf(AnsiChar));

      aStr:=AverArrTotal.Values[0].ToString;

      for l := 1 to ScanParams.fdimX-1 do
      aStr:=aStr+','+AverArrTotal.Values[l].ToString;

      aStr:= aStr + #13#10;
      FS.Write(Pointer(aStr)^, Length(aStr) * SizeOf(AnsiChar));


   finally
    FS.Free;
    AverArr.Free;
    AverArrTotal.Free;
    TempArr.Free;
    PostMessage(FormMain.Handle, WM_PROGRESS, 0, 10100);
  end;

end;

procedure TFormScan.btnPauseClick(Sender: TObject);
begin

 fPaused:=not fPaused;
 btnPause.Down:=fPaused;

 if fPaused then
    vleStatus.Cells[1,2]:='Paused'
  else
    vleStatus.Cells[1,2]:='Started';
end;

procedure TFormScan.btnReturnToStartClick(Sender: TObject);
begin
StopScan;

MakeStepXY( -stepsWellDone.X, -stepsWellDone.Y );
end;

procedure TFormScan.btnStartClick(Sender: TObject);
begin
StopScan;
StartScan;
end;

procedure TFormScan.btnStopClick(Sender: TObject);
begin
StopScan;
end;

procedure TFormScan.DirectoryEditChange(Sender: TObject);
begin
SaveDirectory:=DirectoryEdit.Text;
end;

procedure TFormScan.DrawImage;
const lim=45;
var vSub, vDiv:Single;
    min, max:Single;
begin

if SpectraData=nil then
      Exit;

fCritSection.Acquire;
case ScanParams.ScanType of
  stXY, stXZ: FormImageXY;
  stKinetic, stOneAxisScan: FormImageKinetic ;
  stLaserPower: FormImageKinetic ;
end;

fCritSection.Release;

NumMinMax(SpectraData, localMin, localMax);
case AutoScale of
  asGlobal: begin
              Min:=gblMin;
              Max:=gblMax;
            end;
  asLocal: begin
              Min:=localMin;
              Max:=localMax;
            end;
  asCustom: begin
              Min:=HGraph.MinY;
              Max:=HGraph.MaxY;
            end;
end;



  if min=max then
   Exit;

  HGraph.MinY:= Min;
  HGraph.MaxY:= Max;

  VGraph.MinX:= Min;
  VGraph.MaxX:= Max;

  vSub:= Min;
  vDiv:=(Max-Min)/256;
  NumNormalize(SpectraData, NormData,vSub,vDiv);

  NumConvert32f_8u(NormData, ImgData);
  IGraph.LoadData(ImgData);
//Exit;
  RepaintHVGraph;
  if ScanParams.scanPoints=1 then
    RepaintSGraph(0,0);
end;

procedure TFormScan.E1Click(Sender: TObject);
begin
if IGraph.isLoaded then
  begin
  SaveDialog.Filter:='csv|*.csv';
  SaveDialog.DefaultExt:='csv';
  SaveDialog.FileName:='LineCorrectData';

  if SaveDialog.Execute then
     ExportAsLineCorrection(SaveDialog.FileName);
  end
else
  sShowMessage('No data');

end;

procedure TFormScan.ExportAsLineCorrection(FileName: string);
const lineLen = 256;
var i,j:Integer;
    FS : TextFile;
    aStr:AnsiString;
    value:Double;
    min, max:Single;
    arr:TNumArray1<Single>;

begin
    if SpectraData.Width<>lineLen then
      begin
      ShowMessage('BinY mast be 1');
      Exit;
      end;

    FormatSettings.DecimalSeparator:='.';
    try
    AssignFile(FS, FileName);
    ReWrite(FS);

    arr:=TNumArray1<Single>.Create(lineLen);

    for i := 0 to SpectraData.Width-1 do
      begin
         value:=0.0;
         for j := 0 to SpectraData.Height-1 do
               value:=value+SpectraData.Values[j,i];

         arr.Values[i]:= value/SpectraData.Height;
      end;
    NumMinMax(SpectraData, min, max);


    for i := 0 to SpectraData.Width-1 do
      begin
      arr.Values[i]:=arr.Values[i]/max;
      aStr:=arr.Values[i].ToString;
      WriteLn(FS, aStr);
     end;

   finally
    CloseFile(FS);
    arr.Free;
  end;
end;

procedure TFormScan.FormActivate(Sender: TObject);
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

    SGraph.OnSelectColRow:=OnSelectColRowSGraph;

    firstTimeRun:=False;
 end;

end;

procedure TFormScan.FormCreate(Sender: TObject);
begin
 Andor:=formMain.Andor;
 Controller:=formMain.Controller;
 FrameData:=formMain.FrameData;
 ScanParams:=TScanParams.Create;
 fCritSection:=TCriticalSection.Create;

IGraph:=TIGraph.Create(Self);
IGraph.Parent:=pnlIGraph;
IGraph.Align:=alClient;
IGraph.Show;

//CheckBox1.Checked:=IGraph.UseLimits;

HGraph:=THGraph.Create(Self);
HGraph.Parent:=pnlHGraph;
HGraph.Align:=alClient;
HGraph.MinX:=0;
HGraph.MaxX:=10;
HGraph.Show;

VGraph:= TVGraph.Create(Self);
VGraph.Parent:=pnlLGraph;
VGraph.Align:=alClient;
VGraph.MinY:=0;
VGraph.MaxY:=10;
VGraph.Show;

SGraph:=THGraph.Create(Self);
SGraph.Parent:=pnlSpectra;
SGraph.Align:=alClient;
SGraph.Show;

AutoScale:=asLocal;

selectedCol:=0;
selectedRow:=0;
StatusBarGraph.Panels[1].Text:=Format('SelX=%d SelY=%d',[selectedCol, selectedRow]);
StatusBarGraph.Panels[2].Text:=Format('Li=%d WL=%f',[ScanParams.fLi, 0.0 ]);

firstTimeRun:=True;
end;



procedure TFormScan.FormDestroy(Sender: TObject);
begin

StopScan;

ScanParams.Free;
if SpectraData<>nil  then
     SpectraData.Free;

if NormData<>nil  then
     NormData.Free;

if ImgData<>nil  then
     ImgData.Free;

fCritSection.Free;

IGraph.Free;
HGraph.Free;
VGraph.Free;

if M<>nil then  FreeAndNil(M);
end;

procedure TFormScan.FormImageKinetic;
var i, x,y:Integer;
    val:Single;
begin
if M = nil then Exit;

for i := 0 to ScanParams.scanPoints*ScanParams.fdimY-1 do
  begin
//  SerialKineticToXY(i,x,y);
   x:= i div ScanParams.fdimY;
   y:= i mod ScanParams.fdimY;

 //  Log(Format('i=%d  x=%d y=%d',[i, x, y])  );

   M.Position:=(i*ScanParams.fdimX +ScanParams.fLi) *SizeOf(Single);

   M.ReadBuffer(val, SizeOf(Single));
   SpectraData.Values[y,x]:=val;
  end;

end;

procedure TFormScan.FormImageXY;
var i, x,y:Integer;
    val:Single;
begin
if M = nil then Exit;

for i := 0 to ScanParams.scanPoints*ScanParams.fdimY -1 do
  begin
    SerialXYToXY(i,x,y);
    M.Position:=(i*ScanParams.fdimX +ScanParams.fLi) *SizeOf(Single);
    M.ReadBuffer(val, SizeOf(Single));

    SpectraData.Values[y,x]:=val;
  end;
end;

procedure TFormScan.FormShow(Sender: TObject);
begin
  case ScanParams.ScanType of
    stXY:
          begin
          pcScanType.ActivePage:=tsXY;
          vleScanParamsXY.Cells[1,1]:=ScanParams.fColCnt.ToString;
          vleScanParamsXY.Cells[1,2]:=ScanParams.fRowCnt.ToString;
          vleScanParamsXY.Cells[1,3]:=ScanParams.fXstep.ToString;
          vleScanParamsXY.Cells[1,4]:=ScanParams.fYstep.ToString;
          end;
     stXZ:
          begin
          pcScanType.ActivePage:=tsXZ;
          vleScanParamsXZ.Cells[1,1]:=ScanParams.fColCnt.ToString;
          vleScanParamsXZ.Cells[1,2]:=ScanParams.fRowCnt.ToString;
          vleScanParamsXZ.Cells[1,3]:=ScanParams.fXstep.ToString;
          vleScanParamsXZ.Cells[1,4]:=ScanParams.fYstep.ToString;
          end;
    stKinetic:
          begin
          pcScanType.ActivePage:=tsKinetic;
          vleScanParamsKinetic.Cells[1,1]:=ScanParams.fTCnt.ToString;
          vleScanParamsKinetic.Cells[1,2]:=ScanParams.fTstep.ToString;
          end;
    stLaserPower:
          begin
          pcScanType.ActivePage:=tsPower;
          vleScanParamsPower.Cells[1,1]:=ScanParams.fPowerCnt.ToString;
          vleScanParamsPower.Cells[1,2]:=ScanParams.fPowerStep.ToString;
          vleScanParamsPower.Cells[1,3]:=ScanParams.fPowerStart.ToString;
          vleScanParamsPower.Cells[1,4]:=ScanParams.fPowerFinish.ToString;
          end;
  end;

end;

function TFormScan.GetFrame:Boolean;
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
         Exit;

  Sleep(50);
  if fStopScanning  then
    begin
      Exit;
    end;
  end;
Result:=True;
end;

function TFormScan.KineticXYToSerial(const x, y: integer): integer;
begin
with ScanParams do
    Result:= x * fdimY + y;
end;


function TFormScan.LoadSettings: Boolean;
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
           DirectoryEdit.Text:= SaveDirectory;
//         end;

  result:=True;
  finally
  Ini.Free;
  end;
end;

procedure TFormScan.Log(str: string);
begin
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



function TFormScan.MakeStepLaserPower(const stepIdx: Integer): Boolean;
var setPower:Integer;
begin
setPower:=Round(ScanParams.fPowerStart+ stepIdx*ScanParams.fPowerStep);

if (setPower>=0) and (setPower<=500) then
  begin
  formMain.Laser.SetPower( setPower );
  formMain.spinedtLaserPower.Value:=setPower;
  end;
end;

function TFormScan.MakeStepOneAxis(stepSize: Integer): Boolean;
 var
     t:Cardinal;
begin
if stepSize<>0 then
  Controller.MotColim.MovRel(stepSize);

  t:=GetTickCount;

  while Controller.MotColim.Moving  do
  begin
  Sleep(50);
  if Abs(t-GetTickCount)>30000 then Break;
  end;


end;

function TFormScan.MakeStepXY(const x,y: integer):boolean;
 var delay:Integer;
     t:Cardinal;
begin

if x<>0 then
begin
Controller.MotX.MovRel(Round(-x* ScanParams.fXstep));
end;

if y<>0 then
begin
Controller.MotY.MovRel(Round(y* ScanParams.fYstep));
end;

if y<=1 then
  Sleep(300)
else
begin
t:=GetTickCount;

  while Controller.MotX.Moving or Controller.MotY.Moving do
  begin
  Sleep(50);
  if Abs(t-GetTickCount)>3000 then Break;
  end;
end;

end;


function TFormScan.MakeStepXZ(const x, z: integer): Boolean;
 var delay:Integer;
     t:Cardinal;
begin

if x<>0 then
 begin
  Controller.MotX.MovRel(Round(x* ScanParams.fXstep) );
 end;

if z<>0 then
  begin
  Controller.MotZ.MovRel(Round(z* ScanParams.fYstep) );
  end;


if z<=1 then
  Sleep(300)
else
begin
t:=GetTickCount;
  while Controller.MotX.Moving or Controller.MotZ.Moving do
  begin
  Sleep(50);
  if Abs(t-GetTickCount)>3000 then Break;
  end;
end;

end;

procedure TFormScan.N1Click(Sender: TObject);
var x,y,z:string;
begin

if IGraph.isLoaded then
  begin
  SaveDialog.Filter:='csv|*.csv';
  SaveDialog.DefaultExt:='csv';
  SaveDialog.FileName:='ScanDataMultilayer';


  if SaveDialog.Execute then
     TTask.Run(procedure()
          begin

              case ScanParams.ScanType of
                stXY: begin
                      SaveMultilayerXYMapToCSV(SaveDialog.FileName);
                      end;
                stKinetic,stLaserPower,stOneAxisScan:
                      begin
                      SaveMultilayerKineticMapToCSV(SaveDialog.FileName);
                      end ;
              end;
          end);
  end
else
  sShowMessage('No data');



//FormSaveMultiCSV.ShowModal;

end;

procedure TFormScan.O1Click(Sender: TObject);

begin

  OpenDialog.Filter:='scn|*.scn';
  OpenDialog.DefaultExt:='scn';

  if OpenDialog.Execute then
    begin
     TTask.Run(procedure()
      var err:Integer;
        begin
        err:= OpenMap(OpenDialog.FileName);
        if (err = 0) or (err = 3) then
         begin
            if not AllocScanBuffers then
             begin
             Log('Scan buffers allocation error');
             Exit;
             end
           else
             begin
              FileNameEdit.Text:=ExtractFileName(OpenDialog.FileName);
              DrawImage;
              if err=3 then
                 sShowMessage(' Map is loaded not complete.');

  //            RepaintHVGraph;
  //            RepaintSGraph(selectedCol,selectedRow );
             end;

         end
        else
        sShowMessage('Load error. Code:'+err.ToString);
      end);
    end;
end;

procedure TFormScan.OnCellChanded(const ACol, ARow: integer; Value: String);
procedure UpdatePowerValues;
  begin
    if ScanParams.fPowerStart>500 then
    begin
    ScanParams.fPowerStart:=0;
    vleScanParamsPower.Cells[1,1]:= ScanParams.fPowerStart.ToString;
    end;

    ScanParams.fPowerFinish:=ScanParams.fPowerStart+ScanParams.fPowerCnt*ScanParams.fPowerStep;
    vleScanParamsPower.Cells[1,4]:= ScanParams.fPowerFinish.ToString;
//    if ScanParams.fPowerFinish>500 then
//    vleScanParamsPower.Cells[1,4]:='500';
  end;

begin

     ScanParams.fPowerCnt:= StrToIntDef( vleScanParamsPower.Cells[1,1], 1);
     ScanParams.fPowerStep:= StrToFloatDef( vleScanParamsPower.Cells[1,2], 1.0);
     ScanParams.fPowerStart:= StrToFloatDef( vleScanParamsPower.Cells[1,3], 50.0);

case ARow of
  1,2,3: begin
     UpdatePowerValues;
     end;

  4: begin

      ScanParams.fPowerFinish:= StrToFloatDef( vleScanParamsPower.Cells[1,4], 300.0);
      if ScanParams.fPowerCnt<>0 then
       begin
        ScanParams.fPowerStep:= (ScanParams.fPowerFinish - ScanParams.fPowerStart)/ScanParams.fPowerCnt;
        vleScanParamsPower.Cells[1,2]:= Format('%0.2f',[ScanParams.fPowerStep])  ;
       end;
//      UpdatePowerValues;
     end;
end;
 //  vleScanParamsPower.Invalidate;
end;

procedure TFormScan.OnChangeBordersHGraph(Sender: TObject);
begin
    if GetTickCount-tprev > 20 then
      begin
      tprev :=GetTickCount;

      IGraph.minX:=HGraph.MinX;
      IGraph.maxX:=HGraph.MaxX;

      VGraph.minX:=HGraph.MinY;
      VGraph.maxX:=HGraph.MaxY;

      VGraph.CalcResize(false);

      //    RepaintIntensityIGraph;
      DrawImage;

      end;
end;

procedure TFormScan.OnChangeBordersIGraph(Sender: TObject);
begin
 if GetTickCount-tprev > 20 then
      begin
      tprev :=GetTickCount;

        HGraph.MinX:=IGraph.minX;
        HGraph.MaxX:=IGraph.maxX;

        HGraph.CalcResize(false);

        VGraph.MinY:=IGraph.minY;
        VGraph.MaxY:=IGraph.maxY;

        VGraph.CalcResize(false);
      end;
end;

procedure TFormScan.OnChangeBordersVGraph(Sender: TObject);
begin
 if GetTickCount-tprev > 20 then
      begin
      tprev :=GetTickCount;
      IGraph.minY:=VGraph.MinY;
      IGraph.maxY:=VGraph.MaxY;

      HGraph.minY:=VGraph.MinX;
      HGraph.maxY:=VGraph.MaxX;

      HGraph.CalcResize(false);

      //IGraphIntensity
      DrawImage;
      end;
end;

procedure TFormScan.OnOverColRowHVGraph(Sender: TObject; const ACol,
  ARow: string);
begin
StatusBarGraph.Panels[0].Text:=Format('X=%d Y=%d',[Trunc( StrToFloatDef(ACol,0)), Trunc( StrToFloatDef(ARow,0))]);
end;

procedure TFormScan.OnOverColRowIGraph(Sender: TObject; const ACol,
  ARow: integer);
begin
StatusBarGraph.Panels[0].Text:=Format('X=%d Y=%d',[ACol, ARow]);
end;

procedure TFormScan.OnSelectColRowIGraph(Sender: TObject; const ACol,
  ARow: integer);
var addr:Int64;
begin
StatusBarGraph.Panels[1].Text:=Format('Col=%d Row=%d',[ACol, ARow]);

selectedCol:=ACol;
selectedRow:=ARow;

case ScanParams.ScanType of
  stXY,stXZ: addr:=XYXYToSerial(selectedCol,selectedRow );
  stKinetic,stLaserPower, stOneAxisScan: addr:=KineticXYToSerial(selectedCol,selectedRow );
end;
RepaintHVGraph;
if addr<ScanParams.scanPoints*ScanParams.fdimY then
  begin
  RepaintSGraph(selectedCol,selectedRow );
  end;

end;

procedure TFormScan.OnSelectColRowSGraph(Sender: TObject; const ACol,
  ARow: integer);
begin

ScanParams.fLi:=ACol;
StatusBarGraph.Panels[2].Text:=Format('Li=%d WL=%f nm',[ScanParams.fLi, FrameData.ScaleNm.Values[ScanParams.fLi] ]);

DrawImage;
RepaintHVGraph;

RepaintSGraph(selectedCol,selectedRow );
end;

function TFormScan.OpenMap(const FileName: string): integer;
var   reserved:Pointer;
      FtryPos,MtryPos, count, lineSize, lineCnt:Int64;
      var ImgHeight, ImgWidth, i, loadedCnt:Integer;

begin
     result:=0;

     F := TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
     if f=nil  then
       begin
         Exit(1);
       end;

      if M<>nil then
         begin
         FreeAndNil(M);
         end;


      M := TMemoryStream.Create;
      if M=nil then M := TMemoryStream.Create;
      if M=nil then
        begin
          Log('MemoryStream error');
          Exit(2);
        end;


      try
        try
        selectedCol:=0;
        selectedRow:=0;
        ScanParams.fLi:=0;
        StatusBarGraph.Panels[1].Text:=Format('SelX=%d SelY=%d',[selectedCol, selectedRow]);

              Log('Try to read from F stream');

        F.ReadBuffer(ScanParams.ScanType, SizeOf(ScanParams.ScanType));
         Log(Format('ScanType %d',[Integer(ScanParams.ScanType)]));
        F.ReadBuffer(ScanParams.fZigZag, SizeOf(ScanParams.fZigZag));
         Log(Format('ZigZag %d',[Integer(ScanParams.fZigZag)]));
        F.ReadBuffer(ScanParams.fdimX, SizeOf(ScanParams.fdimX));
         Log(Format('dimX %d',[ScanParams.fdimX]));
        F.ReadBuffer(ScanParams.fdimY, SizeOf(ScanParams.fdimY));
         Log(Format('dimY %d',[ScanParams.fdimY]));

        F.ReadBuffer(ScanParams.fColCnt, SizeOf(ScanParams.fColCnt));
         Log(Format('ColCnt %d',[ScanParams.fColCnt]));
        F.ReadBuffer(ScanParams.fRowCnt, SizeOf(ScanParams.fRowCnt));
          Log(Format('RowCnt %d',[ScanParams.fRowCnt]));
        F.ReadBuffer(ScanParams.fTCnt, SizeOf(ScanParams.fTCnt));
          Log(Format('TCnt %d',[ScanParams.fTCnt]));

        F.ReadBuffer(ScanParams.fXstep, SizeOf(ScanParams.fXStep));
         Log(Format('XStep %f',[ScanParams.fXStep]));

        F.ReadBuffer(ScanParams.fYstep, SizeOf(ScanParams.fYStep));
         Log(Format('YStep %f',[ScanParams.fYStep]));

        F.ReadBuffer(ScanParams.fTstep, SizeOf(ScanParams.fTStep));
         Log(Format('TStep %f',[ScanParams.fTStep]));

        if ScanParams.Xaxis<>nil then ScanParams.Xaxis.Free;
         ScanParams.Xaxis:=TNumArray1<Single>.Create(ScanParams.fdimX);

        F.ReadBuffer(ScanParams.Xaxis.Buffer^, ScanParams.Xaxis.UsedSize);

        F.ReadBuffer(FrameData.LaserNm, SizeOf(FrameData.LaserNm));
         Log(Format('LaserNm %.2f',[FrameData.LaserNm]));
        F.ReadBuffer(ScanParams.Exposure, SizeOf(ScanParams.Exposure));
          Log(Format('Exposure %.2f',[ScanParams.Exposure]));
        F.ReadBuffer(FrameData.PowerOnSample, SizeOf(FrameData.PowerOnSample));
         Log(Format('PowerOnSample %e',[FrameData.PowerOnSample]));

        F.ReadBuffer(ScanParams.fPowerCnt, SizeOf(ScanParams.fPowerCnt));
          Log(Format('PowerCnt %d',[ScanParams.fPowerCnt]));
        F.ReadBuffer(ScanParams.fPowerStep, SizeOf(ScanParams.fPowerStep));
          Log(Format('PowerStep %.2f',[ScanParams.fPowerStep]));
        F.ReadBuffer(ScanParams.fPowerStart, SizeOf(ScanParams.fPowerStart));
          Log(Format('PowerStart %.2f',[ScanParams.fPowerStart]));

        reserved:=AllocMem(2048-SizeOf(ScanParams.fPowerCnt)-SizeOf(ScanParams.fPowerStep)-SizeOf(ScanParams.fPowerStart));
        F.ReadBuffer(reserved^, SizeOf(reserved));
        FreeMem(reserved, 2048-SizeOf(ScanParams.fPowerCnt)-SizeOf(ScanParams.fPowerStep)-SizeOf(ScanParams.fPowerStart));

        count:=F.Size-F.Position;
        M.Position:=0;

        //Load by portions
        loadedCnt:=0;
        LineSize:=ScanParams.fdimY*ScanParams.fdimX*SizeOf(Single);

        lineCnt:= count div LineSize;

        if lineCnt>0  then

          begin
            for i := 0 to lineCnt-1 do
             begin
              FtryPos:=F.Position;
              MtryPos:=M.Position;
              try
              M.CopyFrom(F, lineSize);
              except
              F.Position:=FtryPos;
              M.Position:=MtryPos;
              M.CopyFrom(F, lineSize);
              end;
              Inc(loadedCnt);
              PostMessage(FormMain.Handle, WM_PROGRESS, 0, trunc(loadedCnt/lineCnt*10000) );
             end;

             if count> lineCnt*LineSize then
                begin
                try
                FtryPos:=F.Position;
                MtryPos:=M.Position;
                M.CopyFrom(F, F.Size-F.Position );
                except
                F.Position:=FtryPos;
                M.Position:=MtryPos;
                M.CopyFrom(F, F.Size-F.Position );
                end;
                end;

            PostMessage(FormMain.Handle, WM_PROGRESS, 0, 10000);
            // M.CopyFrom(F, count);
          end;

        ScanParams.scanPoints:=count div (ScanParams.fdimX*ScanParams.fdimY*SizeOf(Single));
        Log(Format('Loaded %d bytes in %d scan points',[count, ScanParams.scanPoints ]));


        except
         result:=3;
         ScanParams.scanPoints:=loadedCnt;
         Log(Format('Loaded %d lines of %d expected',[loadedCnt, lineCnt ]));

        end;

       finally
       FreeAndNil(F);
       Log('Finish read from F stream');
       PostMessage(FormMain.Handle, WM_PROGRESS, 0, 10100);

        //correct Col Row depends of ScanType
         case ScanParams.ScanType of
          stXY, stXZ:
               begin
                   if loadedCnt<ScanParams.fRowCnt then
                     begin
                     Log(Format('RowCnt is corrected from %d to %d ',[ScanParams.fRowCnt, loadedCnt ]));
                     Log(Format('ColCnt is corrected from %d to %d ',[ScanParams.fColCnt, 1 ]));
                     ScanParams.fRowCnt:=loadedCnt;
                     ScanParams.fColCnt:=1;
                     end
                  else
                     begin
                     i:=ScanParams.fColCnt;
                     ScanParams.fColCnt:=loadedCnt div ScanParams.fRowCnt;
                     if loadedCnt mod ScanParams.fRowCnt>0 then
                     ScanParams.fColCnt:=ScanParams.fColCnt+1;
                     Log(Format('ColCnt is corrected from %d to %d ',[i, ScanParams.fColCnt]));
                     end;

               end;


          stKinetic, stLaserPower, stOneAxisScan:
               begin
               if loadedCnt<ScanParams.fColCnt then
                         begin
                         Log(Format('ColCnt is corrected from %d to %d ',[ ScanParams.fColCnt, loadedCnt]));
                         ScanParams.fColCnt:=loadedCnt;
                         end
               end;
         end;

      end;
end;

procedure TFormScan.pnlLGraphResize(Sender: TObject);
begin
pnlGraphBottomLeft.Width:=pnlLGraph.Width-40;
end;

procedure TFormScan.RepaintHVGraph;
var i:Integer;
begin
  SpectraData.SingleRow(selectedRow, HGraph.Curve[0].data.y);
  HGraph.RepaintGraph;

  SpectraData.SingleColumn(selectedCol, VGraph.Curve[0].data.y);
  VGraph.RepaintGraph;
end;

procedure TFormScan.RepaintSGraph(x, y: integer);
var i, addr:Integer;
    val:Single;
begin
if M=nil then
     Exit;

case ScanParams.ScanType of
  stXY,stXZ: addr:= XYXYToSerial(x,y);
  stKinetic,stLaserPower,stOneAxisScan: addr:=KineticXYToSerial(x,y);
  end;

 // Log(Format('x=%d  y=%d  addr=%d',[x,y,addr] ));

  if addr < ScanParams.scanPoints*ScanParams.fdimY  then
  begin
  fCritSection.Acquire;
  M.Seek( (addr*ScanParams.fdimX)*SizeOf(Single), soBeginning);

    for i := 0 to ScanParams.fdimX-1 do
       begin
         M.ReadBuffer(val, SizeOf(Single));
         SGraph.Curve[0].data.y.Values[i]:=val;
       end;
  fCritSection.Release;
  end
  else
    begin
    for i := 0 to ScanParams.fdimX-1 do
    SGraph.Curve[0].data.y.Values[i]:=0.0;
    end;


  SGraph.AutoScaleAllLocal;
  SGraph.RepaintGraph;

end;

procedure TFormScan.rgAutoScaleChange(Sender: TObject);
begin
AutoScale:=TAutoScale(rgAutoScale.ItemIndex);
//DrawImage;
end;

procedure TFormScan.SaveMapToCSV(const FileName: string);
var i,j:Integer;
    FS : TFileStream;
    aStr:AnsiString;
begin
    FormatSettings.DecimalSeparator:='.';
    try
    FS := TFileStream.Create(FileName, fmCreate, fmShareDenyWrite);
    for j := 0 to SpectraData.Height-1 do
      begin
        aStr:=SpectraData.Values[j,0].ToString;

        for i := 1 to SpectraData.Width-1  do
         aStr:=aStr+ ',' + SpectraData.Values[j,i].ToString;

      aStr:= aStr + #13#10;
      FS.Write(Pointer(aStr)^, Length(aStr) * SizeOf(AnsiChar));
      end;
   finally
    FS.Free;
  end;
end;

procedure TFormScan.SaveMultilayerKineticMapToCSV(const FileName: string);
var i,j,l, prog:Integer;
    FS : TFileStream;
    aStr:AnsiString;
    val:Single;
    addr:Int64;

begin
  if M = nil then Exit;

    FormatSettings.DecimalSeparator:='.';
    try
    FS := TFileStream.Create(FileName, fmCreate, fmShareDenyWrite);

    prog:=0;
    PostMessage(FormMain.Handle, WM_PROGRESS, 0, prog);

          aStr:= 'X axis' + #13#10;
          FS.Write(Pointer(aStr)^, Length(aStr) * SizeOf(AnsiChar));

          aStr:= ScanParams.Xaxis.Values[0].ToString;
          for l := 1 to ScanParams.fdimX-1 do
            aStr:=aStr+ ',' + ScanParams.Xaxis.Values[l].ToString;

          aStr:= aStr + #13#10+ #13#10;
          FS.Write(Pointer(aStr)^, Length(aStr) * SizeOf(AnsiChar));


    for j := 0 to SpectraData.Height-1 do
      begin
        aStr:=Format('y=%d'+#13#10,[j]);
        FS.Write(Pointer(aStr)^, Length(aStr) * SizeOf(AnsiChar));


        for i := 0 to SpectraData.Width-1  do
          begin
          addr:=KineticXYToSerial(i,j);

          if addr<ScanParams.scanPoints*ScanParams.fdimY then
             begin
              M.Position:= addr*ScanParams.fdimX*SizeOf(Single);
              M.ReadBuffer(val, SizeOf(Single));

              aStr:=val.ToString;
              for l := 1 to ScanParams.fdimX-1 do
                begin
                M.ReadBuffer(val, SizeOf(Single));
                aStr:=aStr+ ',' + val.ToString;
                end;

              aStr:= aStr + #13#10;
              FS.Write(Pointer(aStr)^, Length(aStr) * SizeOf(AnsiChar));
             end;

          Inc(prog);
          PostMessage(FormMain.Handle, WM_PROGRESS, 0, trunc(10000*prog/(SpectraData.Height*SpectraData.Width)));
           end;

      end;
   finally
    FS.Free;
    PostMessage(FormMain.Handle, WM_PROGRESS, 0, 10100);
  end;

end;

procedure TFormScan.SaveMultilayerXYMapToCSV(const FileName: string);
var i,j,l, prog:Integer;
    addr:Int64;
    FS : TFileStream;
    aStr:AnsiString;
    val:Single;
    inside:Boolean;

begin
  if M = nil then Exit;

    FormatSettings.DecimalSeparator:='.';

    try
    FS := TFileStream.Create(FileName, fmCreate, fmShareDenyWrite);

    prog:=0;
    PostMessage(FormMain.Handle, WM_PROGRESS, 0, prog);

          aStr:= 'X axis' + #13#10;
          FS.Write(Pointer(aStr)^, Length(aStr) * SizeOf(AnsiChar));

          aStr:= ScanParams.Xaxis.Values[0].ToString;
          for l := 1 to ScanParams.fdimX-1 do
            aStr:=aStr+ ',' + ScanParams.Xaxis.Values[l].ToString;

          aStr:= aStr + #13#10+ #13#10;
          FS.Write(Pointer(aStr)^, Length(aStr) * SizeOf(AnsiChar));


    for i := 0 to SpectraData.Width-1 do
      begin
        aStr:=Format('X=%d'+#13#10,[i]);
        FS.Write(Pointer(aStr)^, Length(aStr) * SizeOf(AnsiChar));


        for j := 0 to SpectraData.Height-1  do
          begin
          addr:=XYXYToSerial(i,j); //*ScanParams.fdimX*sizeOf(Single);

          if addr<ScanParams.scanPoints*ScanParams.fdimY then   inside:=True else inside:=False;

           if inside then
              begin
              M.Position:= addr*ScanParams.fdimX*SizeOf(Single);
              M.ReadBuffer(val, SizeOf(Single));
              end
           else val:=0.0;


          aStr:=val.ToString;
          for l := 1 to ScanParams.fdimX-1 do
            begin
            if inside then
            M.ReadBuffer(val, SizeOf(Single))
            else val:=0.0;

            aStr:=aStr+ ',' + val.ToString;
            end;

          aStr:= aStr + #13#10;
          FS.Write(Pointer(aStr)^, Length(aStr) * SizeOf(AnsiChar));

          Inc(prog);
          PostMessage(FormMain.Handle, WM_PROGRESS, 0, trunc(10000*prog/(SpectraData.Height*SpectraData.Width)));
           end;

      end;
   finally
    FS.Free;
    PostMessage(FormMain.Handle, WM_PROGRESS, 0, 10100);
  end;
end;

function TFormScan.SaveSettings: Boolean;
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

procedure TFormScan.SerialKineticToXY(const i: integer; var x, y: integer);
begin
with ScanParams do
   begin
   x:= i div fdimY;
   y:= i mod fdimY;
   end;
end;

procedure TFormScan.SerialXYToXY(const i: integer; var x, y: integer);
begin
with ScanParams do
   begin
   x:= (i div ( fRowCnt*fdimY))*fdimY + (i mod fdimY);
   y:= (i div fdimY) mod fRowCnt;
   end;
end;

procedure TFormScan.StartScan;
var
  i, tryNo: Integer;
  reserved:Pointer;
  FileName:string;
  buttonSelected:integer;
  MtryPos:Int64;
  startRow, RowHeight:integer;
begin
 fPaused:=False;

if FileExists(SaveDirectory+'\'+ FileNameEdit.Text+'.scn') then
  begin
    buttonSelected := MessageDlg('Overwrite Existing file?',mtWarning, mbYesNo, 0);
    if buttonSelected <> mrYes then  Exit;
//     if buttonSelected = mrYes then
  end;

//if (fScanTask[0]<>nil) then //and fScanTask[0].Status=TTaskStatus.Running then
//    Exit;

    begin
      if pcScanType.ActivePage=tsXY then
         begin
         ScanParams.ScanType:=stXY;

         ScanParams.fColCnt:= vleScanParamsXY.Cells[1,1].ToInteger;
         ScanParams.fRowCnt:= vleScanParamsXY.Cells[1,2].ToInteger;
         ScanParams.fXstep:=  vleScanParamsXY.Cells[1,3].ToSingle;
         ScanParams.fYstep:=  vleScanParamsXY.Cells[1,4].ToSingle;
         end
       else
      if pcScanType.ActivePage=tsXZ then
         begin
         ScanParams.ScanType:=stXZ;

         ScanParams.fColCnt:= vleScanParamsXZ.Cells[1,1].ToInteger;
         ScanParams.fRowCnt:= vleScanParamsXZ.Cells[1,2].ToInteger;
         ScanParams.fXstep:=  vleScanParamsXZ.Cells[1,3].ToSingle;
         ScanParams.fYstep:=  vleScanParamsXZ.Cells[1,4].ToSingle;
         end
       else
       if pcScanType.ActivePage=tsKinetic then
         begin
         ScanParams.ScanType:=stKinetic;

         ScanParams.fTCnt := vleScanParamsKinetic.Cells[1,1].ToInteger;
         ScanParams.fTstep:= vleScanParamsKinetic.Cells[1,2].ToSingle;

         vleStatus.Cells[1,1]:=ScanParams.fTCnt.ToString;
         end
       else
       if pcScanType.ActivePage=tsPower then
         begin
         ScanParams.ScanType:=stLaserPower;

            OnCellChanded(1,1,'');
            if ScanParams.fPowerFinish>500 then
             begin
             MessageDlg('Max LaserPower mast be <=500 mW', mtWarning, [mbOK],0);
             Exit;
             end;

         end
         else
       if pcScanType.ActivePage=tsConf then
         begin
         ScanParams.ScanType:=stOneAxisScan;

         ScanParams.fTCnt := vleScanParamsOneAxis.Cells[1,1].ToInteger;
         ScanParams.fTstep:= vleScanParamsOneAxis.Cells[1,2].ToSingle;

         vleStatus.Cells[1,1]:=ScanParams.fTCnt.ToString;
         startRow:=vleScanParamsOneAxis.Cells[1,3].ToInteger;
         RowHeight:=formMain.edtSingleTrackHigh.Value;
         end;



      ScanParams.Exposure:=Andor.ExposureTime;
      ScanParams.fdimX:=Andor.Xdim;
      if ScanParams.Xaxis<>nil then ScanParams.Xaxis.Free;
       ScanParams.Xaxis:=TNumArray1<Single>.Create(ScanParams.fdimX);
      for i := 0 to ScanParams.fdimX-1 do
        ScanParams.Xaxis.Values[i]:=formMain.HGraph.Curve[0].data.x.Values[i];

      case Andor.ReadMode of
        rmFVB: ScanParams.fdimY:=1;
        rmSingleTrack: ScanParams.fdimY:=1;
        rmMultiTrack: ;
        rmRandomTrack: ;
        rmImage: ScanParams.fdimY:=Andor.Ydim;
      end;

      btnPause.Down:=False;
      fPaused:=False;


      if not AllocScanBuffers then
           begin
           Log('Scan buffers allocation error');
           Exit;
           end;


      F := TFileStream.Create(SaveDirectory+'\'+ FileNameEdit.Text+'.scn', fmCreate or fmShareExclusive);

      if M<>nil then  FreeAndNil(M);

      M := TMemoryStream.Create;
      if M=nil then M := TMemoryStream.Create;
      if M=nil then
        begin
          Log('MemoryStream error');
          Exit;
        end;


      selectedCol:=0;
      selectedRow:=0;
      StatusBarGraph.Panels[1].Text:=Format('SelX=%d SelY=%d',[selectedCol, selectedRow]);

              Log('Try to write to F M streams');

        F.WriteBuffer(ScanParams.ScanType, SizeOf(ScanParams.ScanType));
        F.WriteBuffer(ScanParams.fZigZag, SizeOf(ScanParams.fZigZag));
        F.WriteBuffer(ScanParams.fdimX, SizeOf(ScanParams.fdimX));
        F.WriteBuffer(ScanParams.fdimY, SizeOf(ScanParams.fdimY));

        F.WriteBuffer(ScanParams.fColCnt, SizeOf(ScanParams.fColCnt));
        F.WriteBuffer(ScanParams.fRowCnt, SizeOf(ScanParams.fRowCnt));
        F.WriteBuffer(ScanParams.fTCnt, SizeOf(ScanParams.fTCnt));

        F.WriteBuffer(ScanParams.fXstep, SizeOf(ScanParams.fXStep));
        F.WriteBuffer(ScanParams.fYstep, SizeOf(ScanParams.fYStep));
        F.WriteBuffer(ScanParams.fTstep, SizeOf(ScanParams.fTStep));

        F.WriteBuffer(ScanParams.Xaxis.Buffer^, ScanParams.Xaxis.UsedSize);

        F.WriteBuffer(FrameData.LaserNm, SizeOf(FrameData.LaserNm));
        F.WriteBuffer(ScanParams.Exposure, SizeOf(ScanParams.Exposure));
        F.WriteBuffer(FrameData.PowerOnSample, SizeOf(FrameData.PowerOnSample));

        F.WriteBuffer(ScanParams.fPowerCnt, SizeOf(ScanParams.fPowerCnt));
        F.WriteBuffer(ScanParams.fPowerStep, SizeOf(ScanParams.fPowerStep));
        F.WriteBuffer(ScanParams.fPowerStart, SizeOf(ScanParams.fPowerStart));


        reserved:=AllocMem(2048-SizeOf(ScanParams.fPowerCnt)-SizeOf(ScanParams.fPowerStep)-SizeOf(ScanParams.fPowerStart));
        F.WriteBuffer(reserved^, SizeOf(reserved));
        FreeMem(reserved, 2048-SizeOf(ScanParams.fPowerCnt)-SizeOf(ScanParams.fPowerStep)-SizeOf(ScanParams.fPowerStart));

        FreeAndNil(F);
        Log('Finish write to F M streams');


      fScanTask[0]:=TTask.Create( procedure()

      const tempInterval=500;
      var i:Integer;
          X, Y, prevX, prevY, Z, prevZ:Integer;
          tempT:cardinal;

          delay:Single;
          curStep, stepCnt:Integer;
       begin
        curStep:=0;
        prevX:=0;
        prevY:=0;
        prevZ:=0;

        stepsWellDone.X:=0;
        stepsWellDone.Y:=0;

        case ScanParams.ScanType of
          stXY,stXZ: stepCnt:=ScanParams.fRowCnt*ScanParams.fColCnt;
          stKinetic, stOneAxisScan: stepCnt:=ScanParams.fTCnt;
          stLaserPower: stepCnt:=ScanParams.fPowerCnt;
        end;

        PostMessage(FormMain.Handle,WM_SCAN_START, 0,0);

        TThread.Synchronize(nil, procedure()
          begin
            vleStatus.Cells[1,2]:='Started';
            vleStatus.Cells[1,1]:=Format('0 of %d',[ScanParams.RowCnt*ScanParams.ColCnt ]);

            btnStart.Enabled:=False;
            btnPause.Enabled:=True;
            btnPause.Down:=False;
            btnStop.Enabled:=True;

          end);

        fStopScanning:=False;
        TempT:=GetTickCount;

         try
          while true do
            begin
            if TTask.CurrentTask.Status=TTaskStatus.Canceled then Break;
            if fStopScanning then Break;

           // if (gblData=False) then
           // if (GetTickCount-TempT>tempInterval) then
              begin
                  if ScanParams.ScanType=stXY then
                    begin
                      x:= curStep div ScanParams.fRowCnt;
                      y:= curStep mod ScanParams.fRowCnt;
                      MakeStepXY(x-prevX,y-prevY);

                      stepsWellDone.X:=stepsWellDone.X + (x-prevX);
                      stepsWellDone.Y:=stepsWellDone.Y + (y-prevY);

                    end
                  else
                 if ScanParams.ScanType=stXZ then
                    begin
                      x:= curStep div ScanParams.fRowCnt;
                      z:= curStep mod ScanParams.fRowCnt;
                      MakeStepXZ(x-prevX,z-prevZ);
                    end
                  else
                 if ScanParams.ScanType=stKinetic then
                    begin

                      if curStep>0 then
                         begin
                         if ScanParams.fTstep>Andor.AccumTime then
                         delay :=  ScanParams.fTstep-Andor.AccumTime
                         else
                          delay:=0;// Andor.AccumTime;

                          if delay > 0 then
                          for i := 0 to 50 do
                             begin
                               while fPaused do
                                 begin
                                 if TTask.CurrentTask.Status=TTaskStatus.Canceled then Break;
                                 if fStopScanning then Break;
                                 sleep(50);
                                 end;


                               Sleep( Round(delay)*20);     //1000ms = 100 * 10
                               if TTask.CurrentTask.Status=TTaskStatus.Canceled then Break;
                               if fStopScanning then Break;
                             end;
                         end;

                    end
                  else
                 if ScanParams.ScanType=stLaserPower then
                    begin
                    MakeStepLaserPower(curStep);
                    Sleep(2000);
                    end

                 else
                 if ScanParams.ScanType=stOneAxisScan then
                    begin
                      if curStep>0 then
                      MakeStepOneAxis( round(ScanParams.fTstep));
                      formMain.Andor.SetSingleTrack(startRow+curStep, RowHeight);
                    end;

                PostMessage(FormMain.Handle,WM_SCAN_BEF_FRAME, 0,curStep);
                  sleep(100);

                  if GetFrame then
                    begin
                      Log('WriteFrame '+curStep.ToString);

                      F := TFileStream.Create(SaveDirectory+'\'+ FileNameEdit.Text+'.scn', fmOpenWrite or fmShareExclusive);
//                      if F=nil then Log('Can`t open fileStream to add next point')
//                      else
                        try
                        F.Seek(0,soEnd);
                        F.WriteBuffer(FrameData.CalcData.Buffer^, FrameData.CalcData.UsedSize);
                        finally
                        FreeAndNil(F);
                        end;

                      fCritSection.Acquire;
                      M.Seek(0, soEnd);
                      MtryPos:=M.Position;
                      try
                      M.WriteBuffer(FrameData.CalcData.Buffer^, FrameData.CalcData.UsedSize);
                      except
                      M.Position:=MtryPos;
                      M.WriteBuffer(FrameData.CalcData.Buffer^, FrameData.CalcData.UsedSize);
                      end;
                      fCritSection.Release;

                      ScanParams.scanPoints:= curStep+1;
                      PostMessage(FormMain.Handle,WM_SCAN_AFT_FRAME, 0,curStep+1);

                      if curStep=0 then
                        begin
                        gblMin:=FrameData.minV;
                        gblMax:=FrameData.maxV;
                        end
                      else
                        begin
                        if gblMin>FrameData.minV then gblMin:=FrameData.minV;
                        if gblMax<FrameData.maxV then gblMax:=FrameData.maxV;
                        end;

                      TThread.Synchronize(nil, procedure()
                         begin
                         DrawImage;
                         end);
                     //PostMessage(FormMain.Handle,WM_ANDOR_SCANNING, 0,0);

                      if ScanParams.ScanType=stXY then
                        begin
   //                     DrawCellXY(x,y);
                        prevX:=X;
                        prevY:=Y;
                        end;
                      if ScanParams.ScanType=stXZ then
                        begin
   //                     DrawCellXY(x,y);
                        prevX:=X;
                        prevZ:=Z;
                        end;
                    end
                    else
                     begin
                      Log('Error. Can''t continue scan');
                      fStopScanning:=True;
                     end;


                    inc(curStep);

                  if curStep = stepCnt then fStopScanning:=True;

               // TempT:=GetTickCount;
              end;

             while fPaused do
               begin
               if TTask.CurrentTask.Status=TTaskStatus.Canceled then Break;
               if fStopScanning then Break;
               sleep(50);
               end;

            for i := 0 to 0 do
                begin
                if TTask.CurrentTask.Status=TTaskStatus.Canceled then Break;
                if fStopScanning then Break;
                sleep(50);
                end;
            end;

          finally
          FreeAndNil(F);
          end;

          PostMessage(FormMain.Handle,WM_SCAN_FINISH, 0,0);
        TThread.Synchronize(nil, procedure()
          begin
          vleStatus.Cells[1,2]:='Finished';

          btnStart.Enabled:=True;
          btnPause.Enabled:=False;
          btnPause.Down:=False;
          btnStop.Enabled:=False;

          end);

       if TTask.CurrentTask.Status=TTaskStatus.Canceled then
         Exit;
       end);

    fScanTask[0].Start;
    end;

end;

procedure TFormScan.StopScan;
begin
 fPaused:=False;

Andor.AbortAcquisition;

if Assigned(fScanTask[0]) and (fScanTask[0].Status = TTaskStatus.Running) then
        begin
//        if Andor.Running then
        fStopScanning:=True;

        if not fScanTask[0].Wait(2000) then
           begin
           fScanTask[0].Cancel;
           Sleep(100);
          end;
        end;
if Assigned(fScanTask[0]) and (fScanTask[0].Status = TTaskStatus.Running) then
    fScanTask[0].Cancel;


    PostMessage(FormMain.Handle,WM_SCAN_FINISH, 0,0);

end;

procedure TFormScan.t1Click(Sender: TObject);
begin
if IGraph.isLoaded then
  begin
  SaveDialog.Filter:='csv|*.csv';
  SaveDialog.DefaultExt:='csv';
  SaveDialog.FileName:='ScanData';

  if SaveDialog.Execute then
     SaveMapToCSV(SaveDialog.FileName);
  end
else
  sShowMessage('No data');
end;

procedure TFormScan.vleScanParamsXZSetEditText(Sender: TObject; ACol,
  ARow: Integer; const Value: string);
begin
//case ARow of
//  1: ScanParams.fColCnt:= StrToIntDef( Value, 1);
//  2: ScanParams.fRowCnt:= StrToIntDef( Value, 1);
//  3: ScanParams.fXstep:= StrToFloatDef( Value, 1.0);
//  4: ScanParams.fYstep:= StrToFloatDef( Value, 1.0);
//
//end;
end;

procedure TFormScan.vleScanParamsKineticSetEditText(Sender: TObject; ACol,
  ARow: Integer; const Value: string);
begin
//case ARow of
//  1: ScanParams.fTCnt:= StrToIntDef( Value, 1);
//  2: ScanParams.fTstep:= StrToFloatDef( Value, 1.0);
//end;
end;

procedure TFormScan.vleScanParamsPowerExit(Sender: TObject);
begin
OnCellChanded(CellChandedCol, CellChandedRow, CellChandedValue);
end;

procedure TFormScan.vleScanParamsPowerKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key=VK_RETURN then
  OnCellChanded(CellChandedCol, CellChandedRow, CellChandedValue);
end;

procedure TFormScan.vleScanParamsPowerSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
OnCellChanded(CellChandedCol, CellChandedRow, CellChandedValue);
end;

procedure TFormScan.vleScanParamsPowerSetEditText(Sender: TObject; ACol,
  ARow: Integer; const Value: string);
begin
CellChandedRow:=ARow;
CellChandedCol:=ACol;
CellChandedValue:=Value;
end;

procedure TFormScan.vleScanParamsXYSetEditText(Sender: TObject; ACol,
  ARow: Integer; const Value: string);
begin
//case ARow of
//  1: ScanParams.fColCnt:= StrToIntDef( Value, 1);
//  2: ScanParams.fRowCnt:= StrToIntDef( Value, 1);
//  3: ScanParams.fXstep:= StrToFloatDef( Value, 1.0);
//  4: ScanParams.fYstep:= StrToFloatDef( Value, 1.0);
//
//end;
end;

function  TFormScan.XYXYToSerial(const x, y: integer):integer;
begin
with ScanParams do
    Result:= (x div fdimY)*(fColCnt*fdimY)+(y*fdimY)+(x mod fdimY);
end;

{ TScanParams }

constructor TScanParams.Create;
begin
inherited Create;
ScanType:=stXY;
fColCnt:=1;
fRowCnt:=10;
fdimX:=2000;
fdimY:=256;
fLi:=0;

fTCnt:=10;
fTstep:=30.0;

fXstep:=1.0;
fYstep:=1.0;

scanPoints:=0;
fZigZag:=False;
Xaxis:=TNumArray1<Single>.Create(2000);
end;

end.
