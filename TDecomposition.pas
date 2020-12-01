unit TDecomposition;

interface

uses TMMatrix, Classes, Windows, Math;

type
//TVectorArray = array of TVector;

TDecompositionOutput = record
  lof: Double;         // lack of fit
  VarianceExplained: Double;
  RMSE: Double;    // root-mean-square error
  tag: string;
end;

TCLSOptions = record
  NonNegativity: Boolean;
  Closure: Boolean;
end;
TNNLSOptions = record
  Closure: Boolean;
end;

TDecompositionOptions = record
  CLS: Boolean; // True - CLS; False - NNLS
  CLSopt: TCLSOptions;
  NNLSopt: TNNLSOptions;
end;

  TMultiThreadDecomposition = class(TThread)
  private
    fid: Integer;
    MaxThreads: Cardinal;
    fdata: PVectorArray;
    fAt: TMatrix;
    fAtA: TMatrix;
    fc: PVectorArray;
    fcls: Boolean;
  protected
    procedure Execute; override;
  public
    constructor Create(id: Integer; data: PVectorArray; At, AtA: TMatrix; MMThreads: Cardinal;iscls: Boolean; c: PVectorArray);
    destructor Destroy;
  end;

function LSDecomposition(DataMatr: TVectorArray; Slib: TMatrix; lsopts: TDecompositionOptions;
          out Copt, R: TMatrix; out lsout: TDecompositionOutput): Boolean;
function ConstrainedLSDecomposition(DataMatr: TVectorArray; Slib, Aeq: TMatrix; beq: TVector; lsopts: TDecompositionOptions;
          out Copt, R: TMatrix; out lsout: TDecompositionOutput): Boolean;
procedure CLS(AtA: TMatrix; AtB: TVector; out x: TVector);
procedure NNLS(AtA: TMatrix; AtB: TVector; out x: TVector);
procedure CloseCondition(var C: TMatrix; c0: Double = 1.0); overload;
procedure CloseCondition(var C: TVector; c0: Double = 1.0); overload;
procedure NonNegativityForseToZero(var A: TMatrix); overload;
procedure NonNegativityForseToZero(var A: TVector); overload;
procedure DecompositionQuality(DataMatr: TVectorArray; Slib, Copt: TMatrix; out R: TMatrix; out lsout: TDecompositionOutput);
function VectorArrayToMatrix(V: TVectorArray): TMatrix;

implementation

uses SysUtils;

const MThreadss = 4;
// Classical Least Squares (CLS)
procedure CLS(AtA: TMatrix; AtB: TVector; out x: TVector);
begin

  x := AtA.LUSystemMax(Atb);

end;

// Closure Condition (Normalization)
procedure CloseCondition(var C: TMatrix; c0: Double = 1.0);
var n, m, i, j, k: Integer;
    scol: Double;
    alpha: Double;
begin

  n := C.Width;
  m := C.Height;

  for j:=0 to m-1 do
    for i:=0 to n-1 do
      begin
        scol := C.ColumnSum(i);
        alpha:= scol/c0;

        for k:=0 to n-1 do
          C[k,j] := C[k, j] / alpha;

      end;

end;

// NonNegativity
procedure NonNegativityForseToZero(var A: TMatrix);
var n, m, i, j: Integer;
begin
  n := A.Width;
  m := A.Height;

  for i:=0 to n-1 do
    for j:=0 to m-1 do
      if (A[i,j] < 0) then
        A[i,j] := 0.0;
end;

procedure CloseCondition(var C: TVector; c0: Double = 1.0);
var n, i: Integer;
    sum: Double;
    alpha: Double;
begin
  n := C.Length;


  sum := C.Sum;
  alpha:= sum/c0;
    for i:=0 to n-1 do
          C[i] := C[i] / alpha;
end;

procedure NonNegativityForseToZero(var A: TVector);
var i, n: Integer;
begin
  n := A.Length;

  for i:=0 to n-1 do
    if (A[i] < 0) then
      A[i] := 0.0;
end;


