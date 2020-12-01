object devToupcamG: TdevToupcamG
  Left = 0
  Top = 0
  ActiveControl = spedtGridnY
  BorderStyle = bsNone
  Caption = 'devToupcamG'
  ClientHeight = 725
  ClientWidth = 1011
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
  object StatusBarCCD: TsStatusBar
    Left = 0
    Top = 706
    Width = 1011
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 150
      end
      item
        Width = 150
      end
      item
        Width = 50
      end
      item
        Width = 50
      end>
  end
  object pnlControls: TsPanel
    Left = 751
    Top = 25
    Width = 260
    Height = 681
    Align = alRight
    TabOrder = 1
    object pcControls: TsPageControl
      Left = 1
      Top = 1
      Width = 258
      Height = 679
      ActivePage = tsHotelki
      Align = alClient
      MultiLine = True
      TabOrder = 0
      TabPosition = tpRight
      ActiveTabEnlarged = False
      object tsCameraMain: TsTabSheet
        Caption = 'CameraMain'
        object sScrollBox1: TsScrollBox
          Left = 0
          Top = 0
          Width = 230
          Height = 671
          HorzScrollBar.Visible = False
          VertScrollBar.Increment = 61
          VertScrollBar.Style = ssFlat
          Align = alClient
          TabOrder = 0
          object cboxCCD: TsComboBox
            Left = 8
            Top = 3
            Width = 113
            Height = 21
            Alignment = taLeftJustify
            VerticalAlignment = taAlignTop
            Color = 3355443
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 15724527
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ItemIndex = -1
            ParentFont = False
            TabOrder = 0
            Text = 'No Device'
          end
          object btnFind: TsButton
            Left = 125
            Top = 3
            Width = 45
            Height = 21
            Caption = 'Find'
            TabOrder = 1
            OnClick = btnFindClick
          end
          object gbResolution: TsGroupBox
            Left = 9
            Top = 25
            Width = 162
            Height = 65
            Caption = 'Resolution'
            DoubleBuffered = True
            ParentDoubleBuffered = False
            TabOrder = 2
            object cboxCCDresPrev: TsComboBox
              Left = 47
              Top = 13
              Width = 104
              Height = 21
              Alignment = taLeftJustify
              BoundLabel.Active = True
              BoundLabel.Caption = 'Preview'
              VerticalAlignment = taAlignTop
              Color = 3355443
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 15724527
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ItemIndex = -1
              ParentFont = False
              TabOrder = 0
              Text = '---'
            end
            object cboxCCDresSnap: TsComboBox
              Left = 47
              Top = 40
              Width = 104
              Height = 21
              Alignment = taLeftJustify
              BoundLabel.Active = True
              BoundLabel.Caption = 'Snap'
              VerticalAlignment = taAlignTop
              Color = 3355443
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 15724527
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ItemIndex = -1
              ParentFont = False
              TabOrder = 1
              Text = '---'
            end
          end
          object sGroupBox1: TsGroupBox
            Left = 8
            Top = 93
            Width = 202
            Height = 65
            TabOrder = 3
            object btnStop: TsButton
              Left = 104
              Top = 14
              Width = 50
              Height = 19
              Caption = 'Stop'
              TabOrder = 0
              OnClick = btnStopClick
            end
            object btnPlay: TsButton
              Left = 3
              Top = 14
              Width = 50
              Height = 19
              Caption = 'Play'
              TabOrder = 1
              OnClick = btnPlayClick
            end
            object btnPause: TsButton
              Left = 53
              Top = 14
              Width = 50
              Height = 19
              Caption = 'Pause'
              Enabled = False
              TabOrder = 2
              OnClick = btnPauseClick
            end
            object btnSnap: TsButton
              Left = 3
              Top = 36
              Width = 62
              Height = 26
              Caption = 'Snap'
              TabOrder = 3
              OnClick = btnSnapClick
            end
          end
          object gbFlip: TsGroupBox
            Left = 3
            Top = 426
            Width = 207
            Height = 39
            Caption = 'Flip'
            TabOrder = 4
            object cbCCDflipV: TsCheckBox
              Left = 27
              Top = 16
              Width = 61
              Height = 17
              Caption = 'Vertical'
              TabOrder = 0
              OnClick = cbCCDflipVClick
              ImgChecked = 0
              ImgUnchecked = 0
            end
            object cbCCDflipH: TsCheckBox
              Left = 89
              Top = 16
              Width = 74
              Height = 17
              Caption = 'Horizontal'
              TabOrder = 1
              OnClick = cbCCDflipHClick
              ImgChecked = 0
              ImgUnchecked = 0
            end
          end
          object gbExposure: TsGroupBox
            Left = 3
            Top = 158
            Width = 207
            Height = 147
            DoubleBuffered = False
            ParentDoubleBuffered = False
            TabOrder = 5
            DesignSize = (
              207
              147)
            object sLabel1: TsLabel
              Left = 4
              Top = 31
              Width = 80
              Height = 13
              Caption = 'Exposure Target'
            end
            object lblExposureTarget: TsLabel
              Left = 171
              Top = 32
              Width = 6
              Height = 13
              Anchors = [akTop, akRight]
              Caption = '0'
            end
            object sLabel3: TsLabel
              Left = 4
              Top = 70
              Width = 70
              Height = 13
              Caption = 'Exposure Time'
            end
            object lblExposureTime: TsLabel
              Left = 171
              Top = 70
              Width = 6
              Height = 13
              Anchors = [akTop, akRight]
              Caption = '0'
            end
            object sLabel2: TsLabel
              Left = 4
              Top = 105
              Width = 21
              Height = 13
              Caption = 'Gain'
            end
            object lblAGain: TsLabel
              Left = 171
              Top = 105
              Width = 6
              Height = 13
              Anchors = [akTop, akRight]
              Caption = '0'
            end
            object cbCCDAE: TsCheckBox
              Left = 57
              Top = 12
              Width = 97
              Height = 17
              Caption = 'Auto Exposure'
              TabOrder = 0
              OnClick = cbCCDAEClick
              ImgChecked = 0
              ImgUnchecked = 0
            end
            object trbCCDAE: TsTrackBar
              Left = 4
              Top = 45
              Width = 200
              Height = 23
              Anchors = [akLeft, akTop, akRight]
              DoubleBuffered = False
              Max = 1000
              ParentDoubleBuffered = False
              ShowSelRange = False
              TabOrder = 1
              TickStyle = tsNone
              OnChange = trbCCDAEChange
              BarOffsetV = 0
              BarOffsetH = 0
            end
            object trbCCDAGain: TsTrackBar
              Left = 4
              Top = 119
              Width = 200
              Height = 26
              Anchors = [akLeft, akTop, akRight]
              DoubleBuffered = False
              Max = 1000
              ParentDoubleBuffered = False
              ShowSelRange = False
              TabOrder = 2
              TickStyle = tsNone
              OnChange = trbCCDAGainChange
              BarOffsetV = 0
              BarOffsetH = 0
            end
            object trbCCDTime: TsTrackBar
              Left = 4
              Top = 82
              Width = 200
              Height = 26
              Anchors = [akLeft, akTop, akRight]
              DoubleBuffered = False
              Max = 1000
              ParentDoubleBuffered = False
              ShowSelRange = False
              TabOrder = 3
              TickStyle = tsNone
              OnChange = trbCCDTimeChange
              BarOffsetV = 0
              BarOffsetH = 0
            end
          end
          object gWhiteBalance: TsGroupBox
            Left = 3
            Top = 309
            Width = 207
            Height = 119
            Caption = 'WhiteBalance'
            DoubleBuffered = False
            ParentDoubleBuffered = False
            TabOrder = 6
            DesignSize = (
              207
              119)
            object lblTint: TsLabel
              Left = 171
              Top = 58
              Width = 6
              Height = 13
              Anchors = [akTop, akRight]
              Caption = '0'
            end
            object lblColorTemp: TsLabel
              Left = 171
              Top = 19
              Width = 6
              Height = 13
              Anchors = [akTop, akRight]
              Caption = '0'
            end
            object sLabel8: TsLabel
              Left = 4
              Top = 58
              Width = 18
              Height = 13
              Caption = 'Tint'
            end
            object sLabel6: TsLabel
              Left = 4
              Top = 19
              Width = 90
              Height = 13
              Caption = 'Color Temperature'
            end
            object btnDefaultWB: TsButton
              Left = 105
              Top = 95
              Width = 75
              Height = 19
              Caption = 'Defaults'
              TabOrder = 0
              OnClick = btnDefaultWBClick
            end
            object btnAutoWB: TsButton
              Left = 24
              Top = 95
              Width = 75
              Height = 19
              Caption = 'Auto WB'
              TabOrder = 1
              OnClick = btnAutoWBClick
            end
            object trbTint: TsTrackBar
              Left = 8
              Top = 73
              Width = 196
              Height = 23
              Anchors = [akLeft, akTop, akRight]
              DoubleBuffered = False
              Max = 1000
              ParentDoubleBuffered = False
              ShowSelRange = False
              TabOrder = 2
              TickStyle = tsNone
              OnChange = trbTintChange
              BarOffsetV = 0
              BarOffsetH = 0
            end
            object trbColorTemp: TsTrackBar
              Left = 8
              Top = 34
              Width = 196
              Height = 23
              Anchors = [akLeft, akTop, akRight]
              DoubleBuffered = False
              Max = 10000
              ParentDoubleBuffered = False
              ShowSelRange = False
              TabOrder = 3
              TickStyle = tsNone
              OnChange = trbColorTempChange
              BarOffsetV = 0
              BarOffsetH = 0
            end
          end
        end
      end
      object tsCamera2nd: TsTabSheet
        Caption = 'Camera2nd'
        object sScrollBox2: TsScrollBox
          Left = 0
          Top = 0
          Width = 230
          Height = 671
          HorzScrollBar.Visible = False
          Align = alClient
          TabOrder = 0
          object gbColorAdjustment: TsGroupBox
            Left = 3
            Top = 3
            Width = 206
            Height = 232
            Caption = 'Color Adjustment'
            TabOrder = 0
            DesignSize = (
              206
              232)
            object lblGamma: TsLabel
              Left = 171
              Top = 166
              Width = 6
              Height = 13
              Anchors = [akTop, akRight]
              Caption = '0'
            end
            object lblContrast: TsLabel
              Left = 171
              Top = 126
              Width = 6
              Height = 13
              Anchors = [akTop, akRight]
              Caption = '0'
            end
            object lblBrightness: TsLabel
              Left = 171
              Top = 87
              Width = 6
              Height = 13
              Anchors = [akTop, akRight]
              Caption = '0'
            end
            object lblSaturation: TsLabel
              Left = 171
              Top = 50
              Width = 6
              Height = 13
              Anchors = [akTop, akRight]
              Caption = '0'
            end
            object lblHue: TsLabel
              Left = 171
              Top = 15
              Width = 6
              Height = 13
              Anchors = [akTop, akRight]
              Caption = '0'
            end
            object sLabel7: TsLabel
              Left = 5
              Top = 15
              Width = 19
              Height = 13
              Caption = 'Hue'
            end
            object sLabel10: TsLabel
              Left = 5
              Top = 50
              Width = 50
              Height = 13
              Caption = 'Saturation'
            end
            object sLabel12: TsLabel
              Left = 5
              Top = 87
              Width = 50
              Height = 13
              Caption = 'Brightness'
            end
            object sLabel14: TsLabel
              Left = 5
              Top = 126
              Width = 42
              Height = 13
              Caption = 'Contrast'
            end
            object sLabel16: TsLabel
              Left = 5
              Top = 166
              Width = 35
              Height = 13
              Caption = 'Gamma'
            end
            object trbHue: TsTrackBar
              Left = 5
              Top = 26
              Width = 196
              Height = 23
              Anchors = [akLeft, akTop, akRight]
              DoubleBuffered = False
              ParentDoubleBuffered = False
              ShowSelRange = False
              TabOrder = 0
              TickStyle = tsNone
              OnChange = trbHueChange
              BarOffsetV = 0
              BarOffsetH = 0
            end
            object trbSaturation: TsTrackBar
              Left = 5
              Top = 65
              Width = 196
              Height = 23
              Anchors = [akLeft, akTop, akRight]
              DoubleBuffered = False
              ParentDoubleBuffered = False
              ShowSelRange = False
              TabOrder = 1
              TickStyle = tsNone
              OnChange = trbSaturationChange
              BarOffsetV = 0
              BarOffsetH = 0
            end
            object trbBrightness: TsTrackBar
              Left = 5
              Top = 102
              Width = 196
              Height = 23
              Anchors = [akLeft, akTop, akRight]
              DoubleBuffered = False
              ParentDoubleBuffered = False
              ShowSelRange = False
              TabOrder = 2
              TickStyle = tsNone
              OnChange = trbBrightnessChange
              BarOffsetV = 0
              BarOffsetH = 0
            end
            object trbContrast: TsTrackBar
              Left = 5
              Top = 141
              Width = 196
              Height = 23
              Anchors = [akLeft, akTop, akRight]
              DoubleBuffered = False
              ParentDoubleBuffered = False
              ShowSelRange = False
              TabOrder = 3
              TickStyle = tsNone
              OnChange = trbContrastChange
              BarOffsetV = 0
              BarOffsetH = 0
            end
            object trbGamma: TsTrackBar
              Left = 5
              Top = 181
              Width = 196
              Height = 23
              Anchors = [akLeft, akTop, akRight]
              DoubleBuffered = False
              ParentDoubleBuffered = False
              ShowSelRange = False
              TabOrder = 4
              TickStyle = tsNone
              OnChange = trbGammaChange
              BarOffsetV = 0
              BarOffsetH = 0
            end
            object btnDefaultColor: TsButton
              Left = 58
              Top = 205
              Width = 75
              Height = 19
              Caption = 'Defaults'
              TabOrder = 5
              OnClick = btnDefaultColorClick
            end
          end
          object gbFrameRate: TsGroupBox
            Left = 2
            Top = 236
            Width = 206
            Height = 75
            Caption = 'FrameRate'
            TabOrder = 1
            DesignSize = (
              206
              75)
            object sLabel4: TsLabel
              Left = 6
              Top = 19
              Width = 19
              Height = 13
              Caption = 'Low'
            end
            object sLabel5: TsLabel
              Left = 172
              Top = 19
              Width = 21
              Height = 13
              Anchors = [akTop, akRight]
              Caption = 'Fast'
            end
            object trbFrameRate: TsTrackBar
              Left = 4
              Top = 32
              Width = 200
              Height = 29
              Anchors = [akLeft, akTop, akRight]
              DoubleBuffered = False
              Max = 2
              ParentDoubleBuffered = False
              ShowSelRange = False
              TabOrder = 0
              OnChange = trbFrameRateChange
              BarOffsetV = 0
              BarOffsetH = 0
            end
          end
          object rgDataFormat: TsRadioGroup
            Left = 3
            Top = 312
            Width = 162
            Height = 33
            Caption = 'DataFormat'
            Enabled = False
            TabOrder = 2
            Columns = 2
            Items.Strings = (
              'RGB'
              'RAW')
            OnChange = rgDataFormatChange
          end
          object rgBitDepth: TsRadioGroup
            Left = 3
            Top = 351
            Width = 162
            Height = 32
            Caption = 'BitDepth'
            Enabled = False
            TabOrder = 3
            Columns = 2
            Items.Strings = (
              '8 bit'
              '16 bit')
            OnChange = rgBitDepthChange
          end
          object gb48bit: TsGroupBox
            Left = 3
            Top = 383
            Width = 162
            Height = 34
            TabOrder = 4
            object cbRGB48: TsCheckBox
              Left = 16
              Top = 12
              Width = 93
              Height = 17
              Caption = 'Enable RGB48'
              Enabled = False
              TabOrder = 0
              OnClick = cbRGB48Click
              ImgChecked = 0
              ImgUnchecked = 0
            end
          end
        end
      end
      object tsHotelki: TsTabSheet
        Caption = 'tsHotelki'
      end
      object tsService: TsTabSheet
        Caption = 'tsService'
        object MemoLog: TMemo
          Left = 0
          Top = 375
          Width = 230
          Height = 296
          Align = alBottom
          Anchors = [akLeft, akTop, akRight, akBottom]
          ScrollBars = ssVertical
          TabOrder = 0
        end
        object btnPullImage: TsButton
          Left = 84
          Top = 344
          Width = 75
          Height = 25
          Caption = 'btnPullImage'
          TabOrder = 1
          OnClick = btnPullImageClick
        end
      end
    end
  end
  object pnlTop: TsPanel
    Left = 0
    Top = 0
    Width = 1011
    Height = 25
    Align = alTop
    TabOrder = 2
    DesignSize = (
      1011
      25)
    object btnMZoomMinus: TsButton
      Left = 11
      Top = 2
      Width = 37
      Height = 21
      Caption = '-'
      TabOrder = 0
      OnClick = btnMZoomMinusClick
    end
    object btnMZoomPlus: TsButton
      Left = 56
      Top = 2
      Width = 37
      Height = 21
      Caption = '+'
      TabOrder = 1
      OnClick = btnMZoomPlusClick
    end
    object btnSettings: TsButton
      Left = 978
      Top = 2
      Width = 28
      Height = 21
      Anchors = [akTop, akRight]
      Caption = '<<'
      TabOrder = 2
      OnClick = btnSettingsClick
    end
    object btnNewMap: TsButton
      Left = 109
      Top = 2
      Width = 54
      Height = 21
      Caption = 'NewMap'
      TabOrder = 3
      OnClick = btnNewMapClick
    end
    object btnSnapToMap: TsButton
      Left = 166
      Top = 2
      Width = 54
      Height = 21
      Caption = 'Snap'
      TabOrder = 4
      OnClick = btnSnapToMapClick
    end
    object sToolBar1: TsToolBar
      Left = 383
      Top = 1
      Width = 225
      Height = 24
      Align = alNone
      Caption = 'sToolBar1'
      DoubleBuffered = True
      Images = sAlphaImageList1
      ParentDoubleBuffered = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      object btnViSelect: TToolButton
        Tag = 1
        Left = 0
        Top = 0
        Caption = 'btnViSelect'
        Down = True
        Grouped = True
        ImageIndex = 0
        Style = tbsCheck
        OnClick = btnViSelectClick
      end
      object btnViLine: TToolButton
        Tag = 2
        Left = 23
        Top = 0
        Caption = 'btnViLine'
        Grouped = True
        ImageIndex = 1
        ParentShowHint = False
        ShowHint = True
        Style = tbsCheck
        OnClick = btnViSelectClick
      end
      object btnViMeasure: TToolButton
        Tag = 3
        Left = 46
        Top = 0
        Caption = 'btnViMeasure'
        Grouped = True
        ImageIndex = 2
        ParentShowHint = False
        ShowHint = True
        Style = tbsCheck
        OnClick = btnViSelectClick
      end
      object btnViRect: TToolButton
        Tag = 4
        Left = 69
        Top = 0
        Hint = 'Rectangle'
        Caption = 'btnViRect'
        Grouped = True
        ImageIndex = 5
        ParentShowHint = False
        ShowHint = True
        Style = tbsCheck
        OnClick = btnViSelectClick
      end
      object btnViGrid: TToolButton
        Tag = 5
        Left = 92
        Top = 0
        Hint = 'Scan Grid'
        Caption = 'btnViGrid'
        Grouped = True
        ImageIndex = 6
        Style = tbsCheck
        OnClick = btnViSelectClick
      end
      object ToolButton4: TToolButton
        Left = 115
        Top = 0
        Width = 54
        Caption = 'ToolButton4'
        ImageIndex = 3
        Style = tbsSeparator
      end
      object btnViDelete: TToolButton
        Left = 169
        Top = 0
        Hint = 'Delete'
        Caption = 'btnViDelete'
        ImageIndex = 3
        ParentShowHint = False
        ShowHint = True
        OnClick = btnViDeleteClick
      end
      object btnViDeleteAll: TToolButton
        Left = 192
        Top = 0
        Hint = 'Delete All'
        Caption = 'btnViDeleteAll'
        ImageIndex = 4
        ParentShowHint = False
        ShowHint = True
        OnClick = btnViDeleteAllClick
      end
    end
    object btnScanVis: TsButton
      Left = 272
      Top = 2
      Width = 44
      Height = 21
      Caption = 'ScanVis'
      TabOrder = 6
      OnClick = btnScanVisClick
    end
    object btnStopScanVis: TsButton
      Left = 322
      Top = 2
      Width = 51
      Height = 21
      Caption = 'StopScan'
      TabOrder = 7
      OnClick = btnStopScanVisClick
    end
    object pnlGridnXnY: TsPanel
      Left = 623
      Top = 1
      Width = 158
      Height = 22
      Caption = 'pnlGridnXnY'
      ShowCaption = False
      TabOrder = 8
      object spedtGridnX: TsSpinEdit
        Left = 26
        Top = 0
        Width = 49
        Height = 21
        Color = 3355443
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 15724527
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        NumbersOnly = True
        ParentFont = False
        TabOrder = 0
        Text = '20'
        OnChange = spedtGridnXChange
        BoundLabel.Active = True
        BoundLabel.Caption = 'nX'
        MaxValue = 99999
        MinValue = 1
        Value = 20
      end
      object spedtGridnY: TsSpinEdit
        Left = 106
        Top = 1
        Width = 49
        Height = 21
        Color = 3355443
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 15724527
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        NumbersOnly = True
        ParentFont = False
        TabOrder = 1
        Text = '20'
        OnChange = spedtGridnXChange
        BoundLabel.Active = True
        BoundLabel.Caption = 'nY'
        MaxValue = 99999
        MinValue = 1
        Value = 20
      end
    end
    object btnSetScanParams: TsButton
      Left = 792
      Top = 2
      Width = 87
      Height = 23
      Caption = 'SetScanParams'
      TabOrder = 9
      OnClick = btnSetScanParamsClick
    end
    object btnSave: TsButton
      Left = 885
      Top = 2
      Width = 35
      Height = 20
      Caption = 'Save'
      TabOrder = 10
      OnClick = btnSaveClick
    end
  end
  object pnlMap: TsPanel
    Left = 0
    Top = 25
    Width = 751
    Height = 681
    Align = alClient
    TabOrder = 3
    DesignSize = (
      751
      681)
    object PaintBox: TPaintBox32
      Left = 1
      Top = 1
      Width = 749
      Height = 647
      Align = alTop
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      OnMouseDown = PaintBoxMouseDown
      OnMouseMove = PaintBoxMouseMove
      OnMouseUp = PaintBoxMouseUp
      OnMouseWheelDown = PaintBoxMouseWheelDown
      OnMouseWheelUp = PaintBoxMouseWheelUp
      OnPaintBuffer = PaintBoxPaintBuffer
      OnResize = PaintBoxResize
    end
    object edtPropPixStep: TsDecimalSpinEdit
      Left = 11
      Top = 654
      Width = 54
      Height = 21
      Anchors = [akLeft, akBottom]
      Color = 3355443
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 15724527
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = '6.70'
      Increment = 1.000000000000000000
      Value = 6.700000000000000000
    end
    object edtPropPixEnc: TsDecimalSpinEdit
      Left = 80
      Top = 654
      Width = 73
      Height = 21
      Anchors = [akLeft, akBottom]
      Color = 3355443
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 15724527
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Text = '0.00'
      Increment = 1.000000000000000000
    end
    object cbUseEncoders: TsCheckBox
      Left = 159
      Top = 658
      Width = 99
      Height = 17
      Caption = 'cbUseEncoders'
      Anchors = [akLeft, akBottom]
      Checked = True
      State = cbChecked
      TabOrder = 3
      OnClick = cbUseEncodersClick
      ImgChecked = 0
      ImgUnchecked = 0
    end
  end
  object TimerCCD: TTimer
    Enabled = False
    Interval = 300
    OnTimer = TimerCCDTimer
    Left = 20
    Top = 56
  end
  object sSkinProvider1: TsSkinProvider
    SkinData.SkinSection = 'FORM'
    TitleButtons = <>
    Left = 584
    Top = 625
  end
  object RepaintTimer: TTimer
    Interval = 200
    OnTimer = RepaintTimerTimer
    Left = 112
    Top = 64
  end
  object sAlphaImageList1: TsAlphaImageList
    DrawingStyle = dsTransparent
    Items = <
      item
        ImageFormat = ifPNG
        ImageName = 'mouse-pointer-M-16'
        ImgData = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000000097048597300000B1300000B1301009A9C180000000774494D4507E2
          021500183BB94F95990000001D69545874436F6D6D656E740000000000437265
          6174656420776974682047494D50642E65070000023E4944415438CB8D92C14B
          545114C67FF7BEF7669EA021450B17ED5ACC4A3010CA411BF461FF40102E0A82
          6AD1225CBA49105ABA1009DA05B96A23D208E162C61CD00495191D1A44928C6A
          4224C66974F439F3E69E360D8C935967772FDFF79D73383F385DAF2CCB2A0183
          FC67A9A6F7A7898989D0F0F0B00D3CF4BCD81CE00006A824120BE6FC34A50EB2
          D96C3E954A6D5A96DE75DDF05DCF8B5DF4BC983E4BFFC7BF655907B95CEEB85C
          2E9BD9D9F85C2814DA534ABDF89BD9F362EEA904AD15BEEF6B11A3FAFB07BCF9
          F9F9351119021E34996DA01DD0BA31518442B55ADD574AE3BAAE158D46079796
          96DE00A3C0B306F36540034637ECD2EE38B6B16DABC5755DB4D655A0DCD3D373
          676363E30330A4947AFEBBF309700C54EA1384005DAD06D570D8555A6B012CA0
          05A87576760E6C6F6F1F5A96756B7171F92910004789C482B1EBEB0341AD1618
          A514400DD8072E018E31463A3A3A22994C7AADABEBDA6032995222F2A46EE4F7
          9D4B2250A954F2800015C0186318191931BDBDBD99BEBE9BBBB55AEDBB88DCA3
          A1330D90A8FA04333333413EFF6DD9F77D56565616B6B6B6DC62B1F85644DE01
          036782E438CEE7743ABD393535F51E380987C3A3A552A9BABE9ED9017E0017FE
          85F66E341A7D09ECB96E78D271ECAF8542211B04C151241239001E9F4B229006
          7EB6B5B5DEF7BCD815DBB677C6C6C65E8B48391E8F7F013E3693A8CE486CAF43
          924CA61E89C8EDD5D5D5FCF8F878747A7ABA350802B741E7EB267308F08143A0
          282293C0D5EEEEEE1BB95C2E1104C1F5269DF905090D02421F43DD1600000000
          49454E44AE426082}
      end
      item
        ImageFormat = ifPNG
        ImageName = 'line-spline_copy-m-16'
        ImgData = {
          89504E470D0A1A0A0000000D4948445200000010000000100803000000282D0F
          530000006C504C5445BBBBB0BBBBB0BBBBB0FFFFFFFFFFFFFFFFFFFFFFFFBBBB
          B0BBBBB0BBBBB0FFFFFFFFFFFFFEFEFEBBBBB0BBBBB0BBBBB0FFFFFFFFFFFFFF
          FFFFFFFFFFF2F2DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFEFEFEF4F4DECBB402CB0000000174524E
          530040E6D866000000097048597300000B1300000B1301009A9C180000000774
          494D4507E2021500203BAED029620000002E4944415418D36360C00798595851
          05B8801005080A09A3F045D14CA02F5F424212555A9A411655408E4B1EAF8F01
          C86001C7FCE43D9C0000000049454E44AE426082}
      end
      item
        ImageFormat = ifPNG
        ImageName = 'distance-w-16'
        ImgData = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000000097048597300000B1300000B1301009A9C180000000774494D4507E2
          02150B0A2537E137C80000001D69545874436F6D6D656E740000000000437265
          6174656420776974682047494D50642E6507000000444944415438CB63601805
          9483FF10C042863EA6FFFFFFFF6722C2F0FF38A4591918181818F12820C90B5C
          A4BAE0FFFFFFACC87EFF8B4D11232323231EBB7F8FA6A0C10200CDB131EE639A
          A05D0000000049454E44AE426082}
      end
      item
        ImageFormat = ifPNG
        ImageName = 'delete-w-16'
        ImgData = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000000097048597300000B1300000B1301009A9C180000000774494D4507E2
          02150B0E2023E706430000001D69545874436F6D6D656E740000000000437265
          6174656420776974682047494D50642E6507000000594944415438CB6360185E
          E03F04E4E391CFFFFFFFFF7F06420AB0198253EEFFFFFF0CC886625388430CA2
          0FDD00740DB86CC630000B8669841984551D0BCC444646460CAF21039CF2147B
          8198D0C6173B9447235513D2D004008277FC1D726617780000000049454E44AE
          426082}
      end
      item
        ImageFormat = ifPNG
        ImageName = 'deleteAll-w-16'
        ImgData = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000000097048597300000B1300000B1301009A9C180000000774494D4507E2
          02150C1A381B6A5FC50000001D69545874436F6D6D656E740000000000437265
          6174656420776974682047494D50642E6507000000714944415438CBDD93DD0A
          C02008467DE33D820CF6DE6717E5D644FB19EC664104EAF95233917F2DCADA3A
          FE0D4046019148EA03A4158D02135BE1BC80071258ABED1608B6812664768335
          CDC06571DD0E1C2DBC5C423DF7A877CB4D9C7EC6A6E6B14807D6A94172620FF8
          ED58EBE7FFE704E6EE4EAFF240323E0000000049454E44AE426082}
      end
      item
        ImageFormat = ifPNG
        ImageName = 'stock_draw-rectangle-unfilled'
        ImgData = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          6100000006624B474400FF00FF00FFA0BDA793000000097048597300000B1300
          000B1301009A9C180000000774494D4507E202160F1A0EC423DBEB0000003049
          44415438CB636018F28091818181E1E7D70FFFC9D1CCCE2DC0C840AE01303D4C
          947A61D480C160000B7ABC8E4000008FE90FABC9BDD2EF0000000049454E44AE
          426082}
      end
      item
        ImageFormat = ifPNG
        ImageName = 'grid-w-16'
        ImgData = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000000097048597300000B1300000B1301009A9C180000000774494D4507E2
          021A092E16223E73400000007C4944415438CBD591CD0A404018450F614329C5
          CEFBBF980D35359BA1297F9B5128F32949EE6EE6D6E9763EF87D02006BF4F288
          7205B046E79EAEB0462FA1C01E3D5D0F20016669BD04C8A4EE5D8982E0FA8E44
          5FD41D0700D3C57F0210ED265540ECBC0CEE0229A0ACD1E5EE22B3831E0140EB
          59D19DDECD06F83E2B19703B633DD2E76F0000000049454E44AE426082}
      end>
    Left = 336
    Top = 81
    Bitmap = {
      494C010100000800080001000100FFFFFFFF0400FFFFFFFFFFFFFFFF424D7600
      0000000000007600000028000000040000000100000001000400000000000400
      0000000000000000000000000000000000000000000000008000008000000080
      8000800000008000800080800000C0C0C000808080000000FF0000FF000000FF
      FF00FF000000FF00FF00FFFF0000FFFFFF0000000000}
  end
  object SavePictureDialog: TSavePictureDialog
    Filter = 'Bitmaps (*.bmp)|*.bmp'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 24
    Top = 120
  end
end
