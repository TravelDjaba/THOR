program projViewer;

uses
  Vcl.Forms,
  baseViewer in 'baseViewer.pas' {FormViewer},
  NumIPP in 'NumIPP.pas',
  uView in 'uView.pas' {View},
  uViewer in 'uViewer.pas' {Viewer},
  NumArray in 'NumArray.pas',
  Log in 'Log.pas' {FormLog},
  uViewCompare in 'uViewCompare.pas' {FormViewCompare},
  uBGwait in 'uBGwait.pas' {FormWaitBG},
  uDecompose in 'uDecompose.pas' {formDecompose},
  uCrop3Dexport in 'uCrop3Dexport.pas' {FormCrop},
  TMMatrix in 'TMMatrix.pas',
  TDecomposition in 'TDecomposition.pas',
  MathOps2 in 'MathOps2.pas',
  uWheelCorrection in 'uWheelCorrection.pas' {FormWheelCorrection},
  uMathSpectra in 'uMathSpectra.pas' {FormMathSpectra};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormViewer, FormViewer);
  Application.CreateForm(TFormLog, FormLog);
  Application.CreateForm(TFormWaitBG, FormWaitBG);
  Application.CreateForm(TformDecompose, formDecompose);
  Application.CreateForm(TFormCrop, FormCrop);
  Application.CreateForm(TFormWheelCorrection, FormWheelCorrection);
  Application.CreateForm(TFormMathSpectra, FormMathSpectra);
  //  Application.CreateForm(TFormViewCompare, FormViewCompare);
  Application.Run;
end.
