unit uView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
  sStatusBar, Vcl.ExtCtrls, sSplitter, sPanel, uScan2, System.Threading, System.SyncObjs,
  NumArray, NumIPP, uImageGraph, uLeftGraph, uBottomGraph, devControllerM,
  uViewer, sButton, sTrackBar, sMemo, Vcl.Buttons, sSpeedButton, sComboBox, Vcl.ExtDlgs,
  sDialogs, sEdit, sCheckBox, sSpinEdit, sGroupBox, sRadioButton;

type
  TAutoScale = (asGlobal = 0, asLocal = 1, asCustom = 2);

  TMapType = (mtRaw, mtDecomp,mtRes);

type
  TView = class(TForm)
    pnlTTop: TsPanel;
    sSplitter1: TsSplitter;
    pnlLLeft: TsPanel;
    sSplitter2: TsSplitter;
    pnlRRight: TsPanel;
    sSplitter3: TsSplitter;
    pnlSpectra: TsPanel;
    sSplitter4: TsSplitter;
    pnlGraphMain: TsPanel;
    splitterGraph2: TsSplitter;
    pnlGraphTop: TsPanel;
    splitterGraph1: TsSplitter;
    pnlLGraph: TsPanel;
    pnlIGraph: TPanel;
    pnlBottom: TsPanel;
    pnlGraphBottomLeft: TsPanel;
    pnlHGraph: TsPanel;
    StatusBarGraph: TsStatusBar;
    btnLoad: TsButton;
    sButton2: TsButton;
    btnVScaleTriGraph: TsSpeedButton;
    btnAutoscaleTriGraph: TsSpeedButton;
    memoLog: TsMemo;
    btnUpdate: TsButton;
    cboxAxX: TsComboBox;
    cboxAxY: TsComboBox;
    btnExportCSV: TsButton;
    btnExportBMP: TsButton;
    SavePictureDialog: TSavePictureDialog;
    SaveDialog: TsSaveDialog;
    cboxDim3: TsComboBox;
    cboxDim4: TsComboBox;
    cboxDim5: TsComboBox;
    sGroupBox1: TsGroupBox;
    edtBGCorrectionLeft: TsSpinEdit;
    edtBGCorrectionRight: TsSpinEdit;
    cbBGCorrectionUse: TsCheckBox;
    btnExportCSV3D: TsButton;
    rbRAW: TsRadioButton;
    rbDecompose: TsRadioButton;
    rbResiduals: TsRadioButton;
    btnExportCSVXYZ: TsButton;
    btnExportCSV4D: TsButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure pnlLGraphResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnLoadClick(Sender: TObject);
    procedure sButton2Click(Sender: TObject);
    procedure btnVScaleTriGraphClick(Sender: TObject);
    procedure btnAutoscaleTriGraphClick(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure cboxAxXChange(Sender: TObject);
    procedure cboxAxYChange(Sender: TObject);
    procedure btnExportBMPClick(Sender: TObject);
    procedure btnExportCSVClick(Sender: TObject);
    procedure cboxDim3Change(Sender: TObject);
    procedure cbBGCorrectionUseClick(Sender: TObject);
    procedure btnExportCSV3DClick(Sender: TObject);
    procedure rbRAWClick(Sender: TObject);
    procedure rbDecomposeClick(Sender: TObject);
    procedure rbResidualsClick(Sender: TObject);
    procedure btnExportCSVXYZClick(Sender: TObject);
    procedure btnExportCSV4DClick(Sender: TObject);
  private
    AutoScale: TAutoScale;
    SelectedPointInDim: array of Word;
    AxisXdim, AxisYdim, Axis3dim, Axis4dim, Axis5dim: Byte;
    SpectraData: TNumArray2<Single>;
    NormData: TNumArray2<Single>;
    ImgData: TNumArray2<Byte>;
    localMin, localMax, gblMin, gblMax: Single;
    selectedRow, selectedCol: integer;
    HdimCount: Byte;
    MCounter: Int64;  //localCounter
    trackingStep: Int64;
    mapType:TMapType;
    MW:TMemoryStream;

    procedure CopyHeader;  overload;
    procedure CopyHeader(fType:TMapType); overload;
    procedure CalcDimToStart();
    procedure CalcDim(dimIdx: byte);inline;

    procedure FormImage_;
    procedure FormImage; // deprecated
    procedure FormImageFast;
    procedure FormImageFastwoBG;
    procedure DrawImage;
    procedure OnChangeDimensions(AxX, AxY: byte);
    procedure RepaintHVGraph;
    procedure RepaintSGraph(x, y: integer);
    procedure OnChangeBordersIGraph(Sender: TObject);
    procedure OnChangeBordersHGraph(Sender: TObject);
    procedure OnChangeBordersVGraph(Sender: TObject);
    procedure OnSelectColRowIGraph(Sender: TObject; const ACol, ARow: integer);
    procedure OnSelectColRowSGraph(Sender: TObject; const ACol, ARow: integer);
    procedure OnOverColRowIGraph(Sender: TObject; const ACol, ARow: integer);
    procedure OnOverColRowHVGraph(Sender: TObject; const ACol, ARow: string);
    procedure Log(str: string);
    procedure AutoscaleTriV;
    procedure SaveViewToCSV(const FileName: string);
    procedure SaveViewTo3DCSV(const FileName: string);
    procedure SaveViewTo4DCSV(const FileName: string);
    procedure SaveViewToXYZCSV(const FileName: string);


  public
    Viewer: TViewer;
    Hdimensions: array of TDimension;
    IGraph: TIGraph;
    HGraph: THGraph;
    VGraph: TVGraph;
    SGraph: THGraph;
    procedure LoadMapFromViewer(mapType:TMapType);
    procedure UpadteView;
  private
    canChange: Boolean;
    firstTimeRun:Boolean;
    tprev:Cardinal;
  end;

implementation

uses
 { main, FrameData,} Log, uBGwait, uCrop3Dexport;

{$R *.dfm}

procedure TView.AutoscaleTriV;
begin
  IGraph.minX := 0;
  IGraph.maxX := SpectraData.Width;
  IGraph.minY := 0;
  IGraph.maxY := SpectraData.Height;

//  HGraph.MinX := HGraph.Curve[0].data.x[round(IGraph.minX)];
//  HGraph.MaxX := HGraph.Curve[0].data.x[round(IGraph.maxX-1)];    //-1
//
//  VGraph.MinY := VGraph.Curve[0].data.x[round( IGraph.minY)];
//  VGraph.MaxY := VGraph.Curve[0].data.x[round(IGraph.maxY-1)];    //-1

  HGraph.MinX := IGraph.minX;
  HGraph.MaxX := IGraph.maxX;    //-1

  VGraph.MinY := IGraph.minY;
  VGraph.MaxY := IGraph.maxY;    //-1

  HGraph.SetLimits(HGraph.MinX, HGraph.MaxX);  //(IGraph.MinX, IGraph.MaxX);
  VGraph.SetLimits(VGraph.MinY, VGraph.MaxY);  //(IGraph.MinY, IGraph.MaxY);
end;

procedure TView.btnAutoscaleTriGraphClick(Sender: TObject);
begin
  if not IGraph.isLoaded then
    Exit;

  AutoScale := asLocal;
  AutoscaleTriV;
  DrawImage;
  AutoScale := asCustom;
end;

procedure TView.btnExportBMPClick(Sender: TObject);
begin
  SavePictureDialog.Filter := 'bmp|*.bmp';
  SavePictureDialog.DefaultExt := '*.bmp';
  SavePictureDialog.FileName := 'AndorImage';

  if SavePictureDialog.Execute then
    IGraph.DataBuffer.SaveToFile(SavePictureDialog.FileName);
end;

procedure TView.btnExportCSVClick(Sender: TObject);
begin
  if IGraph.isLoaded then
  begin
    SaveDialog.Filter := 'csv|*.csv';
    SaveDialog.DefaultExt := 'csv';
    SaveDialog.FileName := 'PlotData';

    if SaveDialog.Execute then
      SaveViewToCSV(SaveDialog.FileName);
  end
  else
    sShowMessage('No data');
end;

procedure TView.btnExportCSVXYZClick(Sender: TObject);
begin
if IGraph.isLoaded then
  begin
    SaveDialog.Filter := 'csv|*.csv';
    SaveDialog.DefaultExt := 'csv';
    SaveDialog.FileName := 'PlotData';

    if SaveDialog.Execute then
      SaveViewToXYZCSV(SaveDialog.FileName);
  end
  else
    sShowMessage('No data');
end;

procedure TView.btnVScaleTriGraphClick(Sender: TObject);
begin
  if not IGraph.isLoaded then
    Exit;
  AutoScale := asLocal;
  DrawImage;
  AutoScale := asCustom;
end;

procedure TView.CalcDim(dimIdx: byte);
var
  i,HdimCount: Integer;
begin
  HdimCount:=length(Hdimensions);
  if dimIdx = 0 then
    for i := 0 to HdimCount - 1 do
      Hdimensions[i].prevStep := Hdimensions[i].curStep;

  if trackingStep > 0 then
  begin
    //check ZigZag
    if Hdimensions[dimIdx].zigZag then
    begin
      if Hdimensions[dimIdx].dir then
        Dec(Hdimensions[dimIdx].curStep)
      else
        Inc(Hdimensions[dimIdx].curStep);
    end
    else
      Inc(Hdimensions[dimIdx].curStep);

     //check Overflow
    if (Hdimensions[dimIdx].curStep = Hdimensions[dimIdx].steps) or (Hdimensions[dimIdx].curStep < 0) then
    begin // overflow
          //check ZigZag
      if Hdimensions[dimIdx].zigZag then
      begin
        if Hdimensions[dimIdx].dir then
          Hdimensions[dimIdx].curStep := 0
        else
          Hdimensions[dimIdx].curStep := Hdimensions[dimIdx].steps - 1;

        Hdimensions[dimIdx].dir := not Hdimensions[dimIdx].dir;
      end
      else
        Hdimensions[dimIdx].curStep := 0;

      CalcDim(dimIdx + 1);
    end;
  end;
end;

procedure TView.CalcDimToStart();
var
  i,HdimCount: Integer;
begin
  trackingStep := 0;
  HdimCount:=Length(Hdimensions);

  for i := 0 to HdimCount - 1 do
  begin
    Hdimensions[i].curStep := 0;
    Hdimensions[i].prevStep := 0;
    Hdimensions[i].dir := false;
  end;

end;

procedure TView.cbBGCorrectionUseClick(Sender: TObject);
begin
   FormImage_;
   DrawImage;
end;

procedure TView.cboxAxXChange(Sender: TObject);
begin
  if canChange then
  begin
    AxisXdim := cboxAxX.ItemIndex;
    OnChangeDimensions(AxisXdim, AxisYdim);
  end;
end;

procedure TView.cboxAxYChange(Sender: TObject);
begin
  if canChange then
  begin
    AxisYdim := cboxAxY.ItemIndex;
    OnChangeDimensions(AxisXdim, AxisYdim);
  end;
end;

procedure TView.cboxDim3Change(Sender: TObject);
begin

if canChange then
  begin
   SelectedPointInDim[(Sender as TsComboBox).Tag]:=(Sender as TsComboBox).ItemIndex;
   FormImage_;
   DrawImage;
  end;

end;

procedure TView.CopyHeader(fType: TMapType);

var
  i, j, len: Integer;
  fDimensions:array of TDimension;

begin
  case fType of
    mtRaw:
        begin
        len:= Length(Viewer.Hdimensions);
        SetLength(fDimensions, len);

        for i := 0 to len-1 do
          fDimensions[i]:= Viewer.Hdimensions[i];

        MW:=Viewer.M;
        end;
    mtDecomp:
        begin

        len:= Length(Viewer.Ddimensions);
        SetLength(fDimensions, len);

        for i := 0 to len-1 do
          fDimensions[i]:= Viewer.Ddimensions[i];

        MW:=Viewer.MD;
        end;

    mtRes:
        begin

        len:= Length(Viewer.Hdimensions);
        SetLength(fDimensions, len);

        for i := 0 to len-1 do
          fDimensions[i]:= Viewer.Hdimensions[i];

        MW:=Viewer.MR;
        end;
  end;


  HdimCount :=  Length(fDimensions);   //Viewer.HdimCount; //

          SetLength(Hdimensions, HdimCount);
          SetLength(SelectedPointInDim, HdimCount);

          for i := 0 to HdimCount - 1 do
          begin
            Hdimensions[i].steps := fDimensions[i].steps;
            Hdimensions[i].curStep := 0;
            Hdimensions[i].prevStep := 0;
            Hdimensions[i].zigZag := fDimensions[i].zigZag;
            Hdimensions[i].dir := false;
            Hdimensions[i].name := fDimensions[i].name;
            Hdimensions[i].units := fDimensions[i].units;
            Hdimensions[i].axisVal := TNumArray1<Single>.Create(fDimensions[i].steps);
            NumCopy(fDimensions[i].axisVal, Hdimensions[i].axisVal);
            Hdimensions[i].AxisValsHasNames := fDimensions[i].AxisValsHasNames;

            if Hdimensions[i].AxisValsHasNames then
            begin
              SetLength(Hdimensions[i].axisValNames, fDimensions[i].steps);
              for j := 0 to fDimensions[i].steps - 1 do
                Hdimensions[i].axisValNames[j] := fDimensions[i].axisValNames[j];
            end;

            SelectedPointInDim[i] := 0;

            Log('Read dim ' + i.ToString);
          end;

          case HdimCount of
            0, 1:
              begin
                AxisXdim := 0;
                AxisYdim := 0;
              end;
            2:
              begin
                AxisXdim := 0;
                AxisYdim := 1;
              end;
          else
            begin
              AxisXdim := 1;
              AxisYdim := 2;
            end;
          end;

end;

procedure TView.CopyHeader;
var
  i, j: Integer;
begin
  HdimCount := Viewer.HdimCount; // Length(Viewer.Hdimensions);

  SetLength(Hdimensions, HdimCount);
  SetLength(SelectedPointInDim, HdimCount);

  for i := 0 to HdimCount - 1 do
  begin
    Hdimensions[i].steps := Viewer.Hdimensions[i].steps;
    Hdimensions[i].curStep := 0;
    Hdimensions[i].prevStep := 0;
    Hdimensions[i].zigZag := Viewer.Hdimensions[i].zigZag;
    Hdimensions[i].dir := false;
    Hdimensions[i].name := Viewer.Hdimensions[i].name;
    Hdimensions[i].units := Viewer.Hdimensions[i].units;
    Hdimensions[i].axisVal := TNumArray1<Single>.Create(Viewer.Hdimensions[i].steps);
    NumCopy(Viewer.Hdimensions[i].axisVal, Hdimensions[i].axisVal);
    Hdimensions[i].AxisValsHasNames := Viewer.Hdimensions[i].AxisValsHasNames;

    if Hdimensions[i].AxisValsHasNames then
    begin
      SetLength(Hdimensions[i].axisValNames, Viewer.Hdimensions[i].steps);
      for j := 0 to Viewer.Hdimensions[i].steps - 1 do
        Hdimensions[i].axisValNames[j] := Viewer.Hdimensions[i].axisValNames[j];
    end;

    SelectedPointInDim[i] := 0;

    Log('Read dim ' + i.ToString);
  end;

  case HdimCount of
    0, 1:
      begin
        AxisXdim := 0;
        AxisYdim := 0;
      end;
    2:
      begin
        AxisXdim := 0;
        AxisYdim := 1;
      end;
  else
    begin
      AxisXdim := 1;
      AxisYdim := 2;
    end;
  end;

end;

procedure TView.DrawImage;
const
  lim = 45;
var
  vSub, vDiv: Single;
  min, max: Single;
begin

  NumMinMax(SpectraData, localMin, localMax);

//memoLog.Lines.Add( Format('min=%f max=%f',[localMin, localMax]) );


  case AutoScale of
    asGlobal:
      begin
        min := gblMin;
        max := gblMax;
      end;
    asLocal:
      begin
        min := localMin;
        max := localMax;
      end;
    asCustom:
      begin
        min := HGraph.MinY;
        max := HGraph.MaxY;
      end;
  end;

  if min = max then
    Exit;

  HGraph.MinY := min;
  HGraph.MaxY := max;

  VGraph.MinX := min;
  VGraph.MaxX := max;

  vSub := min;
  vDiv := (max - min) / 256;
  NumNormalize(SpectraData, NormData, vSub, vDiv);

  NumConvert32f_8u(NormData, ImgData);
  IGraph.LoadData(ImgData);
//Exit;
  RepaintHVGraph;
//  if ScanParams.scanPoints=1 then
//    RepaintSGraph(0,0);
end;

procedure TView.FormCreate(Sender: TObject);
begin
  IGraph := TIGraph.Create(Self);
  IGraph.Parent := pnlIGraph;
  IGraph.Align := alClient;
  IGraph.Show;

  IGraph.Palette :=plDRYGLBD;  //plGray

  HGraph := THGraph.Create(Self);
  HGraph.Parent := pnlHGraph;
  HGraph.Align := alClient;
  HGraph.MinX := 0;
  HGraph.MaxX := 10;
  HGraph.Show;

  VGraph := TVGraph.Create(Self);
  VGraph.Parent := pnlLGraph;
  VGraph.Align := alClient;
  VGraph.MinY := 0;
  VGraph.MaxY := 10;
  VGraph.Show;

  AutoScale := asLocal;

  SGraph := THGraph.Create(Self);
  SGraph.Parent := pnlSpectra;
  SGraph.Align := alClient;
  SGraph.Show;

  selectedCol := 0;
  selectedRow := 0;

  StatusBarGraph.Panels[1].Text := Format('SelX=%d SelY=%d', [selectedCol, selectedRow]);
//  StatusBarGraph.Panels[2].Text:=Format('Li=%d WL=%f',[ScanParams.fLi, 0.0 ]);

  firstTimeRun := True;
  canChange := True;

  pnlLGraph.Width:=0;
  pnlRRight.Width:=0;

  mapType:=mtRaw;

end;

procedure TView.FormDestroy(Sender: TObject);
begin
  if SpectraData <> nil then
    SpectraData.Free;
  if NormData <> nil then
    NormData.Free;
  if ImgData <> nil then
    ImgData.Free;

  IGraph.Free;
  HGraph.Free;
  VGraph.Free;
  SGraph.Free;
end;

procedure TView.FormImage;
var
  i:Int64;
  dimIdx: Integer;
  r: Boolean;
  val: Single;
  s: string;
begin
  if SpectraData = nil then
    Exit;

  NumSet(0.0, SpectraData);

  CalcDimToStart;

//  Viewer.M.Seek(0, soEnd);
//  MCounter := MW.Position div SizeOf(Single);

  MCounter := MW.Size div SizeOf(Single);

  for i := 0 to MCounter - 1 do
  begin
    r := True;
    CalcDim(0);
    Inc(trackingStep);

    for dimIdx := 0 to HdimCount - 1 do
      if (dimIdx <> AxisXdim) and (dimIdx <> AxisYdim) then
        if Hdimensions[dimIdx].curStep <> SelectedPointInDim[dimIdx] then
        begin
          r := False;
          Break;
        end;

    if r then
    try
//      MW.Seek(i * SizeOf(Single), soBeginning);
      MW.Position:=i * 4{ SizeOf(Single)};
      MW.ReadBuffer(val, 4 {SizeOf(Single))});
      SpectraData[Hdimensions[AxisYdim].curStep, Hdimensions[AxisXdim].curStep] := val;
    finally
    end;

  end;

