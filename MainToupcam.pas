unit MainToupcam;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,  uToupcam, Vcl.ExtCtrls, sPanel, hyiedefs,hyieutils, imageenio, libToupCam;

const
    MSG_CAMEVENT = WM_APP + 1;
    WM_CCDPAINT = WM_USER+10;

type
  TFormMain = class(TForm)
    PanelToupCam: TsPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    procedure OnMsgCamEvent(var Msg: TMessage); message MSG_CAMEVENT;
    procedure CamPaint(var Msg:TMessage); message WM_CCDPAINT;

  public
    { Public declarations }
    Toupcam: TdevToupcam;
  end;

var
  FormMain: TFormMain;



implementation



{$R *.dfm}

procedure TFormMain.CamPaint(var Msg: TMessage);
var pHeader:PBITMAPINFOHEADER;
    pData:PByte;
begin
    pHeader:=nil;
    pData:=nil;
   if Toupcam.GetData(@pHeader, @pData) then
      begin
      Toupcam.ievCCD.io.LoadFromBuffer(pData,pHeader.biWidth*pHeader.biHeight*3, ioBMPRAW );
      end;

end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
    Toupcam:= TdevToupcam.Create(Self);
    Toupcam.hWnd:=Self.Handle;
    Toupcam.Parent:=PanelToupCam;
    Toupcam.Align:=alClient;
    Toupcam.Show;

    //**Toupcam
   if Toupcam.FindDevice then
    Toupcam.OpenDevice;

 // Toupcam **

end;

procedure TFormMain.FormDestroy(Sender: TObject);
begin
  Toupcam.CloseDevice;
end;

procedure TFormMain.OnMsgCamEvent(var Msg: TMessage);
begin
     case Msg.WParam of
    TOUPCAM_EVENT_ERROR:
      Toupcam.OnEventUsbError();
    TOUPCAM_EVENT_DISCONNECTED:
      Toupcam.OnEventUsbDisconnected();
    TOUPCAM_EVENT_EXPOSURE:
      Toupcam.OnEventExpo();
    TOUPCAM_EVENT_TEMPTINT:
      Toupcam.OnEventTemptint();
    TOUPCAM_EVENT_IMAGE:
      Toupcam.OnEventImage();
    TOUPCAM_EVENT_STILLIMAGE:
      Toupcam.OnEventSnap();
  end;
end;

end.
