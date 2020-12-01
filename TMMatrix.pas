unit TMMatrix;

interface
uses SysUtils;

// n-dimensional vectors
type TInt = array of Integer;
     TDouble = array of Double;

TVector = class
private
  fBuffer:Pointer;
  fLength:Integer;
  procedure SetItem(i:Integer; value:double );
  function GetItem(i:integer):Double;

public
  property Buffer:Pointer read fBuffer write fBuffer;
  property Length:Integer read fLength;
  property Item[i:integer]:double read GetItem write SetItem; default;

  constructor Create( l: integer) ;
  destructor Destroy; override;

  procedure SetValue(value:double);

  function ModVector: Double; // Absolute value of vector
  function EqVector(u: TVector): Boolean;   // Comparison of two vectors
  function Add(u: TVector): TVector; // Sum of vectors
  function Sub(u: TVector): TVector; // Substraction of vectors
  function Mult(u: TVector): Double; // Scalar product of two vectors
  
  procedure AddScalar(a: Double); // Add scalar value to every item of vector
  procedure SubScalar(a: Double); // Substract scalar value from every item of vector
  procedure MultByScalar(a: Double); // Multyplication of every item by  scalar value

  function Mean: Double; // Mean value of vector items
  function StandartDeviation: Double;  // Standart deviation of vector elements
  function Sum: Double;
  function Min: Double;
  function Max: Double;

  function  MultElementVise(b: TVector): Double;

end;
PVectorArray = ^TVectorArray;
TVectorArray = array of TVector;
//Rectangular Matrix Class
type TMatrix = class

private
  fBuffer:Pointer;
  fWidth:Integer;
  fHeight:Integer;

  procedure SetItem(i,j:Integer; value:double );
  function GetItem(i,j:integer):Double;
protected

public
 property Buffer:Pointer read fBuffer write fBuffer;
 property Width:Integer read  fWidth;
 property Height:Integer read  fHeight;
 property Item[i,j:integer]:double read GetItem write SetItem; default;

 procedure Column(AColNumber:integer; Result:TVector );
 procedure Row(ARowNumber:integer; Result:TVector );

 constructor Create( w, h: integer) ;
 destructor Destroy; override;
 procedure SetValue(value:double);

 function TransMatrix: TMatrix;   // Transpose Matrix
 function EqMatrix(B: TMatrix): Boolean; // Matrix Equivalence
 function AddMatrix(B: TMatrix): TMatrix;
 function SubMatrix(B: TMatrix): TMatrix;
 function MultByScalar(c: Double): TMatrix;
 function MultByMatrix(B: TMatrix): TMatrix;
 function MultByVector(V: TVector): TVector; overload;
 procedure MultByVector(V: TVector; Vect: TVector); overload;
 function Determinant: Double;
 function Norm2: Double;
 function Norm1: Double;

 // Sum of i-th column
 function ColumnSum(i: Cardinal): Double;
 function ColumnMean(i: Cardinal): Double;
 function ColumnStd(i: Cardinal): Double;
 function ColumnMin(i: Cardinal): Double;
 function ColumnMax(i: Cardinal): Double;
 // Sum of i-th row
 function RowSum(i: Cardinal): Double;
 function RowMean(i: Cardinal): Double;
 function RowStd(i: Cardinal): Double;
 function RowMin(i: Cardinal): Double;
 function RowMax(i: Cardinal): Double;

  // Inversion of square matrix
 function Reverse: TMatrix;
 function Reverse2: TMatrix;

 // LU decomposition of square matrix
 procedure LUDecomposition(var V: TInt);
 procedure LUDecompositionMax(var V: TInt);

 // Linear Equation Solver
 // A*x = b
 // A - square matrix
 // b - right hand vector
 function LSystem(b: TVector): TVector;

 function LUSystem(b: TVector): TVector; overload;
 procedure LUSystem(b: TVector; Res: TVector); overload;
 procedure LUSystem(V: TInt; b: TVector; Res: TVector); overload;

 function LUSystemMax(b: TVector): TVector; overload;
 procedure LUSystemMax(b: TVector; Res: TVector); overload;
 procedure LUSystemMax(V: TInt; b: TVector; Res: TVector); overload;

 procedure LUSystemInPlace(b: TVector); // Vector b is replaced by solution
 procedure LUSystemMaxInPlace(b: TVector); // Vector b is replaced by solution
end;

implementation

uses Classes, Math;


// Vector Class
constructor TVector.Create(l: integer);
begin
  fBuffer:=AllocMem(l*sizeof(Double));
  fLength:=l;
end;

destructor TVector.Destroy;
begin
  FreeMem(fBuffer);
  inherited Destroy;
end;

function TVector.GetItem(i: integer): Double;
begin
  result:= PDouble( PAnsiChar(fBuffer)+ i*sizeOf(Double))^;
end;

