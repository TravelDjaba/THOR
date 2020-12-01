unit uLeftGraph;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, GR32_Image, GR32, NumArray, Vcl.Menus,
  sDialogs;



type TDoublePoint = record
  X,Y:Single;
end;

   TASample = record
       x:TNumArray1<Single>;//array of double;
       y:TNumArray1<Single>;//array of double;
     end;


   TCurve = record
     name:string;
    // count:integer;
     data:TASample;
     color:TColor;
   end;

type
   TSelectPoint=procedure (Sender:TObject; const ACol, ARow:integer) of object;
   TOverPoint=procedure (Sender:TObject; const ACol, ARow:string) of object;


type
  TVGraph = class(TForm)
    PaintBox: TPaintBox32;
    SaveDialog: TsSaveDialog;
    PopupMenu1: TPopupMenu;
    pmSaveAsCsv: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure PaintBoxResize(Sender: TObject);
    procedure PaintBoxMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PaintBoxMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure PaintBoxMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure PaintBoxMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pmSaveAsCsvClick(Sender: TObject);
  private
    { Private declarations }
        AxisX, AxisY, AxisNone,AxisXres, AxisYres:Integer;

    ZoomX, ZoomY:Single;
    Xbtm, Ybtm:Integer;

    FlimMinY, FlimMaxY: double;

    ZoomScale:Single;

    MinXprev, MinYprev:Single;
    MaxXprev, MaxYprev:Single;

    GridXNum, GridYNum:Integer;

    PointDown:TPoint;
    isPointDown:boolean;
    canChange:Boolean;

    fUseLimits:boolean;
    FOnChangeBorders:TNotifyEvent;
    FOnOverColRow: TOverPoint;

    procedure Zoom(value:double; byX, byY:boolean);
    procedure CalcStep(horizont:boolean; min, max:double; var step:double);
    procedure Grid(horizont:boolean; min, max:double; step:double );
    procedure Axis(horizont:boolean; min, max:double; step:double );
    function ValueToPixelPaint(X, Y:Double):TPoint;
    function pixelToValue(btmX, btmY:integer):TDoublePoint;

    function VExp(value, minV,maxV:double):string;
    function NewCuveIDX:integer;
    procedure PaintCurve(const Curve:tcurve);
    procedure SetUseLimits(const Value: boolean);

  public
    { Public declarations }
    BGColor, TextColor, GridColor: TColor32;
    ShowLabelX,ShowLabelY, ShowGrid:Boolean;
    Xvalue, Yvalue:Single;
    MinX, MinY, MaxX, MaxY:Single;

    Curve:array of TCurve;
    Function CreateCurve(Name:string;LColor:Tcolor;Size:dword):Integer;
    Function DeleteCurve(Name:string):Integer;
    procedure DeleteAll;
    procedure CalcResize(sendToOther:boolean=true);
    procedure RepaintGraph;

    property UseLimits:boolean read FUseLimits write SetUseLimits;
    procedure SetLimits(const limMinY, limMaxY:double);
    procedure SaveGraphsAsCSV( fileName:string );

    property OnOverColRow: TOverPoint read  FOnOverColRow write FOnOverColRow;
    property OnChangeBorders:TNotifyEvent read FOnChangeBorders write FOnChangeBorders;

  end;


implementation

{$R *.dfm}
uses Math;

{ TVGraph }

procedure TVGraph.Axis(horizont: boolean; min, max, step: double);
var  start:Double;
     i, mul:Integer;
