unit uToupcamG32;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, libToupcam, sComboBox,
  Vcl.ToolWin, Vcl.ComCtrls, sToolBar, sStatusBar, sButton, Vcl.ExtCtrls, sPanel,
  sGroupBox, aceScrollPanel, sCheckBox, GR32, GR32_Image,GR32_Resamplers,
  sPageControl, sScrollBox, sTrackBar, sLabel, sSkinProvider, System.IOUtils, System.Threading, devControllerM,
  sEdit, sSpinEdit, System.ImageList, Vcl.ImgList, acAlphaImageList, VectorInstruments,
  Vcl.ExtDlgs, System.IniFiles, System.ZLib;

const
    MSG_CAMEVENT = WM_APP + 1;

    ObjCount = 5;
//////////////////////////
///  X10 objective
///
    X10_prop_stepsToPix_X = 6.4271;
    X10_prop_stepsToPix_Y = 6.4583;
    X10_prop_encToPix_X = 16.05885;
    X10_prop_encToPix_Y = 16.13833;
    X10_laserPosition_X = 40;
    X10_laserPosition_Y = 50;

///  X50 objective  ***preliminary
///
    X50_prop_stepsToPix_X = 1.28542;
    X50_prop_stepsToPix_Y = 1.29166;
    X50_prop_encToPix_X = 3.21177;
    X50_prop_encToPix_Y = 3.227666;
    X50_laserPosition_X = 40;
    X50_laserPosition_Y = 50;

////////////////////////////



type
    TTile = record
     idx:Integer;
     fileName: string;
     encPoint:TPoint;
     pixPoint:TPoint;
     btm:TBitmap32;
    end;


   TObjective = record
     name:string;
     prop_stepsToPix_X, prop_stepsToPix_Y, prop_encToPix_X, prop_encToPix_Y :Double;
     laserPosition_X, laserPosition_Y : Integer;
   end;


type
  TScanThread = class;

  TdevToupcamG = class(TForm)
    StatusBarCCD: TsStatusBar;
    PaintBox: TPaintBox32;
    pnlControls: TsPanel;
    pcControls: TsPageControl;
    tsCameraMain: TsTabSheet;
    tsCamera2nd: TsTabSheet;
    tsHotelki: TsTabSheet;
    tsService: TsTabSheet;
    MemoLog: TMemo;
    btnPullImage: TsButton;
    pnlTop: TsPanel;
    btnMZoomMinus: TsButton;
    btnMZoomPlus: TsButton;
    btnSettings: TsButton;
    pnlMap: TsPanel;
    sScrollBox1: TsScrollBox;
    cboxCCD: TsComboBox;
    btnFind: TsButton;
    gbResolution: TsGroupBox;
    cboxCCDresPrev: TsComboBox;
    cboxCCDresSnap: TsComboBox;
    sGroupBox1: TsGroupBox;
    btnStop: TsButton;
    btnPlay: TsButton;
    btnPause: TsButton;
    btnSnap: TsButton;
    TimerCCD: TTimer;
    sScrollBox2: TsScrollBox;
    gbColorAdjustment: TsGroupBox;
    lblGamma: TsLabel;
    lblContrast: TsLabel;
    lblBrightness: TsLabel;
    lblSaturation: TsLabel;
    lblHue: TsLabel;
    sLabel7: TsLabel;
    sLabel10: TsLabel;
    sLabel12: TsLabel;
    sLabel14: TsLabel;
    sLabel16: TsLabel;
    trbHue: TsTrackBar;
    trbSaturation: TsTrackBar;
    trbBrightness: TsTrackBar;
    trbContrast: TsTrackBar;
    trbGamma: TsTrackBar;
    btnDefaultColor: TsButton;
    gbFrameRate: TsGroupBox;
    sLabel4: TsLabel;
    sLabel5: TsLabel;
    trbFrameRate: TsTrackBar;
    rgDataFormat: TsRadioGroup;
    rgBitDepth: TsRadioGroup;
    gb48bit: TsGroupBox;
    cbRGB48: TsCheckBox;
    gbFlip: TsGroupBox;
    cbCCDflipV: TsCheckBox;
    cbCCDflipH: TsCheckBox;
    gbExposure: TsGroupBox;
    sLabel1: TsLabel;
    lblExposureTarget: TsLabel;
    sLabel3: TsLabel;
    lblExposureTime: TsLabel;
    sLabel2: TsLabel;
    lblAGain: TsLabel;
    cbCCDAE: TsCheckBox;
    trbCCDAE: TsTrackBar;
    trbCCDAGain: TsTrackBar;
    trbCCDTime: TsTrackBar;
    gWhiteBalance: TsGroupBox;
    lblTint: TsLabel;
    lblColorTemp: TsLabel;
    sLabel8: TsLabel;
    sLabel6: TsLabel;
    btnDefaultWB: TsButton;
    btnAutoWB: TsButton;
    trbTint: TsTrackBar;
    trbColorTemp: TsTrackBar;
    sSkinProvider1: TsSkinProvider;
    RepaintTimer: TTimer;
    btnNewMap: TsButton;
    btnSnapToMap: TsButton;
    edtPropPixStep: TsDecimalSpinEdit;
    edtPropPixEnc: TsDecimalSpinEdit;
    cbUseEncoders: TsCheckBox;
    sAlphaImageList1: TsAlphaImageList;
    sToolBar1: TsToolBar;
    btnViSelect: TToolButton;
    btnViLine: TToolButton;
    btnViMeasure: TToolButton;
    ToolButton4: TToolButton;
    btnViDelete: TToolButton;
    btnViDeleteAll: TToolButton;
    btnViRect: TToolButton;
    btnScanVis: TsButton;
    btnStopScanVis: TsButton;
    btnViGrid: TToolButton;
    pnlGridnXnY: TsPanel;
    spedtGridnX: TsSpinEdit;
    spedtGridnY: TsSpinEdit;
    btnSetScanParams: TsButton;
    btnSave: TsButton;
    SavePictureDialog: TSavePictureDialog;  procedure btnFindClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnSnapToMapClick(Sender: TObject);
    procedure btnPullImageClick(Sender: TObject);
    procedure btnPauseClick(Sender: TObject);
    procedure btnPlayClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure btnSnapClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rgBitDepthChange(Sender: TObject);
    procedure rgDataFormatChange(Sender: TObject);
    procedure cbRGB48Click(Sender: TObject);
    procedure PaintBoxResize(Sender: TObject);
    procedure btnMZoomMinusClick(Sender: TObject);
    procedure btnMZoomPlusClick(Sender: TObject);
    procedure PaintBoxMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnSettingsClick(Sender: TObject);
    procedure cbCCDAEClick(Sender: TObject);
    procedure trbCCDAEChange(Sender: TObject);
    procedure trbCCDTimeChange(Sender: TObject);
    procedure trbCCDAGainChange(Sender: TObject);
    procedure TimerCCDTimer(Sender: TObject);
    procedure cbCCDflipVClick(Sender: TObject);
    procedure cbCCDflipHClick(Sender: TObject);
    procedure trbColorTempChange(Sender: TObject);
    procedure trbTintChange(Sender: TObject);
    procedure btnAutoWBClick(Sender: TObject);
    procedure btnDefaultWBClick(Sender: TObject);
    procedure trbHueChange(Sender: TObject);
    procedure trbSaturationChange(Sender: TObject);
    procedure trbBrightnessChange(Sender: TObject);
    procedure trbContrastChange(Sender: TObject);
    procedure trbGammaChange(Sender: TObject);
    procedure btnDefaultColorClick(Sender: TObject);
    procedure trbFrameRateChange(Sender: TObject);
    procedure PaintBoxMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PaintBoxMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnNewMapClick(Sender: TObject);
    procedure PaintBoxMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure PaintBoxMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure RepaintTimerTimer(Sender: TObject);
    procedure cbUseEncodersClick(Sender: TObject);
    procedure btnViSelectClick(Sender: TObject);
    procedure btnViDeleteClick(Sender: TObject);
    procedure btnViDeleteAllClick(Sender: TObject);
    procedure PaintBoxPaintBuffer(Sender: TObject);
    procedure btnScanVisClick(Sender: TObject);
    procedure btnStopScanVisClick(Sender: TObject);
    procedure spedtGridnXChange(Sender: TObject);
    procedure btnSetScanParamsClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    f_ti: TToupcamInst;
    f_nIndex: Integer;
    f_hToupCam: HToupCam;
    f_header: BITMAPINFOHEADER;
    f_pData: PByte;

    f_Pause:Boolean;
    f_dwLastTick, f_dwStartTick, f_nFrameCount: Cardinal;
    fMaxExpTime:Cardinal;

    snapResolutionIndex:Cardinal;
    fCanChange:Boolean;

    btmPrev, btmSnap:TBitmap32;

    fCCdTimerRepeat:Integer;
    fCCdTimerCur:Integer;

    fLastTarget,fLastAGain,fLastTime:Cardinal;
    fLastColorTemp, fLastTint:integer;
    fLastHue, fLastSaturation, fLastBrightness, fLastContrast, fLastGamma :integer;

    procedure Log(str:string);
    function err(cmd: HRESULT): Boolean;
    function TDIBWIDTHBYTES(bits: Integer): Cardinal;

    procedure OnMsgCamEvent(var Msg: TMessage); message MSG_CAMEVENT;

    procedure UpdateFrameText;
    procedure UpdateExposureTimeText();
    procedure UpdateTintTempText;

    procedure OnTimer();
    procedure UpdateControls();
    procedure FlipV();
    procedure FlipH();


  public
    UsedObjective:Integer;
    Objectives:array[0..ObjCount-1] of TObjective;

    function FindDevice: boolean;
    procedure OnChangeDevice();
    procedure GetInfoAbout;
    procedure InitControls;


    function OpenDevice:boolean;
    function OnChangeResolution:Boolean;
    procedure CloseDevice;

    function StartPreview():Boolean;
    function Stop():Boolean;

    procedure OnCCDAE();

  private
    //messages
    procedure OnEventUsbError();
    procedure OnEventUsbDisconnected();
    procedure OnEventExpo();
    procedure OnEventTemptint();
    procedure OnEventImage();
    procedure OnEventSnap();

  private
    // UInterface
    bShowCameraControls:Boolean;


    procedure loadUISettings;
    procedure saveUISettings;

    procedure changeControlsPanel(w:boolean);

  private
  //Coordinates

   const ZoomScale=1.4;

   var
    mapZoom:Double;