end;

procedure TView.FormImageFast;
//read whole spectra
var
  i,j:Int64;
  dimIdx: Integer;
  r: Boolean;
  val: Single;
  s: string;
  valSpectra:TNumArray1<Single>;
begin
  if SpectraData = nil then
    Exit;

  NumSet(0.0, SpectraData);
  valSpectra:=TNumArray1<Single>.Create(Hdimensions[0].steps);
  
  CalcDimToStart();

  MCounter := MW.Size div SizeOf(Single) div valSpectra.Length;

  for i := 0 to MCounter - 1 do
  begin
    r := True;
    CalcDim(1);
    Inc(trackingStep);

    for dimIdx := 1 to HdimCount - 1 do   //exclude idx 0
      if (dimIdx <> AxisXdim) and (dimIdx <> AxisYdim) then
        if Hdimensions[dimIdx].curStep <> SelectedPointInDim[dimIdx] then
        begin
          r := False;
          Break;
        end;

    if r then
    try
      if (AxisXdim>0) and (AxisYdim>0) then
        begin
        MW.Position:=(i *Hdimensions[0].steps + SelectedPointInDim[0]{} )* 4{ SizeOf(Single)};
        MW.ReadBuffer(val, 4 {SizeOf(Single))});
        SpectraData[Hdimensions[AxisYdim].curStep, Hdimensions[AxisXdim].curStep] := val;
        end
      else
      if (AxisXdim=0) and (AxisYdim>0) then
        begin
        MW.Position:=(i *Hdimensions[0].steps)* 4{ SizeOf(Single)};
        MW.ReadBuffer(valSpectra.Buffer^, valSpectra.Length*SizeOf(Single));
        for j := 0 to valSpectra.Length-1 do
          begin