// Non-Negative Least Squares
procedure NNLS(AtA: TMatrix; AtB: TVector; out x: TVector);
var P: TInt; // indexes of non-zero elements
    Z: TInt; // indexes of zero elements;
    AtAP: TMatrix;
    AtAx: TVector;
    tol: Double;
    lenP: Integer;
    lenZ: Integer;
    w: TVector; // dual vector
    zz: TVector; // work vector
    iter: Integer;
    maxiter: Integer;
    subiter: Integer;
    maxsubiter: Integer;
    itermax: Integer;
    subitermax: Integer;
    n: Integer;
    i, j, k, q: Integer;
    v: Double;
    alpha: Double;
    upd: Boolean;
begin

  n := AtA.Width;

  //-----------------------------------
  //w := TVector.Create(n);
  zz:= TVector.Create(n);
  AtAx := TVector.Create(n);
  AtAP := TMatrix.Create(n, n);
  AtAP.SetValue(0.0);

  SetLength(P, n);
  SetLength(Z, n);

  //-----------------------------------

  tol := 1e-10*n*AtA.Norm1; // tolerance

  maxiter:=100*n;         //3
  maxsubiter:=200*n;     //5

  itermax:=0;
  subitermax:=0;

  iter:=0;
  subiter:=0;

  //-------------------------------------

  // Step 1

  lenP := 0;
  lenZ := n;

  x.SetValue(0.0);

  for i:=0 to n-1 do
    begin
      Z[i] := i;
     // P[i] := 0;
    end;

  // Step 2

  w := AtB;

  repeat // main loop
    if iter>=maxiter then
    begin
     // raise EMathError.CreateFmt('NNLS: The maximum allowed number of iterations %d has been exceeded for TOL=%e',[maxiter,tol]);
     break;
    end;

    iter := iter+1;
    if iter > itermax then
      itermax := iter;

    v := 0;
    for i:=0 to lenZ-1 do
      begin
        k := Z[i];
        if w[k]>v then
          begin
            v := w[k];
            j := k;
            q := i;
          end;
      end;

    if v <= tol then
      Break;
    if lenZ > 1 then
      begin
        Z[q]:=Z[lenZ-1]; // remove Z[q] - replace it with the last item in Z
      end;

    lenZ := lenZ - 1;
    P[lenP] := j;
    lenP := lenP+1;

    while True do
      begin
        if subiter >= maxsubiter then
          begin
           // raise EMathError.CreateFmt('NNLS: The maximum allowed number of internal iterations %d has been exceeded at iter %d for TOL=%e',[maxsubiter,iter,tol]);
            break;
          end;

        subiter := subiter+1;
        if subiter > subitermax then
          subitermax := subiter;

        if lenP = 0 then
          Break;

        for i:=0 to lenP-1 do
          begin
            k:=P[i];

            for j:=0 to lenP-1 do
              begin
                AtAP[i,j]:=AtA[k,P[j]];
              end;
            zz[i] := AtB[k];
          end;

       // zz := AtAP.LUSystemMax(zz); // !!!
       AtAP.LUSystemMaxInPlace(zz);

        upd := false;
        for i:=0 to lenP-1 do
          begin
            if zz[i] <= -tol then
              begin
                k := P[i];
                v := x[k]/(x[k]-zz[i]);
                if not upd or (v<alpha) then
                  begin
                    upd := true;
                    alpha := v;
                  end;
              end;
          end;

         if upd then
          begin
            for i := 0 to lenP-1 do
              begin
                k := P[i];
                x[k] :=x [k]+alpha*(zz[i]-x[k]);
              end;
            for i:=0 to lenZ-1 do
              begin
                k := Z[i];
                x[k] := x[k] - alpha*x[k];
              end;
            i := lenP-1;
            while i >= 0 do
              begin
                k := P[i];
                if Abs(x[k]) <= tol then
                  begin
                    Z[lenZ] := P[i]; // append P[i] to the end of Z
                    lenZ := lenZ+1;
                    lenP := lenP-1;
                    if i < lenP then
                      begin
                        P[i] := P[lenP]; // remove P[i] - replace it with the last item
                      end;
                  end;
                i := i-1;
              end;
          end
         else
          begin
            for i:=0 to lenP-1 do
              begin
                k:=P[i];
                x[k]:=zz[i];
              end;
            for i:=0 to lenZ-1 do
              begin
                k:=Z[i];
                x[k]:=0;
              end;
            Break;
          end;
      end;

    if lenZ = 0 then
      Break;

    AtAx := AtA.MultByVector(x);

    w := AtB.Sub(AtAx);

    AtAx.Free;

  until False;

   AtAP.Free;

   w.Free;
   zz.Free;

   SetLength(Z,0);
   SetLength(P,0);