procedure TVector.SetItem(i: Integer; value: double);
begin
  PDouble(PAnsiChar(fBuffer)+ i*sizeOf(Double))^:=value;
end;

procedure TVector.SetValue(value: double);
var i, n: Integer;
begin
  n := fLength;
  for i:=0 to n-1 do
   // PDouble(PAnsiChar(fBuffer)+ i*sizeOf(Double))^:=value;
   Item[i] := value;
  // ippsSet_64f(value,fBuffer,fLength);
end;

function TVector.ModVector : Double;
var i, n: Integer;
begin
  Result := 0;
  if (fLength = 0) then
    Exit;
  n := fLength;
  for i := 0 to n-1 do
    Result := Result + Sqr(Item[i]);
  Result := Sqrt(Result);  

end;

// Comparison of two vectors
function TVector.EqVector(u: TVector): Boolean;
var i, n: Integer;
begin
  Result := False;

  n := u.Length;

  if (fLength = 0) or (n = 0) then
    Exit;
  if n <> fLength then
    Exit;
  Result := True;
  for i:=0 to n-1 do
    if (Item[i] <> u[i]) then
    begin
      Result := False;
      Exit;
    end;

end;

// Sum of two vectors
function TVector.Add(u: TVector): TVector;
var i, n: Integer;
    v : TVector;
begin
  n := u.Length;
  if ((fLength = 0) or (n = 0)) then
  begin
    Exit;
  end;

  if n <> fLength then
    Exit;

  v := TVector.Create(n);
  for i := 0 to n-1 do
    v[i] := Item[i] + u[i];

  Result := v;
end;

// Substraction of two vectors
function TVector.Sub(u: TVector): TVector;
var i, n: Integer;
    v : TVector;
begin
  n := u.Length;
  if ((fLength = 0) or (n = 0)) then
  begin
    Exit;
  end;

  if n <> fLength then
    Exit;

  v := TVector.Create(n);
  for i := 0 to n-1 do
    v[i] := Item[i] - u[i];

  Result := v;
end;

procedure TVector.AddScalar(a: Double);
var i: Integer;
begin
  if fLength = 0 then
    Exit;
  for i := 0 to fLength - 1 do
    Item[i] := Item[i] + a;
end;

procedure TVector.SubScalar(a: Double);
var i: Integer;
begin
  if fLength = 0 then
    Exit;
  for i := 0 to fLength - 1 do
    Item[i] := Item[i] - a;
end;


function TVector.Mult(u: TVector): Double;
var i, n: Integer;
begin
  n := u.Length;
  Result := 0;
  if ((fLength = 0) or (n = 0)) then
  begin
    Exit;
  end;

  if n <> fLength then
    Exit;

  for i := 0 to n-1 do
    Result := Result + Item[i]*u[i];

end;

procedure TVector.MultByScalar(a: Double);
var i: Integer;
begin
  if fLength = 0 then
    Exit;
  for i := 0 to fLength - 1 do
    Item[i] := Item[i] * a;
end;

function TVector.Mean: Double;
var i: Integer;
begin
  Result := 0;
  if fLength = 0 then
    Exit;

  for i :=0 to fLength - 1 do
    Result := Result + Item[i];
  Result := Result / fLength;    

end;


function TVector.StandartDeviation: Double;
var i,n: Integer;
    v0 : Double;
begin
  Result := 0;
  if fLength = 0 then
    Exit;
  v0 := Mean;

  for i := 0 to fLength - 1 do
    Result := Result + Sqr(Item[i]- v0);

  Result := Sqrt(Result/fLength);


end;

function TVector.Sum: Double;
var i: Integer;
begin
  Result := 0;

  for i:=0 to fLength - 1 do
    Result := Result + Item[i]; 
end;

function TVector.Min: Double;
var i: Integer;
begin
  Result := 0.0;
  if fLength = 0 then
    Exit;

  Result := Item[0];
  for i:=1 to fLength-1 do
    begin
      if Result > Item[i] then
        Result := Item[i];
    end;

end;

function TVector.Max: Double;
var i: Integer;
begin
  Result := 0.0;
  if fLength = 0 then
    Exit;

  Result := Item[0];
  for i:=1 to fLength-1 do
    begin
      if Result < Item[i] then
        Result := Item[i];
    end;
end;


{ TMatrix }

constructor TMatrix.Create(w, h: integer);
begin
  inherited Create;
  fBuffer:=AllocMem(w*h*sizeof(Double));
  fWidth:=w;
  fHeight:=h;
end;

destructor TMatrix.Destroy;
begin
  FreeMem(fBuffer);
  inherited Destroy;
end;

function TMatrix.GetItem(i, j: integer): Double;
begin
  if (i<fWidth) and (j<fHeight) then
    Result:= PDouble( PAnsiChar(fBuffer)+ (i+j*fWidth)*sizeOf(Double))^
  else
    Result := 0.0;