begin

 if horizont then begin
   if ShowLabelX then PaintBox.Buffer.FillRect(0,PaintBox.Height-1-AxisX, PaintBox.Width-1, PaintBox.Height, BGColor)
  end else begin
   if ShowLabelY then PaintBox.Buffer.FillRect(0,0,AxisY,PaintBox.Height-1-AxisX, BGColor);
  end;

  mul:=Trunc( min/step);
  start:= mul*step;

  i:=0;
  PaintBox.Buffer.Font.Color:=WinColor(TextColor);

  if horizont then
   begin
    if start<min then begin inc(mul); start:= mul*step; end;
    while (i<PaintBox.Width-AxisYres) do
     begin
     if (pixelToValue(i,0).X>start) then
        begin
      //  if ShowGrid then PaintBox.Buffer.VertLine(i+AxisYres, 0, PaintBox.Height-1-AxisXres, GridColor);
        if ShowLabelX then PaintBox.Buffer.Textout(i+AxisYres-5, PaintBox.Height-15, VExp(start, MinX, MaxX) );
        inc(mul); start:= mul*step;
        end;
      inc(i);
     end
   end
  else
   begin
    if start<min then begin inc(mul); start:= mul*step; end;
    while (i<PaintBox.Height-AxisXres) do
     begin
      if (pixelToValue(0,i).Y>=start) then
        begin
      //  if ShowGrid then PaintBox.Buffer.HorzLine(AxisYres, PaintBox.Height-i-AxisXres, PaintBox.Width-1, GridColor);
        if ShowLabelY then PaintBox.Buffer.Textout(1, {PaintBox.Height-i-AxisXres-8}i+AxisXres+0, VExp(start, MinY, MaxY) );
        inc(mul); start:= mul*step;
        end;
      inc(i);
     end;
   end;

    if horizont then
        PaintBox.Buffer.HorzLine( AxisYres, PaintBox.Height-1-AxisXres, PaintBox.Width-1, TextColor)
    else
        PaintBox.Buffer.VertLine( AxisYres, 0, PaintBox.Height-1-AxisXres, TextColor);
end;

procedure TVGraph.CalcResize(sendToOther: boolean);
begin
if (MaxX=MinX) or (MaxY=MinY) then exit;

ZoomX:=(PaintBox.Width-AxisYres-1 )/(MaxX-MinX);
ZoomY:=(PaintBox.Height-AxisXres-1)/(MaxY-MinY);

if UseLimits then
  begin
  if ZoomY<(PaintBox.Height-AxisXres-1)/(FlimMaxY-FlimMinY) then
    ZoomY:=(PaintBox.Height-AxisXres-1)/(FlimMaxY-FlimMinY);

  if minY<FlimMinY then begin
          minY:=FlimMinY;
          MaxY:=(PaintBox.Height-AxisXres-1 )/ZoomY+minY;
          end;

  if maxY>FlimMaxY then begin
          maxY:=FlimMaxY;
          MinY:=MaxY -(PaintBox.Height-AxisXres-1)/ZoomY;
          end;
  end;

RepaintGraph;

if sendToOther then
  if Assigned(OnChangeBorders) then
     OnChangeBorders(Self);
end;


procedure TVGraph.CalcStep(horizont: boolean; min, max: double;
  var step: double);
var d1:Double;
    s, se:string;
begin
  s:= FormatFloat('0.0E+000',max-min);
  se:=Copy(s,5,4);
  s:=Copy(s,1,3);
  d1:=StrToFloat(s);

    begin
     //0.1  0.2  0.5  1.0
      if d1<1.5 then step:=0.1
      else if d1<3.0 then step:=0.2
      else if d1<6.0 then step:=0.5
      else step:=1;
    end;

 if horizont then
    begin
      if PaintBox.Width-AxisYres>300 then  step:= step*StrToFloat('1E'+se)
      else if PaintBox.Width-AxisYres>100 then  step:= 3*step*StrToFloat('1E'+se)
      else step:= 6*step*StrToFloat('1E'+se) ;
    end else begin
      if PaintBox.Height-AxisXres>200 then  step:= step*StrToFloat('1E'+se)
      else if PaintBox.Height-AxisXres>100 then  step:= 2*step*StrToFloat('1E'+se)
      else step:= 5*step*StrToFloat('1E'+se) ;
    end;
end;

function TVGraph.CreateCurve(Name: string; LColor: Tcolor;
  Size: dword): Integer;
var
  idx,i:Integer;