//    drawZoom:Double;
    zoomStep:Integer;

    gblCenter, gblPrevCenter:TPoint;
    EncZeroPoint, EncStartPoint, EncCurPoint, EncShift:TPoint;

    prop_stepsToPix_X, prop_stepsToPix_Y, prop_encToPix_X, prop_encToPix_Y: Single;
    laserPositionX, laserPositionY:Integer;

    startDragPoint:TPoint;
    bStartDrag:Boolean;
    bWaitNextStep:Boolean;
    gblShift:TPoint;
    bSnapIsReady:Boolean;
    bTilesInMemory:Boolean;

    bUseEncodersLoopBack:Boolean;

    btmMoving:TBitmap32;
    movingZoomLevel:Integer;

    TilesDirectory, TilesPath:string;

    Tiles:array of TTile;
    VisibleRect:TRect;

    Controller:TControllerM;
    ScanThread:TScanThread;

   function SnapTile:Boolean;
   function DeleteTiles:Boolean;
   function PaintTiles:Boolean;
   function PaintTilesBtm:Boolean;
   function PaintRTimage:Boolean;


   function RecalcMapZoom:Boolean;
   function RepaintMapFast:Boolean;

   function CreateNewMap:Boolean;
   procedure RecalcVisibleRect;
   procedure ChangeObjective(objIdent:integer);

  public
   procedure CorrectPosByEncoders;
   function RepaintMap:Boolean;
   function GetImageToHeader:TBitmap32;


  private
    // VEctor elements
    FisVectors:Boolean; //draw or not vectors

    viList: array of TVectorElement;

    gviInstrument:TVectorInstrument;
    gElIdx, gPtIdx:Integer;


    ScaleCoef:Single;

    function GetviIdx:Integer;
    procedure DeleteVectorInst;
    procedure BtmToGblCoord(btmX,btmY:Integer; var gbX,gbY:integer);
    function btmXtoGbl(btmX:Integer):Integer;
    function btmYtoGbl(btmY:integer):Integer;

    procedure DrawVectors;
    function GetImgSize: TPoint;
    function GetBtmSize: TPoint;

    function GetScanGridIdx:Integer;

  public
    property  _mapZoom:Double read mapZoom;
    property _gblCenter:TPoint read gblCenter;
    property _imgSize:TPoint read GetImgSize;
    property _btmSize:TPoint read GetBtmSize;
  end;


  TScanThread = class(TThread)
    private
      fStop:Boolean;
      FOwner: TdevToupcamG;

      fOnStart:TNotifyEvent;
      fOnStop:TNotifyEvent;
      fOnAfterFrame:TNotifyEvent;

    protected
      procedure Execute; override;
      procedure CaptureTile;
    public
      nX, nY:Integer;
      dirX, dirY:Integer;
      stepX,StepY:Single;
      StartPoint:TPoint;

      constructor Create(AOwner: TdevToupcamG);

      property OnStart:TNotifyEvent read fOnStart write fOnStart;
      property OnStop:TNotifyEvent read fOnStop write fOnStop;
      property OnAfterFrame:TNotifyEvent read fOnAfterFrame write fOnAfterFrame;
  end;


implementation

uses System.Math, main, uScan2;

{$R *.dfm}

{ TdevToupcamG }

procedure TdevToupcamG.BtmToGblCoord(btmX,btmY:Integer; var gbX,gbY:integer);
begin
gbX:=Round(gblCenter.X+(btmX-PaintBox.Width / 2)/mapZoom);
gbY:=Round(gblCenter.Y+(btmY-PaintBox.Height / 2)/mapZoom);
end;


function TdevToupcamG.btmXtoGbl(btmX:Integer): Integer;
begin
result:=Round(gblCenter.X+(btmX-PaintBox.Width / 2)/mapZoom);
end;


function TdevToupcamG.btmYtoGbl(btmY:Integer): Integer;
begin
result:=Round(gblCenter.Y+(btmY-PaintBox.Height / 2)/mapZoom);
end;


procedure TdevToupcamG.btnAutoWBClick(Sender: TObject);
begin
if f_hToupCam<>nil then
   err(Toupcam_AwbOnePush(f_hToupCam, nil, nil));
end;

procedure TdevToupcamG.btnDefaultColorClick(Sender: TObject);
begin
    trbHue.Position:= TOUPCAM_HUE_DEF;
    trbSaturation.Position:= TOUPCAM_SATURATION_DEF;
    trbBrightness.Position:= TOUPCAM_BRIGHTNESS_DEF;
    trbContrast.Position:= TOUPCAM_CONTRAST_DEF;
    trbGamma.Position:= TOUPCAM_GAMMA_DEF;
end;

procedure TdevToupcamG.btnDefaultWBClick(Sender: TObject);
begin
   trbColorTemp.Position:= TOUPCAM_TEMP_DEF;
   trbTint.Position:= TOUPCAM_TINT_DEF;
end;

procedure TdevToupcamG.btnFindClick(Sender: TObject);
begin
btnStop.OnClick(Self);
if FindDevice then
   OpenDevice;
end;

procedure TdevToupcamG.btnPauseClick(Sender: TObject);
begin
 if f_hToupCam<>nil then
 begin

    if err(Toupcam_Pause(f_hToupCam, not f_Pause)) then
    begin
      f_Pause:=not f_Pause;
     (Sender as TsButton).Down:=f_Pause;
    end;

 end;
end;

procedure TdevToupcamG.btnPlayClick(Sender: TObject);
begin
if StartPreview then
  begin
    btnPause.Enabled:=True;
    btnPlay.Enabled:=False;
    btnSnap.Enabled:=True;

    f_nFrameCount:=0;

  end;
end;

procedure TdevToupcamG.btnPullImageClick(Sender: TObject);
var nHeight, nWidth, size:Cardinal;
    pImageData:Pointer;
begin
if f_hToupCam<>nil then
begin

err(Toupcam_PullImage(f_hToupCam, nil,f_header.biBitCount, @nWidth,  @nHeight))  ;
Log(Format('%dx%d', [nWidth, nHeight]));

end;

end;

procedure TdevToupcamG.btnSaveClick(Sender: TObject);
var btmSave, tmpBitmap:TBitmap32;
    i,j,selected:Integer;
    L,R,T,B, LL,BB:Integer;
    len:Integer;
begin
selected:=-1;
for i := Length(viList)-1 downto 0 do
  if viList[i].ClassNameIs('TVectorGrid') then
   begin
     selected:=i;
     Break;
   end;

if selected<0 then Exit;

 L:= Min(viList[selected].FPoints[0].X, viList[selected].FPoints[1].X );
 R:= Max(viList[selected].FPoints[0].X, viList[selected].FPoints[1].X );
 B:= Min(viList[selected].FPoints[0].Y, viList[selected].FPoints[3].Y );
 T:= Max(viList[selected].FPoints[0].Y, viList[selected].FPoints[3].Y );

  len:=Length(Tiles);
 if len>0 then
   begin
     tmpBitmap:=TBitmap32.Create;
     btmSave:=TBitmap32.Create;
     try
      tmpBitmap.SetSize(btmSnap.Width, btmSnap.Height);
      btmSave.SetSize(R-L, T-B);
      RecalcVisibleRect;

      if tmpBitmap<>nil then
       for i := 0 to len-1 do
        if PtInRect(VisibleRect, Tiles[i].pixPoint) then       // if tileCoord in visibleRect
        begin

          if bTilesInMemory then
            begin
             Tiles[i].btm.Resampler:= TNearestResampler.Create(Tiles[i].btm);
             Tiles[i].btm.DrawMode:=dmOpaque;

             Tiles[i].btm.DrawTo(btmSave,
             Tiles[i].pixPoint.X-L-tmpBitmap.Width div 2, Tiles[i].pixPoint.Y-B-tmpBitmap.Height div 2 );
            end
          else
            begin
             tmpBitmap.Resampler:= TNearestResampler.Create(tmpBitmap);
             tmpBitmap.DrawMode:=dmOpaque;

             tmpBitmap.LoadFromFile(TilesPath+Tiles[i].fileName);
             tmpBitmap.DrawTo(btmSave, Tiles[i].pixPoint.X-L-tmpBitmap.Width div 2, Tiles[i].pixPoint.Y-B-tmpBitmap.Height div 2  );
            end;
         end;

     if SavePictureDialog.Execute then
        btmSave.SaveToFile(SavePictureDialog.FileName);

     finally
       tmpBitmap.Free;
       btmSave.Free;
     end;
    end;

end;

procedure TdevToupcamG.btnScanVisClick(Sender: TObject);
var i,j,selected,nearest, farest:Integer;
    L,R,T,B:Integer;
    nX, nY:Integer;
    minDist, maxDist, Dist:Single;
begin
selected:=-1;
for i := Length(viList)-1 downto 0 do
  if viList[i].ClassNameIs('TVectorRectangle') then
   begin
     selected:=i;
     Break;
   end;

if selected<0 then Exit;

 L:= Min(viList[selected].FPoints[0].X, viList[selected].FPoints[1].X );
 R:= Max(viList[selected].FPoints[0].X, viList[selected].FPoints[1].X );
 B:= Min(viList[selected].FPoints[0].Y, viList[selected].FPoints[3].Y );
 T:= Max(viList[selected].FPoints[0].Y, viList[selected].FPoints[3].Y );

 nX:=Ceil((R-L)*1.05/btmPrev.Width );     //5% for overlapping
 nY:=Ceil((T-B)*1.05/btmPrev.Height);

 //find nearest point/corner
   minDist:=999999;
   maxDist:=0;
   nearest:=-1;

 for i := 0 to 3 do
  begin
   Dist:= Sqrt( Sqr(gblCenter.X-viList[selected].FPoints[i].X)+Sqr(gblCenter.Y-viList[selected].FPoints[i].Y));
   if Dist<minDist then
      begin
      minDist:=Dist;
      nearest:=i;
      end;
   if Dist>maxDist then
      begin
      maxDist:=Dist;
      farest:=i;
      end;
  end;

 //Start async scan
  ScanThread:=TScanThread.Create(Self);
  ScanThread.FreeOnTerminate:=True;

  ScanThread.nX:=nX;
  ScanThread.nY:=nY;

  if viList[selected].FPoints[farest].X>=viList[selected].FPoints[nearest].X then
    ScanThread.dirX:=1
  else
    ScanThread.dirX:=-1;

  if viList[selected].FPoints[farest].Y>=viList[selected].FPoints[nearest].Y then
    ScanThread.dirY:=1
  else
    ScanThread.dirY:=-1;

  ScanThread.stepX:= btmPrev.Width*0.95;
  ScanThread.stepY:= btmPrev.Height*0.95;

  ScanThread.StartPoint.X:= viList[selected].FPoints[nearest].X;
  ScanThread.StartPoint.Y:= viList[selected].FPoints[nearest].Y;

  ScanThread.StartPoint.X:=ScanThread.StartPoint.X + ScanThread.dirX*Round(ScanThread.stepX/2);
  ScanThread.StartPoint.Y:=ScanThread.StartPoint.Y + ScanThread.dirY*Round(ScanThread.stepY/2);

  Log(Format('ScanVis neatest point %d] ',[nearest]) );

  ScanThread.Start;