end;

procedure TMatrix.SetItem(i, j: Integer; value: double);
begin
 PDouble(PAnsiChar(fBuffer)+ (i+j*fWidth)*sizeOf(Double))^:=value;
end;

procedure TMatrix.SetValue(value: double);
var i, j: Integer;
begin
  for i := 0 to fWidth - 1 do
    for j := 0 to fHeight - 1 do
      Item[i,j] := value;
 //ippsSet_64f(value,fBuffer, fWidth*fHeight);
end;

procedure TMatrix.Row(ARowNumber: integer; Result: TVector);
var i,n:integer;
begin
    n:=fWidth;
    for i:=0 to n-1 do begin
      Result.Item[i]:=Self.Item[i,ARowNumber];
    end;
end;

procedure TMatrix.Column(AColNumber: integer; Result: TVector);
var i,n:integer;
begin
    n:=fHeight;
    for i:=0 to n-1 do begin
      Result.Item[i]:=Self.Item[i,AColNumber];
    end;

end;

function TMatrix.TransMatrix: TMatrix;
var i, j: Integer;
    Matr: TMatrix;
begin
  if (fWidth = 0) then
    Exit;

  Matr := TMatrix.Create(fHeight, fWidth);
  for i := 0 to fWidth-1 do
    for j := 0 to fHeight-1 do
      Matr[j,i] := Item[i,j];
  Result := Matr;
end;

function TMatrix.EqMatrix(B: TMatrix): Boolean;
var i, j: Integer;
begin
  Result := False;
  if (fWidth = 0) or (B.Width = 0) then
    Exit;
  if (fWidth <> B.Width) and (fHeight <> B.Height) then
    Exit;

  Result := True;
  for i := 0 to fWidth-1 do
    for j := 0 to fHeight-1 do
      if (Item[i,j] <> B[i,j]) then
      begin
        Result := False;
        Exit;
      end;
end;

function TMatrix.AddMatrix(B: TMatrix): TMatrix;
var i, j: Integer;
    Matr: TMatrix;
begin
  if (fWidth = 0) or (B.Width = 0) then
    Exit;
  if (fWidth <> B.Width) and (fHeight <> B.Height) then
    Exit;

  Matr := TMatrix.Create(fWidth, fHeight);

  for i:=0 to fWidth-1 do
    for j:=0 to fHeight-1 do
      Matr[i,j] := Item[i,j] + B[i,j];
  Result := Matr;
end;

function TMatrix.SubMatrix(B: TMatrix): TMatrix;
var i, j: Integer;
    Matr: TMatrix;
begin
  if (fWidth = 0) or (B.Width = 0) then
    Exit;
  if (fWidth <> B.Width) and (fHeight <> B.Height) then
    Exit;

  Matr := TMatrix.Create(fWidth, fHeight);

  for i:=0 to fWidth-1 do
    for j:=0 to fHeight-1 do
      Matr[i,j] := Item[i,j] - B[i,j];
  Result := Matr;
end;

function TMatrix.MultByScalar(c: Double): TMatrix;
var i, j: Integer;
begin
  if (fWidth = 0) then
    Exit;

  Result := TMatrix.Create(fWidth, fHeight);

  for i:=0 to fWidth-1 do
    for j:=0 to fHeight-1 do
      Result[i,j] := Item[i,j] * c;
end;

function TMatrix.MultByMatrix(B: TMatrix): TMatrix;
var i, j, k, n, m: Integer;
  Matr: TMatrix;
begin
  if (fWidth = 0) or (B.Width = 0) then
    Exit;

  n := B.Width;
  m := B.Height;

  if (fHeight <> n) then
    Exit;
    
  Matr := TMatrix.Create(fWidth, m);
  for i:=0 to fWidth-1 do
    for j:=0 to m-1 do
    begin
      Matr[i,j] := 0;
      for k:=0 to n-1 do
        Matr[i,j] := Matr[i,j] + Item[i,k] * B[k,j];
    end;
  Result := Matr;
end;

function TMatrix.MultByVector(V: TVector): TVector;
var i, j, n: Integer;
    Vect: TVector;
begin
  if (fWidth = 0) then
    Exit;
  n := V.Length;
  if (fHeight <> n) then
    Exit;
  Vect := TVector.Create(fWidth);

  for i:=0 to fWidth-1 do
  begin
    Vect[i] := 0;
    for j:=0 to n-1 do
      Vect[i] := Vect[i] + Item[i,j]*V[j];
  end;

  Result := Vect;

end;

procedure TMatrix.MultByVector(V: TVector; Vect: TVector);
var i, j, n: Integer;
begin
  if (fWidth = 0) then
    Exit;
  n := V.Length;
  if (fHeight <> n) then
    Exit;
