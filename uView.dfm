object View: TView
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'View'
  ClientHeight = 549
  ClientWidth = 921
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefault
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object sSplitter1: TsSplitter
    Left = 0
    Top = 58
    Width = 921
    Height = 6
    Cursor = crVSplit
    Align = alTop
    ExplicitTop = 41
    ExplicitWidth = 415
  end
  object sSplitter2: TsSplitter
    Left = 5
    Top = 64
    Width = 5
    Height = 434
    ExplicitLeft = 47
    ExplicitHeight = 370
  end
  object sSplitter3: TsSplitter
    Left = 866
    Top = 64
    Height = 434
    Align = alRight
    ExplicitLeft = 464
    ExplicitTop = 232
    ExplicitHeight = 100
  end
  object sSplitter4: TsSplitter
    Left = 0
    Top = 498
    Width = 921
    Height = 6
    Cursor = crVSplit
    Align = alBottom
    ExplicitLeft = 127
    ExplicitTop = 191
    ExplicitWidth = 317
  end
  object pnlTTop: TsPanel
    Left = 0
    Top = 0
    Width = 921
    Height = 58
    Align = alTop
    Caption = 'pnlTTop'
    ShowCaption = False
    TabOrder = 0
    object btnVScaleTriGraph: TsSpeedButton
      Left = 377
      Top = 4
      Width = 26
      Height = 25
      Caption = '|'
      OnClick = btnVScaleTriGraphClick
      ImageIndex = 0
    end
    object btnAutoscaleTriGraph: TsSpeedButton
      Left = 409
      Top = 4
      Width = 26
      Height = 25
      Caption = 'X'
      OnClick = btnAutoscaleTriGraphClick
      ImageIndex = 1
    end
    object btnLoad: TsButton
      Left = 745
      Top = 27
      Width = 40
      Height = 25
      Caption = 'Load'
      TabOrder = 0
      Visible = False
      OnClick = btnLoadClick
    end
    object sButton2: TsButton
      Left = 791
      Top = 27
      Width = 59
      Height = 25
      Caption = 'ChangeDim'
      TabOrder = 1
      Visible = False
      OnClick = sButton2Click
    end
    object btnUpdate: TsButton
      Left = 12
      Top = 4
      Width = 49
      Height = 25
      Caption = 'Update'
      TabOrder = 2
      OnClick = btnUpdateClick
    end
    object cboxAxX: TsComboBox
      Left = 39
      Top = 33
      Width = 77
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 15724527
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      BoundLabel.Active = True
      BoundLabel.Caption = 'AxisX'
      Color = 3355443
      ItemIndex = -1
      TabOrder = 3
      OnChange = cboxAxXChange
    end
    object cboxAxY: TsComboBox
      Left = 166
      Top = 33
      Width = 74
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 15724527
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      BoundLabel.Active = True
      BoundLabel.Caption = 'AxisY'
      Color = 3355443
      ItemIndex = -1
      TabOrder = 4
      OnChange = cboxAxYChange
    end
    object btnExportCSV: TsButton
      Left = 83
      Top = 4
      Width = 34
      Height = 25
      Caption = 'CSV'
      TabOrder = 5
      OnClick = btnExportCSVClick
    end
    object btnExportBMP: TsButton
      Left = 123
      Top = 4
      Width = 34
      Height = 25
      Caption = 'BMP'
      TabOrder = 6
      OnClick = btnExportBMPClick
    end
    object cboxDim3: TsComboBox
      Left = 304
      Top = 33
      Width = 119
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 15724527
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      BoundLabel.Active = True
      BoundLabel.Caption = 'Dim3'
      Color = 3355443
      ItemIndex = -1
      TabOrder = 7
      OnChange = cboxDim3Change
    end
    object cboxDim4: TsComboBox
      Left = 464
      Top = 33
      Width = 119
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 15724527
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      BoundLabel.Active = True
      BoundLabel.Caption = 'Dim4'
      Color = 3355443
      ItemIndex = -1
      TabOrder = 8
      OnChange = cboxDim3Change
    end
    object cboxDim5: TsComboBox
      Left = 623
      Top = 33
      Width = 119
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 15724527
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      BoundLabel.Active = True
      BoundLabel.Caption = 'Dim5'
      Color = 3355443
      ItemIndex = -1
      TabOrder = 9
      OnChange = cboxDim3Change
    end
    object btnExportCSV3D: TsButton
      Left = 176
      Top = 4
      Width = 57
      Height = 25
      Caption = 'CSV_WXY'
      TabOrder = 10
      OnClick = btnExportCSV3DClick
    end
    object rbRAW: TsRadioButton
      Left = 467
      Top = 8
      Width = 52
      Height = 16
      Caption = 'RAW'
      Checked = True
      TabOrder = 11
      TabStop = True
      OnClick = rbRAWClick
    end
    object rbDecompose: TsRadioButton
      Left = 530
      Top = 8
      Width = 89
      Height = 16
      Caption = 'Decomposed'
      TabOrder = 12
      OnClick = rbDecomposeClick
    end
    object rbResiduals: TsRadioButton
      Left = 619
      Top = 8
      Width = 73
      Height = 16
      Caption = 'Residuals'
      TabOrder = 13
      OnClick = rbResidualsClick
    end
    object btnExportCSVXYZ: TsButton
      Left = 323
      Top = 4
      Width = 48
      Height = 25
      Caption = 'CSV_XYZ'
      TabOrder = 14
      OnClick = btnExportCSVXYZClick
    end
    object btnExportCSV4D: TsButton
      Left = 241
      Top = 4
      Width = 57
      Height = 25
      Caption = 'CSV_WXYZ'
      TabOrder = 15
      OnClick = btnExportCSV4DClick
    end
  end
  object pnlLLeft: TsPanel
    Left = 0
    Top = 64
    Width = 5
    Height = 434
    Align = alLeft
    Caption = 'pnlLLeft'
    ShowCaption = False
    TabOrder = 1
  end
  object pnlRRight: TsPanel
    Left = 872
    Top = 64
    Width = 49
    Height = 434
    Align = alRight
    Caption = 'pnlRRight'
    ShowCaption = False
    TabOrder = 2
  end
  object pnlSpectra: TsPanel
    Left = 0
    Top = 504
    Width = 921
    Height = 45
    Align = alBottom
    Caption = 'pnlSpectra'
    TabOrder = 3
  end
  object pnlGraphMain: TsPanel
    Left = 10
    Top = 64
    Width = 856
    Height = 434
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 1
    TabOrder = 4
    object splitterGraph2: TsSplitter
      Left = 1
      Top = 302
      Width = 854
      Height = 6
      Cursor = crVSplit
      Align = alBottom
      ExplicitTop = 267
      ExplicitWidth = 115
    end
    object pnlGraphTop: TsPanel
      Left = 1
      Top = 1
      Width = 854
      Height = 301
      Align = alClient
      BevelOuter = bvNone
      Constraints.MinHeight = 50
      Constraints.MinWidth = 50
      TabOrder = 0
      object splitterGraph1: TsSplitter
        Left = 97
        Top = 0
        Height = 301
        ExplicitLeft = 0
        ExplicitTop = 260
        ExplicitHeight = 1302
      end
      object pnlLGraph: TsPanel
        Left = 0
        Top = 0
        Width = 97
        Height = 301
        Align = alLeft
        BevelOuter = bvLowered
        Caption = 'pnlLGraph'
        Constraints.MaxWidth = 250
        Constraints.MinWidth = 45
        TabOrder = 0
        OnResize = pnlLGraphResize
      end
      object pnlIGraph: TPanel
        Left = 103
        Top = 0
        Width = 751
        Height = 301
        Align = alClient
        BevelOuter = bvLowered
        Caption = 'pnlIGraph'
        TabOrder = 1
      end
    end
    object pnlBottom: TsPanel
      Left = 1
      Top = 308
      Width = 854
      Height = 106
      Align = alBottom
      TabOrder = 1
      object pnlGraphBottomLeft: TsPanel
        Left = 1
        Top = 1
        Width = 103
        Height = 104
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object sGroupBox1: TsGroupBox
          Left = -6
          Top = 5
          Width = 111
          Height = 86
          Caption = 'Baseline substraction'
          TabOrder = 0
          object edtBGCorrectionLeft: TsSpinEdit
            Left = 45
            Top = 29
            Width = 61
            Height = 21
            Color = 3355443
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 15724527
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            BoundLabel.Active = True
            BoundLabel.Caption = 'Left'
            BoundLabel.Layout = sclTopCenter
            MaxValue = 0
            MinValue = 0
          end
          object edtBGCorrectionRight: TsSpinEdit
            Left = 45
            Top = 61
            Width = 61
            Height = 21
            Color = 3355443
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 15724527
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            Text = '100'
            BoundLabel.Active = True
            BoundLabel.Caption = 'Right'
            BoundLabel.Layout = sclTopCenter
            MaxValue = 0
            MinValue = 0
            Value = 100
          end
          object cbBGCorrectionUse: TsCheckBox
            Left = 5
            Top = 17
            Width = 46
            Height = 16
            Caption = 'Use'
            TabOrder = 2
            OnClick = cbBGCorrectionUseClick
          end
        end
      end
      object pnlHGraph: TsPanel
        Left = 104
        Top = 1
        Width = 749
        Height = 104
        Align = alClient
        BevelOuter = bvLowered
        Caption = 'pnlHGraph'
        Constraints.MinHeight = 50
        Constraints.MinWidth = 50
        TabOrder = 1
      end
    end
    object StatusBarGraph: TsStatusBar
      Left = 1
      Top = 414
      Width = 854
      Height = 19
      Panels = <
        item
          Width = 100
        end
        item
          Width = 150
        end
        item
          Width = 150
        end
        item
          Width = 200
        end
        item
          Width = 50
        end>
    end
  end
  object memoLog: TsMemo
    Left = 120
    Top = 70
    Width = 401
    Height = 179
    Color = 3355443
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 15724527
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'memoLog')
    ParentFont = False
    TabOrder = 5
    Visible = False
    Text = 'memoLog'
  end
  object SavePictureDialog: TSavePictureDialog
    Left = 48
    Top = 80
  end
  object SaveDialog: TsSaveDialog
    Left = 48
    Top = 128
  end
end
