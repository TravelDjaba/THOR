program projRamanBOXX;

uses
  Vcl.Forms,
  Windows,
  Dialogs,
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
  uCCD in 'uCCD.pas' {FormCCD},
  uWelcome in 'uWelcome.pas' {FormWelcome},
  uSetttings in 'uSetttings.pas' {FormSettings},
  FrameData in 'FrameData.pas',
  uBGwait in 'uBGwait.pas' {FormWaitBG},
  Vcl.Themes,
  Vcl.Styles,
  uScan in 'uScan.pas' {FormScan},
  uSaveMultiCSV in 'uSaveMultiCSV.pas' {FormSaveMultiCSV},
  uProgress in 'uProgress.pas' {FormProgress},
  uToupcam in 'uToupcam.pas' {devToupcam},
  libToupcam in 'libToupcam.pas',
  devControllerM in 'devControllerM.pas',
  DCMotorSettings in 'DCMotorSettings.pas' {FormDCMotorSettings},
  devDCMotor in 'devDCMotor.pas',
  MaxonDefinitions in 'MaxonDefinitions.pas',
  uToupcamG32 in 'uToupcamG32.pas' {devToupcamG},
  uScan2 in 'uScan2.pas' {FormScan2},
  uViewer in 'uViewer.pas' {Viewer},
  uView in 'uView.pas' {View},
  VectorInstruments in 'VectorInstruments.pas',
  uViewCompare in 'uViewCompare.pas' {FormViewCompare},
  uCrop3Dexport in 'uCrop3Dexport.pas' {FormCrop},
  devLaser680 in 'devLaser680.pas';

{$R *.res}
var
  H: THandle;

begin
H := CreateMutex(nil, True, 'RamanBOXX');
  if GetLastError = ERROR_ALREADY_EXISTS then
  begin
  showmessage('The program is already running !');
  Exit;
  end;


  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  FormWelcome:=TFormWelcome.Create(Application);
  FormWelcome.Show;
  FormWelcome.Update;
  Application.CreateForm(TformMain, formMain);
  Application.CreateForm(TFormLog, FormLog);
  Application.CreateForm(TFormControllerSettings, FormControllerSettings);
  Application.CreateForm(TFormWaitBG, FormWaitBG);
  Application.CreateForm(TFormSettings, FormSettings);
  Application.CreateForm(TFormSaveMultiCSV, FormSaveMultiCSV);
  Application.CreateForm(TFormProgress, FormProgress);
  Application.CreateForm(TFormDCMotorSettings, FormDCMotorSettings);
  Application.CreateForm(TFormCrop, FormCrop);
  Application.Run;
end.