//  if fHeight <> Vect.Length then Exit;

  for i:=0 to fWidth-1 do
  begin
    Vect[i] := 0;
    for j:=0 to n-1 do
      Vect[i] := Vect[i] + Item[i,j]*V[j];
  end;

end;


function TMatrix.Determinant: Double;
var i, j, m: Integer;
    Matr: TMatrix;
    R : Double;
procedure Iterat(var R: Double; Mat: TMatrix; n: Integer);
var i, j: Integer;
    Matr: TMatrix;
    Rtmp, a11: Double;
begin
  if (n = 0) then
  begin
    R := R*Mat[0,0];
    Exit;
  end;

  Matr := TMatrix.Create(n,n);
  a11 := Mat[0,0];

  if(a11 = 0) then
  begin
    // Searching for line with non-zero item
    for i := 1 to n do
      if (Mat[i, 0] <> 0) then
        begin
          for j:=0 to n do
            begin
              Rtmp := Mat[0,j];
              Mat[0,j] := Mat[i,j];
              Mat[i,j] := Rtmp;
            end;
          Break;
        end;
    a11 := Mat[0,0];
    if (a11 = 0) then
      begin
        R := 0;
        Exit;
      end
    else
      R := -R;
  end;

  R := R*a11;
  a11 := 1./ a11;
  for i:=0 to n-1 do
    for j:=0 to n-1 do
      begin
        Matr[i,j] := Mat[i+1,j+1] - Mat[i+1,0] * Mat[0,j+1] * a11;
       // if (Abs(Matr[i,j]) < Abs(Mat[i+1,j+1]) * 1e-10) then
       //   Matr[i,j] := 0;
      end;
  Iterat(R, Matr, n-1);
end;
begin
  if fWidth = 0 then
    Exit;
  if fWidth <> fHeight then
    Exit;
  Matr := TMatrix.Create(fWidth, fWidth);
  for i:=0 to fWidth-1 do
    for j:=0 to fWidth - 1 do
      Matr[i,j] := Item[i,j];
  R := 1;
  Iterat(R, Matr, fWidth-1);

  Result := R;
end;

function TMatrix.Reverse: TMatrix;
// Direct inversion of square matrix
// with independent calculation of its detetminant
var i, j, i1, j1, k1, k2, n: Integer;
    Matr, Dop: TMatrix;
    Rtmp, Det: Double;
begin
  if (fWidth = 0) then
    Exit;
  if (fWidth <> fHeight) then
    Exit;
  n := fWidth;

  Det := Determinant;
  if (Det = 0) then
    Exit;

  Matr := TMatrix.Create(n,n);
  Dop := TMatrix.Create(n-1,n-1);

  for i1:=0 to n-1 do
    for j1:=0 to n-1 do
      begin
        k1 := 0;
        for i:=0 to n-1 do
          begin
            if (i = i1) then Continue;
            k2 := 0;
            for j:=0 to n-1 do
              begin
                if (j = j1) then Continue;
                Dop[k1,k2] := Item[i,j];
                Inc(k2);
              end;
            Inc(k1);
          end;
        Rtmp := Dop.Determinant;
        if (Odd(i1 + j1)) then
          Rtmp := -Rtmp;
        Matr[j1,i1] := Rtmp/Det;
      end;
  Result := Matr;
end;

function TMatrix.Reverse2: TMatrix;
// Direct inversion of square matrix
// with determinant calculation through algebraic adjuncts
var i, j, i1, j1, k1, k2, n: Integer;
    Matr, Dop: TMatrix;
    Rtmp, Det: Double;
begin
  if (fWidth = 0) then
    Exit;
  if (fWidth <> fHeight) then
    Exit;
  n := fWidth;

  Det := Determinant;
  if (Det = 0) then
    Exit;

  n := fWidth;

  Det := 0;
  Matr := TMatrix.Create(n, n);
  Dop := TMatrix.Create(n-1,n-1);

  for i1:=0 to n-1 do
    for j1:=0 to n-1 do
      begin
        k1 := 0;
        for i:=0 to n-1 do
          begin
            if (i = i1) then Continue;
            k2 := 0;
            for j:=0 to n-1 do
              begin
                if (j = j1) then Continue;
                Dop[k1,k2] := Item[i,j];
                Inc(k2);
              end;
            Inc(k1);
          end;
        Rtmp := Dop.Determinant;
        if (Odd(i1 + j1)) then
          Rtmp := -Rtmp;
        Matr[j1,i1] := Rtmp;
        if (i1 = 0) then
          begin
            Det := Det + Item[0, j1]*Rtmp;
          end;
      end;
    if (Det = 0) then
      Exit;
    for i:=0 to n-1 do
      for j:=0 to n-1 do
        Matr[i,j] := Matr[i,j]/Det;
    Result := Matr;
end;