end;

procedure TdevToupcamG.btnSetScanParamsClick(Sender: TObject);
var L,B,selected:Integer;
    StartPoint, ZeroPoint, zeroPointMot, StartPointMot:TPoint;
    diffPix, diffSteps :Integer;

begin
  selected:=GetScanGridIdx;
  if selected<0 then Exit;

  L:= Min(viList[selected].FPoints[0].X, viList[selected].FPoints[1].X);
  B:= Min(viList[selected].FPoints[0].Y, viList[selected].FPoints[3].Y);

  StartPoint.X:= L {- btmPrev.Width div 2} - laserPositionX;
  StartPoint.Y:= B {- btmPrev.Height div 2} - laserPositionY;

   zeroPoint.X:= gblCenter.X;
   zeroPoint.Y:= gblCenter.Y;

   zeroPointMot.X:= Controller.MotX.Position;
   zeroPointMot.Y:= Controller.MotY.Position;

    //Move motors
   diffPix:= StartPoint.X-zeroPoint.X;
   diffSteps:=Round( diffPix*prop_stepsToPix_X);
   StartPointMot.X:=zeroPointMot.X+diffSteps;

   diffPix:= StartPoint.Y-zeroPoint.Y;
   diffSteps:=Round( diffPix*prop_stepsToPix_Y);
   StartPointMot.Y:=zeroPointMot.Y-diffSteps;

//    TThread.Synchronize(nil, procedure()
        begin
         gblCenter.X:= StartPoint.X;
         gblCenter.Y:= StartPoint.Y;
         RepaintMap;
        end;

if FormScan2=nil then
   formMain.S6.OnClick(Self);

if not FormScan2.Visible then
    FormScan2.Show;

    FormScan2.pcScanType.ActivePageIndex:=0;
    FormScan2.sgXYZparams.Cells[1,1] := IntToStr( TVectorGrid(viList[selected]).nX);
    FormScan2.sgXYZparams.Cells[1,2] := IntToStr( TVectorGrid(viList[selected]).nY);
    FormScan2.sgXYZparams.Cells[2,1] := Format('%.2f',[TVectorGrid(viList[selected]).StepSizeX ]);
    FormScan2.sgXYZparams.Cells[2,2] := Format('%.2f',[TVectorGrid(viList[selected]).StepSizeY ]);

   TTask.Run( procedure
    var ts:Int64;
    begin
      Controller.MotX.MovAbs( StartPointMot.X);
      Controller.MotY.MovAbs( StartPointMot.Y);

//     ts:=GetTickCount;
//     while Controller.MotX.Moving or Controller.MotY.Moving do
//        begin
//        sleep(50);
//        if GetTickCount-ts>60000 then Break;
////         if fStop or Terminated then
////          Break;
//        end;
//     Sleep(500);
//
////    if fStop or Terminated then
////         Break;
//     TThread.Synchronize(nil, procedure()
//        begin
//        CorrectPosByEncoders;
//        RepaintMap;
//        end);

    end );



end;

procedure TdevToupcamG.btnSettingsClick(Sender: TObject);
begin
bShowCameraControls:=not bShowCameraControls;
changeControlsPanel(bShowCameraControls);
end;

procedure TdevToupcamG.btnSnapClick(Sender: TObject);
begin
   err(Toupcam_Snap(f_hToupCam, snapResolutionIndex)) ;
end;

procedure TdevToupcamG.btnStopClick(Sender: TObject);
begin
if Stop then
  begin
    btnPause.Enabled:=False;
    btnPause.Down:=False;
    f_Pause:=False;

    btnPlay.Enabled:=True;
    btnSnap.Enabled:=False;
  end;
end;

procedure TdevToupcamG.btnStopScanVisClick(Sender: TObject);
 begin

if ScanThread<>nil then
  if not ScanThread.Terminated then
    ScanThread.Terminate;
end;

procedure TdevToupcamG.cbCCDAEClick(Sender: TObject);
begin
if fCanChange then
OnCCDAE;
end;

procedure TdevToupcamG.cbCCDflipHClick(Sender: TObject);
begin
if fCanChange then
FlipH;
end;

procedure TdevToupcamG.cbCCDflipVClick(Sender: TObject);
begin
if fCanChange then
FlipV;
end;

procedure TdevToupcamG.cbRGB48Click(Sender: TObject);
var iValue:Cardinal;
begin
if fCanChange then
 begin
   if cbRGB48.Checked then iValue:=1
    else iValue:=0;
    err(Toupcam_put_Option(f_hToupCam,TOUPCAM_OPTION_RGB48, iValue ));
 end;
end;

procedure TdevToupcamG.cbUseEncodersClick(Sender: TObject);
begin
bUseEncodersLoopBack:=cbUseEncoders.Checked;
end;

procedure TdevToupcamG.changeControlsPanel(w: boolean);
begin
if w then
   begin
     pnlControls.Width:=260;
     btnSettings.Caption:='>>';
   end else begin
     pnlControls.Width:=0;
     btnSettings.Caption:='<<';
   end;
end;

procedure TdevToupcamG.ChangeObjective(objIdent: integer);
begin

  if objIdent<0 then
  begin
  UsedObjective:= 0;

  prop_stepsToPix_X := X10_prop_stepsToPix_X;
  prop_stepsToPix_Y := X10_prop_stepsToPix_Y;
  prop_encToPix_X := X10_prop_encToPix_X;
  prop_encToPix_Y := X10_prop_encToPix_Y;
  laserPositionX := X10_laserPosition_X;
  laserPositionY := X10_laserPosition_Y;
  end
  else if objIdent < objCount then

  begin

  UsedObjective:=objIdent;
  prop_stepsToPix_X := Objectives[objIdent].prop_stepsToPix_X;
  prop_stepsToPix_Y := Objectives[objIdent].prop_stepsToPix_Y;
  prop_encToPix_X := Objectives[objIdent].prop_encToPix_X;
  prop_encToPix_Y := Objectives[objIdent].prop_encToPix_Y;
  laserPositionX := Objectives[objIdent].laserPosition_X;
  laserPositionY := Objectives[objIdent].laserPosition_Y;
  end;

end;


procedure TdevToupcamG.CloseDevice;
begin
 if btmPrev<>nil then
    FreeAndNil(btmPrev);

 if btmSnap<>nil then
    FreeAndNil(btmSnap);

 if btmMoving<>nil then
     btmMoving.Free;

if (f_Htoupcam <> nil) then
  begin
    Toupcam_Close(f_Htoupcam);
    f_Htoupcam := nil;

    if f_pData <> nil then
    begin
      FreeMem(f_pData);
      f_pData := nil;
    end;
  end;
   OnChangeDevice();
end;

procedure TdevToupcamG.CorrectPosByEncoders;
begin
  // getEncXY
  EncCurPoint.X:=Controller.MotX.EncPosition;
  EncCurPoint.Y:=Controller.MotY.EncPosition;

  gblCenter.X := Round( EncCurPoint.X/prop_encToPix_X);
  gblCenter.Y := Round(-EncCurPoint.Y/prop_encToPix_Y);

end;

function TdevToupcamG.CreateNewMap: Boolean;
begin
Result:=False;
gblCenter.X:=0;
gblCenter.Y:=0;

PaintBox.Buffer.Clear;
PaintBox.Invalidate;
btmMoving.Clear;

// readEncoders XY
Controller.MotX.EncPosition:=0;
Controller.MotY.EncPosition:=0;

//Controller.MotX.Position:=0;
//Controller.MotY.Position:=0;

end;

function TdevToupcamG.DeleteTiles: Boolean;
var
srec: TSearchRec;
  i:Integer;
Begin
 if FindFirst(TilesPath+'*.*',faAnyFile,srec) = 0 then
   begin
     repeat
     DeleteFile(TilesPath+srec.name);
     until FindNext(srec) <> 0;
     FindClose(srec);
  end;

  if Length(Tiles)>0 then
    for i := 0 to Length(Tiles)-1 do
    if Tiles[i].btm<>nil then
        Tiles[i].btm.Free;

SetLength(Tiles, 0);
end;


procedure TdevToupcamG.DeleteVectorInst;
var
  i: Integer;
begin

if Length(viList)>0 then
for i := 0 to Length(viList)-1 do
if viList[i]<>nil then
  FreeAndNil(viList[i]);

SetLength(viList,0);
end;


procedure TdevToupcamG.DrawVectors;
var i:Integer;
begin

  for i := 0 to Length(viList)-1 do
  if  viList[i]<>nil then
    viList[i].Draw;

end;

function TdevToupcamG.err(cmd: HRESULT): Boolean;
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

function TdevToupcamG.FindDevice: boolean;
var
  cnt: Cardinal;
  i: Integer;
  name: string;
begin

  FillChar(f_ti, Sizeof(f_ti), 0);
  FillChar(f_header, SizeOf(f_header), 0);

  f_header.biSize := SizeOf(BITMAPINFOHEADER);
  f_header.biPlanes := 1;
  f_header.biBitCount := 32;

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
    Result:=true;
  end;

end;

procedure TdevToupcamG.FlipH;
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

procedure TdevToupcamG.FlipV;
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

procedure TdevToupcamG.FormCreate(Sender: TObject);
begin
f_Htoupcam := nil;
f_Pause:=False;
fCanChange:=True;

