unit decNNLS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  decVector, decMatrix;

const
  CLOCKS_PER_SEC = 1E6;

type
   Tout = record

      start:NativeUInt;
      memory:NativeUInt;
      obj:dVector;
      iter:integer;
      time:dVector;
      pgnorms:dVector;
      npg:Double;                // inf-norm of projected gradient
     end;
type
  dNNLS = class
      // The variables used during compute time
  private
    x:dVector;                  // The solution -- also current iterate
    x0:dVector;                 // Starting value
    oldx:dVector;                // Previous iterate
    g:dVector;                   // Current gradient
    oldg:dVector;                // Previous gradient
    xdelta:dVector;              // x - oldx
    gdelta:dVector;              // g - oldg
    refx:dVector;                // iterate from 'M' steps ago
    refg:dVector;                // reference gradient from M steps ago

    A:dMatrix;
    b:dVector;
    ax:dVector;                 // vector to hold A*x
    fset:PNativeUInt;               // fixed set
    fssize:NativeUInt;              // sizeof fixed set

    // The parameters of the solver
  private
    maxit:Integer;               // maximum num. iters
    M:Integer;                    // max num. of null iterations
    decay:double;               // parameter to make diminishing scalar to decay by
    beta:double;                // diminishing scalar
    pgtol:double;               // projected gradient tolerance
    sigma:double;               // constant for descent condition

  // The solution and statistics variables
  private
    out:Tout;

   // The helper functions used by the solver
  private
    function    initialize():integer;            // computes / sets x0, g0, oldx, oldg, etc.
    function    checkTermination():integer;      // embodies various termination criteria
    procedure   showStatus();            //
    function    cleanUp():integer;               // memory deallocation and friends
    procedure   findFixedVariables();    // compute fixed set (binding set)
    procedure   computeXandGradDelta();  //
    procedure   computeObjGrad();        // compute both together to sav time
    function    computeBBStep():double;         // compute step-size, take care of decay
    procedure   checkDescentUpdateBeta(); // check the wolfe-condition
    function    normProjectedGradient():double; // compute inf-norm of chopped gradient

    // The actual interface to the world!
  public
    constructor Create();  overload;
    constructor Create (A:dMatrix; b:dVector; maxit:integer); overload;
    constructor Create (A:dMatrix; b, x0:dVector; maxit:integer); overload;

    //create + part Initialization
    constructor Create (comp_num, vec_len:integer; maxit:integer); overload;

    destructor Destroy;

    // The various accessors and mutators (or whatever one calls 'em!)

    function getDecay():Double;
    function getM():Integer;
    function getBeta():Double;
    function getObj():Double;
    function getPgTol():Double;
    function getSolution():dVector;
    function getFset():PNativeUInt;
    function getMaxit():NativeUInt;
    function getSigma():Double;

    procedure  setDecay(d:double);
    procedure  setM( m:integer);
    procedure  setBeta(b:double );
    procedure  setPgTol(pg:double );
    procedure  setMaxit( m:NativeUInt);
    procedure  setSigma(s:double );

    procedure  setData( A:dMatrix; b:dVector);

    // The functions that actually launch the ship, and land it!
    function  optimize():integer; overload;
    function  solve(A:dMatrix; b:dVector):integer; overload;

    function  saveStats(const fn:PAnsiChar):integer;
    function  getOptimizationTime():Double;

    procedure Log(s:String);

  end;

implementation
  uses System.Math;

  {$POINTERMATH ON}

{ nnls }

procedure dNNLS.checkDescentUpdateBeta;
var d:Double;
    grad, prx, px:PDouble;
    i:NativeUInt;
begin
  d := 0;
  grad := g.getData();
  prx  := refx.getData();
  px   := x.getData();

  // compute sigma*<grad, refx - x>
  for i := 0 to g.length-1 do
    d :=d+ grad[i]*(prx[i]-px[i]);
  d :=d* sigma;

  d := out.obj[out.iter - M] - out.obj[out.iter] - d;

  //fprintf(stderr, "Descent value: %g - %g - %g, beta=%f\n", out.obj->get(out.iter -M), out.obj->get(out.iter - 2), d, beta*decay);

  // check if suff. descent failed
  if (d < 0) then
    beta :=beta * decay
   else
    begin                     // update reference iteration
    refx.copy(x);
    refg.copy(g);
   end;
