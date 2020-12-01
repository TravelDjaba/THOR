unit decMatrix;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  decVector;

type
//  arbitrary function
  Pafun=^Tafun;
  Tafun = function(p:double):Double;


type
  pdMatrix=^dMatrix;
  dMatrix = class
    private
      M: NativeUInt;    //num of rows
      N: NativeUInt;    //num of columns


    protected
      memory:NativeUInt;

    function getValue(i, j: integer): double; virtual; abstract;
    procedure setValue(i, j: integer; const Value: double); virtual; abstract;

    public

    const TRAN:boolean=True;
    const NOTRAN:boolean=false;

    constructor Create(); overload;
    /// Create an empty (unallocated) matrix of specified size.
    constructor Create (rows, cols:NativeUInt); overload;

    destructor Destroy; virtual; abstract;

    function load(const f:PAnsiChar; asbin:boolean ):integer; virtual; abstract;

    procedure copy(aMatrix:dMatrix); virtual; abstract;
    function getData():PDouble; virtual; abstract;

    /// Sets the row and column dimensionality of the matrix
    procedure setSize(rows, cols:NativeUInt);
    /// Returns number of rows.
    function nrows():NativeUInt;
    /// Returns number of colums
    function ncols():NativeUInt;
    /// Get the (i,j) entry of the matrix
    property Values[i, j:integer]:double read getValue write setValue; default;

    /// Returns 'r'-th row as a vector
    function get_row( r:NativeUInt; var v:dVector):integer; virtual; abstract;
    /// Returns 'c'-th col as a vector
    function get_col( c:NativeUInt; var v:dVector):integer; virtual; abstract;

    /// Returns main or second diagonal (if p == true)
    function get_diag(p:Boolean; var d:dVector  ):integer; virtual; abstract;

    function set_row( r:NativeUInt; v:dVector):integer; virtual; abstract;
    function set_col( c:NativeUInt; v:dVector):integer; virtual; abstract;
    function set_diag(p:Boolean;  d:dVector):integer; virtual; abstract;

    /// Vector l_p norms for this matrix, p > 0
    function norm ( p:double) :double; overload; virtual; abstract;
    /// Vector l_p norms, p is 'l1', 'l2', 'fro', 'inf'
    function norm (const p:PAnsiChar) :double; overload; virtual; abstract;

    /// Apply an arbitrary function elementwise to this matrix. Changes the matrix.
    function apply (fn:Tafun) :integer; virtual; abstract;

    /// Scale the matrix so that x_ij := s * x_ij
    function scale (s:double):integer;  virtual; abstract;

    /// Adds a const 's' so that x_ij := s + x_ij
    function add_const(s:double):integer;  virtual; abstract;

    /// r = a*row(i) + r
    function    row_daxpy( i:NativeUInt; a:double; r:dVector):integer;  virtual; abstract;
    /// c = a*col(j) + c
    function  col_daxpy(j:NativeUInt; a:double; c:dVector):integer;  virtual; abstract;

    /// Let r := this * x or  this^T * x depending on tranA
    function dot ( transp:Boolean; x:dVector; r:dVector):integer;  virtual; abstract;

    /// get statistics about storage
    function memoryUsage():NativeUInt; virtual; abstract;

  end;



implementation



{ dMatrix }

constructor dMatrix.Create(rows, cols: NativeUInt);
begin
  M:=rows;
  N:=cols;
end;



function dMatrix.ncols: NativeUInt;
begin
  result:=N;
end;

function dMatrix.nrows: NativeUInt;
begin
  result:=M;
end;

procedure dMatrix.setSize(rows, cols: NativeUInt);
begin
  M:=rows;
  N:=cols;
end;


constructor dMatrix.Create;
begin
end;




end.
