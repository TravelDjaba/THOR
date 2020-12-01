unit MathOps;

interface

uses
  NumArray,
  mkl_types,mkl_vsl_types, mkl_vsl_defines, mkl_vsl_functions, mkl_vml_functions, mkl_vsl;

type
  MklIndex = MKL_INT;

var
  d1: Double = 1.0;
  d0: Double = 0.0;
  s1: Single = 1.0;
  s0: Single = 0.0;
  i1: MKL_INT = 1;
  im1: MKL_INT = -1;
  cN: AnsiChar = 'N';
  cT: AnsiChar = 'T';
  cE: AnsiChar = 'E';
  cS: AnsiChar = 'S';

function Eps(A:TNumArray1<Single>):Single; overload;
function Eps(A:TNumArray2<Single>):Single; overload;
function Eps(A:TNumArray1<Double>):Double; overload;
function Eps(A:TNumArray2<Double>):Double; overload;

//procedure FortranMatrixThinSVD(A:TNumArray2<Single>; U:TNumArray2<Single>; S:TNumArray1<Single>; VT:TNumArray2<Single>; superb:TNumArray1<Single>); overload;
function FortranMatrixThinSVDWorkSize(A:TNumArray2<Double>; U:TNumArray2<Double>; S:TNumArray1<Double>; VT:TNumArray2<Double>):integer; overload;
procedure FortranMatrixThinSVD(A:TNumArray2<Double>; U:TNumArray2<Double>; S:TNumArray1<Double>; VT:TNumArray2<Double>; work:TNumArray1<Double>); overload;

procedure MatrixCopyTranspose(A:TNumArray2<Single>; B:TNumArray2<Single>); overload;
procedure MatrixCopyTranspose(A:TNumArray2<Double>; B:TNumArray2<Double>); overload;

procedure MatrixPartialCopyTranspose(A:TNumArray2<Single>; nrows,ncols:integer; B:TNumArray2<Single>); overload;
procedure MatrixPartialCopyTranspose(A:TNumArray2<Double>; nrows,ncols:integer; B:TNumArray2<Double>); overload;

procedure MatrixPartialCopy(A:TNumArray2<Single>; nrows,ncols:integer; B:TNumArray2<Single>); overload;
procedure MatrixPartialCopy(A:TNumArray2<Double>; nrows,ncols:integer; B:TNumArray2<Double>); overload;

procedure FortranMatrixMul(A,B:TNumArray2<Double>; C:TNumArray2<Double>); overload;
procedure FortranMatrixTMul(A,B:TNumArray2<Double>; C:TNumArray2<Double>); overload;
procedure FortranMatrixTMulC(A,B:TNumArray2<Double>; alpha:double; C:TNumArray2<Double>); overload;
procedure FortranMatrixMulT(A,B:TNumArray2<Double>; C:TNumArray2<Double>); overload;
procedure FortranMatrixMulTC(A,B:TNumArray2<Double>; alpha:double; C:TNumArray2<Double>); overload;

procedure FortranMatrixMul(A,B:TNumArray2<Single>; C:TNumArray2<Single>); overload;

procedure FortranMatrixPartialMul(A,B:TNumArray2<Double>; knum:integer; C:TNumArray2<Double>); overload;

procedure FortranMatrixVectorMul(A:TNumArray2<Double>; x:TNumArray1<Double>; y:TNumArray1<Double>); overload;
procedure FortranMatrixTVectorMul(A:TNumArray2<Double>; x:TNumArray1<Double>; y:TNumArray1<Double>); overload;
function FortranVectorVectorMul(x:TNumArray1<Double>; y:TNumArray1<Double>):double; overload;

procedure FortranMatrixLDivideSquarePartial(A:TNumArray2<Double>; BX:TNumArray1<Double>; knum:integer; work:TNumArray1<Double>); overload;

function FortranMatrixLDivideWorkSize(A,BX:TNumArray2<Double>):integer; overload;
function FortranMatrixLDivideWorkSize(A:TNumArray2<Double>; BX:TNumArray1<Double>):integer; overload;

procedure MatrixDiag(Src:TNumArray2<Double>; Dst:TNumArray1<Double>); overload;