begin
  for idx:=0 to Length(Curve)-1 do if Curve[idx].name=name then begin
   //  if LColor=1 then data[idx].color:=NewColor(idx) else data[idx].color:=LColor;
if Curve[idx].data.x.Length<>size then
     begin
       Curve[idx].data.x.Free;
       Curve[idx].data.y.Free;
       Curve[idx].data.x:= TNumArray1<Single>.Create(size);   //SetLength(Curve[idx].data.x,size);
       Curve[idx].data.y:= TNumArray1<Single>.Create(size);   //SetLength(Curve[idx].data.y,size);
     end;
   result:=idx;
   Exit;
  end;
   idx:=NewCuveIDX;
   Curve[idx].name:=Name;
   Curve[idx].data.x:= TNumArray1<Single>.Create(size); //SetLength(Curve[idx].data.x ,size);
   Curve[idx].data.y:= TNumArray1<Single>.Create(size); //SetLength(Curve[idx].data.y ,size);

   for i:=0 to size-1 do begin
     Curve[idx].data.x[i]:=i;
     Curve[idx].data.y[i]:=0;
   end;
   Curve[idx].color:=Lcolor;
   result:=idx;
end;

procedure TVGraph.DeleteAll;
var i:Integer;
begin
for i:=0 to Length(Curve)-1 do
  begin
    Curve[i].data.x.Reshape(0); // SetLength(Curve[i].data.x,0);
    Curve[i].data.y.Reshape(0); //SetLength(Curve[i].data.y,0);
    Curve[i].name:='';
  end;
 RepaintGraph;
end;

function TVGraph.DeleteCurve(Name: string): Integer;
var CurvesN,i:integer;
begin
  CurvesN:=Length(Curve);
  for i:=0 to CurvesN-1 do if Curve[i].name=name then begin
    Curve[i].data.x.Reshape(0); // SetLength(Curve[i].data.x,0);
    Curve[i].data.y.Reshape(0); //SetLength(Curve[i].data.y,0);
    Curve[i].name:='';
    Break;
  end;
end;

procedure TVGraph.FormCreate(Sender: TObject);
begin
canChange:=false;
  BGColor:=clWhite32;
  TextColor:= clDkGray32;
  GridColor:=clSilver32;

  AxisX:=15;
  AxisY:=30;
  AxisNone:=0;

  ZoomScale:=1.1;

  GridXNum:=10;
  GridYNum:=10;
  FlimMinY:=0;
  FlimMaxY:=256;

ShowLabelX:=false;// true;
ShowLabelY:=true;
if ShowLabelX then AxisXres:=AxisX
   else AxisXres:=AxisNone;
if ShowLabelY then AxisYres:=AxisY
  else AxisYres:=AxisNone;

  MinX:=0;
  MinY:=0;
  MaxX:=1000;
  MaxY:=256;
  ZoomX:=(PaintBox.Width-AxisYres-1 )/(MaxX-MinX);
  ZoomY:=(PaintBox.Height-AxisXres-1)/(MaxY-MinY);

  ShowGrid:=true;
  isPointDown:=false;
  fUseLimits:=true;
canChange:=true;
end;

procedure TVGraph.Grid(horizont: boolean; min, max, step: double);
var start:Double;
    i, mul:Integer;
begin
  mul:=Trunc( min/step);
  start:= mul*step;

  i:=0;

  if horizont then
   begin
    if start<min then begin inc(mul); start:= mul*step; end;
    while (i<PaintBox.Width-AxisYres) do
     begin
     if (pixelToValue(i,0).X>start) then
        begin
        PaintBox.Buffer.VertLine(i+AxisYres, 0, PaintBox.Height-1-AxisXres, GridColor);
        inc(mul); start:= mul*step;
        end;
      inc(i);
     end
   end
  else
   begin
    if start<min then begin inc(mul); start:= mul*step; end;
    while (i<PaintBox.Height-AxisXres) do
     begin
      if (pixelToValue(0,i).Y>=start) then
        begin
        PaintBox.Buffer.HorzLine(AxisYres, i, PaintBox.Width-1, GridColor);
        inc(mul); start:= mul*step;
        end;
      inc(i);
     end;
   end;

