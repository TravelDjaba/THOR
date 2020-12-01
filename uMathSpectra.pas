unit uMathSpectra;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, sPageControl, sListView,
  acShellCtrls, sTreeView, Vcl.StdCtrls, Vcl.Mask, sMaskEdit, sCustomComboEdit,
  sToolEdit, Vcl.ExtCtrls, uCoefScaler, uBottomGraph, NumArray, sEdit, sSpinEdit, System.Math;

type
  TFormMathSpectra = class(TForm)
    sPageControl1: TsPageControl;
    sTabSheet1: TsTabSheet;
    sFilenameEdit1: TsFilenameEdit;
    sFilenameEdit2: TsFilenameEdit;
    pnlScaler: TPanel;
    pnlSource: TPanel;
    pnlRes: TPanel;
    Button1: TButton;
    edtWLshift: TsSpinEdit;
    pnlScaler2: TPanel;
    sFilenameEdit3: TsFilenameEdit;
    edtWLshift2: TsSpinEdit;
    procedure FormCreate(Sender: TObject);
    procedure sFilenameEdit1Change(Sender: TObject);
    procedure sFilenameEdit2Change(Sender: TObject);
    procedure sFilenameEdit3Change(Sender: TObject);

  private
    { Private declarations }
    CoefScaler, CoefScaler2: TCoefScaler;

    procedure OnChangeScaler(Sender:TObject);
    function ParseCSVfile(filename:String):TNumArray2<Single> ;
    procedure CalculateDiff2;

  public
    { Public declarations }
    HGraph, RGraph: THGraph;
    arr1,arr2, arr3,arrRes:TNumArray2<Single>;
    cnstA, cnstB:Single;

  end;

var
  FormMathSpectra: TFormMathSpectra;

implementation

{$R *.dfm}

procedure TFormMathSpectra.CalculateDiff2;
var
    i, idx:Integer;
begin

begin
if (arr1<>nil) and (arr1.Dimensions[1]>0)
  and (arr2<>nil) and (arr2.Dimensions[1]>0)
  and (arr3<>nil) and (arr3.Dimensions[1]>0)
  and (arr1.Dimensions[1]=arr2.Dimensions[1])
  then
    begin

       idx:=0;

       if arrRes<>nil then
         begin
         if arrRes.Dimensions[1]<> arr1.Dimensions[1] then
            begin
            arrRes.Free;
            arrRes:= TNumArray2<Single>.Create(2, arr1.Dimensions[1]);
           end
         end
       else
           arrRes:= TNumArray2<Single>.Create(2, arr1.Dimensions[1]);

     if Length(RGraph.Curve)>0 then
        begin
        if RGraph.Curve[0].data.X.Length<>arr1.Dimensions[1]  then
          RGraph.DeleteAll;
          idx:= RGraph.CreateCurve('arrRes', clRed, arr1.Dimensions[1]);
        end
      else
        idx:= RGraph.CreateCurve('arrRes', clRed, arr1.Dimensions[1]);


    with RGraph.Curve[idx] do
      begin
      for i := 0 to arr1.Dimensions[1]-1 do
        begin
        data.x.Values[i]:=i; // arr1.Values[0,i];
        data.Y.Values[i]:=arr1.Values[1,i]-CoefScaler.Position * arr2.Values[1,i] -CoefScaler2.Position * arr3.Values[1,i];
        end;
      end;

 //   RGraph.AutoScaleAllLocal;
    RGraph.RepaintGraph;

    end;
  end;

end;

procedure TFormMathSpectra.FormCreate(Sender: TObject);
begin
CoefScaler := TCoefScaler.Create(Self);
CoefScaler.Parent:=Self.pnlScaler;
CoefScaler.Align := alClient;
CoefScaler.Show;

CoefScaler.OnChangePosition:=OnChangeScaler;

CoefScaler2 := TCoefScaler.Create(Self);
CoefScaler2.Parent:=Self.pnlScaler2;
CoefScaler2.Align := alClient;
CoefScaler2.Show;

CoefScaler2.OnChangePosition:=OnChangeScaler;


HGraph := THGraph.Create(Self);
  HGraph.Parent := pnlSource;
  HGraph.Align := alClient;
  HGraph.MinX := 0;
  HGraph.MaxX := 2000;
  HGraph.MinY:=0;
  HGraph.MaxY:=1000;
  HGraph.Show;

RGraph := THGraph.Create(Self);
  RGraph.Parent := pnlRes;
  RGraph.Align := alClient;
  RGraph.MinX := 0;
  RGraph.MaxX := 2000;
  RGraph.MinY:=0;
  RGraph.MaxY:=1000;
  RGraph.Show;

  cnstA:=0.0;
  cnstB:=1.0;

  arr1:=TNumArray2<Single>.Create(2,2000);
  arr2:=TNumArray2<Single>.Create(2,2000);
  arr3:=TNumArray2<Single>.Create(2,2000);