function FortranMatrixDet(A:TNumArray2<Double>; ipiv:TNumArray1<MklIndex>):double; overload;
function FortranMatrixDetPartial(A:TNumArray2<Double>; knum:integer; ipiv:TNumArray1<MklIndex>):double; overload;

procedure MatrixGetRow(Src:TNumArray2<Double>; n:integer; Dst:TNumArray1<Double>); overload;
procedure MatrixGetCol(Src:TNumArray2<Double>; n:integer; Dst:TNumArray1<Double>); overload;
procedure MatrixPutRow(Src:TNumArray1<Double>; n:integer; Dst:TNumArray2<Double>); overload;
procedure MatrixPutCol(Src:TNumArray1<Double>; n:integer; Dst:TNumArray2<Double>); overload;

type
  TRowStatDouble = class(TObject)
  private
    task: VSLSSTaskPtr;
    p,n,xstorage: MKL_INT;
  public
    Data: TNumArray2<Double>;
    Mean: TNumArray1<Double>;
    Variance: TNumArray1<Double>;
    RawSecondMoment: TNumArray1<Double>;
    MaxVal: TNumArray1<Double>;
    constructor Create(AData: TNumArray2<Double>);
    destructor Destroy; override;
    procedure Compute;
  end;

  TColStatDouble = class(TObject)
  private
    task: VSLSSTaskPtr;
    p,n,xstorage: MKL_INT;
  public
    Data: TNumArray2<Double>;
    Mean: TNumArray1<Double>;
    Variance: TNumArray1<Double>;
    RawSecondMoment: TNumArray1<Double>;
    MaxVal: TNumArray1<Double>;
    constructor Create(AData: TNumArray2<Double>);
    destructor Destroy; override;
    procedure Compute;
  end;


implementation

uses
  NumIPP,
  //ipps, ippvm,
  ipps,
  mkl_blas, mkl_lapack,
  mkl_trans, mkl_vml;

function VslSSLayout(D:TNumArray2<Single>):MKL_INT; overload; inline;
begin
  if D.FortranLayout then
    Result:=VSL_SS_MATRIX_STORAGE_COLS
  else
    Result:=VSL_SS_MATRIX_STORAGE_ROWS;
end;
function VslSSLayout(D:TNumArray2<Double>):MKL_INT; overload; inline;
begin
  if D.FortranLayout then
    Result:=VSL_SS_MATRIX_STORAGE_COLS
  else
    Result:=VSL_SS_MATRIX_STORAGE_ROWS;
end;
function TransponedVslSSLayout(D:TNumArray2<Single>):MKL_INT; overload; inline;
begin
  if D.FortranLayout then
    Result:=VSL_SS_MATRIX_STORAGE_ROWS
  else
    Result:=VSL_SS_MATRIX_STORAGE_COLS;
end;
function TransponedVslSSLayout(D:TNumArray2<Double>):MKL_INT; overload; inline;
begin
  if D.FortranLayout then
    Result:=VSL_SS_MATRIX_STORAGE_ROWS
  else
    Result:=VSL_SS_MATRIX_STORAGE_COLS;
end;

function TransLayout(D:TNumArray2<Single>):AnsiChar; overload; inline;
begin
  if D.FortranLayout then
    Result:='C'
  else
    Result:='R';
end;
function TransLayout(D:TNumArray2<Double>):AnsiChar; overload; inline;
begin
  if D.FortranLayout then
    Result:='C'
  else
    Result:='R';
end;


function Eps(A:TNumArray1<Single>):Single; inline;
begin
  Result:=slamch(@cE);
end;

function Eps(A:TNumArray2<Single>):Single; inline;
begin
  Result:=slamch(@cE);
end;

function Eps(A:TNumArray1<Double>):Double; inline;
begin
  Result:=dlamch(@cE);
end;

function Eps(A:TNumArray2<Double>):Double; inline;
begin
  Result:=dlamch(@cE);
end;


