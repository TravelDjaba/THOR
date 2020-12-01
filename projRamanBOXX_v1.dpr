program projRamanBOXX_v1;

uses
  Vcl.Forms,
  main in 'main.pas' {formMain},
  NumArray in 'NumArray.pas',
  NumIPP in 'NumIPP.pas',
  uBottomGraph in 'uBottomGraph.pas' {HGraph},
  uImageGraph in 'uImageGraph.pas' {IGraph},
  uLeftGraph in 'uLeftGraph.pas' {VGraph},
  ATMCD32D in 'ATMCD32D.pas',
  devAndor in 'devAndor.pas',
  Log in 'Log.pas' {FormLog},
  devLaserRBOXX in 'devLaserRBOXX.pas',
  ControllerSettings in 'ControllerSettings.pas' {FormControllerSettings},
  devController in 'devController.pas',
  uCCD in 'uCCD.pas' {FormCCD};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TformMain, formMain);
  Application.CreateForm(TFormLog, FormLog);
  Application.CreateForm(TFormControllerSettings, FormControllerSettings);
  Application.Run;
end.
