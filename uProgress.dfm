object FormProgress: TFormProgress
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Progress'
  ClientHeight = 44
  ClientWidth = 411
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object ProgressBar: TsProgressBar
    Left = 8
    Top = 15
    Width = 305
    Height = 17
    TabOrder = 0
  end
  object edtProgress: TsEdit
    Left = 327
    Top = 13
    Width = 50
    Height = 21
    Enabled = False
    TabOrder = 1
    Text = '0.0 %'
  end
end
