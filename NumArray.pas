unit NumArray;

interface

uses
  Classes,SysUtils, System.Generics.Defaults, System.Generics.Collections ,
  ippdefs, ippcore, ipps;

const
  MAX_NUM_DIM = 2;

type
  TDimensionArray = array [0..MAX_NUM_DIM-1] of integer;
  TStrideArray = array [0..MAX_NUM_DIM-1] of integer;

  TNumArray = class(TObject)
  private
    FAllocatedBuffer: PAnsiChar;
    FBuffer: Pointer;
    Fvalsize:integer;
    FCapacity: integer;
    FUsedSize: integer;
    FCount: integer;
    FNumDimensions: integer;
    FDimensions: TDimensionArray;
    FStrides: TStrideArray;
    FContiguousFromDim: integer;
    FFortranLayout: boolean;
  private
  protected
    constructor Create(ABuffer:pointer; AFortranLayout:boolean=false); overload;
    constructor Create(ACount, AValsize:integer;  AFortranLayout:boolean=false); overload;
    procedure ForceShape1(n:integer; valsize:integer);
    procedure ForceShape2(n,m:integer; valsize:integer);
  public
    destructor Destroy; override;
    //procedure FillZero;
    //procedure Assign(Data:TNumArray);
    procedure ReadFromStream(S:TStream);
    procedure WriteToStream(S:TStream);
    function SameDimensions(A:TNumArray):boolean;
    function ValuePtr1(i:integer):pointer; inline;
    function ValuePtr2(i,j:integer):pointer; inline;
    property Buffer: Pointer read FBuffer write FBuffer;
    property NumDimensions: integer read FNumDimensions;
    property Dimensions: TDimensionArray read FDimensions;
    property FortranLayout: boolean read FFortranLayout;
    property ContiguousFromDim: integer read FContiguousFromDim;
    property Strides: TStrideArray read FStrides;
    property Count: integer read FCount;
    property UsedSize: integer read FUsedSize;
  end;

  TNumArray1<T> = class(TNumArray)
  type
    P = ^T;
  private
    function GetLength:integer; inline;
    function GetValue(i:integer):T; inline;
    procedure SetValue(i:integer; val:T); inline;
  public
    constructor Create(ALength:integer; AFortranLayout:boolean=false); overload;
    constructor Create(ABuffer:pointer; ALength:integer; AFortranLayout:boolean=false); overload;
    procedure Reshape(ALength:integer);
    property Length: integer read GetLength;
    function IdxFormValue(const val:T):Integer;
    property Values[i:integer]: T read GetValue write SetValue; default;
  end;

  TNumArray2<T> = class(TNumArray)
  type
    P = ^T;
  private
    function GetWidth:integer; inline;
    function GetHeight:integer; inline;
    function GetValue(i,j:integer):T; inline;
    procedure SetValue(i,j:integer; val:T); inline;
    function GetLeadingDimension:integer; inline;
  public
    constructor Create(AHeight,AWidth:integer; AFortranLayout:boolean=false); overload;
    constructor Create(ABuffer:pointer; AHeight,AWidth:integer; AFortranLayout:boolean=false); overload;
    procedure Reshape(AHeight,AWidth:integer);
    procedure SingleRow(ARowNumber:integer; Result:TNumArray1<T>);
    procedure SingleColumn(AColNumber:integer; Result:TNumArray1<T>);
    property Height: integer read GetHeight;
    property Width: integer read GetWidth;
    property Values[i,j:integer]: T read GetValue write SetValue; default;
    property LeadDim:integer read GetLeadingDimension;
  end;

var
  DecimalPointFormatSettings: TFormatSettings;

implementation

{ TNumArray }

constructor TNumArray.Create(ABuffer:pointer; AFortranLayout:boolean=false);
begin
  inherited Create;
  FCapacity:=0;
  FUsedSize:=0;
  FCount:=0;
  FAllocatedBuffer:=nil;
  FBuffer:=ABuffer;
  FNumDimensions:=0;
  FFortranLayout:=AFortranLayout;
end;

