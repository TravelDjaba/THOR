unit uDecompose;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, sPanel, sSplitter,
  Vcl.StdCtrls, Vcl.ComCtrls, sComboBoxes, acShellCtrls,
  NumArray, NumIPP, uBottomGraph,
   sTreeView, sListView,  sSkinProvider, sStatusBar, AdvUtil, sButton,
  Vcl.Grids, AdvObj, BaseGrid, AdvGrid, Vcl.ToolWin, sToolBar, sEdit, uViewer,
  baseViewer, TMMatrix, MathOps2, sCheckBox;

  type TAnalyse = record
    name:string;
    use:Boolean;
  end;

  TAnalyseList = array of TAnalyse;

type
  TformDecompose = class(TForm)
    pnlHGraph: TsPanel;
    sSplitter1: TsSplitter;
    pnlBrowse: TsPanel;
    sSkinProvider1: TsSkinProvider;
    sShellTreeView1: TsShellTreeView;
    sStatusBar1: TsStatusBar;
    sSplitter2: TsSplitter;
    sPanel1: TsPanel;
    sShellListView1: TsShellListView;
    sgAnalysw: TAdvStringGrid;
    btnAddToAnalyse: TsButton;
    btnRemoveFromAnalyse: TsButton;
    sToolBar1: TsToolBar;
    edtGraphName: TsEdit;
    btnDecompose: TsButton;
    btnSmooth: TsButton;
    btnSmoothCoarse: TsButton;
    cbSmoothedDecomp: TsCheckBox;
    btnWheel: TsButton;
    cbRemoveAir: TsCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnAddToAnalyseClick(Sender: TObject);
    procedure sgAnalyswGetEditorType(Sender: TObject; ACol, ARow: Integer;
      var AEditor: TEditorType);
    procedure sgAnalyswCheckBoxChange(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure btnRemoveFromAnalyseClick(Sender: TObject);
    procedure sShellListView1Click(Sender: TObject);
    procedure sShellListView1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sgAnalyswKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sgAnalyswMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnDecomposeClick(Sender: TObject);
    procedure btnSmoothClick(Sender: TObject);
    procedure btnSmoothCoarseClick(Sender: TObject);
    procedure btnWheelClick(Sender: TObject);
  private
    { Private declarations }
    procedure UpdateAnalyseListGrid;

    function getOnSelectShellListItemName:string;
    function getOnSelectAnalyseListItemName:string;
    procedure  ParseCSVfile(filename:String);
    function  ParseCSVfileToV(filename:String):TVector;
  public
    { Public declarations }

    HGraph: THGraph;
    AnalyseList: TAnalyseList;
  end;

var
  formDecompose: TformDecompose;

implementation

uses
  uWheelCorrection;

{$R *.dfm}

procedure TformDecompose.btnAddToAnalyseClick(Sender: TObject);
var i,j:Integer;
    alreadyInList:Boolean;
begin

for I := 0 to sShellListView1.Items.Count-1 do
  if sShellListView1.Items.Item[I].Selected then
  if  ExtractFileExt(sShellListView1.Folders[i].PathName) = '.csv' then
   begin
    alreadyInList:=False;

    if Length(AnalyseList)>0  then
     for j := 0 to Length(AnalyseList)-1 do
      if sShellListView1.Folders[i].PathName = AnalyseList[j].name then
        alreadyInList:=true;

     if not alreadyInList then
       begin
        SetLength(AnalyseList, Length(AnalyseList)+1);
        AnalyseList[Length(AnalyseList)-1].name := sShellListView1.Folders[i].PathName;
        AnalyseList[Length(AnalyseList)-1].use := True;
        UpdateAnalyseListGrid;
       end;

   end;


end;

procedure TformDecompose.btnDecomposeClick(Sender: TObject);
var compNumber, i:integer;
begin
if (FormViewer<>nil) and (FormViewer.Viewer<>nil) then
with FormViewer do
  begin
//  clear previous
  if Length(Viewer.DecompCompSet)>0 then
  begin
  for i := 0 to Length(Viewer.DecompCompSet) do
   if Viewer.DecompCompSet[i].data<>nil then
      Viewer.DecompCompSet[i].data.Free;

   SetLength(Viewer.DecompCompSet, 0);
  end;


  // fill with new
  compNumber:=0;
  for i := 1 to sgAnalysw.RowCount-1 do
   if sgAnalysw.Cells[2,i]<>'' then
     begin
     if sgAnalysw.IsChecked(1,i) then
       inc(compNumber)
     end
      else break;

  SetLength(Viewer.DecompCompSet, compNumber );
    for i := 1 to sgAnalysw.RowCount-1 do
   if sgAnalysw.Cells[2,i]<>'' then
     if sgAnalysw.IsChecked(1,i) then
     begin
       Viewer.DecompCompSet[i-1].name:=ExtractFileName( sgAnalysw.Cells[2,i]);
       Viewer.DecompCompSet[i-1].data:=ParseCSVfileToV(sgAnalysw.Cells[2,i]);
     end;



  Viewer.DecomposeData(cbSmoothedDecomp.Checked, cbRemoveAir.Checked);

  end;
end;

procedure TformDecompose.btnRemoveFromAnalyseClick(Sender: TObject);
var i, len:Integer;
    tempList, newList:TAnalyseList;

begin
for i := 1 to sgAnalysw.RowCount-1 do
  if sgAnalysw.IsSelected(2,i) then

    if i<=Length(AnalyseList) then
     AnalyseList[i-1].name:='';


tempList:=AnalyseList;
SetLength(newList,0);
len:=0;
for i := 0 to High(AnalyseList) do
   if AnalyseList[i].name<>'' then
    begin

    SetLength(newList,len+1);
    newList[len].name:=AnalyseList[i].name;
    newList[len].use:=AnalyseList[i].use;
    Inc(len);
    end;
AnalyseList:=newList;
SetLength(tempList,0);

UpdateAnalyseListGrid;


end;

procedure TformDecompose.btnSmoothClick(Sender: TObject);
var arrT:TNumArray1<Single>;
begin

with   HGraph.Curve[0] do
begin
arrT:=TNumArray1<Single>.Create(data.y.length);

sgolayfilt(data.y, arrT, 9);

NumCopy(arrT, data.y);

HGraph.RepaintGraph;

end;
arrT.Free;

end;

procedure TformDecompose.btnSmoothCoarseClick(Sender: TObject);
var arrT:TNumArray1<Single>;
begin

with   HGraph.Curve[0] do
begin
arrT:=TNumArray1<Single>.Create(data.y.length);

sgolayfilt(data.y, arrT, 25);

NumCopy(arrT, data.y);

HGraph.RepaintGraph;

end;
arrT.Free;
end;

procedure TformDecompose.btnWheelClick(Sender: TObject);
var
  wheelRadius, firstPix, lastPix, j:Integer;
  tmp, wheel:TNumArray1<Single>;
begin

  FormWheelCorrection.ShowModal;

  if FormWheelCorrection.ModalResult <> mrOk then
      Exit;

  wheelRadius:=FormWheelCorrection.fRadius;
  firstPix:=FormWheelCorrection.fFirstPixel;
  lastPix:= FormWheelCorrection.fLastPixel;

  wheel:=TNumArray1<Single>.Create(2*wheelRadius+1);

  for j := -wheelRadius to wheelRadius do
     wheel[j+wheelRadius]:=  Sqrt( Sqr(wheelRadius) - Sqr(j));


  with   HGraph.Curve[0] do
  begin
  tmp:=TNumArray1<Single>.Create(data.y.length);

  baseLineWheel(data.y, tmp, wheel, firstPix, lastPix );

  NumCopy(tmp, data.y);

  HGraph.RepaintGraph;

  end;
  tmp.Free;

end;

procedure TformDecompose.FormCreate(Sender: TObject);
begin
HGraph := THGraph.Create(Self);
  HGraph.Parent := pnlHGraph;
  HGraph.Align := alClient;
  HGraph.MinX := 0;
  HGraph.MaxX := 2000;
  HGraph.MinY:=0;
  HGraph.MaxY:=1000;
  HGraph.Show;
end;

procedure TformDecompose.FormDestroy(Sender: TObject);
begin
HGraph.Free;
end;

function TformDecompose.getOnSelectAnalyseListItemName: string;
var i:Integer;
begin
 Result:='';

 for I := 1 to sgAnalysw.RowCount-1 do
  if sgAnalysw.IsSelected(2,i) then
  if  ExtractFileExt(sgAnalysw.Cells[2,i]) = '.csv' then
   begin
      Result := sgAnalysw.Cells[2,i];
      Break;
   end;

end;

function TformDecompose.getOnSelectShellListItemName:string;
var i:Integer;
begin

 Result:='';

 for I := 0 to sShellListView1.Items.Count-1 do
  if sShellListView1.Items.Item[I].Selected then
  if  ExtractFileExt(sShellListView1.Folders[i].PathName) = '.csv' then
   begin
      Result:=  sShellListView1.Folders[i].PathName;
      Break;
   end;

end;

procedure TformDecompose.ParseCSVfile(filename: String);
var i,size:Integer;
    F:TextFile;
    S:string;
    sl:TStringList;

begin
if filename='' then Exit;

edtGraphName.Text:= ExtractFileName( filename );
  sl:=TStringList.Create;
  AssignFile(F, filename);
  try
  Reset(F);

  Readln(F, S);
  sl.CommaText:=S;
  size:=sl.Count;

  HGraph.DeleteAll;
  HGraph.CreateCurve(filename, clRed, size);

  with HGraph.Curve[0] do
    begin
    for i := 0 to size-1 do
      data.x.Values[i]:=sl[i].ToSingle;

    Readln(F, S);
    sl.CommaText:=S;

    for i := 0 to size-1 do
      data.Y.Values[i]:=sl[i].ToSingle;

    end;

  finally
  sl.Free;
  CloseFile(F);
  end;

  HGraph.AutoScaleAllLocal;

  HGraph.RepaintGraph;
end;

function TformDecompose.ParseCSVfileToV(filename: String): TVector;
var i,size:Integer;
    F:TextFile;
    S:string;
    sl:TStringList;
begin

if filename='' then Exit;

  sl:=TStringList.Create;
  AssignFile(F, filename);
  try
  Reset(F);

  Readln(F, S);
  sl.CommaText:=S;
  size:=sl.Count;

  Result:=TVector.Create(size);

    Readln(F, S);
    sl.CommaText:=S;

    for i := 0 to size-1 do
      Result[i]:=sl[i].ToDouble;

  finally
  sl.Free;
  CloseFile(F);
  end;
end;

procedure TformDecompose.sgAnalyswCheckBoxChange(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
begin
if Length(AnalyseList) <= ARow-1 then
   AnalyseList[ ARow-1].use := State;

end;

procedure TformDecompose.sgAnalyswGetEditorType(Sender: TObject; ACol,
  ARow: Integer; var AEditor: TEditorType);
begin
case ACol of
1: AEditor := edCheckBox;
2: AEditor := edNone;
end;

end;

procedure TformDecompose.sgAnalyswKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (Key=VK_DOWN) or (Key=VK_UP) then
    ParseCSVfile(getOnSelectAnalyseListItemName);
end;

procedure TformDecompose.sgAnalyswMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
ParseCSVfile(getOnSelectAnalyseListItemName);
end;

procedure TformDecompose.sShellListView1Click(Sender: TObject);
begin
   ParseCSVfile(getOnSelectShellListItemName);
end;

procedure TformDecompose.sShellListView1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

if (Key=VK_DOWN) or (Key=VK_UP) then
    ParseCSVfile(getOnSelectShellListItemName);

end;

procedure TformDecompose.UpdateAnalyseListGrid;
var i:Integer;
begin
sgAnalysw.BeginUpdate;
sgAnalysw.ClearAll;

sgAnalysw.ColumnHeaders[1]:='Use';
sgAnalysw.ColumnHeaders[2]:='Name';

for i := 0 to High(AnalyseList) do
  begin
    sgAnalysw.Cells[0,i+1]:=(i+1).ToString;
    sgAnalysw.AddCheckBox(1,i+1, AnalyseList[i].use, true );

    sgAnalysw.Cells[2,i+1]:= AnalyseList[i].name;
  end;

sgAnalysw.EndUpdate;
end;

end.
