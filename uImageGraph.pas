unit uImageGraph;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, GR32, GR32_Image,GR32_Resamplers, Vcl.StdCtrls,
  CommonTypes, NumArray;

//type TNotifyGraph = procedure(Sender: TObject; idL,idR,idT,idB:double) of object;
type
   TSelectPoint=procedure (Sender:TObject; const ACol, ARow:integer) of object;
   TOverPoint=procedure (Sender:TObject; const ACol, ARow:double) of object;
type TPalette = (plGray=0, plWYRB=1, plWYRGBB=2, plRYGLB=3, plDRYGLBD=4);

type
  TIGraph = class(TForm)
    PaintBox: TPaintBox32;
    lblIdx: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure PaintBoxResize(Sender: TObject);
    procedure PaintBoxMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PaintBoxMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure PaintBoxMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure PaintBoxMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private

    Xbtm, Ybtm:Integer;
    Xvalue, Yvalue:Single;
    ZoomX, ZoomY:Single;

    MinXprev, MinYprev:Single;
    MaxXprev, MaxYprev:Single;

    PointDown:TPoint;
    isPointDown:boolean;
    fUseLimits:boolean;

    L,T,R,B:Single;
    pbW, pbH:integer;

    FOnChangeBorders:TNotifyEvent;
    FOnSelectColRow: TSelectPoint;
    FOnOverColRow: TSelectPoint;


    procedure SetUseLimits(const Value: boolean);
    procedure pixelToValue(btmX, btmY: integer; var vX, vY:Single);
    procedure Zoom(const Scale: double; byX, byY: boolean);

  public
    DataBuffer:TBitmap32;
    isLoaded:boolean;
    Palette:TPalette;

    gblW,gblH:integer;
    minX,maxX,minY, maxY:Single;

    property UseLimits:boolean read FUseLimits write SetUseLimits;

    procedure LoadData(ImageData: TNumArray2<byte>); overload;
    procedure LoadData(fileName:string); overload;

    procedure Rescale;
    procedure CalcResize(sendToOther:boolean=true);
    procedure RepaintGraph;

    function WYRB(val: byte): TColor32; inline;
    function WYRGBB(val: byte): TColor32; inline;
    function RYGLB(val: byte): TColor32; inline;
    function DRYGLBD(val: byte): TColor32; inline;


    property OnChangeBorders:TNotifyEvent read FOnChangeBorders write FOnChangeBorders;
    property OnSelectColRow: TSelectPoint read  FOnSelectColRow write FOnSelectColRow;
    property OnOverColRow: TSelectPoint read  FOnOverColRow write FOnOverColRow;
  end;

const
  ZoomStep=1.1;

//var
//  IGraph: TIGraph;

implementation

{$R *.dfm}
uses math;


procedure TIGraph.CalcResize(sendToOther:boolean=true);

begin
pbW:=PaintBox.Width;
pbH:=PaintBox.Height;

ZoomX:=(pbW-1 )/(MaxX-MinX);
ZoomY:=(pbH-1)/(MaxY-MinY);

if UseLimits then
  begin
  if ZoomX<(pbw-1)/gblW then
    ZoomX:=(pbw-1)/gblW;

  if ZoomY<(pbH-1)/gblH then
    ZoomY:=(pbH-1)/gblH;


  if minX<0 then begin
          minX:=0;
          MaxX:=(pbW-1 )/ZoomX+minX;
          end;

  if maxX>gblW then begin
          maxX:=gblW;
          MinX:=MaxX- (pbW-1)/ZoomX;
          end;

  if minY<0 then begin
          minY:=0;
          MaxY:=(pbH-1 )/ZoomY+minY;
          end;

  if maxY>gblH then begin
          maxY:=gblH;
          MinY:=MaxY- (pbH-1)/ZoomY;
          end;

  end;

L:=-minX*ZoomX;
R:=(gblW-minX)*ZoomX+1;

T:=-minY*ZoomY;
B:=(gblH-minY)*ZoomY+1;

if isLoaded then
   RepaintGraph;

if sendToOther then
if Assigned(OnChangeBorders) then
       OnChangeBorders(Self);

end;


function TIGraph.DRYGLBD(val: byte): TColor32;
var r,g,b: byte;
begin
if val<32 then
  begin
   r:=0;
   g:=0;
   b:=127+val*4;
  end
else
if val<96 then
  begin
   r:=0;
   g:=(val-32)*4;
   b:=255;
  end
