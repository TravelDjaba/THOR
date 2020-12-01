unit VectorInstruments;

interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,GR32, GR32_Image;

  const viActivColor:TColor32=clPurple32;

type
  TVectorInstrument=(viSelect, viLine, viMeasure, viRect, viGrid);

 TVectorElement = class
     FOwner:TBitmap32;
     FColor:TColor32;
     FUsedColor:TColor32;
     FSelected:Boolean;

  public
     FPoints: array of TPoint;
     constructor Create(AOwner: TBitmap32);
     destructor Destroy;
     procedure Draw; virtual; abstract;
     procedure SetPoint(ptNo:Integer; X,Y:Integer); virtual; abstract;
     procedure Select;
     procedure Deselect;
     property Selected:Boolean read FSelected;

  end;


 TVectorLine = class(TVectorElement)
  public
    constructor Create(AOwner: TBitmap32);
    procedure SetPoint(ptNo:Integer; X,Y:Integer); override;
    procedure Draw; override;

  end;


  TVectorMeasure = class(TVectorElement)
    Fh:Integer;
    FScaleCoef:Single;
  public
    constructor Create(AOwner: TBitmap32);
    procedure SetPoint(ptNo:Integer; X,Y:Integer); override;
    procedure SetScaleCoef(Coef:Single);
    procedure Draw; override;

  end;

  TVectorRectangle = class(TVectorElement)
  private

  public
    constructor Create(AOwner: TBitmap32);
    procedure SetPoint(ptNo:Integer; X,Y:Integer);  override;
    procedure Draw; override;
  end;

  TVectorGrid = class(TVectorElement)
  private
    FsizeX, FsizeY:Single;
    FnX, FnY:Integer;
    FstepSizeBtmX, FstepSizeBtmY:Single;
    FScaleCoef:Single;
    function getStepSizeX: Single;
    function getStepSizeY: Single;
  public
    constructor Create(AOwner: TBitmap32);
    procedure SetScaleCoef(Coef:Single);
    procedure SetPoint(ptNo:Integer; X,Y:Integer);  override;
    procedure SetnXnY(nX,nY:Integer);
    procedure Draw; override;

    property nX:Integer read FnX;
    property nY:Integer read FnY;
    property StepSizeX:Single read getStepSizeX;
    property StepSizeY:Single read getStepSizeY;
  end;


implementation
uses System.Math, main;

procedure GblToBtmCoord(gbX, gbY:integer; var btmX, btmY:Integer);
begin
with formMain.ToupcamG do
  begin
    btmX:= Round( (gbX-_gblCenter.X)*_mapZoom + _BtmSize.X /2 );
    btmY:= Round( (gbY-_gblCenter.Y)*_mapZoom + _BtmSize.Y /2 );
  end;

end;

function gblXtoBtm(gbX:integer):Integer;
begin
with formMain.ToupcamG do
    result:= Round( (gbX-_gblCenter.X)*_mapZoom + _BtmSize.X /2 );

end;

function gblYtoBtm(gbY:integer):Integer;
begin
with formMain.ToupcamG do
      result:= Round( (gbY-_gblCenter.Y)*_mapZoom + _BtmSize.Y /2 );

end;


{ TVectorElement }

constructor TVectorElement.Create(AOwner: TBitmap32);
begin
FOwner:=AOwner;
FColor:=clRed32;
FSelected:=False;
end;

procedure TVectorElement.Deselect;
begin
FSelected:=False;
end;

destructor TVectorElement.Destroy;
begin
 SetLength(FPoints,0);
end;

procedure TVectorElement.Select;
begin
FSelected:=True;
end;

{ TVectorLine }

constructor TVectorLine.Create(AOwner: TBitmap32);
begin
  inherited;
  SetLength(FPoints,2);
  FPoints[0].Zero;
  FPoints[1].Zero;
end;

procedure TVectorLine.Draw;
var btmPoints :array[0..1] of TPoint;
begin
if FSelected then
  FUsedColor:=viActivColor
  else
  FUsedColor:=FColor;

FOwner.Canvas.Pen.Color := WinColor(FUsedColor) ;

GblToBtmCoord(FPoints[0].X,FPoints[0].Y, btmPoints[0].X, btmPoints[0].Y );
GblToBtmCoord(FPoints[1].X,FPoints[1].Y, btmPoints[1].X, btmPoints[1].Y );

if (btmPoints[0].X<>btmPoints[1].X) or (btmPoints[0].Y<>btmPoints[1].Y) then
  begin
