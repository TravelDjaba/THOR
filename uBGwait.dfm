object FormWaitBG: TFormWaitBG
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Wait BG'
  ClientHeight = 58
  ClientWidth = 237
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object sLabel1: TsLabel
    Left = 64
    Top = 9
    Width = 77
    Height = 16
    Caption = 'Please, wait !'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
  end
  object lblInfo: TsLabel
    Left = 64
    Top = 31
    Width = 3
    Height = 13
  end
  object ActivityIndicator1: TActivityIndicator
    Left = 8
    Top = 8
  end
end
