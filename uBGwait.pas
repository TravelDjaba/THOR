unit uBGwait;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.WinXCtrls, Vcl.StdCtrls, sLabel;

type
  TFormWaitBG = class(TForm)
    ActivityIndicator1: TActivityIndicator;
    sLabel1: TsLabel;
    lblInfo: TsLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormWaitBG: TFormWaitBG;

implementation

{$R *.dfm}

procedure TFormWaitBG.FormClose(Sender: TObject; var Action: TCloseAction);
begin
ActivityIndicator1.Animate:=False;
end;

procedure TFormWaitBG.FormShow(Sender: TObject);
begin
ActivityIndicator1.Animate:=True;
end;

end.
