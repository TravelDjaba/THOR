unit FrameData;

interface
uses
   Classes, NumArray, NumIPP, System.Threading, System.SyncObjs, System.IniFiles, System.SysUtils,
   Vcl.Forms,  devAndor, ap, ratint, polint,
   VclTee.TeeGDIPlus, VCLTee.TeEngine, VCLTee.Series, VCLTee.TeeProcs, VCLTee.Chart, Vcl.Dialogs ;

const lineLen=256;

type TXscaleUnits = (xsPixels=0, xsNm=1, xsCm=2);
type TYscaleUnits = (ysADU=0, ysWatt=1, ysPhotons=2, ysWattRelative=3, ysPhotonsRelative=4, ysCrossSection=5, ysCrossSectionSERS=6);

type TLineCorr = record
     usedType:Integer; //0 - None, 1 - Def, 2 - Usr
     Def, Usr: TNumArray1<Single>;
     end;

type
    TFrameData = class (TPersistent)
    private
      fAllocated:Boolean;
      fGraphLeft, fGraphRight:Double;
      fUseCalY:Boolean;

      P, PY : BarycentricInterpolant;
      procedure Log(str: string);


    public
      lineCorr:TLineCorr;

      DataS, DataSnorm, DataBG, CalcData:TNumArray2<Single>;
      DataBGarray:array of TNumArray2<Single>;
      ImageData:TNumArray2<byte>;
      AndorQE:TNumArray1<Single>;
      CalYsized:TNumArray1<Single>;
      minV, maxV:Single;

      ScalePix, ScaleNm, ScaleCm:TNumArray1<Single>;
      ScaleCalY:TNumArray1<Single>;

      LaserNm:Single;
      LaserNm1,LaserNm2:Single;


      PowerOnSample:Single;  //Calculated power

      //CrossSection
      csNA:Single;
      csDensity:Single;
      csRI:Single;
      csPSF:Single;
      csMolecularWeight:Single;
      csSERSmonolayer:Single;

      csSystemThroughput:Single;
      csSampleAttenuation:Single;


      constructor Create(AOwner: TComponent);
      destructor Destroy; override;

      function AllocateCalcBuffers(const ImgWidth, ImgHeight:integer):boolean;
      property Allocated:Boolean read fAllocated;
      property GraphLeft:Double read fGraphLeft;
      property GraphRight:Double read fGraphRight;

      property UseCalY:Boolean read fUseCalY write fUseCalY;

      function NmToCm(Nm:double; laserNm:double):double;
      function CmToNm(Cm:double; laserNm:double):double;
      function pixToNm(pix:integer):double;
      function pixToCalY(pix:integer):double;


      procedure CalcXScale;
      procedure CalcCalY;

      procedure CalcQE(const cnt, binX :integer; unitType:TXscaleUnits);
      procedure CalcCalYSized(const cnt, binX :integer);

      procedure BuildPolinom(pointArray:TNumArray2<Double>);
      procedure SavePolinom;
      procedure LoadPolinom;
      procedure PlotPolinom(chart:TChart; units:integer);

      procedure BuildPolinomY(pointArray:TNumArray2<Double>);
      procedure SavePolinomY;
      procedure LoadPolinomY;
      procedure PlotPolinomY(chart:TChart; units:integer);

      procedure LoadLineCorrection;
      procedure SaveLineCorrection;
      procedure LoadLineCorrectionFromCSV(fileName:String);
      procedure CopyUsrToDefLineCorrection;

   end;


implementation

uses
  math, main, Log;

{ TFrameData }

function TFrameData.AllocateCalcBuffers(const ImgWidth, ImgHeight:integer):boolean;
var needCreate:Boolean;
begin
 fAllocated:=False;
 result:=True;

 needCreate:=False;

 if DataS=nil  then
     needCreate:=True
  else
   if (DataS.Width<> ImgWidth) or (DataS.Height<>ImgHeight) then
     begin
     DataS.Free;
     needCreate:=True;
     end;

  if needCreate then
         try
          DataS:=TNumArray2<Single>.Create(ImgHeight, ImgWidth);
         except
           DataS.Free;
           result:=False;
           Log('Allocate DataS Error');
           Exit;
         end;
