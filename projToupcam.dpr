program projToupcam;

uses
  Vcl.Forms,
  MainToupcam in 'MainToupcam.pas' {FormMain},
  uToupcam in 'uToupcam.pas' {devToupcam},
  libToupcam in 'libToupcam.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
