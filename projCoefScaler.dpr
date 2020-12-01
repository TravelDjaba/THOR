program projCoefScaler;

uses
  Vcl.Forms,
  uBaseCoefScaler in 'uBaseCoefScaler.pas' {Form1},
  uCoefScaler in 'uCoefScaler.pas' {CoefScaler};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