function TMatrix.LSystem(b: TVector): TVector;
var Matr: TMatrix;
begin
  if (fWidth = 0) then
    Exit;
  if (fWidth <> fHeight) then
    Exit;
  Matr := TMatrix.Create(fWidth, fHeight);

  Matr := Reverse;

  Result := Matr.MultByVector(b);    

end;

// LU decomposition
procedure TMatrix.LUDecomposition(var V: TInt);

var i, j, k, N: Integer;
    Rtmp, Rtmp2: Double;
begin
  if (fWidth = 0) then
    Exit;

  if(fWidth <> fHeight) then
    Exit;

  n := fWidth;
  // Filling  V with initial values
  SetLength(V, n);
  for i:=0 to n-1 do
    V[i] := i;

 for i:=0 to n-1 do
  begin
    if(Item[i, i] = 0)
      then
        begin
          // Search the first non-zero element in row i
          for j:=i+1 to n-1 do
            if(Item[i, j] <> 0) then
              begin
                // Permutation of columns i and j
                for k:=0 to n-1 do
                  begin
                    Rtmp := Item[k, i];
                    Item[k, i] := Item[k, j];
                    Item[k, j] := Rtmp;
                  end;
                //  Permutation of column indexes
                k := V[i];
                V[i] := V[j];
                V[j] := k;
                break;
              end;
          if(Item[i, i] = 0) then
            Exit; // Non-Zero element is not found
        end;
    Item[i, i] :=  1. / Item[i, i];

    // Formation of column of matrix L
    for j:=i+1 to n-1 do
      begin
        Rtmp := 0;
        if(i > 0) then
          for k:=0 to i-1 do
            begin
              Rtmp2 := Rtmp;
              Rtmp := Rtmp + Item[j, k] * Item[k,i];
            end;
        Item[j, i] := (Item[j, i] - Rtmp) * Item[i, i];
      end;

    // Formation of (i+1)-th row of matrix U
    for j:=i+1 to n-1 do
      for k:=0 to i do
        begin
          Rtmp := Abs(Item[i+1, j]);
          Item[i+1, j] := Item[i+1, j] - Item[i+1,k] * Item[k,j];
        end;
  end;
end;

function TMatrix.LUSystem(b: TVector): TVector;
var Matr: TMatrix;
    V: TInt;
    Vz: TVector;
    i, j, N: word;
    Rtmp: real;
begin
  if (fWidth <> fHeight) then
    Exit;
  n := fWidth;
  Matr := TMatrix.Create(n, n);

  for i:=0 to n-1 do
    for j:=0 to n-1 do
     Matr[i, j] := Item[i, j];
  Vz := TVector.Create(n);
  Result := TVector.Create(n);

  Matr.LUDecomposition(V);


  // Forward
  Vz[0] := b[0];
  for i:=1 to n-1 do
    begin
      Rtmp := 0;
      for j:=0 to i-1 do
        Rtmp := Rtmp + Matr[i, j] * Vz[j];
      Vz[i] := b[i] - Rtmp;
    end;
  // Backward
  Vz[n-1] := Vz[n-1] * Matr[n-1, n-1];
  for i:=N-2 downto 0 do
  begin
    Rtmp := 0;
    for j:=i+1 to n-1 do
      Rtmp := Rtmp + Matr[i, j] * Vz[j];
    Vz[i] := (Vz[i] - Rtmp) * Matr[i, i];
  end;
  // Recovery of initial sequence
  for i:=0 to n-1 do
    Result[V[i]] := Vz[i];

  Vz.Free;
  SetLength(V,0);
  Matr.Free;
end;

procedure TMatrix.LUSystem(b: TVector; Res: TVector);
var Matr: TMatrix;
    V: TInt;
    Vz: TVector;
    i, j, N: word;
    Rtmp: real;
begin
  if (fWidth <> fHeight) then
    Exit;
  n := fWidth;
  if (n <> Res.Length) then Exit;
  Matr := TMatrix.Create(n, n);

  for i:=0 to n-1 do
    for j:=0 to n-1 do
     Matr[i, j] := Item[i, j];
  Vz := TVector.Create(n);

  Matr.LUDecomposition(V);


  // Forward
  Vz[0] := b[0];
  for i:=1 to n-1 do
    begin
      Rtmp := 0;
      for j:=0 to i-1 do
        Rtmp := Rtmp + Matr[i, j] * Vz[j];
      Vz[i] := b[i] - Rtmp;
    end;
  // Backward
  Vz[n-1] := Vz[n-1] * Matr[n-1, n-1];
  for i:=N-2 downto 0 do
  begin
    Rtmp := 0;
    for j:=i+1 to n-1 do
      Rtmp := Rtmp + Matr[i, j] * Vz[j];
    Vz[i] := (Vz[i] - Rtmp) * Matr[i, i];
  end;
  // Recovery of initial sequence
  for i:=0 to n-1 do
    Res[V[i]] := Vz[i];

  Matr.Free;
  Vz.Free;
  SetLength(V,0);