//          MW.ReadBuffer(val, 4 {SizeOf(Single))});
//           SpectraData[Hdimensions[AxisYdim].curStep, j] := val;
            SpectraData[Hdimensions[AxisYdim].curStep, j] := valSpectra[j] ;
          end;
        end
     else
      if (AxisXdim>0) and (AxisYdim=0) then
        begin
        MW.Position:=(i *Hdimensions[0].steps )* 4{ SizeOf(Single)};
        MW.ReadBuffer(valSpectra.Buffer^, valSpectra.Length*SizeOf(Single));
        for j := 0 to valSpectra.Length-1 do
          begin
//          MW.ReadBuffer(val, 4 {SizeOf(Single))});
//          SpectraData[j, Hdimensions[AxisXdim].curStep] := val;
            SpectraData[j,Hdimensions[AxisXdim].curStep] := valSpectra[j] ;
          end;
        end
     else     
      if (AxisXdim=0) and (AxisYdim=0) then
        begin
        MW.Position:=(i *Hdimensions[0].steps )* 4{ SizeOf(Single)};
        MW.ReadBuffer(valSpectra.Buffer^, valSpectra.Length*SizeOf(Single));
        for j := 0 to valSpectra.Length-1 do
          begin
//          MW.ReadBuffer(val, 4 {SizeOf(Single))});
//          SpectraData[j, j] := val;
            SpectraData[j, j] := valSpectra[j] ;
          end;
        end;

    finally
    end;

  end;
  valSpectra.Free;
  
