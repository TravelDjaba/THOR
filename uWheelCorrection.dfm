object FormWheelCorrection: TFormWheelCorrection
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'WheelCorrection'
  ClientHeight = 159
  ClientWidth = 264
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object edtRadius: TsEdit
    Left = 104
    Top = 16
    Width = 73
    Height = 21
    NumbersOnly = True
    TabOrder = 0
    Text = '300'
    BoundLabel.Active = True
    BoundLabel.Caption = 'Radius'
  end
  object edtFirstPixel: TsEdit
    Left = 104
    Top = 43
    Width = 73
    Height = 21
    NumbersOnly = True
    TabOrder = 2
    Text = '0'
    BoundLabel.Active = True
    BoundLabel.Caption = 'First pixel'
  end
  object edtLastPixel: TsEdit
    Left = 104
    Top = 70
    Width = 73
    Height = 21
    NumbersOnly = True
    TabOrder = 3
    Text = '1999'
    BoundLabel.Active = True
    BoundLabel.Caption = 'Last pixel'
  end
  object btnApply: TsButton
    Left = 79
    Top = 120
    Width = 75
    Height = 25
    Caption = 'Apply'
    ModalResult = 1
    TabOrder = 1
    OnClick = btnApplyClick
  end
  object btnCancel: TsButton
    Left = 168
    Top = 120
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 4
  end
end