bStartDrag:=False;
bWaitNextStep:=False;

bTilesInMemory:=True;
bUseEncodersLoopBack:=False;
zoomStep:=0;

TilesDirectory:=ExtractFilePath(Application.ExeName)+'Tiles';
TilesPath:=TilesDirectory+'\';
loadUISettings;


FisVectors:=False;
gElIdx:= -1;
gPtIdx:= -1;

ScaleCoef:=1.00417;

gviInstrument:=viSelect;

ChangeObjective(-1); //def  10X

end;

procedure TdevToupcamG.FormDestroy(Sender: TObject);
begin
DeleteTiles;
DeleteVectorInst;

Stop;
CloseDevice;
end;

procedure TdevToupcamG.FormShow(Sender: TObject);
begin
if FindDevice then
  if OpenDevice then
    btnPlay.OnClick(Self);

 Controller:=formMain.Controller;
 btnNewMap.OnClick(Self);
end;

function TdevToupcamG.GetBtmSize: TPoint;
begin
Result.X:= PaintBox.Width;
Result.Y:= PaintBox.Height;
end;

function TdevToupcamG.GetImgSize: TPoint;
begin
Result.X:= f_header.biWidth;
Result.Y:= f_header.biHeight;

end;

procedure TdevToupcamG.GetInfoAbout;
var flag:Cardinal;
    s:string;
begin
flag:=f_ti[f_nIndex].model^.flag;
Log('//*************************//');
Log('Flag='+IntToStr(flag));
Log('-----------------------------');
s:= 'cmos sensor ';
if (flag and TOUPCAM_FLAG_CMOS >0 ) then s:=s+'+' else s:=s+'-';
Log(s);
s:= 'progressive ccd sensor ';
if (flag and TOUPCAM_FLAG_CCD_PROGRESSIVE >0 ) then s:=s+'+' else s:=s+'-';
Log(s);
s:= 'interlaced ccd sensor ';
if (flag and TOUPCAM_FLAG_CCD_INTERLACED >0 ) then s:=s+'+' else s:=s+'-';
Log(s);
s:= 'support hardware ROI ';
if (flag and TOUPCAM_FLAG_ROI_HARDWARE >0 ) then s:=s+'+' else s:=s+'-';
Log(s);
s:= 'monochromatic ';
if (flag and TOUPCAM_FLAG_MONO >0 ) then s:=s+'+' else s:=s+'-';
Log(s);
s:= 'support bin/skip mode ';
if (flag and TOUPCAM_FLAG_BINSKIP_SUPPORTED >0 ) then s:=s+'+' else s:=s+'-';
Log(s);
s:= 'USB 3.0 ';
if (flag and TOUPCAM_FLAG_USB30 >0 ) then s:=s+'+' else s:=s+'-';
Log(s);
s:= 'Cooled ';
if (flag and TOUPCAM_FLAG_COOLED >0 ) then s:=s+'+' else s:=s+'-';
Log(s);
s:= 'usb3.0 camera connected to usb2.0 port ';
if (flag and TOUPCAM_FLAG_USB30_OVER_USB20 >0 ) then s:=s+'+' else s:=s+'-';
Log(s);
s:= 'ST4 ';
if (flag and TOUPCAM_FLAG_ST4 >0 ) then s:=s+'+' else s:=s+'-';
Log(s);
s:= 'support to get the temperature of sensor ';
if (flag and TOUPCAM_FLAG_GETTEMPERATURE >0 ) then s:=s+'+' else s:=s+'-';
Log(s);
s:= 'support to put the temperature of sensor ';
if (flag and TOUPCAM_FLAG_PUTTEMPERATURE >0 ) then s:=s+'+' else s:=s+'-';
Log(s);
s:= 'Maximum Bit Depth = 10  ';
if (flag and TOUPCAM_FLAG_BITDEPTH10 >0 ) then s:=s+'+' else s:=s+'-';
Log(s);
s:= 'Maximum Bit Depth = 12 ';
if (flag and TOUPCAM_FLAG_BITDEPTH12 >0 ) then s:=s+'+' else s:=s+'-';
Log(s);
s:= 'Maximum Bit Depth = 14 ';
if (flag and TOUPCAM_FLAG_BITDEPTH14 >0 ) then s:=s+'+' else s:=s+'-';
Log(s);
s:= 'Maximum Bit Depth = 16 ';
if (flag and TOUPCAM_FLAG_BITDEPTH16 >0 ) then s:=s+'+' else s:=s+'-';
Log(s);
s:= 'cooling fan ';
if (flag and TOUPCAM_FLAG_FAN >0 ) then s:=s+'+' else s:=s+'-';
Log(s);
s:= 'Thermoelectric Cooler can be turn on or off ';
if (flag and TOUPCAM_FLAG_TEC_ONOFF >0 ) then s:=s+'+' else s:=s+'-';
Log(s);
s:= 'image signal processing supported ';
if (flag and TOUPCAM_FLAG_ISP >0 ) then s:=s+'+' else s:=s+'-';
Log(s);
s:= 'support software trigger ';
if (flag and TOUPCAM_FLAG_TRIGGER_SOFTWARE >0 ) then s:=s+'+' else s:=s+'-';
Log(s);
s:= 'support external trigger ';
if (flag and TOUPCAM_FLAG_TRIGGER_EXTERNAL >0 ) then s:=s+'+' else s:=s+'-';
Log(s);
s:= 'only support trigger single: one trigger, one image ';
if (flag and TOUPCAM_FLAG_TRIGGER_SINGLE >0 ) then s:=s+'+' else s:=s+'-';
Log(s);
Log('-----------------------------');
end;



function TdevToupcamG.GetScanGridIdx: Integer;
var i, selected:Integer;
begin
Result:=-1;

//find selected
for i := Length(viList)-1 downto 0 do
  if viList[i]<>nil then
  if viList[i].ClassNameIs('TVectorGrid') and viList[i].FSelected then
   begin
     Result:=i;
     Break;
   end;
//find any
if Result<0 then
for i := Length(viList)-1 downto 0 do
  if viList[i]<>nil then
  if viList[i].ClassNameIs('TVectorGrid') then
   begin
     Result:=i;
     Break;
   end;
end;

function TdevToupcamG.GetviIdx: Integer;
var i:Integer;
begin
   Result:=-1;

{    for i :=0 to Length(viList)-1 do
         if viList[i]<>nil then
          begin
          Result:=i;
          Break;
          end;
}
    for i := Length(viList)-1 downto 0 do
       if viList[i]<>nil then
        if i+1<=Length(viList)-1 then
         if viList[i+1]=nil then   //   should be
          begin
          Result:=i+1;
          Break;
          end;

      if Result<0 then
        begin
        Result:=length(viList);
        SetLength(viList, Result+1);
        end;
 StatusBarCCD.Panels[3].Text:='getIdx='+Result.ToString;
end;

procedure TdevToupcamG.InitControls;
var iValue:Cardinal;
begin

fCanChange:=False;
if  err(Toupcam_get_Option(f_hToupCam,TOUPCAM_OPTION_BITDEPTH, @iValue )) then
  rgBitDepth.ItemIndex:=iValue
 else
 rgBitDepth.ItemIndex:=0;

if  err(Toupcam_get_Option(f_hToupCam,TOUPCAM_OPTION_RAW, @iValue )) then
  rgDataFormat.ItemIndex:=iValue
 else
  rgDataFormat.ItemIndex:=0;

if  err(Toupcam_get_Option(f_hToupCam,TOUPCAM_OPTION_RGB48, @iValue )) then
  cbRGB48.Checked:=LongBool(iValue)
 else
  cbRGB48.Checked:=False;


fCanChange:=True;
end;

procedure TdevToupcamG.loadUISettings;
begin
bShowCameraControls:=False;

changeControlsPanel(bShowCameraControls);

end;

procedure TdevToupcamG.Log(str: string);
begin
MemoLog.Lines.Add(str);
end;

procedure TdevToupcamG.btnNewMapClick(Sender: TObject);
begin
DeleteTiles;  //delete previous tiles
CreateNewMap;
SnapTile;
PaintTiles;

end;

procedure TdevToupcamG.OnCCDAE;
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

procedure TdevToupcamG.OnChangeDevice;
var
  eSize: Cardinal;
  str: string;
  i: Integer;
  int: Cardinal;

begin
  if (f_Htoupcam = nil) then
  begin
    cboxCCDresPrev.Items.Clear;
    cboxCCDresPrev.Text := '---';

    cboxCCDresSnap.Items.Clear;
    cboxCCDresSnap.Text := '---';

    StatusBarCCD.Panels[0].Text := '';
    StatusBarCCD.Panels[1].Text := '';
    StatusBarCCD.Panels[2].Text := '';
    StatusBarCCD.Panels[3].Text := '';
  end
  else
  begin
    GetInfoAbout;


    cboxCCDresPrev.Items.Clear;
    for i := 0 to f_ti[f_nIndex].model^.preview - 1 do
       cboxCCDresPrev.Items.Add(Format('%dx%d',[f_ti[f_nIndex].model^.res[i].width, f_ti[f_nIndex].model^.res[i].height ]));

    eSize := 0;
    Toupcam_get_eSize(f_Htoupcam, @eSize);
    cboxCCDresPrev.ItemIndex:=eSize;

    cboxCCDresSnap.Items.Clear;
    if f_ti[f_nIndex].model^.still>0 then
      begin
        for i := 0 to f_ti[f_nIndex].model^.still - 1 do
           cboxCCDresSnap.Items.Add(Format('%dx%d',[f_ti[f_nIndex].model^.res[i].width, f_ti[f_nIndex].model^.res[i].height ]));
        cboxCCDresSnap.Enabled:=True;
        snapResolutionIndex:=0;
        cboxCCDresSnap.ItemIndex:=snapResolutionIndex;
      end
        else
      begin
        cboxCCDresSnap.Items.Add(Format('%dx%d',[f_ti[f_nIndex].model^.res[0].width, f_ti[f_nIndex].model^.res[0].height ]));
         snapResolutionIndex:=0;
        cboxCCDresSnap.ItemIndex:=snapResolutionIndex;
        cboxCCDresSnap.Enabled:=False;
      end;


    eSize := 0;
    Toupcam_get_eSize(f_Htoupcam, @eSize);
    cboxCCDresPrev.ItemIndex:=eSize;

    btnPause.Enabled:=True;
    btnSnap.Enabled:=False;