end;

procedure TView.FormImageFastwoBG;
//read whole spectra
var
  i,j:Int64;
  dimIdx: Integer;
  r: Boolean;
  val: Single;
  s: string;
  valSpectra:TNumArray1<Single>;
  lp,rp:Integer;
begin
  if SpectraData = nil then
    Exit;

  NumSet(0.0, SpectraData);
  valSpectra:=TNumArray1<Single>.Create(Hdimensions[0].steps);
  
  lp:=edtBGCorrectionLeft.Value;
  rp:=edtBGCorrectionRight.Value;
  
  CalcDimToStart();

  MCounter := MW.Size div SizeOf(Single) div valSpectra.Length;

  
  for i := 0 to MCounter - 1 do
  begin
    r := True;
    CalcDim(1);
    Inc(trackingStep);

    for dimIdx := 1 to HdimCount - 1 do   //exclude idx 0
      if (dimIdx <> AxisXdim) and (dimIdx <> AxisYdim) then
        if Hdimensions[dimIdx].curStep <> SelectedPointInDim[dimIdx] then
        begin
          r := False;
          Break;
        end;

    if r then
    try
      if (AxisXdim>0) and (AxisYdim>0) then
        begin
        MW.Position:=(i *Hdimensions[0].steps)* 4{ SizeOf(Single)};
        MW.ReadBuffer(valSpectra.Buffer^ , valSpectra.Length* 4 {SizeOf(Single))});
        val:=valSpectra[ SelectedPointInDim[0] ] - ( valSpectra[lp] + valSpectra[ rp])/2 ;
                        
        SpectraData[Hdimensions[AxisYdim].curStep, Hdimensions[AxisXdim].curStep] := val;
        end
      else
      if (AxisXdim=0) and (AxisYdim>0) then
        begin
        MW.Position:=(i *Hdimensions[0].steps)* 4{ SizeOf(Single)};
        for j := 0 to valSpectra.Length-1 do
          begin
          MW.ReadBuffer(val, 4 {SizeOf(Single))});
          SpectraData[Hdimensions[AxisYdim].curStep, j] := val;
          end;
        end
     else
      if (AxisXdim>0) and (AxisYdim=0) then
        begin
        MW.Position:=(i *Hdimensions[0].steps )* 4{ SizeOf(Single)};
        for j := 0 to valSpectra.Length-1 do
          begin
          MW.ReadBuffer(val, 4 {SizeOf(Single))});
          SpectraData[j, Hdimensions[AxisXdim].curStep] := val;
          end;
        end
     else     
      if (AxisXdim=0) and (AxisYdim=0) then
        begin
        MW.Position:=(i *Hdimensions[0].steps )* 4{ SizeOf(Single)};
        for j := 0 to valSpectra.Length-1 do
          begin
          MW.ReadBuffer(val, 4 {SizeOf(Single))});
          SpectraData[j, j] := val;
          end;
        end;

    finally
    end;

  end;
  valSpectra.Free;

end;

procedure TView.FormImage_;
begin
   if cbBGCorrectionUse.Checked then
      FormImageFastwoBG
   else   
   FormImageFast;
end;

procedure TView.FormShow(Sender: TObject);
begin
  if firstTimeRun then
  begin
    IGraph.OnChangeBorders := OnChangeBordersIGraph;
    HGraph.OnChangeBorders := OnChangeBordersHGraph;
    VGraph.OnChangeBorders := OnChangeBordersVGraph;

    IGraph.OnSelectColRow := OnSelectColRowIGraph;

    IGraph.OnOverColRow := OnOverColRowIGraph;
    HGraph.OnOverColRow := OnOverColRowHVGraph;
    VGraph.OnOverColRow := OnOverColRowHVGraph;

    SGraph.OnSelectColRow:=OnSelectColRowSGraph;

    tprev := GetTickCount;
    firstTimeRun := False;
  end;
end;


procedure TView.LoadMapFromViewer(mapType:TMapType);
var
  i: Integer;
begin

//  CopyHeader;
  CopyHeader(mapType);

  canChange := False;
  cboxAxX.Clear;
  cboxAxY.Clear;

  for i := 0 to HdimCount - 1 do
  begin
    SelectedPointInDim[i]:=0;

    cboxAxX.Items.Add(Hdimensions[i].name);
    cboxAxY.Items.Add(Hdimensions[i].name);
  end;

  cboxAxX.ItemIndex :=0;//  AxisXdim;
  AxisXdim:=cboxAxX.ItemIndex;
  cboxAxY.ItemIndex :=1;// AxisYdim;
  AxisYdim:=cboxAxY.ItemIndex;



  canChange := True;

  OnChangeDimensions(AxisXdim, AxisYdim);

end;

procedure TView.Log(str: string);
begin
  TTask.Run(
    procedure
    begin
      TThread.Synchronize(nil,
        procedure
        begin
          if FormLog <> nil then
            if FormLog.MemoLog <> nil then
              FormLog.MemoLog.Lines.Add('View  ' + str);
        end);
    end);
end;

procedure TView.OnChangeBordersHGraph(Sender: TObject);
begin
  if GetTickCount - tprev > 20 then
  begin
    tprev := GetTickCount;

//    IGraph.minX := HGraph.Curve[0].data.x.IdxFormValue( HGraph.MinX);
//    IGraph.maxX := HGraph.Curve[0].data.x.IdxFormValue( HGraph.MaxX);

    IGraph.minX := HGraph.MinX;
    IGraph.maxX := HGraph.MaxX;


    VGraph.minX := HGraph.MinY;
    VGraph.maxX := HGraph.MaxY;

    VGraph.CalcResize(false);

    AutoScale := asCustom;
      //    RepaintIntensityIGraph;
    DrawImage;

  end;
end;

procedure TView.OnChangeBordersIGraph(Sender: TObject);
begin
  if GetTickCount - tprev > 20 then
  begin
    tprev := GetTickCount;

    HGraph.MinX := IGraph.minX;
    HGraph.MaxX := IGraph.maxX;
//    HGraph.MinX := HGraph.Curve[0].data.x[round(IGraph.minX)];
//    HGraph.MaxX := HGraph.Curve[0].data.x[round(IGraph.maxX-1)];  //-1

    HGraph.CalcResize(false);

    VGraph.MinY := IGraph.minY;
    VGraph.MaxY := IGraph.maxY;
//    VGraph.MinY := VGraph.Curve[0].data.x[round( IGraph.minY)];
//    VGraph.MaxY := VGraph.Curve[0].data.x[round(IGraph.maxY-1)];  //-1

    VGraph.CalcResize(false);
  end;
end;

procedure TView.OnChangeBordersVGraph(Sender: TObject);
begin
  if GetTickCount - tprev > 20 then
  begin
    tprev := GetTickCount;
//    IGraph.minY := VGraph.Curve[0].data.x.IdxFormValue(VGraph.MinY);
//    IGraph.maxY := VGraph.Curve[0].data.x.IdxFormValue(VGraph.MaxY);

    IGraph.minY := VGraph.MinY;
    IGraph.maxY := VGraph.MaxY;


    HGraph.minY := VGraph.MinX;
    HGraph.maxY := VGraph.MaxX;

    HGraph.CalcResize(false);

    AutoScale := asCustom;
      //IGraphIntensity
    DrawImage;
  end;
end;