//   FOwner.Line(btmPoints[0].x, btmPoints[0].y, btmPoints[1].x, btmPoints[1].y, FUsedColor, True);
    FOwner.Canvas.MoveTo(btmPoints[0].x, btmPoints[0].y);
    FOwner.Canvas.LineTo(btmPoints[1].x, btmPoints[1].y);
  end;

FOwner.Canvas.MoveTo(btmPoints[0].x, btmPoints[0].y);
FOwner.Canvas.AngleArc( btmPoints[0].x, btmPoints[0].y,2,0,360);
FOwner.Canvas.MoveTo(btmPoints[1].x, btmPoints[1].y);
FOwner.Canvas.AngleArc(btmPoints[1].x, btmPoints[1].y,2,0,360);
end;

procedure TVectorLine.SetPoint(ptNo: Integer; X, Y: Integer);
begin
   FPoints[ptNo]:=Point(X,Y);
end;

{ TVectorMeasure }

constructor TVectorMeasure.Create(AOwner: TBitmap32);
begin
  inherited;
  SetLength(FPoints,2);
  FPoints[0].Zero;
  FPoints[1].Zero;

  Fh:=10;
  FScaleCoef:=1.0;
end;

procedure TVectorMeasure.Draw;
var angle:Single;
    sidePts: array[0..1]of TPoint;
    distStr:string;
    asin, acos:Single;
    btmPoints :array[0..1] of TPoint;
begin
if FSelected then
  FUsedColor:=viActivColor
  else
  FUsedColor:=FColor;

  FOwner.Canvas.Pen.Color := WinColor(FUsedColor) ;
  FOwner.Canvas.Brush.Color := WinColor(clLightGray32) ;

  GblToBtmCoord(FPoints[0].X,FPoints[0].Y, btmPoints[0].X, btmPoints[0].Y );
  GblToBtmCoord(FPoints[1].X,FPoints[1].Y, btmPoints[1].X, btmPoints[1].Y );

if (btmPoints[0].X<>btmPoints[1].X) or (btmPoints[0].Y<>btmPoints[1].Y) then
  begin
//   FOwner.Line(btmPoints[0].x, btmPoints[0].y, btmPoints[1].x, btmPoints[1].y, FUsedColor, True);
    FOwner.Canvas.MoveTo(btmPoints[0].x, btmPoints[0].y);
    FOwner.Canvas.LineTo(btmPoints[1].x, btmPoints[1].y);
  end;

//Calc Angle
if btmPoints[0].X=btmPoints[1].X then angle:=Pi/2
else
angle:=ArcTan((btmPoints[0].Y-btmPoints[1].Y)/(btmPoints[0].X-btmPoints[1].X));
SinCos(angle, asin, acos);

sidePts[0]:= Point(Round(btmPoints[0].X+Fh*asin), Round(btmPoints[0].Y-Fh*acos) );
sidePts[1]:= Point(Round(btmPoints[0].X-Fh*asin), Round(btmPoints[0].Y+Fh*acos) );
//FOwner.LineFS(sidePts[0].x, sidePts[0].y, sidePts[1].x, sidePts[1].y, FUsedColor);
FOwner.Canvas.MoveTo(sidePts[0].x, sidePts[0].y);
FOwner.Canvas.LineTo(sidePts[1].x, sidePts[1].y);

sidePts[0]:= Point(Round(btmPoints[1].X+Fh*asin), Round(btmPoints[1].Y-Fh*acos) );
sidePts[1]:= Point(Round(btmPoints[1].X-Fh*asin), Round(btmPoints[1].Y+Fh*acos) );
//FOwner.LineFS(sidePts[0].x, sidePts[0].y, sidePts[1].x, sidePts[1].y, FUsedColor);
FOwner.Canvas.MoveTo(sidePts[0].x, sidePts[0].y);
FOwner.Canvas.LineTo(sidePts[1].x, sidePts[1].y);


distStr:=Format('%.2f um', [FScaleCoef*Sqrt(Sqr(FPoints[0].Y-FPoints[1].Y)+ Sqr(FPoints[0].X-FPoints[1].X))] );
//distStr:= Format('%.3f', [angle] );


//FOwner.FillRect(btmPoints[1].X+6, btmPoints[1].Y-17, btmPoints[1].X+65, btmPoints[1].Y-3, clLightGray32 );
//FOwner.Canvas.FillRect(Rect(btmPoints[1].X+6, btmPoints[1].Y-17, btmPoints[1].X+65, btmPoints[1].Y-3 ));

//FOwner.RenderText(btmPoints[1].X+7, btmPoints[1].Y-17,distStr, 0, clBlack32);
FOwner.Canvas.TextOut(btmPoints[1].X+7, btmPoints[1].Y-17,distStr);

