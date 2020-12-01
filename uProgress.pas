unit uProgress;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, sEdit, Vcl.ComCtrls,
  acProgressBar;

type
  TFormProgress = class(TForm)
    ProgressBar: TsProgressBar;
    edtProgress: TsEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormProgress: TFormProgress;

implementation

{$R *.dfm}

end.
