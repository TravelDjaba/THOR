unit NumIPP;

interface

uses Classes, Types,  NumArray, dialogs,System.SysUtils,
 ippdefs, ippcore, ipps ;

 procedure NumConvert32s_32f(Src: TNumArray2<Integer>; Dst: TNumArray2<Single>); inline;
 procedure NumConvert32f_8u(Src: TNumArray2<Single>; Dst: TNumArray2<byte>); inline;

 procedure NumMinMax(Src: TNumArray2<Single>; var min, max:Single );  inline; overload;
 procedure NumMinMax(Src: TNumArray1<Single>; var min, max:Single );  inline; overload;


 procedure NumNormalize(Src, Dst: TNumArray2<single>; vSub, vDiv:Single); inline;
 procedure NumNormalizeI(SrcDst: TNumArray2<single>; vSub, vDiv:Single); inline;

 procedure NumCopy(Src, Dst: TNumArray1<single>); inline; overload;
 procedure NumCopy(Src, Dst: TNumArray2<single>); inline; overload;
 procedure NumCopy(Src, Dst: TNumArray1<double>); inline; overload;
 procedure NumCopy(Src, Dst: TNumArray2<double>); inline; overload;

 procedure NumAdd(Src, SrcDst : TNumArray1<single>); inline;

 procedure NumMul(SrcDst, Multiplier: TNumArray1<single>); inline;

 procedure NumMulC(Src, Dst: TNumArray1<single>; Multiplier:single); inline; overload;
 procedure NumMulC(SrcDst: TNumArray1<single>; Multiplier:single); inline; overload;
 procedure NumMulC(SrcDst: TNumArray2<single>; Multiplier:single); inline; overload;

 procedure NumSet(Value:single; Dst: TNumArray2<single>); inline; overload;
 procedure NumSet(Value:single; Dst: TNumArray1<single>); inline; overload;
 procedure NumSet(Value:byte; Dst: TNumArray2<byte>); inline; overload;

 procedure NumSub(Src, SrcDst: TNumArray2<single>); inline; overload;
 procedure NumSub(Src, SrcDst: TNumArray2<double>); inline; overload;

 procedure NumSub(Src1, Src2, Dst : TNumArray2<single>); inline; overload;
 procedure NumSub(Src1, Src2, Dst : TNumArray2<double>); inline; overload;
 procedure NumSub(Src1, Src2, Dst : TNumArray1<double>); inline; overload;

 procedure NumSubCRev(val:Single; SrcDst : TNumArray2<single>); inline;

 procedure NumDiv( SrcDst, Divisor: TNumArray1<single>); inline;

 procedure NumStdDev(Src:TNumArray1<single>; var sDev:Single  ); inline;
 procedure NumMean(Src:TNumArray1<single>; var sMean:Single  ); inline;

procedure NumZero(Dst:TNumArray1<Single>); overload;
procedure NumZero(Dst:TNumArray1<Double>); overload;
procedure NumZero(Dst:TNumArray2<Single>); overload;
procedure NumZero(Dst:TNumArray2<Double>); overload;
procedure NumZero(Dst:TNumArray2<Word>); overload;
procedure NumZero(Dst:TNumArray2<LongInt>); overload;
procedure NumZero(Dst:TNumArray2<Int64>); overload;

function NumNorm1(Src:TNumArray1<Double>):Double; overload;
function NumNorm1(Src:TNumArray2<Double>):Double; overload;