end;

procedure TMatrix.LUSystem(V: TInt; b: TVector; Res: TVector);
var Vz: TVector;
    i, j, N: word;
    Rtmp: real;
begin
  if (fWidth <> fHeight) then
    Exit;
  n := fWidth;

  if (n <> Res.Length) then Exit;
  
  Vz := TVector.Create(n);

  // Forward
  Vz[0] := b[0];
  for i:=1 to n-1 do
    begin
      Rtmp := 0;
      for j:=0 to i-1 do
        Rtmp := Rtmp + Item[i, j] * Vz[j];
      Vz[i] := b[i] - Rtmp;
    end;
  // Backward
  Vz[n-1] := Vz[n-1] * Item[n-1, n-1];
  for i:=N-2 downto 0 do
  begin
    Rtmp := 0;
    for j:=i+1 to n-1 do
      Rtmp := Rtmp + Item[i, j] * Vz[j];
    Vz[i] := (Vz[i] - Rtmp) * Item[i, i];
  end;
  // Recovery of initial sequence
  for i:=0 to n-1 do
    Res[V[i]] := Vz[i];

  Vz.Free;

end;



procedure TMatrix.LUDecompositionMax(var V: TInt);
var i, j, k, im, n: Integer;
    Rtmp, Rtmp2: Double;
begin
  if (fWidth = 0) then
    Exit;
  if (fWidth <> fHeight) then
    Exit;
  n := fWidth;
  // Filling  V with initial values
  SetLength(V, n);

  for i:=0 to n-1 do
    V[i] := i;

  for i:=0 to n-1 do
    begin
      Rtmp := Abs(Item[i, i]);
      im := i;             // Index of maximal element
      // Searching of maximal element index in i-th row
      for j:=i+1 to n-1 do
        if(Abs(Item[i, j]) > Rtmp) then
          begin
            Rtmp := Abs(Item[i, j]);
            im := j;
          end;
      if (im > i) then
        begin
          // Permutation of columns i and im
          for k:=0 to n-1 do
            begin
              Rtmp := Item[k, i];
              Item[k, i] := Item[k, im];
              Item[k, im] := Rtmp;
            end;
          //  Permutation of sequence of column indeces
          k := V[i];
          V[i] := V[im];
          V[im] := k;
        end;
      if(Item[i, i] = 0) then
        Exit; // Zero element is not found
      Item[i, i] :=  1. / Item[i, i];

      // Formation of column of matrix L
      for j:=i+1 to n-1 do
        begin
          Rtmp := 0;
            if(i > 0) then
              for k:=0 to i-1 do
                begin
                  Rtmp2 := Rtmp;
                  Rtmp := Rtmp + Item[j, k] * Item[k,i];
                end;
          Item[j, i] := (Item[j, i] - Rtmp) * Item[i, i];
        end;

      // Formation of (i+1)-th row of matrix U
      for j:=i+1 to n-1 do
        for k:=0 to i do
          begin
            Rtmp := Abs(Item[i+1, j]);
            Item[i+1, j] := Item[i+1, j] - Item[i+1,k] * Item[k,j];
          end;
    end;
end;

function TMatrix.LUSystemMax(b: TVector): TVector;
var Matr: TMatrix;
    V: TInt;
    Vz: TVector;
    i, j, N: word;
    Rtmp: real;
begin
  if (fWidth <> fHeight) then
    Exit;
  n := fWidth;
  Matr := TMatrix.Create(n, n);

  for i:=0 to n-1 do
    for j:=0 to n-1 do
     Matr[i, j] := Item[i, j];
  Vz := TVector.Create(n);
  Result := TVector.Create(n);

  Matr.LUDecompositionMax(V);


  // Forward
  Vz[0] := b[0];
  for i:=1 to n-1 do
    begin
      Rtmp := 0;
      for j:=0 to i-1 do
        Rtmp := Rtmp + Matr[i, j] * Vz[j];
      Vz[i] := b[i] - Rtmp;
    end;
  // Backward
  Vz[n-1] := Vz[n-1] * Matr[n-1, n-1];
  for i:=N-2 downto 0 do
  begin
    Rtmp := 0;
    for j:=i+1 to n-1 do
      Rtmp := Rtmp + Matr[i, j] * Vz[j];
    Vz[i] := (Vz[i] - Rtmp) * Matr[i, i];
  end;
  // Recovery of initial sequence
  for i:=0 to n-1 do
    Result[V[i]] := Vz[i];

  Matr.Free;
  Vz.Free;
  SetLength(V,0);
end;

procedure TMatrix.LUSystemMax(b: TVector; Res: TVector);
var Matr: TMatrix;
    V: TInt;
    Vz: TVector;
    i, j, N: word;
    Rtmp: real;