end;

function TVGraph.NewCuveIDX: integer;
var
  CurvesN,i:integer;
begin
  CurvesN:=Length(Curve);
  for i:=0 to CurvesN-1 do if Curve[i].data.x.Length=0 then begin
    result:=i;
    Exit;
  end;
  SetLength(Curve,CurvesN+1);
  result:=CurvesN;
end;

procedure TVGraph.PaintBoxMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
if Button=mbMiddle then
  begin
    MinXprev:=MinX;
    MinYprev:=MinY;
    MaxXprev:=MaxX;
    MaxYprev:=MaxY;

    PointDown.X:=X;
    PointDown.Y:=Y;
    isPointDown:=true;
  end;

if Button=mbRight then
    PopupMenu1.Popup( Mouse.CursorPos.X, Mouse.CursorPos.Y);

end;

procedure TVGraph.PaintBoxMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var Dpoint:TDoublePoint;
    OffsetX,OffsetY:Double;
begin
  Xbtm:=X-AxisYres;
  Ybtm:={PaintBox.Height-1-}(Y+AxisXres);

  Dpoint:=pixelToValue(Xbtm,Ybtm);

  Xvalue:=Dpoint.X;
  Yvalue:=Dpoint.Y;

 //    Caption:=Format('X=%f Y=%f',[  Xvalue, Yvalue]);
 //  Caption:=Format('X=%d Y=%d',[  Xbtm, Ybtm]);


if isPointDown then
  if  ssMiddle in Shift then
      begin
      OffsetX:=(X-PointDown.X)/ZoomX;
      OffsetY:=(Y-PointDown.Y)/ZoomY;

      MinX:=MinXprev-OffsetX;
      MaxX:=MaxXprev-OffsetX;

      MinY:=MinYprev-OffsetY;
      MaxY:=MaxYprev-OffsetY;

      CalcResize;
      //RepaintGraph;
      if Assigned(OnChangeBorders) then
         OnChangeBorders(Self);
      end;

 if Assigned(FOnOverColRow) then
     FOnOverColRow(Self, VExp(Xvalue, minX, maxX), VExp(Yvalue, minY, MaxY));

end;

procedure TVGraph.PaintBoxMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
isPointDown:=false;
end;

procedure TVGraph.PaintBoxMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
var ZS:Double;
begin
if WheelDelta<0 then  ZS:= ZoomScale
else
if WheelDelta>0 then  ZS:= 1/ZoomScale
else
   ZS:=1.0;

Handled:=true;
 if Shift=[] then
    Zoom(ZS, true, true)
 else
 if Shift=[ssCtrl] then
    Zoom(ZS, true, false)
  else
  if Shift=[ssShift] then
    Zoom(ZS, false, true);

end;

procedure TVGraph.PaintBoxResize(Sender: TObject);
begin
if Width<60 then  ShowLabelY:=false
  else ShowLabelY:=true;
if ShowLabelY then AxisYres:=AxisY
  else AxisYres:=AxisNone;

CalcResize(false);
end;

procedure TVGraph.PaintCurve(const Curve: tcurve);
var
  len,i:integer;
  pt:TPoint;
begin
  with PaintBox.Buffer do begin
    BeginUpdate;
    len:=Curve.data.x.Length;
    if len<2 then Exit;

    PenColor:=Color32(Curve.color);
    pt:=ValueToPixelPaint( Curve.data.y[0], Curve.data.x[0]);
    MoveTo(pt.X, pt.Y );

    for i:=1 to len-1 do begin
      pt:=ValueToPixelPaint( Curve.data.y[i], Curve.data.x[i]);
      LineToS(pt.X, pt.Y);
    end;

      pt:=ValueToPixelPaint( Curve.data.y[len-1], Curve.data.x[len-1]+Curve.data.x[len-1]-Curve.data.x[len-2]);
      LineToS(pt.X, pt.Y);

    EndUpdate;
  end;