implementation

 procedure NumConvert32s_32f(Src: TNumArray2<Integer>; Dst: TNumArray2<Single>);
   begin
    ippsConvert_32s32f(Src.Buffer, Dst.Buffer, Src.Count);
   end;

 procedure NumConvert32f_8u(Src: TNumArray2<Single>; Dst: TNumArray2<byte>);
   begin
    ippsConvert_32f8u_Sfs(Src.Buffer, Dst.Buffer, Src.Count, ippRndZero, 0);
   end;

 procedure NumMinMax(Src: TNumArray2<Single>; var min, max:Single );
   begin
    ippsMinMax_32f(Src.Buffer, Src.Count, min, max);
   end;

 procedure NumMinMax(Src: TNumArray1<Single>; var min, max:Single );
   begin
    ippsMinMax_32f(Src.Buffer, Src.Count, min, max);
   end;

 procedure NumNormalize(Src,Dst: TNumArray2<single>;  vSub, vDiv:Single);
  begin
   ippsNormalize_32f(Src.Buffer, Dst.Buffer, Src.Count, vSub, vDiv );
  end;

  procedure NumNormalizeI(SrcDst: TNumArray2<single>; vSub, vDiv:Single); inline;
  begin
  ippsNormalize_32f(SrcDst.Buffer, SrcDst.Buffer, SrcDst.Count, vSub, vDiv );
  end;

  procedure NumCopy(Src, Dst: TNumArray1<single>);
  begin
   ippsCopy_32f(Src.Buffer, Dst.Buffer, Src.Count);
  end;

  procedure NumCopy(Src, Dst: TNumArray2<single>); inline;
  begin
  ippsCopy_32f(Src.Buffer, Dst.Buffer, Src.Count);
  end;

  procedure NumCopy(Src, Dst: TNumArray1<double>);
  begin
   ippsCopy_64f(Src.Buffer, Dst.Buffer, Src.Count);
  end;

  procedure NumCopy(Src, Dst: TNumArray2<double>); inline;
  begin
  ippsCopy_64f(Src.Buffer, Dst.Buffer, Src.Count);
  end;


  procedure NumAdd(Src, SrcDst : TNumArray1<single>); inline;
  begin
  ippsAdd_32f_I(Src.Buffer, SrcDst.Buffer, Src.Count);
  end;

  procedure NumMul(SrcDst, Multiplier: TNumArray1<single>);
  begin
   ippsMul_32f_I( Multiplier.Buffer, SrcDst.Buffer, SrcDst.Count);
  end;

  procedure NumMulC(SrcDst: TNumArray1<single>; Multiplier:single); inline;
  begin
    ippsMulC_32f_I(Multiplier, SrcDst.Buffer, SrcDst.Count);
  end;

  procedure NumMulC(SrcDst: TNumArray2<single>; Multiplier:single);
  begin
    ippsMulC_32f_I(Multiplier, SrcDst.Buffer, SrcDst.Count);
  end;

  procedure NumMulC(Src, Dst: TNumArray1<single>; Multiplier:single);
  begin
    ippsMulC_32f(Src.Buffer,Multiplier, Dst.Buffer, Src.Count );
  end;

  procedure NumSet(Value:single; Dst: TNumArray2<single>); inline;
  begin
    ippsSet_32f(Value, Dst.Buffer, Dst.Count);
  end;

  procedure NumSet(Value:single; Dst: TNumArray1<single>); inline; overload;
  begin
    ippsSet_32f(Value, Dst.Buffer, Dst.Count);
  end;

  procedure NumSet(Value:Byte; Dst: TNumArray2<byte>); inline;
  begin
  ippsSet_8u(Value, Dst.Buffer, Dst.Count);
  end;

  procedure NumSub(Src, SrcDst : TNumArray2<single>); inline;
  begin
    ippsSub_32f_I( Src.Buffer, SrcDst.Buffer, SrcDst.Count);
  end;

  procedure NumSub(Src, SrcDst : TNumArray2<double>); inline;
  begin
    ippsSub_64f_I( Src.Buffer, SrcDst.Buffer, SrcDst.Count);
  end;


  procedure NumSub(Src1, Src2, Dst : TNumArray2<single>); inline;
  begin
    ippsSub_32f( Src1.Buffer, Src2.Buffer, Dst.Buffer, Src1.Count);
  end;

  procedure NumSub(Src1, Src2, Dst : TNumArray2<double>); inline;
  begin
    ippsSub_64f( Src1.Buffer, Src2.Buffer, Dst.Buffer, Src1.Count);
  end;

  procedure NumSub(Src1, Src2, Dst : TNumArray1<double>); inline;
  begin
    ippsSub_64f( Src1.Buffer, Src2.Buffer, Dst.Buffer, Src1.Count);
  end;

  procedure NumSubCRev(val:Single; SrcDst : TNumArray2<single>); inline;
  begin
    ippsSubCRev_32f_I(val, SrcDst.Buffer, SrcDst.Count );
  end;

  procedure NumDiv( SrcDst, Divisor: TNumArray1<single>); inline;
  begin
    ippsDiv_32f_I(Divisor.Buffer, SrcDst.Buffer, SrcDst.Length);
  end;

 procedure NumStdDev(Src:TNumArray1<single>; var sDev:Single  ); inline;
  begin
   ippsStdDev_32f(Src.Buffer, Src.Count, sDev, ippAlgHintFast );
  end;

 procedure NumMean(Src:TNumArray1<single>; var sMean:Single  ); inline;
  begin
   ippsMean_32f(Src.Buffer, Src.Count, sMean, ippAlgHintFast );
  end;

procedure NumZero(Dst:TNumArray1<Single>); inline;
begin
  ippsZero_32f(Dst.Buffer,Dst.Count);
end;

procedure NumZero(Dst:TNumArray1<Double>); inline;
begin
  ippsZero_64f(Dst.Buffer,Dst.Count);
end;

procedure NumZero(Dst:TNumArray2<Single>); inline;
begin
  ippsZero_32f(Dst.Buffer,Dst.Count);
end;

procedure NumZero(Dst:TNumArray2<Double>); inline;
begin
  ippsZero_64f(Dst.Buffer,Dst.Count);
end;

procedure NumZero(Dst:TNumArray2<Word>); inline;
begin
  ippsZero_16s(Dst.Buffer,Dst.Count);
end;

procedure NumZero(Dst:TNumArray2<LongInt>); inline;
begin
  ippsZero_32s(Dst.Buffer,Dst.Count);
end;

procedure NumZero(Dst:TNumArray2<Int64>); inline;
begin
  ippsZero_64s(Dst.Buffer,Dst.Count);
end;

function NumNorm1(Src:TNumArray1<Double>):Double; inline;
begin
  ippsNorm_L1_64f(Src.Buffer,Src.Count,Result);
end;

function NumNorm1(Src:TNumArray2<Double>):Double; inline;
begin
  ippsNorm_L1_64f(Src.Buffer,Src.Count,Result);
end;

end.
