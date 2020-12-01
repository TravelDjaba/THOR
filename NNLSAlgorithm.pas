unit NNLSAlgorithm;

interface

uses
  NumArray, MathOps;

{
  [1] Lawson C.L., Hanson R.J. - Solving Least Squares Problems (1995), Chap. 23, p. 161
  [2] 1997 Bro, de Jong - A fast non-negativity-constrained least squares algorithm
  [3] 2011 Luo, Duraiswami - Efficient Parallel Nonnegative Least Squares on Multicore Architectures
}

type
  TFastNNLS = class(TObject)
  private
    ldivwork: TNumArray1<Double>;
  public // private
    AtAP: TNumArray2<Double>;
    tol: double;
    lenP: integer;
    lenZ: integer;
    P: TNumArray1<Integer>;
    Z: TNumArray1<Integer>;
    w: TNumArray1<Double>;
    s: TNumArray1<Double>;
  public
    iter: integer;
    maxiter: integer; //!
    subiter: integer;
    maxsubiter: integer;
    itermax: integer;
    subitermax: integer;
    //AtA: TNumArray2<Double>;
    //Atb: TNumArray1<Double>;
    //x: TNumArray1<Double>;
  public
    constructor Create(m,n:integer; Layout:boolean=True);
    destructor Destroy; override;
    procedure Compute(AtA:TNumArray2<Double>; Atb:TNumArray1<Double>; x:TNumArray1<Double>);
  end;

implementation

uses
  NumIPP,// NumOps,
  SysUtils;

constructor TFastNNLS.Create(m,n:integer; Layout:boolean=True);
var lwork:integer;
begin
  //x:=TNumArray1<Double>.Create(n,Layout);
  //Atb:=TNumArray1<Double>.Create(n,Layout);
  //AtA:=TNumArray2<Double>.Create(n,n,Layout);

  AtAP:=TNumArray2<Double>.Create(n,n,Layout);

  P:=TNumArray1<Integer>.Create(n,Layout);
  Z:=TNumArray1<Integer>.Create(n,Layout);
  w:=TNumArray1<Double>.Create(n,Layout);
  s:=TNumArray1<Double>.Create(n,Layout);

  lwork:=FortranMatrixLDivideWorkSize(AtAP,s);
  ldivwork:=TNumArray1<Double>.Create(lwork,True);

  itermax:=0;
  subitermax:=0;
end;

destructor TFastNNLS.Destroy;
begin
  ldivwork.Free;

  s.Free;
  w.Free;
  Z.Free;
  P.Free;

  AtAP.Free;

  //AtA.Free;
  //Atb.Free;
  //x.Free;
end;

procedure TFastNNLS.Compute(AtA:TNumArray2<Double>; Atb:TNumArray1<Double>; x:TNumArray1<Double>);
var
  n: integer;
  i: integer;
  v: double;
  j,k,q: integer;
  alpha: double;
  upd: boolean;
begin
  n:=AtAP.Width;

  //? why *n?
  //1000000000000
  //1000000000
  tol:=1*Eps(AtA)*NumNorm1(AtA)*n; // eps*Sum(|x|)*Max(m,n)

  //?
  maxiter:=2*n; //! make adjustable
  maxsubiter:=2*n;

  iter:=0;
  subiter:=0;

//   1  A1   R
  lenP:=0;
//      A2
  for i:=0 to n-1 do
    Z[i]:=i;
  lenZ:=n;
//      A3
  NumZero(x);
//   2  A4   2
  //MatrixVectorMul(AtA,x,w);
  //NumSub(Atb,w,w);
  NumCopy(Atb,w); // optimized for first iteration
//           1
  repeat

    if iter>=maxiter then begin
      raise EMathError.CreateFmt('FastNNLS: The maximum allowed number of iterations %d has been exceeded for TOL=%e',[maxiter,tol]);
    end;
    iter:=iter+1;
    if iter>itermax then itermax:=iter;

//   3  B1   3
    //if lenZ=0 then break; // moved to the end of the loop
    v:=0; // < tol
    for i:=0 to lenZ-1 do begin
      k:=Z[i];
      if w[k]>v then begin
        v:=w[k];
//   4  B2   4
        j:=k;
        q:=i;
      end;
    end;
//          19
    if v<=tol then break;
//   5  B3   5
    if lenZ>1 then begin
      Z[q]:=Z[lenZ-1]; // remove Z[q] - replace it with the last item in Z
    end;
    lenZ:=lenZ-1;
    P[lenP]:=j;
    lenP:=lenP+1;
//           6
    while true do begin

      if subiter>=maxsubiter then begin
        raise EMathError.CreateFmt('FastNNLS: The maximum allowed number of internal iterations %d has been exceeded at iter %d for TOL=%e',[maxsubiter,iter,tol]);
      end;
      subiter:=subiter+1;
      if subiter>subitermax then subitermax:=subiter;

      if lenP=0 then break; // protect
      
//   6  B4,C5
//           7
      for i:=0 to lenP-1 do begin
        k:=P[i];
        for j:=0 to lenP-1 do begin
          AtAP[i,j]:=AtA[k,P[j]];
        end;
        s[i]:=Atb[k];
      end;
//           8
      //MatrixLDivideSquarePartial(AtAP,s,lenP);
      FortranMatrixLDivideSquarePartial(AtAP,s,lenP,ldivwork);
// 8-9  C2  10
      upd:=false;
      for i:=0 to lenP-1 do begin
        if s[i]<=-tol then begin // important
          k:=P[i];
          v:=x[k]/(x[k]-s[i]);
          if not upd or (v<alpha) then begin
            upd:=true;
            alpha:=v;
          end;
        end;
      end;
//   7  C1   9
      if upd then begin
//  10  C3  11
        for i:=0 to lenP-1 do begin
          k:=P[i];
          x[k]:=x[k]+alpha*(s[i]-x[k]);
        end;
        for i:=0 to lenZ-1 do begin
          k:=Z[i];
          x[k]:=x[k]-alpha*x[k];
        end;
//  11  C4  12
        i:=lenP-1;
        while i>=0 do begin
          k:=P[i];
          if Abs(x[k])<=tol then begin
            Z[lenZ]:=P[i]; // append P[i] to the end of Z
            lenZ:=lenZ+1;
            lenP:=lenP-1;
            if i<lenP then begin
              P[i]:=P[lenP]; // remove P[i] - replace it with the last item
              // no need to proccess a new P[i] value, because it is taken from back
            end;
          end;
          i:=i-1;
        end;
//          13
      end else begin
//   7  B5  14
        for i:=0 to lenP-1 do begin
          k:=P[i];
          x[k]:=s[i];
        end;
//      C6
        for i:=0 to lenZ-1 do begin
          k:=Z[i];
          x[k]:=0;
        end;
//          15
        break;
//          16
      end;
//          17
    end;
//   3  B1   3
//          19
    if lenZ=0 then break;
//   2  B6   2
    //MatrixVectorMul(AtA,x,w);
    FortranMatrixVectorMul(AtA,x,w);
    NumSub(Atb,w,w);

//          21
  until false;
end;

end.