end;

procedure TVectorMeasure.SetPoint(ptNo: Integer; X, Y: Integer);
begin
 FPoints[ptNo]:=Point(X,Y);
end;

procedure TVectorMeasure.SetScaleCoef(Coef: Single);
begin
 FScaleCoef:=Coef;
end;

{ TVectorRectangle }

constructor TVectorRectangle.Create(AOwner: TBitmap32);
begin
  inherited;
  SetLength(FPoints,4);
  FPoints[0].Zero;
  FPoints[1].Zero;
  FPoints[2].Zero;
  FPoints[3].Zero;
end;

procedure TVectorRectangle.Draw;
var     btmPoints :array[0..3] of TPoint;
begin
if FSelected then
  FUsedColor:=viActivColor
  else
  FUsedColor:=FColor;

FOwner.Canvas.Pen.Color := WinColor(FUsedColor) ;

GblToBtmCoord(FPoints[0].X,FPoints[0].Y, btmPoints[0].X, btmPoints[0].Y );
GblToBtmCoord(FPoints[1].X,FPoints[1].Y, btmPoints[1].X, btmPoints[1].Y );
GblToBtmCoord(FPoints[2].X,FPoints[2].Y, btmPoints[2].X, btmPoints[2].Y );
GblToBtmCoord(FPoints[3].X,FPoints[3].Y, btmPoints[3].X, btmPoints[3].Y );

if (btmPoints[0].X<>btmPoints[1].X) or (btmPoints[0].Y<>btmPoints[1].Y) then
  begin
    FOwner.Canvas.MoveTo(btmPoints[0].x, btmPoints[0].y);
    FOwner.Canvas.LineTo(btmPoints[1].x, btmPoints[1].y);

    FOwner.Canvas.MoveTo(btmPoints[2].x, btmPoints[2].y);
    FOwner.Canvas.LineTo(btmPoints[3].x, btmPoints[3].y);

  end;
if (btmPoints[1].X<>btmPoints[2].X) or (btmPoints[1].Y<>btmPoints[2].Y) then
  begin
    FOwner.Canvas.MoveTo(btmPoints[1].x, btmPoints[1].y);
    FOwner.Canvas.LineTo(btmPoints[2].x, btmPoints[2].y);
    FOwner.Canvas.MoveTo(btmPoints[0].x, btmPoints[0].y);
    FOwner.Canvas.LineTo(btmPoints[3].x, btmPoints[3].y);

  end;

end;

procedure TVectorRectangle.SetPoint(ptNo, X, Y: Integer);
begin
//  0  1
//  3  2
case ptNo of
   0: begin
      FPoints[0]:=Point(X,Y);
      FPoints[1].Y:=FPoints[0].Y;
      FPoints[3].X:=FPoints[0].X;
      end;
   1: begin
      FPoints[1]:=Point(X,Y);
      FPoints[0].Y:=FPoints[1].Y;
      FPoints[2].X:=FPoints[1].X;
      end;
   2: begin
      FPoints[2]:=Point(X,Y);
      FPoints[3].Y:=FPoints[2].Y;
      FPoints[1].X:=FPoints[2].X;
      end;
   3: begin
      FPoints[3]:=Point(X,Y);
      FPoints[2].Y:=FPoints[3].Y;
      FPoints[0].X:=FPoints[3].X;
      end;
end;

end;

{ TVectorGrid }

constructor TVectorGrid.Create(AOwner: TBitmap32);
begin
  inherited;
  SetLength(FPoints,4);
  FPoints[0].Zero;
  FPoints[1].Zero;
  FPoints[2].Zero;
  FPoints[3].Zero;

  FnX:=20;
  FnY:=20;
end;

procedure TVectorGrid.Draw;
var distStr:string;
    i, txtX, txtY:Integer;
    btmPoints :array[0..3] of TPoint;
    L,R,T,B:Integer;

begin
if FSelected then
  FUsedColor:=viActivColor
  else
  FUsedColor:=FColor;

FOwner.Canvas.Pen.Color := WinColor(FUsedColor) ;
FOwner.Canvas.Brush.Color := WinColor(clLightGray32) ;

GblToBtmCoord(FPoints[0].X,FPoints[0].Y, btmPoints[0].X, btmPoints[0].Y );
GblToBtmCoord(FPoints[1].X,FPoints[1].Y, btmPoints[1].X, btmPoints[1].Y );
GblToBtmCoord(FPoints[2].X,FPoints[2].Y, btmPoints[2].X, btmPoints[2].Y );
GblToBtmCoord(FPoints[3].X,FPoints[3].Y, btmPoints[3].X, btmPoints[3].Y );

