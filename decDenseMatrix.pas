unit decDenseMatrix;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  decVector, decMatrix;

type
  denseMatrix = class(dMatrix)
   private
    size:NativeUInt;
    data:PDouble;
    external:Boolean;     // is data managed externally
   public
    constructor Create();  overload;
    constructor Create (rows, cols:NativeUInt); overload;
    destructor Destroy;
    constructor Create (rows, cols:NativeUInt; adata:PDouble); overload;

    function load(const fn:PAnsiChar; asbin:boolean):integer;
    procedure copy(aMatrix:dMatrix); override;
    function getData():PDouble; override;

   protected
    function load_as_bin(const fn:PAnsiChar):integer;
    function load_as_txt(const fn:PAnsiChar):integer;
    function getValue(i, j: integer): double; override;
    procedure setValue(i, j: integer; const Value: double); override;

   public
    /// Get the (i,j) entry of the matrix
    property Values[i, j:integer]:double read getValue write setValue; default;

    /// Returns 'r'-th row into pre-alloced vector
    function get_row (r:NativeUInt; var vector:dVector ):integer; override;
    /// Returns 'c'-th col as a vector
    function get_col (c:NativeUInt; var vector:dVector):integer; override;
    /// Returns main or second diagonal (if p == true)
    function get_diag(p:Boolean; var vector:dVector):integer; override;

    /// Sets the specified row to the given vector
    function set_row(r:NativeUInt; vector:dVector):integer; override;
    /// Sets the specified col to the given vector
    function set_col(c:NativeUInt; vector:dVector):integer; override;
    /// Sets the specified diagonal to the given vector
    function set_diag(p:Boolean; vector:dVector):integer; override;

    /// Vector l_p norms for this matrix, p > 0
    function norm (p:double):Double; override;
    /// Vector l_p norms, p is 'l1', 'l2', 'fro', 'inf'
    function norm (const p:PAnsiChar):Double; override;

    /// Apply an arbitrary function elementwise to this matrix. Changes the matrix.
    function apply (fn:Tafun):integer; override;

     /// Scale the matrix so that x_ij := s * x_ij
    function scale (s:double):Integer; override;

    /// Adds a const 's' so that x_ij := s + x_ij
    function add_const(s:double):integer; override;

    /// r = a*row(i) + r
    function   row_daxpy( i:NativeUInt; a:double; r:dVector):Integer; override;
    /// c = a*col(j) + c
    function  col_daxpy(i:NativeUInt; a:double; c:dVector):Integer; override;

    /// Let r := this * x or  this^T * x depending on tranA
    function dot (transp:Boolean; x, r:dVector):integer; override;


    function memoryUsage():NativeUInt;

  end;

implementation

  {$POINTERMATH ON}

{ denseMatrix }

constructor denseMatrix.Create;
begin
  external := true;
  data := nil;
end;

constructor denseMatrix.Create(rows, cols: NativeUInt);
begin
  inherited Create(rows, cols);

  external := false;
  size := rows*cols;
  data := AllocMem(size*SizeOf(double));

end;

function denseMatrix.add_const(s: double): integer;
var
  i: Integer;
begin
  for i := 0 to size-1 do
    data[i]:=data[i]+s;
  result:=0;

end;

function denseMatrix.apply(fn: Tafun): integer;
var
  i: Integer;
begin
  for i := 0 to size-1 do
    data[i]:=fn(data[i]);
  result:=0;

end;

function denseMatrix.col_daxpy(i: NativeUInt; a: double; c: dVector): Integer;
begin
  result:=-1;
end;

procedure denseMatrix.copy(aMatrix: dMatrix);
var bd:PDouble;

begin
  bd:=aMatrix.getData;
  CopyMemory(data, bd, sizeof(double)*size);
end;

constructor denseMatrix.Create(rows, cols: NativeUInt; adata: PDouble);
begin
  external := true;
  size := rows*cols;
  data := adata;

end;

destructor denseMatrix.Destroy;
begin
  if (not external) then
  FreeMemory(data);
end;

function denseMatrix.dot(transp: Boolean; x, r: dVector): integer;
var pr, px, rp:PDouble;
    i,j:Integer;
begin
  pr:=r.getData;
  px:=x.getData;

  // M*x
  if ( not transp) then
  begin
    r.zeroOut();
    for i := 0 to nrows-1 do
      begin
      rp := @data[i*ncols];
      for j := 0 to ncols-1 do
        pr[i] :=pr[i]+ rp[j] * px[j];

      end;
  end
  else
  begin                      // M'*x
    r.zeroOut();
    for  i := 0 to nrows-1 do
    begin
      rp := @data[i*ncols];
      for  j := 0 to ncols-1 do
        pr[j] :=pr[j] + rp[j] * px[i];

    end;
  end;

  result:= 0;
end;

function denseMatrix.getData: PDouble;
begin
  result:=data;
end;

function denseMatrix.getValue(i, j: integer): double;
begin
   result:= data[i*ncols()+j];
end;

function denseMatrix.get_col(c: NativeUInt; var vector: dVector): integer;
begin
   result:=-1;
end;

function denseMatrix.get_diag(p: Boolean; var vector: dVector): integer;
begin
   result:=-1;
end;

function denseMatrix.get_row(r: NativeUInt; var vector: dVector): integer;
begin
   result:=-1;
end;

function denseMatrix.load(const fn: PAnsiChar; asbin: boolean): integer;
begin
  if (asbin) then
    result:= load_as_bin(fn)
  else
    result:= load_as_txt(fn);
end;

function denseMatrix.load_as_bin(const fn: PAnsiChar): integer;
begin

end;

function denseMatrix.load_as_txt(const fn: PAnsiChar): integer;
begin

end;

function denseMatrix.memoryUsage: NativeUInt;
begin
 result:= nrows()*ncols()*sizeof(double);
end;

function denseMatrix.norm(const p: PAnsiChar): Double;
begin
   result:=-1;
end;

function denseMatrix.row_daxpy(i: NativeUInt; a: double; r: dVector): Integer;
begin
  result:=-1;
end;

function denseMatrix.norm(p: double): Double;
begin
   result:=-1;
end;

function denseMatrix.scale(s: double): Integer;
var
  i: Integer;
begin
  for i := 0 to size-1 do
    data[i]:=data[i]*s;
  result:=0;

end;

procedure denseMatrix.setValue(i, j: integer; const Value: double);
begin
   data[i*ncols()+j] := value;
end;

function denseMatrix.set_col(c: NativeUInt; vector: dVector): integer;
begin
   result:=-1;
end;

function denseMatrix.set_diag(p: Boolean; vector: dVector): integer;
begin
   result:=-1;
end;

function denseMatrix.set_row(r: NativeUInt; vector: dVector): integer;
begin
   result:=-1;
end;

end.
