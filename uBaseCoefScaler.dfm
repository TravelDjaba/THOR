object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 567
  ClientWidth = 540
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    540
    567)
  PixelsPerInch = 96
  TextHeight = 13
  object pnlScaler: TPanel
    Left = 8
    Top = 8
    Width = 57
    Height = 551
    Anchors = [akLeft, akTop, akBottom]
    Caption = 'pnlScaler'
    TabOrder = 0
  end
  object ApplicationEvents1: TApplicationEvents
    OnMessage = ApplicationEvents1Message
    Left = 200
    Top = 128
  end
end