end;

function dNNLS.checkTermination: integer;
var term:Integer;
begin
  term := 0;
  if (out.iter >= maxit) then
    term := 1;

  out.pgnorms.setValue(out.iter, normProjectedGradient());
  out.npg := out.pgnorms[ out.iter];
  if (out.npg < pgtol) then
    term := 2;
  result:= term;
end;

function dNNLS.cleanUp: integer;
begin
  ax.Free;
  oldx.Free;
  oldg.Free;
  xdelta.Free;
  gdelta.Free;
  fset:=nil;
  refx.Free;
  result:=0;
end;

// Have to yet do error checking for too-small or too-large step-sizes
function dNNLS.computeBBStep: double;
var
  step, nr, dr:Double;
begin
// Use xdelta and gdelta to compute BB step
  step := 0.0;


  if (out.iter mod 2 <>0) then
  begin
    nr := xdelta.ddot(xdelta);
    dr := xdelta.ddot(gdelta);
  end else
  begin
    nr := xdelta.ddot(gdelta);
    dr := gdelta.ddot(gdelta);
  end;

  //fprintf(stderr, " nr / dr = %lf / %lf\n", nr, dr);
  if (nr = 0) then Exit(0);

  step := nr / dr;

  step := step* beta;
  result:= step;
end;

procedure dNNLS.computeObjGrad;
var d, tm:Double;
begin
  A.dot(dMatrix.NOTRAN, x, ax);
  ax.sub(b);        // ax = ax - b
  d := ax.norm2();
  tm  := double( (GetTickCount - out.start) / CLOCKS_PER_SEC);
  out.obj.setValue(out.iter, 0.5*d*d);
  out.time.setValue(out.iter, tm);
  A.dot(dMatrix.TRAN, ax, g);          // A'(ax)
end;

procedure dNNLS.computeXandGradDelta;
var i, n, k:NativeUInt;
    px, poldx, pg, poldg, pxd, pgd:PDouble;
begin

  n := A.ncols();
  px := x.getData();
  poldx := oldx.getData();
  pg := g.getData();
  poldg := oldg.getData();
  pxd := xdelta.getData();
  pgd := gdelta.getData();

  for i := 0 to n-1 do
  begin
    pxd[i] := px[i] - poldx[i];
    pgd[i] := pg[i] - poldg[i];
  end;

  // Zero out fixed variables
  if fssize>0 then
  for i := 0  to fssize-1 do
  begin
    k:= fset[i];
    pxd[k] := 0;
    pgd[k] := 0;
  end;

  // Save oldx and oldg

  CopyMemory(poldg, pg, n*sizeof(double));
  CopyMemory(poldx, px, n*sizeof(double));

end;

procedure dNNLS.findFixedVariables;
var i,n:NativeUInt;
    vars, grads:PDouble;

begin
  n := A.ncols();
  vars := x.getData();
  grads := g.getData();

  // Clean out fixed set first

  FillChar(fset^, sizeof(NativeUInt)*n, 0);
  fssize := 0;

  for i := 0 to n-1 do
    begin
    if (vars[i] = 0) and (grads[i] > 0) then
      begin
      fset[fssize] := i;
      Inc(fssize);
      end;
    end;
end;

function dNNLS.getBeta: Double;
begin
  result:=beta;
end;

function dNNLS.getDecay: Double;
begin
  result:=decay;
end;

function dNNLS.getFset: PNativeUInt;
begin
  result:=fset;
end;

function dNNLS.getM: Integer;
begin
  result:=M;
end;

function dNNLS.getMaxit: NativeUInt;
begin
  result:=maxit;
end;

function dNNLS.getObj: Double;
begin
  result:=out.obj[out.iter-1];
end;

function dNNLS.getOptimizationTime: Double;
begin
result:= out.time[out.iter];
end;

function dNNLS.getPgTol: Double;
begin
  result:=pgtol;
end;

function dNNLS.getSigma: Double;
begin
  result:=sigma;
end;

function dNNLS.getSolution: dVector;
begin
  result:=x;
end;