end;

function TVGraph.pixelToValue(btmX, btmY: integer): TDoublePoint;
begin
Result.X:=MinX+btmX/ZoomX;
Result.Y:=MinY+btmY/ZoomY;
end;

procedure TVGraph.pmSaveAsCsvClick(Sender: TObject);
begin
if  Length(Self.Curve) >0 then
  begin
  SaveDialog.Filter:='csv|*.csv';
  SaveDialog.DefaultExt:='csv';
  SaveDialog.FileName:='PlotData';

  if SaveDialog.Execute then
     SaveGraphsAsCSV(SaveDialog.FileName);
  end
else
  sShowMessage('No data');
end;

procedure TVGraph.RepaintGraph;
var CurvesN,i:Integer;
    stepX,stepY:Double;
begin
PaintBox.Buffer.FillRect(0,0,PaintBox.Width, PaintBox.Height, BGColor);

CalcStep(true, MinX, MaxX, StepX);
CalcStep(false, MinY, MaxY, StepY);

if ShowGrid then
  begin
  Grid(true, MinX, MaxX, StepX);
  Grid(false, MinY, MaxY, StepY);
  end;

 CurvesN:= Length(Curve);
    for i:=0 to CurvesN-1 do PaintCurve(Curve[i]);
  Axis(true, MinX, MaxX, StepX);
  Axis(false, MinY, MaxY, StepY);

 PaintBox.Invalidate;
end;

procedure TVGraph.SaveGraphsAsCSV(fileName: string);
var i,j:Integer;
    FS : TFileStream;
    aStr:AnsiString;
begin

if Length(Self.Curve)=0 then Exit;

  try
  FS := TFileStream.Create(FileName, fmCreate, fmShareDenyWrite);

  for i := 0 to Self.Curve[0].data.x.Length-1 do
    begin
      astr:=Self.Curve[0].data.x[i].ToString;

      for j := 0 to Length(Self.Curve)-1 do
       if {(Self.Curve[j]<>nil) or} (Self.Curve[j].name <> '') then
        astr:=astr+','+ Self.Curve[j].data.y[i].ToString;

      astr:=astr+#13#10;
      FS.Write(Pointer(aStr)^, Length(aStr) * SizeOf(AnsiChar));

    end;

  finally
    FS.Free;
  end;

end;

procedure TVGraph.SetLimits(const limMinY, limMaxY: double);
begin
 FlimMinY:=limMinY;
 FlimMaxY:=limMaxY;
end;

procedure TVGraph.SetUseLimits(const Value: boolean);
begin
  FUseLimits := Value;
  CalcResize;
end;

function TVGraph.ValueToPixelPaint(X, Y: Double): TPoint;
begin
Result.X:= Round((X-MinX)*ZoomX)+AxisYres;
Result.Y:= {PaintBox.Height-1-} (Round((Y-MinY)*ZoomY)+AxisXres);
end;

function TVGraph.VExp(value, minV, maxV: double): string;
begin
if Max(abs(MaxV),Abs(minV))>1E4 then Result:=FormatFloat('#.###E+00',value)
else if Max(abs(MaxV),Abs(minV))>0.001 then
                        begin
                        if (maxV-minV)>0.1  then Result:=FormatFloat('0.####',value)
                         else Result:=FormatFloat('#.###E+00',value);
                        end

else Result:=FormatFloat('#.###E+00',value);
end;

procedure TVGraph.Zoom(value: double; byX, byY: boolean);
begin
if byX then
  begin
  MinX:=Xvalue-(Xvalue-MinX)/value;
  MaxX:=Xvalue+(MaxX-Xvalue)/value;
  end;

if byY then
   begin
   MinY:=Yvalue-(Yvalue-MinY)/value;
   MaxY:= Yvalue+(MaxY-Yvalue)/value;
   end;

CalcResize;
end;

end.
