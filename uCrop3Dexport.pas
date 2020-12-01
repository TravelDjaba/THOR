unit uCrop3Dexport;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AdvUtil, Vcl.Grids, AdvObj, BaseGrid,
  AdvGrid, Vcl.StdCtrls, Vcl.Buttons;

type
  TFormCrop = class(TForm)
    sgCrop: TAdvStringGrid;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    procedure sgCropGetEditorType(Sender: TObject; ACol, ARow: Integer;
      var AEditor: TEditorType);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCrop: TFormCrop;

implementation

{$R *.dfm}

procedure TFormCrop.FormShow(Sender: TObject);
begin
sgCrop.ShowCellEdit;
sgCrop.Colors[1,1]:=clGray;
sgCrop.Colors[1,2]:=clGray;
sgCrop.Colors[1,3]:=clGray;
sgCrop.Colors[4,1]:=clGray;
sgCrop.Colors[4,2]:=clGray;
sgCrop.Colors[4,3]:=clGray;
end;

procedure TFormCrop.sgCropGetEditorType(Sender: TObject; ACol, ARow: Integer;
  var AEditor: TEditorType);
begin
sgCrop.SpinEdit.MaxValue:=999999;
case ACol of
  1,4: AEditor := edNone;
  2,3: AEditor := edSpinEdit;
end;
end;

end.
