unit uCoefScaler;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, GR32_Image, GR32;


type
    TDoublePoint = record
      X,Y:Single;
    end;

type
  TCoefScaler = class(TForm)
    PaintBox: TPaintBox32;
    procedure FormCreate(Sender: TObject);
    procedure PaintBoxResize(Sender: TObject);
    procedure PaintBoxMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure PaintBoxMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure PaintBoxMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PaintBoxMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PaintBoxMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);

  private
    { Private declarations }
    fPosition, fPositionPrev :Double;
    ZoomStep, fScale:Double;
    ZoomLevel:Integer;


    PointDown:TPoint;
    isPointDown:boolean;

    fMin, fMax, fMinPrev, fMaxPrev : Double;

    FOnChangePosition: TNotifyEvent;

    function GetPosition: Double;
    function VExp(value, minV,maxV:double):string;

    procedure PrintScale;



  public
    { Public declarations }

    BGColor, TextColor, GridColor: TColor32;

    procedure RepaintGraph;


    property Position:Double read GetPosition;
    property OnChangePosition:TNotifyEvent read FOnChangePosition write FOnChangePosition;

  end;


implementation

uses System.Math;

{$R *.dfm}

{ TCoefScaler }



procedure TCoefScaler.FormCreate(Sender: TObject);
begin

  BGColor:=clWhite32;
  TextColor:= clDkGray32;
  GridColor:=clSilver32;

  fPosition:=1;
  ZoomStep:=1.1;
  fScale:=1;



end;

function TCoefScaler.GetPosition: Double;
begin
  Result:=fPosition;
end;




procedure TCoefScaler.PaintBoxMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
if Button=mbLeft then
  begin

    PointDown.Y:=Y;
    fPositionPrev:=fPosition;
    isPointDown:=true;
  end;
end;

procedure TCoefScaler.PaintBoxMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);

  var Offset, Zoom:Double;

begin
if isPointDown then
  if  ssLeft in Shift then
      begin
      Zoom:= PaintBox.Height / (fMax-fMin);
      Offset:=(PointDown.Y-Y)/Zoom;

      fPosition:=fPositionPrev-Offset;


      RepaintGraph;

      if Assigned(OnChangePosition) then
         OnChangePosition(Self);
      end;
end;

procedure TCoefScaler.PaintBoxMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
isPointDown:=false;
end;

procedure TCoefScaler.PaintBoxMouseWheelDown(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
  fScale:=fScale/ZoomStep;
  RepaintGraph;
end;

procedure TCoefScaler.PaintBoxMouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  fScale:=fScale*ZoomStep;
  RepaintGraph;
end;

procedure TCoefScaler.PaintBoxResize(Sender: TObject);
begin
  RepaintGraph;
end;




procedure TCoefScaler.PrintScale;
begin

 PaintBox.Buffer.Font.Color:=WinColor(TextColor);

 PaintBox.Buffer.Textout(1, 1, VExp(fMax, fMin, fMax) );
 PaintBox.Buffer.Textout(1, PaintBox.Height-15, VExp(fMin, fMin, fMax) );
 PaintBox.Buffer.Textout(1, (PaintBox.Height div 2)-7, VExp(fPosition, fMin, fMax) );


end;

procedure TCoefScaler.RepaintGraph;
var stepX,stepY:Double;
begin

  PaintBox.Buffer.FillRect(0,0,PaintBox.Width, PaintBox.Height, BGColor);

  fMax:=fPosition + fScale;
  fMin:=fPosition - fScale;

  PrintScale;

  PaintBox.Invalidate;

end;




function TCoefScaler.VExp(value, minV, maxV: double): string;
begin
if Max(abs(MaxV),Abs(minV))>1E4 then Result:=FormatFloat('#.###E+00',value)
else if Max(abs(MaxV),Abs(minV))>0.001 then
                        begin
                        if (maxV-minV)>0.1  then Result:=FormatFloat('0.####',value)
                         else Result:=FormatFloat('#.###E+00',value);
                        end

else Result:=FormatFloat('#.###E+00',value);
end;

end.
