unit uCCD;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ieview, imageenview,ieds, Vcl.ExtCtrls,
  sSplitter, sPanel, sSpeedButton, Vcl.Buttons, Vcl.StdCtrls, Vcl.ToolWin,
  Vcl.ComCtrls, sToolBar, devControllerM, rulerbox, sEdit, sSpinEdit, IniFiles;

type
  TFormCCD = class(TForm)
    sToolBar1: TsToolBar;
    ComboBox1: TComboBox;
    btnPlay: TSpeedButton;
    btnSettings: TsSpeedButton;
    sPanel1: TsPanel;
    sSplitter1: TsSplitter;
    sSplitter2: TsSplitter;
    sPanel2: TsPanel;
    ImageEnView3: TImageEnView;
    sPanel3: TsPanel;
    sPanel5: TsPanel;
    sPanel6: TsPanel;
    ImageEnView2: TImageEnView;
    sPanel4: TsPanel;
    ImageEnView1: TImageEnView;
    HorizRuler: TRulerBox;
    VertRuler: TRulerBox;
    sDecimalSpinEdit1: TsDecimalSpinEdit;
    ToolButton1: TToolButton;
    Label1: TLabel;
    btnProperty: TsSpeedButton;
    btnVideoInputSource: TsSpeedButton;
    procedure btnPlayClick(Sender: TObject);
    procedure btnSettingsClick(Sender: TObject);
    procedure ImageEnView1DShowNewFrame(Sender: TObject);
    procedure ImageEnView1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ImageEnView1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ImageEnView1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure sPanel2Resize(Sender: TObject);
    procedure ImageEnView1Resize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ImageEnView1ViewChange(Sender: TObject; Change: Integer);
    procedure ImageEnView1MouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure sDecimalSpinEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnPropertyClick(Sender: TObject);
    procedure btnVideoInputSourceClick(Sender: TObject);
  private
    { Private declarations }
    Controller:TControllerM;


    procedure CalcDensity(const X,Y:integer);
  public
    { Public declarations }
    procedure CamConnect;
    procedure CamDisconnect;
    function SaveSettings:boolean;
    function LoadSettings:boolean;
  end;

var

  dX, dY:integer;
  isMovXY:boolean;
  pX,pY:integer;

  m_dpi: double;

  HR, VR:integer;


implementation
uses main, math;

{$R *.dfm}

procedure TFormCCD.btnPlayClick(Sender: TObject);
begin
   if btnPlay.Down then
  begin
    CamConnect;

    ImageEnView2.Clear;
    ImageEnView3.Clear;

  end
  else
  begin
    CamDisconnect;
  end;
end;

procedure TFormCCD.btnPropertyClick(Sender: TObject);
begin
//CamConnect;
ImageEnView1.IO.DShowParams.ShowPropertyPages(iepVideoInput, ietOutput, false);
end;

procedure TFormCCD.btnSettingsClick(Sender: TObject);
begin
  CamConnect;
  ImageEnView1.IO.DShowParams.ShowPropertyPages(iepVideoInput, ietFilter,false);
end;

procedure TFormCCD.btnVideoInputSourceClick(Sender: TObject);
begin
  ImageEnView1.IO.DShowParams.ShowPropertyPages(iepVideoInputSource, ietFilter,false);
end;

procedure TFormCCD.CalcDensity(const X, Y: integer);
var
  VertHist, HorizHist: pintegerarray;
  VertHistHeight, HorizHistWidth, VertHistWidth, HorizHistHeight: integer;
  i: integer;
begin

  VertHistWidth := ImageEnView3.ClientWidth;
  VertHistHeight := ImageEnView1.IEBitmap.Height;
  HorizHistWidth := ImageEnView1.IEBitmap.Width;
  HorizHistHeight := ImageEnView2.ClientHeight;
  getmem(VertHist, VertHistHeight * sizeof(integer));
  getmem(HorizHist, HorizHistWidth * sizeof(integer));

  ImageEnView1.proc.CalcDensityHistogramLine(VertHist, HorizHist, VertHistWidth, HorizHistHeight, X,Y);

  // horizontal
  ImageEnView2.Bitmap.Height := HorizHistHeight;
  ImageEnView2.Bitmap.Width :=  HorizHistWidth;
  // vertical
  ImageEnView3.Bitmap.Height := VertHistHeight;
  ImageEnView3.Bitmap.Width := VertHistWidth;
  // draw histograms
  ImageEnView2.Bitmap.Canvas.Pen.Color := clLtGray;
  ImageEnView2.Bitmap.Canvas.Pen.Width:=2;
  ImageEnView3.Bitmap.Canvas.Pen.Color := clLtGray;
  ImageEnView3.Bitmap.Canvas.Pen.Width:=2;


  for i := 0 to HorizHistWidth - 1 do
    begin
    ImageEnView2.Bitmap.Canvas.MoveTo(i, HorizHistHeight);
    ImageEnView2.Bitmap.Canvas.LineTo(i, HorizHistHeight - HorizHist[i]);
    end;


  for i := 0 to VertHistHeight - 1 do
    begin
    ImageEnView3.Bitmap.Canvas.MoveTo(0,i);
    ImageEnView3.Bitmap.Canvas.LineTo(VertHist[i], i);
    end;


