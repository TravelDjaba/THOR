unit uViewer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.IniFiles,
  NumIPP, NumArray, System.Threading, System.SyncObjs,
  Log, uScan2, AdvUtil, Vcl.Grids, AdvObj, BaseGrid, AdvGrid, Vcl.StdCtrls,
  Vcl.Mask, sMaskEdit, sCustomComboEdit, sToolEdit, Vcl.ExtCtrls, sPanel,
  Vcl.ComCtrls, Vcl.ToolWin, sToolBar, sLabel, sDialogs, sSplitter, sButton,
  sScrollBox, acProgressBar, sGroupBox, sEdit, sSpinEdit, sCheckBox, GR32, System.ZLib,
  TMMatrix, TDecomposition, MathOps2, uWheelCorrection;

const
   ViewMinHeight = 400;
   ViewMinWidth = 500;

type
    DecompComponent = record
      data:TVector;
      name:String;
      end;


type
  TViewer = class(TForm)
    pnlInfo: TsPanel;
    sgInfo: TAdvStringGrid;
    lblFileName: TsLabel;
    lblDescription: TsLabel;
    ToolBarViewer: TsToolBar;
    btnOpen: TToolButton;
    sLabel1: TsLabel;
    OpenDialog: TsOpenDialog;
    sSplitter1: TsSplitter;
    sgLayout: TAdvStringGrid;
    btnChangeLayout: TsButton;
    sScrollBox1: TsScrollBox;
    pnlViewPole: TsPanel;
    btnHide: TsButton;
    trbOpenProgress: TsProgressBar;
    btnDecompose: TToolButton;
    pnlCompare: TsPanel;
    SaveDialog: TsSaveDialog;
    btnSaveDecomposition: TToolButton;
    btnSaveRaw: TToolButton;
    btnSmooth: TToolButton;
    btnRemoveBaseline: TToolButton;
    btnMath: TToolButton;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnOpenClick(Sender: TObject);
    procedure btnChangeLayoutClick(Sender: TObject);
    procedure sgLayoutMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnHideClick(Sender: TObject);
    procedure btnDecomposeClick(Sender: TObject);
    procedure btnSaveDecompositionClick(Sender: TObject);
    procedure btnSaveRawClick(Sender: TObject);
    procedure btnSmoothClick(Sender: TObject);
    procedure btnRemoveBaselineClick(Sender: TObject);
    procedure btnMathClick(Sender: TObject);
  private
    firstRun:Boolean;
//    HEADER
////////////////////////////
    HmeasurementInfo:TMeasurementInfo;

    Hscantype,
    HSize:Cardinal;
