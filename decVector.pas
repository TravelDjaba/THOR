unit decVector;

interface


uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes;


type
  pdVector=^dVector;
  dVector = class
  private
    size:NativeUInt;
    data:PDouble;
    external:Boolean;     // is data managed externally

    function getValue(i: integer): double;

  public
    constructor Create; overload;
    constructor Create( sz:NativeUInt; v:PDouble); overload;

    // Create a new allocated vector
    constructor Create( t:NativeUInt); overload;
    destructor Destroy;

    procedure setSize(s:NativeUInt);
    function length():NativeUInt;

    procedure setAll(c:double);
    procedure zeroOut();

    function getData():PDouble;
    procedure setValue(j:integer; v:Double);

    // this' *b
    function ddot(b:dVector):Double;

    // norm(this) --- not doing blas style that avoids overflow
    function norm2():Double;
    function norm1():Double;
    function norminf():Double;
    procedure add(b:dVector);
    procedure sub(b:dVector);
    procedure copy(b:dVector);

//  x = x + a*y (x == this is used)
    procedure scalePlusAdd(a:Double; y:dVector);

    property Values[i:integer]:double read getValue write setValue; default;





end;

implementation
uses System.Math;

{ dVector }


{$POINTERMATH ON}

constructor dVector.Create;
begin
  external:=True;
end;

constructor dVector.Create(sz: NativeUInt; v: PDouble);
begin
  external := true;
  size := sz;
  data := v;
end;

procedure dVector.add(b: dVector);
var bd:PDouble;
    i:Integer;
begin
  bd:=b.getData;
  for i := 0 to size-1 do
    data[i]:=data[i]+bd[i];

end;

procedure dVector.copy(b: dVector);
var bd:PDouble;

begin
  bd:=b.getData;
  CopyMemory(data, bd, sizeof(double)*size);

end;

constructor dVector.Create(t: NativeUInt);
begin
  external := false;
  size := t;
  data := AllocMem(size*SizeOf(double));
  FillChar(data^, sizeof(double)*size, 0);
end;

function dVector.ddot(b: dVector): Double;
var pb:PDouble;
    r:Double;
    i:Integer;
begin
  pb:=b.getData;
  r:=0;
  for i := 0 to size-1 do
    r:=r + data[i]*pb[i];

  result:=r;
end;

destructor dVector.Destroy;
begin
  if (not external) then
  FreeMemory(data);
end;

function dVector.getValue(i: integer): double;
begin
result:= data[i];// PDouble(PByte(data)+i*sizeOf(Double))^;
end;


function dVector.getData: PDouble;
begin
  Result:=data;
end;

function dVector.length: NativeUInt;
begin
  result:=size;
end;

function dVector.norm1: Double;
var n,t:Double;
    i:Integer;
begin
  n:=0;
  for i := 0 to size-1 do
    n := n + abs(data[i]);

  result:=Sqrt(n);

end;

function dVector.norm2: Double;
var n:Double;
    i:Integer;
begin
  n:=0;
  for i := 0 to size-1 do
    n := n + data[i]*data[i];

  result:=Sqrt(n);

end;

function dVector.norminf: Double;
var n,t:Double;
    i:Integer;
begin
  n:=0;
  for i := 0 to size-1 do
  begin
    t:= Abs(data[i]);
    if t>n then
      n:=t;
  end;
  result:=n;

end;

procedure dVector.scalePlusAdd(a: Double; y: dVector);
var py:PDouble;
  i: Integer;
begin
  if a=0 then
    add(y)
  else
  begin
    py:=y.getData;
    for i := 0 to size-1 do
      data[i]:=data[i]+ a*py[i];
  end;
end;

procedure dVector.setAll(c: double);
var
  i: Integer;
begin
  for i := 0 to size-1 do
    data[i]:=c;
   // PDouble(PByte(data)+i*sizeOf(Double))^:=c;

end;

procedure dVector.setSize(s: NativeUInt);
begin
  size := s;
end;

procedure dVector.setValue(j: integer; v: Double);
begin
   data[j]:=v;
//   PDouble(PByte(data)+j*sizeOf(Double))^:= v;
end;

procedure dVector.sub(b: dVector);
var bd:PDouble;
    i:Integer;
begin
  bd:=b.getData;
  for i := 0 to size-1 do
    data[i]:=data[i]-bd[i];
end;

procedure dVector.zeroOut;
begin
  FillChar(data^, sizeof(double)*size, 0);
end;

end.
