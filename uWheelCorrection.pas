unit uWheelCorrection;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, sButton, sEdit;

type
  TFormWheelCorrection = class(TForm)
    edtRadius: TsEdit;
    edtFirstPixel: TsEdit;
    edtLastPixel: TsEdit;
    btnApply: TsButton;
    btnCancel: TsButton;
    procedure FormCreate(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    fRadius, fFirstPixel, fLastPixel: Integer;
  end;

var
  FormWheelCorrection: TFormWheelCorrection;

implementation

{$R *.dfm}

procedure TFormWheelCorrection.btnApplyClick(Sender: TObject);
begin
fRadius:=StrToIntDef(edtRadius.Text, 300);
if (fRadius<50) or (fRadius>1000) then
  fRadius := 300;
edtRadius.Text:=IntToStr(fRadius);


fFirstPixel:=StrToIntDef(edtFirstPixel.Text, 0);
 if (fFirstPixel<0) or (fFirstPixel>1998) then
  fFirstPixel := 0;
 edtFirstPixel.Text:=IntToStr(fFirstPixel);

fLastPixel:=StrToIntDef(edtLastPixel.Text, 1999);

 if (fLastPixel<=fFirstPixel) or (fLastPixel>1999) then
  fLastPixel := 1999;
 edtLastPixel.Text:=IntToStr(fLastPixel);

end;

procedure TFormWheelCorrection.FormCreate(Sender: TObject);
begin
fRadius:=300;
fFirstPixel:=190;
fLastPixel:=1999;
end;

procedure TFormWheelCorrection.FormShow(Sender: TObject);
begin

  edtRadius.Text:=IntToStr(fRadius);
  edtFirstPixel.Text:=IntToStr(fFirstPixel);
  edtLastPixel.Text:=IntToStr(fLastPixel);
end;

end.