procedure TView.OnChangeDimensions(AxX, AxY: byte);
var
  DimIdx,j,k: Integer;
  cboxArray: array[0..9] of TsComboBox;
  i: Integer;
begin
//  AxisXdim := AxX;
//  AxisYdim := AxY;
  if SpectraData <> nil then
    SpectraData.Free;
  if NormData <> nil then
    NormData.Free;
  if ImgData <> nil then
    ImgData.Free;

  SpectraData := TNumArray2<Single>.Create(Hdimensions[AxisYdim].steps, Hdimensions[AxisXdim].steps);
  NormData := TNumArray2<Single>.Create(Hdimensions[AxisYdim].steps, Hdimensions[AxisXdim].steps);
  ImgData := TNumArray2<Byte>.Create(Hdimensions[AxisYdim].steps, Hdimensions[AxisXdim].steps);

  HGraph.DeleteAll;
  HGraph.CreateCurve('Data', clRed, Hdimensions[AxisXdim].steps);

//  for j := 0 to Hdimensions[AxisXdim].steps-1 do
//    HGraph.Curve[0].data.x[j]:= Hdimensions[AxisXdim].axisVal[j];

 // NumCopy(Hdimensions[AxisXdim].axisVal, HGraph.Curve[0].data.x );

  VGraph.DeleteAll;
  VGraph.CreateCurve('Data', clRed, Hdimensions[AxisYdim].steps);
 // NumCopy(Hdimensions[AxisYdim].axisVal, VGraph.Curve[0].data.y );



// IGraph.minX:=0;
// IGraph.maxX:=Hdimensions[AxisXdim].steps;
// IGraph.minY:=0;
// IGraph.maxY:=Hdimensions[AxisYdim].steps;
//
// HGraph.SetLimits(IGraph.minX,IGraph.maxX);
// VGraph.SetLimits(IGraph.minY,IGraph.maxY);
  AutoscaleTriV;

  SGraph.DeleteAll;
  SGraph.CreateCurve('Data', clRed, Hdimensions[0].steps );

  for i := 0 to Hdimensions[0].steps-1 do
    with SGraph.Curve[0] do
      data.x[i]:=Hdimensions[0].axisVal[i];

   SGraph.MinX:= Hdimensions[0].axisVal[0];
   SGraph.MaxX:= Hdimensions[0].axisVal[Hdimensions[0].steps-1 ];
   SGraph.SetLimits(SGraph.MinX, SGraph.MaxX);

   SGraph.RepaintGraph;


  canChange:=False;


  cboxArray[0]:=cboxDim3;
  cboxArray[1]:=cboxDim4;
  cboxArray[2]:=cboxDim5;

  for j := 0 to 2 do
  cboxArray[j].Visible:=False;

  j:=0;
  for DimIdx := 0 to HdimCount - 1 do  //miss 0 - WaveLength
      if (DimIdx <> AxisXdim) and (DimIdx <> AxisYdim) then
        begin
         cboxArray[j].Visible:=True;
         cboxArray[j].Tag:=DimIdx;
         cboxArray[j].BoundLabel.Caption:=HDimensions[DimIdx].name;

         cboxArray[j].Items.Clear;

         if Hdimensions[DimIdx].AxisValsHasNames then
           for k := 0 to Hdimensions[DimIdx].steps-1 do
             cboxArray[j].Items.Add(Hdimensions[DimIdx].axisValNames[k] )
         else
         for k := 0 to Hdimensions[DimIdx].steps-1 do
             cboxArray[j].Items.Add(Hdimensions[DimIdx].axisVal[k].ToString);

         cboxArray[j].ItemIndex:= SelectedPointInDim[DimIdx];
         j:=j+1;
        end;

 canChange:=True;

  FormImage_;
  DrawImage;
end;

procedure TView.OnOverColRowHVGraph(Sender: TObject; const ACol, ARow: string);
begin
  StatusBarGraph.Panels[0].Text := Format('X=%d Y=%d', [Trunc(StrToFloatDef(ACol, 0)), Trunc(StrToFloatDef(ARow, 0))]);
end;

procedure TView.OnOverColRowIGraph(Sender: TObject; const ACol, ARow: integer);
begin
  StatusBarGraph.Panels[0].Text := Format('X=%d Y=%d', [ACol, ARow]);
end;

procedure TView.OnSelectColRowIGraph(Sender: TObject; const ACol, ARow: integer);
var
  addr: Int64;
begin
  StatusBarGraph.Panels[1].Text := Format('Col=%d Row=%d', [ACol, ARow]);

  selectedCol := ACol;
  selectedRow := ARow;

  SelectedPointInDim[AxisXdim] := ACol;
  SelectedPointInDim[AxisYdim] := ARow;

  RepaintHVGraph;
  RepaintSGraph(ACol, ARow);

end;

procedure TView.OnSelectColRowSGraph(Sender: TObject; const ACol, ARow: integer);
var idx,i:Integer;
begin

 if ACol<=Hdimensions[0].axisVal[0] then
    idx:=0
 else
 if ACol>=Hdimensions[0].axisVal[Hdimensions[0].steps-1] then
    idx:=Hdimensions[0].steps-1
 else
   begin

   for i := 0 to Hdimensions[0].steps-2 do
     if (ACol>= Hdimensions[0].axisVal[i] ) and  (ACol< Hdimensions[0].axisVal[i+1] ) then
     idx:=i;

   end;

StatusBarGraph.Panels[2].Text:=Format('WL = %.1f %s',[Hdimensions[0].axisVal[idx], Hdimensions[0].units ]);

//  edtWL.Text:=Format('%f.1',[Hdimensions[0].axisVal[ACol]]);
//
  if canChange then
  begin
  SelectedPointInDim[0] := idx; //ACol;

  FormImage_;
  DrawImage;
  end;


end;

procedure TView.pnlLGraphResize(Sender: TObject);
begin
  pnlGraphBottomLeft.Width := pnlLGraph.Width - 40;
end;

procedure TView.rbDecomposeClick(Sender: TObject);
begin
if Viewer.MD<>nil then
LoadMapFromViewer(mtDecomp);
end;

procedure TView.rbRAWClick(Sender: TObject);
begin
LoadMapFromViewer(mtRaw);
end;

procedure TView.rbResidualsClick(Sender: TObject);
begin
if Viewer.MR<>nil then
LoadMapFromViewer(mtRes);
end;

procedure TView.RepaintHVGraph;
begin
  if selectedCol>=HGraph.Curve[0].data.y.Length then
     selectedCol:=0;

  SpectraData.SingleRow(selectedRow, HGraph.Curve[0].data.y);
  HGraph.RepaintGraph;

  if selectedRow>=VGraph.Curve[0].data.y.Length then
     selectedRow:=0;
  
  SpectraData.SingleColumn(selectedCol, VGraph.Curve[0].data.y);
  VGraph.RepaintGraph;
end;

procedure TView.RepaintSGraph(x, y: integer);
var
  i, j, addr, dimIdx,xCross, yCross: Integer;
  val: Single;
  r: Boolean;
  valSpectra:TNumArray1<Single>;
  st:string;

begin

if MW=nil then
     Exit;

valSpectra:=TNumArray1<Single>.Create( Hdimensions[0].steps );


