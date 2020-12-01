unit MainToupcamG32;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  uToupcamG32, sSkinManager, Vcl.AppEvnts;

type
  TFormMain = class(TForm)
    sSkinManager1: TsSkinManager;
    ApplicationEvents1: TApplicationEvents;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ApplicationEvents1Message(var Msg: tagMSG; var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }

   devToupcamG: TdevToupcamG;
  end;

var
  FormMain: TFormMain;

implementation


{$R *.dfm}

procedure TFormMain.ApplicationEvents1Message(var Msg: tagMSG;
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

procedure TFormMain.FormCreate(Sender: TObject);
begin
devToupcamG:= TdevToupcamG.Create(Self);
devToupcamG.Parent:=Self;
devToupcamG.Align:=alClient;
devToupcamG.Show;
end;

procedure TFormMain.FormDestroy(Sender: TObject);
begin
devToupcamG.Free;
end;

end.