end;

// Least Squares Decomposition
function LSDecomposition(DataMatr: TVectorArray; Slib: TMatrix; lsopts: TDecompositionOptions;
          out Copt, R: TMatrix; out lsout: TDecompositionOutput): Boolean;
var n, m, nc, i, j: Integer;
    Slibt, AtA: TMatrix;
//    AtB: TVector;
    c: TVectorArray;
    d: TMultiThreadDecomposition;
    Threads : array[0..MThreadss-1] of TMultiThreadDecomposition;
    Handles : array[0..MThreadss-1] of THandle;
    start, stop, elapsed: Cardinal;
begin

 // Result := False;

  n := Length(DataMatr);   // Number of measured spectra

  nc := Slib.Height;       // Number of library spectra

  m := Slib.Width;         // Wavelength number

  Slibt := Slib.TransMatrix;

  AtA := Slibt.MultByMatrix(Slib);

  SetLength(c, n);
  for i:=0 to n-1 do
    c[i] := TVector.Create(nc);

   start := GetTickCount;
  for i:=0 to Min(MThreadss,n)-1 do begin
    Threads[i] := TMultiThreadDecomposition.Create(i, @DataMatr, Slibt, AtA, Min(MThreadss,n), lsopts.CLS, @c);
    Threads[i].Priority := tpHigher;
    Handles[i] := Threads[i].Handle;
  end;

  WaitForMultipleObjects(Min(MThreadss,n), @Handles, True, INFINITE);
  stop := GetTickCount;
  elapsed := stop - start;
  //Form1.Memo1.Lines.Add('t = '+IntToStr(elapsed) + ' ms');

   for i:=0 to n-1 do
    begin
   //   AtB := Slibt.MultByVector(DataMatr[i]);
      if lsopts.CLS then
        begin
  //        CLS(AtA, AtB,c);

          if lsopts.CLSopt.NonNegativity then
            NonNegativityForseToZero(c[i]);
          if lsopts.CLSopt.Closure then
            CloseCondition(c[i]);

        end
      else
        begin
  //        c := TVector.Create(nc);
  //        NNLS(AtA, AtB,c);

          if lsopts.NNLSopt.Closure then
            CloseCondition(c[i]);
        end;

      for j := 0 to nc-1 do
        Copt[i,j] := c[i][j];
 //     AtB.Free;
      c[i].Free;
    end;

    DecompositionQuality(DataMatr,  Slib, Copt, R, lsout);

    if lsopts.CLS then
      lsout.tag := '_CLS'
    else
      lsout.tag := '_NNLS';

    Result := True;  

    Slibt.Free;
    AtA.Free;
    SetLength(c, 0);

end;

function VectorArrayToMatrix(V: TVectorArray): TMatrix;
var n, m, i, j: Integer;
begin

  n := Length(V);
  m := V[0].Length;
  Result := TMatrix.Create(n,m);

  for i := 0 to n-1 do
    for j := 0 to m-1 do
      Result[i,j] := V[i].Item[j];
end;

procedure DecompositionQuality(DataMatr: TVectorArray; Slib, Copt: TMatrix;  out R: TMatrix;
                              out lsout: TDecompositionOutput);
var D, Dmod, S: TMatrix;
    n, m: Integer;
    ernorm, dnorm: Double;
begin
  n := Length(DataMatr);
  m := Slib.Width;


  D := VectorArrayToMatrix(DataMatr);
  S := Slib.TransMatrix;

  Dmod := Copt.MultByMatrix(S); //Slib.MultByMatrix(C);
  R := D.SubMatrix(Dmod);

  ernorm := R.Norm2;
  dnorm := D.Norm2;

  lsout.lof := 100*ernorm/dnorm;
  lsout.VarianceExplained := 100 - lsout.lof;
  lsout.RMSE := ernorm/sqrt(n*m);

  D.Free;
  Dmod.Free;
  S.Free;

