unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CPort, Vcl.StdCtrls, Vcl.ComCtrls;

const WaitTimeout=2000;

type
  TForm1 = class(TForm)
    ComPort1: TComPort;
    Memo1: TMemo;
    btnOpen: TButton;
    btnSettings: TButton;
    edtSend: TEdit;
    btnSend: TButton;
    StatusBar1: TStatusBar;
    procedure ComPort1AfterOpen(Sender: TObject);
    procedure ComPort1AfterClose(Sender: TObject);
    procedure btnOpenClick(Sender: TObject);
    procedure btnSettingsClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnSendClick(Sender: TObject);
    procedure ComPort1RxChar(Sender: TObject; Count: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure OnDisconnect;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnOpenClick(Sender: TObject);
begin
if ComPort1.Connected  then
    ComPort1.Close
 else ComPort1.Open;
end;

procedure TForm1.btnSendClick(Sender: TObject);
var
   str, buf:String;
   ch:AnsiChar;
   cnt:integer;
   t1, t2:cardinal;
begin
if not ComPort1.Connected then
 begin
 Memo1.Lines.Add('ComPort disconnected');
 Exit;
 end;

try
ComPort1.ClearBuffer(true,true);
except
Memo1.Lines.Add('ComPort communication Error');
OnDisconnect;
exit;
end;

try
ComPort1.WriteStr(edtSend.Text+#13#10);
except
Memo1.Lines.Add('ComPort write error');
exit;
end;
buf:='';
str:=' ';
 t1:=GetTickCount;

// sleep(1500);
repeat
try
cnt:=ComPort1.InputCount;
if cnt>0 then
   begin
   ComPort1.ReadStr(str,1);
   Memo1.Lines.Add(Format('cnt=%d %s', [cnt, str]));
   buf:=buf+str;
   end;
except
Memo1.Lines.Add('ComPort wait error');
exit;
end;

Sleep(10);
t2:=GetTickCount;
if t2-t1>WaitTimeout then
 begin
       Memo1.Lines.Add(Format('cnt=%d', [cnt]));
    break;
 end;

until str[1]=#10;

Memo1.Lines.Add(buf);
end;

procedure TForm1.btnSettingsClick(Sender: TObject);
begin
ComPort1.ShowSetupDialog;
end;

procedure TForm1.ComPort1AfterClose(Sender: TObject);
begin
btnOpen.Caption:='Connect';
StatusBar1.Panels[0].Text:='Disconnected';
end;

procedure TForm1.ComPort1AfterOpen(Sender: TObject);
begin
ComPort1.ClearBuffer(True, True );
//if ComPort1.DiscardNull then Memo1.Lines.Add('DiscardNull=true') else Memo1.Lines.Add('DiscardNull=false');
btnOpen.Caption:='Disconnect';
StatusBar1.Panels[0].Text:='Connected';
FreeAndNil();
end;

procedure TForm1.ComPort1RxChar(Sender: TObject; Count: Integer);
var str:string;
begin
ComPort1.ReadStr(str, count);
Memo1.Lines.Add(Format('RX-> %s',[str]));
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
if ComPort1.Connected  then
    ComPort1.Close;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
ComPort1AfterClose(nil);
end;

procedure TForm1.OnDisconnect;
begin
ComPort1.Close;
ComPort1.OnAfterClose(self);
end;

end.