else
if val<128 then
  begin
   r:=0;
   g:=255;
   b:=255-(val-96)*8;
  end
else
if val<160 then
  begin
   r:=(val-128)*8;
   g:=255;
   b:=0;
  end
else
if val<224 then
  begin
   r:=255;
   g:=255-(val-160)*4;
   b:=0;
  end
else
  begin
   r:=255-(val-224)*4;
   g:=0;
   b:=0;
  end;
  result:=Color32(r,g,b);

end;

procedure TIGraph.FormCreate(Sender: TObject);
begin
 DataBuffer:=TBitmap32.Create;
 gblW:=2000;
 gblH:=256;
 isLoaded:=false;

   ZoomX:=1;
   ZoomY:=1;

    minX:=0;
    minY:=0;
    maxX:=2000;
    maxY:=1000;

  isPointDown:=false;
  FUseLimits :=true;
  Palette:=plGray;
end;

procedure TIGraph.FormDestroy(Sender: TObject);
begin
DataBuffer.Free;
end;


procedure TIGraph.LoadData(ImageData: TNumArray2<byte>);
var x,y:integer;
line:PColor32Array;
begin
DataBuffer.SetSize(ImageData.width, ImageData.height);
gblW:=ImageData.width;
gblH:=ImageData.height;

//SendMessage(Format(' w=%d H=%d',[]));

// LoadDataFromBuffer
DataBuffer.BeginUpdate;
case Palette of
  plGray:begin     //GrayPalette
         for y := 0 to ImageData.Height-1 do
           begin
            line:=DataBuffer.ScanLine[y];
            for x := 0 to ImageData.Width-1 do
            line[x]:=Gray32(ImageData.Values[y,x]);
           end;
         end;
  plWYRB:begin     // White Yellow Red Black
         for y := 0 to ImageData.Height-1 do
           begin
            line:=DataBuffer.ScanLine[y];
            for x := 0 to ImageData.Width-1 do
            line[x]:=WYRB(ImageData.Values[y,x]);
           end;
         end;
  plWYRGBB:begin     // White Yellow Red Black
         for y := 0 to ImageData.Height-1 do
           begin
            line:=DataBuffer.ScanLine[y];
            for x := 0 to ImageData.Width-1 do
            line[x]:=WYRGBB(ImageData.Values[y,x]);
           end;
         end;
  plRYGLB:begin     // Red Yellow Green LightBlue Blue
         for y := 0 to ImageData.Height-1 do
           begin
            line:=DataBuffer.ScanLine[y];
            for x := 0 to ImageData.Width-1 do
            line[x]:=RYGLB(ImageData.Values[y,x]);
           end;
         end;
  plDRYGLBD:begin     // Red Yellow Green LightBlue Blue
         for y := 0 to ImageData.Height-1 do
           begin
            line:=DataBuffer.ScanLine[y];
            for x := 0 to ImageData.Width-1 do
            line[x]:=DRYGLBD(ImageData.Values[y,x]);
           end;
         end;

end;




DataBuffer.EndUpdate;

isLoaded:=true;
CalcResize;
end;

procedure TIGraph.LoadData(fileName: string);
begin
   DataBuffer.LoadFromFile(fileName);
   Application.ProcessMessages;
   Rescale;
end;

procedure TIGraph.PaintBoxMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
if not isLoaded then exit;
//if  ssleft in Shift then
  begin
    MinXprev:=MinX;
    MinYprev:=MinY;
    MaxXprev:=MaxX;
    MaxYprev:=MaxY;

    PointDown.X:=X;
    PointDown.Y:=Y;
    isPointDown:=true;

  end;

if Button=mbLeft then
 if Assigned(FOnSelectColRow) then
     FOnSelectColRow(Self, Max(0, min(gblW-1, trunc(Xvalue))) , Max(0, min(gblH-1, trunc(Yvalue))));
end;

procedure TIGraph.PaintBoxMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
    OffsetX,OffsetY:Double;
begin
  if not isLoaded then exit;

  Xbtm:=X;
  Ybtm:={PaintBox.Height-1-}Y;
  pixelToValue(Xbtm,Ybtm,Xvalue,Yvalue);

    lblIdx.Caption:=Format('X=%f Y=%f',[  Xvalue, Yvalue]);

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

      if Assigned(OnChangeBorders) then
        OnChangeBorders(Self);
      end;

