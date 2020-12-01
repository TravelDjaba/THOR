unit baseViewer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  NumArray, NumIPP, uBottomGraph, uImageGraph, uLeftGraph, uView, uViewer,
  sSkinManager, sSkinProvider, Log, Vcl.AppEvnts;

type
  TFormViewer = class(TForm)
    sSkinProvider1: TsSkinProvider;
    sSkinManager1: TsSkinManager;
    ApplicationEvents1: TApplicationEvents;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ApplicationEvents1Message(var Msg: tagMSG; var Handled: Boolean);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Viewer: TViewer;

  end;

var
  FormViewer: TFormViewer;
  firstRun:boolean=true;

implementation


{$R *.dfm}

{ TForm1 }

procedure TFormViewer.ApplicationEvents1Message(var Msg: tagMSG;
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

procedure TFormViewer.FormCreate(Sender: TObject);
begin
if  Viewer=nil then
   begin
    Viewer:= TViewer.Create(Self);
    Viewer.Parent:=Self;//  FormScan2.pnlViewer;
    Viewer.Align:=alClient;
    Viewer.Show;
   end;
end;

procedure TFormViewer.FormDestroy(Sender: TObject);
begin
Viewer.Free;
end;

procedure TFormViewer.FormShow(Sender: TObject);
begin
if firstRun then
  begin
  firstRun:=False;
  Viewer.ChangeLayout(1,1);
  end;
end;

end.
