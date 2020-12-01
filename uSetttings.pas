unit uSetttings;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, sPageControl, sTreeView,
  Vcl.StdCtrls, sCheckBox, Vcl.ExtCtrls, sPanel, editlist, sButton, iniFiles,
  AdvPanel, Vcl.Grids, sGroupBox, VclTee.TeeGDIPlus, VCLTee.TeEngine,
  VCLTee.Series, VCLTee.TeeProcs, VCLTee.Chart, sEdit, sSpinEdit, uBottomGraph,
  sDialogs, Vcl.AppEvnts, uImageGraph, sComboBoxes, sLabel, sSkinProvider,
  AdvUtil, AdvObj, BaseGrid, AdvGrid, sTabControl, sComboBox;

const CalXTypeNm  = 0;
      CalXTypeCm  = 1;
      CalXTypePix = 5;

      LasersNumber = 4;

type TLayout = record
     name:String;
     used:boolean;
     end;

    TDoublePoint=record
     X,Y:Double;
     end;

     TLaser =  record

      LaserNm:Single;
      UsedCalXType:Integer;
      CalPoints :array of array of TDoublePoint;  //0 - nm,  1 - cm-1

     end;

type
  TFormSettings = class(TForm)
    TreeSettings: TsTreeView;
    PageControlSettings: TsPageControl;
    tsLayout: TsTabSheet;
    sPanel1: TsPanel;
    cbSaveAtClose: TsCheckBox;
    lbLayouts: TEditListBox;
    btnNew: TsButton;
    btnApply: TsButton;
    btnDelete: TsButton;
    tsXcalibration: TsTabSheet;
    CalXChart: TChart;
    Series1: THorizLineSeries;
    tsOther: TsTabSheet;
    rgBackgroundType: TsRadioGroup;
    tsCrossSection: TsTabSheet;
    sGroupBox1: TsGroupBox;
    edtCSSERSMonolayer: TsDecimalSpinEdit;
    edtCSPSF: TsDecimalSpinEdit;
    edtCSRI: TsDecimalSpinEdit;
    edtCSNA: TsDecimalSpinEdit;
    sGroupBox2: TsGroupBox;
    edtCSdensity: TsDecimalSpinEdit;
    edtCSMolecularWeight: TsDecimalSpinEdit;
    btnApplyCrossSection: TsButton;
    edtCSSystemThroughput: TsDecimalSpinEdit;
    edtCSSampleAttenuation: TsDecimalSpinEdit;
    tsLineCorrection: TsTabSheet;
    rgUsedLineCorrection: TsRadioGroup;
    btnCopyUsrToDefault: TsButton;
    pnlLineCorrGraph: TsPanel;
    OpenDialog: TsOpenDialog;
    btnLoadLineCorrection: TsButton;
    tsView: TsTabSheet;
    rgAndorPalette: TsRadioGroup;
    rgMapPalette: TsRadioGroup;
    sSkinSelector1: TsSkinSelector;
    sLabel1: TsLabel;
    sSkinProvider1: TsSkinProvider;
    tsYcalibration: TsTabSheet;
    btnCalcCalibrationPolinomY: TsButton;
    sgYcalibrationCoef: TStringGrid;
    CalYChart: TChart;
    HorizLineSeries1: THorizLineSeries;
    cbUseCalibrationY: TsCheckBox;
    tsMultitrack: TsTabSheet;
    sgMultitrack: TAdvStringGrid;
    ColorDialog: TsColorDialog;
    btnApplyMultitrack: TsButton;
    tsObjective: TsTabSheet;
    rgObjective: TRadioGroup;
    sgObjective: TAdvStringGrid;
    sEdit1: TsEdit;
    btnObjApply: TsButton;
    tsExpBackground: TsTabSheet;
    sLabel2: TsLabel;
    sGroupBox3: TsGroupBox;
    edtExpStepsCountN: TsEdit;
    edtExpStartExposition: TsEdit;
    edtExpLastExposition: TsEdit;
    edtExpK: TsEdit;
    btnExpCalculate: TsButton;
    sgExpGrid: TAdvStringGrid;
    tcLasers: TsTabControl;
    edtLaserWavelengthNm: TsDecimalSpinEdit;
    rgCalXUnits: TsRadioGroup;
    sgXcalibrationCoef: TStringGrid;
    btnCalcCalibrationPolinom: TsButton;
    cboxLaserInUse: TsComboBox;
    procedure TreeSettingsClick(Sender: TObject);
    procedure cbSaveAtCloseClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lbLayoutsEditDone(Sender: TObject; var newstr: string;
      var allow: Boolean);
    procedure lbLayoutsEditStart(Sender: TObject; itemindex: Integer;
      var allow: Boolean);
    procedure btnCalcCalibrationPolinomClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure rgCalXUnitsChange(Sender: TObject);
    procedure rgBackgroundTypeChange(Sender: TObject);
    procedure btnApplyCrossSectionClick(Sender: TObject);
    procedure rgUsedLineCorrectionChange(Sender: TObject);
    procedure btnCopyUsrToDefaultClick(Sender: TObject);
    procedure btnLoadLineCorrectionClick(Sender: TObject);
    procedure rgAndorPaletteChange(Sender: TObject);
    procedure rgMapPaletteChange(Sender: TObject);
    procedure btnCalcCalibrationPolinomYClick(Sender: TObject);
    procedure cbUseCalibrationYClick(Sender: TObject);
    procedure sgMultitrackDblClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure sgMultitrackGetEditorType(Sender: TObject; ACol, ARow: Integer;
      var AEditor: TEditorType);
    procedure sgMultitrackCheckBoxChange(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure sgMultitrackEditCellDone(Sender: TObject; ACol, ARow: Integer);
    procedure btnApplyMultitrackClick(Sender: TObject);
    procedure btnExpCalculateClick(Sender: TObject);
    procedure sgExpGridButtonClick(Sender: TObject; ACol, ARow: Integer);
    procedure tcLasersChange(Sender: TObject);
    procedure cboxLaserInUseChange(Sender: TObject);
    procedure edtLaserWavelengthNmChange(Sender: TObject);

  private
    { Private declarations }
    Layouts:array of TLayout;
    editIdx:integer;

    isNeedToUpdateLaserNames: Boolean;

    CalPointsY :array of array of TDoublePoint;

    isNeedToSaveCalX, isNeedToSaveCalY :Boolean;
    isNeedToSaveCrossSection:Boolean;
    isNeedToSaveLineCorr:Boolean;
    isNeedToSaveMultiTrack:Boolean;

    LineCorrGraph:THGraph;

    function checkUnic(propName:string):boolean;
    procedure UpdateLayoutList;
    procedure UpdateLaserNames;


  public
    { Public declarations }
    SaveAtClose:boolean;
    currentLayout:string;

    UsedLaserIdx:Integer;
    EditedLaserIdx:Integer;


    ExpBackgroundWidth, ExpBackgroundHeight:Integer;
    expN :Integer;
    expTstart, expTfinish, expK :Single;

    Lasers : array[0..LasersNumber-1] of TLaser;

    procedure LoadLayouts;
    procedure SaveLayouts;
    procedure SaveLayout(const Name:string);
    procedure LoadLayout(const Name:string);
    procedure DeleteLayout(const Name:string);

    procedure LoadCalX;
    procedure SaveCalX;
    procedure FillCalXtable(laserIdx:integer);


    procedure LoadCalY;
    procedure SaveCalY;
    procedure FillCalYtable;


    procedure LoadCrossSection;
    procedure SaveCrossSection;
    procedure FillCrossSection;

    procedure LoadOther;
    procedure SaveOther;

    procedure ApplyPolinom( laserIdx, CalXtype:integer);
    procedure ApplyPolinomY();

    procedure DrawLineCorr(Idx:integer);

    procedure LoadMultitrack;
    procedure SaveMultitrack;
    procedure FillMultitrack;

    procedure LoadObjectives;
    procedure SaveObjectives;
    procedure FillObjectives;

   private
      canChange:boolean;
  end;

var
  FormSettings: TFormSettings;

//  firstRun:boolean=true;

implementation

{$R *.dfm}

uses main, FrameData, NumArray, NumIPP, uScan, uToupcamG32, System.Math;



procedure TFormSettings.FillMultitrack;
var
  i: Integer;
begin
canChange:=False;
   for i := 0 to High(formMain.Andor.RandomTrackParams) do
      begin

         sgMultitrack.SetCheckBoxState(0,i+1, formMain.Andor.RandomTrackParams[i].used);

         sgMultitrack.CellProperties[1,i+1].BrushColor:= formMain.Andor.RandomTrackParams[i].color ;
         sgMultitrack.Cells[2,i+1]:= formMain.Andor.RandomTrackParams[i].name;
         sgMultitrack.Cells[3,i+1]:= formMain.Andor.RandomTrackParams[i].centralLine.ToString;
         sgMultitrack.Cells[4,i+1]:= formMain.Andor.RandomTrackParams[i].width.ToString;
         sgMultitrack.Cells[5,i+1]:= formMain.Andor.RandomTrackParams[i].koef.ToString;
      end;
canChange:=True;

end;

procedure TFormSettings.FillObjectives;
begin

end;

procedure TFormSettings.ApplyPolinom(laserIdx, CalXtype: integer);
var
    pointArray:TNumArray2<Double>;
    tmpCalX:array of TDoublePoint;
    i, len:Integer;
begin
len:=Length(Lasers[laserIdx].CalPoints[CalXtype]);
if len<1 then Exit;

pointArray:=TNumArray2<Double>.Create(2,len);
for i := 0 to len-1 do
  begin
  pointArray.Values[0,i]:=Lasers[laserIdx].CalPoints[CalXtype][i].X;
  if Lasers[laserIdx].UsedCalXType=CalXTypeNm then
       pointArray.Values[1,i]:=Lasers[laserIdx].CalPoints[CalXtype][i].Y;

  if Lasers[laserIdx].UsedCalXType=CalXTypeCm then
       with formMain.FrameData do
        pointArray.Values[1,i]:=CmToNm(Lasers[laserIdx].CalPoints[CalXtype][i].Y, laserNm);
  end;


formMain.FrameData.BuildPolinom(pointArray);

if laserIdx=UsedLaserIdx then
  begin
  formMain.FrameData.LaserNm:=Lasers[laserIdx].LaserNm;
  formMain.FrameData.CalcXScale;
  end;

formMain.FrameData.PlotPolinom(CalXChart, Lasers[laserIdx].UsedCalXType);

pointArray.Free;
end;


procedure TFormSettings.ApplyPolinomY;
var
    pointArray:TNumArray2<Double>;
    tmpCalY:array of TDoublePoint;
    i, len:Integer;
begin
len:=Length(CalPointsY[0]);
if len<1 then Exit;

pointArray:=TNumArray2<Double>.Create(2,len);
for i := 0 to len-1 do
  begin
  pointArray.Values[0,i]:=CalPointsY[0][i].X;
  pointArray.Values[1,i]:=CalPointsY[0][i].Y;
  end;

formMain.FrameData.BuildPolinomY(pointArray);
formMain.FrameData.CalcCalY;

formMain.FrameData.PlotPolinomY(CalYChart, 0);
pointArray.Free;
end;

procedure TFormSettings.btnApplyClick(Sender: TObject);
begin
if lbLayouts.ItemIndex<Length(Layouts) then
   begin
   if SaveAtClose then
      SaveLayout(currentLayout);

   LoadLayout(lbLayouts.Items[lbLayouts.ItemIndex]);
   end;
end;

procedure TFormSettings.btnApplyCrossSectionClick(Sender: TObject);
begin
isNeedToSaveCrossSection:=True;

   with formMain.FrameData do
        begin
         if edtCSdensity.Value >0.1 then
         csDensity:=edtCSdensity.Value
           else ShowMessage('Density value mast be > 0.1 g/mol ');

         if edtCSMolecularWeight.Value >0.1 then
         csMolecularWeight :=edtCSMolecularWeight.Value * 1E-3
           else ShowMessage('Molecular weight value mast be > 0.1 kg/m3 ');

         if edtCSNA.Value >0.1 then
         csNA := edtCSNA.Value
           else ShowMessage('Objective NA value mast be > 0 ');

         if edtCSRI.Value >0.1 then
         csRI := edtCSRI.Value
          else ShowMessage('Refractive index value mast be > 0 ');

         if edtCSPSF.Value >0 then
         csPSF := edtCSPSF.Value * 1E-9
          else ShowMessage('Objective PSF value mast be > 0 ');

         if edtCSSERSMonolayer.Value >0 then
         csSERSmonolayer := edtCSSERSMonolayer.Value * 1e-9
         else ShowMessage('SERS monolayer length mast be > 0 ');

         if edtCSSystemThroughput.Value >0 then
         csSystemThroughput := edtCSSystemThroughput.Value
         else ShowMessage('System Throughput value mast be > 0 ');

         if edtCSSampleAttenuation.Value >0 then
         csSampleAttenuation := edtCSSampleAttenuation.Value
         else ShowMessage('Sample Attenuation value mast be > 0 ');

        end;

end;

procedure TFormSettings.btnApplyMultitrackClick(Sender: TObject);
begin

formMain.isFirstFrame:=True;
formMain.CalcData;
formMain.PlotData;
end;

procedure TFormSettings.btnCalcCalibrationPolinomClick(Sender: TObject);
var i,j:Integer;
    valX, valY:Double;
begin
isNeedToSaveCalX:=True;

j:=0;
for i := 0 to sgXcalibrationCoef.RowCount-2 do
   if (sgXcalibrationCoef.Cells[1,i+1]<>'') and (sgXcalibrationCoef.Cells[2,i+1]<>'') then
   if TryStrToFloat(sgXcalibrationCoef.Cells[1,i+1], valX) and TryStrToFloat(sgXcalibrationCoef.Cells[2,i+1], valY) then
       begin
       SetLength(Lasers[EditedLaserIdx].CalPoints[Lasers[EditedLaserIdx].UsedCalXType],j+1);
       Lasers[EditedLaserIdx].CalPoints[Lasers[EditedLaserIdx].UsedCalXType][j].X:=valX;
       Lasers[EditedLaserIdx].CalPoints[Lasers[EditedLaserIdx].UsedCalXType][j].Y:=valY;
       Inc(j);
       end;

Lasers[EditedLaserIdx].LaserNm:=edtLaserWavelengthNm.Value;
if isNeedToUpdateLaserNames then
  UpdateLaserNames;

ApplyPolinom(EditedLaserIdx, Lasers[EditedLaserIdx].UsedCalXType);
formMain.RescaleTriGraph;

end;

procedure TFormSettings.btnCalcCalibrationPolinomYClick(Sender: TObject);
var i,j:Integer;
    valX, valY:Double;
begin
isNeedToSaveCalY:=True;

j:=0;
for i := 0 to sgYcalibrationCoef.RowCount-2 do
   if (sgYcalibrationCoef.Cells[1,i+1]<>'') and (sgYcalibrationCoef.Cells[2,i+1]<>'') then
   if TryStrToFloat(sgYcalibrationCoef.Cells[1,i+1], valX) and TryStrToFloat(sgYcalibrationCoef.Cells[2,i+1], valY) then
       begin
       SetLength(CalPointsY[0],j+1);
       CalPointsY[0][j].X:=valX;
       CalPointsY[0][j].Y:=valY;
       Inc(j);
       end;

ApplyPolinomY();

formMain.RescaleTriGraph;  //temporary
end;

procedure TFormSettings.btnCopyUsrToDefaultClick(Sender: TObject);
begin
formMain.FrameData.CopyUsrToDefLineCorrection;
DrawLineCorr(rgUsedLineCorrection.ItemIndex);
isNeedToSaveLineCorr:=True;
end;

procedure TFormSettings.btnDeleteClick(Sender: TObject);
begin
if lbLayouts.ItemIndex<Length(Layouts) then
   DeleteLayout(lbLayouts.Items[lbLayouts.ItemIndex]);

end;

procedure TFormSettings.btnExpCalculateClick(Sender: TObject);
var

  i: Integer;

begin
  expN:=StrToIntDef( edtExpStepsCountN.Text, 1);
  if expN<=0 then expN:=1;

  expTstart:=StrToFloatDef( edtExpStartExposition.Text, 1.0);
  expTfinish:=StrToFloatDef( edtExpLastExposition.Text, 1.0);

  expK:= Ln(expTfinish/expTstart)/(expN-1);
  edtExpK.Text:=expK.ToString;

  formMain.expTstart:=expTstart;
  formMain.expTfinish:=expTfinish;
  formMain.expK:=expK;
  formMain.expN:=expN;


    sgExpGrid.RowCount:=expN+1;
    sgExpGrid.Clear;
    sgExpGrid.Cells[0,0]:='#';
    sgExpGrid.Cells[1,0]:='t';
    sgExpGrid.Cells[2,0]:='collected';


  for i := 0 to EXPn-1 do
    begin
    sgExpGrid.Cells[0,i+1]:=i.ToString;
    sgExpGrid.Cells[1,i+1]:= Format('%.2f',[expTstart*exp(expK*i)]);
    sgExpGrid.Cells[2,i+1]:='';
    sgExpGrid.AddButton(3,i+1, 55, 20, 'Measure', haCenter, vaCenter );
    end;



   if Length(formMain.FrameData.DataBGarray)>0 then
   for I := 0 to Length(formMain.FrameData.DataBGarray)-1 do
    formMain.FrameData.DataBGarray[i].Free ;

   SetLength(formMain.FrameData.DataBGarray,EXPn);

   ExpBackgroundWidth:=formMain.Andor.pImageArray.Width;
   ExpBackgroundHeight:=formMain.Andor.pImageArray.Height;

   for i := 0 to EXPn-1 do
     formMain.FrameData.DataBGarray[i]:=TNumArray2<Single>.Create(ExpBackgroundWidth, ExpBackgroundHeight);



end;

procedure TFormSettings.btnLoadLineCorrectionClick(Sender: TObject);
begin
if OpenDialog.Execute then
  begin
  formMain.FrameData.LoadLineCorrectionFromCSV(OpenDialog.FileName);
  DrawLineCorr(rgUsedLineCorrection.ItemIndex);
  isNeedToSaveLineCorr:=True;
  end;
end;

procedure TFormSettings.btnNewClick(Sender: TObject);
var len, i,j:integer;
    propName:string;

begin
len:=Length(Layouts);
SetLength(Layouts, len+1);
Layouts[len].used:=true;

j:=1;

while True do
  begin
  propName:= 'NewLayout'+IntToStr(j);

  if checkUnic(propName)  then
     break
  else
    inc(j);
  end;

Layouts[len].name:=propName;

if SaveAtClose then
   SaveLayout(currentLayout);

UpdateLayoutList;

currentLayout:= Layouts[len].name;

end;

procedure TFormSettings.cboxLaserInUseChange(Sender: TObject);
begin
  UsedLaserIdx:= cboxLaserInUse.ItemIndex;
if canChange then
  ApplyPolinom(UsedLaserIdx, Lasers[UsedLaserIdx].UsedCalXType);
end;

procedure TFormSettings.cbSaveAtCloseClick(Sender: TObject);
begin
if canChange then
  SaveAtClose:=cbSaveAtClose.Checked;
end;

procedure TFormSettings.cbUseCalibrationYClick(Sender: TObject);
begin
if canChange then
formMain.FrameData.UseCalY:=cbUseCalibrationY.Checked;
end;

function TFormSettings.checkUnic(propName:string): boolean;
var i:Integer;
begin
result:=true;
  for i := 0 to Length(Layouts)-1 do
      if propName=Layouts[i].name then
        result := false;
end;



procedure TFormSettings.DeleteLayout(const Name:string);
var len, i,j, idx:integer;
begin
  len:=Length(Layouts);

for i := 0 to len-1 do
  if Name=Layouts[i].name then idx:=i;


 for i:=idx to len-2 do
   Layouts[i]:=Layouts[i+1];

SetLength(Layouts, len-1);

UpdateLayoutList;
end;

procedure TFormSettings.DrawLineCorr(Idx: integer);
var i:integer;
    min,max:Single;
begin
LineCorrGraph.DeleteAll;
LineCorrGraph.CreateCurve('data', clRed, lineLen);

case Idx of
0: begin
   for i:=0 to  lineLen-1 do
   LineCorrGraph.Curve[0].data.y.Values[i]:=1.0;
   end;
1: begin
   for i:=0 to  lineLen-1 do
   LineCorrGraph.Curve[0].data.y.Values[i]:=formMain.FrameData.lineCorr.Def.Values[i];
   end;
2: begin
   for i:=0 to  lineLen-1 do
   LineCorrGraph.Curve[0].data.y.Values[i]:=formMain.FrameData.lineCorr.Usr.Values[i];
   end;
end;

NumMinMax(LineCorrGraph.Curve[0].data.y, min, max);
LineCorrGraph.MinX:=0;
LineCorrGraph.MaxX:=lineLen;
LineCorrGraph.MinY:=min-0.1;
LineCorrGraph.MaxY:=max+0.1;
LineCorrGraph.SetLimits(0, lineLen);

LineCorrGraph.CalcResize(false);

end;

procedure TFormSettings.edtLaserWavelengthNmChange(Sender: TObject);
begin
isNeedToUpdateLaserNames:=True;
end;

procedure TFormSettings.FillCalXtable(laserIdx:integer);
var
   i, len:Integer;
begin

 rgCalXUnits.ItemIndex:= Lasers[laserIdx].UsedCalXType;
 edtLaserWavelengthNm.Value:=  Lasers[laserIdx].LaserNm;

for i:=0 to sgXcalibrationCoef.ColCount-1 do
  sgXcalibrationCoef.Cols[i].Clear;

//UsedCalXType

  sgXcalibrationCoef.Cells[1,0]:='pixel';

  case Lasers[laserIdx].UsedCalXType of
  0: sgXcalibrationCoef.Cells[2,0]:='nm';
  1: sgXcalibrationCoef.Cells[2,0]:='cm-1';
  end;

  for i := 0 to 8  do
     sgXcalibrationCoef.Cells[0,i+1]:=i.ToString;

  len:=Length(Lasers[laserIdx].CalPoints[Lasers[laserIdx].UsedCalXType]);

  if len>0 then
  for i := 0 to len-1 do
    begin
     sgXcalibrationCoef.Cells[1,i+1]:= Lasers[laserIdx].CalPoints[Lasers[laserIdx].UsedCalXType][i].X.ToString;
     sgXcalibrationCoef.Cells[2,i+1]:= Lasers[laserIdx].CalPoints[Lasers[laserIdx].UsedCalXType][i].Y.ToString;
    end;

sgXcalibrationCoef.Invalidate;
 // formMain.FrameData.LoadPolinom;
end;

procedure TFormSettings.FillCalYtable;
var
   i, len:Integer;
begin

for i:=0 to sgYcalibrationCoef.ColCount-1 do
  sgYcalibrationCoef.Cols[i].Clear;

  sgYcalibrationCoef.Cells[1,0]:='pixel';
  sgYcalibrationCoef.Cells[2,0]:='Scale factor';

  for i := 0 to 8  do
     sgYcalibrationCoef.Cells[0,i+1]:=i.ToString;

  len:=Length(CalPointsY[0]);

  if len>0 then
  for i := 0 to len-1 do
    begin
     sgYcalibrationCoef.Cells[1,i+1]:= CalPointsY[0][i].X.ToString;
     sgYcalibrationCoef.Cells[2,i+1]:= CalPointsY[0][i].Y.ToString;
    end;

sgYcalibrationCoef.Invalidate;

end;

procedure TFormSettings.FillCrossSection;
begin
       with formMain.FrameData do
        begin
         edtCSdensity.Value:= csDensity;
         edtCSMolecularWeight.Value:= csMolecularWeight * 1E3;

         edtCSNA.Value:= csNA;
         edtCSRI.Value:= csRI;

         edtCSPSF.Value:= csPSF * 1E9;
         edtCSSERSMonolayer.Value:= csSERSmonolayer * 1e9;

         edtCSSystemThroughput.Value:=csSystemThroughput;
         edtCSSampleAttenuation.Value:=csSampleAttenuation;
        end;
end;

procedure TFormSettings.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if isNeedToSaveCalX then
  begin
  SaveCalX;
  isNeedToSaveCalX:=False;
  end;

if isNeedToSaveCalY then
  begin
  SaveCalY;
  isNeedToSaveCalY:=False;
  end;

if isNeedToSaveCrossSection then
  begin
  SaveCrossSection;
  isNeedToSaveCrossSection:=False;
  end;

if isNeedToSaveLineCorr then
  begin
  formMain.FrameData.SaveLineCorrection;
  isNeedToSaveLineCorr:=False;
  end;
  SaveOther;

  if isNeedToSaveMultiTrack then
   begin
   SaveMultitrack;
   isNeedToSaveMultiTrack:=False;
   end;
end;

procedure TFormSettings.FormCreate(Sender: TObject);

var
  i: integer;
begin
  canChange:=true;

  sgMultitrack.FixedCols := 0;
  sgMultitrack.ColWidths[0] :=30;
  sgMultitrack.Options := sgMultitrack.Options + [goEditing];
  sgMultitrack.RowCount := 13;
  sgMultitrack.ShowSelection := false;

  sgMultitrack.SpinEdit.MinValue:=1;
  sgMultitrack.SpinEdit.MaxValue:=lineLen-1;
  sgMultitrack.SpinEdit.Increment:=1;

  for i := 1 to sgMultitrack.RowCount -1 do
    sgMultitrack.AddCheckBox(0,i,false,false);

  for i := 1 to sgMultitrack.RowCount -1 do
    begin
    sgMultitrack.Cells[2,i]:='Track '+i.ToString;
    sgMultitrack.Cells[3,i]:='1';
    sgMultitrack.Cells[4,i]:='1';

    sgMultitrack.Cells[5,i]:='1.0';
    end;


for i := 0 to LasersNumber-1 do
  begin
   SetLength(Lasers[i].CalPoints, 2);
   Lasers[i].UsedCalXType:=CalXTypeNm;
  end;


SetLength(CalPointsY, 2);

LoadCalX;
LoadCrossSection;

UpdateLaserNames;

ApplyPolinom(UsedLaserIdx, Lasers[UsedLaserIdx].UsedCalXType);

LoadCalY;
ApplyPolinomY();

LoadMultitrack;

LineCorrGraph:=THGraph.Create(Self);
LineCorrGraph.Parent:=pnlLineCorrGraph;
LineCorrGraph.Align:=alClient;
LineCorrGraph.MinX:=0;
LineCorrGraph.MaxX:=10;
//LineCorrGraph.Show;


end;

procedure TFormSettings.FormDestroy(Sender: TObject);
var i:Integer;
begin
for i := 0 to LasersNumber-1 do
  SetLength(Lasers[i].CalPoints, 0);

SetLength(CalPointsY, 0);
LineCorrGraph.Free;
end;

procedure TFormSettings.FormShow(Sender: TObject);
begin
canChange:=False;


rgCalXUnits.ItemIndex:=Lasers[UsedLaserIdx].UsedCalXType;
tcLasers.TabIndex:=UsedLaserIdx;
EditedLaserIdx:=UsedLaserIdx;

rgAndorPalette.ItemIndex:=Integer(formMain.IGraph.Palette);
rgMapPalette.ItemIndex:=Integer(FormMain.formScan.IGraph.Palette);
rgUsedLineCorrection.ItemIndex:=formMain.FrameData.lineCorr.usedType;
cbUseCalibrationY.Checked:=formMain.FrameData.UseCalY;

FillMultitrack;

canChange:=True;

PageControlSettings.ActivePage:=tsLayout;
UpdateLayoutList;

FillCalXtable(UsedLaserIdx);
formMain.FrameData.PlotPolinom(CalXChart, Lasers[UsedLaserIdx].UsedCalXType);

FillCalYtable;
formMain.FrameData.PlotPolinomY(CalYChart, 0);

LineCorrGraph.Show;

FillCrossSection;

//DrawLineCorr(formMain.FrameData.lineCorr.usedType);

isNeedToSaveCalX:=False;
isNeedToSaveCrossSection:=False;
isNeedToSaveLineCorr:=False;
isNeedToSaveCalY:=False;
isNeedToSaveMultiTrack:=False;

end;

procedure TFormSettings.lbLayoutsEditDone(Sender: TObject; var newstr: string;  var allow: Boolean);
var oldName, newName:string;
begin
    if checkUnic(newstr) and (newstr<>'') and (newstr<>' ') then
      begin
      oldName:=ExtractFilePath(Application.ExeName)+'\Layouts\'+currentLayout+'.ini';
      newName:=ExtractFilePath(Application.ExeName)+'\Layouts\'+newstr+'.ini';
      RenameFile(oldName, newName );

      allow:=true;
      Layouts[editIdx].name:=newstr;
      currentLayout:=newstr;
      end;

end;

procedure TFormSettings.lbLayoutsEditStart(Sender: TObject; itemindex: Integer;
  var allow: Boolean);
begin
if (itemindex<Length(Layouts)) and (itemindex>=0) then
 begin
  editIdx:=itemindex;
  allow:=true;
 end;
end;

procedure TFormSettings.LoadCalX;
var
    Ini:TMemIniFile;
    section, subsection:string;
    i,j, lsrIdx, len : Integer;
begin
   // 0 - nm
   // 1 - cm-1
    Ini:=TMemIniFile.Create(ExtractFilePath(Application.ExeName)+'Settings.ini');
      try
       section:='CalibrationX';

       UsedLaserIdx:=Ini.ReadInteger(section, 'UsedLaser', 0);

       for lsrIdx := 0 to LasersNumber-1 do
        begin
        section:='CalibrationX_'+InttoStr(lsrIdx);

        Lasers[lsrIdx].UsedCalXType:=Ini.ReadInteger(section, 'UsedCalXType', CalXTypeNm );
        Lasers[lsrIdx].LaserNm:= Ini.ReadFloat(section, 'LaserWavelengthNm', 785.0);


           for i := 0 to Length(Lasers[lsrIdx].CalPoints)-1 do
             begin
             subsection:='\Points_'+inttostr(i);
             len:=Ini.ReadInteger(section+subsection,'PointNum',0 );
             SetLength(Lasers[lsrIdx].CalPoints[i], len);

             if len>0 then
             for j := 0 to len-1 do
             begin
             SetLength(Lasers[lsrIdx].CalPoints[i], j+1);
             Lasers[lsrIdx].CalPoints[i][j].X:=Ini.ReadFloat(section+subsection, 'P'+IntToStr(j)+'X',0.0 );
             Lasers[lsrIdx].CalPoints[i][j].Y:=Ini.ReadFloat(section+subsection, 'P'+IntToStr(j)+'Y',0.0 );
             end;

             end;
       end;


      finally
      Ini.Free;
      end;


end;

procedure TFormSettings.LoadCalY;
var
    Ini:TMemIniFile;
    section, subsection:string;
    i,j,len : Integer;
begin

    Ini:=TMemIniFile.Create(ExtractFilePath(Application.ExeName)+'Settings.ini');
      try
       section:='CalibrationY';
//       if Ini.SectionExists(section) then
       begin
            formMain.FrameData.UseCalY:= Ini.ReadBool(section, 'UseCalY', false);


           for i := 0 to Length(CalPointsY)-1 do
             begin
             subsection:='\Points_'+inttostr(i);
             len:=Ini.ReadInteger(section+subsection,'PointNum',0 );
             SetLength(CalPointsY[i], len);

             if len>0 then
             for j := 0 to len-1 do
             begin
             SetLength(CalPointsY[i], j+1);
             CalPointsY[i][j].X:=Ini.ReadFloat(section+subsection, 'P'+IntToStr(j)+'X',0.0 );
             CalPointsY[i][j].Y:=Ini.ReadFloat(section+subsection, 'P'+IntToStr(j)+'Y',1.0 );
             end;

             end;
       end;
      finally
      Ini.Free;
      end;

end;

procedure TFormSettings.LoadCrossSection;
var
    Ini:TMemIniFile;
    section:string;
    i,j,len : Integer;
begin
    Ini:=TMemIniFile.Create(ExtractFilePath(Application.ExeName)+'Settings.ini');
      try
       section:='CrossSection';

       with formMain.FrameData do
        begin
         csNA:=Ini.ReadFloat(section, 'csNA', 0.3);
         csDensity:=Ini.ReadFloat(section, 'csDensity', 1000.0);
         csRI:=Ini.ReadFloat(section, 'csRI', 1.0);
         csPSF:=Ini.ReadFloat(section, 'csPSF', 1E-6);
         csMolecularWeight:=Ini.ReadFloat(section, 'csMolecularWeight', 18.01528E-3);
         csSERSmonolayer:=Ini.ReadFloat(section, 'csSERSmonolayer', 1e-9);
         csSystemThroughput:=Ini.ReadFloat(section, 'csSystemThroughput', 1.0);
         csSampleAttenuation:=Ini.ReadFloat(section, 'csSampleAttenuation', 1.0);
        end;

      finally
      Ini.Free;
      end;

end;

procedure TFormSettings.LoadLayout(const Name:string);
var Ini:TMemIniFile;
  section:string;
  i,j,k,f, panelNum:integer;
  panelName:String;
begin

if FileExists(ExtractFilePath(Application.ExeName)+'\Layouts\'+Name+'.ini') then
    begin

    Ini:=TMemIniFile.Create(ExtractFilePath(Application.ExeName)+'\Layouts\'+Name+'.ini');
      try
      section:='Main';

      FormMain.Left:=Ini.ReadInteger(section, 'MainLeft', Screen.WorkAreaLeft );
      FormMain.Top:=Ini.ReadInteger(section, 'MainTop', Screen.WorkAreaTop );
      FormMain.Width:=Ini.ReadInteger(section, 'MainWidth', Screen.WorkAreaWidth );
      FormMain.Height:=Ini.ReadInteger(section, 'MainHeight', Screen.WorkAreaHeight );

      i:=0;
      panelNum:=0;
      for i := 0 to formMain.ComponentCount-1 do
        if formMain.Components[i] is TAdvPanel then
          inc(panelNum);

      for i := 0 to panelNum-1 do
          begin
            section:='Panel'+IntToStr(i);
            if Ini.SectionExists(section) then
              begin
                panelName:=Ini.ReadString(section,'Name', ' ' );

                for j := 0 to formMain.ComponentCount-1 do
                  if formMain.Components[j] is TAdvPanel then
                    if (formMain.Components[j] as TAdvPanel).Name= panelName then
                   begin
                   (formMain.Components[j] as TAdvPanel).Left:= Ini.ReadInteger(section,'Left', 0);
                   (formMain.Components[j] as TAdvPanel).Top:=Ini.ReadInteger(section,'Top', 0 );
                   (formMain.Components[j] as TAdvPanel).Width:=Ini.ReadInteger(section,'Height', 100 );
                   (formMain.Components[j] as TAdvPanel).Height:=Ini.ReadInteger(section,'Width', 100 );
                   end;
              end;


          end;

      currentLayout:=Name;

      finally
      Ini.Free;
      end;

    end
// else
//    begin
//    ShowMessage('Load default layout');
//    end;
end;


procedure TFormSettings.LoadLayouts;
var Ini:TMemIniFile;
  section:string;
  i,j,k:integer;
begin
 if not DirectoryExists(ExtractFilePath(Application.ExeName)+'\Layouts') then
   CreateDir(ExtractFilePath(Application.ExeName)+'\Layouts');

Ini:=TMemIniFile.Create(ExtractFilePath(Application.ExeName)+'\Layouts\Layouts.ini');
try

   section:='Main';
      SaveAtClose:=Ini.ReadBool(section, 'SaveAtClose', true);
      canChange:=false;
      cbSaveAtClose.Checked:=SaveAtClose;
      canchange:=true;

      CurrentLayout:=Ini.ReadString(section, 'CurrentLayout', 'Default');

  i:=0;
  while true do
    begin
    section:='Layout_'+IntToStr(i);
    if Ini.SectionExists(section)=false then break;

       SetLength(Layouts, i+1);
       Layouts[i].name:=Ini.ReadString(section, 'Name', 'Layout'+IntToStr(i) );
       Layouts[i].used:=true;

    inc(i);
    end;

if Length(Layouts)=0 then
      begin
      SetLength(Layouts, 1);
      Layouts[0].name:='Defalut';
      Layouts[0].used:=true;
      currentLayout:='Defalut';
      end;

    LoadLayout(currentLayout);

finally
Ini.Free;
end;

end;


procedure TFormSettings.LoadMultitrack;
var
    Ini:TMemIniFile;
    section, subsection:string;
    i:Integer;
begin

    Ini:=TMemIniFile.Create(ExtractFilePath(Application.ExeName)+'Settings.ini');
      try
       section:='RandomTrack';

         for i := 0 to High(formMain.Andor.RandomTrackParams) do
            begin
             formMain.Andor.RandomTrackParams[i].used:= Ini.ReadBool(section, 'Used['+i.ToString+']', false );
             formMain.Andor.RandomTrackParams[i].color:= TColor( Ini.ReadInteger(section, 'Color['+i.ToString+']', Integer(clRed)));
             formMain.Andor.RandomTrackParams[i].name:= Ini.ReadString(section, 'Name['+i.ToString+']', 'Track '+i.ToString);

             formMain.Andor.RandomTrackParams[i].centralLine:= Ini.ReadInteger(section, 'CentralLine['+i.ToString+']', 0);
             formMain.Andor.RandomTrackParams[i].width:= Ini.ReadInteger(section, 'Width['+i.ToString+']', 1);
             formMain.Andor.RandomTrackParams[i].koef:= Ini.ReadFloat(section, 'Koef['+i.ToString+']',  1.0);
            end;

      finally
      Ini.Free;
      end;

end;

procedure TFormSettings.LoadObjectives;

var
    Ini:TMemIniFile;
    section, subsection:string;
    i:Integer;
begin

    Ini:=TMemIniFile.Create(ExtractFilePath(Application.ExeName)+'Settings.ini');
      try
       section:='Objectives';
       formMain.ToupcamG.UsedObjective := Ini.ReadInteger(section, 'UsedObjective', 0);

         for i := 0 to  ObjCount-1 do
            begin
             formMain.ToupcamG.Objectives[i].name := Ini.ReadString(section, 'Name['+i.ToString+']', 'Objective'+i.ToString );

             formMain.ToupcamG.Objectives[i].prop_stepsToPix_X := Ini.ReadFloat(section, 'stepsToPix_X['+i.ToString+']', 1.0);
             formMain.ToupcamG.Objectives[i].prop_stepsToPix_Y := Ini.ReadFloat(section, 'stepsToPix_Y['+i.ToString+']', 1.0);
             formMain.ToupcamG.Objectives[i].prop_encToPix_X := Ini.ReadFloat(section, 'encToPix_X['+i.ToString+']', 1.0);
             formMain.ToupcamG.Objectives[i].prop_encToPix_Y := Ini.ReadFloat(section, 'encToPix_Y['+i.ToString+']', 1.0);

             formMain.ToupcamG.Objectives[i].laserPosition_X := Ini.ReadInteger(section, 'laserPosition_X['+i.ToString+']', 0);
             formMain.ToupcamG.Objectives[i].laserPosition_Y := Ini.ReadInteger(section, 'laserPosition_Y['+i.ToString+']', 0);

            end;

      finally
      Ini.Free;
      end;
end;

procedure TFormSettings.LoadOther;
var
    Ini:TMemIniFile;
    section:string;
    i,j,len : Integer;
begin
    Ini:=TMemIniFile.Create(ExtractFilePath(Application.ExeName)+'Settings.ini');
      try
       section:='View';

         formMain.IGraph.Palette:=TPalette(Ini.ReadInteger(section, 'AndorPalette', 0));
         FormMain.formScan.IGraph.Palette:=TPalette(Ini.ReadInteger(section, 'MapPalette', 0));

      finally
      Ini.Free;
      end;
end;

procedure TFormSettings.rgAndorPaletteChange(Sender: TObject);
begin
formMain.IGraph.Palette:=TPalette(rgAndorPalette.ItemIndex );
formMain.FillPalette(TPalette(rgAndorPalette.ItemIndex ));
end;

procedure TFormSettings.rgBackgroundTypeChange(Sender: TObject);
begin
case rgBackgroundType.ItemIndex of
0: formMain.BackgroundType:=bgDark;
1: formMain.BackgroundType:=bgLight;
end;
end;

procedure TFormSettings.rgCalXUnitsChange(Sender: TObject);
begin
case rgCalXUnits.ItemIndex of
  0: Lasers[EditedLaserIdx].UsedCalXType:=CalXTypeNm;
  1: Lasers[EditedLaserIdx].UsedCalXType:=CalXTypeCm;
end;

FillCalXtable(EditedLaserIdx);
ApplyPolinom(EditedLaserIdx, Lasers[EditedLaserIdx].UsedCalXType);
end;

procedure TFormSettings.rgUsedLineCorrectionChange(Sender: TObject);
begin
if canChange then
 begin
  formMain.FrameData.lineCorr.usedType:=rgUsedLineCorrection.ItemIndex;
  DrawLineCorr(rgUsedLineCorrection.ItemIndex);
  isNeedToSaveLineCorr:=True;
 end;
end;

procedure TFormSettings.SaveCalX;
var
    Ini:TMemIniFile;
    section, subsection:string;
    i,j,len, lsrIdx : Integer;
begin
   // 0 - nm
   // 1 - cm-1
    Ini:=TMemIniFile.Create(ExtractFilePath(Application.ExeName)+'Settings.ini');
      try
       section:='CalibrationX';
       if Ini.SectionExists(section) then
         Ini.EraseSection(section);

       Ini.WriteInteger(section, 'UsedLaser', UsedLaserIdx);


        for lsrIdx := 0 to LasersNumber-1 do
        begin
        section:='CalibrationX_'+InttoStr(lsrIdx);


         Ini.WriteInteger(section, 'UsedCalXType', Lasers[lsrIdx].UsedCalXType);
         Ini.WriteFloat(section, 'LaserWavelengthNm', Lasers[lsrIdx].LaserNm);


         for i := 0 to Length(Lasers[lsrIdx].CalPoints)-1 do
           begin
           subsection:='\Points_'+inttostr(i);
           len:= Length(Lasers[lsrIdx].CalPoints[i]);
           Ini.WriteInteger(section+subsection, 'PointNum',len);

           for j := 0 to len-1 do
           begin
           Ini.WriteFloat(section+subsection, 'P'+IntToStr(j)+'X',Lasers[lsrIdx].CalPoints[i][j].X );
           Ini.WriteFloat(section+subsection, 'P'+IntToStr(j)+'Y',Lasers[lsrIdx].CalPoints[i][j].Y );
           end;

           end;

        end;


      finally
      Ini.UpdateFile;
      Ini.Free;
      end;
end;

procedure TFormSettings.SaveCalY;
var
    Ini:TMemIniFile;
    section, subsection:string;
    i,j,len : Integer;
begin

    Ini:=TMemIniFile.Create(ExtractFilePath(Application.ExeName)+'Settings.ini');
      try
       section:='CalibrationY';
       if Ini.SectionExists(section) then
         Ini.EraseSection(section);

       Ini.WriteBool(section, 'UseCalY', formMain.FrameData.UseCalY);

       for i := 0 to Length(CalPointsY)-1 do
         begin
         subsection:='\Points_'+inttostr(i);
         len:= Length(CalPointsY[i]);
         Ini.WriteInteger(section+subsection, 'PointNum',len);

         for j := 0 to len-1 do
         begin
         Ini.WriteFloat(section+subsection, 'P'+IntToStr(j)+'X',CalPointsY[i][j].X );
         Ini.WriteFloat(section+subsection, 'P'+IntToStr(j)+'Y',CalPointsY[i][j].Y );
         end;

         end;
      finally
      Ini.UpdateFile;
      Ini.Free;
      end;

end;

procedure TFormSettings.SaveCrossSection;
var
    Ini:TMemIniFile;
    section, subsection:string;
    i,j,len : Integer;
begin

    Ini:=TMemIniFile.Create(ExtractFilePath(Application.ExeName)+'Settings.ini');
      try
       section:='CrossSection';
       if Ini.SectionExists(section) then
         Ini.EraseSection(section);

       with formMain.FrameData do
        begin

         Ini.WriteFloat(section, 'csNA', csNA);
         Ini.WriteFloat(section, 'csDensity', csDensity);
         Ini.WriteFloat(section, 'csRI', csRI);
         Ini.WriteFloat(section, 'csPSF', csPSF);
         Ini.WriteFloat(section, 'csMolecularWeight', csMolecularWeight);
         Ini.WriteFloat(section, 'csSERSmonolayer', csSERSmonolayer);

         Ini.WriteFloat(section, 'csSystemThroughput', csSystemThroughput);
         Ini.WriteFloat(section, 'csSampleAttenuation', csSampleAttenuation);
        end;

      finally
      Ini.UpdateFile;
      Ini.Free;
      end;

end;

procedure TFormSettings.SaveLayout(const Name:string);
var Ini:TMemIniFile;
  section:string;
  i,j,k:integer;
begin

    Ini:=TMemIniFile.Create(ExtractFilePath(Application.ExeName)+'\Layouts\'+Name+'.ini');
      try
      section:='Main';

      Ini.WriteInteger(section, 'MainLeft', FormMain.Left );
      Ini.WriteInteger(section, 'MainTop', FormMain.Top );
      Ini.WriteInteger(section, 'MainWidth', FormMain.Width );
      Ini.WriteInteger(section, 'MainHeight', FormMain.Height );

      j:=0;
      for i := 0 to formMain.ComponentCount-1 do
        if formMain.Components[i] is TAdvPanel then
         begin
         section:='Panel'+IntToStr(j);
         Ini.WriteString(section, 'Name',(formMain.Components[i] as TAdvPanel).Name );
         Ini.WriteInteger(section,'Left', (formMain.Components[i] as TAdvPanel).Left );
         Ini.WriteInteger(section,'Top', (formMain.Components[i] as TAdvPanel).Top );
         Ini.WriteInteger(section,'Height', (formMain.Components[i] as TAdvPanel).Width );
         Ini.WriteInteger(section,'Width', (formMain.Components[i] as TAdvPanel).Height );
         inc(j);
         end;

      finally
      Ini.UpdateFile;
      Ini.Free;
      end;


end;


procedure TFormSettings.SaveLayouts;
var Ini:TMemIniFile;
  section:string;
  i,j,k:integer;
begin
if not DirectoryExists(ExtractFilePath(Application.ExeName)+'\Layouts') then
   CreateDir(ExtractFilePath(Application.ExeName)+'\Layouts');

Ini:=TMemIniFile.Create(ExtractFilePath(Application.ExeName)+'\Layouts\Layouts.ini');

 section:='Main';
   Ini.WriteBool(section, 'SaveAtClose', SaveAtClose);
   Ini.WriteString(section, 'CurrentLayout', CurrentLayout);

for i := 0 to Length(Layouts)-1 do
  begin
    section:='Layout_'+IntToStr(i);
    Ini.WriteString(section, 'Name', Layouts[i].name );
  end;

try
Ini.UpdateFile;
finally
Ini.Free;
end;

SaveLayout(currentLayout);

end;



procedure TFormSettings.SaveMultitrack;
var
    Ini:TMemIniFile;
    section, subsection:string;
    i:Integer;
begin

    Ini:=TMemIniFile.Create(ExtractFilePath(Application.ExeName)+'Settings.ini');
      try
       section:='RandomTrack';

         for i := 0 to High(formMain.Andor.RandomTrackParams) do
            begin
             Ini.WriteBool(section, 'Used['+i.ToString+']', formMain.Andor.RandomTrackParams[i].used );
             Ini.WriteInteger(section, 'Color['+i.ToString+']', Integer(formMain.Andor.RandomTrackParams[i].color));
             Ini.WriteString(section, 'Name['+i.ToString+']', formMain.Andor.RandomTrackParams[i].name);

             Ini.WriteInteger(section, 'CentralLine['+i.ToString+']', formMain.Andor.RandomTrackParams[i].centralLine);
             Ini.WriteInteger(section, 'Width['+i.ToString+']', formMain.Andor.RandomTrackParams[i].width);
             Ini.WriteFloat(section, 'Koef['+i.ToString+']',  formMain.Andor.RandomTrackParams[i].koef);
            end;

      finally
      Ini.UpdateFile;
      Ini.Free;
      end;

end;

procedure TFormSettings.SaveObjectives;
var
    Ini:TMemIniFile;
    section, subsection:string;
    i:Integer;
begin

    Ini:=TMemIniFile.Create(ExtractFilePath(Application.ExeName)+'Settings.ini');
      try
       section:='Objectives';
         Ini.WriteInteger(section, 'UsedObjective', formMain.ToupcamG.UsedObjective);

         for i := 0 to  ObjCount-1 do
            begin
             Ini.WriteString(section, 'Name['+i.ToString+']', formMain.ToupcamG.Objectives[i].name );

             Ini.WriteFloat(section, 'stepsToPix_X['+i.ToString+']', formMain.ToupcamG.Objectives[i].prop_stepsToPix_X);
             Ini.WriteFloat(section, 'stepsToPix_Y['+i.ToString+']', formMain.ToupcamG.Objectives[i].prop_stepsToPix_Y);
             Ini.WriteFloat(section, 'encToPix_X['+i.ToString+']', formMain.ToupcamG.Objectives[i].prop_encToPix_X);
             Ini.WriteFloat(section, 'encToPix_Y['+i.ToString+']', formMain.ToupcamG.Objectives[i].prop_encToPix_Y);

             Ini.WriteInteger(section, 'laserPosition_X['+i.ToString+']', formMain.ToupcamG.Objectives[i].laserPosition_X);
             Ini.WriteInteger(section, 'laserPosition_Y['+i.ToString+']', formMain.ToupcamG.Objectives[i].laserPosition_Y);
            end;

      finally
      Ini.Free;
      end;
end;

procedure TFormSettings.SaveOther;
var
    Ini:TMemIniFile;
    section, subsection:string;
begin

    Ini:=TMemIniFile.Create(ExtractFilePath(Application.ExeName)+'Settings.ini');
      try
       section:='View';

         Ini.WriteInteger(section, 'AndorPalette', Integer(formMain.IGraph.Palette));
         Ini.WriteInteger(section, 'MapPalette', Integer(FormMain.formScan.IGraph.Palette));

      finally
      Ini.UpdateFile;
      Ini.Free;
      end;

end;

procedure TFormSettings.sgExpGridButtonClick(Sender: TObject; ACol,
  ARow: Integer);
var expTime:Single;
begin
//
expTime:=expTstart*exp(expK*(ARow-1));
formMain.edtExposure.Text:=expTime.ToString;
formMain.btnSetExposure.OnClick(self);
formMain.ExpBGlayer:=ARow-1;
formMain.btnBackground.OnClick(Self);
end;

procedure TFormSettings.sgMultitrackCheckBoxChange(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
begin
if canChange then
  begin
  formMain.Andor.RandomTrackParams[ARow-1].used:=State;
  isNeedToSaveMultiTrack:=true;
  end;
end;

procedure TFormSettings.sgMultitrackDblClickCell(Sender: TObject; ARow, ACol: Integer);
begin
if canChange then

if ARow>0 then
  if ACol=1  then
    if ColorDialog.Execute then
     begin
     sgMultitrack.CellProperties[ACol,ARow].BrushColor:=ColorDialog.Color;
     formMain.Andor.RandomTrackParams[ARow-1].color:= ColorDialog.Color;
     isNeedToSaveMultiTrack:=true;
     end;
end;

procedure TFormSettings.sgMultitrackEditCellDone(Sender: TObject; ACol,
  ARow: Integer);
begin
if canChange then

if ARow>0 then
  begin
  case ACol of
  2: formMain.Andor.RandomTrackParams[ARow-1].name:= sgMultitrack.Cells[ACol, ARow];
  3: formMain.Andor.RandomTrackParams[ARow-1].centralLine:= StrToIntDef(sgMultitrack.Cells[ACol, ARow], 0);
  4: formMain.Andor.RandomTrackParams[ARow-1].width:= StrToIntDef(sgMultitrack.Cells[ACol, ARow], 1);
  5: formMain.Andor.RandomTrackParams[ARow-1].koef:= StrToFloatDef(sgMultitrack.Cells[ACol, ARow], 1.0);
  end;
    isNeedToSaveMultiTrack:=true;
  end;
end;

procedure TFormSettings.sgMultitrackGetEditorType(Sender: TObject; ACol, ARow: Integer;
  var AEditor: TEditorType);
begin
if ARow>0 then
  case ACol of
  0: AEditor:=edCheckBox;
  1: AEditor:=edNone;
  2: AEditor:=edNormal;
  3,4:AEditor:=edSpinEdit;
  5:AEditor:=edFloat;
  end;
end;

procedure TFormSettings.tcLasersChange(Sender: TObject);
begin
  EditedLaserIdx:= tcLasers.TabIndex;
  FillCalXtable(EditedLaserIdx);

end;

procedure TFormSettings.rgMapPaletteChange(Sender: TObject);
begin
FormMain.formScan.IGraph.Palette:=TPalette(rgMapPalette.ItemIndex );
end;

procedure TFormSettings.TreeSettingsClick(Sender: TObject);

begin
case TreeSettings.Selected.SelectedIndex of
 1:PageControlSettings.ActivePage:=tsLayout;
 2:PageControlSettings.ActivePage:=tsXcalibration;
 3:PageControlSettings.ActivePage:=tsOther;
 4:PageControlSettings.ActivePage:=tsCrossSection;
 5:PageControlSettings.ActivePage:=tsLineCorrection;
 6:PageControlSettings.ActivePage:=tsView;
 7:PageControlSettings.ActivePage:=tsYcalibration;
 8:PageControlSettings.ActivePage:=tsMultitrack;
 9:PageControlSettings.ActivePage:=tsObjective;
 10:PageControlSettings.ActivePage:=tsExpBackground;
end;

end;

procedure TFormSettings.UpdateLaserNames;

var lsrIdx:Integer;
begin
canChange:=false;
      cboxLaserInUse.Items.Clear;

      for lsrIdx := 0 to LasersNumber-1 do
        cboxLaserInUse.Items.Add( Format('%.1f nm',[Lasers[lsrIdx].LaserNm]) );
      cboxLaserInUse.ItemIndex:=UsedLaserIdx;
 canChange:=true;

end;

procedure TFormSettings.UpdateLayoutList;
var i, len:integer;
begin
len:=Length(Layouts);

canChange:=false;
lbLayouts.Clear;
  for i := 0 to len-1 do
   lbLayouts.Items.Add(Layouts[i].name);

canChange:=true;
end;


end.