//Log(Format('Allocate DataS [%d x %d]',[DataS.Width, DataS.Height ]));

if DataBG=nil  then
     needCreate:=True
  else
   if (DataBG.Width<> ImgWidth) or (DataBG.Height<>ImgHeight) then
     begin
     DataBG.Free;
     needCreate:=True;
     end;

  if needCreate then
         try
          DataBG:=TNumArray2<Single>.Create(ImgHeight, ImgWidth);
          NumSet(0.0, DataBG);
         except
           DataBG.Free;
           result:=False;
           Log('Allocate DataBG Error');
           Exit;
         end;
//Log(Format('Allocate DataBG [%d x %d]',[DataBG.Width, DataBG.Height ]));

if CalcData=nil  then
     needCreate:=True
  else
   if (CalcData.Width<> ImgWidth) or (CalcData.Height<>ImgHeight) then
     begin
     CalcData.Free;
     needCreate:=True;
     end;

  if needCreate then
         try
          CalcData:=TNumArray2<Single>.Create(ImgHeight, ImgWidth);
          NumSet(0.0, CalcData);
         except
           CalcData.Free;
           result:=False;
           Log('Allocate CalcData Error');
           Exit;
         end;
//Log(Format('Allocate CalcData [%d x %d]',[CalcData.Width, CalcData.Height ]));

 needCreate:=False;
   if DataSnorm=nil  then
     needCreate:=True
  else
    if (DataSnorm.Width<> ImgWidth) or (DataSnorm.Height<>ImgHeight) then
     begin
     DataSnorm.Free;
     needCreate:=True;
     end;

   if needCreate then
         try
          DataSnorm:=TNumArray2<Single>.Create(ImgHeight, ImgWidth);
         except
           DataSnorm.Free;
           result:=False;
           Log('Allocate DataSnorm Error');
           Exit;
         end;
//Log(Format('Allocate DataSNorm [%d x %d]',[DataSnorm.Width, DataSnorm.Height ]));

 needCreate:=False;
   if ImageData=nil  then
     needCreate:=True
  else
    if (ImageData.Width<> ImgWidth) or (ImageData.Height<>ImgHeight) then
     begin
     ImageData.Free;
     needCreate:=True;
     end;

  if needCreate then
         try
          ImageData:=TNumArray2<byte>.Create(ImgHeight, ImgWidth);
         except
           ImageData.Free;
           result:=False;
           Log('Allocate ImageData Error');
           Exit;
         end;

//Log(Format('Allocate ImageData [%d x %d]',[ImageData.Width, ImageData.Height ]));
 fAllocated:=True;
end;

procedure TFrameData.BuildPolinom(pointArray:TNumArray2<Double>);
var
    X,Y : TReal1DArray;

    N : Integer;
    I : Integer;

begin
N := pointArray.Count div 2;
    SetLength(X, N);
    SetLength(Y, N);

  for i := 0 to N-1 do
    begin
        X[i] := pointArray.Values[0,i];
        Y[i] := pointArray.Values[1,i];
    end;
    PolynomialBuild(X, Y, N, P);

    SetLength(X, 0);
    SetLength(Y, 0);
end;

procedure TFrameData.BuildPolinomY(pointArray: TNumArray2<Double>);
var
    X,Y : TReal1DArray;

    N : Integer;
    I : Integer;

begin
N := pointArray.Count div 2;
    SetLength(X, N);
    SetLength(Y, N);

  for i := 0 to N-1 do
    begin
        X[i] := pointArray.Values[0,i];
        Y[i] := pointArray.Values[1,i];
    end;
    PolynomialBuild(X, Y, N, PY);

    SetLength(X, 0);
    SetLength(Y, 0);