//    UpdateResolutionText();
    UpdateExposureTimeText();
    UpdateTintTempText();

  end;

end;

function TdevToupcamG.OnChangeResolution: Boolean;
begin

    if (err(Toupcam_get_Size(f_Htoupcam, @f_header.biWidth, @f_header.biHeight))) then
    begin

      if f_header.biBitCount = 24 then
          f_header.biSizeImage := TDIBWIDTHBYTES(f_header.biWidth * f_header.biBitCount) * f_header.biHeight;

      if f_header.biBitCount = 32 then
          f_header.biSizeImage := f_header.biWidth * f_header.biHeight * 4;


         if f_pData<>nil then
         begin
           FreeMem(f_pData);
           f_pData:=nil;
         end;

         f_pData := AllocMem(f_header.biSizeImage);

         if btmPrev=nil then
            btmPrev:=TBitmap32.Create;

         if btmSnap=nil then
            btmSnap:=TBitmap32.Create;

         if btmMoving=nil then
            btmMoving:=TBitmap32.Create;
          btmMoving.SetSize(PaintBox.Width, PaintBox.Height);

         btmPrev.SetSize(f_header.biWidth, f_header.biHeight);
    end;

end;

procedure TdevToupcamG.OnEventExpo;
begin
UpdateExposureTimeText;
end;

procedure TdevToupcamG.OnEventImage;
var oWidth, oHeight:Cardinal;

begin
 if (not err(Toupcam_PullImage(f_Htoupcam, f_pData, f_header.biBitCount, @oWidth, @oHeight))) then
      exit;
 if (oWidth<>f_header.biWidth) or (oHeight<>f_header.biHeight) then
      Exit;

   CopyMemory( btmPrev.Bits, f_pData, (f_header.biBitCount div 8)*oWidth*oHeight  );

 //  RepaintMap;
 //   PaintRTimage;  ->  move to invalidate
    PaintBox.Invalidate;



  Inc(f_nFrameCount);
  if (f_dwStartTick = 0) then
  begin
    f_dwStartTick := GetTickCount();
    f_dwLastTick := f_dwStartTick;
  end
  else
    f_dwLastTick := GetTickCount();

  UpdateFrameText;

end;

procedure TdevToupcamG.OnEventSnap;
var nWidth, nHeight:Cardinal;
begin
 if (not err(Toupcam_PullStillImage(f_Htoupcam, f_pData, f_header.biBitCount, @nWidth, @nHeight))) then
    exit;

  btmSnap.SetSize(nWidth, nHeight);
  CopyMemory(btmSnap.Bits, f_pData, (f_header.biBitCount div 8)*nWidth*nHeight  );

  bSnapIsReady:=True;

//   btmSnap.DrawTo(PaintBox.Buffer, Rect( 0, 0,PaintBox.Buffer.Width, PaintBox.Buffer.Height) , Rect(0,0,nWidth, nHeight) );
//   PaintBox.Invalidate;

 // MemoLog.Lines.Add('Snap+');
end;

procedure TdevToupcamG.OnEventTemptint;
begin
UpdateTintTempText;
end;

procedure TdevToupcamG.OnEventUsbDisconnected;
begin

end;

procedure TdevToupcamG.OnEventUsbError;
begin

end;

procedure TdevToupcamG.OnMsgCamEvent(var Msg: TMessage);
begin
     case Msg.WParam of
    TOUPCAM_EVENT_ERROR:        Self.OnEventUsbError();
    TOUPCAM_EVENT_DISCONNECTED: Self.OnEventUsbDisconnected();
    TOUPCAM_EVENT_EXPOSURE:     Self.OnEventExpo();
    TOUPCAM_EVENT_TEMPTINT:     Self.OnEventTemptint();
    TOUPCAM_EVENT_IMAGE:        Self.OnEventImage();
    TOUPCAM_EVENT_STILLIMAGE:   Self.OnEventSnap();
  end;
end;

procedure TdevToupcamG.OnTimer;
var Target, AGain:Word;
    Time:Cardinal;
    temp, tint:Integer;
begin
    fCanChange:=False;

if trbCCDAE.Position<>fLastTarget then
     begin
     Target:= trbCCDAE.Position;
      if f_hToupCam<>nil then
          err(  Toupcam_put_AutoExpoTarget(f_hToupCam, Target));
//          fLastTarget:= trbCCDAE.Position;
     end;

if trbCCDTime.Position<>fLastTime then
     begin
     Time:= trbCCDTime.Position*1000+250;
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

fCanChange:=true;

Inc( fCCdTimerCur);
if(fCCdTimerRepeat = fCCdTimerCur) then
     begin
      fCCdTimerCur:=0;
      TimerCCD.Enabled:= False;
     end;


end;

function TdevToupcamG.OpenDevice: boolean;
begin
Result:=False;
CloseDevice;
f_Htoupcam := Toupcam_Open(@f_ti[f_nIndex].id);

if (f_Htoupcam <> nil) then
  begin
    OnChangeDevice;
    OnChangeResolution;
    InitControls;
    UpdateFrameText();
    UpdateControls;
//    pcControls.ActivePageIndex:=1;
//    pcControls.ActivePageIndex:=0;
    pcControls.ActivePage:=tsCameraMain;
//    pcControls.Update;// UpdateActivePage;
//    pcControls.Repaint;
    pcControls.Invalidate;

//    pcControls.OnChange(Self);
//    pcControls.Update;

//    cboxCCDres.ItemIndex := 0;
    Result:=true;
  end;

end;

procedure TdevToupcamG.PaintBoxMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  Idx, ptIdx, i: Integer;
  gbX, gbY:Integer;
  label ex;
begin
//maps
 if Button = mbMiddle then
    begin
 //    if bWaitNextStep then Exit;

     gblPrevCenter.X:=gblCenter.X;
     gblPrevCenter.Y:=gblCenter.Y;

     startDragPoint.X:=X;
     startDragPoint.Y:=Y;
     gblShift.X:=0;
     gblShift.Y:=0;

     bStartDrag:=True;
     bWaitNextStep:=True;

//     if btmMoving<>nil then
//        btmMoving.Assign(PaintBox.Buffer);

//      movingZoomLevel:=zoomStep;
    end;

// vectors
////////////////////////////////////
 if Button = mbLeft then
 begin
     gElIdx:= -1;
     gPtIdx:= -1;


  if gviInstrument = viSelect then
    if not(ssCtrl in Shift) then

     for i := 0 to Length(viList)-1 do
       if viList[i]<>nil then
          viList[i].Deselect;


  //if not select point
  BtmToGblCoord(X, Y, gbX, gbY);

  if gviInstrument = viSelect then
       begin
       for Idx := 0 to Length(viList) - 1 do
         if viList[Idx]<>nil then
         for ptIdx := 0 to Length(viList[Idx].FPoints) - 1 do
          if (Sqr(viList[Idx].FPoints[ptIdx].X - gbX) + Sqr(viList[Idx].FPoints[ptIdx].Y - gbY))*Sqr(mapZoom)  < 25 then
          begin
              gElIdx:= Idx;
              gPtIdx:= ptIdx;

              viList[Idx].Select;

             if  viList[Idx].ClassNameIs('TVectorGrid') then
                 begin
                 canChange:=False;
                 spedtGridnX.Value:=TVectorGrid(viList[Idx]).nX;
                 spedtGridnY.Value:=TVectorGrid(viList[Idx]).nY;
                 canChange:=True;
                 end;

             goto ex;
          end;
        ex:;
         end
  else
    begin
         gElIdx:=getviIdx;
         FisVectors:=True;

       case gviInstrument of
             viLine:
                   begin
                    viList[gElIdx]:= TVectorLine.Create(PaintBox.Buffer );
                    TVectorLine(viList[gElIdx]).SetPoint(0,gbX,gbY);
                    TVectorLine(viList[gElIdx]).SetPoint(1,gbX+1,gbY);
                    gPtIdx:= 1;
                   end;

          viMeasure:
                   begin
                    viList[gElIdx]:= TVectorMeasure.Create(PaintBox.Buffer );
                    TVectorMeasure(viList[gElIdx]).SetPoint(0,gbX,gbY);
                    TVectorMeasure(viList[gElIdx]).SetPoint(1,gbX+1,gbY);
                    TVectorMeasure(viList[gElIdx]).SetScaleCoef(ScaleCoef);
                    gPtIdx:= 1;
                   end;
          viRect:
                   begin
                    viList[gElIdx]:= TVectorRectangle.Create(PaintBox.Buffer );
                    TVectorRectangle(viList[gElIdx]).SetPoint(0,gbX,gbY);
                    TVectorRectangle(viList[gElIdx]).SetPoint(1,gbX+1,gbY);
                    TVectorRectangle(viList[gElIdx]).SetPoint(2,gbX+1,gbY+1);
                    TVectorRectangle(viList[gElIdx]).SetPoint(3,gbX,gbY+1);
                    gPtIdx:= 2;
                   end;
          viGrid:
                   begin
                    viList[gElIdx]:= TVectorGrid.Create(PaintBox.Buffer );
                    TVectorGrid(viList[gElIdx]).SetPoint(0,gbX,gbY);
                    TVectorGrid(viList[gElIdx]).SetPoint(1,gbX+1,gbY);
                    TVectorGrid(viList[gElIdx]).SetPoint(2,gbX+1,gbY+1);
                    TVectorGrid(viList[gElIdx]).SetPoint(3,gbX,gbY+1);
                    TVectorGrid(viList[gElIdx]).SetScaleCoef(ScaleCoef);
                    TVectorGrid(viList[gElIdx]).SetnXnY(10,10);

                    gPtIdx:= 2;

                    canChange:=False;
                    spedtGridnX.Value:=TVectorGrid(viList[gElIdx]).nX;
                    spedtGridnY.Value:=TVectorGrid(viList[gElIdx]).nY;
                    canChange:=True;
                   end;
         end;
    end;

 PaintBox.Invalidate;
 end;
end;

procedure TdevToupcamG.PaintBoxMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
 var gbX, gbY:Integer;
