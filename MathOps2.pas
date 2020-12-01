unit MathOps2;

interface
uses NumArray, SDL_math2, SDL_vector, System.Math, NumIPP;

procedure sgolayfilt(Src:TNumArray1<Single>; var Dst:TNumArray1<Single>; WindowSize: integer);
procedure baseLineWheel(valSpectra, tmp, wheel:TNumArray1<Single>; firstPix, lastPix:integer );

implementation



// Savitzky-Golay smoothing method
//WindowSize may take values between 5 and 25 and has to be an odd number

procedure sgolayfilt(Src:TNumArray1<Single>; var Dst:TNumArray1<Single>; WindowSize: integer);
var SrcV, DstV:TVector;
    i,first, last:integer;
begin
   SrcV:=TVector.Create(nil);
   SrcV.NrOfElem :=Src.Length;
   DstV:=TVector.Create(nil);
   DstV.NrOfElem :=Src.Length;

//   first:= trunc(WindowSize/2)+1;
//   last:=Src.Length-(trunc(WindowSize/2)-1);
   first:= 0;
   last:=Src.Length-1;


   for i := 0 to Src.Length-1 do
     SrcV.Elem[i] := Src[i];

   PolynomialSmooth(SrcV, first, last, DstV, WindowSize);

   for i := 0 to Src.Length-1 do
     Dst[i]:= DstV.Elem[i];

   SrcV.Free;
   DstV.Free;
end;


procedure baseLineWheel(valSpectra, tmp, wheel:TNumArray1<Single>; firstPix, lastPix:integer );
var i, j, lR, rR, radius, exLen:Integer;
    data, dataBG:TNumArray1<Single> ;
    dif, minDif :Single;

begin
    radius:=  (wheel.Length-1) div 2;

    exLen:= valSpectra.Length + Radius;

    data:=TNumArray1<Single>.Create(exLen) ;
    dataBG:=TNumArray1<Single>.Create(exLen) ;

    for i := 0 to valSpectra.Length-1 do
        data[i]:=valSpectra[i];

    for i := valSpectra.Length to exLen -1 do
        data[i]:=valSpectra[valSpectra.Length-1];


    NumSet(-999.0, dataBG);

     if firstPix>0 then
     for i := 0  to firstPix-1 do
       tmp[i] := 0.0;

     if lastPix < tmp.Length-1 then
     for i := lastPix+1 to tmp.Length-1 do
       tmp[i]:=0.0;



     for i := firstPix to exLen-1 do
       begin

        lR := max(i-radius, firstPix);
        rR := min(i+radius, exLen-1);

        minDif := data[lR] + radius - wheel[radius -(i-lR)];

        for j := lR to rR do
            begin
                dif:= data[j] + radius - wheel[radius - (i-j)] ;
                if (minDif > dif) then
                    minDif := dif;
            end;


        for j := lR to rR do
            begin
              if (dataBG[j] < wheel[radius -(i-j)]- (radius - minDif))  then
              begin
                dataBG[j] := wheel[radius -(i-j)]- ( radius - minDif);
              end;
            end;

       end;


       for  i := firstPix to lastPix do
            tmp[i] := data[i]- dataBG[i];


     data.Free;
     dataBG.Free;

end;



end.