constructor TNumArray.Create(ACount, AValsize:integer;  AFortranLayout:boolean=false);
begin
  inherited Create;
  FCount:=ACount;
  FValSize:=AValSize;
  FCapacity:=ACount*AValSize;
  //GetMem(FAllocatedBuffer,FCapacity);
  FAllocatedBuffer:=ippMalloc(FCapacity);
  FBuffer:=FAllocatedBuffer;
  FFortranLayout:=AFortranLayout;
  ForceShape1(FCount,1);
end;

destructor TNumArray.Destroy;
begin
  if Assigned(FAllocatedBuffer) then begin
    //FreeMem(FAllocatedBuffer,FCapacity);
    ippFree(FAllocatedBuffer);
  end;
  inherited Destroy;
end;

function TNumArray.ValuePtr1(i:integer):pointer;
begin
  Result:=PAnsiChar(FBuffer)+i*FStrides[0];
end;

function TNumArray.ValuePtr2(i,j:integer):pointer;
begin
  Result:=PAnsiChar(FBuffer)+i*FStrides[0]+j*FStrides[1];
end;

procedure TNumArray.ForceShape1(n:integer; valsize:integer);
begin
  FNumDimensions:=1;
  FDimensions[0]:=n;
  FStrides[0]:=valsize;
  FCount:=n;
  FUsedSize:=FCount*valsize;
  FContiguousFromDim:=0;
end;

procedure TNumArray.ForceShape2(n,m:integer; valsize:integer);
begin
  FNumDimensions:=2;
  FDimensions[0]:=n;
  FDimensions[1]:=m;
  if not FFortranLayout then begin
    FStrides[0]:=m*valsize;
    FStrides[1]:=valsize;
  end else begin
    FStrides[0]:=valsize;
    FStrides[1]:=n*valsize;
  end;
  FCount:=n*m;
  FUsedSize:=FCount*valsize;
  FContiguousFromDim:=0;
end;

{
procedure TNumArray.FillZero;
begin
  if FContiguousFromDim>0 then begin
    raise Exception.Create('FillZero is not implemented for non-contiguous memory yet');
  end;
  FillChar(FBuffer^,FUsedSize,0);
end;
}

{
procedure TNumArray.Assign(Data:TNumArray);
var
  i:integer;
  flag:boolean;
begin
  if FContiguousFromDim>0 then begin
    raise Exception.Create('Assign is not implemented for non-contiguous memory yet');
  end;
  if FNumDimensions<>Data.NumDimensions then begin
    raise Exception.Create('Assign is not possible for different dimension arrays');
  end;
  flag:=True;
  for i:=0 to FNumDimensions-1 do begin
    if FDimensions[i]<>Data.Dimensions[i] then begin
      flag:=False;
      break;
    end;
    if FStrides[i]<>Data.Strides[i] then begin
      flag:=False;
      break;
    end;
  end;
  if not flag then begin
    raise Exception.Create('Assign is not possible for different sized arrays');
  end;
  Move(Data.Buffer^,FBuffer^,FUsedSize);
end;
}

procedure TNumArray.ReadFromStream(S:TStream);
begin
  if FContiguousFromDim>0 then begin
    raise Exception.Create('ReadFromStream is not implemented for non-solid memory yet');
  end;
  S.ReadBuffer(FBuffer^,FUsedSize);
end;

procedure TNumArray.WriteToStream(S:TStream);
begin
  if FContiguousFromDim>0 then begin
    raise Exception.Create('WriteToStream is not implemented for non-solid memory yet');
  end;
  S.WriteBuffer(FBuffer^,FUsedSize);
end;

function TNumArray.SameDimensions(A:TNumArray):boolean;
var
  i: integer;
begin
  Result:=False;
  if FNumDimensions<>A.NumDimensions then exit;
  for i:=0 to FNumDimensions-1 do begin
    if FDimensions[i]<>A.Dimensions[i] then exit;
  end;
  Result:=True;
end;

{ TNumArray1<T> }

constructor TNumArray1<T>.Create(ALength:integer; AFortranLayout:boolean=false);
begin
  inherited Create(ALength, SizeOf(T), AFortranLayout);
  ForceShape1(ALength,SizeOf(T));
end;

constructor TNumArray1<T>.Create(ABuffer:pointer; ALength:integer; AFortranLayout:boolean=false);
begin
  inherited Create(ABuffer,AFortranLayout);
  Buffer:=ABuffer;
  ForceShape1(ALength,SizeOf(T));