function FortranMatrixThinSVDWorkSize(A:TNumArray2<Double>; U:TNumArray2<Double>; S:TNumArray1<Double>; VT:TNumArray2<Double>):integer; inline;
var
  m: MKL_INT;
  n: MKL_INT;
  lda: MKL_INT;
  ldu: MKL_INT;
  ldvt: MKL_INT;
  work: double;
  info: MKL_INT;
begin
  m:=A.Height;
  n:=A.Width;
  lda:=A.LeadDim;
  ldu:=U.LeadDim;
  ldvt:=VT.LeadDim;
  dgesvd(
    @cS,@cS,
    @m,@n,
    nil{A.Buffer},@lda,
    nil{S.Buffer},
    nil{U.Buffer},@ldu,
    nil{VT.Buffer},@ldvt,
    @work,@im1,@info
  );
  Result:=trunc(work);
end;

procedure FortranMatrixThinSVD(A:TNumArray2<Double>; U:TNumArray2<Double>; S:TNumArray1<Double>; VT:TNumArray2<Double>; work:TNumArray1<Double>); inline;
var
  m: MKL_INT;
  n: MKL_INT;
  lda: MKL_INT;
  ldu: MKL_INT;
  ldvt: MKL_INT;
  lwork: MKL_INT;
  info: MKL_INT;
begin
  m:=A.Height;
  n:=A.Width;
  lda:=A.LeadDim;
  ldu:=U.LeadDim;
  ldvt:=VT.LeadDim;
  lwork:=work.Length;
  dgesvd(
    @cS,@cS,
    @m,@n,
    A.Buffer,@lda,
    S.Buffer,
    U.Buffer,@ldu,
    VT.Buffer,@ldvt,
    work.Buffer,@lwork,@info
  );
end;


procedure MatrixCopyTranspose(A:TNumArray2<Single>; B:TNumArray2<Single>); inline;
begin
  mkl_somatcopy(TransLayout(A),
    'T',
    A.Height, A.Width,
    1.0,
    A.Buffer,A.LeadDim,
    B.Buffer,B.LeadDim
  );
end;

procedure MatrixCopyTranspose(A:TNumArray2<Double>; B:TNumArray2<Double>); inline;
begin
  mkl_domatcopy(
    TransLayout(A),
    'T',
    A.Height, A.Width,
    1.0,
    A.Buffer,A.LeadDim,
    B.Buffer,B.LeadDim
  );
end;

procedure MatrixPartialCopyTranspose(A:TNumArray2<Single>; nrows,ncols:integer; B:TNumArray2<Single>); inline;
begin
  mkl_somatcopy(
    TransLayout(A),
    'T',
    nrows, ncols,
    1.0,
    A.Buffer,A.LeadDim,
    B.Buffer,B.LeadDim
  );
end;

procedure MatrixPartialCopyTranspose(A:TNumArray2<Double>; nrows,ncols:integer; B:TNumArray2<Double>); inline;
begin
  mkl_domatcopy(
    TransLayout(A),
    'T',
    nrows, ncols,
    1.0,
    A.Buffer,A.LeadDim,
    B.Buffer,B.LeadDim
  );
end;

procedure MatrixPartialCopy(A:TNumArray2<Single>; nrows,ncols:integer; B:TNumArray2<Single>); inline;
begin
  mkl_somatcopy(
    TransLayout(A),
    'N',
    nrows, ncols,
    1.0,
    A.Buffer,A.LeadDim,
    B.Buffer,B.LeadDim
  );
end;

procedure MatrixPartialCopy(A:TNumArray2<Double>; nrows,ncols:integer; B:TNumArray2<Double>); inline;
begin
  mkl_domatcopy(
    TransLayout(A),
    'N',
    nrows, ncols,
    1.0,
    A.Buffer,A.LeadDim,
    B.Buffer,B.LeadDim
  );
end;

procedure FortranMatrixMul(A,B:TNumArray2<Double>; C:TNumArray2<Double>); inline;
var
  m: MKL_INT;
  n: MKL_INT;
  k: MKL_INT;
  lda: MKL_INT;
  ldb: MKL_INT;
  ldc: MKL_INT;