//  ImageEnView2.Bitmap.Canvas.Pen.Color := clMaroon;
//  ImageEnView2.Bitmap.Canvas.Pen.Width:=1;
//  ImageEnView3.Bitmap.Canvas.Pen.Color := clMaroon;
//  ImageEnView3.Bitmap.Canvas.Pen.Width:=1;
//
//   ImageEnView2.Bitmap.Canvas.MoveTo(0, HorizHistHeight- HorizHist[0]);
//  for i := 1 to HorizHistWidth - 1 do
//    begin
////    ImageEnView2.Bitmap.Canvas.MoveTo(i, HorizHistHeight);
//    ImageEnView2.Bitmap.Canvas.LineTo(i, HorizHistHeight - HorizHist[i]);
//    end;
//
//ImageEnView3.Bitmap.Canvas.MoveTo(VertHist[0],0);
//  for i := 1 to VertHistHeight - 1 do
//    begin
////    ImageEnView3.Bitmap.Canvas.MoveTo(0,i);
//    ImageEnView3.Bitmap.Canvas.LineTo(VertHist[i], i);
//    end;

  ImageEnView2.ZoomX:=ImageEnView1.ZoomX;
  ImageEnView3.ZoomY:=ImageEnView1.ZoomY;

  ImageEnView2.Update;
  ImageEnView3.Update;
  //
  freemem(VertHist);
  freemem(HorizHist);


end;

procedure TFormCCD.CamConnect;
begin
   if (not ImageEnView1.IO.DShowParams.Connected) then
  begin
    // set video source as index of IO.DShowParams.VideoInputs
    ImageEnView1.IO.DShowParams.SetVideoInput(ComboBox1.ItemIndex, 0); // set the second parameter if you have more than one camera with same name
    // enable frame grabbing
    ImageEnView1.IO.DShowParams.EnableSampleGrabber := true;
    // connect to the video input
    ImageEnView1.IO.DShowParams.Connect;
    // start capture
    ImageEnView1.IO.DShowParams.Run;
  end;
end;

procedure TFormCCD.CamDisconnect;
begin
   // stop and disconnect
  ImageEnView1.IO.DShowParams.Disconnect;
end;

procedure TFormCCD.FormCreate(Sender: TObject);
begin
m_dpi := 1; // pixels
end;

procedure TFormCCD.FormShow(Sender: TObject);
var i:integer;
begin
Controller:=FormMain.Controller;
// Fill video source combobox
  ComboBox1.Items.Assign(ImageEnView1.IO.DShowParams.VideoInputs);


for i := 0 to ComboBox1.Items.Count-1 do
  if Pos('PixeLINK', ComboBox1.Items[i])>0 then
     begin
      ComboBox1.ItemIndex := i;
      break;
     end;

end;

procedure TFormCCD.ImageEnView1DShowNewFrame(Sender: TObject);
begin
  // copy current sample to ImageEnView bitmap
  ImageEnView1.IO.DShowParams.GetSample(ImageEnView1.IEBitmap);
  ImageEnView1.Update;

  ImageEnView2.Clear;
  ImageEnView3.Clear;
  CalcDensity(HR,VR);


  ImageEnView1.IEBitmap.Canvas.Pen.Color:=clRed;
  ImageEnView1.IEBitmap.Canvas.Pen.Width:=1;

  ImageEnView1.IEBitmap.Canvas.MoveTo(HR,0);
  ImageEnView1.IEBitmap.Canvas.LineTo(HR,ImageEnView1.IEBitmap.Height);
  ImageEnView1.IEBitmap.Canvas.MoveTo(0,VR);
  ImageEnView1.IEBitmap.Canvas.LineTo(ImageEnView1.IEBitmap.Width, VR);

   // refresh ImageEnView1
  ImageEnView1.Update;
end;

procedure TFormCCD.ImageEnView1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);

var pX,pY:integer;
begin
if ssLeft in Shift then
  begin
  dX:=X;
  dY:=Y;
  isMovXY:=true;
  end;

if ssRight in Shift then
  begin
