program projToupcamG32;

uses
  Vcl.Forms,
  MainToupcamG32 in 'MainToupcamG32.pas' {FormMain},
  uToupcamG32 in 'uToupcamG32.pas' {devToupcamG},
  libToupcam in 'libToupcam.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