begin
  m:=A.Height;
  n:=B.Width;
  k:=A.Width;
  lda:=A.LeadDim;
  ldb:=B.LeadDim;
  ldc:=C.LeadDim;
  dgemm(
    @cN,@cN,
    @m,@n,@k,
    @d1,
    A.Buffer,@lda,
    B.Buffer,@ldb,
    @d0,
    C.Buffer,@ldc
  );
end;

procedure FortranMatrixMul(A,B:TNumArray2<Single>; C:TNumArray2<Single>); inline;
var
  m: MKL_INT;
  n: MKL_INT;
  k: MKL_INT;
  lda: MKL_INT;
  ldb: MKL_INT;
  ldc: MKL_INT;
begin
  m:=A.Height;
  n:=B.Width;
  k:=A.Width;
  lda:=A.LeadDim;
  ldb:=B.LeadDim;
  ldc:=C.LeadDim;
  sgemm(
    @cN,@cN,
    @m,@n,@k,
    @s1,
    A.Buffer,@lda,
    B.Buffer,@ldb,
    @s0,
    C.Buffer,@ldc
  );
end;

procedure FortranMatrixPartialMul(A,B:TNumArray2<Double>; knum:integer; C:TNumArray2<Double>); inline;
var
  m: MKL_INT;
  n: MKL_INT;
  k: MKL_INT;
  lda: MKL_INT;
  ldb: MKL_INT;
  ldc: MKL_INT;
begin
  m:=A.Height;
  n:=B.Width;
  k:=knum;
  lda:=A.LeadDim;
  ldb:=B.LeadDim;
  ldc:=C.LeadDim;
  dgemm(
    @cN,@cN,
    @m,@n,@k,
    @d1,
    A.Buffer,@lda,
    B.Buffer,@ldb,
    @d0,
    C.Buffer,@ldc
  );
end;

procedure FortranMatrixTMul(A,B:TNumArray2<Double>; C:TNumArray2<Double>); inline;
var
  m: MKL_INT;
  n: MKL_INT;
  k: MKL_INT;
  lda: MKL_INT;
  ldb: MKL_INT;
  ldc: MKL_INT;
begin
  m:=A.Width;
  n:=B.Width;
  k:=A.Height;
  lda:=A.LeadDim;
  ldb:=B.LeadDim;
  ldc:=C.LeadDim;
  dgemm(
    @cT,@cN,
    @m,@n,@k,
    @d1,
    A.Buffer,@lda,
    B.Buffer,@ldb,
    @d0,
    C.Buffer,@ldc
  );
end;

procedure FortranMatrixTMulC(A,B:TNumArray2<Double>; alpha:double; C:TNumArray2<Double>); inline;
var
  m: MKL_INT;
  n: MKL_INT;
  k: MKL_INT;
  lda: MKL_INT;
  ldb: MKL_INT;
  ldc: MKL_INT;
begin
  m:=A.Width;
  n:=B.Width;
  k:=A.Height;
  lda:=A.LeadDim;
  ldb:=B.LeadDim;
  ldc:=C.LeadDim;
  dgemm(
    @cT,@cN,
    @m,@n,@k,
    @alpha,
    A.Buffer,@lda,
    B.Buffer,@ldb,
    @d0,
    C.Buffer,@ldc
  );
end;

procedure FortranMatrixMulT(A,B:TNumArray2<Double>; C:TNumArray2<Double>); inline;
var
  m: MKL_INT;
  n: MKL_INT;
  k: MKL_INT;
  lda: MKL_INT;
  ldb: MKL_INT;
  ldc: MKL_INT;
begin
  m:=A.Height;
  n:=B.Height;
  k:=A.Width;
  lda:=A.LeadDim;
  ldb:=B.LeadDim;
  ldc:=C.LeadDim;
  dgemm(
    @cN,@cT,
    @m,@n,@k,
    @d1,
    A.Buffer,@lda,
    B.Buffer,@ldb,
    @d0,
    C.Buffer,@ldc
  );
end;

procedure FortranMatrixMulTC(A,B:TNumArray2<Double>; alpha:double; C:TNumArray2<Double>); inline;
var
  m: MKL_INT;
  n: MKL_INT;
  k: MKL_INT;
  lda: MKL_INT;
  ldb: MKL_INT;
  ldc: MKL_INT;
