unit iSaveMultiCSV;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, acPNG, Vcl.ExtCtrls, acImage,
  Vcl.StdCtrls, sComboBox;

type
  TFormSaveMultiCSV = class(TForm)
    sImage1: TsImage;
    cboxZ: TsComboBox;
    cboxX: TsComboBox;
    cboxY: TsComboBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSaveMultiCSV: TFormSaveMultiCSV;

implementation

{$R *.dfm}

end.