// px:=min(max(0, round((X-ImageEnView1.OffsetX)/ImageEnView1.ZoomX*100)),ImageEnView1.IEBitmap.Width) ;
// py:=min(max(0, round((Y-ImageEnView1.OffsetY)/ImageEnView1.ZoomY*100)),ImageEnView1.IEBitmap.Height) ;


 //StatusBarEdmund.Panels[0].Text:=Format('X=%d Y=%d',[px,py]);


 HR:= min(max(0,ImageEnView1.XScr2Bmp( X )),ImageEnView1.IEBitmap.Width) ;
 VR:= min(max(0, ImageEnView1.YScr2Bmp(Y)),ImageEnView1.IEBitmap.Height) ;

 label1.Caption:=Format('X=%d'+#13#10+'Y=%d',[HR, VR]);
//
//  ImageEnView2.Clear;
//  ImageEnView3.Clear;
//  CalcDensity(HR,VR);
 end;
end;

procedure TFormCCD.ImageEnView1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);

begin
  HorizRuler.GripsPos[0] := ImageEnView1.XScr2Bmp( X )/m_dpi;
  VertRuler.GripsPos[0]  := ImageEnView1.YScr2Bmp( Y )/m_dpi;

if ssRight in Shift then
  begin

//StatusBarEdmund.Panels[0].Text:=Format('X=%d Y=%d',[px,py]);


  HR:= min(max(0,ImageEnView1.XScr2Bmp( X )),ImageEnView1.IEBitmap.Width) ;
  VR:= min(max(0, ImageEnView1.YScr2Bmp(Y)),ImageEnView1.IEBitmap.Height) ;

//  ImageEnView2.Clear;
//  ImageEnView3.Clear;
//  CalcDensity(HR,VR);
  label1.Caption:=Format('X=%d'+#13#10+'Y=%d',[HR, VR]);

 end;
end;

procedure TFormCCD.ImageEnView1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var moveCoef:single;
begin
if isMovXY then
   begin
    moveCoef:=500.0;
    Controller.MotX.MovRel(round((X-dX)/ImageEnView1.ZoomX*moveCoef));  // IntToStr(round((X-dx)/ImageEnView1.ZoomX*moveCoef))
    Controller.MotY.MovRel(round((Y-dY)/ImageEnView1.ZoomY*moveCoef));
    isMovXY:=false;
   end;

end;

procedure TFormCCD.ImageEnView1MouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
ImageEnView1.AutoFit:=false;
end;

procedure TFormCCD.ImageEnView1Resize(Sender: TObject);
begin
//  ImageEnView2.Clear;
//  ImageEnView3.Clear;
//
// CalcDensity(HR,VR);

end;

procedure TFormCCD.ImageEnView1ViewChange(Sender: TObject; Change: Integer);
var
  z: double;
begin
  z := ImageEnView1.Zoom / 100;

  HorizRuler.ViewPos := (0 - ImageEnView1.IEBitmap.Width/ 2 {- ImageEnView1.OffsetX/2}) / z / m_dpi;
  VertRuler.ViewPos := 0 - ImageEnView1.IEBitmap.Height/ 2 / z / m_dpi;

  HorizRuler.DotPerUnit := z * m_dpi;
  VertRuler.DotPerUnit  := z * m_dpi;

  HorizRuler.Frequency := 10 / HorizRuler.DotPerUnit;
  VertRuler.Frequency  := 10 / VertRuler.DotPerUnit;
  HorizRuler.LabelFreq := 100 / HorizRuler.DotPerUnit;
  VertRuler.LabelFreq  := 100 / VertRuler.DotPerUnit;

 // StatusBar1.SimpleText := 'Zoom ' + FloatToStr( ImageEnView1.Zoom ) + '%';

  if Change = 1 then
    ImageEnView1.OnResize(self);
end;

function TFormCCD.LoadSettings: boolean;
 var Ini:TIniFile;
  section:string;

  i,j:integer;
begin
result:=False;
Ini:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'ControllerSettings.ini');
try
    section:='CCD';

   if Ini.SectionExists(section) then
       begin
         m_dpi :=Ini.ReadFloat(section,'Proportion',1.0 );
         sDecimalSpinEdit1.Value:=1/m_dpi;
         ImageEnView1ViewChange(self, 1);
       end;

result:=True;
finally
Ini.Free;
end;
end;

function TFormCCD.SaveSettings: boolean;
var Ini:TMemIniFile;
    section:string;
    i,j:Integer;
begin
result:=False;
Ini:=TMemIniFile.Create(ExtractFilePath(Application.ExeName)+'ControllerSettings.ini');
  section:='CCD';

   Ini.WriteFloat(section,'Proportion', m_dpi);

try
Ini.UpdateFile;
result:=True;
finally
Ini.Free;
end;
end;

procedure TFormCCD.sDecimalSpinEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key=VK_RETURN then
  begin
  m_dpi := 1/sDecimalSpinEdit1.Value;
  ImageEnView1ViewChange(self, 1);
  end;
end;

procedure TFormCCD.sPanel2Resize(Sender: TObject);
begin
sPanel5.Width:=sPanel2.Width+5;

end;

end.