begin
  m:=A.Height;
  n:=B.Height;
  k:=A.Width;
  lda:=A.LeadDim;
  ldb:=B.LeadDim;
  ldc:=C.LeadDim;
  dgemm(
    @cN,@cT,
    @m,@n,@k,
    @alpha,
    A.Buffer,@lda,
    B.Buffer,@ldb,
    @d0,
    C.Buffer,@ldc
  );
end;


procedure FortranMatrixVectorMul(A:TNumArray2<Double>; x:TNumArray1<Double>; y:TNumArray1<Double>); inline;
var
  m: MKL_INT;
  n: MKL_INT;
  lda: MKL_INT;
begin
  m:=A.Height;
  n:=A.Width;
  lda:=A.LeadDim;
  dgemv(
    @cN,
    @m,@n,
    @d1,
    A.Buffer,@lda,
    x.Buffer,@i1,
    @d0,
    y.Buffer,@i1
  );
end;

procedure FortranMatrixTVectorMul(A:TNumArray2<Double>; x:TNumArray1<Double>; y:TNumArray1<Double>); inline;
var
  m: MKL_INT;
  n: MKL_INT;
  lda: MKL_INT;
begin
  m:=A.Height;
  n:=A.Width;
  lda:=A.LeadDim;
  dgemv(
    @cT,
    @m,@n,
    @d1,
    A.Buffer,@lda,
    x.Buffer,@i1,
    @d0,
    y.Buffer,@i1
  );
end;

function FortranVectorVectorMul(x:TNumArray1<Double>; y:TNumArray1<Double>):double; inline;
var
  n: MKL_INT;
begin
  n:=x.Length;
  Result:=ddot(
    @n,
    x.Buffer,@i1,
    y.Buffer,@i1
  );
end;


function FortranMatrixLDivideWorkSize(A,BX:TNumArray2<Double>):integer; inline;
var
  m: MKL_INT;
  n: MKL_INT;
  nrhs: MKL_INT;
  lda: MKL_INT;
  ldb: MKL_INT;
  work: double;
  info: MKL_INT;
begin
  m:=A.Height;
  n:=A.Width;
  nrhs:=BX.Width;
  lda:=A.LeadDim;
  ldb:=BX.LeadDim;
  dgels(
    @cN,
    @m,@n,@nrhs,
    nil{A.Buffer},@lda,
    nil{BX.Buffer},@ldb,
    @work,@im1,@info
  );
  Result:=trunc(work);
end;

function FortranMatrixLDivideWorkSize(A:TNumArray2<Double>; BX:TNumArray1<Double>):integer; inline;
var
  m: MKL_INT;
  n: MKL_INT;
  lda: MKL_INT;
  ldb: MKL_INT;
  work: double;
  info: MKL_INT;
begin
  m:=A.Height;
  n:=A.Width;
  lda:=A.LeadDim;
  ldb:=BX.Length;
  dgels(
    @cN,
    @m,@n,@i1,
    nil{A.Buffer},@lda,
    nil{BX.Buffer},@ldb,
    @work,@im1,@info
  );
  Result:=trunc(work);
end;


procedure FortranMatrixLDivideSquarePartial(A:TNumArray2<Double>; BX:TNumArray1<Double>; knum:integer; work:TNumArray1<Double>); inline;
var
  k: MKL_INT;
  lda: MKL_INT;
  lwork: MKL_INT;
  info:MKL_INT;
begin
  k:=knum;
  lda:=A.LeadDim;
  lwork:=work.Length;
  dgels(
    @cN,
    @k,@k,@i1,
    A.Buffer,@lda,
    BX.Buffer,@k,
    work.Buffer,@lwork,@info
  );
end;


function FortranMatrixDet(A:TNumArray2<Double>; ipiv:TNumArray1<MklIndex>):double; inline;
var
  m: MKL_INT;
  n: MKL_INT;
  lda: MKL_INT;
  info: MKL_INT;
  i: integer;