end;

procedure TFrameData.CalcCalY;
var
    i :Integer;
begin
for i := 0 to ScaleNm.Count-1 do
  ScaleCalY[i]:=pixToCalY(i);
end;

procedure TFrameData.CalcCalYSized(const cnt, binX: integer);
var x,y:Double;
     i:Integer;
begin
if CalYsized <> nil then CalYsized.Free;
CalYsized:=TNumArray1<Single>.Create(cnt div binX);

for i := 0 to (cnt div binX)-1 do
  CalYsized[i]:= ScaleCalY[i*binX];
end;

procedure TFrameData.CalcQE(const cnt, binX :integer; unitType:TXscaleUnits);

// data for nanaomertres
const
      a0:Double=12407.33983248;
      a1:Double=-207.08985323344;
      a2:Double=1.4692249563993;
      a3:Double=-0.0058525382914542;
      a4:Double=1.4498255794056E-5;
      a5:Double=-2.3227845967453E-8;
      a6:Double=2.4115862847858E-11;
      a7:Double=-1.5670611300047E-14;
      a8:Double=5.7903285451108E-18;
      a9:Double=-9.2795829724829E-22;

var x,y:Double;
     i:Integer;
begin
if AndorQE <> nil then AndorQE.Free;
AndorQE:=TNumArray1<Single>.Create(cnt);

for i := 0 to (cnt div binX)-1 do
   begin
   x:=ScaleNm[i*binX];//*binX;
   y:=a0 + a1*x+ a2*Power(x,2.0)+ a3*Power(x,3.0)+ a4*Power(x,4.0)
       + a5*Power(x,5.0)+ a6*Power(x,6.0)+ a7*Power(x,7.0)+ a8*Power(x,8.0)+ a9*Power(x,9.0);

   AndorQE[i]:= 100.0/y;
   end;

end;

procedure TFrameData.CalcXScale;
var
    i :Integer;
begin
for i := 0 to ScaleNm.Count-1 do
  begin
  ScalePix[i]:=i;
  ScaleNm[i]:=pixToNm(i);
  ScaleCm[i]:=NmToCm(pixToNm(i), LaserNm);
  end;
end;

function TFrameData.CmToNm(Cm, laserNm: double): double;
begin
  if (Cm<>0.0) and (laserNm<>0.0) then begin
    Result:=1/(1/laserNm-cm/1E7);
  end else begin
    Result:=0.0;
  end;
end;

procedure TFrameData.CopyUsrToDefLineCorrection;
begin
NumCopy(formMain.FrameData.lineCorr.Usr, formMain.FrameData.lineCorr.Def);
end;

constructor TFrameData.Create(AOwner: TComponent);
begin
  inherited Create;
  fAllocated:=False;
  LaserNm:=785.0;

  csSystemThroughput:=1.0;
  csSampleAttenuation:=1.0;

 ScalePix:=TNumArray1<Single>.Create(2000); //formMain.Andor.gblXPixels);
 ScaleNm:=TNumArray1<Single>.Create(2000); //formMain.Andor.gblXPixels);
 ScaleCm:=TNumArray1<Single>.Create(2000); //formMain.Andor.gblXPixels);
 ScaleCalY:=TNumArray1<Single>.Create(2000); //formMain.Andor.gblXPixels);
 NumSet(1.0,ScaleCalY);

  lineCorr.Def:=TNumArray1<Single>.Create(LineLen);
  lineCorr.Usr:=TNumArray1<Single>.Create(LineLen);
end;

destructor TFrameData.Destroy;
var i:Integer;
begin
if DataS<>nil then DataS.Free;
if CalcData<>nil then CalcData.Free;
if DataBG<>nil then DataBG.Free;

if Length(DataBGarray)>0 then
for i := 0 to Length(DataBGarray)-1 do
   DataBGarray[i].Free;

   if DataSnorm <>nil then DataSnorm.Free;