function dNNLS.initialize: integer;
var i,n:NativeUInt;
    dat:PDouble;
begin
  n := A.ncols();
  x := dVector.Create(n);
  g := dVector.Create(n);
  refx := dVector.Create(n);
  refg := dVector.Create(n);
  oldx := dVector.Create(n);
  oldg := dVector.Create(n);
  xdelta := dVector.Create(n);
  gdelta := dVector.Create(n);
  out.memory :=out.memory + 8*n*sizeof(double);

  ax := dVector.Create(A.nrows());
  out.memory :=out.memory+ sizeof(double)*ax.length();

  fset := PNativeUInt( AllocMem(sizeof(NativeUInt)*n));
  out.memory :=out.memory+ sizeof(NativeUInt)*n;

  out.obj := dVector.Create(maxit+1);
  out.pgnorms := dVector.Create(maxit+1);
  out.time := dVector.Create(maxit+1);

  out.memory :=out.memory + sizeof(double)*3*(maxit+1);

  x.setAll(0.5);

  if (x0<>nil) then
  begin
    x.copy(x0);
    A.dot(dMatrix.NOTRAN, x, ax);
    ax.sub(b);
    A.dot(dMatrix.TRAN, ax, g);
  end else begin
    // Initial gradient = A'(0 - b), since x0 = 0
    A.dot(dMatrix.TRAN, b, oldg);
    dat := oldg.getData();
    for i := 0  to oldg.length-1 do
      dat[i] := -dat[i];
  end;

  // old gradient = A'*(ax - b)
  A.dot(dMatrix.NOTRAN, x, ax);  ax.sub(b);
  A.dot(dMatrix.TRAN, ax, g);

  // Set the reference iterations
  refx.copy(x);
  refg.copy(g);

  result:= 0;
end;

procedure dNNLS.Log(s: String);
begin

end;

constructor dNNLS.Create(A: dMatrix; b: dVector; maxit: integer);
begin
  Self.x := nil; Self.A := A; Self.b := b;
  Self.maxit := maxit; Self.x0 := nil;
  out.obj := nil; out.iter := -1; out.time := nil;
  fset := 0; out.memory := 0;
  // convergence controlling parameters
  M := 100; beta := 1.0; decay := 0.9; pgtol := 1e-3;  sigma := 0.01;
end;

constructor dNNLS.Create(A: dMatrix; b, x0: dVector; maxit: integer);
begin
  Create(A, b, maxit);
  Self.x0 := x0;
end;

destructor dNNLS.Destroy;
begin
  Self.cleanUp;
end;

constructor dNNLS.Create;
begin
  x := nil;
  A := nil;
  b := nil;
  maxit := 0;
end;

function dNNLS.normProjectedGradient: double;
var i, n, ctr:NativeUInt;
    grads:PDouble;
    pg:Double;
begin
  n := A.ncols();
  grads := g.getData();
  pg := 0.0;
  ctr := 0;
  // compute the norm of the gradient for all variables not in fset
  for i := 0 to n-1 do
  begin
    if (i=fset[ctr]) then
      begin
      Inc(ctr);
      continue;
      end;
    pg := max(pg, abs(grads[i]));
  end;
  result:= pg;

end;

function dNNLS.solve(A: dMatrix; b: dVector): integer;
var term:Integer;
    step:Double;
    px:PDouble;
    i:NativeUInt;
    dat:PDouble;
begin

  out.start:=GetTickCount;

//  x.zeroOut;
//  g.zeroOut;
//  refx.zeroOut;
//  refg.zeroOut;
//  oldx.zeroOut;
//  oldg.zeroOut;
//  xdelta.zeroOut;
//  gdelta.zeroOut;

  Self.A := A; Self.b := b;

  //part of initialization
  x.setAll(0.5);

  if (x0<>nil) then
  begin
    x.copy(x0);
    A.dot(dMatrix.NOTRAN, x, ax);
    ax.sub(b);
    A.dot(dMatrix.TRAN, ax, g);
  end else begin
    // Initial gradient = A'(0 - b), since x0 = 0
    A.dot(dMatrix.TRAN, b, oldg);
    dat := oldg.getData();
    for i := 0  to oldg.length-1 do
      dat[i] := -dat[i];
  end;

  // old gradient = A'*(ax - b)
  A.dot(dMatrix.NOTRAN, x, ax);  ax.sub(b);
  A.dot(dMatrix.TRAN, ax, g);

  // Set the reference iterations
  refx.copy(x);
  refg.copy(g);

  //END of initialization part


  term:=0;
  out.iter:=-1;