begin
  m:=A.Height;
  n:=A.Width;
  lda:=A.LeadDim;
  dgetrf(
    @m,@n,
    A.Buffer,@lda,
    ipiv.Buffer,@info
  );
  Result:=1;
  for i:=0 to m-1 do begin
    Result:=Result*A[i,i];
  end;
  for i:=0 to m-1 do begin
    if (ipiv[i]-1)<>i then begin
      Result:=-Result;
    end;
  end;
end;

function FortranMatrixDetPartial(A:TNumArray2<Double>; knum:integer; ipiv:TNumArray1<MklIndex>):double; inline;
var
  k: MKL_INT;
  lda: MKL_INT;
  info: MKL_INT;
  i: integer;
begin
  k:=knum;
  lda:=A.LeadDim;
  dgetrf(
    @k,@k,
    A.Buffer,@lda,
    ipiv.Buffer,@info
  );
  Result:=1;
  for i:=0 to knum-1 do begin
    Result:=Result*A[i,i];
  end;
  for i:=0 to knum-1 do begin
    if (ipiv[i]-1)<>i then begin
      Result:=-Result;
    end;
  end;
end;

{ Vsl }

procedure VslSSNewTask(out task:VSLSSTaskPtr; var p:MKL_INT; var n:MKL_INT; var xstorage:MKL_INT; x:TNumArray2<Single>); overload; inline;
begin
  vslsSSNewTask(task,p,n,xstorage,x.Buffer,nil,nil);
end;

procedure VslSSNewTask(out task:VSLSSTaskPtr; var p:MKL_INT; var n:MKL_INT; var xstorage:MKL_INT; x:TNumArray2<Double>); overload; inline;
begin
  vsldSSNewTask(task,p,n,xstorage,x.Buffer,nil,nil);
end;

procedure VslSSEditTask(task:VSLSSTaskPtr; parameter:MKL_INT; par:TNumArray1<Single>); overload; inline;
begin
  vslsSSEditTask(task,parameter,par.Buffer);
end;

procedure VslSSEditTask(task:VSLSSTaskPtr; parameter:MKL_INT; par:TNumArray1<Double>); overload; inline;
begin
  vsldSSEditTask(task,parameter,par.Buffer);
end;

procedure VslSSCompute(task:VSLSSTaskPtr; estimates:MKL_UINT64; method:MKL_INT; x:TNumArray2<Single>);  overload; inline;
begin
  vslsSSCompute(task, VSL_SS_MEAN or VSL_SS_2C_MOM or VSL_SS_2R_MOM or VSL_SS_MAX, VSL_SS_METHOD_FAST);
end;

procedure VslSSCompute(task:VSLSSTaskPtr; estimates:MKL_UINT64; method:MKL_INT; x:TNumArray2<Double>);  overload; inline;
begin
  vsldSSCompute(task, VSL_SS_MEAN or VSL_SS_2C_MOM or VSL_SS_2R_MOM or VSL_SS_MAX, VSL_SS_METHOD_FAST);
end;

{ TRowStatDouble }

constructor TRowStatDouble.Create(AData: TNumArray2<Double>);
begin
  Data:=AData;
  Mean:=TNumArray1<Double>.Create(Data.Height);
  Variance:=TNumArray1<Double>.Create(Data.Height);
  RawSecondMoment:=TNumArray1<Double>.Create(Data.Height);
  MaxVal:=TNumArray1<Double>.Create(Data.Height);

  p:=Data.Height;
  n:=Data.Width;
  xstorage:=VslSSLayout(Data);
  VslSSNewTask(task,p,n,xstorage,Data);

  VslSSEditTask(task, VSL_SS_ED_MEAN, Mean);
  VslSSEditTask(task, VSL_SS_ED_2C_MOM, Variance); // 1/(N-1)
  VslSSEditTask(task, VSL_SS_ED_2R_MOM, RawSecondMoment); // it's impossible to calculate central moment without raw moment
  VslSSEditTask(task, VSL_SS_ED_MAX, MaxVal);
end;

