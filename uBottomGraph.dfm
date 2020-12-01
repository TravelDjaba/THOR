object HGraph: THGraph
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'HGraph'
  ClientHeight = 493
  ClientWidth = 987
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
    Width = 987
    Height = 493
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
    Left = 104
    Top = 50
  end
  object PopupMenu1: TPopupMenu
    Left = 136
    Top = 160
    object pmSaveAsCsv: TMenuItem
      Caption = 'Save as CSV'
      OnClick = pmSaveAsCsvClick
    end
    object SaveasCSV1: TMenuItem
      Caption = 'Save as transp CSV'
      OnClick = SaveasCSV1Click
    end
  end
end
