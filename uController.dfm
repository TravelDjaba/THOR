object FormController: TFormController
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'FormController'
  ClientHeight = 226
  ClientWidth = 672
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object TimerOneSec: TTimer
    Left = 192
    Top = 152
  end
end
