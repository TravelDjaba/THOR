object FormLog: TFormLog
  Left = 0
  Top = 0
  Caption = 'Log'
  ClientHeight = 696
  ClientWidth = 445
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object sToolBar1: TsToolBar
    Left = 0
    Top = 0
    Width = 445
    Height = 21
    AutoSize = True
    ButtonHeight = 21
    ButtonWidth = 32
    Caption = 'sToolBar1'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    ShowCaptions = True
    TabOrder = 0
    object btnClear: TToolButton
      Left = 0
      Top = 0
      Caption = 'Clear'
      ImageIndex = 0
      OnClick = btnClearClick
    end
  end
  object MemoLog: TsMemo
    Left = 0
    Top = 21
    Width = 445
    Height = 675
    Align = alClient
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 12171716
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 1
  end
end