procedure TRowStatDouble.Compute;
var i:integer;
begin
  for i:=0 to Data.Height-1 do begin
    MaxVal[i]:=Data[i,0];
  end;
  VslSSCompute(task, VSL_SS_MEAN or VSL_SS_2C_MOM or VSL_SS_2R_MOM or VSL_SS_MAX, VSL_SS_METHOD_FAST, Data);
end;

destructor TRowStatDouble.Destroy;
begin
  vslSSDeleteTask(task);

  MaxVal.Free;
  RawSecondMoment.Free;
  Variance.Free;
  Mean.Free;
end;

{ TColStatDouble }

constructor TColStatDouble.Create(AData: TNumArray2<Double>);
begin
  Data:=AData;
  Mean:=TNumArray1<Double>.Create(Data.Width);
  Variance:=TNumArray1<Double>.Create(Data.Width);
  RawSecondMoment:=TNumArray1<Double>.Create(Data.Width);
  MaxVal:=TNumArray1<Double>.Create(Data.Width);

  p:=Data.Width;
  n:=Data.Height;
  xstorage:=TransponedVslSSLayout(Data);
  VslSSNewTask(task,p,n,xstorage,Data);

  VslSSEditTask(task, VSL_SS_ED_MEAN, Mean);
  VslSSEditTask(task, VSL_SS_ED_2C_MOM, Variance);
  VslSSEditTask(task, VSL_SS_ED_2R_MOM, RawSecondMoment); // it's impossible to calculate central moment without raw moment
  VslSSEditTask(task, VSL_SS_ED_MAX, MaxVal);
end;

procedure TColStatDouble.Compute;
var i:integer;
begin
  for i:=0 to Data.Width-1 do begin
    MaxVal[i]:=Data[0,i];
  end;
  VslSSCompute(task, VSL_SS_MEAN or VSL_SS_2C_MOM or VSL_SS_2R_MOM or VSL_SS_MAX, VSL_SS_METHOD_FAST, Data);
end;

destructor TColStatDouble.Destroy;
begin
  vslSSDeleteTask(task);

  MaxVal.Free;
  RawSecondMoment.Free;
  Variance.Free;
  Mean.Free;
end;


procedure MatrixDiag(Src:TNumArray2<Double>; Dst:TNumArray1<Double>); inline;
begin
  if Src.FortranLayout then begin
    vdPackI(Dst.Length,Src.Buffer,Src.Height+1,Dst.Buffer);
  end else begin
    vdPackI(Dst.Length,Src.Buffer,Src.Width+1,Dst.Buffer);
  end;
end;


procedure MatrixGetRow(Src:TNumArray2<Double>; n:integer; Dst:TNumArray1<Double>); inline;
begin
  if Src.FortranLayout then begin
    vdPackI(Src.Width,Src.ValuePtr2(n,0),Src.Height,Dst.Buffer);
  end else begin
    ippsCopy_64f(Src.ValuePtr2(n,0),Dst.Buffer,Src.Width);
  end;
end;

procedure MatrixGetCol(Src:TNumArray2<Double>; n:integer; Dst:TNumArray1<Double>); inline;
begin
  if Src.FortranLayout then begin
    ippsCopy_64f(Src.ValuePtr2(0,n),Dst.Buffer,Src.Height);
  end else begin
    vdPackI(Src.Height,Src.ValuePtr2(0,n),Src.Width,Dst.Buffer)
  end;
end;

procedure MatrixPutRow(Src:TNumArray1<Double>; n:integer; Dst:TNumArray2<Double>); inline;
begin
  if Src.FortranLayout then begin
    vdUnpackI(Dst.Width,Src.Buffer,Dst.ValuePtr2(n,0),Dst.Height);
  end else begin
    ippsCopy_64f(Src.Buffer,Dst.ValuePtr2(n,0),Dst.Width);
  end;
end;

procedure MatrixPutCol(Src:TNumArray1<Double>; n:integer; Dst:TNumArray2<Double>); inline;
begin
  if Src.FortranLayout then begin
    ippsCopy_64f(Src.Buffer,Dst.ValuePtr2(0,n),Dst.Height);
  end else begin
    vdUnpackI(Dst.Height,Src.Buffer,Dst.ValuePtr2(0,n),Dst.Width);
  end;
end;

end.
