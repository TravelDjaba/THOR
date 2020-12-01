object devToupcam: TdevToupcam
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'devToupcam'
  ClientHeight = 428
  ClientWidth = 775
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
  object sSplitter1: TsSplitter
    Left = 490
    Top = 21
    Height = 388
    Align = alRight
    ExplicitLeft = 448
    ExplicitTop = 144
    ExplicitHeight = 100
  end
  object StatusBarCCD: TsStatusBar
    Left = 0
    Top = 409
    Width = 775
    Height = 19
    Panels = <
      item
        Width = 70
      end
      item
        Width = 180
      end
      item
        Width = 140
      end
      item
        Width = 100
      end>
  end
  object sToolBar1: TsToolBar
    Left = 0
    Top = 0
    Width = 775
    Height = 21
    AutoSize = True
    ButtonHeight = 21
    Caption = 'sToolBar1'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 1
    object btnFind: TsButton
      Left = 0
      Top = 0
      Width = 41
      Height = 21
      Caption = 'Find'
      TabOrder = 0
      OnClick = btnFindClick
    end
    object cboxCCD: TsComboBox
      Left = 41
      Top = 0
      Width = 136
      Height = 21
      ItemIndex = -1
      TabOrder = 1
      Text = 'No Device'
      OnChange = cboxCCDChange
    end
    object ToolButton1: TToolButton
      Left = 177
      Top = 0
      Width = 9
      Caption = 'ToolButton1'
      Style = tbsSeparator
    end
    object cboxCCDRes: TsComboBox
      Left = 186
      Top = 0
      Width = 90
      Height = 21
      ItemIndex = -1
      TabOrder = 2
      Text = '---'
      OnChange = cboxCCDResChange
    end
    object ToolButton2: TToolButton
      Left = 276
      Top = 0
      Width = 7
      Caption = 'ToolButton2'
      ImageIndex = 0
      Style = tbsSeparator
    end
    object btnStart: TsBitBtn
      Left = 283
      Top = 0
      Width = 75
      Height = 21
      Caption = 'Start'
      TabOrder = 4
      OnClick = btnStartClick
    end
    object btnPause: TsBitBtn
      Tag = 1
      Left = 358
      Top = 0
      Width = 75
      Height = 21
      Caption = 'Pause'
      Default = True
      NumGlyphs = 2
      TabOrder = 3
      OnClick = btnPauseClick
    end
    object btnStop: TsBitBtn
      Left = 433
      Top = 0
      Width = 75
      Height = 21
      Caption = 'Stop'
      TabOrder = 5
      OnClick = btnStopClick
    end
  end
  object pnlControls: TsPanel
    Left = 496
    Top = 21
    Width = 279
    Height = 388
    Align = alRight
    BevelOuter = bvLowered
    TabOrder = 2
    object acCCDSettings: TacScrollPanel
      Left = 1
      Top = 1
      Width = 277
      Height = 386
      SkinData.SkinSection = 'BAR'
      Align = alClient
      Constraints.MinWidth = 2
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 0
      AutoHeight = False
      ExplicitLeft = 0
      ExplicitTop = -4
      object acExposition: TacScrollPanelBand
        Width = 182
        Height = 150
        SkinData.SkinSection = 'BARPANEL'
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Caption = 'Exposure && Gain'
        TabOrder = 0
        ExpandedHeight = 150
        ButtonVisible = True
        ParentButtonVisible = False
        TitleHeight = 18
        DesignSize = (
          259
          150)
        object sLabel3: TsLabel
          Left = 4
          Top = 74
          Width = 70
          Height = 13
          Caption = 'Exposure Time'
        end
        object sLabel2: TsLabel
          Left = 4
          Top = 109
          Width = 21
          Height = 13
          Caption = 'Gain'
        end
        object sLabel1: TsLabel
          Left = 4
          Top = 36
          Width = 80
          Height = 13
          Caption = 'Exposure Target'
        end
        object lblExposureTarget: TsLabel
          Left = 446
          Top = 36
          Width = 6
          Height = 13
          Anchors = [akTop, akRight]
          Caption = '0'
          ExplicitLeft = 215
        end
        object lblExposureTime: TsLabel
          Left = 446
          Top = 74
          Width = 6
          Height = 13
          Anchors = [akTop, akRight]
          Caption = '0'
          ExplicitLeft = 215
        end
        object lblAGain: TsLabel
          Left = 446
          Top = 109
          Width = 6
          Height = 13
          Anchors = [akTop, akRight]
          Caption = '0'
          ExplicitLeft = 215
        end
        object cbCCDAE: TsCheckBox
          Left = 1
          Top = 20
          Width = 99
          Height = 17
          Caption = 'Auto Exposure'
          TabOrder = 0
          OnClick = cbCCDAE1Click
        end
        object trbCCDAE: TsTrackBar
          Left = 1
          Top = 49
          Width = 482
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          DoubleBuffered = False
          Max = 100
          ParentDoubleBuffered = False
          ShowSelRange = False
          TabOrder = 1
          TickStyle = tsNone
          OnChange = trbCCDAEChange
          ExplicitWidth = 251
        end
        object trbCCDAGain: TsTrackBar
          Left = 1
          Top = 123
          Width = 482
          Height = 26
          Anchors = [akLeft, akTop, akRight]
          DoubleBuffered = False
          ParentDoubleBuffered = False
          ShowSelRange = False
          TabOrder = 2
          TickStyle = tsNone
          OnChange = trbCCDAGainChange
          ExplicitWidth = 251
        end
        object trbCCDTime: TsTrackBar
          Left = 1
          Top = 86
          Width = 482
          Height = 26
          Anchors = [akLeft, akTop, akRight]
          DoubleBuffered = False
          ParentDoubleBuffered = False
          ShowSelRange = False
          TabOrder = 3
          TickStyle = tsNone
          OnChange = trbCCDTimeChange
          ExplicitWidth = 251
        end
      end
      object acWhiteBalance: TacScrollPanelBand
        Width = 259
        Height = 120
        SkinData.SkinSection = 'BARPANEL'
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Caption = 'White Balance'
        TabOrder = 1
        ExpandedHeight = 120
        TitleHeight = 18
        DesignSize = (
          259
          120)
        object sLabel6: TsLabel
          Left = 1
          Top = 19
          Width = 90
          Height = 13
          Caption = 'Color Temperature'
        end
        object lblColorTemp: TsLabel
          Left = 227
          Top = 19
          Width = 6
          Height = 13
          Anchors = [akTop, akRight]
          Caption = '0'
        end
        object sLabel8: TsLabel
          Left = 1
          Top = 58
          Width = 18
          Height = 13
          Caption = 'Tint'
        end
        object lblTint: TsLabel
          Left = 227
          Top = 58
          Width = 6
          Height = 13
          Anchors = [akTop, akRight]
          Caption = '0'
        end
        object trbTint: TsTrackBar
          Left = 1
          Top = 73
          Width = 251
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          DoubleBuffered = False
          ParentDoubleBuffered = False
          ShowSelRange = False
          TabOrder = 0
          TickStyle = tsNone
          OnChange = trbTintChange
        end
        object trbColorTemp: TsTrackBar
          Left = 1
          Top = 34
          Width = 251
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          DoubleBuffered = False
          ParentDoubleBuffered = False
          ShowSelRange = False
          TabOrder = 1
          TickStyle = tsNone
          OnChange = trbColorTempChange
        end
        object btnAutoWB: TsButton
          Left = 48
          Top = 95
          Width = 75
          Height = 19
          Caption = 'Auto WB'
          TabOrder = 2
          OnClick = btnAutoWBClick
        end
        object btnDefaultWB: TsButton
          Left = 129
          Top = 95
          Width = 75
          Height = 19
          Caption = 'Defaults'
          TabOrder = 3
          OnClick = btnDefaultWBClick
        end
      end
      object acColorAdjustment: TacScrollPanelBand
        Width = 259
        Height = 235
        SkinData.SkinSection = 'BARPANEL'
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Caption = 'Color Adjustment'
        TabOrder = 2
        ExpandedHeight = 235
        ButtonVisible = True
        ParentButtonVisible = False
        TitleHeight = 18
        DesignSize = (
          259
          235)
        object sLabel7: TsLabel
          Left = 4
          Top = 20
          Width = 19
          Height = 13
          Caption = 'Hue'
        end
        object lblHue: TsLabel
          Left = 227
          Top = 20
          Width = 6
          Height = 13
          Anchors = [akTop, akRight]
          Caption = '0'
        end
        object sLabel10: TsLabel
          Left = 4
          Top = 55
          Width = 50
          Height = 13
          Caption = 'Saturation'
        end
        object lblSaturation: TsLabel
          Left = 227
          Top = 55
          Width = 6
          Height = 13
          Anchors = [akTop, akRight]
          Caption = '0'
        end
        object sLabel12: TsLabel
          Left = 4
          Top = 92
          Width = 50
          Height = 13
          Caption = 'Brightness'
        end
        object lblBrightness: TsLabel
          Left = 227
          Top = 92
          Width = 6
          Height = 13
          Anchors = [akTop, akRight]
          Caption = '0'
        end
        object sLabel14: TsLabel
          Left = 4
          Top = 131
          Width = 42
          Height = 13
          Caption = 'Contrast'
        end
        object lblContrast: TsLabel
          Left = 227
          Top = 131
          Width = 6
          Height = 13
          Anchors = [akTop, akRight]
          Caption = '0'
        end
        object sLabel16: TsLabel
          Left = 4
          Top = 171
          Width = 35
          Height = 13
          Caption = 'Gamma'
        end
        object lblGamma: TsLabel
          Left = 227
          Top = 171
          Width = 6
          Height = 13
          Anchors = [akTop, akRight]
          Caption = '0'
        end
        object trbHue: TsTrackBar
          Left = 3
          Top = 31
          Width = 251
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          DoubleBuffered = False
          ParentDoubleBuffered = False
          ShowSelRange = False
          TabOrder = 0
          TickStyle = tsNone
          OnChange = trbHueChange
        end
        object trbSaturation: TsTrackBar
          Left = 3
          Top = 70
          Width = 251
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          DoubleBuffered = False
          ParentDoubleBuffered = False
          ShowSelRange = False
          TabOrder = 1
          TickStyle = tsNone
          OnChange = trbSaturationChange
        end
        object trbBrightness: TsTrackBar
          Left = 3
          Top = 107
          Width = 251
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          DoubleBuffered = False
          ParentDoubleBuffered = False
          ShowSelRange = False
          TabOrder = 2
          TickStyle = tsNone
          OnChange = trbBrightnessChange
        end
        object trbContrast: TsTrackBar
          Left = 3
          Top = 146
          Width = 251
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          DoubleBuffered = False
          ParentDoubleBuffered = False
          ShowSelRange = False
          TabOrder = 3
          TickStyle = tsNone
          OnChange = trbContrastChange
        end
        object trbGamma: TsTrackBar
          Left = 3
          Top = 186
          Width = 251
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          DoubleBuffered = False
          ParentDoubleBuffered = False
          ShowSelRange = False
          TabOrder = 4
          TickStyle = tsNone
          OnChange = trbGammaChange
        end
        object btnDefaultColor: TsButton
          Left = 81
          Top = 210
          Width = 75
          Height = 19
          Caption = 'Defaults'
          TabOrder = 5
          OnClick = btnDefaultColorClick
        end
      end
      object acFrameRate: TacScrollPanelBand
        Width = 259
        Height = 70
        SkinData.SkinSection = 'BARPANEL'
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Caption = 'Frame Rate'
        TabOrder = 3
        ExpandedHeight = 70
        TitleHeight = 18
        DesignSize = (
          259
          70)
        object sLabel4: TsLabel
          Left = 6
          Top = 19
          Width = 19
          Height = 13
          Caption = 'Low'
        end
        object sLabel5: TsLabel
          Left = 227
          Top = 19
          Width = 21
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Fast'
        end
        object trbFrameRate: TsTrackBar
          Left = 5
          Top = 36
          Width = 252
          Height = 28
          Anchors = [akLeft, akTop, akRight]
          DoubleBuffered = False
          Max = 2
          ParentDoubleBuffered = False
          ShowSelRange = False
          TabOrder = 0
          OnChange = trbFrameRateChange
        end
      end
      object acFlip: TacScrollPanelBand
        Width = 259
        Height = 50
        SkinData.SkinSection = 'BARPANEL'
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Caption = 'Flip'
        TabOrder = 4
        ExpandedHeight = 50
        TitleHeight = 18
        object cbCCDflipV: TsCheckBox
          Left = 11
          Top = 24
          Width = 63
          Height = 17
          Caption = 'Vertical'
          TabOrder = 0
          OnClick = cbCCDflipV1Click
        end
        object cbCCDflipH: TsCheckBox
          Left = 73
          Top = 24
          Width = 76
          Height = 17
          Caption = 'Horizontal'
          TabOrder = 1
          OnClick = cbCCDflipH1Click
        end
      end
    end
  end
  object ievCCD: TImageEnView
    Left = 0
    Top = 21
    Width = 490
    Height = 388
    Background = clBtnFace
    ParentCtl3D = False
    LegacyBitmap = False
    AutoFit = True
    EnableInteractionHints = True
    Align = alClient
    TabOrder = 3
  end
  object TimerCCD: TTimer
    Enabled = False
    Interval = 300
    OnTimer = TimerCCDTimer
    Left = 20
    Top = 24
  end
  object sSkinProvider1: TsSkinProvider
    AddedTitle.Font.Charset = DEFAULT_CHARSET
    AddedTitle.Font.Color = clNone
    AddedTitle.Font.Height = -11
    AddedTitle.Font.Name = 'Tahoma'
    AddedTitle.Font.Style = []
    SkinData.SkinSection = 'FORM'
    TitleButtons = <>
    Left = 200
    Top = 125
  end
end
