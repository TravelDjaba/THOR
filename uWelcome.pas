unit uWelcome;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, sLabel, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls, sButton;

type
  TFormWelcome = class(TForm)
    sLabel1: TsLabel;
    Image1: TImage;
    sButton1: TsButton;
    procedure sButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormWelcome: TFormWelcome;

implementation

{$R *.dfm}

procedure TFormWelcome.sButton1Click(Sender: TObject);
begin
Self.Hide;
end;

end.
