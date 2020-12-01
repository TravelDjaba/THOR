unit uSaveMultiCSV;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, acPNG, Vcl.ExtCtrls, acImage,
  Vcl.StdCtrls, sComboBox, sButton;

type
  TFormSaveMultiCSV = class(TForm)
    sImage1: TsImage;
    cboxZ: TsComboBox;
    cboxX: TsComboBox;
    cboxY: TsComboBox;
    btnSave: TsButton;
    btnCancel: TsButton;
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
    fa, fb, fc:String;
    fx,fy,fz:String ;

  public
    { Public declarations }

    selected:Boolean;
    function UseAxis(a, b, c:String):boolean;
    function SelectAxis(a, b, c:String; var x,y,z:String):boolean;
  end;

var
  FormSaveMultiCSV: TFormSaveMultiCSV;

implementation

{$R *.dfm}

{ TFormSaveMultiCSV }

procedure TFormSaveMultiCSV.btnCancelClick(Sender: TObject);
begin
selected:=True;
end;

procedure TFormSaveMultiCSV.btnSaveClick(Sender: TObject);
begin
selected:=True;
end;

function TFormSaveMultiCSV.SelectAxis( a, b, c:String; var x, y, z: String): boolean;
begin
Self.ShowModal;
selected:=False;

//while not selected do
//Application.ProcessMessages;

result:=True;
end;

function TFormSaveMultiCSV.UseAxis(a, b, c: String): boolean;
begin
 fa:=a;
 fb:=b;
 fc:=c;

 cboxX.Items.Clear;
// cboxX.Items.Add(fa);
// cboxX.Items.Add(fb);
 cboxX.Items.Add(fc);

 cboxY.Items.Clear;
 cboxY.Items.Add(fa);
 cboxY.Items.Add(fb);
// cboxY.Items.Add(fc);

 cboxZ.Items.Clear;
 cboxZ.Items.Add(fa);
 cboxZ.Items.Add(fb);
// cboxZ.Items.Add(fc);

 cboxX.ItemIndex:=1;
 cboxY.ItemIndex:=1;
 cboxZ.ItemIndex:=0;

 Self.ShowModal;

end;

end.