end;

procedure TFormMathSpectra.OnChangeScaler(Sender: TObject);
begin

if sFilenameEdit2.FileName<>'' then
sFilenameEdit2.OnChange(nil);

if sFilenameEdit3.FileName<>'' then
sFilenameEdit3.OnChange(nil);

 CalculateDiff2;


end;

function TFormMathSpectra.ParseCSVfile(filename: String): TNumArray2<Single>;
var i,size:Integer;
    F:TextFile;
    S:string;
    sl:TStringList;

begin
if filename='' then Exit;

//edtGraphName.Text:= ExtractFileName( filename );
  sl:=TStringList.Create;
  AssignFile(F, filename);
  try
  Reset(F);

  Readln(F, S);
  sl.CommaText:=S;
  size:=sl.Count;

  Result:=TNumArray2<Single>.Create(2,size);


    begin
    for i := 0 to size-1 do
      Result.Values[0, i]:=sl[i].ToSingle;

    Readln(F, S);
    sl.CommaText:=S;

    for i := 0 to size-1 do
      Result.Values[1,i]:=sl[i].ToSingle;

    end;

  finally
  sl.Free;
  CloseFile(F);
  end;


end;

procedure TFormMathSpectra.sFilenameEdit1Change(Sender: TObject);

var
    i, idx:Integer;

begin

  if sFilenameEdit1.FileName<>'' then
   begin
   if arr1<>nil then
    arr1.Free;
    arr1:= ParseCSVfile(sFilenameEdit1.FileName);
   end;

   HGraph.DeleteCurve('arr1');

    idx:= HGraph.CreateCurve('arr1', clRed, arr1.Dimensions[1]);

  with HGraph.Curve[idx] do
    begin
    for i := 0 to arr1.Dimensions[1]-1 do
      begin
      data.x.Values[i]:=i; // arr1.Values[0,i];
      data.Y.Values[i]:=arr1.Values[1,i];
      end;
    end;

 // HGraph.AutoScaleAllLocal;
  HGraph.RepaintGraph;

   CalculateDiff2;

end;

procedure TFormMathSpectra.sFilenameEdit2Change(Sender: TObject);
var
    i, idx, j:Integer;
    tmpArr:TNumArray2<Single>;

begin

  if sFilenameEdit2.FileName<>'' then
     begin
     if arr2<>nil then
      arr2.Free;

      tmpArr:= ParseCSVfile(sFilenameEdit2.FileName);
      arr2:= TNumArray2<Single>.Create(2,tmpArr.Width);
     end;

   HGraph.DeleteCurve('arr2');

    idx:= HGraph.CreateCurve('arr2', clBlue, arr2.Dimensions[1]);

  with HGraph.Curve[idx] do
    begin
    for i := 0 to arr2.Dimensions[1]-1 do
      begin
      j:=Min(arr2.Dimensions[1]-1,  Max(0, i+edtWLshift.Value));
      data.x.Values[i]:=i; // arr2.Values[0,i];
      data.Y.Values[i]:=tmpArr.Values[1,j]*CoefScaler.Position;
      arr2.Values[1,i]:=tmpArr.Values[1,j];
      end;
    end;

//  HGraph.AutoScaleAllLocal;
  HGraph.RepaintGraph;

  CalculateDiff2;
  tmpArr.Free;

end;

procedure TFormMathSpectra.sFilenameEdit3Change(Sender: TObject);
var
    i, idx, j:Integer;
    tmpArr:TNumArray2<Single>;

begin

  if sFilenameEdit3.FileName<>'' then
     begin
     if arr3<>nil then
      arr3.Free;

      tmpArr:= ParseCSVfile(sFilenameEdit3.FileName);
      arr3:= TNumArray2<Single>.Create(2,tmpArr.Width);
     end;

   HGraph.DeleteCurve('arr3');

    idx:= HGraph.CreateCurve('arr3', clGreen, arr3.Dimensions[1]);

  with HGraph.Curve[idx] do
    begin
    for i := 0 to arr3.Dimensions[1]-1 do
      begin
      j:=Min(arr3.Dimensions[1]-1,  Max(0, i+edtWLshift2.Value));
      data.x.Values[i]:=i; // arr2.Values[0,i];
      data.Y.Values[i]:=tmpArr.Values[1,j]*CoefScaler2.Position;
      arr3.Values[1,i]:=tmpArr.Values[1,j];
      end;
    end;

  HGraph.AutoScaleAllLocal;
  HGraph.RepaintGraph;

  CalculateDiff2;
  tmpArr.Free;
end;

end.