begin
  if (fWidth <> fHeight) then
    Exit;
  n := fWidth;
  if Res.Length <> n then Exit;

  Matr := TMatrix.Create(n, n);

  for i:=0 to n-1 do
    for j:=0 to n-1 do
     Matr[i, j] := Item[i, j];
  Vz := TVector.Create(n);

  Matr.LUDecompositionMax(V);

  // Forward
  Vz[0] := b[0];
  for i:=1 to n-1 do
    begin
      Rtmp := 0;
      for j:=0 to i-1 do
        Rtmp := Rtmp + Matr[i, j] * Vz[j];
      Vz[i] := b[i] - Rtmp;
    end;
  // Backward
  Vz[n-1] := Vz[n-1] * Matr[n-1, n-1];
  for i:=N-2 downto 0 do
  begin
    Rtmp := 0;
    for j:=i+1 to n-1 do
      Rtmp := Rtmp + Matr[i, j] * Vz[j];
    Vz[i] := (Vz[i] - Rtmp) * Matr[i, i];
  end;
  // Recovery of initial sequence
  for i:=0 to n-1 do
    Res[V[i]] := Vz[i];

  Matr.Free;
  Vz.Free;
  SetLength(V,0);
end;

procedure TMatrix.LUSystemMax(V: TInt; b: TVector; Res: TVector);
var Vz: TVector;
    i, j, N: word;
    Rtmp: real;
begin
  if (fWidth <> fHeight) then
    Exit;
  n := fWidth;
  if Res.Length <> n then Exit;

  Vz := TVector.Create(n);

  // Forward
  Vz[0] := b[0];
  for i:=1 to n-1 do
    begin
      Rtmp := 0;
      for j:=0 to i-1 do
        Rtmp := Rtmp + Item[i, j] * Vz[j];
      Vz[i] := b[i] - Rtmp;
    end;
  // Backward
  Vz[n-1] := Vz[n-1] * Item[n-1, n-1];
  for i:=N-2 downto 0 do
  begin
    Rtmp := 0;
    for j:=i+1 to n-1 do
      Rtmp := Rtmp + Item[i, j] * Vz[j];
    Vz[i] := (Vz[i] - Rtmp) * Item[i, i];
  end;
  // Recovery of initial sequence
  for i:=0 to n-1 do
    Res[V[i]] := Vz[i];

  Vz.Free;
end;


 // Sum of i-th column
 function TMatrix.ColumnSum(i: Cardinal): Double;
var j: Integer;
begin

  Result := 0.0;

  if (i < fHeight) then
    begin
       for j:=0 to fWidth-1 do
        Result := Result + Item[j,i];
    end
  else
    Exit;
end;
 // Sum of i-th row
function TMatrix.RowSum(i: Cardinal): Double;
var j: Integer;
begin
  Result := 0.0;

  if (i < fWidth) then
    begin
      for j:=0 to fHeight-1 do
        Result := Result + Item[i,j];
    end
  else
    Exit;

end;

function TMatrix.Norm2: Double;
var i, j: Integer;
begin
  Result := 0.0;

  if (fWidth = 0) or (fHeight = 0) then
    Exit;

  for i:=0 to fWidth-1 do
    for j:=0 to fHeight-1 do
      Result := Result + Sqr(Item[i,j]);

  Result := Sqrt(Result);

end;

function TMatrix.Norm1: Double;
var i, j: Integer;
begin
  Result := 0.0;

  if (fWidth = 0) or (fHeight = 0) then
    Exit;

  for i:=0 to fWidth-1 do
    for j:=0 to fHeight-1 do
      Result := Result + Abs(Item[i,j]);

end;

function TMatrix.RowMean(i: Cardinal): Double;
begin
  if (i >= 0) and (i<fWidth) then
    Result := RowSum(i)/fWidth
  else
    Result := 0;
 end;


function TMatrix.RowStd(i: Cardinal): Double;
var j: Integer;
    rmean: Double;
begin
  if (i>=0) and (i<fWidth) then begin
    rmean := RowMean(i);
    Result := 0;
    for j:=0 to fHeight-1 do
      Result := Result + Power(Item[i,j]-rmean,2);
    Result := Sqrt(Result/fHeight);
  end else
    Result := 0.0;
end;

function TMatrix.ColumnMean(i: Cardinal): Double;
begin
  if (i>=0) and (i<fHeight) then
    Result := ColumnSum(i)/fHeight
  else
    Result := 0.0;
end;

function TMatrix.ColumnStd(i: Cardinal): Double;
var j: Integer;
    cmean: Double;
begin
  if (i >= 0) and (i < fHeight) then begin
    cmean := ColumnMean(i);
    Result := 0;
    for j:=0 to fWidth - 1 do
      Result := Result + Power(Item[j,i]-cmean, 2);
    Result := Sqrt(Result/fWidth);  
  end else
    Result := 0.0;