begin
  BtmToGblCoord(X,Y, gbX, gbY);

  StatusBarCCD.Panels[0].Text:=Format('X=%.0f Y=%.0f gblX=%d gblY=%d',[(X-PaintBox.Width / 2)/mapZoom , (Y-PaintBox.Height / 2)/mapZoom, gbX, gbY]);

  if bStartDrag then
     begin

     gblShift.X:=round((startDragPoint.X-X)/mapZoom);
     gblShift.Y:=round((startDragPoint.Y-Y)/mapZoom);
     gblCenter.X:= gblPrevCenter.X + gblShift.X;
     gblCenter.Y:= gblPrevCenter.Y + gblShift.Y;

     StatusBarCCD.Panels[4].Text:=Format('gblCenX=%d gblCenY=%d',[gblCenter.X, gblCenter.Y ]);

  //   RepaintMapFast;
     end;

 if (gElIdx>=0)and(gPtIdx>=0) then
  begin
    viList[gElIdx].SetPoint( gPtIdx, gbX,gbY);

    PaintBox.Invalidate;
 //   StatusBarCCD.Panels[1].Text:=gElIdx.ToString;
  end;

end;

procedure TdevToupcamG.PaintBoxMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var gbX, gbY:Integer;
begin
if Button=mbMiddle then
   begin
//   if bWaitNextStep then Exit;

//   lblTxt.Caption:='Snap';
   if bStartDrag then
       begin

//       gblShift.X:=round((startDragPoint.X-X)/mapZoom);
//       gblShift.Y:=round((startDragPoint.Y-Y)/mapZoom);
//
//       Log(Format('pixX=%d pixY=%d',[gblShift.X, gblShift.Y]));
//
//       gblCenter.X:= gblPrevCenter.X + gblShift.X;
//       gblCenter.Y:= gblPrevCenter.Y + gblShift.Y;
        bStartDrag:=False;


//        Log(Format('shX=%d ShY=%d',[round(gblShift.X*edtPropPixStep.Value), round(gblShift.Y*edtPropPixStep.Value)]));


       TTask.Run(procedure()
           var ts:Cardinal;
           begin

//            EncStartPoint.X:=Controller.MotX.EncPosition;
//            EncStartPoint.Y:=Controller.MotY.EncPosition;

            Controller.MotX.MovRel( round(gblShift.X*prop_stepsToPix_X));
            Controller.MotY.MovRel(-round(gblShift.Y*prop_stepsToPix_Y));

            RepaintMap;

           ts:=GetTickCount;
           while Controller.MotX.Moving or Controller.MotY.Moving do
              begin
              sleep(50);
              if GetTickCount-ts>60000 then Break;
              end;
           Sleep(500);

           if cbUseEncoders.Checked then
             CorrectPosByEncoders;

              // Wait for end moving and snap

           TThread.Synchronize(nil, procedure
           begin
             SnapTile;
             RepaintMap; //need to change on  paintSnap to btmTile
           end);

           bWaitNextStep:=False;
           end);

       end;

    end;

if Button=mbLeft then
// if (gElIdx>=0)and(gPtIdx>=0) then
  begin
//   BtmToGblCoord(X, Y, gbX, gbY);
//    viList[gElIdx].FPoints[gPtIdx]:=Point(gbX,gbY);

      gElIdx:= -1;
      gPtIdx:= -1;

//  PaintBox.Invalidate;
  end;

end;