//if  length(SGraph.Curve)=0 then
//    begin
//    SGraph.CreateCurve('data', clRed, valSpectra.Count);
//    for j := 0 to valSpectra.Count-1 do
//    with   SGraph.Curve[0] do
//      data.x[j]:=Hdimensions[0].axisVal[j];
//    end;
//
//if  SGraph.Curve[0].data.x.Length<>valSpectra.length  then
//    begin
//    SGraph.DeleteAll;
//    SGraph.CreateCurve('data', clRed, valSpectra.Count);
//
//    for j := 0 to valSpectra.Count-1 do
//    with   SGraph.Curve[0] do
//      data.x[j]:=Hdimensions[0].axisVal[j];
//    end;


 CalcDimToStart();

 for i := 0 to MCounter - 1 do
                begin

                  r := True;
                  CalcDim(1);
                  Inc(trackingStep);

                  for dimIdx := 1 to HdimCount - 1 do   //exclude idx 0
                   // if (dimIdx <> AxisXdim) and (dimIdx <> AxisYdim)  then
                      if Hdimensions[dimIdx].curStep <> SelectedPointInDim[dimIdx] then
                      begin
                        r := False;
                        Break;
                      end;

                  if r then
//                   if (x=Hdimensions[AxisXdim].curStep) and (y=Hdimensions[AxisYdim].curStep){ and (zCross=Hdimensions[lastDim].curStep)} then
                      begin
                       MW.Position:=(i *Hdimensions[0].steps )* 4{ SizeOf(Single)};
//                       MW.ReadBuffer(valSpectra.Buffer^, valSpectra.Length*SizeOf(Single));
                       MW.ReadBuffer(valSpectra.Buffer^, valSpectra.UsedSize);

                    //   SGraph.CreateCurve('data', clRed, valSpectra.Length);

                       for j := 0 to valSpectra.Count-1 do
                          SGraph.Curve[0].data.y.Values[j]:=valSpectra.Values[j];

                        SGraph.AutoScaleAllLocal;
                        SGraph.RepaintGraph;

                        Break;
                       end;

                     if r then Break;
                      end;

if (i = MCounter - 1) and (r=false) then
 begin
     SGraph.DeleteAll;
     SGraph.RepaintGraph;

 end;
 valSpectra.Free;

end;

procedure TView.SaveViewTo3DCSV(const FileName: string);

    type TMinMax = record
         min, max:Integer;
         end;

    var   FS: TFileStream;
      i,j:Int64;
      dimIdx, xCross,yCross,zCross : Integer;
      r: Boolean;
      val: Single;
      aStr: AnsiString;
      valSpectra:TNumArray1<Single>;
      lastDim:Integer;

      CropX, CropY, CropW: TMinMax;

begin
   if (AxisXdim=0) or (AxisYdim=0) then Exit;

//    if FormCrop.ModalResult = mrOk then

      CropX.min:=0;
      Cropy.min:=0;
      CropW.min:=0;
      CropX.max:=Hdimensions[AxisXdim].steps-1;
      CropY.max:=Hdimensions[AxisYdim].steps-1;
      CropW.max:=Hdimensions[0].steps-1;

      FormCrop.sgCrop.Clear;

      FormCrop.sgCrop.Cells[0,1]:= Hdimensions[AxisXdim].name;
      FormCrop.sgCrop.Cells[0,2]:= Hdimensions[AxisYdim].name;
      FormCrop.sgCrop.Cells[0,3]:= Hdimensions[0].name;

      FormCrop.sgCrop.Cells[1,0]:= 'Min';
      FormCrop.sgCrop.Cells[2,0]:= 'MinCrop';
      FormCrop.sgCrop.Cells[3,0]:= 'MaxCrop';
      FormCrop.sgCrop.Cells[4,0]:= 'Max';

      FormCrop.sgCrop.Cells[1,1]:= CropX.min.ToString;
      FormCrop.sgCrop.Cells[2,1]:= CropX.min.ToString;
      FormCrop.sgCrop.Cells[3,1]:= CropX.max.ToString;
      FormCrop.sgCrop.Cells[4,1]:= CropX.max.ToString;

      FormCrop.sgCrop.Cells[1,2]:= CropY.min.ToString;
      FormCrop.sgCrop.Cells[2,2]:= CropY.min.ToString;
      FormCrop.sgCrop.Cells[3,2]:= CropY.max.ToString;
      FormCrop.sgCrop.Cells[4,2]:= CropY.max.ToString;

      FormCrop.sgCrop.Cells[1,3]:= CropW.min.ToString;
      FormCrop.sgCrop.Cells[2,3]:= CropW.min.ToString;
      FormCrop.sgCrop.Cells[3,3]:= CropW.max.ToString;
      FormCrop.sgCrop.Cells[4,3]:= CropW.max.ToString;


   FormCrop.ShowModal;
   if FormCrop.ModalResult <> mrOk then Exit;

       CropX.min:= StrToIntDef(FormCrop.sgCrop.Cells[2,1], CropX.min);
       CropX.max:= StrToIntDef(FormCrop.sgCrop.Cells[3,1], CropX.max);

       CropY.min:= StrToIntDef(FormCrop.sgCrop.Cells[2,2], CropY.min);
       CropY.max:= StrToIntDef(FormCrop.sgCrop.Cells[3,2], CropY.max);

       CropW.min:= StrToIntDef(FormCrop.sgCrop.Cells[2,3], CropW.min);
       CropW.max:= StrToIntDef(FormCrop.sgCrop.Cells[3,3], CropW.max);

       if (CropX.max<=CropX.min) or (CropY.max<=CropY.min) or (CropW.max<=CropW.min) then Exit;

       try
          FS := TFileStream.Create(FileName, fmCreate, fmShareDenyWrite);

          FormWaitBG.Show;
          FormWaitBG.lblInfo.Caption := Format('Exporting: %3.1f %%',[0.0]);

          valSpectra:=TNumArray1<Single>.Create( CropW.max - CropW.min+1 {Hdimensions[0].steps} );
          MCounter := MW.Size div SizeOf(Single) div valSpectra.Length;

          lastDim:= Length(Hdimensions)-1; //Hope it is Z

//        for zCross := 0 to Hdimensions[lastDim].steps-1 do
//          for zCross := 1 to 1 do

          for yCross := CropY.min to CropY.max do
//          for yCross := 0 to Hdimensions[AxisYdim].steps-1 do
            begin
//              aStr:='Row = '+yCross.ToString +#13#10 ;
//              FS.Write(Pointer(aStr)^, Length(aStr) * SizeOf(AnsiChar));

            for xCross := CropX.min to CropX.max do
//            for xCross := 0 to Hdimensions[AxisXdim].steps-1 do
              begin

                CalcDimToStart();

                for i := 0 to MCounter - 1 do
                begin
//                  Application.ProcessMessages;                                //!!!!!!!!!  Makes loop very slow

                  r := True;
                  CalcDim(1);
                  Inc(trackingStep);

                  for dimIdx := 1 to HdimCount - 1 do   //exclude idx 0
                    if (dimIdx <> AxisXdim) and (dimIdx <> AxisYdim) {and (dimIdx <> lastDim)} then
                      if Hdimensions[dimIdx].curStep <> SelectedPointInDim[dimIdx] then
                      begin
                        r := False;
                        Break;
                      end;

                  if r then
                   if (xCross=Hdimensions[AxisXdim].curStep) and (yCross=Hdimensions[AxisYdim].curStep){ and (zCross=Hdimensions[lastDim].curStep)} then
                      begin
                       MW.Position:=(i *Hdimensions[0].steps + CropW.min)* 4{ SizeOf(Single)};
