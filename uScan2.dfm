object FormScan2: TFormScan2
  Left = 0
  Top = 0
  Caption = 'ScanLXYZ'
  ClientHeight = 747
  ClientWidth = 1422
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
  object sSplitter1: TsSplitter
    Left = 0
    Top = 150
    Width = 1422
    Height = 6
    Cursor = crVSplit
    Align = alTop
    ExplicitWidth = 481
  end
  object pnlTop: TsPanel
    Left = 0
    Top = 0
    Width = 1422
    Height = 150
    Align = alTop
    TabOrder = 0
    object sLabel1: TsLabel
      Left = 467
      Top = 78
      Width = 42
      Height = 13
      Caption = 'Progress'
    end
    object lblScanProgress: TsLabel
      Left = 929
      Top = 78
      Width = 27
      Height = 13
      Caption = '0.0%'
    end
    object lblScannerStatus: TsLabel
      Left = 583
      Top = 93
      Width = 54
      Height = 16
      Caption = 'Stopped'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
    object sgInfo: TStringGrid
      Left = 978
      Top = 4
      Width = 248
      Height = 141
      ParentCustomHint = False
      ColCount = 2
      DefaultRowHeight = 16
      FixedCols = 0
      RowCount = 8
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine]
      ParentColor = True
      ScrollBars = ssNone
      TabOrder = 0
      ColWidths = (
        83
        160)
      RowHeights = (
        16
        16
        16
        16
        16
        16
        16
        16)
    end
    object edtFileName: TsEdit
      Left = 516
      Top = 27
      Width = 177
      Height = 21
      Color = 3355443
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 15724527
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = 'Scan1'
      BoundLabel.Active = True
      BoundLabel.Caption = 'File Name'
    end
    object edtDescription: TsEdit
      Left = 516
      Top = 49
      Width = 457
      Height = 21
      Color = 3355443
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 15724527
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      BoundLabel.Active = True
      BoundLabel.Caption = 'Description'
    end
    object edtSaveDir: TsDirectoryEdit
      Left = 516
      Top = 4
      Width = 457
      Height = 21
      AutoSize = False
      Color = 3355443
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 15724527
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 255
      ParentFont = False
      TabOrder = 3
      Text = ''
      OnChange = edtSaveDirChange
      CheckOnExit = True
      BoundLabel.Active = True
      BoundLabel.Caption = 'SaveDirectory'
      InitialDir = 'C:\'
      Root = 'rfDesktop'
    end
    object sPanel1: TsPanel
      Left = 516
      Top = 115
      Width = 210
      Height = 30
      TabOrder = 4
      object btnStart: TsButton
        Left = 5
        Top = 3
        Width = 66
        Height = 25
        Caption = 'Start'
        TabOrder = 0
        OnClick = btnStartClick
      end
      object btnPause: TsButton
        Left = 73
        Top = 3
        Width = 66
        Height = 25
        Caption = 'Pause'
        TabOrder = 1
        OnClick = btnPauseClick
      end
      object btnStop: TsButton
        Left = 141
        Top = 3
        Width = 66
        Height = 25
        Caption = 'Stop'
        TabOrder = 2
        OnClick = btnStopClick
      end
    end
    object pbScanProgress: TsProgressBar
      Left = 516
      Top = 76
      Width = 402
      Height = 15
      TabOrder = 5
    end
    object pcScanType: TsPageControl
      Left = 8
      Top = 4
      Width = 389
      Height = 143
      ActivePage = tsXYZ
      TabOrder = 6
      object tsXYZ: TsTabSheet
        Caption = 'XYZ'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
      end
      object tsAdvanced: TsTabSheet
        Caption = 'Advanced'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object sToolBar2: TsToolBar
          Left = 0
          Top = 0
          Width = 381
          Height = 23
          AutoSize = True
          ButtonHeight = 21
          ButtonWidth = 53
          Caption = 'sToolBar2'
          DoubleBuffered = True
          EdgeInner = esNone
          EdgeOuter = esRaised
          Flat = False
          ParentDoubleBuffered = False
          ShowCaptions = True
          TabOrder = 0
          object btnDimX: TToolButton
            Left = 0
            Top = 0
            Caption = 'X'
            ImageIndex = 0
            OnClick = btnDimXClick
          end
          object btnDimY: TToolButton
            Tag = 1
            Left = 53
            Top = 0
            Caption = 'Y'
            ImageIndex = 1
            OnClick = btnDimXClick
          end
          object btnDimZ: TToolButton
            Tag = 2
            Left = 106
            Top = 0
            Caption = 'Z'
            ImageIndex = 2
            OnClick = btnDimXClick
          end
          object btnDimLaserPower: TToolButton
            Tag = 3
            Left = 159
            Top = 0
            Caption = 'LaserPow'
            ImageIndex = 4
            OnClick = btnDimXClick
          end
          object btnDimTimer: TToolButton
            Tag = 4
            Left = 212
            Top = 0
            Caption = 'Timer'
            ImageIndex = 5
            OnClick = btnDimXClick
          end
          object btnDimColimator: TToolButton
            Tag = 5
            Left = 265
            Top = 0
            Caption = 'Colimator'
            ImageIndex = 6
            OnClick = btnDimXClick
          end
          object btnDimGoniometer: TToolButton
            Tag = 6
            Left = 318
            Top = 0
            Caption = 'Goniomtr'
            ImageIndex = 7
            OnClick = btnDimXClick
          end
        end
        object sButton1: TsButton
          Left = 345
          Top = 32
          Width = 34
          Height = 27
          Caption = 'Del'
          TabOrder = 1
          OnClick = sButton1Click
        end
      end
    end
    object sPanel2: TsPanel
      Left = 803
      Top = 102
      Width = 163
      Height = 45
      TabOrder = 7
    end
    object btnTerminate: TsButton
      Left = 1336
      Top = 8
      Width = 57
      Height = 25
      Caption = 'Terminate'
      TabOrder = 8
      OnClick = btnTerminateClick
    end
    object cbExpTiming: TsCheckBox
      Left = 403
      Top = 97
      Width = 109
      Height = 17
      Caption = 'Exponential Time'
      TabOrder = 9
    end
  end
  object pnlViewer: TsPanel
    Left = 0
    Top = 156
    Width = 1422
    Height = 591
    Align = alClient
    TabOrder = 1
  end
end
