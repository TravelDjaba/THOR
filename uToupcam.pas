unit uToupcam;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, libToupcam, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.ToolWin, sToolBar, sStatusBar, Vcl.StdCtrls, sComboBox, sButton, sEdit,
  acPopupCtrls, sPanel, ieview, imageenview,hyiedefs,hyieutils, imageenio,
  Vcl.Buttons, sBitBtn, System.Threading, System.SyncObjs, sLabel, sTrackBar,
  sCheckBox, sGroupBox, sSkinProvider, sScrollBox, sFrameBar,
  sSplitter,  aceScrollPanel;

const MSG_CAMEVENT = WM_APP + 1;
      WM_CCDPAINT = WM_USER+11;

type
  TdevToupcam = class(TForm)
    StatusBarCCD: TsStatusBar;
    sToolBar1: TsToolBar;
    btnFind: TsButton;
    cboxCCD: TsComboBox;
    cboxCCDRes: TsComboBox;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    pnlControls: TsPanel;
    TimerCCD: TTimer;
    ievCCD: TImageEnView;
    btnPause: TsBitBtn;
    btnStart: TsBitBtn;
    btnStop: TsBitBtn;
    sSkinProvider1: TsSkinProvider;
    acCCDSettings: TacScrollPanel;
    acExposition: TacScrollPanelBand;
    acWhiteBalance: TacScrollPanelBand;
    acColorAdjustment: TacScrollPanelBand;
    acFrameRate: TacScrollPanelBand;
    acFlip: TacScrollPanelBand;
    cbCCDAE: TsCheckBox;
    trbCCDAE: TsTrackBar;
    trbCCDAGain: TsTrackBar;
    trbCCDTime: TsTrackBar;
    sLabel3: TsLabel;
    sLabel2: TsLabel;
    sLabel1: TsLabel;
    sLabel4: TsLabel;
    trbFrameRate: TsTrackBar;
    sLabel5: TsLabel;
    cbCCDflipV: TsCheckBox;
    cbCCDflipH: TsCheckBox;
    lblExposureTarget: TsLabel;
    lblExposureTime: TsLabel;
    lblAGain: TsLabel;
    sSplitter1: TsSplitter;
    trbTint: TsTrackBar;
    sLabel6: TsLabel;
    lblColorTemp: TsLabel;
    trbColorTemp: TsTrackBar;
    sLabel8: TsLabel;
    lblTint: TsLabel;
    sLabel7: TsLabel;
    trbHue: TsTrackBar;
    lblHue: TsLabel;
    sLabel10: TsLabel;
    trbSaturation: TsTrackBar;
    lblSaturation: TsLabel;
    sLabel12: TsLabel;
    trbBrightness: TsTrackBar;
    lblBrightness: TsLabel;
    sLabel14: TsLabel;
    trbContrast: TsTrackBar;
    lblContrast: TsLabel;
    sLabel16: TsLabel;
    trbGamma: TsTrackBar;
    lblGamma: TsLabel;
    btnAutoWB: TsButton;
    btnDefaultWB: TsButton;
    btnDefaultColor: TsButton;

    procedure FormCreate(Sender: TObject);
    procedure btnFindClick(Sender: TObject);
    procedure cboxCCDChange(Sender: TObject);
    procedure cboxCCDResChange(Sender: TObject);
    procedure trbCCDAEChange(Sender: TObject);
    procedure TimerCCDTimer(Sender: TObject);
    procedure btnPauseClick(Sender: TObject);
    procedure cbCCDAE1Click(Sender: TObject);
    procedure cbCCDflipV1Click(Sender: TObject);
    procedure cbCCDflipH1Click(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
    procedure trbFrameRateChange(Sender: TObject);
    procedure trbCCDTimeChange(Sender: TObject);
    procedure trbCCDAGainChange(Sender: TObject);
    procedure trbColorTempChange(Sender: TObject);
    procedure trbTintChange(Sender: TObject);
    procedure trbHueChange(Sender: TObject);
    procedure trbSaturationChange(Sender: TObject);
    procedure trbBrightnessChange(Sender: TObject);
    procedure trbContrastChange(Sender: TObject);
    procedure trbGammaChange(Sender: TObject);
    procedure btnDefaultWBClick(Sender: TObject);
    procedure btnDefaultColorClick(Sender: TObject);
    procedure btnAutoWBClick(Sender: TObject);


  private
    f_ti: TToupcamInst;
    f_nIndex: Integer;
    f_hToupCam: HToupCam;
    f_header: BITMAPINFOHEADER;
    f_hWnd: HWND;
    f_pData: PByte;
    f_dwLastTick, f_dwStartTick, f_nFrameCount: Cardinal;
    f_paused:LongBool;

    fMaxExpTime:Cardinal;
    fSmallTime:Cardinal;

    fCCdTimerRepeat:Integer;
    fCCdTimerCur:Integer;

    fLastTarget,fLastAGain,fLastTime:Cardinal;
    fLastColorTemp, fLastTint:integer;
    fLastHue, fLastSaturation, fLastBrightness, fLastContrast, fLastGamma :integer;

    function TDIBWIDTHBYTES(bits: Integer): Cardinal;
    procedure Log(str:string);
    procedure OnTimer();
  public
    function err(cmd: HRESULT): Boolean;
    function FindDevice(): boolean;
    function OpenDevice:boolean;
    procedure UpdateFrameText();
    procedure UpdateResolutionText();
    procedure UpdateExposureTimeText();
    procedure UpdateTintTempText();
    procedure UpdateControls();
    procedure CloseDevice;
    procedure OnDeviceChanged();
    procedure ChangeResolution();
    procedure FlipV();
    procedure FlipH();
    procedure OnCCDAE();
    function GetData(pHeader: PPBITMAPINFOHEADER; pData: PPByte): Boolean;

    //messages
    procedure OnEventUsbError();
    procedure OnEventUsbDisconnected();
    procedure OnEventExpo();
    procedure OnEventTemptint();
    procedure OnEventImage();
    procedure OnEventSnap();
    property hWnd: HWND read f_hWnd write f_hWnd;

  end;

var CanChange:boolean=true;

implementation

uses
  Main, Log;

{$R *.dfm}

procedure TdevToupcam.btnAutoWBClick(Sender: TObject);
begin
if f_hToupCam<>nil then
   err(Toupcam_AwbOnePush(f_hToupCam, nil, nil));

end;

procedure TdevToupcam.btnDefaultColorClick(Sender: TObject);
begin
    trbHue.Position:= TOUPCAM_HUE_DEF;
    trbSaturation.Position:= TOUPCAM_SATURATION_DEF;
    trbBrightness.Position:= TOUPCAM_BRIGHTNESS_DEF;
    trbContrast.Position:= TOUPCAM_CONTRAST_DEF;
    trbGamma.Position:= TOUPCAM_GAMMA_DEF;
end;

procedure TdevToupcam.btnDefaultWBClick(Sender: TObject);
begin
   trbColorTemp.Position:= TOUPCAM_TEMP_DEF;
   trbTint.Position:= TOUPCAM_TINT_DEF;
end;

procedure TdevToupcam.btnFindClick(Sender: TObject);
begin
   if FindDevice then
    OpenDevice;
end;

procedure TdevToupcam.btnPauseClick(Sender: TObject);
var bPause:LongBool;
begin
if f_hToupCam<>nil then
  begin
    f_paused:=not f_paused;
//    bPause:=btnPause.Down;
    err(Toupcam_Pause(f_hToupCam, f_paused));
//if ( not err(Toupcam_Pause(f_hToupCam, bPause))) then btnPause.Down:=not btnPause.Down;
   end;
end;

procedure TdevToupcam.btnStartClick(Sender: TObject);
begin
CloseDevice;
OpenDevice;
end;

procedure TdevToupcam.btnStopClick(Sender: TObject);
begin
CloseDevice;
end;

procedure TdevToupcam.cbCCDAE1Click(Sender: TObject);
begin
if CanChange then
OnCCDAE;
end;

procedure TdevToupcam.cbCCDflipH1Click(Sender: TObject);
begin
if CanChange then
FlipH;
end;

procedure TdevToupcam.cbCCDflipV1Click(Sender: TObject);
begin
if CanChange then
FlipV;
end;

procedure TdevToupcam.cboxCCDChange(Sender: TObject);
begin
  f_nIndex := cboxCCD.ItemIndex;
  OpenDevice;
end;

procedure TdevToupcam.cboxCCDResChange(Sender: TObject);
begin
ChangeResolution;
end;

procedure TdevToupcam.ChangeResolution;
var nResolutionIndex:Cardinal;
begin
 if (f_Htoupcam <> nil) then
  begin
  nResolutionIndex:=cboxCCDres.ItemIndex;
  Toupcam_Stop(f_hToupCam);
  if f_pData <> nil then
    begin
      FreeMem(f_pData, sizeof(f_pData));
      f_pData := nil;
    end;

  err(Toupcam_put_eSize(f_hToupCam , nResolutionIndex));

    OnDeviceChanged();
    UpdateFrameText();
    cboxCCDres.ItemIndex := nResolutionIndex;
    if (err(Toupcam_get_Size(f_Htoupcam, @f_header.biWidth, @f_header.biHeight))) then
    begin
      f_header.biSizeImage := TDIBWIDTHBYTES(f_header.biWidth * f_header.biBitCount) * f_header.biHeight;
      f_pData := AllocMem(f_header.biSizeImage);

      ievCCD.IEBitmap.Allocate(f_header.biWidth, f_header.biHeight, ie24RGB);
      ievCCD.IO.Params.BMPRAW_ChannelOrder := coBGR;
      ievCCD.IO.Params.BMPRAW_Planes := plInterleaved;
      ievCCD.IO.Params.BMPRAW_RowAlign := 8;
      ievCCD.IO.Params.BMPRAW_HeaderSize := 0;

      if (err(Toupcam_StartPullModeWithWndMsg(f_Htoupcam, f_hWnd, MSG_CAMEVENT))) then
      begin
       btnPause.Enabled := True;
                  //fOwnerForm.btnSnap.Enabled:=True;
      end;
    end;

  end;
end;

procedure TdevToupcam.CloseDevice;
var strRegPath:WideString;
    pC:PWideChar;
begin
  strRegPath:= 'Software\DTU\RBoXX'+#0;
  pC:=@strRegPath[1];
  Toupcam_EnableReg(pC);

  if (f_Htoupcam <> nil) then
  begin
    Toupcam_Close(f_Htoupcam);
    f_Htoupcam := nil;

    if f_pData <> nil then
    begin
      FreeMem(f_pData, sizeof(f_pData));
      f_pData := nil;
    end;
  end;
   OnDeviceChanged();
//  FormMain.TimerCCD.Enabled:=True;

end;

function TdevToupcam.err(cmd: HRESULT): Boolean;
var
  error: HRESULT;
begin
  error := cmd;
  //temporary
  if Integer(error) >= 0 then
    Result := True
  else
  begin
    Log('Err: ' + IntToStr(Integer(error)));
    Result := False;
  end;
end;


function TdevToupcam.FindDevice: boolean;
var
  cnt: Cardinal;
  i: Integer;
  name: string;
begin

  FillChar(f_ti, Sizeof(f_ti), 0);
  FillChar(f_header, SizeOf(f_header), 0);

  f_header.biSize := SizeOf(BITMAPINFOHEADER);
  f_header.biPlanes := 1;
  f_header.biBitCount := 24;

  cnt := Toupcam_Enum(@f_ti);

  cboxCCD.Clear;
  if cnt = 0 then
  begin
    Log('No device');
    cboxCCD.Text:='No Device';
    Result:=false;
  end
  else
  begin
    for i := 0 to cnt - 1 do
    begin
      name := WideCharToString(f_ti[i].displayname);
      cboxCCD.Items.Add(Format('%s', [name]));
    end;
    f_nIndex := 0;
    cboxCCD.ItemIndex := 0;
    OnDeviceChanged;
    Result:=true;
  end;
end;

procedure TdevToupcam.FlipH;
var b: LongBool;
begin
  if (f_hToupCam <> nil) then
  begin
    b := False;
    if (err(Toupcam_get_HFlip(f_Htoupcam, @b))) then
    begin
      b := not b;
      Toupcam_put_HFlip(f_Htoupcam, b);
      cbCCDflipH.Checked := b;
    end;
  end;
end;

procedure TdevToupcam.FlipV;
var b: LongBool;
begin
  if (f_hToupCam <> nil) then
  begin
    b := False;
    if (err(Toupcam_get_VFlip(f_Htoupcam, @b))) then
    begin
      b := not b;
      Toupcam_put_VFlip(f_Htoupcam, b);
      cbCCDflipV.Checked := b;
    end;
  end;

end;

procedure TdevToupcam.FormCreate(Sender: TObject);
begin
  FillChar(f_ti, Sizeof(f_ti), 0);
  FillChar(&f_header, SizeOf(f_header), 0);

  f_header.biSize := SizeOf(BITMAPINFOHEADER);
  f_header.biPlanes := 1;
  f_header.biBitCount := 24;

  f_Htoupcam := nil;
  f_nFrameCount := 0;
  f_dwStartTick := 0;
  fSmallTime:=30000;
  fCCdTimerRepeat:=10;  //(10 *300)
  fCCdTimerCur:=0;
  f_hWnd:=(Sender as TForm).Handle;

end;

function TdevToupcam.GetData(pHeader: PPBITMAPINFOHEADER;
  pData: PPByte): Boolean;
begin
    if (f_pData <> nil) then
  begin
    pData^ := f_pData;
    pHeader^ := @f_header;
    result := True;
  end
  else
    result := False;

end;

procedure TdevToupcam.Log(str: string);
begin
  TTask.Run( procedure
      begin
       TThread.Synchronize( nil, procedure
          begin
          if FormLog<>nil then
          if FormLog.MemoLog<>nil then
          FormLog.MemoLog.Lines.Add('Toupcam  '+str);
          end);
      end);
end;

procedure TdevToupcam.OnCCDAE;
var
  bAutoExposure: LongBool;
begin
  if (f_hToupCam <> nil) then
  begin
    bAutoExposure := False;
    if (err(Toupcam_get_AutoExpoEnable(f_Htoupcam, @bAutoExposure))) then
    begin
      bAutoExposure := not bAutoExposure;
      Toupcam_put_AutoExpoEnable(f_Htoupcam, bAutoExposure);
      cbCCDAE.Checked := bAutoExposure;
      trbCCDAE.Enabled:= bAutoExposure;
      trbCCDAGain.Enabled:= not bAutoExposure;
      trbCCDTime.Enabled:= not bAutoExposure;
    end;
  end;
end;

procedure TdevToupcam.OnDeviceChanged;
var
  eSize: Cardinal;
  str: string;
  i: Integer;
  int: Cardinal;

begin
  if (f_Htoupcam = nil) then
  begin
    cboxCCDres.Items.Clear;
    cboxCCDres.Text := '---';
    StatusBarCCD.Panels[0].Text := '';
    StatusBarCCD.Panels[1].Text := '';
    StatusBarCCD.Panels[2].Text := '';
    StatusBarCCD.Panels[3].Text := '';
  end
  else
  begin
    eSize := 0;
    Toupcam_get_eSize(f_Htoupcam, @eSize);

    cboxCCDres.Items.Clear;
    for i := 0 to f_ti[f_nIndex].model^.preview - 1 do
    begin
      int := (f_ti[f_nIndex].model^.res[i].width);
      str := IntToStr(int);
      int := (f_ti[f_nIndex].model^.res[i].height);
      str := str + 'x' + IntToStr(int);
      cboxCCDres.Items.Add(str);
    end;


    UpdateResolutionText();
    UpdateExposureTimeText();
    UpdateTintTempText();

  end;

end;

procedure TdevToupcam.OnEventExpo;
begin
    UpdateExposureTimeText;
end;

procedure TdevToupcam.OnEventImage;
begin
   if (not err(Toupcam_PullImage(f_Htoupcam, f_pData, 24, nil, nil))) then
    exit;
  Inc(f_nFrameCount);
  if (f_dwStartTick = 0) then
  begin
    f_dwStartTick := GetTickCount();
    f_dwLastTick := f_dwStartTick;
  end
  else
    f_dwLastTick := GetTickCount();

  SendMessage(f_hWnd, WM_CCDPAINT, 0, 0);
      //m_view.Invalidate();
  UpdateFrameText;
end;

procedure TdevToupcam.OnEventSnap;
begin

end;

procedure TdevToupcam.OnEventTemptint;
begin
 UpdateTintTempText;
end;

procedure TdevToupcam.OnEventUsbDisconnected;
begin
 CloseDevice();
 ShowMessage('The camera is disconnected, maybe has been pulled out.');
end;

procedure TdevToupcam.OnEventUsbError;
begin
 CloseDevice();
 Log('USB error');
// ShowMessage('Toupcam USB error');
end;

procedure TdevToupcam.OnTimer;
var Target, AGain:Word;
    Time:Cardinal;
    temp, tint:Integer;
begin
    CanChange:=False;

if trbCCDAE.Position<>fLastTarget then
     begin
     Target:= trbCCDAE.Position;
      if f_hToupCam<>nil then
          err(  Toupcam_put_AutoExpoTarget(f_hToupCam, Target));
//          fLastTarget:= trbCCDAE.Position;
     end;

if trbCCDTime.Position<>fLastTime then
     begin
     Time:= trbCCDTime.Position;
    if f_hToupCam<>nil then
        begin
        err( Toupcam_put_ExpoTime(f_hToupCam, Time));
//        Log(Format('Time Target=%d',[Time]  ) );
        end;
        fLastTime:= trbCCDTime.Position;
     end;

if trbCCDAGain.Position<>fLastAGain then
     begin
     AGain:= trbCCDAGain.Position;
      if f_hToupCam<>nil then
           begin
          err( Toupcam_put_ExpoAGain(f_hToupCam, AGain));
//          Log(Format('AGain Target=%d',[AGain]  ) );
           end;
      fLastAGain:= trbCCDAGain.Position;
     end;

if (trbColorTemp.Position<>fLastColorTemp) or (trbTint.Position<>fLastTint) then
     begin
     fLastColorTemp:= trbColorTemp.Position;
     fLastTint:= trbTint.Position;
      if f_hToupCam<>nil then
           begin
           if err( Toupcam_put_TempTint(f_hToupCam, fLastColorTemp,fLastTint)) then
//           Log(Format('ColorTemp=%d Tint=%d',[fLastColorTemp,fLastTint ]  ) );
           end;
     end;

if (trbHue.Position<>fLastHue) then
     begin
     fLastHue:= trbHue.Position;
      if f_hToupCam<>nil then
           begin
           if err( Toupcam_put_Hue(f_hToupCam, fLastHue)) then
//           Log(Format('Hue=%d',[fLastHue ]  ) );
           end;
     end;

if (trbSaturation.Position<>fLastSaturation) then
     begin
     fLastSaturation:= trbSaturation.Position;
      if f_hToupCam<>nil then
           begin
           if err( Toupcam_put_Saturation(f_hToupCam, fLastSaturation)) then
//           Log(Format('Saturation=%d',[fLastSaturation ]  ) );
           end;
     end;

if (trbBrightness.Position<>fLastBrightness) then
     begin
     fLastBrightness:= trbBrightness.Position;
      if f_hToupCam<>nil then
           begin
           if err( Toupcam_put_Brightness(f_hToupCam, fLastBrightness)) then
//           Log(Format('Brightness=%d',[fLastBrightness ]  ) );
           end;
     end;

if (trbContrast.Position<>fLastContrast) then
     begin
     fLastContrast:= trbContrast.Position;
      if f_hToupCam<>nil then
           begin
           if err( Toupcam_put_Contrast(f_hToupCam, fLastContrast)) then
//           Log(Format('Contrast=%d',[fLastContrast ]  ) );
           end;
     end;

if (trbGamma.Position<>fLastGamma) then
     begin
     fLastGamma:= trbGamma.Position;
      if f_hToupCam<>nil then
           begin
           if err( Toupcam_put_Gamma(f_hToupCam, fLastGamma)) then
//           Log(Format('Gamma=%d',[fLastGamma ]  ) );
           end;
     end;

CanChange:=true;

Inc( fCCdTimerCur);
if(fCCdTimerRepeat = fCCdTimerCur) then
     begin
      fCCdTimerCur:=0;
      TimerCCD.Enabled:= False;
     end;

end;

function TdevToupcam.OpenDevice:boolean;
begin
 // CloseDevice();
  btnPause.Down := False;
  btnPause.Enabled := False;
  f_paused:=False;

  f_Htoupcam := Toupcam_Open(@f_ti[f_nIndex].id);
//  f_Htoupcam := Toupcam_OpenByIndex(f_nIndex);


  if (f_Htoupcam <> nil) then
  begin

    OnDeviceChanged();
    UpdateFrameText();
    UpdateControls;
    cboxCCDres.ItemIndex := 0;


    if (err(Toupcam_get_Size(f_Htoupcam, @f_header.biWidth, @f_header.biHeight))) then
    begin
      f_header.biSizeImage := TDIBWIDTHBYTES(f_header.biWidth * f_header.biBitCount) * f_header.biHeight;
      f_pData := AllocMem(f_header.biSizeImage);

      ievCCD.IEBitmap.Allocate(f_header.biWidth, f_header.biHeight, ie24RGB);
      ievCCD.IO.Params.BMPRAW_ChannelOrder := coBGR;
      ievCCD.IO.Params.BMPRAW_Planes := plInterleaved;
      ievCCD.IO.Params.BMPRAW_RowAlign := 8;
      ievCCD.IO.Params.BMPRAW_HeaderSize := 0;


      if (err(Toupcam_StartPullModeWithWndMsg(f_Htoupcam, f_hWnd, MSG_CAMEVENT))) then
      begin
        btnPause.Enabled := True;
        TimerCCD.Enabled:=True;
                  //fOwnerForm.btnSnap.Enabled:=True;
      end;
    end;

  end;
end;



function TdevToupcam.TDIBWIDTHBYTES(bits: Integer): Cardinal;
begin
  result := ((bits + 31) div 32) * 4;
end;

procedure TdevToupcam.TimerCCDTimer(Sender: TObject);
begin
OnTimer;
end;

procedure TdevToupcam.trbBrightnessChange(Sender: TObject);
begin
lblBrightness.Caption:=trbBrightness.Position.ToString;
if CanChange then
TimerCCD.Enabled:=True;
end;

procedure TdevToupcam.trbCCDAEChange(Sender: TObject);
begin
lblExposureTarget.Caption:=trbCCDAE.Position.ToString;

if CanChange then
TimerCCD.Enabled:=True;
end;

procedure TdevToupcam.trbCCDAGainChange(Sender: TObject);
begin
lblAGain.Caption:=trbCCDAGain.Position.ToString;

if CanChange then
TimerCCD.Enabled:=True;
end;

procedure TdevToupcam.trbCCDTimeChange(Sender: TObject);
begin
lblExposureTime.Caption:=(trbCCDTime.Position/1000).ToString; {us->ms}

if CanChange then
TimerCCD.Enabled:=True;
end;

procedure TdevToupcam.trbColorTempChange(Sender: TObject);
begin
lblColorTemp.Caption:=trbColorTemp.Position.ToString;
if CanChange then
TimerCCD.Enabled:=True;
end;

procedure TdevToupcam.trbContrastChange(Sender: TObject);
begin
lblContrast.Caption:=trbContrast.Position.ToString;
if CanChange then
TimerCCD.Enabled:=True;
end;

procedure TdevToupcam.trbFrameRateChange(Sender: TObject);
var speed:Word;
begin
speed:=trbFrameRate.Position;

if CanChange then
     err(Toupcam_put_Speed(f_Htoupcam, speed));

//       trbFrameRate.Position:=speed;
end;

procedure TdevToupcam.trbGammaChange(Sender: TObject);
begin
lblGamma.Caption:=trbGamma.Position.ToString;
if CanChange then
TimerCCD.Enabled:=True;
end;

procedure TdevToupcam.trbHueChange(Sender: TObject);
begin
lblHue.Caption:=trbHue.Position.ToString;
if CanChange then
TimerCCD.Enabled:=True;
end;

procedure TdevToupcam.trbSaturationChange(Sender: TObject);
begin
lblSaturation.Caption:=trbSaturation.Position.ToString;
if CanChange then
TimerCCD.Enabled:=True;
end;

procedure TdevToupcam.trbTintChange(Sender: TObject);
begin
lblTint.Caption:=trbTint.Position.ToString;
if CanChange then
TimerCCD.Enabled:=True;
end;

procedure TdevToupcam.UpdateControls;
var Target, nMin, nMax, nDef, speed :Word;
    nMinT, nMaxT, nDefT :Cardinal;
    b, bAutoExposure:LongBool;
    int, temp, tint:Integer;
begin
if f_hToupCam<>nil then
  begin
  CanChange:=False;
   //| Auto Exposure Target    |   10~230      |   120
   trbCCDAE.Max:=TOUPCAM_AETARGET_MAX;
   trbCCDAE.Min:=TOUPCAM_AETARGET_MIN;
   trbCCDAE.Position:=TOUPCAM_AETARGET_DEF;

   if err(Toupcam_get_AutoExpoTarget(f_hToupCam, @Target)) then
     begin
     trbCCDAE.Position:=Target;
     fLastTarget:=Target;
     end;

   trbCCDAGain.Max:=TOUPCAM_WBGAIN_MAX;
   trbCCDAGain.Min:=TOUPCAM_WBGAIN_MIN;
   trbCCDAGain.Position:=TOUPCAM_WBGAIN_DEF;

   if err(Toupcam_get_ExpoAGainRange(f_hToupCam, @nMin, @nMax, @nDef)) then
           begin
            trbCCDAGain.Max:=nMax;
            trbCCDAGain.Min:=nMin;
            trbCCDAGain.Position:=nDef;
            Log(Format('AGain Min=%d, Max=%d, Def=%d  ',[nMin,nMax,nDef]  ) );
           end;
   if err(Toupcam_get_ExpoAGain(f_hToupCam, @nDef)) then
            begin
            trbCCDAGain.Position:=nDef;
            fLastAGain:=nDef;
            Log(Format('AGain =%d',[nDef]  ) );
            end;

   if err(Toupcam_get_ExpTimeRange(f_hToupCam, @nMinT, @nMaxT, @nDefT)) then
           begin
            fMaxExpTime:=nMaxT;
            trbCCDTime.Max:=nMaxT;
            trbCCDTime.Min:=nMinT;
            trbCCDTime.Position:=nDefT;
            Log(Format('Time Min=%d, Max=%d, Def=%d  ',[nMinT,nMaxT,nDefT]  ) );
           end;
   if err(Toupcam_get_ExpoTime(f_hToupCam, @nDefT)) then
            begin
            trbCCDTime.Position:=nDefT;
            fLastTime:=nDefT;
            Log(Format('Time =%d',[nDefT]  ) );
            end;

    if (err(Toupcam_get_HFlip(f_Htoupcam, @b))) then
         cbCCDflipH.Checked := b
       else
       Log('Error HFlip determine');

    if (err(Toupcam_get_VFlip(f_Htoupcam, @b))) then
         cbCCDflipV.Checked := b
       else
       Log('Error VFlip determine');


    bAutoExposure := True;
    if (err(Toupcam_get_AutoExpoEnable(f_Htoupcam, @bAutoExposure))) then
      begin
      cbCCDAE.Checked := bAutoExposure;
      trbCCDAE.Enabled:= bAutoExposure;
      trbCCDAGain.Enabled:= not bAutoExposure;
      trbCCDTime.Enabled:= not bAutoExposure;
      end;

    int:=Toupcam_get_MaxSpeed(f_Htoupcam);
    trbFrameRate.Max:=int;
    Log(Format('FrameRate Max = %d',[int]));
    if err(Toupcam_get_Speed(f_Htoupcam, @speed)) then
       trbFrameRate.Position:=speed;


    trbColorTemp.Min:= TOUPCAM_TEMP_MIN;
    trbColorTemp.Max:= TOUPCAM_TEMP_MAX;
    trbColorTemp.Position:= TOUPCAM_TEMP_DEF;

    trbTint.Min:= TOUPCAM_TINT_MIN;
    trbTint.Max:= TOUPCAM_TINT_MAX;
    trbTint.Position:= TOUPCAM_TINT_DEF;

     if err(Toupcam_get_TempTint(f_Htoupcam, @temp, @tint )) then
     begin
     trbColorTemp.Position:=temp;
     fLastColorTemp:=temp;
     trbTint.Position:=tint;
     fLastTint:=tint;

     end;

    trbHue.Min:= TOUPCAM_HUE_MIN;
    trbHue.Max:= TOUPCAM_HUE_MAX;
    trbHue.Position:= TOUPCAM_HUE_DEF;

    if err(Toupcam_get_Hue(f_Htoupcam, @int )) then
     begin
     trbHue.Position:=int;
     fLastHue:=int;
     end;

    trbSaturation.Min:= TOUPCAM_SATURATION_MIN;
    trbSaturation.Max:= TOUPCAM_SATURATION_MAX;
    trbSaturation.Position:= TOUPCAM_SATURATION_DEF;

    if err(Toupcam_get_Saturation(f_Htoupcam, @int )) then
     begin
     trbSaturation.Position:=int;
     fLastSaturation:=int;
     end;


    trbBrightness.Min:= TOUPCAM_BRIGHTNESS_MIN;
    trbBrightness.Max:= TOUPCAM_BRIGHTNESS_MAX;
    trbBrightness.Position:= TOUPCAM_BRIGHTNESS_DEF;

    if err(Toupcam_get_Brightness(f_Htoupcam, @int )) then
     begin
     trbBrightness.Position:=int;
     fLastBrightness:=int;
     end;

    trbContrast.Min:= TOUPCAM_CONTRAST_MIN;
    trbContrast.Max:= TOUPCAM_CONTRAST_MAX;
    trbContrast.Position:= TOUPCAM_CONTRAST_DEF;

    if err(Toupcam_get_Contrast(f_Htoupcam, @int )) then
     begin
     trbContrast.Position:=int;
     fLastContrast:=int;
     end;

    trbGamma.Min:= TOUPCAM_GAMMA_MIN;
    trbGamma.Max:= TOUPCAM_GAMMA_MAX;
    trbGamma.Position:= TOUPCAM_GAMMA_DEF;

    if err(Toupcam_get_Gamma(f_Htoupcam, @int )) then
     begin
     trbGamma.Position:=int;
     fLastGamma:=int;
     end;

  CanChange:=True;
  end;
end;

procedure TdevToupcam.UpdateExposureTimeText;
var
  nTime: Cardinal;
  AGain: Word;
begin
  nTime := 0;
  AGain := 0;
  if (err(Toupcam_get_ExpoTime(f_Htoupcam, @nTime)) and err(Toupcam_get_ExpoAGain(f_Htoupcam, @AGain))) then

      StatusBarCCD.Panels[1].Text := Format('ExpTime=%d, AGain=%d ', [nTime, AGain]);
end;

procedure TdevToupcam.UpdateFrameText;
var
  str: string;
begin
  if (f_dwLastTick <> f_dwStartTick) then
    str := Format('%d , %.2f ', [f_nFrameCount, f_nFrameCount / ((f_dwLastTick - f_dwStartTick) / 1000.0)])
  else
    str := Format('%d ', [f_nFrameCount]);

    StatusBarCCD.Panels[3].Text := str;
end;

procedure TdevToupcam.UpdateResolutionText;
var
  nWidth, nHeight: integer;
begin
  nWidth := 0;
  nHeight := 0;
  if (err(Toupcam_get_Size(f_Htoupcam, @nWidth, @nHeight))) then

      StatusBarCCD.Panels[0].Text := Format('%d x %d ', [nWidth, nHeight]);
end;

procedure TdevToupcam.UpdateTintTempText;
var
  nTemp, nTint: Integer;
begin
  nTemp := TOUPCAM_TEMP_DEF;
  nTint := TOUPCAM_TINT_DEF;
  if (err(Toupcam_get_TempTint(f_Htoupcam, @nTemp, @nTint))) then

      StatusBarCCD.Panels[2].Text := Format('Temp=%d, Tint=%d ', [nTemp, nTint]);
end;

end.