//                       MW.ReadBuffer(valSpectra.Buffer^, valSpectra.Length*SizeOf(Single));
                       MW.ReadBuffer(valSpectra.Buffer^, (CropW.max-CropW.min+1)*SizeOf(Single));

                        {j=0}  aStr:=  valSpectra[0].ToString;
                        for j := 1 to valSpectra.Length-1 do
                           aStr:=aStr+','+ valSpectra[j].ToString;
                        aStr:=aStr+#13#10;
      //                  writeToFile
                        FS.Write(Pointer(aStr)^, Length(aStr) * SizeOf(AnsiChar));
                        Break;
                      end;

                  end;


               FormWaitBG.lblInfo.Caption := Format('Exporting: %3.1f %%',[100*( zCross+ (xCross+yCross*Hdimensions[AxisXdim].steps)/(Hdimensions[AxisXdim].steps*Hdimensions[AxisYdim].steps) ) ]);
              end;
            end;

        finally
          valSpectra.Free;
          FS.Free;
          FormWaitBG.Close;
        end;

end;

procedure TView.SaveViewTo4DCSV(const FileName: string);
    type TMinMax = record
         min, max:Integer;
         end;

    var   FS: TFileStream;
      i,j:Int64;
      dimIdx, xCross,yCross,zCross : Integer;
      r: Boolean;
      val: Single;
      aStr: AnsiString;
      valSpectra:TNumArray1<Single>;
      lastDim:Integer;

      CropX, CropY, CropZ, CropW: TMinMax;

begin
   if (AxisXdim=0) or (AxisYdim=0) then Exit;

//    if FormCrop.ModalResult = mrOk then

      CropX.min:=0;
      Cropy.min:=0;
      CropZ.min:=0;
      CropW.min:=0;
      CropW.max:=Hdimensions[0].steps-1;
      CropX.max:=Hdimensions[1].steps-1;
      CropY.max:=Hdimensions[2].steps-1;
      CropZ.max:=Hdimensions[3].steps-1;

      FormCrop.sgCrop.Clear;

      FormCrop.sgCrop.Cells[0,1]:= Hdimensions[1].name;
      FormCrop.sgCrop.Cells[0,2]:= Hdimensions[2].name;
      FormCrop.sgCrop.Cells[0,3]:= Hdimensions[2].name;
      FormCrop.sgCrop.Cells[0,4]:= Hdimensions[0].name;

      FormCrop.sgCrop.Cells[1,0]:= 'Min';
      FormCrop.sgCrop.Cells[2,0]:= 'MinCrop';
      FormCrop.sgCrop.Cells[3,0]:= 'MaxCrop';
      FormCrop.sgCrop.Cells[4,0]:= 'Max';

      FormCrop.sgCrop.Cells[1,1]:= CropX.min.ToString;
      FormCrop.sgCrop.Cells[2,1]:= CropX.min.ToString;
      FormCrop.sgCrop.Cells[3,1]:= CropX.max.ToString;
      FormCrop.sgCrop.Cells[4,1]:= CropX.max.ToString;

      FormCrop.sgCrop.Cells[1,2]:= CropY.min.ToString;
      FormCrop.sgCrop.Cells[2,2]:= CropY.min.ToString;
      FormCrop.sgCrop.Cells[3,2]:= CropY.max.ToString;
      FormCrop.sgCrop.Cells[4,2]:= CropY.max.ToString;

      FormCrop.sgCrop.Cells[1,3]:= CropZ.min.ToString;
      FormCrop.sgCrop.Cells[2,3]:= CropZ.min.ToString;
      FormCrop.sgCrop.Cells[3,3]:= CropZ.max.ToString;
      FormCrop.sgCrop.Cells[4,3]:= CropZ.max.ToString;


      FormCrop.sgCrop.Cells[1,4]:= CropW.min.ToString;
      FormCrop.sgCrop.Cells[2,4]:= CropW.min.ToString;
      FormCrop.sgCrop.Cells[3,4]:= CropW.max.ToString;
      FormCrop.sgCrop.Cells[4,4]:= CropW.max.ToString;


   FormCrop.ShowModal;
   if FormCrop.ModalResult <> mrOk then Exit;

       CropX.min:= StrToIntDef(FormCrop.sgCrop.Cells[2,1], CropX.min);
       CropX.max:= StrToIntDef(FormCrop.sgCrop.Cells[3,1], CropX.max);

       CropY.min:= StrToIntDef(FormCrop.sgCrop.Cells[2,2], CropY.min);
       CropY.max:= StrToIntDef(FormCrop.sgCrop.Cells[3,2], CropY.max);

       CropZ.min:= StrToIntDef(FormCrop.sgCrop.Cells[2,3], CropZ.min);
       CropZ.max:= StrToIntDef(FormCrop.sgCrop.Cells[3,3], CropZ.max);

       CropW.min:= StrToIntDef(FormCrop.sgCrop.Cells[2,4], CropW.min);
       CropW.max:= StrToIntDef(FormCrop.sgCrop.Cells[3,4], CropW.max);

       if (CropX.max<=CropX.min) or (CropY.max<=CropY.min) or (CropW.max<=CropW.min) then Exit;

       try
          FS := TFileStream.Create(FileName, fmCreate, fmShareDenyWrite);

          FormWaitBG.Show;
          FormWaitBG.lblInfo.Caption := Format('Exporting: %3.1f %%',[0.0]);

          valSpectra:=TNumArray1<Single>.Create( CropW.max - CropW.min {Hdimensions[0].steps} );
          MCounter := MW.Size div SizeOf(Single) div valSpectra.Length;

          lastDim:= Length(Hdimensions)-1; //Hope it is Z

        for zCross := CropZ.min to CropZ.max-1 do
//          for zCross := 1 to 1 do

          for yCross := CropY.min to CropY.max-1 do
//          for yCross := 0 to Hdimensions[AxisYdim].steps-1 do
            begin
//              aStr:='Row = '+yCross.ToString +#13#10 ;
//              FS.Write(Pointer(aStr)^, Length(aStr) * SizeOf(AnsiChar));

            for xCross := CropX.min to CropX.max-1 do
//            for xCross := 0 to Hdimensions[AxisXdim].steps-1 do
              begin

                CalcDimToStart();

                for i := 0 to MCounter - 1 do
                begin
//                  Application.ProcessMessages;                                //!!!!!!!!!  Makes loop very slow

                  r := True;
                  CalcDim(1);
                  Inc(trackingStep);

                  for dimIdx := 1 to HdimCount - 1 do   //exclude idx 0
                    if (dimIdx <> 1) and (dimIdx <> 2) and (dimIdx <> 3) then
                      if Hdimensions[dimIdx].curStep <> SelectedPointInDim[dimIdx] then
                      begin
                        r := False;
                        Break;
                      end;

                  if r then
                   if (xCross=Hdimensions[1].curStep) and (yCross=Hdimensions[2].curStep) and (zCross=Hdimensions[3].curStep) then
                      begin
                       MW.Position:=(i *Hdimensions[0].steps + CropW.min)* 4{ SizeOf(Single)};
//                       MW.ReadBuffer(valSpectra.Buffer^, valSpectra.Length*SizeOf(Single));
                       MW.ReadBuffer(valSpectra.Buffer^, (CropW.max-CropW.min)*SizeOf(Single));

                        {j=0}  aStr:=  valSpectra[0].ToString;
                        for j := 1 to valSpectra.Length-1 do
                           aStr:=aStr+','+ valSpectra[j].ToString;
                        aStr:=aStr+#13#10;
      //                  writeToFile
                        FS.Write(Pointer(aStr)^, Length(aStr) * SizeOf(AnsiChar));
                        Break;
                      end;

                  end;


               FormWaitBG.lblInfo.Caption := Format('Exporting: %3.1f %%',[100*( zCross+ (xCross+yCross*Hdimensions[AxisXdim].steps)/(Hdimensions[AxisXdim].steps*Hdimensions[AxisYdim].steps) ) ]);
              end;
            end;

        finally
          valSpectra.Free;
          FS.Free;
          FormWaitBG.Close;
        end;

