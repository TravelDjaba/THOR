unit uViewCompare;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, GR32, GR32_Image, Vcl.ExtCtrls, sPanel, uViewer, System.IniFiles;

type
  TFormViewCompare = class(TForm)
    sPanel1: TsPanel;
    ImgView321: TImgView32;
  private
    { Private declarations }

  public
    { Public declarations }
    Viewer: TViewer;

  end;


implementation

{$R *.dfm}

{ TFormViewCompare }


end.