//  out.obj.zeroOut;
//  out.pgnorms.zeroOut;
//  out.time.zeroOut;
//  out.npg:=0;


  px:=x.getData;

  while ( term=0) do
  begin
    Inc(out.iter);
    term := checkTermination();

    findFixedVariables();
    computeXandGradDelta();

    step := computeBBStep();

    x.scalePlusAdd(-step, g); // x = x - step*gradient

    // project
    for i := 0 to x.length-1 do
      if (px[i] < 0) then px[i] := 0.0;

    computeObjGrad();
    // check the descent condition
    if (out.iter mod M = 0) then
      checkDescentUpdateBeta();

  end;

  result:= 0;

end;

function dNNLS.optimize: integer;
var term:Integer;
    step:Double;
    px:PDouble;
    i:NativeUInt;
begin

  out.start:=GetTickCount;
  initialize;

  term:=0;
  px:=x.getData;

  while ( term=0) do
  begin
    Inc(out.iter);
    term := checkTermination();

    findFixedVariables();
    computeXandGradDelta();

    step := computeBBStep();

    x.scalePlusAdd(-step, g); // x = x - step*gradient

    // project
    for i := 0 to x.length-1 do
      if (px[i] < 0) then px[i] := 0.0;

    computeObjGrad();
    // check the descent condition
    if (out.iter mod M = 0) then
      checkDescentUpdateBeta();

    if
     (out.iter mod 10 = 0) then
      showStatus();
  end;

  showStatus();
//  cleanUp(); // ->move to Destructor
  result:= 0;

end;

function dNNLS.saveStats(const fn: PAnsiChar): integer;
begin
   // -/-
end;

procedure dNNLS.setBeta(b: double);
begin
  Self.beta:=b;
end;

procedure dNNLS.setData(A: dMatrix; b: dVector);
begin
  Self.A:=A;
  Self.b:=b;
end;

procedure dNNLS.setDecay(d: double);
begin
  Self.decay:=d;
end;

procedure dNNLS.setM(m: integer);
begin
  Self.M:=m;
end;

procedure dNNLS.setMaxit(m: NativeUInt);
begin
  Self.maxit:=maxit;
end;

procedure dNNLS.setPgTol(pg: double);
begin
  Self.pgtol:=pg;
end;

procedure dNNLS.setSigma(s: double);
begin
  Self.sigma:=s;
end;

procedure dNNLS.showStatus;
begin
  Log(Format('%05d  %010E   %010E', [out.iter, out.obj[out.iter], out.npg]));
end;

constructor dNNLS.Create(comp_num, vec_len, maxit: integer);
var
  n:NativeUInt;
begin
  Self.x := nil;
  Self.maxit := maxit; Self.x0 := nil;
  out.obj := nil; out.iter := -1; out.time := nil;
  fset := 0; out.memory := 0;
  // convergence controlling parameters
  M := 100; beta := 1.0; decay := 0.9; pgtol := 1e-3;  sigma := 0.01;

  //Initialization
  n := comp_num;
  x := dVector.Create(n);
  g := dVector.Create(n);
  refx := dVector.Create(n);
  refg := dVector.Create(n);
  oldx := dVector.Create(n);
  oldg := dVector.Create(n);
  xdelta := dVector.Create(n);
  gdelta := dVector.Create(n);
  out.memory :=out.memory + 8*n*sizeof(double);

  ax := dVector.Create(vec_len);
  out.memory :=out.memory+ sizeof(double)*ax.length();

  fset := PNativeUInt( AllocMem(sizeof(NativeUInt)*n));
  out.memory :=out.memory+ sizeof(NativeUInt)*n;

  out.obj := dVector.Create(maxit+1);
  out.pgnorms := dVector.Create(maxit+1);
  out.time := dVector.Create(maxit+1);

  out.memory :=out.memory + sizeof(double)*3*(maxit+1);
end;

end.
