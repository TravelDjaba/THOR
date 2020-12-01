object VGraph: TVGraph
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'VGraph'
  ClientHeight = 375
  ClientWidth = 761
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PaintBox: TPaintBox32
    Left = 0
    Top = 0
    Width = 761
    Height = 375
    Align = alClient
    TabOrder = 0
    OnMouseDown = PaintBoxMouseDown
    OnMouseMove = PaintBoxMouseMove
    OnMouseUp = PaintBoxMouseUp
    OnMouseWheel = PaintBoxMouseWheel
    OnResize = PaintBoxResize
  end
  object SaveDialog: TsSaveDialog
    DefaultExt = 'csv'
    Filter = 'csv|*.csv|txt|*.txt'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 88
    Top = 50
  end
  object PopupMenu1: TPopupMenu
    Left = 168
    Top = 144
    object pmSaveAsCsv: TMenuItem
      Caption = 'Save as CSV'
      OnClick = pmSaveAsCsvClick
    end
  end
end