///////////////////////////
    pnlRow, pnlCol:array[0..19] of TsPanel;
    splitRow, splitCol:array[0..19] of TsSplitter;

    critSectMaccess:TCriticalSection;

    F: TFileStream;
    fIsReadyForAcquiring:Boolean;

    trackingStep:Cardinal;
    canChangeLayout:Boolean;

    procedure Log(str:string);
    procedure ClearHeader;

    procedure CalcDim(dimIdx:byte);
    procedure CalcDimToStart;

    procedure AddCompareView;

  public
    Hdimensions:array of TDimension;
    HdimCount:Cardinal;
    M, MD, MR:TMemoryStream;
    MCounter:Cardinal;

    isLoaded:Boolean;

    property IsReadyForAcquiring:Boolean read fIsReadyForAcquiring;

    function  ReadHeader(filename:string):Boolean;
    procedure PrepareStreams;
    procedure LoadViewers;

    procedure Clear;
    procedure WriteFrame( fPtr:Pointer;  fSize:Cardinal );
    procedure WriteMfromFile(filename:string);
    procedure LoadCompareView;
    procedure UpdateViewers;
    procedure ChangeLayout(ACol, ARow:Integer);

  private
    splitterDownPoint:TPoint;
    ViewRowCnt, ViewColCnt:Integer;

    procedure OnSplitterHMouseDown (Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure OnSplitterHMouseUp   (Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure OnSplitterVMouseDown (Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure OnSplitterVMouseUp   (Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

  private
    btmHeader:TBitmap32;

  public


    DecompCompSet:array of DecompComponent;
    Ddimensions:array of TDimension;

    procedure DecomposeData(smoothed:boolean=false; bAirFiltration:boolean=false);
    function WriteHeader(F:TFileStream; Hdimensions:array of TDimension ):Boolean;


  end;

//var
//  Viewer: TViewer;

implementation

{$R *.dfm}

uses main, uView, uViewCompare, uDecompose, uMathSpectra;

{ TViewer }
var
    View: array[0..63] of TView;
    ViewCompare: TFormViewCompare;

procedure TViewer.sgLayoutMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
//if canChangeLayout then
  begin
//  canChangeLayout:=False;
    sgLayout.Enabled:=False;

  if sgLayout.SelectedCellsCount>0 then
    begin
    ChangeLayout(sgLayout.SelectedColCount, sgLayout.SelectedRowCount);
    Log( Format('Set Layout[%d x %d]', [sgLayout.SelectedColCount, sgLayout.SelectedRowCount ]));
    end;

  end;
end;

procedure TViewer.UpdateViewers;
var
  I: Integer;
begin
  try
    critSectMaccess.Enter;

  for I := 0 to 31 do
  if View[i]<>nil then
  View[i].UpadteView;
  finally
    critSectMaccess.Leave;
  end;

end;

procedure TViewer.AddCompareView;
begin
    ViewCompare:=TFormViewCompare.Create(Self);
    ViewCompare.Parent:=pnlCompare;
    ViewCompare.Viewer:=Self;
    ViewCompare.Align:=alClient;
    ViewCompare.Show;
end;

procedure TViewer.btnChangeLayoutClick(Sender: TObject);
begin
 sgLayout.Enabled:= not sgLayout.Enabled;
end;

procedure TViewer.btnDecomposeClick(Sender: TObject);
begin
formDecompose.Show;
end;

procedure TViewer.btnHideClick(Sender: TObject);
begin
pnlInfo.width:=0;
if Assigned(FormScan2) then
   FormScan2.pnlTop.Height:=0;

end;

procedure TViewer.btnMathClick(Sender: TObject);
begin
FormMathSpectra.Show;
end;

procedure TViewer.btnOpenClick(Sender: TObject);
var i:Integer;
begin
if OpenDialog.Execute then
  begin
   if Length(View)<=1 then
     begin
     ChangeLayout(1,1);
     Application.ProcessMessages;
     end;

   Clear;
   if ReadHeader(OpenDialog.FileName) then
   begin
   PrepareStreams;
    TTask.Run(procedure()
      begin
       WriteMfromFile(OpenDialog.FileName);
       LoadCompareView;
       LoadViewers;
      end);
   end;


  end;

end;

procedure TViewer.btnRemoveBaselineClick(Sender: TObject);
var
    valSpectra, tmp, wheel:TNumArray1<Single>;
    j:integer;
    wheelRadius, firstPix, lastPix:Integer;


begin
  if M=nil then Exit;

  FormWheelCorrection.ShowModal;

  if FormWheelCorrection.ModalResult <> mrOk then
      Exit;

//  wheelRadius:=300;
//  firstPix:=190;
//  lastPix:= Hdimensions[0].steps-1;

  wheelRadius:=FormWheelCorrection.fRadius;
  firstPix:=FormWheelCorrection.fFirstPixel;
  lastPix:= FormWheelCorrection.fLastPixel;


  valSpectra:=TNumArray1<Single>.Create(Hdimensions[0].steps);
  tmp:=TNumArray1<Single>.Create(Hdimensions[0].steps);

  wheel:=TNumArray1<Single>.Create(2*wheelRadius+1);

  for j := -wheelRadius to wheelRadius do
     wheel[j+wheelRadius]:=  Sqrt( Sqr(wheelRadius) - Sqr(j));


M.Seek(0, soBeginning);

   try
     try
     j:=0;
     while M.Position< M.Size do
     begin
       M.ReadBuffer(valSpectra.Buffer^, valSpectra.Length*SizeOf(Single));


       baseLineWheel(valSpectra, tmp, wheel, firstPix, lastPix );

       M.Seek(-valSpectra.Length*SizeOf(Single), soFromCurrent);

       M.WriteBuffer(tmp.Buffer^, tmp.Length*SizeOf(Single));

      inc(j);
     end;
     except
       ShowMessage('Error '+j.ToString);
     end;

   finally
   valSpectra.Free;
   tmp.Free;
   end;

   wheel.Free;
   ShowMessage('Done '+j.ToString);


end;

procedure TViewer.btnSaveDecompositionClick(Sender: TObject);
var

    FD: TFileStream;

begin
if (Self.MD=nil) or (Length(Ddimensions)=0) then
  begin
    ShowMessage('No decomposed data');
    exit;
  end;

    if Not SaveDialog.Execute then Exit;
    FD:=TFileStream.Create(SaveDialog.FileName+'.scn2', fmCreate or fmShareDenyWrite );

    WriteHeader(FD, Ddimensions);

    MD.Seek(0, soBeginning);
    try

      try
        FD.CopyFrom(MD, MD.Size);
        ShowMessage('Save OK');
      except
       ShowMessage('Save decomposed data error');
      end;
    finally
      Fd.Free;
    end;


end;

procedure TViewer.btnSaveRawClick(Sender: TObject);
var

    FD: TFileStream;

begin
if (Self.M =nil)  then
  begin
    ShowMessage('No data');
    exit;
  end;

    if Not SaveDialog.Execute then Exit;
    FD:=TFileStream.Create(SaveDialog.FileName+'.scn2', fmCreate or fmShareDenyWrite );

    WriteHeader(FD, Hdimensions);

    M.Seek(0, soBeginning);
    try

      try
        FD.Seek(0, soEnd);
        FD.CopyFrom(M, M.Size);
        ShowMessage('Save OK');
      except
       ShowMessage('Save decomposed data error');
      end;
    finally
      Fd.Free;
    end;

end;

procedure TViewer.btnSmoothClick(Sender: TObject);
var
    valSpectra, tmp:TNumArray1<Single>;
    j:integer;

begin
if M=nil then Exit;


valSpectra:=TNumArray1<Single>.Create(Hdimensions[0].steps);
tmp:=TNumArray1<Single>.Create(Hdimensions[0].steps);


M.Seek(0, soBeginning);

   try
     try
     j:=0;
     while M.Position<M.Size do
     begin
       M.ReadBuffer(valSpectra.Buffer^, valSpectra.Length*SizeOf(Single));
       sgolayfilt(valSpectra, tmp, 9);
       M.Seek(-valSpectra.Length*SizeOf(Single), soFromCurrent);

       M.WriteBuffer(tmp.Buffer^, tmp.Length*SizeOf(Single));

      inc(j);
     end;
     except
       ShowMessage('Error '+j.ToString);
     end;

   finally
   valSpectra.Free;
   tmp.Free;
   end;

   ShowMessage('Done '+j.ToString);

end;

procedure TViewer.CalcDim(dimIdx: byte);
var
  i: Integer;
begin
  if dimIdx=0 then
    for i := 0 to HdimCount-1 do
     Hdimensions[i].prevStep:=Hdimensions[i].curStep;

if trackingStep >0 then
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
     if (Hdimensions[dimIdx].curStep = Hdimensions[dimIdx].steps) or (Hdimensions[dimIdx].curStep<0 ) then
         begin // overflow
          //check ZigZag
          if Hdimensions[dimIdx].zigZag then
             begin
               if Hdimensions[dimIdx].dir then
                Hdimensions[dimIdx].curStep:=0
              else
                Hdimensions[dimIdx].curStep:=Hdimensions[dimIdx].steps-1;

              Hdimensions[dimIdx].dir:=not Hdimensions[dimIdx].dir;
             end
           else
             Hdimensions[dimIdx].curStep:=0;

             CalcDim(dimIdx+1);
         end;
  end;
end;


procedure TViewer.CalcDimToStart;
var i:Integer;
begin

if HdimCount>0 then
  begin
  for i := 0 to HdimCount-1 do
   begin
    Hdimensions[i].curStep:=0;
    Hdimensions[i].prevStep:=0;
    Hdimensions[i].dir:=False;
    end;
  end;

end;

procedure TViewer.ChangeLayout(ACol, ARow: Integer);
var
  i,j: Integer;
begin
//in order to not destroy

for i := 0 to Length(View)-1 do
  if Assigned(View[i]) then
   View[i].Parent:=Self;


for i := 0 to Length(pnlCol)-1 do
   FreeAndNil(pnlCol[i]);
for i := 0 to Length(splitCol)-1 do
   FreeAndNil(splitCol[i]);

for i := 0 to Length(pnlRow)-1 do
   FreeAndNil(pnlRow[i]);
for i := 0 to Length(splitRow)-1 do
   FreeAndNil(splitRow[i]);

   pnlViewPole.Height:=sScrollBox1.Height;
   pnlViewPole.Width:=sScrollBox1.Width;
   pnlViewPole.Align:=alClient;
   Application.ProcessMessages;

  ViewRowCnt:=ARow;
  ViewColCnt:=ACol;
///////Rows

for i := 0 to ARow-1 do
  begin
   pnlRow[i]:=TsPanel.Create(Self);
   pnlRow[i].Parent:=pnlViewPole;
   pnlRow[i].Tag:=i;

   pnlRow[i].Top:=pnlRow[0].Height*i+ 7*i ;

   if i<ARow-1 then
    pnlRow[i].Align:=alTop
   else
   pnlRow[i].Align:=alClient;

   pnlRow[i].Constraints.MinHeight:=50;

   if i < ARow-1 then
    begin
   splitRow[i]:=TsSplitter.Create(Self);
   splitRow[i].Parent:=pnlViewPole;
   splitRow[i].Tag:=i;
   splitRow[i].Align:=alTop;
//   splitRow[i].MinSize:=100;

   splitRow[i].Top:=pnlRow[0].Top+pnlRow[0].Height*(i+1) + splitRow[0].Height*i+7;
   splitRow[i].OnMouseDown:=OnSplitterHMouseDown;
   splitRow[i].OnMouseUp:=OnSplitterHMouseUp;
   end;

  end;

  /////// Cols

for j := 0 to ARow-1 do
  begin
    for i := 0 to ACol-1 do
      begin
       pnlCol[i+ACol*j]:=TsPanel.Create(Self);
       pnlCol[i+ACol*j].Parent:=pnlRow[j];
       pnlCol[i+ACol*j].Tag:=i+ACol*j;

       pnlCol[i+ACol*j].Left:=pnlCol[0].Left+pnlCol[0].Width*i+ 7*i ;

       if i<ACol-1 then
        pnlCol[i+ACol*j].Align:=alLeft
       else
        pnlCol[i+ACol*j].Align:=alClient;

        pnlCol[i+ACol*j].Constraints.MinWidth:=100;

        if i<ACol-1 then
        begin
         splitCol[i+ACol*j]:=TsSplitter.Create(Self);
         splitCol[i+ACol*j].Parent:=pnlRow[j];
         splitCol[i+ACol*j].Tag:= i+ACol*j;

         splitCol[i+ACol*j].Align:=alLeft;
         splitCol[i+ACol*j].Left:=pnlCol[0].Left+pnlCol[0].Width*(i+1)+ splitCol[0].Width*i+1;

         splitCol[i+ACol*j].OnMouseUp:=OnSplitterVMouseUp;
        end;
      end;

  end;


   if (ViewRowCnt>1) and  (ViewColCnt>1) then
     begin
     pnlViewPole.Align:=alNone;
     pnlViewPole.Top:=0;
     pnlViewPole.Left:=0;
     end
    else
    pnlViewPole.Align:=alClient;


   if (pnlViewPole.Height div ARow < ViewMinHeight) then
     begin
     pnlViewPole.Height:=ViewMinHeight*ARow + 7*(ARow-1);
     for i := 0 to Arow-2 do
       pnlRow[i].Height:=ViewMinHeight;
     end
    else
     begin
     for i := 0 to Arow-2 do
       pnlRow[i].Height:=pnlViewPole.Height div ARow;
     end;


   if (pnlViewPole.Width div ACol < ViewMinWidth) then
     begin
     pnlViewPole.Width:=ViewMinWidth*ACol + 7*(ACol-1);
     for i := 0 to Length(pnlCol)-1 do
       if pnlCol[i]<>nil then
        pnlCol[i].Width:=ViewMinWidth;
     end
    else
     begin
     for i := 0 to Length(pnlCol)-1 do
       if pnlCol[i]<>nil then
       pnlCol[i].width:=pnlViewPole.Width div ACol;
     end;

for i := 0 to Length(View)-1 do
  if Assigned(View[i]) then
   View[i].Parent:=Self;

j:=0;
for i := 0 to ACol*ARow-1 do
  if Assigned(View[i]) then
    begin
     // return Views back
    View[j].Parent:=pnlCol[j];
    Inc(j);
    end
  else
    begin
    View[j]:=TView.Create(Self);
    View[j].Parent:=pnlCol[j];
    View[i].Viewer:=Self;
    View[j].Tag:=j;
    View[j].Align:=alClient;
    View[j].Show;

    if isLoaded then
    View[j].LoadMapFromViewer(mtRaw);
    Inc(j);
    end;

for i := j to Length(View)-1 do
  if Assigned(View[i]) then
  FreeAndNil(View[i]);

end;

procedure TViewer.Clear;
begin
//ClearView;
if M<>nil then
  FreeAndNil(M);

if MD<>nil then
  FreeAndNil(MD);

if MR<>nil then
  FreeAndNil(MR);

fIsReadyForAcquiring:=False;

ClearHeader;
end;

procedure TViewer.ClearHeader;
var i, cnt:Integer;
begin

//cnt:=Length(Hdimensions);

if HdimCount>0 then
  begin
  for i := 0 to HdimCount-1 do
   begin
   if Hdimensions[i].axisVal<>nil then Hdimensions[i].axisVal.Free;
   SetLength(HDimensions[i].axisValNames,0);
   end;
  SetLength(Hdimensions,0);
  end;
  HdimCount:=0;
end;

procedure TViewer.DecomposeData(smoothed:boolean=false; bAirFiltration:boolean=false);
var
    valSpectra, valSpectraFair, decComp, residuals, tmp:TNumArray1<Single>;
    len, i,j,n, compNumber:integer;
    allHasSameLength:boolean;
    FD: TFileStream;

    A:TMatrix;
    b:TVector;
    At:TMatrix;
    AtA:TMatrix;
    Atb:TVector;
    x:TVector;
    numDim:integer;
    summ:double;

    bIsAir:Boolean;

    wheel:TNumArray1<Single>;
    wheelRadius, firstPix, lastPix:Integer;

    fMin, fMax, fThreshold:Single;

    airCounter:Integer;

begin
len:=   Hdimensions[0].steps;
compNumber:= length(DecompCompSet);

allHasSameLength:=true;
for i := 0 to length(DecompCompSet)-1 do
  if DecompCompSet[i].data.Length<>len then
      allHasSameLength:=false;


   if not allHasSameLength then
   begin
     ShowMessage('Error. Different length');
     Exit;
   end;

  
//  if Not SaveDialog.Execute then Exit;

//  FD:=TFileStream.Create(SaveDialog.FileName+'.scn2', fmCreate or fmShareDenyWrite );

   valSpectra:=TNumArray1<Single>.Create(Hdimensions[0].steps);
   valSpectraFair:=TNumArray1<Single>.Create(Hdimensions[0].steps);
   residuals:=TNumArray1<Single>.Create(Hdimensions[0].steps);
   tmp:=TNumArray1<Single>.Create(Hdimensions[0].steps);
   // Satrt decomposition


      // Rewrite header

   numDim:=length(Hdimensions);
   SetLength(Ddimensions, numDim);


   for i := 1 to numDim-1 do
     begin
      Ddimensions[i]:=Hdimensions[i];
     end;


    Ddimensions[0].steps:=compNumber;
    Ddimensions[0].zigZag:=false;
    Ddimensions[0].name:='Components';
    Ddimensions[0].units:='';
    Ddimensions[0].axisVal:=TNumArray1<Single>.Create(compNumber);
    SetLength(Ddimensions[0].axisValNames, compNumber);

    Ddimensions[0].AxisValsHasNames:=true;
    for i := 0 to compNumber-1 do
      begin
      Ddimensions[0].axisVal[i]:=i;
      Ddimensions[0].axisValNames[i]:= copy(DecompCompSet[i].name,1,25);
      end;





//   WriteHeader(FD, Ddimensions);

   if MD<>nil then FreeAndNil(MD);
   MD:=TMemoryStream.Create;

   if MR<>nil then
      FreeAndNil(MR);

   MR:=TMemoryStream.Create;


      //
   A:=TMatrix.Create(len,compNumber);
   b:=TVector.Create(len);
   x:=TVector.Create(compNumber);
   decComp:=TNumArray1<Single>.Create(compNumber);

   for j := 0 to compNumber-1 do
     for i := 0 to len-1 do
       A[i,j]:= DecompCompSet[j].data[i];

   At:=A.TransMatrix;
   AtA:=At.MultByMatrix(A);

   M.Seek(0, soBeginning);
//   FD.Seek(0, soEnd);


 //  AIR CORRECTION

  // bAirFiltration:=True;

   wheelRadius:=200;// FormWheelCorrection.fRadius;
   firstPix:=510; // FormWheelCorrection.fFirstPixel;
   lastPix:= 1999; // FormWheelCorrection.fLastPixel;
   fThreshold:=30.0;

   airCounter:=0;


  wheel:=TNumArray1<Single>.Create(2*wheelRadius+1);

  for j := -wheelRadius to wheelRadius do
     wheel[j+wheelRadius]:=  Sqrt( Sqr(wheelRadius) - Sqr(j));

 // AIR CORRECTION


   MD.Seek(0, soBeginning);
   MR.Seek(0, soBeginning);

   try
     try
     j:=0;
     while M.Position<M.Size do
     begin
       M.ReadBuffer(valSpectra.Buffer^, valSpectra.Length*SizeOf(Single));


       if bAirFiltration then
       begin
        sgolayfilt(valSpectra, tmp, 25);
        NumCopy(tmp, valSpectraFair);
        sgolayfilt(valSpectraFair, tmp, 25);

//        NumCopy(tmp, valSpectraFair);
//        baseLineWheel(valSpectraFair, tmp, wheel, firstPix, lastPix );

        NumMinMax(tmp, fMin, fMax);

        bIsAir := ((fMax-fMin) < fThreshold);

//        if bIsAir then
//          Inc(airCounter);

        end;



       if smoothed then
       begin
        sgolayfilt(valSpectra, tmp, 9);
        NumCopy(tmp, valSpectra);
       end;


       if ( not bIsAir) or (not bAirFiltration) then
        begin
           for i := 0 to len-1 do
           b[i]:=Double(valSpectra[i]);

           Atb:=At.MultByVector(b);

           NNLS(AtA, Atb, x);

           Atb.Free;

           summ:=0.0;
           for i := 0 to compNumber-1 do
           summ:= summ+x[i];

           for i := 0 to compNumber-1 do
           decComp[i]:= Single(x[i]/summ);
       end
         else
       begin

           for i := 0 to compNumber-1 do
           decComp[i]:= 0.0;

           Inc(airCounter);

       end;


 //      FD.WriteBuffer(decComp.Buffer^, decComp.Length*SizeOf(Single));
       MD.WriteBuffer(decComp.Buffer^, decComp.Length*SizeOf(Single));

       NumCopy(valSpectra, residuals);

         for i := 0 to valSpectra.Length-1 do
          begin
            for n := 0 to compNumber-1 do
            residuals[i]:=residuals[i]- A[i,n]*x[n];
           end;

       MR.WriteBuffer(residuals.Buffer^, residuals.Length*SizeOf(Single));

       inc(j);  
     end;
     except
       ShowMessage('Error '+j.ToString);
     end;

   finally
//   FD.free;
   end;

   ShowMessage('Done '+j.ToString);

   ShowMessage('Air points '+airCounter.ToString);
   

   valSpectra.Free;
   valSpectraFair.Free;
   residuals.Free;
   tmp.Free;
   wheel.Free;

   A.Free;
   b.Free;
   x.Free;
   decComp.Free;
   

   At.Free;
   AtA.Free;
  

end;

procedure TViewer.FormCreate(Sender: TObject);
begin
critSectMaccess:=TCriticalSection.Create;
canChangeLayout:=False;
firstRun:=True;
isLoaded:=False;

AddCompareView;
end;

procedure TViewer.FormDestroy(Sender: TObject);
var i:Integer;
begin
for i := 0 to Length(View)-1 do
  if Assigned(View[i]) then
     FreeAndNil(View[i]);

if Assigned(ViewCompare) then
FreeAndNil(ViewCompare);

FreeAndNil(btmHeader);

Clear;
critSectMaccess.Free;
end;

procedure TViewer.LoadCompareView;
begin

end;

procedure TViewer.LoadViewers;
var i:Integer;
begin
  for i := 0 to Length(View)-1 do
  if Assigned(View[i]) then
   View[i].LoadMapFromViewer(mtRaw);
end;

procedure TViewer.Log(str: string);
begin
  TTask.Run( procedure
      begin
       TThread.Synchronize( nil, procedure
          begin
          if FormLog<>nil then
          if FormLog.MemoLog<>nil then
          FormLog.MemoLog.Lines.Add('Viewer  '+str);
          end);
      end);
end;

procedure TViewer.OnSplitterHMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
splitterDownPoint.X:=X;
splitterDownPoint.Y:=Y;
end;

procedure TViewer.OnSplitterHMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
    H, i:Integer;
    positionScrollV:Single;
begin

//if Y-splitterDownPoint.Y=0 then Exit;

//positionScrollV:=sScrollBox1.VertScrollBar.Position/sScrollBox1.VertScrollBar.Range;

if pnlRow[(Sender as TsSplitter).Tag]<>nil then
  if pnlRow[(Sender as TsSplitter).Tag].Height >0 then
    begin
     H:=pnlRow[(Sender as TsSplitter).Tag].Height;
     pnlViewPole.Height:= H*ViewRowCnt +7*(ViewRowCnt-1);
     for i := 0 to ViewRowCnt-1 do
       if pnlRow[i]<>nil then
         pnlRow[i].Height:=H;
     pnlViewPole.Align:=alNone;
     pnlViewPole.Height:= H*ViewRowCnt +7*(ViewRowCnt-1);
    end;

sScrollBox1.Invalidate;
//sScrollBox1.VertScrollBar.Position:=Round(sScrollBox1.VertScrollBar.Range*positionScrollV);

end;

procedure TViewer.OnSplitterVMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin

end;

procedure TViewer.OnSplitterVMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
    W, i:Integer;
    positionScrollV:Single;
begin

//if Y-splitterDownPoint.Y=0 then Exit;

//positionScrollV:=sScrollBox1.VertScrollBar.Position/sScrollBox1.VertScrollBar.Range;

if pnlCol[(Sender as TsSplitter).Tag]<>nil then
  if pnlCol[(Sender as TsSplitter).Tag].Width >0 then
    begin
     W:=pnlCol[(Sender as TsSplitter).Tag].Width;

     pnlViewPole.Width:= W*ViewColCnt +7*(ViewColCnt-1);
     for i := 0 to Length(pnlCol)-1 do
       if pnlCol[i]<>nil then
         pnlCol[i].Width:=W;

     pnlViewPole.Align:=alNone;
     pnlViewPole.Width:= W*ViewColCnt +7*(ViewColCnt-1);

    end;

sScrollBox1.Invalidate;
end;

procedure TViewer.PrepareStreams;
begin
  if M<>nil then
  FreeAndNil(M);

  M:=TMemoryStream.Create;
  MCounter:=0;

  if M<>nil then
      fIsReadyForAcquiring:=true
   else
      fIsReadyForAcquiring:=False;

end;

function TViewer.ReadHeader(filename: string): Boolean;
var FIni:TMemIniFile;
    Fs: TFileStream;
    ms:TMemoryStream;
    sl,slclear: TStringList;
    tmpS, section:string;
    Fmt: TFormatSettings;
    i, tt:Integer;
    str:AnsiString;

    preHeader: array of Int64;

var  imgOffset, zipSize, imgSize:Integer;
     wh,hh:Integer;
     isVisImage:Boolean;


label v000, v010;


procedure ReadHeaderImage;
var
     ZipStream, imgStream : TMemoryStream;
     decompr : TDecompressionStream;

begin
   btmHeader:=TBitmap32.Create;
   btmHeader.SetSize(320,240);
   btmHeader.FillRect(0,0,btmHeader.Width, btmHeader.Height, clBlack32 );

    if btmHeader<>nil then
    ViewCompare.ImgView321.Bitmap.Assign(btmHeader);

  ViewCompare.ImgView321.Invalidate;

 Exit;
  if isVisImage then
     if (wh>0)and(hh>0)and(imgOffset>1)and(imgSize>1)and(zipSize>1)  then
         begin
          btmHeader.SetSize(wh,hh);
//
            Fs := TFileStream.Create(filename, fmOpenRead or fmShareDenyWrite );
            imgStream:=TMemoryStream.Create;
//            ZipStream:=TMemoryStream.Create;

            try
            Fs.Position:=imgOffset;
//            ZipStream.CopyFrom(Fs, zipSize);

//            ZipStream.Position:=0;
//            decompr := TDecompressionStream.Create(ZipStream);

//            imgStream.CopyFrom(decompr, imgSize);
            imgStream.CopyFrom(Fs, imgSize);
            imgStream.Position:=0;
//
            btmHeader.LoadFromStream(imgStream);
            finally
            Fs.Free;
            imgStream.Free;
//            ZipStream.Free;
//            decompr.Free;
            end;

         end
        else
         begin
         btmHeader.SetSize(1600,1200);
         btmHeader.FillRect(0,0,btmHeader.Width, btmHeader.Height, clBlack32 );
         end;


end;

procedure ReadDim(var dimension: TDimension; dimIdx: integer);
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
  //Clear sgInfo
    sgInfo.Clear;
    sgInfo.ColWidths[0]:=50;
    sgInfo.ColWidths[1]:=60;
    sgInfo.ColWidths[2]:=30;
    sgInfo.ColWidths[3]:=30;
    sgInfo.RowCount:=3;
    sgInfo.Cells[0,0] := 'DimCnt';
    sgInfo.Cells[0,1] := 'Points';
    sgInfo.Cells[0,2] := 'Loaded';
//    Log( FormatDateTime('dd/mm/yyyy hh:nn:ss',HmeasurementInfo.DateTime) );

 if not FileExists(filename) then Exit(False);

  Fs := TFileStream.Create(filename, fmOpenRead or fmShareDenyNone );

  SetLength(preHeader, 3);
  Fs.Position:=0;
  Fs.ReadBuffer(preHeader[0], 3*SizeOf(Int64));

  if preHeader[0]=7767 then //Magic number
    begin
    i:= preHeader[1];
    SetLength(preHeader, i );
    Fs.Position:=0;
    Fs.ReadBuffer(preHeader[0], i*SizeOf(Int64));
    end
  else

      begin //read old file format
        ms:=TMemoryStream.Create;

        ms.Position:=0;
        fs.Position:=0;
        ms.CopyFrom(Fs, 50);

        SetString(str, PAnsiChar(ms.Memory), ms.Size);

        FIni := TMemIniFile.Create('');
        sl := TStringList.Create;
        sl.Text:=str;

        FIni.SetStrings(sl);

        tmpS:=FIni.ReadString('Main', 'HeaderSize', '0');
        HSize:=StrToIntDef(Trim(tmpS),0);
        Log('Hsize = '+Hsize.ToString);

        ms.Position:=0;
        fs.Position:=0;
        ms.CopyFrom(Fs, HSize);
        SetString(str, PAnsiChar(ms.Memory), ms.Size);

        sl.Clear;
        sl.Text:=str;
        FIni.SetStrings(sl);

        sl.Free;
        ms.Free;
        SetLength(str,0);
       end;



 if preHeader[0]=7767 then
   if preHeader[2]=010 then
    begin
     ms:=TMemoryStream.Create;
     ms.Position:=0;
     fs.Position:=preHeader[3];
     ms.CopyFrom(Fs, preHeader[4]);
  //   SetString(str, PAnsiChar(ms.Memory), ms.Size);

     sl := TStringList.Create;
     sl.Clear;

     ms.Position:=0;
     sl.LoadFromStream(ms);

     FIni := TMemIniFile.Create('');
     FIni.SetStrings(sl);

     sl.Free;
     ms.Free;
     SetLength(str,0);
    end;

  Result:=False;


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

  lblFileName.Caption:= ExtractFileName(filename);
  lblDescription.Caption:= HmeasurementInfo.Description;

  if HdimCount>0 then
   begin
      Result:=True;

    try
      SetLength(Hdimensions, HdimCount);
      for i := 0 to HdimCount-1 do
       ReadDim(Hdimensions[i], i);
    except
      Result:=False;
    end;

   end;


  if preHeader[0]=7767 then
   if preHeader[2]=010 then
    begin
    HSize:= preHeader[9];

    //Read HeaderImage Info;
   // ReadHeaderImage;
    end;

 Fs.free;

//if Result then
 begin
  Log('//////////////////////');
  Log('//// SCAN START //////');


  tt:=1;
  for i := 0 to HdimCount-1 do
    begin
    sgInfo.RowCount:=sgInfo.RowCount + 1;
    sgInfo.Cells[0,sgInfo.RowCount-1] := 'Dim'+i.ToString;
    sgInfo.Cells[1,sgInfo.RowCount-1] := Hdimensions[i].name;
    sgInfo.Cells[2,sgInfo.RowCount-1] := Hdimensions[i].steps.ToString;
    sgInfo.Cells[3,sgInfo.RowCount-1] := Hdimensions[i].units;
    tt:=tt*Hdimensions[i].steps;

    end;


   sgInfo.Cells[1,0] := HdimCount.ToString;
   sgInfo.Cells[1,1] := tt.ToString;
//   sgInfo.Cells[1,2] := 'Loaded';


 end;

end;


procedure TViewer.WriteFrame(fPtr: Pointer; fSize: Cardinal);
begin
 try
   try
     critSectMaccess.Enter;
     M.Seek(0,soEnd);
     M.WriteBuffer(FormMain.FrameData.CalcData.Buffer^, FormMain.FrameData.CalcData.UsedSize);

     inc(MCounter, FormMain.FrameData.CalcData.UsedSize div 4{ SizeOf(Single)});
     PostMessage(Self.Handle, WM_SCANNER_FRAME,0,0);
     isLoaded:=True;
   except
     fIsReadyForAcquiring:=False;
     Log('Error write to memory buffer. Stopped.');
   end;
 finally
  critSectMaccess.Leave;
 end;

end;

function TViewer.WriteHeader(F: TFileStream; Hdimensions: array of TDimension): Boolean;

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

  FIni.WriteInteger(section, 'ScanType', Hscantype);
  FIni.WriteString(section, 'HeaderSize', Format('%.9d',[ HeaderSize]) );
  FIni.WriteInteger(section, 'DimCount', Length(Hdimensions));

  FIni.WriteFloat(section, 'LaserNm', HMeasurementInfo.LaserNm);
  FIni.WriteFloat(section, 'LaserPower', HMeasurementInfo.LaserPower);
  FIni.WriteFloat(section, 'Exposure', HMeasurementInfo.Exposure);
  FIni.WriteDateTime(section, 'DateTime', HMeasurementInfo.DateTime);
  FIni.WriteString(section, 'Description', HMeasurementInfo.Description);

// Dimensions
  if Length(Hdimensions)>0 then
  for i := 0 to Length(Hdimensions)-1 do
    WriteDim( Hdimensions[i], i);


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
//   btmHeader:= formMain.ToupcamG.GetImageToHeader;
  //
 if btmHeader<>nil then
   begin
      preHeader[7]:=btmHeader.Width;
      preHeader[8]:=btmHeader.Height;


//      ImgStream:=TMemoryStream.Create;
//      ZipStream:=TMemoryStream.Create;
//      try
//       btmHeader.SaveToStream(ImgStream);
//
//       LZip := TZCompressionStream.Create(clDefault, ZipStream);
//        try
//         { Compress data. }
//         LZip.CopyFrom(ImgStream, 0);
//
//         F.Seek(0, soFromEnd);
//         F.CopyFrom(ZipStream, 0);
//
//         finally
//         LZip.Free;
//         end;
//
//      finally
//       ImgStream.Free;
//       btmHeader.Free;
//       ZipStream.Free;
//      end;
   end;

   preHeader[6]:=F.Size-preHeader[5];   // Bitmap ZIP size = FileSize-Bitmap offset
   preHeader[9]:=F.Size;

  UpdatePreHeader;

  if not Result then
    begin
    ShowMessage('Save file access error');
    end;


end;


procedure TViewer.WriteMfromFile(filename: string);
var FSize:Int64;
    readStep:Integer;
begin
 F := TFileStream.Create(filename, fmOpenRead or fmShareDenyNone  );
        try
        trbOpenprogress.Position:=0;
        btnOpen.Enabled:=False;
        F.Seek(HSize,soBeginning);

//        if Length(Hdimensions)>2 then
//            readStep:= Hdimensions[2].steps*Hdimensions[1].steps*Hdimensions[0].steps*4
//          else
//        if Length(Hdimensions)>1 then
//            readStep:= Hdimensions[1].steps*Hdimensions[0].steps*4
//          else
            readStep:= Hdimensions[0].steps*1;


        M.Seek(0,soBeginning);
        while F.Position < F.Size do
         begin
          M.CopyFrom(F, readStep );

          trbOpenProgress.Position:=Trunc(F.Position *100/F.Size);
         end;

        finally
        FreeAndNil(F);

        isLoaded:=True;
        trbOpenprogress.Position:=100;
        btnOpen.Enabled:=True;
        end;
end;

end.