if ssLeft in Shift then
 if Assigned(FOnSelectColRow) then
     FOnSelectColRow(Self, Max(0, min(gblW-1, trunc(Xvalue))) , Max(0, min(gblH-1, trunc(Yvalue))));

 if Assigned(FOnOverColRow) then
     FOnOverColRow(Self, trunc(Xvalue), trunc(Yvalue));

end;

procedure TIGraph.PaintBoxMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
isPointDown:=false;
end;

procedure TIGraph.PaintBoxMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
var
    Scale:double;
begin
    if WheelDelta<0 then Scale:= ZoomStep
    else
    if WheelDelta>0 then Scale:= 1/ZoomStep
    else
    Scale:= 1.0;

   if ssShift in shift then
          Zoom(Scale, false, true)
    else
    if ssCtrl in shift then
          Zoom(Scale, true, false)
   else
          Zoom(Scale, true, true);

end;

procedure TIGraph.PaintBoxResize(Sender: TObject);
begin
CalcResize(false);
end;


procedure TIGraph.pixelToValue(btmX, btmY: integer; var vX, vY: Single);
begin
ZoomX:=(pbW-1 )/(MaxX-MinX);
ZoomY:=(pbH-1)/(MaxY-MinY);

vX:=MinX+btmX/ZoomX;
vY:=MinY+btmY/ZoomY;
end;



procedure TIGraph.RepaintGraph;
begin
//lblMinX.Caption:=format('%.2f',[minX]);
//lblMaxX.Caption:=format('%.2f',[maxX]);
//lblMinY.Caption:=format('%.2f',[minY]);
//lblMaxY.Caption:=format('%.2f',[maxY]);

   PaintBox.Buffer.Clear;

   DataBuffer.Resampler:= TNearestResampler.Create(DataBuffer);
   DataBuffer.DrawMode:=dmOpaque;
   DataBuffer.DrawTo(PaintBox.Buffer,Rect(round(L), round(T),round(R), round(B)),Rect(0,0,gblW,gblH) );
   PaintBox.Invalidate;

end;

procedure TIGraph.Rescale;
begin
Application.ProcessMessages;

gblW:=DataBuffer.Width;
gblH:=DataBuffer.Height;

    minX:=0;
    minY:=0;
    maxX:=gblW;
    maxY:=gblH;

  isLoaded:=true;
  CalcResize;
end;



function TIGraph.RYGLB(val: byte): TColor32;
var r,g,b: byte;
begin
if val<64 then
  begin
   r:=0;
   g:=val*4;
   b:=255;
  end
else
if val<128 then
  begin
   r:=0;
   g:=255;
   b:=255-(val-64)*4;
  end
else
if val<192 then
  begin
   r:=(val-128)*4;
   g:=255;
   b:=0;
  end
else
  begin
   r:=255;
   g:=255-(val-192)*4;
   b:=0;
  end;
  result:=Color32(r,g,b);

end;

procedure TIGraph.SetUseLimits(const Value: boolean);
begin
  FUseLimits := Value;
  CalcResize;
end;

function TIGraph.WYRB(val: byte): TColor32;
var r,g,b: byte;
begin
if val<86 then
  begin
   r:=val*3;
   g:=0;
   b:=0;
  end
else
if val<171 then
  begin
   r:=255;
   g:=(val-85)*3;
   b:=0;
  end
else
  begin
   r:=255;
   g:=255;
   b:=(val-170)*3;
  end;
  result:=Color32(r,g,b);
end;

function TIGraph.WYRGBB(val: byte): TColor32;
var r,g,b: byte;
begin
if val<52 then
  begin
   r:=0;
   g:=0;
   b:=val*5;
  end
else
if val<103 then
  begin
   r:=0;
   g:=(val-51)*5;
   b:=255-(val-51)*5;
  end
else
if val<154 then
  begin
   r:=(val-102)*5;
   g:=255-(val-102)*5;
   b:=0;
  end
else
if val<205 then
  begin
   r:=255;
   g:=(val-153)*5;
   b:=0;
  end
else
  begin
   r:=255;
   g:=255;
   b:=(val-204)*5;
  end;

  result:=Color32(r,g,b);
end;

procedure TIGraph.Zoom(const Scale: double; byX, byY: boolean);
begin
if byX then
  begin
  minX:= Xvalue - (Xvalue-minX)/scale;
  maxX:= Xvalue + (maxX-Xvalue)/scale;
  end;

if byY then
  begin
  minY:= Yvalue - (Yvalue-minY)/scale;
  maxY:= Yvalue + (maxY-Yvalue)/scale;
  end;

CalcResize;
end;

end.