end;

procedure TView.SaveViewToCSV(const FileName: string);
var
  i, j: Integer;
  FS: TFileStream;
  aStr: AnsiString;
begin
  FormatSettings.DecimalSeparator := '.';
  try
    FS := TFileStream.Create(FileName, fmCreate, fmShareDenyWrite);

    aStr := 'Width=' + SpectraData.Width.ToString + ' Height' + SpectraData.Height.ToString + #13#10;
    FS.Write(Pointer(aStr)^, Length(aStr) * SizeOf(AnsiChar));

    aStr := Hdimensions[AxisXdim].name +'('+Hdimensions[AxisXdim].units + ')'+ #13#10;
    if Hdimensions[AxisXdim].AxisValsHasNames then
       begin
       aStr:=aStr+Hdimensions[AxisXdim].axisValNames[0];

       for i := 1 to Hdimensions[AxisXdim].steps-1 do
         aStr:=aStr+','+Hdimensions[AxisXdim].axisValNames[i];
       aStr:=aStr+ #13#10; 
       end
     else
       begin
       aStr:=aStr+Hdimensions[AxisXdim].axisVal[0].ToString;
    
       for i := 1 to Hdimensions[AxisXdim].steps-1 do
         aStr:=aStr+','+Hdimensions[AxisXdim].axisVal[i].ToString;
       aStr:=aStr+ #13#10; 
       end;
    FS.Write(Pointer(aStr)^, Length(aStr) * SizeOf(AnsiChar));       

    aStr := Hdimensions[AxisYdim].name +'('+Hdimensions[AxisYdim].units + ')'+ #13#10;
    if Hdimensions[AxisYdim].AxisValsHasNames then
       begin
       aStr:=aStr+Hdimensions[AxisYdim].axisValNames[0];
    
       for i := 1 to Hdimensions[AxisYdim].steps-1 do
         aStr:=aStr+','+Hdimensions[AxisYdim].axisValNames[i];
       aStr:=aStr+ #13#10; 
       end
     else
       begin
       aStr:=aStr+Hdimensions[AxisYdim].axisVal[i].ToString;
    
       for i := 1 to Hdimensions[AxisYdim].steps-1 do
         aStr:=aStr+','+Hdimensions[AxisYdim].axisVal[i].ToString;
       aStr:=aStr+ #13#10; 
       end;
    FS.Write(Pointer(aStr)^, Length(aStr) * SizeOf(AnsiChar));       


    for j := 0 to SpectraData.Height - 1 do
    begin
      aStr := SpectraData.Values[j, 0].ToString;
      for i := 1 to SpectraData.Width - 1 do
        aStr := aStr + ',' + SpectraData.Values[j, i].ToString;

      aStr := aStr + #13#10;
      FS.Write(Pointer(aStr)^, Length(aStr) * SizeOf(AnsiChar));
    end;
  finally
    FS.Free;
  end;
end;

procedure TView.SaveViewToXYZCSV(const FileName: string);
    var   FS: TFileStream;
      i,j:Int64;
      dimIdx, xCross,yCross,zCross : Integer;
      r: Boolean;
      val: Single;
      aStr: AnsiString;
      valSpectra:TNumArray1<Single>;
      lastDim:Integer;
begin
if Length(Hdimensions)<>4 then Exit;

  try
          FS := TFileStream.Create(FileName, fmCreate, fmShareDenyWrite);

          FormWaitBG.Show;
          FormWaitBG.lblInfo.Caption := Format('Exporting: %3.1f %%',[0.0]);

          valSpectra:=TNumArray1<Single>.Create( 1 {Hdimensions[0].steps} );
          MCounter := MW.Size div SizeOf(Single) div valSpectra.Length;

          lastDim:= Length(Hdimensions)-1; //Hope it is Z

        for zCross := 0 to Hdimensions[3].steps-1 do
//          for zCross := 1 to 1 do

          for yCross := 0 to Hdimensions[2].steps-1 do
//          for yCross := 0 to Hdimensions[AxisYdim].steps-1 do
            begin
//              aStr:='Row = '+yCross.ToString +#13#10 ;
//              FS.Write(Pointer(aStr)^, Length(aStr) * SizeOf(AnsiChar));

            for xCross := 0 to Hdimensions[1].steps-1 do
//            for xCross := 0 to Hdimensions[AxisXdim].steps-1 do
              begin

                CalcDimToStart();

                for i := 0 to MCounter - 1 do
                begin
//                  Application.ProcessMessages;                                //!!!!!!!!!  Makes loop very slow

                  r := True;
                  CalcDim(1);
                  Inc(trackingStep);

                  for dimIdx := 1 to HdimCount - 1 do   //exclude idx 0
                    if (dimIdx <> 1) and (dimIdx <> 2) and (dimIdx <> 3) then
                      if Hdimensions[dimIdx].curStep <> SelectedPointInDim[dimIdx] then
                      begin
                        r := False;
                        Break;
                      end;

                  if r then
                   if (xCross=Hdimensions[1].curStep) and (yCross=Hdimensions[2].curStep) and (zCross=Hdimensions[3].curStep) then
                      begin
                       MW.Position:=(i *Hdimensions[0].steps + SelectedPointInDim[0])* 4{ SizeOf(Single)};
//                       MW.ReadBuffer(valSpectra.Buffer^, valSpectra.Length*SizeOf(Single));
                       MW.ReadBuffer(valSpectra.Buffer^, 1*SizeOf(Single));

                        {j=0}  aStr:=  valSpectra[0].ToString;
                        for j := 1 to valSpectra.Length-1 do
                           aStr:=aStr+','+ valSpectra[j].ToString;
                        aStr:=aStr+#13#10;
      //                  writeToFile
                        FS.Write(Pointer(aStr)^, Length(aStr) * SizeOf(AnsiChar));
                        Break;
                      end;

                  end;


               FormWaitBG.lblInfo.Caption := Format('Exporting: %3.1f %%',[100*( zCross+ (xCross+yCross*Hdimensions[AxisXdim].steps)/(Hdimensions[AxisXdim].steps*Hdimensions[AxisYdim].steps) ) ]);
              end;
            end;

        finally
          valSpectra.Free;
          FS.Free;
          FormWaitBG.Close;
        end;
end;

procedure TView.btnLoadClick(Sender: TObject);
begin
  LoadMapFromViewer(mtRaw);
end;

procedure TView.btnExportCSV3DClick(Sender: TObject);
begin
if IGraph.isLoaded then
  begin
    SaveDialog.Filter := 'csv|*.csv';
    SaveDialog.DefaultExt := 'csv';
    SaveDialog.FileName := 'PlotData';

    if SaveDialog.Execute then
      SaveViewTo3DCSV(SaveDialog.FileName);
  end
  else
    sShowMessage('No data');
end;

procedure TView.btnExportCSV4DClick(Sender: TObject);
begin
if IGraph.isLoaded then
  begin
    SaveDialog.Filter := 'csv|*.csv';
    SaveDialog.DefaultExt := 'csv';
    SaveDialog.FileName := 'PlotData';

    if SaveDialog.Execute then
      SaveViewTo4DCSV(SaveDialog.FileName);
  end
  else
    sShowMessage('No data');
end;

procedure TView.sButton2Click(Sender: TObject);
begin
//  OnChangeDimensions(1, 2);
end;

procedure TView.btnUpdateClick(Sender: TObject);
begin
  FormImage_;
  DrawImage;
end;

procedure TView.UpadteView;
begin
  FormImage_;
  DrawImage;
end;

end.