if ImageData<>nil then ImageData.Free;

 if ScalePix<>nil then ScalePix.Free;
 if ScaleNm<>nil then  ScaleNm.Free;
 if ScaleCm<>nil then  ScaleCm.Free;
 if ScaleCalY<>nil then  ScaleCalY.Free;

 if AndorQE <> nil then AndorQE.Free;
 if CalYsized <> nil then CalYsized.Free;
 lineCorr.Def.Free;
 lineCorr.Usr.Free;



 inherited;
end;

procedure TFrameData.LoadLineCorrection;

var F:TFileStream;
    data:Pointer;
    i:Integer;
    Ini:TMemIniFile;
    section:string;

begin
if not FileExists(ExtractFilePath(Application.ExeName)+'LineCorr.dat') then
  begin
  lineCorr.usedType:=0;
  NumSet(1.0, lineCorr.Def);
  NumSet(1.0, lineCorr.Usr);
  Log('Can`t load Line correction data');
  end
 else
  begin
   F:=TFileStream.Create(ExtractFilePath(Application.ExeName)+'LineCorr.dat', fmOpenRead or fmShareExclusive ) ;
   try
   F.Position:=0;
   F.ReadBuffer( lineCorr.Def.Buffer^, lineCorr.Def.UsedSize );
   F.ReadBuffer( lineCorr.Usr.Buffer^, lineCorr.Usr.UsedSize );

   finally
   FreeAndNil(F);
   end;
  end ;

      Ini:=TMemIniFile.Create(ExtractFilePath(Application.ExeName)+'Settings.ini');
      try
       section:='LineCorrection';

       with formMain.FrameData do
        begin
         lineCorr.usedType:=Ini.ReadInteger(section, 'UsedType', 0);
        end;

      finally
      Ini.Free;
      end;
end;


procedure TFrameData.LoadLineCorrectionFromCSV(fileName: String);
const lineLen=256;

var sl:TStringList;
  I: Integer;
begin
sl:=TStringList.Create;
sl.LoadFromFile(fileName);

if sl.Count=lineLen then
  for i := 0 to lineLen-1 do
   formMain.FrameData.lineCorr.Usr.Values[i]:= StrToFloatDef(sl.Strings[i], 1.0);

sl.Free;
end;

procedure TFrameData.LoadPolinom;
var
    Ini:TMemIniFile;
    section:string;
    SerialPolinom : TReal1DArray;
    j,len : Integer;
begin

   Ini:=TMemIniFile.Create(ExtractFilePath(Application.ExeName)+'Settings.ini');
      try
      section:='Polinom';
      len:=Ini.ReadInteger(section, 'num',1);
      SetLength(SerialPolinom, len);

      for j := 0 to len-1 do
         begin
         SerialPolinom[j]:= Ini.ReadFloat(section, 'coef'+IntToStr(j), j);
         end;

      BarycentricUnserialize(SerialPolinom, P);

      finally
      Ini.Free;
      end;
end;


procedure TFrameData.LoadPolinomY;
var
    Ini:TMemIniFile;
    section:string;
    SerialPolinom : TReal1DArray;
    j,len : Integer;
begin

   Ini:=TMemIniFile.Create(ExtractFilePath(Application.ExeName)+'Settings.ini');
      try
      section:='PolinomY';
      len:=Ini.ReadInteger(section, 'num',1);
      SetLength(SerialPolinom, len);

      for j := 0 to len-1 do
         begin
         SerialPolinom[j]:= Ini.ReadFloat(section, 'coef'+IntToStr(j), j);
         end;

      BarycentricUnserialize(SerialPolinom, PY);

      finally
      Ini.Free;
      end;
end;

procedure TFrameData.Log(str: string);
begin
  TTask.Run( procedure
      begin
       TThread.Synchronize( nil, procedure
          begin
          if FormLog<>nil then
          if FormLog.MemoLog<>nil then
          FormLog.MemoLog.Lines.Add('FrameData: '+str);
          end);
      end);