end;

function TNumArray1<T>.GetLength:integer;
begin
  Result:=Dimensions[0];
end;

function TNumArray1<T>.GetValue(i:integer):T;
begin
  Result:=P(ValuePtr1(i))^;
end;

function TNumArray1<T>.IdxFormValue(const val: T): Integer;
var i:Integer;
    v0,v1:T;
    Comparer: IComparer<T>;
begin
if Self.Length=0 then Result:=-1
  else
if Self.Length=1 then Result:=0
  else
  begin
    Comparer:= TComparer<T>.Default;
    Result:=Length-1;
    v0:=P(ValuePtr1(0))^;
    v1:=P(ValuePtr1(1))^;
    if Comparer.Compare(v0, v1)>=0 then
      begin
       for i := 0 to Length-1 do
         if Comparer.Compare(val, P(ValuePtr1(i))^)>0 then
           begin
           Result:=i;
           Break;
           end;
      end
    else
      begin
       for i := 0 to Length-1 do
         if Comparer.Compare(val, P(ValuePtr1(i))^)<0 then
           begin
           Result:=i;
           Break;
           end;
      end;
  end;

end;

procedure TNumArray1<T>.SetValue(i:integer; val:T);
begin
  P(ValuePtr1(i))^:=val;
end;

procedure TNumArray1<T>.Reshape(ALength:integer);
begin
  ForceShape1(ALength,SizeOf(T));
end;

{ TNumArray2<T> }

constructor TNumArray2<T>.Create(AHeight,AWidth:integer; AFortranLayout:boolean=false);
begin
  inherited Create(AHeight*AWidth, SizeOf(T),AFortranLayout);
  ForceShape2(AHeight,AWidth,SizeOf(T));
end;

constructor TNumArray2<T>.Create(ABuffer:pointer; AHeight,AWidth:integer; AFortranLayout:boolean=false);
begin
  inherited Create(ABuffer,AFortranLayout);
  ForceShape2(AHeight,AWidth,SizeOf(T));
end;

function TNumArray2<T>.GetHeight:integer;
begin
  Result:=Dimensions[0];
end;

function TNumArray2<T>.GetLeadingDimension: integer;
begin
 if FortranLayout then
    Result:=Height
  else
    Result:=Width;
end;

function TNumArray2<T>.GetWidth:integer;
begin
  Result:=Dimensions[1];
end;

function TNumArray2<T>.GetValue(i,j:integer):T;
begin
  Result:=P(ValuePtr2(i,j))^;
end;

procedure TNumArray2<T>.SetValue(i,j:integer; val:T);
begin
  P(ValuePtr2(i,j))^:=val;
end;

procedure TNumArray2<T>.Reshape(AHeight,AWidth:integer);
begin
  ForceShape2(AHeight,AWidth,SizeOf(T));
end;

procedure TNumArray2<T>.SingleRow(ARowNumber:integer; Result:TNumArray1<T>);
var i,n:integer;
begin
  //if Result.Length<>Width then raise Exception.Create('Error Message');
  if (not FortranLayout) and (not Result.FortranLayout) and
     (ContiguousFromDim=0) and (Result.ContiguousFromDim=0) then begin
    Result.Buffer:=ValuePtr2(ARowNumber,0);
  end else begin
    n:=Width;
    for i:=0 to n-1 do begin
      Result[i]:=Values[ARowNumber,i];
    end;
  end;
end;

procedure TNumArray2<T>.SingleColumn(AColNumber:integer; Result:TNumArray1<T>);
var i,n:integer;
begin
  //if Result.Length<>Height then raise Exception.Create('Error Message');
  if (FortranLayout) and (Result.FortranLayout) and
     (ContiguousFromDim=0) and (Result.ContiguousFromDim=0) then begin
    Result.Buffer:=ValuePtr2(0,AColNumber);
  end else begin
    n:=Height;
    for i:=0 to n-1 do begin
      Result[i]:=Values[i,AColNumber];
    end;
  end;
end;

initialization
  DecimalPointFormatSettings:=TFormatSettings.Create('en-US');
  DecimalPointFormatSettings.DecimalSeparator:=AnsiChar('.');
end.