procedure TdevToupcamG.PaintBoxMouseWheelDown(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
Exit;

if bStartDrag then Exit;
if btmMoving<>nil then
  btmMoving.Assign(PaintBox.Buffer);
movingZoomLevel:=zoomStep;

dec(zoomStep);
RecalcMapZoom;
PaintBox.Buffer.BeginUpdate;
PaintBox.Buffer.Clear;

btmMoving.Resampler:= TNearestResampler.Create(btmMoving);
btmMoving.DrawMode:=dmOpaque;
btmMoving.DrawTo(PaintBox.Buffer,
      Rect(
                        round(  (1-1/ZoomScale)* PaintBox.Width /2) ,
                        round(  (1-1/ZoomScale)* PaintBox.Height/2) ,
                        round(  (1+1/ZoomScale)* PaintBox.Width /2) ,
                        round(  (1+1/ZoomScale)* PaintBox.Height/2)
      ) );
PaintBox.Buffer.EndUpdate;
PaintBox.Invalidate;
PaintBox.Repaint;

RepaintMap;
StatusBarCCD.Panels[2].Text := 'Zoom '+IntToStr(zoomStep);
end;

procedure TdevToupcamG.PaintBoxMouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
Exit;

if bStartDrag then Exit;

if btmMoving<>nil then
  btmMoving.Assign(PaintBox.Buffer);
 movingZoomLevel:=zoomStep;

 inc(zoomStep);
 RecalcMapZoom;
 PaintBox.Buffer.BeginUpdate;
 PaintBox.Buffer.Clear;

 btmMoving.Resampler:= TNearestResampler.Create(btmMoving);
 btmMoving.DrawMode:=dmOpaque;
 btmMoving.DrawTo(PaintBox.Buffer,
Rect(
                        round( ( 1-1*ZoomScale)* PaintBox.Width /2 ),
                        round( ( 1-1*ZoomScale)* PaintBox.Height/2 ),
                        round( ( 1+1*ZoomScale)* PaintBox.Width /2 ),
                        round( ( 1+1*ZoomScale)* PaintBox.Height/2 )
      ) );
PaintBox.Buffer.EndUpdate;
PaintBox.Invalidate;
PaintBox.Repaint;


RepaintMap;
StatusBarCCD.Panels[2].Text := 'Zoom '+IntToStr(zoomStep);
end;

procedure TdevToupcamG.PaintBoxPaintBuffer(Sender: TObject);
begin
PaintBox.Buffer.BeginUpdate;

PaintBox.Buffer.Clear;
PaintTilesBtm;
PaintRTimage;
if FisVectors then  DrawVectors;
PaintBox.Buffer.EndUpdate;
end;

procedure TdevToupcamG.PaintBoxResize(Sender: TObject);
begin
  PaintBox.Buffer.SetSize(PaintBox.Width, PaintBox.Height);
  if btmMoving<>nil then
    btmMoving.SetSize(PaintBox.Width, PaintBox.Height);

  if RecalcMapZoom then
  RepaintMap;

//   if btmSnap<>nil then
//    begin
//       btmSnap.DrawTo(PaintBox321.Buffer, Rect( 0, 0,PaintBox321.Buffer.Width, PaintBox321.Buffer.Height) , Rect(0,0,btmSnap.Width, btmSnap.Height) );
//       PaintBox.Invalidate;
//    end;
end;

function TdevToupcamG.PaintRTimage: Boolean;
begin
btmPrev.DrawTo(PaintBox.Buffer, Rect( round( (PaintBox.Width-f_header.biWidth*mapZoom)/2), round((PaintBox.Height-f_header.biHeight*mapZoom)/2),
                                      round( (PaintBox.Width+f_header.biWidth*mapZoom)/2), round((PaintBox.Height+f_header.biHeight*mapZoom)/2)) );

end;

function TdevToupcamG.PaintTiles: Boolean;
var len:Integer;
  i: Integer;
  tmpBitmap:TBitmap32;
begin
  len:=Length(Tiles);
 if len>0 then
   begin
     tmpBitmap:=TBitmap32.Create;
     try
      tmpBitmap.SetSize(btmSnap.Width, btmSnap.Height);
      RecalcVisibleRect;

      btmMoving.Clear;

      if tmpBitmap<>nil then
       for i := 0 to len-1 do
        if PtInRect(VisibleRect, Tiles[i].pixPoint) then       // if tileCoord in visibleRect
        begin

          if bTilesInMemory then
            begin
            Tiles[i].btm.DrawTo(btmMoving ,
                 Rect(
                        round( btmMoving.Width/2  - (gblCenter.X- Tiles[i].pixPoint.X)*mapZoom  - tmpBitmap.Width/2*mapZoom),
                        round( btmMoving.Height/2 - (gblCenter.Y- Tiles[i].pixPoint.Y)*mapZoom  - tmpBitmap.Height/2*mapZoom),
                        round( btmMoving.Width/2  - (gblCenter.X- Tiles[i].pixPoint.X)*mapZoom  + tmpBitmap.Width/2*mapZoom),
                        round( btmMoving.Height/2 - (gblCenter.Y- Tiles[i].pixPoint.Y)*mapZoom  + tmpBitmap.Height/2*mapZoom))
                 );
            end
          else
            begin
                 tmpBitmap.LoadFromFile(TilesPath+Tiles[i].fileName);

                 tmpBitmap.DrawTo(btmMoving,
                 Rect(
                        round( btmMoving.Width/2  - (gblCenter.X- Tiles[i].pixPoint.X)*mapZoom  - tmpBitmap.Width/2*mapZoom),
                        round( btmMoving.Height/2 - (gblCenter.Y- Tiles[i].pixPoint.Y)*mapZoom  - tmpBitmap.Height/2*mapZoom),
                        round( btmMoving.Width/2  - (gblCenter.X- Tiles[i].pixPoint.X)*mapZoom  + tmpBitmap.Width/2*mapZoom),
                        round( btmMoving.Height/2 - (gblCenter.Y- Tiles[i].pixPoint.Y)*mapZoom  + tmpBitmap.Height/2*mapZoom))
                 );
            end;
//         PaintBox.Invalidate;
//           PaintBox.Repaint;
         end;

     finally
       tmpBitmap.Free;
     end;
    end;

end;



function TdevToupcamG.PaintTilesBtm: Boolean;
begin
if btmMoving<>nil then
//  if bStartDrag then
  btmMoving.DrawTo(PaintBox.Buffer, -Round(gblShift.X*mapZoom), -Round(gblShift.Y*mapZoom));
//  else
//  btmMoving.DrawTo(PaintBox.Buffer, 0, 0);
end;

function TdevToupcamG.RecalcMapZoom: Boolean;
begin
if (f_header.biWidth<>0) and (f_header.biHeight<>0) and (PaintBox.Width<>0) and (PaintBox.Height<>0) then
   begin
    mapZoom:=Min(PaintBox.Width/f_header.biWidth, PaintBox.Height/f_header.biHeight )*Power(ZoomScale, zoomStep);
    Result:=True;
   end
 else
   begin
     mapZoom:=1.0;
     Result:=False;
   end;

end;

procedure TdevToupcamG.RecalcVisibleRect;
begin

VisibleRect.Left:= round( gblCenter.X- PaintBox.Width/2/mapZoom - f_header.biWidth);
VisibleRect.Right:= round( gblCenter.X+ PaintBox.Width/2/mapZoom + f_header.biWidth);
VisibleRect.Top:= round( gblCenter.Y- PaintBox.Height/2/mapZoom - f_header.biHeight);
VisibleRect.Bottom:= round( gblCenter.Y+ PaintBox.Height/2/mapZoom + f_header.biHeight);


//lblTxt.Caption:= IntToStr(VisibleRect.Left) + ' ' +IntToStr(VisibleRect.Top) + ' ' +IntToStr(VisibleRect.Right)+ ' ' +IntToStr(VisibleRect.Bottom);

end;

function TdevToupcamG.RepaintMap: Boolean;
begin

  PaintTiles;//FormTiles to btmTiles
  gblShift.X:=0;
  gblShift.Y:=0;

//  PaintBox.Buffer.BeginUpdate;
//  PaintBox.Buffer.Clear;
//  PaintTilesBtm;
//
// // PaintRTimage;
//
//  PaintBox.Buffer.EndUpdate;
  PaintBox.Invalidate;

end;

function TdevToupcamG.RepaintMapFast: Boolean;
begin
//  PaintBox.Buffer.BeginUpdate;
//  PaintBox.Buffer.Clear;
//
// if bStartDrag then
//    btmMoving.DrawTo(PaintBox.Buffer, -Round(gblShift.X*mapZoom), -Round(gblShift.Y*mapZoom) );
//
//   PaintBox.Buffer.EndUpdate;
   PaintBox.Invalidate;


end;

procedure TdevToupcamG.RepaintTimerTimer(Sender: TObject);
begin
if bStartDrag then
//   RepaintMap;
   RepaintMapFast;
end;

procedure TdevToupcamG.rgBitDepthChange(Sender: TObject);
begin
if fCanChange then
  err(Toupcam_put_Option(f_hToupCam, TOUPCAM_OPTION_BITDEPTH, rgBitDepth.ItemIndex ));

end;

procedure TdevToupcamG.rgDataFormatChange(Sender: TObject);
begin
if fCanChange then
  err(Toupcam_put_Option(f_hToupCam, TOUPCAM_OPTION_BITDEPTH, rgBitDepth.ItemIndex ));
end;

procedure TdevToupcamG.saveUISettings;
begin

end;

procedure TdevToupcamG.btnSnapToMapClick(Sender: TObject);
begin
SnapTile;
bWaitNextStep:=False; /// sometimes procedure of Capture Image in Thread don`t works properly
end;


procedure TdevToupcamG.btnMZoomMinusClick(Sender: TObject);
begin
//if btmMoving<>nil then
//  btmMoving.Assign(PaintBox.Buffer);
movingZoomLevel:=zoomStep;

dec(zoomStep);
RecalcMapZoom;
PaintBox.Buffer.BeginUpdate;
PaintBox.Buffer.Clear;
btmMoving.DrawTo(PaintBox.Buffer,
      Rect(
                        round(  (1-1/ZoomScale)* PaintBox.Width /2) ,
                        round(  (1-1/ZoomScale)* PaintBox.Height/2) ,
                        round(  (1+1/ZoomScale)* PaintBox.Width /2) ,
                        round(  (1+1/ZoomScale)* PaintBox.Height/2)
      ) );
PaintBox.Buffer.EndUpdate;
PaintBox.Invalidate;

RepaintMap;

StatusBarCCD.Panels[2].Text := 'Zoom '+IntToStr(zoomStep);
end;

procedure TdevToupcamG.btnMZoomPlusClick(Sender: TObject);
begin
//if btmMoving<>nil then
//  btmMoving.Assign(PaintBox.Buffer);
 movingZoomLevel:=zoomStep;

 inc(zoomStep);
 RecalcMapZoom;
 PaintBox.Buffer.BeginUpdate;
 PaintBox.Buffer.Clear;
btmMoving.DrawTo(PaintBox.Buffer,
Rect(
                        round( ( 1-1*ZoomScale)* PaintBox.Width /2 ),
                        round( ( 1-1*ZoomScale)* PaintBox.Height/2 ),
                        round( ( 1+1*ZoomScale)* PaintBox.Width /2 ),
                        round( ( 1+1*ZoomScale)* PaintBox.Height/2 )
      ) );
PaintBox.Buffer.EndUpdate;
PaintBox.Invalidate;

RepaintMap;

StatusBarCCD.Panels[2].Text := 'Zoom '+IntToStr(zoomStep);
end;



function TdevToupcamG.SnapTile: Boolean;
var len:Integer;

label goSnap;
begin
 // MemoLog.Lines.Add('Documents (My Documents): ' +  TPath.GetDocumentsPath);
 if  DirectoryExists(TilesDirectory) then goto goSnap
   else
   if CreateDir(TilesDirectory) then goto goSnap;

Result:=False;

goSnap:
  try
  len:= Length(Tiles);

  bSnapIsReady:=False;
  if not err(Toupcam_Snap(f_hToupCam, snapResolutionIndex)) then Exit(False);

  while not bSnapIsReady do
  begin
    Sleep(10);
    Application.ProcessMessages;
  end;

  SetLength(Tiles, len+1 );
  Tiles[len].idx:=len;
  Tiles[len].fileName:=Format('tile_%d.bmp',[Tiles[len].idx]);
  if bTilesInMemory then
    begin
      Tiles[len].btm:=TBitmap32.Create;
      Tiles[len].btm.Assign(btmSnap);
    end
  else
       btmSnap.SaveToFile(TilesPath+Tiles[len].fileName, True);


  {
  // getEncXY
  EncCurPoint.X:=Controller.MotX.EncPosition;
  EncCurPoint.Y:=Controller.MotY.EncPosition;

  EncShift.X:= EncCurPoint.X-EncStartPoint.X;
  EncShift.Y:= EncCurPoint.Y-EncStartPoint.Y;

  if cbUseEncoders.Checked then
   begin
    gblCenter.X := Round(EncCurPoint.X/edtPropPixEnc.Value);  //   gblPrevCenter.X + Round(EncShift.X/edtPropPixEnc.Value);
    gblCenter.Y := Round(EncCurPoint.Y/edtPropPixEnc.Value);  //   gblPrevCenter.Y + Round(EncShift.Y/edtPropPixEnc.Value);
   end;
  // ConvertEncToPix
  }

  // temporary use gblCenter
  Tiles[len].pixPoint.X:=gblCenter.X;
  Tiles[len].pixPoint.Y:=gblCenter.Y;

  MemoLog.Lines.Add('Snap+');// + IntToStr(Tiles[len].pixPoint.X)+' ' + IntToStr(Tiles[len].pixPoint.Y));
  MemoLog.Lines.Add('Enc +' + IntToStr(EncShift.X)+' ' + IntToStr(EncShift.Y));

  except

  Result:=False;
  end;


  Result:=True;


end;

function TdevToupcamG.StartPreview: Boolean;
begin
Result:=err(Toupcam_StartPullModeWithWndMsg(f_Htoupcam, Self.Handle, MSG_CAMEVENT));
RecalcMapZoom;
end;


function TdevToupcamG.Stop: Boolean;
begin
  Result:= err(Toupcam_Stop(f_Htoupcam));
end;

function TdevToupcamG.TDIBWIDTHBYTES(bits: Integer): Cardinal;
begin
   result := ((bits + 31) div 32) * 4;
end;



procedure TdevToupcamG.TimerCCDTimer(Sender: TObject);
begin
OnTimer;
end;

procedure TdevToupcamG.btnViDeleteAllClick(Sender: TObject);
var i:Integer;
begin
for i := 0 to Length(viList)-1 do
         if viList[i]<>nil then
             FreeAndNil(viList[i]);
SetLength(viList,0);
FisVectors:=False;

PaintBox.Invalidate;

end;

procedure TdevToupcamG.btnViDeleteClick(Sender: TObject);
var i:Integer;
    isSelected, b:Boolean;
begin
isSelected:=False;

b:=False;
for i := 0 to Length(viList)-1 do
         if viList[i]<>nil then
            begin
            if viList[i].Selected then
             begin
             FreeAndNil(viList[i]);
             isSelected:=true;
             end;
            if viList[i]<>nil then b:=True;
            end;

// if no selected then delete last
if not isSelected then
for i :=  Length(viList)-1 downto 0 do
         if viList[i]<>nil then
           begin
            FreeAndNil(viList[i]);
            Break;
           end;

if not b then
  begin
  SetLength(viList,0);
  FisVectors:=False;
  end;

PaintBox.Invalidate;
end;

procedure TdevToupcamG.btnViSelectClick(Sender: TObject);
begin
  case (Sender as TToolButton).Tag of
      1: gviInstrument:=viSelect;
      2: gviInstrument:=viLine;
      3: gviInstrument:=viMeasure;
      4: gviInstrument:=viRect;
      5: gviInstrument:=viGrid;
  end;
end;

procedure TdevToupcamG.trbBrightnessChange(Sender: TObject);
begin
lblBrightness.Caption:=trbBrightness.Position.ToString;
if fCanChange then
TimerCCD.Enabled:=True;
end;

procedure TdevToupcamG.trbCCDAEChange(Sender: TObject);
begin
lblExposureTarget.Caption:=trbCCDAE.Position.ToString;

if fCanChange then
TimerCCD.Enabled:=True;
end;

procedure TdevToupcamG.trbCCDAGainChange(Sender: TObject);
begin
lblAGain.Caption:=trbCCDAGain.Position.ToString;

if fCanChange then
TimerCCD.Enabled:=True;
end;

procedure TdevToupcamG.trbCCDTimeChange(Sender: TObject);
begin
lblExposureTime.Caption:=round(trbCCDTime.Position).ToString; {us->ms}

if fCanChange then
TimerCCD.Enabled:=True;
end;

procedure TdevToupcamG.trbColorTempChange(Sender: TObject);
begin
lblColorTemp.Caption:=trbColorTemp.Position.ToString;
if fCanChange then
TimerCCD.Enabled:=True;
end;

procedure TdevToupcamG.trbContrastChange(Sender: TObject);
begin
lblContrast.Caption:=trbContrast.Position.ToString;
if fCanChange then
TimerCCD.Enabled:=True;
end;

procedure TdevToupcamG.trbFrameRateChange(Sender: TObject);
var speed:Word;
begin
speed:=trbFrameRate.Position;

if fCanChange then
     err(Toupcam_put_Speed(f_Htoupcam, speed));
end;

procedure TdevToupcamG.trbGammaChange(Sender: TObject);
begin
lblGamma.Caption:=trbGamma.Position.ToString;
if fCanChange then
TimerCCD.Enabled:=True;
end;

procedure TdevToupcamG.trbHueChange(Sender: TObject);
begin
lblHue.Caption:=trbHue.Position.ToString;
if fCanChange then
TimerCCD.Enabled:=True;
end;

procedure TdevToupcamG.trbSaturationChange(Sender: TObject);
begin
lblSaturation.Caption:=trbSaturation.Position.ToString;
if fCanChange then
TimerCCD.Enabled:=True;
end;

procedure TdevToupcamG.trbTintChange(Sender: TObject);
begin
lblTint.Caption:=trbTint.Position.ToString;
if fCanChange then
TimerCCD.Enabled:=True;
end;

procedure TdevToupcamG.UpdateControls;
var Target, nMin, nMax, nDef, speed :Word;
    nMinT, nMaxT, nDefT :Cardinal;
    b, bAutoExposure:LongBool;
    int, temp, tint:Integer;
begin
if f_hToupCam<>nil then
  begin
  fCanChange:=False;
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
            trbCCDTime.Max:=nMaxT div 1000;
            trbCCDTime.Min:=nMinT div 1000;
            trbCCDTime.Position:=nDefT div 1000;
            Log(Format('Time Min=%d, Max=%d, Def=%d  ',[nMinT,nMaxT,nDefT]  ) );
           end;
   if err(Toupcam_get_ExpoTime(f_hToupCam, @nDefT)) then
            begin
            trbCCDTime.Position:=nDefT;
            fLastTime:=nDefT div 1000;
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

  fCanChange:=True;
  end;

end;

procedure TdevToupcamG.UpdateExposureTimeText;
var
  nTime: Cardinal;
  AGain: Word;
begin
  nTime := 0;
  AGain := 0;
  if (err(Toupcam_get_ExpoTime(f_Htoupcam, @nTime)) and err(Toupcam_get_ExpoAGain(f_Htoupcam, @AGain))) then
    begin
      fCanChange:=False;
      trbCCDTime.Position:=nTime div 1000;
      trbCCDAGain.Position:= AGain;
      StatusBarCCD.Panels[1].Text := Format('ExpTime=%d, Gain=%d ', [nTime div 1000, AGain]);
      fCanChange:=True;
    end;
end;

procedure TdevToupcamG.UpdateFrameText;
var
  str: string;
begin
  if (f_dwLastTick <> f_dwStartTick) then
//    str := Format('%d , %.2f fps', [f_nFrameCount, f_nFrameCount / ((f_dwLastTick - f_dwStartTick) / 1000.0)])
//  else
    str := Format('%d ', [f_nFrameCount]);

    StatusBarCCD.Panels[3].Text := str;
end;

procedure TdevToupcamG.UpdateTintTempText;
var
  nTemp, nTint: Integer;
begin
  nTemp := TOUPCAM_TEMP_DEF;
  nTint := TOUPCAM_TINT_DEF;
  if (err(Toupcam_get_TempTint(f_Htoupcam, @nTemp, @nTint))) then
      begin
      StatusBarCCD.Panels[2].Text := Format('Temp=%d, Tint=%d ', [nTemp, nTint]);

      fCanChange:=False;
      trbColorTemp.Position:=nTemp;
      trbTint.Position:=nTint;
      fCanChange:=True;
      end;
end;


function TdevToupcamG.GetImageToHeader:TBitmap32;
const WLimit = 1600;
var
      btmSave, tmpBitmap:TBitmap32;
      btmHWidth, btmHHeight:Integer;
      prop:Single;

      i,j,selected:Integer;
      L,R,T,B:Integer;
      len:Integer;

begin
result:=nil;
selected:=-1;
for i := Length(viList)-1 downto 0 do
  if viList[i].ClassNameIs('TVectorGrid') then
   begin
     selected:=i;
     Break;
   end;

if selected<0 then Exit;

 L:= Min(viList[selected].FPoints[0].X, viList[selected].FPoints[1].X );
 R:= Max(viList[selected].FPoints[0].X, viList[selected].FPoints[1].X );
 B:= Min(viList[selected].FPoints[0].Y, viList[selected].FPoints[3].Y );
 T:= Max(viList[selected].FPoints[0].Y, viList[selected].FPoints[3].Y );

 SnapTile;

  len:=Length(Tiles);
 if len>0 then
   begin
     tmpBitmap:=TBitmap32.Create;
     btmSave:=TBitmap32.Create;
     Result:=TBitmap32.Create;
     try
      tmpBitmap.SetSize(btmSnap.Width, btmSnap.Height);
      btmSave.SetSize(R-L, T-B);
      RecalcVisibleRect;

      if tmpBitmap<>nil then
       for i := 0 to len-1 do
        if PtInRect(VisibleRect, Tiles[i].pixPoint) then       // if tileCoord in visibleRect
        begin

          if bTilesInMemory then
            begin
              Tiles[i].btm.DrawTo(btmSave,
              Tiles[i].pixPoint.X-L-tmpBitmap.Width div 2, Tiles[i].pixPoint.Y-B-tmpBitmap.Height div 2 );
            end
          else
            begin
              tmpBitmap.LoadFromFile(TilesPath+Tiles[i].fileName);
              tmpBitmap.DrawTo(btmSave, Tiles[i].pixPoint.X-L-tmpBitmap.Width div 2, Tiles[i].pixPoint.Y-B-tmpBitmap.Height div 2  );
            end;
         end;


         btmHWidth:=R-L;
         btmHHeight:=T-B;

         if btmHWidth>btmHHeight then
            begin
            prop:=btmHWidth/WLimit;
            btmHWidth:=WLimit;
            btmHHeight:=Round(btmHHeight/prop);
            end
         else
            begin
            prop:=btmHHeight/WLimit;
            btmHHeight:=WLimit;
            btmHWidth:=Round(btmHWidth/prop);
            end;

         Result.SetSize(btmHWidth, btmHHeight);
         btmSave.Resampler:= TNearestResampler.Create(btmSave);
         btmSave.DrawMode:=dmOpaque;

         btmSave.DrawTo(Result, Rect(0,0,Result.Width, Result.Height));

     finally
       tmpBitmap.Free;
       btmSave.Free;
     end;
    end;


end;

{ TScanThread }


procedure TScanThread.CaptureTile;
begin
  if FOwner.cbUseEncoders.Checked then
   FOwner.CorrectPosByEncoders;

    // Wait for end moving and snap
 FOwner.SnapTile;
 FOwner.RepaintMap; //need to change on  paintSnap to btmTile
end;

constructor TScanThread.Create(AOwner: TdevToupcamG);
begin
inherited Create(True);
FOwner:=AOwner;
end;

procedure TScanThread.Execute;
var i,j, n:Integer;
    zeroPoint, nextPoint:TPoint;
    zeroPointMot, NextPointMot:TPoint;

    diffPix, diffSteps:Integer;

    pixDist, stepsDist:TPoint;
    ts:Cardinal;
    xd:Integer;

begin
  inherited;
   zeroPoint.X:= FOwner.gblCenter.X;
   zeroPoint.Y:= FOwner.gblCenter.Y;

   zeroPointMot.X:= FOwner.Controller.MotX.Position;
   zeroPointMot.Y:= FOwner.Controller.MotY.Position;

//   StartPoint.X:=StartPoint.X + dirX*Round(stepX/2);     //move to StartScanVis
//   StartPoint.Y:=StartPoint.Y + dirY*Round(stepY/2);


  FOwner.Log(Format('nearest [%d x %d] ',[StartPoint.X, StartPoint.Y]) );
  FOwner.Log(Format('ScanVis [%d x %d] ',[nX, nY]) );
  FOwner.Log(Format('ScanVis DirX=%d DirY=%d] ',[dirX, dirY]) );

   xd:=1;
   i:=0; j:=0;
   for n := 0 to nX*nY-1 do
      begin
      // calcNextPoint
       nextPoint.X:=StartPoint.X + Round(dirX*stepX*i);
       nextPoint.Y:=StartPoint.Y + Round(dirY*stepY*j);

      FOwner.Log(Format('Point[%d] XY=[%d x %d]=coord[%d x %d] ',[n, i, j, nextPoint.X, nextPoint.Y]));

        //Move motors
       diffPix:= nextPoint.X-zeroPoint.X;
       diffSteps:=Round( diffPix*FOwner.prop_stepsToPix_X);
       NextPointMot.X:=zeroPointMot.X+diffSteps;

       diffPix:= nextPoint.Y-zeroPoint.Y;
       diffSteps:=Round( diffPix*FOwner.prop_stepsToPix_Y);
       NextPointMot.Y:=zeroPointMot.Y-diffSteps;

      FOwner.Controller.MotX.MovAbs( NextPointMot.X);
      FOwner.Controller.MotY.MovAbs( NextPointMot.Y);

//      TThread.Synchronize(nil, procedure()
//          begin
//           FOwner.gblCenter.X:= nextPoint.X;
//           FOwner.gblCenter.Y:= nextPoint.Y;
//           FOwner.RepaintMap;
//          end);

       ts:=GetTickCount;
       while FOwner.Controller.MotX.Moving or FOwner.Controller.MotY.Moving do
          begin
          sleep(50);
          if GetTickCount-ts>60000 then Break;
           if fStop or Terminated then
            Break;
          end;
       Sleep(500);

      if fStop or Terminated then
           Break;

      Synchronize(CaptureTile);

      i:=i+xd;
      if i=nX then
        begin
         i:=nX-1;
         xd:=-1;
         j:=j+1;
        end;
      if i<0 then
        begin
         i:=0;
         xd:=1;
         j:=j+1;
        end;

      end;

end;



procedure TdevToupcamG.spedtGridnXChange(Sender: TObject);
var i, selected:Integer;
begin
if not canChange then Exit;

selected:=GetScanGridIdx;
if selected<0 then Exit;

TVectorGrid(viList[selected]).SetnXnY(spedtGridnX.Value, spedtGridnY.Value);
PaintBox.Invalidate;
end;

end.