end;


function TFrameData.NmToCm(Nm, laserNm: double): double;
begin
    if (Nm<>0.0) and (laserNm<>0.0) then begin
      Result:=1E7/laserNm-1E7/Nm;
    end else begin
      Result:=0.0;
    end;
end;

function TFrameData.pixToCalY(pix: integer): double;
begin
result:=BarycentricCalc(PY, pix);
end;

function TFrameData.pixToNm(pix: integer): double;
begin
result:=BarycentricCalc(P, pix);
end;


procedure TFrameData.PlotPolinom(chart:TChart; units:integer);
var
    i:Integer;
begin
  chart.Series[0].Clear;

  if units=0 then  //nm
    for i := 0 to ScaleNm.Count-1 do
     chart.Series[0].AddXY(i, ScaleNm[i]);

  if units=1 then  //cm-1
   for i := 0 to ScaleCm.Count-1 do
    chart.Series[0].AddXY(i, ScaleCm[i]);

   chart.Refresh;
//  chart.Invalidate;
//  chart.Repaint;
end;

procedure TFrameData.PlotPolinomY(chart: TChart; units: integer);
var
    i:Integer;
begin
  chart.Series[0].Clear;

//  if units=0 then  //nm
    for i := 0 to ScaleCalY.Count-1 do
     chart.Series[0].AddXY(i, ScaleCalY[i]);

   chart.Refresh;

end;

procedure TFrameData.SaveLineCorrection;
const LineLen=256;

var F:TFileStream;
    data:Pointer;
    Ini:TMemIniFile;
    section, subsection:string;

begin
   F:=TFileStream.Create(ExtractFilePath(Application.ExeName)+'LineCorr.dat', fmCreate or fmShareExclusive ) ;
   try
   data:=formMain.FrameData.lineCorr.Def.Buffer;
   F.WriteBuffer(data, LineLen*SizeOf(Single) );

   data:=formMain.FrameData.lineCorr.Usr.Buffer;
   F.WriteBuffer(data, LineLen*SizeOf(Single) );

   finally
   FreeAndNil(F);
   end;

   Ini:=TMemIniFile.Create(ExtractFilePath(Application.ExeName)+'Settings.ini');
      try
       section:='LineCorrection';

       with formMain.FrameData do
        begin
         Ini.WriteInteger(section, 'UsedType', lineCorr.usedType);
        end;

      finally
      Ini.UpdateFile;
      Ini.Free;
      end;

end;

procedure TFrameData.SavePolinom;
var
    Ini:TMemIniFile;
    section:string;
    SerialPolinom : TReal1DArray;
    j,len : Integer;
begin
   BarycentricSerialize(P, SerialPolinom, len);

   Ini:=TMemIniFile.Create(ExtractFilePath(Application.ExeName)+'Settings.ini');
      try
      section:='Polinom';
      Ini.WriteInteger(section, 'num',len);

      for j := 0 to len-1 do
         begin
         Ini.WriteFloat(section, 'coef'+IntToStr(j),SerialPolinom[j]);
         end;

      finally
      Ini.UpdateFile;
      Ini.Free;
      end;

end;

procedure TFrameData.SavePolinomY;
var
    Ini:TMemIniFile;
    section:string;
    SerialPolinom : TReal1DArray;
    j,len : Integer;
begin
   BarycentricSerialize(PY, SerialPolinom, len);

   Ini:=TMemIniFile.Create(ExtractFilePath(Application.ExeName)+'Settings.ini');
      try
      section:='PolinomY';
      Ini.WriteInteger(section, 'num',len);

      for j := 0 to len-1 do
         begin
         Ini.WriteFloat(section, 'coef'+IntToStr(j),SerialPolinom[j]);
         end;

      finally
      Ini.UpdateFile;
      Ini.Free;
      end;

end;

end.
