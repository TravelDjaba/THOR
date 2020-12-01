object IGraph: TIGraph
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'IGraph'
  ClientHeight = 566
  ClientWidth = 1022
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    1022
    566)
  PixelsPerInch = 96
  TextHeight = 13
  object lblIdx: TLabel
    Left = 18
    Top = 8
    Width = 26
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'lblIdx'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object PaintBox: TPaintBox32
    Left = 0
    Top = 0
    Width = 1022
    Height = 566
    Align = alClient
    RepaintMode = rmOptimizer
    TabOrder = 0
    OnMouseDown = PaintBoxMouseDown
    OnMouseMove = PaintBoxMouseMove
    OnMouseUp = PaintBoxMouseUp
    OnMouseWheel = PaintBoxMouseWheel
    OnResize = PaintBoxResize
  end
end
