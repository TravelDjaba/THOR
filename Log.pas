unit Log;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, sMemo, Vcl.ComCtrls,
  Vcl.ToolWin, sToolBar;

type
  TFormLog = class(TForm)
    sToolBar1: TsToolBar;
    btnClear: TToolButton;
    MemoLog: TsMemo;
    procedure btnClearClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormLog: TFormLog;

implementation

{$R *.dfm}

procedure TFormLog.btnClearClick(Sender: TObject);
begin
MemoLog.Clear;
end;

end.
