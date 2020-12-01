unit uBaseCoefScaler;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, uCoefScaler, Vcl.AppEvnts;

type
  TForm1 = class(TForm)
    pnlScaler: TPanel;
    ApplicationEvents1: TApplicationEvents;
    procedure FormCreate(Sender: TObject);
    procedure ApplicationEvents1Message(var Msg: tagMSG; var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }

    CoefScaler: TCoefScaler;

  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.ApplicationEvents1Message(var Msg: tagMSG;
  var Handled: Boolean);
var mousePos: TPoint;
wc: TWinControl;
begin
if Msg.message = WM_MOUSEWHEEL then
  begin
  mousePos.X := Word(Msg.lParam);
  mousePos.Y := HiWord(Msg.lParam);
  wc := FindVCLWindow(mousePos);

  if wc = nil then
     Handled := True
  else
      if wc.Handle <> Msg.hwnd then
      begin
      SendMessage(wc.Handle, WM_MOUSEWHEEL, Msg.wParam, Msg.lParam);
      Handled := True;
      end;
 end;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin

CoefScaler := TCoefScaler.Create(Self);
CoefScaler.Parent:=Self.pnlScaler;
CoefScaler.Align := alClient;
CoefScaler.Show;
end;

end.