end;

function TMatrix.ColumnMax(i: Cardinal): Double;
var j: Integer;
begin
  if (i>=0) and (i<fHeight) then begin
    Result := Item[0,i];
    for j := 1 to fWidth-1 do begin
        if Result < Item[j,i] then
          Result := Item[j,i];
    end;
  end else
    Result := 0.0;
end;

function TMatrix.ColumnMin(i: Cardinal): Double;
var j: Integer;
begin
  if (i>=0) and (i<fHeight) then begin
    Result := Item[0,i];
    for j := 1 to fWidth-1 do begin
        if Result > Item[j,i] then
          Result := Item[j,i];
    end;
  end else
    Result := 0.0;
end;

function TMatrix.RowMin(i: Cardinal): Double;
var j: Integer;
begin
  if (i>=0) and (i<fWidth) then begin
    Result := Item[i,0];
    for j := 1 to fHeight-1 do begin
        if Result > Item[i,j] then
          Result := Item[i,j];
    end;
  end else
    Result := 0.0;
end;

function TMatrix.RowMax(i: Cardinal): Double;
var j: Integer;
begin
  if (i>=0) and (i<fWidth) then begin
    Result := Item[i,0];
    for j := 1 to fHeight-1 do begin
        if Result < Item[i,j] then
          Result := Item[i,j];
    end;
  end else
    Result := 0.0;
end;

(*
procedure TVector.MultElementVise(b: TVector);
var i: Integer;
begin
  if (fLength = b.Length) then begin
    for i:=0 to fLength-1 do
      Item[i] := Item[i]*b[i];
  end;
end;     *)

function TVector.MultElementVise(b: TVector): Double;
var i: Integer;
    R: TVector;
    s: Double;
begin
  if (fLength = b.Length) then begin
    R := TVector.Create(fLength);
    for i:=0 to fLength-1 do begin
      s := Item[i];
      Item[i] := Item[i]*b[i];
      R[i] := s-Item[i];
    end;
    Result := R.ModVector;
    R.Free;
  end;

end;

procedure TMatrix.LUSystemInPlace(b: TVector);
var Matr: TMatrix;
    V: TInt;
    Vz: TVector;
    i, j, N: word;
    Rtmp: real;
begin
  if (fWidth <> fHeight) then
    Exit;
  n := fWidth;
  Matr := TMatrix.Create(n, n);

  for i:=0 to n-1 do
    for j:=0 to n-1 do
     Matr[i, j] := Item[i, j];
  Vz := TVector.Create(n);

  Matr.LUDecomposition(V);


  // Forward
  Vz[0] := b[0];
  for i:=1 to n-1 do
    begin
      Rtmp := 0;
      for j:=0 to i-1 do
        Rtmp := Rtmp + Matr[i, j] * Vz[j];
      Vz[i] := b[i] - Rtmp;
    end;
  // Backward
  Vz[n-1] := Vz[n-1] * Matr[n-1, n-1];
  for i:=N-2 downto 0 do
  begin
    Rtmp := 0;
    for j:=i+1 to n-1 do
      Rtmp := Rtmp + Matr[i, j] * Vz[j];
    Vz[i] := (Vz[i] - Rtmp) * Matr[i, i];
  end;
  // Recovery of initial sequence
  for i:=0 to n-1 do
    b[V[i]] := Vz[i];

  Matr.Free;
  Vz.Free;
  SetLength(V,0);
end;

procedure TMatrix.LUSystemMaxInPlace(b: TVector);
var Matr: TMatrix;
    V: TInt;
    Vz: TVector;
    i, j, N: word;
    Rtmp: real;
begin
  if (fWidth <> fHeight) then
    Exit;
  n := fWidth;
  Matr := TMatrix.Create(n, n);

  for i:=0 to n-1 do
    for j:=0 to n-1 do
     Matr[i, j] := Item[i, j];
  Vz := TVector.Create(n);

  Matr.LUDecompositionMax(V);


  // Forward
  Vz[0] := b[0];
  for i:=1 to n-1 do
    begin
      Rtmp := 0;
      for j:=0 to i-1 do
        Rtmp := Rtmp + Matr[i, j] * Vz[j];
      Vz[i] := b[i] - Rtmp;
    end;
  // Backward
  Vz[n-1] := Vz[n-1] * Matr[n-1, n-1];
  for i:=N-2 downto 0 do
  begin
    Rtmp := 0;
    for j:=i+1 to n-1 do
      Rtmp := Rtmp + Matr[i, j] * Vz[j];
    Vz[i] := (Vz[i] - Rtmp) * Matr[i, i];
  end;
  // Recovery of initial sequence
  for i:=0 to n-1 do
    b[V[i]] := Vz[i];

  Vz.Free;
  SetLength(V, 0);
  Matr.Free;
end;

end.