L:=Min(btmPoints[0].X, btmPoints[1].X);
B:=Min(btmPoints[0].Y, btmPoints[3].Y);

R:=Max(btmPoints[0].X, btmPoints[1].X);
T:=Max(btmPoints[0].Y, btmPoints[3].Y);

FstepSizeBtmX:=(R-L)/(FnX-1);
FstepSizeBtmY:=(T-B)/(FnY-1);

//horizontal
if (btmPoints[0].X<>btmPoints[1].X) or (btmPoints[0].Y<>btmPoints[1].Y) then
  begin
    FOwner.Canvas.MoveTo(btmPoints[0].x, btmPoints[0].y);
    FOwner.Canvas.LineTo(btmPoints[1].x, btmPoints[1].y);

    FOwner.Canvas.MoveTo(btmPoints[2].x, btmPoints[2].y);
    FOwner.Canvas.LineTo(btmPoints[3].x, btmPoints[3].y);

    for i := 1 to FnY-2 do
      begin
      FOwner.Canvas.MoveTo(L, B+Round(i*FstepSizeBtmY) );
      FOwner.Canvas.LineTo(R, B+Round(i*FstepSizeBtmY) );
      end;
  end;

//vertical
if (btmPoints[1].X<>btmPoints[2].X) or (btmPoints[1].Y<>btmPoints[2].Y) then
  begin
    FOwner.Canvas.MoveTo(btmPoints[1].x, btmPoints[1].y);
    FOwner.Canvas.LineTo(btmPoints[2].x, btmPoints[2].y);
    FOwner.Canvas.MoveTo(btmPoints[0].x, btmPoints[0].y);
    FOwner.Canvas.LineTo(btmPoints[3].x, btmPoints[3].y);

    for i := 1 to FnX-2 do
      begin
      FOwner.Canvas.MoveTo(  L+Round(i*FstepSizeBtmX), B);
      FOwner.Canvas.LineTo(  L+Round(i*FstepSizeBtmX), T);
      end;
  end;

distStr:=Format('%.1f X %.1f um  [%d X %d]  stepSize[%.1f X %.1f] um',
        [FScaleCoef*Abs(FPoints[0].X-FPoints[1].X), FScaleCoef*Abs(FPoints[0].Y-FPoints[3].Y), FnX, FnY, getStepSizeX, getStepSizeY] );

txtX:= Min(btmPoints[0].X, btmPoints[1].X)+5;
txtY:= Min(btmPoints[0].Y, btmPoints[3].Y)-17;

//FOwner.Canvas.FillRect(Rect(txtX-3, txtY-1, txtX+90, txtY+18));
FOwner.Canvas.TextOut(txtX, txtY, distStr);

end;



function TVectorGrid.getStepSizeX: Single;
begin
Result:=FScaleCoef*Abs(FPoints[0].X-FPoints[1].X)/(FnX-1);
end;

function TVectorGrid.getStepSizeY: Single;
begin
Result:=FScaleCoef*Abs(FPoints[0].Y-FPoints[3].Y)/(FnY-1);
end;

procedure TVectorGrid.SetnXnY(nX, nY: Integer);
begin
if nX>1 then
  FnX:=nX;
if nY>1 then
  FnY:=nY;
end;

procedure TVectorGrid.SetPoint(ptNo, X, Y: Integer);
begin
//  0  1
//  3  2
case ptNo of
   0: begin
      FPoints[0]:=Point(X,Y);
      FPoints[1].Y:=FPoints[0].Y;
      FPoints[3].X:=FPoints[0].X;
      end;
   1: begin
      FPoints[1]:=Point(X,Y);
      FPoints[0].Y:=FPoints[1].Y;
      FPoints[2].X:=FPoints[1].X;
      end;
   2: begin
      FPoints[2]:=Point(X,Y);
      FPoints[3].Y:=FPoints[2].Y;
      FPoints[1].X:=FPoints[2].X;
      end;
   3: begin
      FPoints[3]:=Point(X,Y);
      FPoints[2].Y:=FPoints[3].Y;
      FPoints[0].X:=FPoints[3].X;
      end;
end;

FsizeX:=Abs(FPoints[0].X-FPoints[1].X)/FnX;
FsizeY:=Abs(FPoints[0].Y-FPoints[3].Y)/FnY;

end;

procedure TVectorGrid.SetScaleCoef(Coef: Single);
begin
 FScaleCoef:=Coef;
end;

end.