end;

// Constrained Least Squares Decomposition (Linear equality-constraints)
function ConstrainedLSDecomposition(DataMatr: TVectorArray; Slib, Aeq: TMatrix; beq: TVector; lsopts: TDecompositionOptions;
          out Copt, R: TMatrix; out lsout: TDecompositionOutput): Boolean;
var n, m, np, nc, i, j: Integer;
    Slibt, AtA, A: TMatrix;
    AtB, b: TVector;
    c: TVector;
begin

 // Result := False;

  n := Length(DataMatr);   // Number of measured spectra

  nc := Slib.Height;       // Number of library spectra

  m := Slib.Width;         // Wavelength number

  np := Aeq.Width; // Number of equality constrainets

  Slibt := Slib.TransMatrix;

  AtA := Slibt.MultByMatrix(Slib);

  A := TMatrix.Create(nc+np,nc+np);
  A.SetValue(0.0);

  for i:=0 to nc+np-1 do begin
    if i<nc then begin
      for j:=0 to nc+np-1 do begin
        if j<nc then
          A[i,j] := 2*AtA[i,j]
        else
          A[i,j] := Aeq[j-nc,i];
      end;
    end else begin
      for j:=0 to nc+np-1 do begin
        if j<nc then
          A[i,j] := Aeq[i-nc,j];
      end;
    end;
   end;

   for i:=0 to n-1 do
    begin
      AtB := Slibt.MultByVector(DataMatr[i]);
      b := TVector.Create(nc+np);
      for j:=0 to nc+np-1 do begin
        if j<nc then
          b[j] := 2*AtB[j]
        else
          b[j] := beq[j-nc];
      end;
      if lsopts.CLS then
        begin
          CLS(A, b, c);

          if lsopts.CLSopt.NonNegativity then
            NonNegativityForseToZero(c);

        end
      else
        begin
          c := TVector.Create(nc+np);
          NNLS(A, b,c);
        end;

      for j := 0 to nc-1 do
        Copt[i,j] := c[j];
      AtB.Free;
      b.Free;
      c.Free;
    end;

    DecompositionQuality(DataMatr,  Slib, Copt, R, lsout);

    if lsopts.CLS then
      lsout.tag := '_CLS'
    else
      lsout.tag := '_NNLS';

    Result := True;  

    Slibt.Free;
    AtA.Free;
    A.Free;

end;

constructor TMultiThreadDecomposition.Create(id: Integer; data: PVectorArray; At, AtA: TMatrix; MMThreads: Cardinal;iscls: Boolean; c: PVectorArray);
var i, j,k, n, m1, m2: Integer;
begin
  inherited Create(False);
  FreeOnTerminate := True;

  fid := id;
  MaxThreads := MMThreads;
  fdata := data;
  fc := c;
  fAt := At;
  fAtA := AtA;
  fcls := iscls;

end;

procedure TMultiThreadDecomposition.Execute;
var
  n, nt, n1, n2, i, j:Integer;
  AtB: TVector;
  v: TInt;
begin
  n := Length(fdata^);
  if n=0 then Exit;

  nt:=n div MaxThreads;

  if n mod MaxThreads>0 then inc(nt);
  n1:=nt*fid;

  if n1>=n then Exit;
  n2:=n1+nt;

  if n2>n then n2:=n;

  if fcls then begin
    For i:=n1 to n2-1 do  begin

      AtB := fAt.MultByVector(fdata^[i]);
      NNLS(fAtA, AtB, fc^[i]);
      AtB.Free;
    end;
  end else begin
    fAtA.LUDecompositionMax(v);
    For i:=n1 to n2-1 do  begin
      AtB := fAt.MultByVector(fdata^[i]);
      fAtA.LUSystemMax(v, AtB, fc^[i]);
      AtB.Free;
    end;
  end;
end;

destructor TMultiThreadDecomposition.Destroy;
begin

  inherited Destroy;
  fAt.Free;
  fAtA.Free;

end;

end.
