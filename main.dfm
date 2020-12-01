object formMain: TformMain
  Left = 0
  Top = 0
  ActiveControl = spinedtLaser680Power
  Anchors = [akLeft, akRight, akBottom]
  Caption = 'QSpec_MOD'
  ClientHeight = 775
  ClientWidth = 1643
  Color = clBtnFace
  DefaultMonitor = dmDesktop
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTriGraph: TAdvPanel
    Left = 8
    Top = 110
    Width = 1215
    Height = 575
    BevelOuter = bvNone
    Color = 11711154
    TabOrder = 0
    UseDockManager = True
    OnResize = pnlTriGraphResize
    Version = '2.5.4.1'
    BorderColor = clNone
    CanMove = True
    CanSize = True
    Caption.Color = 4473924
    Caption.ColorTo = clNone
    Caption.Font.Charset = DEFAULT_CHARSET
    Caption.Font.Color = clWindowText
    Caption.Font.Height = -11
    Caption.Font.Name = 'Tahoma'
    Caption.Font.Style = []
    Caption.GradientDirection = gdVertical
    Caption.Indent = 2
    Caption.ShadeLight = 255
    Caption.Text = '<B>Spectra</B>'
    Caption.Visible = True
    CollapsColor = clNone
    CollapsDelay = 0
    DoubleBuffered = True
    ShadowColor = clBlack
    ShadowOffset = 0
    StatusBar.BevelInner = True
    StatusBar.BorderColor = clNone
    StatusBar.BorderStyle = bsSingle
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = 15790320
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    StatusBar.Color = 4473924
    StatusBar.GradientDirection = gdVertical
    StatusBar.Visible = True
    Styler = AdvPanelStyler1
    Text = ''
    DesignSize = (
      1215
      575)
    FullHeight = 200
    object pnlGraphMain: TsPanel
      Left = 0
      Top = 18
      Width = 1215
      Height = 503
      Align = alClient
      BevelOuter = bvNone
      BorderWidth = 1
      TabOrder = 0
      object splitterGraph2: TsSplitter
        Left = 1
        Top = 169
        Width = 1213
        Height = 6
        Cursor = crVSplit
        Align = alTop
        ExplicitTop = 297
        ExplicitWidth = 151
      end
      object pnlGraphTop: TsPanel
        Left = 1
        Top = 1
        Width = 1213
        Height = 168
        Align = alTop
        BevelOuter = bvNone
        Constraints.MinHeight = 50
        Constraints.MinWidth = 50
        TabOrder = 0
        object splitterGraph1: TsSplitter
          Left = 120
          Top = 0
          Height = 168
          ExplicitLeft = 248
          ExplicitTop = 152
          ExplicitHeight = 100
        end
        object pnlLGraph: TsPanel
          Left = 0
          Top = 0
          Width = 120
          Height = 168
          Align = alLeft
          BevelOuter = bvLowered
          Caption = 'pnlLGraph'
          Constraints.MaxWidth = 250
          Constraints.MinWidth = 45
          TabOrder = 0
          OnResize = pnlLGraphResize
        end
        object pnlIGraph: TPanel
          Left = 126
          Top = 0
          Width = 1087
          Height = 168
          Align = alClient
          BevelOuter = bvLowered
          Caption = 'pnlIGraph'
          TabOrder = 1
        end
      end
      object pnlGraphBottomLeft: TsPanel
        Left = 1
        Top = 175
        Width = 88
        Height = 327
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 1
        DesignSize = (
          88
          327)
        object PaintBoxPalette: TPaintBox32
          Left = 66
          Top = 3
          Width = 17
          Height = 321
          Anchors = [akTop, akRight, akBottom]
          TabOrder = 0
        end
      end
      object pnlHGraph: TsPanel
        Left = 89
        Top = 175
        Width = 1125
        Height = 327
        Align = alClient
        BevelOuter = bvLowered
        Caption = 'pnlHGraph'
        Constraints.MinHeight = 50
        Constraints.MinWidth = 50
        TabOrder = 2
      end
    end
    object StatusBarGraph: TsStatusBar
      Left = 0
      Top = 557
      Width = 1199
      Height = 17
      Align = alNone
      Anchors = [akLeft, akRight, akBottom]
      Panels = <
        item
          Width = 200
        end
        item
          Width = 200
        end
        item
          Width = 200
        end>
    end
    object ControlBarTriGraph: TControlBar
      Left = 0
      Top = 521
      Width = 1215
      Height = 36
      Align = alBottom
      TabOrder = 2
      object sPanel3: TsPanel
        Left = 112
        Top = 2
        Width = 150
        Height = 48
        TabOrder = 0
        object rbPixels: TsRadioButton
          Left = 10
          Top = 7
          Width = 42
          Height = 16
          Caption = 'pix'
          Checked = True
          TabOrder = 0
          TabStop = True
          OnClick = rbPixelsClick
        end
        object rbNm: TsRadioButton
          Tag = 1
          Left = 50
          Top = 7
          Width = 42
          Height = 16
          Caption = 'nm'
          TabOrder = 1
          OnClick = rbPixelsClick
        end
        object rbCm: TsRadioButton
          Tag = 2
          Left = 90
          Top = 7
          Width = 51
          Height = 16
          Caption = 'cm-1'
          TabOrder = 2
          OnClick = rbPixelsClick
        end
      end
      object sPanel4: TsPanel
        Left = 753
        Top = 2
        Width = 421
        Height = 48
        TabOrder = 1
        object cbUseQE: TsCheckBox
          Left = 13
          Top = 5
          Width = 58
          Height = 15
          Caption = 'UseQE'
          Checked = True
          State = cbChecked
          TabOrder = 0
          OnClick = cbUseQEClick
        end
        object btnPlotQE: TsButton
          Left = 265
          Top = 2
          Width = 75
          Height = 25
          Caption = 'PlotQE'
          TabOrder = 1
          OnClick = btnPlotQEClick
        end
        object btnPlotImage: TsButton
          Left = 176
          Top = 2
          Width = 75
          Height = 25
          Caption = 'PlotImage'
          TabOrder = 2
          OnClick = btnPlotImageClick
        end
        object cbUseLineCorrection: TsCheckBox
          Left = 71
          Top = 5
          Width = 95
          Height = 15
          Caption = 'LineCorrection'
          TabOrder = 3
          OnClick = cbUseLineCorrectionClick
        end
        object btnAver: TsBitBtn
          Left = 346
          Top = 2
          Width = 75
          Height = 25
          Caption = 'SNR'
          TabOrder = 4
          OnClick = btnAverClick
        end
      end
      object sPanel5: TsPanel
        Left = 275
        Top = 2
        Width = 465
        Height = 48
        TabOrder = 2
        object rbADU: TsRadioButton
          Left = 16
          Top = 7
          Width = 49
          Height = 16
          Caption = 'ADU'
          Checked = True
          TabOrder = 0
          TabStop = True
          OnClick = rbADUClick
        end
        object rbWatt: TsRadioButton
          Tag = 1
          Left = 63
          Top = 7
          Width = 56
          Height = 16
          Caption = 'fWatt'
          TabOrder = 1
          OnClick = rbADUClick
        end
        object rbPhotons: TsRadioButton
          Tag = 2
          Left = 117
          Top = 7
          Width = 67
          Height = 16
          Caption = 'Photons'
          TabOrder = 2
          OnClick = rbADUClick
        end
        object rbWattRelative: TsRadioButton
          Tag = 3
          Left = 175
          Top = 7
          Width = 84
          Height = 16
          Caption = 'fWatt/Watt'
          TabOrder = 3
          OnClick = rbADUClick
        end
        object rbPhotonsRelative: TsRadioButton
          Tag = 4
          Left = 253
          Top = 7
          Width = 110
          Height = 16
          Caption = 'Photons/Photons'
          TabOrder = 4
          OnClick = rbADUClick
        end
        object rbCrossSection: TsRadioButton
          Tag = 5
          Left = 359
          Top = 7
          Width = 34
          Height = 16
          Caption = #963
          TabOrder = 5
          OnClick = rbADUClick
        end
        object rbCrossSectionSERS: TsRadioButton
          Tag = 6
          Left = 399
          Top = 7
          Width = 62
          Height = 16
          Caption = #963' SERS'
          TabOrder = 6
          OnClick = rbADUClick
        end
      end
      object sPanel8: TsPanel
        Left = 11
        Top = 2
        Width = 88
        Height = 48
        TabOrder = 3
        object btnVScaleTriGraph: TsSpeedButton
          Left = 3
          Top = 1
          Width = 36
          Height = 30
          OnClick = btnVScaleTriGraphClick
          Images = ImageList1
          ImageIndex = 0
        end
        object btnAutoscaleTriGraph: TsSpeedButton
          Left = 45
          Top = 1
          Width = 36
          Height = 30
          OnClick = btnAutoscaleTriGraphClick
          Images = ImageList1
          ImageIndex = 1
        end
      end
    end
  end
  object pnlAndorControls: TAdvPanel
    Left = 0
    Top = 0
    Width = 1220
    Height = 110
    BevelOuter = bvNone
    Color = 11711154
    TabOrder = 1
    UseDockManager = True
    Version = '2.5.4.1'
    BorderColor = clNone
    CanMove = True
    CanSize = True
    Caption.Color = 4473924
    Caption.ColorTo = clNone
    Caption.Font.Charset = DEFAULT_CHARSET
    Caption.Font.Color = clWindowText
    Caption.Font.Height = -11
    Caption.Font.Name = 'Tahoma'
    Caption.Font.Style = []
    Caption.GradientDirection = gdVertical
    Caption.Indent = 2
    Caption.ShadeLight = 255
    Caption.Text = '<B>AndorParams</B>'
    Caption.Visible = True
    CollapsColor = clNone
    CollapsDelay = 0
    DoubleBuffered = True
    ShadowColor = clBlack
    ShadowOffset = 0
    StatusBar.BorderColor = clNone
    StatusBar.BorderStyle = bsSingle
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = 15790320
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    StatusBar.Color = 4473924
    StatusBar.GradientDirection = gdVertical
    Styler = AdvPanelStyler1
    Text = ''
    FullHeight = 200
    object sPanel6: TsPanel
      Left = 0
      Top = 18
      Width = 1213
      Height = 92
      Align = alLeft
      TabOrder = 0
      DesignSize = (
        1213
        92)
      object gbAndorTemperature1: TsGroupBox
        Left = 3
        Top = 1
        Width = 120
        Height = 88
        Caption = 'Temperature'
        TabOrder = 0
        object lblGetTemperature: TLabel
          Left = 71
          Top = 18
          Width = 40
          Height = 16
          Caption = '25.0 C'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = 16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edtSetTemperature: TsSpinEdit
          Left = 5
          Top = 17
          Width = 34
          Height = 21
          TabOrder = 0
          Text = '-70'
          OnKeyDown = edtSetTemperatureKeyDown
          ShowSpinButtons = False
          MaxValue = 0
          MinValue = 0
          Value = -70
        end
        object btnSetTemperature: TButton
          Left = 39
          Top = 17
          Width = 20
          Height = 21
          Caption = 'S'
          TabOrder = 1
          OnClick = btnSetTemperatureClick
        end
        object btnCoolerOn: TButton
          Left = 3
          Top = 42
          Width = 56
          Height = 19
          Caption = 'CoolerOn'
          TabOrder = 2
          OnClick = btnCoolerOnClick
        end
        object btnCoolerOff: TButton
          Left = 63
          Top = 42
          Width = 54
          Height = 19
          Caption = 'CoolerOff'
          TabOrder = 3
          OnClick = btnCoolerOffClick
        end
        object btnFanModeOn: TButton
          Left = 3
          Top = 66
          Width = 56
          Height = 19
          Caption = 'FanOn'
          TabOrder = 4
          OnClick = btnFanModeOnClick
        end
        object btnFanModeOff: TButton
          Left = 63
          Top = 66
          Width = 54
          Height = 19
          Caption = 'FanOff'
          TabOrder = 5
          OnClick = btnFanModeOffClick
        end
      end
      object gbSoftBin: TsGroupBox
        Left = 417
        Top = 1
        Width = 116
        Height = 88
        Caption = 'SoftBinning'
        TabOrder = 1
        object cboxSoftBinX: TsComboBox
          Left = 4
          Top = 32
          Width = 50
          Height = 21
          BoundLabel.Active = True
          BoundLabel.Caption = 'BinX'
          BoundLabel.Layout = sclTopCenter
          ItemIndex = -1
          TabOrder = 0
          OnChange = cboxSoftBinYChange
        end
        object cboxSoftBinY: TsComboBox
          Left = 60
          Top = 32
          Width = 50
          Height = 21
          BoundLabel.Active = True
          BoundLabel.Caption = 'BinY'
          BoundLabel.Layout = sclTopCenter
          ItemIndex = -1
          TabOrder = 1
          OnChange = cboxSoftBinYChange
        end
      end
      object pnlAcquisitionMode: TsPanel
        Left = 534
        Top = -1
        Width = 378
        Height = 90
        TabOrder = 2
        object rgAcquisitionMode: TsRadioGroup
          Left = 3
          Top = 1
          Width = 94
          Height = 87
          Caption = 'AcquisitionMode'
          TabOrder = 0
          ItemIndex = 0
          Items.Strings = (
            'Single'
            'Accumulation'
            'Kinetic'
            'RunTillAbort')
          OnChange = rgAcquisitionModeChange
        end
        object edtExposure: TsDecimalSpinEdit
          Left = 99
          Top = 32
          Width = 56
          Height = 21
          TabOrder = 1
          Text = '1.00'
          OnKeyDown = edtExposureKeyDown
          BoundLabel.Active = True
          BoundLabel.Caption = 'Exposure [sec]'
          BoundLabel.Layout = sclTopLeft
          Increment = 0.100000000000000000
          MaxValue = 9999.000000000000000000
          MinValue = 0.010000000000000000
          Value = 1.000000000000000000
        end
        object btnSetExposure: TButton
          Left = 161
          Top = 32
          Width = 24
          Height = 21
          Caption = 'S'
          TabOrder = 2
          OnClick = btnSetExposureClick
        end
        object edtKineticTime: TsDecimalSpinEdit
          Left = 101
          Top = 65
          Width = 56
          Height = 21
          Enabled = False
          ReadOnly = True
          TabOrder = 3
          Text = '1.00'
          BoundLabel.Active = True
          BoundLabel.Caption = 'FullFrameTime'
          BoundLabel.Layout = sclTopLeft
          ShowSpinButtons = False
          Increment = 0.100000000000000000
          MaxValue = 9999.000000000000000000
          MinValue = 0.010000000000000000
          Value = 1.000000000000000000
        end
        object edtAccumulationTime: TsDecimalSpinEdit
          Left = 198
          Top = 32
          Width = 56
          Height = 21
          TabOrder = 4
          Text = '1.00'
          OnKeyDown = edtAccumulationTimeKeyDown
          BoundLabel.Active = True
          BoundLabel.Caption = 'AccumTime'
          BoundLabel.Layout = sclTopCenter
          Increment = 0.100000000000000000
          MaxValue = 9999.000000000000000000
          MinValue = 0.010000000000000000
          Value = 1.000000000000000000
        end
        object btnSetAccumTime: TButton
          Left = 260
          Top = 32
          Width = 24
          Height = 21
          Caption = 'S'
          TabOrder = 5
          OnClick = btnSetAccumTimeClick
        end
        object edtAccumulationNumber: TsSpinEdit
          Left = 198
          Top = 65
          Width = 56
          Height = 21
          NumbersOnly = True
          TabOrder = 6
          Text = '2'
          OnChange = edtAccumulationNumberChange
          BoundLabel.Active = True
          BoundLabel.Caption = 'AccumNumber'
          BoundLabel.Layout = sclTopLeft
          MaxValue = 999
          MinValue = 1
          Value = 2
        end
        object edtKineticNumber: TsSpinEdit
          Left = 302
          Top = 65
          Width = 44
          Height = 21
          NumbersOnly = True
          TabOrder = 7
          Text = '2'
          OnChange = edtKineticNumberChange
          BoundLabel.Active = True
          BoundLabel.Caption = 'KineticNumber'
          BoundLabel.Layout = sclTopLeft
          MaxValue = 999
          MinValue = 1
          Value = 2
        end
        object pbProgressFrame: TsProgressBar
          Left = 222
          Top = 3
          Width = 150
          Height = 13
          TabOrder = 8
        end
      end
      object pnlReadMode: TsPanel
        Left = 125
        Top = -1
        Width = 294
        Height = 90
        TabOrder = 3
        object cboxBinX: TsComboBox
          Left = 184
          Top = 17
          Width = 50
          Height = 21
          BoundLabel.Active = True
          BoundLabel.Caption = 'BinX'
          BoundLabel.Layout = sclTopCenter
          ItemIndex = -1
          TabOrder = 0
          OnChange = cboxBinXChange
        end
        object cboxBinY: TsComboBox
          Left = 240
          Top = 17
          Width = 50
          Height = 21
          BoundLabel.Active = True
          BoundLabel.Caption = 'BinY'
          BoundLabel.Layout = sclTopCenter
          ItemIndex = -1
          TabOrder = 1
          OnChange = cboxBinXChange
        end
        object edtSingleTrackCentre: TsSpinEdit
          Left = 184
          Top = 60
          Width = 50
          Height = 21
          TabOrder = 2
          Text = '100'
          OnChange = edtSingleTrackCentreChange
          BoundLabel.Active = True
          BoundLabel.Caption = 'CentralRow'
          BoundLabel.Layout = sclTopCenter
          MaxValue = 250
          MinValue = 1
          Value = 100
        end
        object edtSingleTrackHigh: TsSpinEdit
          Left = 240
          Top = 60
          Width = 50
          Height = 21
          TabOrder = 3
          Text = '3'
          OnChange = edtSingleTrackHighChange
          BoundLabel.Active = True
          BoundLabel.Caption = 'High'
          BoundLabel.Layout = sclTopCenter
          MaxValue = 150
          MinValue = 1
          Value = 3
        end
        object rgShutterMode: TsRadioGroup
          Left = 3
          Top = 1
          Width = 78
          Height = 84
          Caption = 'ShutterMode'
          TabOrder = 4
          ItemIndex = 0
          Items.Strings = (
            'Auto'
            'Open'
            'Close')
          OnChange = rgShutterModeChange
        end
        object rgReadMode: TsRadioGroup
          Left = 85
          Top = 1
          Width = 93
          Height = 84
          Caption = 'ReadMode'
          TabOrder = 5
          ItemIndex = 0
          Items.Strings = (
            'Image'
            'FVB'
            'SingleTrack'
            'RandTrack')
          OnChange = rgReadModeChange
        end
      end
      object pnlStartStopAcq: TsPanel
        Left = 913
        Top = -1
        Width = 89
        Height = 90
        TabOrder = 4
        object btnStartAcq: TsButton
          Left = 3
          Top = 34
          Width = 75
          Height = 25
          Caption = 'StartAcq'
          TabOrder = 0
          OnClick = btnStartAcqClick
        end
        object btnAbortAcq: TsButton
          Left = 3
          Top = 61
          Width = 75
          Height = 25
          Caption = 'AbortAcq'
          TabOrder = 1
          OnClick = btnAbortAcqClick
        end
        object btnBackground: TsButton
          Left = 3
          Top = 2
          Width = 75
          Height = 25
          Caption = 'Background'
          TabOrder = 2
          OnClick = btnBackgroundClick
        end
      end
      object gbADC: TsGroupBox
        Left = 1008
        Top = -2
        Width = 202
        Height = 91
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = 'ADC'
        TabOrder = 5
        object cboxADChannel: TsComboBox
          Left = 69
          Top = 10
          Width = 33
          Height = 21
          BoundLabel.Active = True
          BoundLabel.Caption = 'ADChannel'
          ItemIndex = -1
          TabOrder = 0
          Text = '0'
          OnChange = cboxADChannelChange
        end
        object edtADBitDepth: TsEdit
          Left = 157
          Top = 10
          Width = 25
          Height = 21
          ReadOnly = True
          TabOrder = 1
          Text = '16'
          BoundLabel.Active = True
          BoundLabel.Caption = 'BitDepth'
        end
        object cboxOutputAmplifier: TsComboBox
          Left = 70
          Top = 33
          Width = 33
          Height = 21
          BoundLabel.Active = True
          BoundLabel.Caption = 'OutAmplifier'
          ItemIndex = -1
          TabOrder = 2
          Text = '0'
          OnChange = cboxOutputAmplifierChange
        end
        object cboxHSpeed: TsComboBox
          Left = 47
          Top = 60
          Width = 47
          Height = 21
          BoundLabel.Active = True
          BoundLabel.Caption = 'HSpeed'
          ItemIndex = -1
          TabOrder = 3
          Text = '0'
          OnChange = cboxHSpeedChange
        end
        object cboxPreAmpGain: TsComboBox
          Left = 157
          Top = 60
          Width = 43
          Height = 21
          BoundLabel.Active = True
          BoundLabel.Caption = 'PreAmpGain'
          ItemIndex = -1
          TabOrder = 4
          Text = '0'
          OnChange = cboxPreAmpGainChange
        end
      end
    end
  end
  object pnlLaser: TAdvPanel
    Left = 1229
    Top = 169
    Width = 353
    Height = 225
    BevelOuter = bvNone
    Color = 11711154
    Constraints.MaxHeight = 225
    Constraints.MaxWidth = 353
    Constraints.MinHeight = 107
    Constraints.MinWidth = 353
    TabOrder = 2
    UseDockManager = True
    Version = '2.5.4.1'
    BorderColor = clNone
    CanMove = True
    CanSize = True
    Caption.Color = 4473924
    Caption.ColorTo = clNone
    Caption.Font.Charset = DEFAULT_CHARSET
    Caption.Font.Color = clWindowText
    Caption.Font.Height = -11
    Caption.Font.Name = 'Tahoma'
    Caption.Font.Style = []
    Caption.GradientDirection = gdVertical
    Caption.Indent = 2
    Caption.ShadeLight = 255
    Caption.Text = '<B>Laser 785</B>'
    Caption.Visible = True
    CollapsColor = clNone
    CollapsDelay = 0
    DoubleBuffered = True
    ShadowColor = clBlack
    ShadowOffset = 0
    StatusBar.BorderColor = clNone
    StatusBar.BorderStyle = bsSingle
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = 15790320
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    StatusBar.Color = 4473924
    StatusBar.GradientDirection = gdVertical
    StatusBar.Height = 20
    Styler = AdvPanelStyler1
    Text = ''
    DesignSize = (
      353
      225)
    FullHeight = 200
    object sPanel1: TsPanel
      Left = 1
      Top = 16
      Width = 351
      Height = 196
      TabOrder = 0
      object gbLaserAlarm: TsGroupBox
        Left = 12
        Top = 78
        Width = 94
        Height = 86
        Caption = 'Alarm'
        TabOrder = 0
        object shpLaserAlarmPWR: TShape
          Left = 8
          Top = 16
          Width = 10
          Height = 10
          Shape = stRoundSquare
        end
        object lblLaserAlarmPWR: TsLabel
          Left = 32
          Top = 13
          Width = 53
          Height = 13
          Caption = 'Power ACT'
        end
        object lblLaserAlarmLASER_TEC: TsLabel
          Left = 32
          Top = 26
          Width = 46
          Height = 13
          Caption = 'TEC temp'
        end
        object shpLaserAlarmLASER_TEC: TShape
          Left = 8
          Top = 29
          Width = 10
          Height = 10
          Shape = stRoundSquare
        end
        object lblLaserAlarmLASER: TsLabel
          Left = 32
          Top = 40
          Width = 43
          Height = 13
          Caption = 'Laser off'
        end
        object shpLaserAlarmLASER: TShape
          Left = 8
          Top = 43
          Width = 10
          Height = 10
          Shape = stRoundSquare
        end
        object lblLaserAlarmTEMP: TsLabel
          Left = 32
          Top = 54
          Width = 51
          Height = 13
          Caption = 'Case temp'
        end
        object shpLaserAlarmTEMP: TShape
          Left = 8
          Top = 57
          Width = 10
          Height = 10
          Shape = stRoundSquare
        end
        object lblLaserAlarmBIAS: TsLabel
          Left = 32
          Top = 69
          Width = 19
          Height = 13
          Caption = 'Bias'
        end
        object shpLaserAlarmBIAS: TShape
          Left = 8
          Top = 72
          Width = 10
          Height = 10
          Shape = stRoundSquare
        end
      end
      object gbLaserPower: TsGroupBox
        Left = 248
        Top = -1
        Width = 101
        Height = 76
        Caption = 'Power'
        TabOrder = 1
        object shpLaserPowOn: TShape
          Left = 8
          Top = 20
          Width = 10
          Height = 10
          Shape = stRoundSquare
        end
        object shpLaserPowOff: TShape
          Left = 8
          Top = 40
          Width = 10
          Height = 10
          Shape = stRoundSquare
        end
        object shpLaserPowAutoShD: TShape
          Left = 8
          Top = 60
          Width = 10
          Height = 10
          Shape = stRoundSquare
        end
        object sLabel1: TsLabel
          Left = 24
          Top = 58
          Width = 72
          Height = 13
          Caption = 'AutoShutDown'
        end
        object btnLaserPowOn: TsButton
          Left = 24
          Top = 16
          Width = 73
          Height = 18
          Caption = 'On'
          TabOrder = 0
          OnClick = btnLaserPowOnClick
        end
        object btnLaserPowOff: TsButton
          Left = 24
          Top = 36
          Width = 73
          Height = 18
          Caption = 'Off'
          TabOrder = 1
          OnClick = btnLaserPowOffClick
        end
      end
      object gbLaserOpMode: TsGroupBox
        Left = 120
        Top = 78
        Width = 101
        Height = 86
        Caption = 'OperatingMode'
        TabOrder = 2
        object shpLaserOpCPow: TShape
          Left = 8
          Top = 19
          Width = 10
          Height = 10
          Shape = stRoundSquare
        end
        object shpLaserOpCCur: TShape
          Left = 8
          Top = 39
          Width = 10
          Height = 10
          Shape = stRoundSquare
        end
        object shpLaserOpModul: TShape
          Left = 8
          Top = 59
          Width = 10
          Height = 10
          Shape = stRoundSquare
        end
        object btnLaserOpModeCPower: TsButton
          Left = 24
          Top = 16
          Width = 73
          Height = 19
          Caption = 'ConstPower'
          TabOrder = 0
          OnClick = btnLaserOpModeCPowerClick
        end
        object btnLaserOpModeCCurr: TsButton
          Left = 24
          Top = 36
          Width = 73
          Height = 19
          Caption = 'ConstCurrent'
          TabOrder = 1
          OnClick = btnLaserOpModeCCurrClick
        end
        object btnLaserOpModeModulation: TsButton
          Left = 24
          Top = 56
          Width = 73
          Height = 19
          Caption = 'Modulation'
          TabOrder = 2
          OnClick = btnLaserOpModeModulationClick
        end
      end
      object gbLaserStatus: TsGroupBox
        Left = 3
        Top = -1
        Width = 243
        Height = 81
        TabOrder = 3
        object vleLaserStatus: TValueListEditor
          Left = 8
          Top = 10
          Width = 142
          Height = 68
          ParentCustomHint = False
          BiDiMode = bdLeftToRight
          Ctl3D = True
          DefaultRowHeight = 15
          DisplayOptions = [doAutoColResize, doKeyColFixed]
          DoubleBuffered = True
          Enabled = False
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goThumbTracking, goFixedColClick, goFixedRowClick]
          ParentBiDiMode = False
          ParentColor = True
          ParentCtl3D = False
          ParentDoubleBuffered = False
          ScrollBars = ssNone
          Strings.Strings = (
            'Out Power ='
            'LD Bias='
            'LD Temp='
            'Case Temp=')
          TabOrder = 0
          TitleCaptions.Strings = (
            'Status')
          ColWidths = (
            63
            73)
          RowHeights = (
            15
            15
            15
            15)
        end
        object spinedtLaserPower: TsSpinEdit
          Left = 154
          Top = 21
          Width = 53
          Height = 21
          TabOrder = 1
          OnKeyDown = spinedtLaserPowerKeyDown
          BoundLabel.Active = True
          BoundLabel.Caption = 'Power [mW]'
          BoundLabel.Layout = sclTopLeft
          MaxValue = 500
          MinValue = 0
        end
        object spinedtLaserBias: TsSpinEdit
          Left = 153
          Top = 56
          Width = 54
          Height = 21
          TabOrder = 2
          OnKeyDown = spinedtLaserBiasKeyDown
          BoundLabel.Active = True
          BoundLabel.Caption = 'Bias [mA]'
          BoundLabel.Layout = sclTopLeft
          MaxValue = 0
          MinValue = 0
        end
        object btnLaserSetPow: TsButton
          Left = 212
          Top = 21
          Width = 26
          Height = 20
          Caption = 'Set'
          TabOrder = 3
          OnClick = btnLaserSetPowClick
        end
        object btnLaserSetBias: TsButton
          Left = 212
          Top = 56
          Width = 26
          Height = 20
          Caption = 'Set'
          TabOrder = 4
          OnClick = btnLaserSetBiasClick
        end
      end
      object btnFindLaser: TsButton
        Left = 309
        Top = 84
        Width = 30
        Height = 25
        Caption = 'Find'
        TabOrder = 6
        OnClick = btnFindLaserClick
      end
      object btnSendCmd: TsButton
        Left = 272
        Top = 168
        Width = 58
        Height = 25
        Caption = 'SendCmd'
        TabOrder = 5
        OnClick = btnSendCmdClick
      end
      object sEdit1: TsEdit
        Left = 11
        Top = 170
        Width = 255
        Height = 21
        TabOrder = 4
        OnKeyDown = sEdit1KeyDown
      end
    end
    object StatusBarLaser: TsStatusBar
      Left = 0
      Top = 208
      Width = 339
      Height = 17
      Align = alNone
      Anchors = [akLeft, akBottom]
      Panels = <
        item
          Width = 150
        end
        item
          Width = 50
        end>
    end
  end
  object pnlController: TAdvPanel
    Left = 501
    Top = 346
    Width = 667
    Height = 241
    BevelOuter = bvNone
    Color = 11711154
    TabOrder = 3
    UseDockManager = True
    Version = '2.5.4.1'
    BorderColor = clNone
    CanMove = True
    CanSize = True
    Caption.Color = 4473924
    Caption.ColorTo = clNone
    Caption.Font.Charset = DEFAULT_CHARSET
    Caption.Font.Color = clWindowText
    Caption.Font.Height = -11
    Caption.Font.Name = 'Tahoma'
    Caption.Font.Style = []
    Caption.GradientDirection = gdVertical
    Caption.Indent = 2
    Caption.ShadeLight = 255
    Caption.Visible = True
    CollapsColor = clNone
    CollapsDelay = 0
    DoubleBuffered = True
    ShadowColor = clBlack
    ShadowOffset = 0
    StatusBar.BorderColor = clNone
    StatusBar.BorderStyle = bsSingle
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = 15790320
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    StatusBar.Color = 4473924
    StatusBar.GradientDirection = gdVertical
    Styler = AdvPanelStyler1
    Text = ''
    FullHeight = 200
    object sPanel2: TsPanel
      Left = 0
      Top = 20
      Width = 669
      Height = 203
      TabOrder = 0
      object btnStepperSettings: TsSpeedButton
        Left = 69
        Top = 176
        Width = 97
        Height = 23
        Caption = 'StepperSettings'
        OnClick = btnStepperSettingsClick
      end
      object btnSlitCal: TsSpeedButton
        Left = 445
        Top = 7
        Width = 17
        Height = 17
        OnClick = btnSlitCalClick
      end
      object btnFWcal: TsSpeedButton
        Left = 496
        Top = 7
        Width = 17
        Height = 17
        OnClick = btnFWcalClick
      end
      object btnXYZcal: TsSpeedButton
        Left = 445
        Top = 30
        Width = 68
        Height = 17
        Caption = 'XYZ cal'
        OnClick = btnXYZcalClick
      end
      object sGroupBox1: TsGroupBox
        Left = 8
        Top = 0
        Width = 249
        Height = 73
        Caption = 'Leds'
        TabOrder = 0
        object sLabel2: TsLabel
          Left = 8
          Top = 19
          Width = 23
          Height = 13
          Caption = 'Led1'
        end
        object sLabel3: TsLabel
          Left = 8
          Top = 44
          Width = 23
          Height = 13
          Caption = 'Led2'
        end
        object trbLed1: TsTrackBar
          Left = 33
          Top = 11
          Width = 212
          Height = 27
          DoubleBuffered = False
          Max = 100
          ParentDoubleBuffered = False
          Frequency = 25
          ShowSelRange = False
          TabOrder = 0
        end
        object trbLed2: TsTrackBar
          Left = 34
          Top = 39
          Width = 211
          Height = 29
          DoubleBuffered = False
          Max = 100
          ParentDoubleBuffered = False
          Frequency = 25
          ShowSelRange = False
          TabOrder = 1
        end
      end
      object btnFindController: TsButton
        Left = 14
        Top = 176
        Width = 31
        Height = 25
        Caption = 'Find'
        TabOrder = 1
        OnClick = btnFindControllerClick
      end
      object gbFlip1: TsGroupBox
        Left = 6
        Top = 74
        Width = 75
        Height = 63
        Caption = 'Flip1'
        TabOrder = 2
        object shpFlip1Up: TShape
          Left = 8
          Top = 20
          Width = 10
          Height = 10
          Shape = stRoundSquare
        end
        object shpFlip1Dwn: TShape
          Left = 8
          Top = 40
          Width = 10
          Height = 10
          Shape = stRoundSquare
        end
        object btnFlip1Up: TsButton
          Left = 24
          Top = 16
          Width = 41
          Height = 18
          Caption = 'Up'
          TabOrder = 0
          OnClick = btnFlip1UpClick
        end
        object btnFlip1Down: TsButton
          Left = 24
          Top = 36
          Width = 41
          Height = 18
          Caption = 'Down'
          TabOrder = 1
          OnClick = btnFlip1DownClick
        end
      end
      object gbFlip2: TsGroupBox
        Left = 87
        Top = 74
        Width = 73
        Height = 63
        Caption = 'Flip2'
        TabOrder = 3
        object shpFlip2Up: TShape
          Left = 8
          Top = 20
          Width = 10
          Height = 10
          Shape = stRoundSquare
        end
        object shpFlip2Dwn: TShape
          Left = 8
          Top = 40
          Width = 10
          Height = 10
          Shape = stRoundSquare
        end
        object btnFlip2Up: TsButton
          Left = 24
          Top = 16
          Width = 41
          Height = 18
          Caption = 'Up'
          TabOrder = 0
          OnClick = btnFlip2UpClick
        end
        object btnFlip2Down: TsButton
          Left = 24
          Top = 36
          Width = 41
          Height = 18
          Caption = 'Down'
          TabOrder = 1
          OnClick = btnFlip2DownClick
        end
      end
      object gbXYZ: TsGroupBox
        Left = 260
        Top = 56
        Width = 267
        Height = 144
        Caption = 'XYZ'
        TabOrder = 4
        object sSpeedButton1: TsSpeedButton
          Left = 54
          Top = 25
          Width = 45
          Height = 40
          Caption = 'Y+'
          OnClick = sSpeedButton1Click
        end
        object sSpeedButton2: TsSpeedButton
          Left = 3
          Top = 62
          Width = 45
          Height = 40
          Caption = 'X-'
          OnClick = sSpeedButton2Click
        end
        object sSpeedButton3: TsSpeedButton
          Left = 54
          Top = 98
          Width = 45
          Height = 40
          Caption = 'Y-'
          OnClick = sSpeedButton3Click
        end
        object sSpeedButton4: TsSpeedButton
          Left = 105
          Top = 62
          Width = 45
          Height = 40
          Caption = 'X+'
          OnClick = sSpeedButton4Click
        end
        object sSpeedButton5: TsSpeedButton
          Left = 160
          Top = 22
          Width = 45
          Height = 41
          Caption = 'Z+'
          OnClick = sSpeedButton5Click
        end
        object sSpeedButton6: TsSpeedButton
          Left = 160
          Top = 97
          Width = 45
          Height = 41
          Caption = 'Z-'
          OnClick = sSpeedButton6Click
        end
        object btnBFup: TsSpeedButton
          Left = 219
          Top = 22
          Width = 45
          Height = 41
          Caption = 'BF+'
          OnClick = btnBFupClick
        end
        object btnBFdwn: TsSpeedButton
          Left = 219
          Top = 95
          Width = 45
          Height = 41
          Caption = 'BF-'
          OnClick = btnBFdwnClick
        end
        object cboxXYstep: TsComboBox
          Left = 52
          Top = 71
          Width = 48
          Height = 21
          ItemIndex = 0
          TabOrder = 0
          Text = '1'
          Items.Strings = (
            '1'
            '2'
            '5'
            '10'
            '20'
            '50'
            '100'
            '200'
            '500'
            '1000'
            '2000'
            '5000')
        end
        object cboxZstep: TsComboBox
          Left = 156
          Top = 70
          Width = 48
          Height = 21
          ItemIndex = 0
          TabOrder = 1
          Text = '1'
          Items.Strings = (
            '1'
            '2'
            '5'
            '10'
            '20'
            '50'
            '100'
            '200'
            '500'
            '1000'
            '2000'
            '5000')
        end
        object pnlES: TsPanel
          Left = 2
          Top = 16
          Width = 45
          Height = 18
          SkinData.CustomColor = True
          SkinData.ColorTone = cl3DDkShadow
          BevelInner = bvLowered
          Caption = 'EndStop'
          Color = cl3DDkShadow
          ParentBackground = False
          TabOrder = 2
        end
        object cboxBFstep: TsComboBox
          Left = 215
          Top = 70
          Width = 48
          Height = 21
          ItemIndex = 0
          TabOrder = 3
          Text = '1'
          Items.Strings = (
            '1'
            '2'
            '5'
            '10'
            '20'
            '50'
            '100'
            '200'
            '500'
            '1000'
            '2000'
            '5000')
        end
      end
      object gbSlit: TsGroupBox
        Left = 260
        Top = 0
        Width = 147
        Height = 55
        Caption = 'Slit'
        Enabled = False
        TabOrder = 5
        object shpSlitCal: TShape
          Left = 8
          Top = 13
          Width = 10
          Height = 10
          Brush.Color = cl3DDkShadow
          Shape = stRoundSquare
        end
        object sLabel6: TsLabel
          Left = 24
          Top = 10
          Width = 51
          Height = 13
          Caption = 'Calibration'
        end
        object shpSlitMov: TShape
          Left = 82
          Top = 13
          Width = 10
          Height = 10
          Brush.Color = cl3DDkShadow
          Shape = stRoundSquare
        end
        object sLabel7: TsLabel
          Left = 98
          Top = 10
          Width = 34
          Height = 13
          Caption = 'Moving'
        end
        object edtSlit: TsSpinEdit
          Left = 6
          Top = 29
          Width = 58
          Height = 21
          NumbersOnly = True
          TabOrder = 0
          OnKeyDown = edtSlitKeyDown
          MaxValue = 2000
          MinValue = 0
        end
        object btnSlitSet: TsButton
          Left = 70
          Top = 28
          Width = 51
          Height = 22
          Caption = 'Set'
          TabOrder = 1
          OnClick = btnSlitSetClick
        end
      end
      object gbFilters: TsGroupBox
        Left = 529
        Top = 0
        Width = 137
        Height = 201
        Caption = 'Filters'
        TabOrder = 6
        object shpFWCal: TShape
          Left = 5
          Top = 18
          Width = 10
          Height = 10
          Brush.Color = cl3DDkShadow
          Shape = stRoundSquare
        end
        object shpFWMov: TShape
          Left = 79
          Top = 18
          Width = 10
          Height = 10
          Brush.Color = cl3DDkShadow
          Shape = stRoundSquare
        end
        object sLabel4: TsLabel
          Left = 21
          Top = 15
          Width = 51
          Height = 13
          Caption = 'Calibration'
        end
        object sLabel5: TsLabel
          Left = 95
          Top = 15
          Width = 34
          Height = 13
          Caption = 'Moving'
        end
        object rgFilterWheel: TsRadioGroup
          Left = 3
          Top = 30
          Width = 129
          Height = 169
          TabOrder = 0
          Items.Strings = (
            'Filter 1'
            'Filter 2'
            'Filter 3'
            'Filter 4'
            'Filter 5'
            'Filter 6'
            'Filter 7'
            'Filter 8')
          OnChange = rgFilterWheelChange
        end
      end
      object gbGeometry: TsGroupBox
        Left = 166
        Top = 74
        Width = 91
        Height = 63
        Caption = 'Geometry'
        TabOrder = 7
        object shpPoint: TShape
          Left = 8
          Top = 20
          Width = 10
          Height = 10
          Shape = stRoundSquare
        end
        object shpLine: TShape
          Left = 8
          Top = 42
          Width = 10
          Height = 11
          Shape = stRoundSquare
        end
        object btnPoint: TsButton
          Left = 24
          Top = 16
          Width = 59
          Height = 20
          Caption = 'Point'
          TabOrder = 0
          OnClick = btnPointClick
        end
        object btnLine: TsButton
          Left = 24
          Top = 38
          Width = 59
          Height = 21
          Caption = 'Line'
          TabOrder = 1
          OnClick = btnLineClick
        end
      end
    end
    object StatusBarController: TsStatusBar
      Left = 0
      Top = 222
      Width = 667
      Height = 19
      Panels = <
        item
          Width = 200
        end
        item
          Width = 200
        end
        item
          Width = 50
        end>
    end
  end
  object pnlCCD: TAdvPanel
    Left = 1
    Top = 689
    Width = 604
    Height = 334
    BevelOuter = bvNone
    Color = 11711154
    TabOrder = 4
    UseDockManager = True
    Version = '2.5.4.1'
    BorderColor = clNone
    CanMove = True
    CanSize = True
    Caption.Color = 4473924
    Caption.ColorTo = clNone
    Caption.Font.Charset = DEFAULT_CHARSET
    Caption.Font.Color = clWindowText
    Caption.Font.Height = -11
    Caption.Font.Name = 'Tahoma'
    Caption.Font.Style = []
    Caption.GradientDirection = gdVertical
    Caption.Indent = 2
    Caption.ShadeLight = 255
    Caption.Text = '<B>CCD</B>'
    Caption.Visible = True
    CollapsColor = clNone
    CollapsDelay = 0
    DoubleBuffered = True
    ShadowColor = clBlack
    ShadowOffset = 0
    StatusBar.BorderColor = clNone
    StatusBar.BorderStyle = bsSingle
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = 15790320
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    StatusBar.Color = 4473924
    StatusBar.GradientDirection = gdVertical
    Styler = AdvPanelStyler1
    Text = ''
    DesignSize = (
      604
      334)
    FullHeight = 200
    object pnlCCDparent: TsPanel
      Left = 0
      Top = 19
      Width = 604
      Height = 303
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = 'pnlCCDparent'
      TabOrder = 0
    end
  end
  object pnlPowerOnSample: TAdvPanel
    Left = 1454
    Top = -4
    Width = 188
    Height = 147
    BevelOuter = bvNone
    Color = 11711154
    TabOrder = 5
    UseDockManager = True
    Version = '2.5.4.1'
    BorderColor = clNone
    CanMove = True
    CanSize = True
    Caption.Color = 4473924
    Caption.ColorTo = clNone
    Caption.Font.Charset = DEFAULT_CHARSET
    Caption.Font.Color = clWindowText
    Caption.Font.Height = -11
    Caption.Font.Name = 'Tahoma'
    Caption.Font.Style = []
    Caption.GradientDirection = gdVertical
    Caption.Indent = 2
    Caption.ShadeLight = 255
    Caption.Text = '<B>pnlPowerOnSample</B>'
    Caption.Visible = True
    CollapsColor = clNone
    CollapsDelay = 0
    DoubleBuffered = True
    ShadowColor = clBlack
    ShadowOffset = 0
    StatusBar.BorderColor = clNone
    StatusBar.BorderStyle = bsSingle
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = 15790320
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    StatusBar.Color = 4473924
    StatusBar.GradientDirection = gdVertical
    Styler = AdvPanelStyler1
    Text = ''
    FullHeight = 200
    object sPanel7: TsPanel
      Left = 0
      Top = 18
      Width = 188
      Height = 129
      Align = alClient
      TabOrder = 0
      object lblPowerOnSample: TsLabel
        Left = 16
        Top = 4
        Width = 97
        Height = 105
        Caption = 'Power        '#13#10'0 mW'#13#10#13#10'Intensity   '#13#10'0 mW/um2'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
      end
    end
  end
  object pnlCCD2: TAdvPanel
    Left = 644
    Top = 673
    Width = 604
    Height = 334
    BevelOuter = bvNone
    Color = 11711154
    TabOrder = 6
    UseDockManager = True
    Version = '2.5.4.1'
    BorderColor = clNone
    CanMove = True
    CanSize = True
    Caption.Color = 4473924
    Caption.ColorTo = clNone
    Caption.Font.Charset = DEFAULT_CHARSET
    Caption.Font.Color = clWindowText
    Caption.Font.Height = -11
    Caption.Font.Name = 'Tahoma'
    Caption.Font.Style = []
    Caption.GradientDirection = gdVertical
    Caption.Indent = 2
    Caption.ShadeLight = 255
    Caption.Text = '<B>ToupCam</B>'
    Caption.Visible = True
    CollapsColor = clNone
    CollapsDelay = 0
    DoubleBuffered = True
    ShadowColor = clBlack
    ShadowOffset = 0
    StatusBar.BorderColor = clNone
    StatusBar.BorderStyle = bsSingle
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = 15790320
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    StatusBar.Color = 4473924
    StatusBar.GradientDirection = gdVertical
    Styler = AdvPanelStyler1
    Text = ''
    DesignSize = (
      604
      334)
    FullHeight = 200
    object pnlCCDparent2: TsPanel
      Left = 0
      Top = 18
      Width = 604
      Height = 303
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = 'pnlCCDparent'
      TabOrder = 0
    end
  end
  object pnlSNR: TAdvPanel
    Left = 1228
    Top = 113
    Width = 173
    Height = 50
    BevelOuter = bvNone
    Color = 11711154
    TabOrder = 7
    UseDockManager = True
    Version = '2.5.4.1'
    BorderColor = clNone
    CanMove = True
    CanSize = True
    Caption.Color = 4473924
    Caption.ColorTo = clNone
    Caption.Font.Charset = DEFAULT_CHARSET
    Caption.Font.Color = clWindowText
    Caption.Font.Height = -11
    Caption.Font.Name = 'Tahoma'
    Caption.Font.Style = []
    Caption.GradientDirection = gdVertical
    Caption.Indent = 2
    Caption.ShadeLight = 255
    Caption.Text = '<B>SNR</B>'
    Caption.Visible = True
    CollapsColor = clNone
    CollapsDelay = 0
    DoubleBuffered = True
    ShadowColor = clBlack
    ShadowOffset = 0
    StatusBar.BorderColor = clNone
    StatusBar.BorderStyle = bsSingle
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = 15790320
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    StatusBar.Color = 4473924
    StatusBar.GradientDirection = gdVertical
    Styler = AdvPanelStyler1
    Text = ''
    FullHeight = 200
    object sPanel9: TsPanel
      Left = 0
      Top = 18
      Width = 173
      Height = 32
      Align = alClient
      TabOrder = 0
      object lblSNR: TsLabel
        Left = 16
        Top = 4
        Width = 71
        Height = 21
        Caption = 'SNR = 0'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
      end
    end
  end
  object pnlLaser680: TAdvPanel
    Left = 1229
    Top = 410
    Width = 353
    Height = 135
    BevelOuter = bvNone
    Color = 11711154
    Constraints.MaxHeight = 225
    Constraints.MaxWidth = 353
    Constraints.MinHeight = 107
    Constraints.MinWidth = 353
    TabOrder = 9
    UseDockManager = True
    Version = '2.5.4.1'
    BorderColor = clNone
    CanMove = True
    CanSize = True
    Caption.Color = 4473924
    Caption.ColorTo = clNone
    Caption.Font.Charset = DEFAULT_CHARSET
    Caption.Font.Color = clWindowText
    Caption.Font.Height = -11
    Caption.Font.Name = 'Tahoma'
    Caption.Font.Style = []
    Caption.GradientDirection = gdVertical
    Caption.Indent = 2
    Caption.ShadeLight = 255
    Caption.Text = '<B>Laser 680</B>'
    Caption.Visible = True
    CollapsColor = clNone
    CollapsDelay = 0
    DoubleBuffered = True
    ShadowColor = clBlack
    ShadowOffset = 0
    StatusBar.BorderColor = clNone
    StatusBar.BorderStyle = bsSingle
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = 15790320
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    StatusBar.Color = 4473924
    StatusBar.GradientDirection = gdVertical
    StatusBar.Height = 20
    Styler = AdvPanelStyler1
    Text = ''
    DesignSize = (
      353
      135)
    FullHeight = 200
    object sPanel10: TsPanel
      Left = 1
      Top = 16
      Width = 351
      Height = 196
      TabOrder = 0
      object sGroupBox3: TsGroupBox
        Left = 248
        Top = -1
        Width = 101
        Height = 61
        Caption = 'Power'
        TabOrder = 0
        object shpLaser680PowOn: TShape
          Left = 8
          Top = 20
          Width = 10
          Height = 10
          Shape = stRoundSquare
        end
        object shpLaser680PowOff: TShape
          Left = 8
          Top = 40
          Width = 10
          Height = 10
          Shape = stRoundSquare
        end
        object btnLaser680PowOn: TsButton
          Left = 24
          Top = 16
          Width = 73
          Height = 18
          Caption = 'On'
          TabOrder = 0
          OnClick = btnLaser680PowOnClick
        end
        object btnLaser680PowOff: TsButton
          Left = 24
          Top = 36
          Width = 73
          Height = 18
          Caption = 'Off'
          TabOrder = 1
          OnClick = btnLaser680PowOffClick
        end
      end
      object sGroupBox5: TsGroupBox
        Left = 3
        Top = -1
        Width = 243
        Height = 90
        TabOrder = 1
        object vleLaser680Status: TValueListEditor
          Left = 8
          Top = 10
          Width = 142
          Height = 23
          ParentCustomHint = False
          BiDiMode = bdLeftToRight
          Ctl3D = True
          DefaultRowHeight = 15
          DisplayOptions = [doAutoColResize, doKeyColFixed]
          DoubleBuffered = True
          Enabled = False
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goThumbTracking, goFixedColClick, goFixedRowClick]
          ParentBiDiMode = False
          ParentColor = True
          ParentCtl3D = False
          ParentDoubleBuffered = False
          ScrollBars = ssNone
          Strings.Strings = (
            'Out Power=')
          TabOrder = 0
          TitleCaptions.Strings = (
            'Status')
          ColWidths = (
            63
            73)
          RowHeights = (
            15)
        end
        object spinedtLaser680Power: TsSpinEdit
          Left = 154
          Top = 21
          Width = 53
          Height = 21
          TabOrder = 1
          OnKeyDown = spinedtLaser680PowerKeyDown
          BoundLabel.Active = True
          BoundLabel.Caption = 'Power [mW]'
          BoundLabel.Layout = sclTopLeft
          MaxValue = 255
          MinValue = 0
        end
        object btnLaser680SetPow: TsButton
          Left = 212
          Top = 21
          Width = 26
          Height = 20
          Caption = 'Set'
          TabOrder = 2
          OnClick = btnLaser680SetPowClick
        end
        object trbLaser680Power: TsTrackBar
          Left = 6
          Top = 54
          Width = 233
          Height = 33
          DoubleBuffered = False
          Max = 255
          ParentDoubleBuffered = False
          TabOrder = 3
          OnChange = trbLaser680PowerChange
        end
      end
      object btnFindLaser680: TsButton
        Left = 307
        Top = 66
        Width = 37
        Height = 25
        Caption = 'Find'
        TabOrder = 2
        OnClick = btnFindLaser680Click
      end
    end
    object StatusBarLaser680: TsStatusBar
      Left = 0
      Top = 118
      Width = 339
      Height = 17
      Align = alNone
      Anchors = [akLeft, akBottom]
      Panels = <
        item
          Width = 150
        end
        item
          Width = 50
        end>
    end
  end
  object ApplicationEvents1: TApplicationEvents
    OnMessage = ApplicationEvents1Message
    Left = 72
    Top = 136
  end
  object ImageList1: TImageList
    ColorDepth = cd32Bit
    DrawingStyle = dsTransparent
    Height = 24
    Width = 24
    Left = 217
    Top = 145
    Bitmap = {
      494C010102000500040018001800FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000600000001800000001002000000000000024
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0E0
      E0FFEBEBEBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8
      F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCDCDCFF5B5B
      5BFF6C6C6CFFECECECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8787
      87FFC5C5C5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFF626362FF4C4C
      4CFF4B4C4CFF747474FFFAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7B7B7FF4F4F
      4FFF5B5B5BFFE7E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F4F4FF6A6C6DFF47494AFF4B4D
      4EFF4A4C4DFF454748FF818282FFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3E4E4FF646566FF4B4C
      4DFF4A4B4DFF868587FFF9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFEAEBEBFF6B6D6EFF464849FF4A4C4DFF4B4D
      4EFF4A4C4DFF4A4C4DFF474848FF838383FFF7F7F7FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFF707272FF454748FF4B4D
      4EFF4B4D4EFF4F4E50FFB0AFB1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFF6F6F6FF787A7BFF494B4CFF4C4D4FFF525455FF4B4D
      4EFF4C4E4FFF515354FF4C4D4EFF4C4C4CFF8C8C8CFFF9F9F9FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8A8A8AFF464748FF4A4C4DFF4B4D
      4EFF4B4D4EFF4A4A4CFF4C4B4DFFD0CFD0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFEBEBEBFF525354FF4A4B4CFF6C6E6EFFADADAFFF4E50
      51FF535556FFB1B2B3FF5F5F60FF4A4A4AFF686868FFF1F1F1FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFE1E1E1FF8B8B8BFF898A8BFF5A5C5DFF4A4C
      4DFF4A4C4DFF686769FF8B8A8CFF979698FFFFFFFEFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFECECECFF525252FF727373FFF2F2F2FFBBBCBCFF4F51
      52FF525455FFD3D4D4FFE1E1E1FF6A6A6AFF656565FFF1F1F1FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFDBDCDCFFFFFFFFFFFFFFFFFFFEFEFEFF767879FF4A4C
      4DFF4A4C4DFF9F9FA0FFFFFFFFFFFFFFFFFFF4F4F5FFEBECECFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFEAEAEAFF6F6F6FFFEEEEEEFFFFFFFFFFB7B8B8FF4F51
      52FF525455FFCDCECEFFFFFFFFFFE3E3E3FF808080FFEFEFEFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF979898FF747677FFFFFFFFFFFFFFFFFFF6F6F6FF747677FF4A4C
      4DFF4A4C4DFF9B9B9BFFFFFFFFFFFFFFFFFFEAEBEBFF5D5F61FFCCCDCEFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFF8F8F8FFE3E3E3FFFFFFFFFFFFFFFFFFB7B8B9FF4F51
      52FF525455FFCDCECEFFFFFFFFFFFFFFFFFFE2E2E2FFF7F7F7FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F2
      F2FF848585FF484A4BFF747677FFFBFBFBFFF1F1F1FFE8E8E9FF757778FF4A4C
      4DFF4A4C4DFF969697FFF1F1F1FFF2F2F2FFDFDFE0FF535456FF4D4F50FFB1B3
      B4FFFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7B8B9FF4F51
      52FF525455FFCDCECEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD8D8D8FF7A7A
      7BFF47494AFF4B4D4EFF525455FF6F7172FF6A6C6CFF666869FF505253FF4B4D
      4EFF4B4D4EFF585959FF696969FF6B6B6BFF666667FF4C4E4FFF4A4C4DFF4F51
      52FF939494FFF3F3F3FFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7B8B9FF4F51
      52FF525455FFCDCECEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FF5B5D5EFF4A4C
      4CFF4B4D4FFF4B4D4EFF4B4D4EFF4A4C4DFF4A4C4DFF4B4D4DFF4B4D4EFF4B4D
      4EFF4B4D4EFF4B4D4EFF4A4C4DFF4A4C4DFF4A4C4DFF4B4C4FFF4B4D4EFF4A4C
      4DFF4C4D4EFF666666FFE1E1E1FFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7B8B9FF4F51
      52FF525455FFCDCECEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD5D6D6FF606263FF4A4C
      4DFF4B4D4EFF4B4D4EFF4B4D4EFF4A4C4DFF4A4C4DFF4A4C4DFF4A4C4DFF4B4D
      4EFF4B4D4EFF4A4C4DFF4A4C4DFF4A4C4DFF4A4C4DFF4B4D4EFF4B4D4EFF4B4D
      4EFF4F5051FF808080FFF5F5F5FFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7B8B9FF4F51
      52FF525455FFCDCECEFFFFFFFFFFFFFFFFFFFEFEFEFFFEFEFEFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEEFEFFF898A
      8BFF4C4E4FFF4B4D4EFF595B5CFF8B8C8DFF878989FF858787FF5B5D5EFF4A4C
      4DFF4A4C4DFF666768FF888A8BFF888A8BFF818384FF4F5152FF494B4CFF5759
      5AFFADADAEFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFEFEFEFFFB3B3B2FFFFFFFFFFFFFFFFFFB7B8B9FF4F51
      52FF525455FFCDCECEFFFFFFFFFFFDFDFDFFACACACFFF2F1F1FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFA
      FAFFA7A8A9FF4A4C4DFF727474FFFFFFFFFFFBFBFBFFF2F2F2FF737576FF4A4C
      4DFF4A4C4DFF989A9AFFFAFBFBFFFBFBFBFFE7E8E8FF545657FF555859FFD2D3
      D4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFEBEBEBFF5B5D5EFFCDCDCEFFFFFFFFFFB7B8B9FF4F51
      52FF525455FFCECFCFFFFFFFFFFFB0B2B2FF626465FFF0F1F1FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFC2C2C2FF7E7E80FFFFFFFFFFFFFFFFFFF6F6F6FF747676FF4A4C
      4DFF4A4C4DFF9B9B9BFFFFFFFFFFFFFFFFFFEAE9E9FF717171FFF5F4F5FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFEBECECFF515354FF565859FFC4C5C6FFBDBEBEFF4F51
      52FF535556FFD2D3D3FFACADAEFF47494AFF666869FFF0F1F1FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFF0F0F0FFFFFFFFFFFFFFFFFFFFFFFFFF767879FF4A4C
      4DFF4A4C4DFFA0A0A0FFFFFFFFFFFFFFFFFFFAFAFAFFFEFEFEFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFECECECFF58595AFF4A4C4DFF545657FF828485FF4D4F
      50FF515354FF838586FF4F5152FF484A4BFF6C6E6FFFF2F2F2FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFE6E6E6FF727272FF6C6D6DFF535556FF4B4D
      4EFF4B4D4DFF5C5D5DFF6D6D6DFF8B8B8BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFEFEFEFFA9ABABFF4C4E4FFF4B4D4DFF48494AFF4A4C
      4DFF4B4D4EFF484A4BFF494B4CFF515253FFBFC0C1FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9FFF474849FF4A4C4DFF4B4D
      4EFF4B4D4EFF4B4C4CFF505050FFE4E4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA0A1A1FF484949FF4C4D4EFF4B4D
      4EFF4A4C4DFF4B4D4EFF545455FFBBBCBCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF828384FF464849FF4B4D
      4EFF4B4D4DFF555555FFC3C3C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA6A6A6FF464748FF4B4D
      4EFF4B4D4EFF515354FFC6C7C7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEEEEFFF666869FF4A4C
      4DFF4B4D4DFF949595FFFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFF929393FF4B4D
      4EFF4C4E4FFFADAEAEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC4C5C5FF4F51
      52FF606263FFF1F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8FF8486
      87FF9B9D9EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999A
      9BFFD5D6D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8
      F8FFFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFB
      FBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000060000000180000000100010000000000200100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
  object Timer1sec: TTimer
    OnTimer = Timer1secTimer
    Left = 152
    Top = 144
  end
  object MainMenu1: TMainMenu
    Left = 288
    Top = 200
    object F1: TMenuItem
      Caption = 'File'
      object S2: TMenuItem
        Caption = 'Save'
        object toCsv1: TMenuItem
          Caption = 'Plot to CSV'
          OnClick = toCsv1Click
        end
        object t1: TMenuItem
          Caption = 'Plot to Image'
          OnClick = t1Click
        end
        object t2: TMenuItem
          Caption = 'Andor CCD to Image'
          OnClick = t2Click
        end
        object A1: TMenuItem
          Caption = 'All lines to CSV'
          OnClick = A1Click
        end
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object E1: TMenuItem
        Caption = 'Exit'
        OnClick = E1Click
      end
    end
    object S3: TMenuItem
      Caption = 'Scan'
      OnClick = S3Click
    end
    object S1: TMenuItem
      Caption = 'Settings'
      OnClick = S1Click
    end
    object L1: TMenuItem
      Caption = 'Log'
      OnClick = L1Click
    end
    object D1: TMenuItem
      Caption = 'DC Motor'
      object S4: TMenuItem
        Caption = 'Settings'
        OnClick = S4Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object R1: TMenuItem
        Caption = 'Reconnect'
        OnClick = R1Click
      end
    end
    object S6: TMenuItem
      Caption = 'ScanAdv'
      OnClick = S6Click
    end
  end
  object TimerOnesec: TTimer
    OnTimer = TimerOnesecTimer
    Left = 152
    Top = 200
  end
  object SaveDialog: TsSaveDialog
    DefaultExt = 'csv'
    Filter = 'csv|*.csv|txt|*.txt'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 400
    Top = 146
  end
  object TimerProgress: TTimer
    Enabled = False
    Interval = 100
    OnTimer = TimerProgressTimer
    Left = 224
    Top = 202
  end
  object sSkinManager1: TsSkinManager
    ButtonsOptions.OldGlyphsMode = True
    InternalSkins = <
      item
        Name = 'FM (internal)'
        Shadow1Color = clBlack
        Shadow1Offset = 0
        Shadow1Transparency = 0
        Data = {
          41537A660B0000000B0000004F5054494F4E532E4441541E4B000078DAED5CDD
          8FDB36127F5F60FF87DBD70269F9294A5818886C6B6DA1B664C8F2266DD104C5
          01877BBE7BDFBFFD66F825529664797793ECA5E906144951E47066F89BE190EE
          1F9B5DBDCC7765F550FF797BB3CF8F6DD12CCB769F1F16A6F0F3727FB8BD792C
          9A6359570B4A7E66F2F6263FB5DBBA596CFEF3D7BFFE71FCEBBFFFFCF75FB737
          CB725557AB5D7D2C16EF09FCE712C52091E43D7F4F6F6F56F50EBEE35C4A21F8
          EDCD435DB5A68A4AC584640AFAA99B75D1D85AA51241A9ABFC50AEDBED822638
          D8F190AF8AC53B86F94798C0A65A10CCB7F561C12D35FBB2025AA8482C2D8CA6
          012DBAC9B6D81D905EC5CD1B682D21215D1B9C51BEABABA969E9AEAABAD9FBE1
          A41BCE77D596EDAE589EDAB6F644514F14753D6D9AF250EEF38D1E4D0A4C2824
          89C244BC87FCEDCDB66E7B7C5CD61F4FD56A5BAC7E2DD68E4C2A70B20C3B4FD8
          7B861F42B3A0917EA51BC9246EB469F2DF4C1BFD46B74945D0A6C9D7651D8E68
          A683A45285DDA61C1A52DB3068A65F62334649D0AC5DED8A8736508276B5AC81
          53FBA80A454B13A514A3A083C77DBEDB055D331C9C6798D8D96B66E96611A994
          B986FA93A8A19FB9E9C4749705AD8C5EE51F61D97CD8E7CD06348CC7B50B1A97
          C9E20E72CBB6C2C2CF876A7347EFC89DB843299D259DE2C65D9932765556CFEA
          2AA2D5AB743048540703E98A6B868A3AE8B106974634215701036136DF5D3729
          F77937CC719BAFEB0FD4AC0BE2CBF5C3C3B16871585BB1DC9D1A4F85A639A2CB
          D73C8703C1E7E7AAE141863890F1E8517C34F0B6B82B3EB698D5A331188D43F7
          2C8144642E0789C7C37DBD2E160E5AB645B9D9B60BA169D1CBE99D9E55A3AB99
          811640EDDF51BB335C03A9C475880B37CD8C76631380FA76812FB04972D6E4B8
          FD7CAC4F0D602F74B9AB834240C54F94494D49542789AED3606D05F38E47E5B3
          8AA65FB1D41587A6782C8B0F8BBC0508456E754CFC8911E219F99999D7313315
          8F991912895F2786596BB08AC5225194A4299A9CB6D2DA458DC20277694652C9
          45F78AF9572CE18C49157C95AFDAF2110C16259C6592B0E02BFF8A1101A044F4
          2B348DF6458779BE3760C0F10840F58E0AA232157537F0EEF6E60F0D8080ED60
          E58F6DDE164754CEB6C92B30A44D51AD7E03DB6E6CCB79E59099868641B5A770
          BB3996BF17D8F77603EF165C2534450BFE0096A0DA1455BEDC016DBEA2041723
          6FC1B5382EF4E730BC837E0E5F2658599F5AABEB444F655D3E9620E96E267E41
          00861F7F5D7C82F5927C42CBE9130609D109091278057F74880F30CCA6A94F87
          8863832D0D0704183425D9944BE38963D92730FD90109E428E29A446F4136AFE
          025BE8CDBDE6AC1FD1705C9CF3E9B86AEADD6E9937743BC52BCE81881499C361
          689A29CFA124C821AFE427EFC2898C03015930CE71874279EC46626723291C89
          504C144E1C5940941FC9E6188C2587A532A89D48018C783AC24CA3795A2789CA
          145CA75992E9D4462031B26300EBA98D96CC06DD9BA26A0FE0AFC2C390E32AD7
          799B3B1DBE9700084290FB4CDD13F87345F7D47F81A4994C6486F4F545DAD6F5
          AE3FCDBE38FD1C38F2576A75A2FDC4CF6186FAE2B84D0EE8110E8C36574B7CB5
          CDABAAD839C52699B044006EE258BC9F748A3D4FBE66183D3DF443A5F54829B5
          DEA6F120CBD5AF67C68D66A1E5C226D6B88D35B13A6CC7329EA2C444B060AC79
          501689EED0D41B4D9E9508E5288704978290A35CD2AB003FD5645FFF2908EE43
          B1347B8E685DCE86F841110DE1FE33E0DDA1595FC71FC0886A931C91EC373D5E
          557BC568DDC1EAA15C917BBBF8DDBA7345F7B4EB6E701D8F70E405C3045F4723
          8DB0B4B7AEA9F2EB1AC59E6861A71E9B6CCE2F2E637E15E3F08F78BB2C466480
          4B7CF9B9CD97D102EF4F37656996D1D4C3564206D18C4F82DC04177A121DE1CB
          0CD4658CA752CD44DD600C92A54AF0014C550ED8044360EB4C42E85878DEF7E6
          81CCCD97B07BFDF39CA556401D6D3422D5F6712F125DED8BF6F9F5592AA81099
          CC1C4B5DD13DE7B354EB6F8A8942F6659D1394F85CC0D20E08809B871C0CCE84
          0D04E0768E06C38466D31ED608928C73A32F074E22F1B8759F4CC2C188A95D97
          B08BDE0C38325627CE38A9B551030345D625A967629878833F32AC7516DBCA40
          438403B0A100AB58AC97E07D1479B5689B5371EE3B712746895E2D27CEA563D4
          3B77AA732337BBDF0E5B67D4A9C2380BEE8E31A14219431B92A5B7B1D753D539
          B749E29C5B4350E8720E5325DD0E18BE452781F6A902CFFA717217A259925A96
          90ACF3774990F383871DB357EE18BAECD95431A84854AF4BEDBEA57470D508E7
          5DBC3668F4A1316112C4273BD0CB063150A4CF81C671B7D703D66CF40C6C6B6C
          745FE01421CA81E3875BF9C7CBDEBE72DE7E42A6BDFD8EFC01B727EDCB0F26CD
          41C3EED314A0429B51B44EB6641F04EBC04BCD5B9855B57882D5CB9F107C3127
          20C9307982263AACEDC662C4D9C53EDEB0415341B5FB83A6C2F8BFCE407446A3
          F37C7A7AD4D70C4563B026196350C78C897545F7FC7F32B186A118FB9B62A7CC
          1C786848A49D9508793ACA4EE7B138FEC13F3AB42CE560B555976FC34E3AC84E
          3ACDCE9EE119504FE9F8A9D593267DCD9CE6679F433D7E7A761B7EBAA27B7E3D
          7E3A8639BE5A7EBAA27B4EF3D386EE1EE7C5EE2E0561E468EC6E5B566D34C6E5
          F99D831D1900BBDEDA9BE98D8D0332D0BA2FAA13869A2FECD00777E3E7C29D27
          EE3127F050803FA5E3059FF57958E4705DE6A104072B11A00C36ECE5F6C3B6E8
          9E9731357604C013CB6432B3D7A1A93D974DA3A1351D79D166F75CB61880E128
          DB7E60E37458D71FF0F8EE07579FC755B762D64DBEB91405CD7CA76C4614F48A
          48AE15868B29D8A27B5A76CD8BAAE6BBC3365FD5FB65DD3F6678D97EF65BA994
          A20ABC3FE85549C208F5BDDAA27B4EA85484707200F5E478BC2C3E7775C7BAF6
          30B758976D74908B678024F5496672D1AAF5052305868E13159030A5F7475D04
          2E4CBC14E05B3CB35CDAA319CCEF10DA6DBE0DF28DCB1FF255D946D81EEE08A0
          665BE4D1D1179FD811882E4E38B89CC8B7D495EBE0E722D45C714469629D7D18
          3EB7ADCF8629D573F35E71CDCCC6D8790084AE47C408360C3D8CD8880EE5E920
          F43037ED8B8B7ADC97993713CF017BC69EC41BE828E88A8765BDC30FFEB5E4FA
          EDF4FB32BBC9C4F1C02B1EE4A076C177FB37AD5E83CA337292DE56F1DE7A6E10
          5207D6CC093BF727ECFEDCDB85238783905CB920A4BE5D771E846C2B73B2D039
          0FF3C3B589F021C48E269F303A4293BEC2A4C3B5FA6AD059B8D61CA36EA736CD
          7A9BA44F5498BE03D105ADC3FB00CFB80A70C837C50AE40C74F4234B035EA270
          916A64071543DAC747CF09464035A0A0173BB89A003E7D50717135902890B87D
          4381C4D1BD751048643A7C289F401115E6928940E2B1D8152BC4A748E9AE404D
          5336B7BD5478C7D65D601AB33281B863741839F3D26B4E9F79694488047DB5B4
          61FCA65C2EF1AED8F2CFCBB13A210763E5365CFEE374D1DEFB2A0FF152E97492
          085042582698CB9E709C274A9E684F27F50407D1C9080B5566E080CFF371F6EE
          AFAF36333D7A1FFA767B5A12FB26561AC6EB742596644A52EE8EA25DD13DA70F
          358F875D893CBC7CFBB04FFD806B55FD9207DAD7F930F3435DCFB8C1131DCEBD
          E67D3AB31D39F3C4F9B0C94C3217D2C8B8EF5206E7BC68AEC4A7CBC757566E17
          903C7B01920F08530E483305DF3123FC1E943B9534715DBAA27B0E3BCAD75A0B
          6A0838FB4CF8CFA4FD0C5A455FCACEA75DE587D8D2D0D7358153E1E52B6FF73D
          D39A96307C14919E172213A9222CF3F6C39DB80C1F012133F3B24286BE62206F
          9ECD84357CE90EC9AC53C7AB8D75F11140EF19ACBDE22436D29E72D18FEBBFCE
          5678E60580B71066FC625BEBE18DF5ABEC9FFB91477DEB4C471E750C320DEDFE
          802EBE20F2A8641799C698E91B8E4ACF8A1FFF1D82C297CF0F746CC54459B2F1
          284B0FCB267FA519C503F0774DFA077324CBCC6F01753CE07BE33DE2F78525F1
          2518FDDD31519BDECF40F6F82F6BC82B71D6988261CEBE25964C9F667EE793DF
          E4A7DE7E785A17AE8D55CD60C70CE7D62CD27B17D7B7B6C915DDD3DAA6B7C45E
          7B9F631B3199CFF25867877866C6674339DE19BA902CFC7F0C00742180E1A59F
          B32446417A0683D847FF87BA88843C7389202679DE0F111D3EF72F7AFAD86014
          29F022938168642032198852F6D4C33851A0D02CF30161ADEE5112A947ECB959
          692FCBCD84A71FB86E1A50465CB7BFB1A7DF17759229011BB057B3C72FDE2658
          7DD14641C389406966FAE299BF04AE73949FC1491BC1C9B09E2E1769A45F4962
          6255DBD37EF9191A4CED9DBB9BE4241BBF497EC5CEC009E69E02CE2669EA0328
          BEEC3356193A52ABB74FA939303BE3EA977089EC4FD6C2C5A064928076BD2DAB
          E558527D718E303011328DDC6F41599A28FEB63872317EF303D5AF45757F76F0
          4AA83E6757FC06313D38C2FCEAC797F86BDFE8CCB6F763372FEF2FF8F3B7585B
          02EAFE07A302B9F90E000000425554544F4E485547452E424D503888020078DA
          ED9D07945555B2F737A3E37BE37C8E4A6AA0C948139AD8C426491068C9B1C9A1
          41721610141141A0010541902841C94182040922080802828E80A04832008284
          8606E6B1662DBF7FEDBDCF3EFB9C7BFBD074BAB771D7AA37DFACF7D1E754D53B
          BFFBAFAAB3FB76CD861527FC8D9195C7FF14C6FFE4CDC0D86EFCBF195836FEBF
          FF1BFEFF33FE93F1FFB1ECCF64DBFDFBF74F9F3EBD77EFDE0D1B36CC993367C6
          8C19A30264B83502401808062121B0E46767EA63EA13108B8F8FDFBF7FFFC285
          0B478F1EDDAE5DBB5AB56A952E5D3A7BF6EC59B264610132DC1A01200C048390
          1018C2439008D5D4C7D427BDD4E7B7DF7E5BB66CD9D0A143EBD4A993274F9E0C
          193204AA20DE86C0101E8244A80818619BFA98FA04737DAE5DBBB666CD9AEEDD
          BB83F14067FF708680113682470AA63EA63EC1569FBB77EF6EDEBC79CC983191
          919181CE35E986E0910212413AA63EA63E41529F13274E8C1B37AE66CD9A8F3D
          F658A0534CAE21052482749094A98FA94F60EBF3DFFFFE77D3A64D2D5BB6CC97
          2F5FA0334B49433A480AA92141531F539F80D4E7FFFEEFFF162E5C18151515E8
          6C52CB901A12449AA63EA63E695C9FF8F8F859B366D5AE5D3BD049A4AE2141A4
          998405ACA98FA94F92EB73EFDEBD99336756AF5E3DD0E1A785214D9408299BFA
          98FAA4417DD0522E5AB4A856AD5A810E3CED0CC922E544F6D2A63EA63EC9A9CF
          E6CD9B1FE19E392143CA48DCD4C7D42755EB73ECD8B1162D5A04ED2BF5D433A4
          8CC491BEA98FA94F2AD5272E2E2E3636364F9E3C810E363086C4913E8A60EA63
          EA931AF559B3664DD5AA55031D66200DE9A308A63EA63E295E9F0B172EC4C4C4
          043AC0C01B8A805298FA98FAA46C7DE6CF9F5FBC78F1404717784311500A531F
          539F14ACCFD9B3673B76EC18E8D082C53A77EE7CEEDC39539F84CCD4C7DB7CEB
          B374E9D2A2458B063AAE60B1F0F0F065CB9699FA2464A63EDEE6AA4F7C7CFCE8
          D1A3FF823BD5840CA54041D4A117531F9799FA789BAB3E070E1CF80BBE10F436
          14046531F549C84C7DBC4DAF0FC6B1DCB973073AA2E03214444DA9A63EBE66EA
          E36DAA3EF7EFDF1F3B76ECE38F3F1EE88882CB1E7BECB13163C6DCE766EAE36B
          A63EDEA6EA73FAF4E976EDDA053A9C603494E53437531FBF66EAE36DA23E5F7C
          F145CD9A35031D4B305AF5EAD577EFDE6DEA939099FA789BA8CFEAD5ABC3C3C3
          031D4B301ACAB29A9BA98F5F33F5F136519FB973E7868686063A96603494652E
          37531FBF66EAE36DA23E93274F7EEAA9A7021D4B30DAD34F3F3D65CA14539F84
          CCD4C7DB447DC68D1BF7C4134F043A9660B47FFCE31F13264C30F549C84C7DBC
          4DD467D4A851810E24484DAC584D7D1232531F6F33F579A0893FAB11E82882D7
          4C7DBCCDD4C7DB4C7DBCCDD4C7DB4C7DBCCDD4C7DB4C7DBCCDD4C7DB4C7DBCCD
          D4C7DB4C7DBCCDD4C7DB4C7DBCCDD4C7DB4C7DBCCDD4C7DB4C7DBCCDD4C7DB4C
          7DBCCDD4C7DB4C7DBCCDD4C7DB4C7DBCCDD4C7DB4C7DBCCDD4C7DB4C7DBCCDD4
          C7DB4C7DBCCDD4C7DB4C7DBCCDD4C7DB4C7DBCCDD4C7DB4C7DBCCDD4C7DB4C7D
          BCCDD4C7DB4C7DBCCDD4C7DB4C7DBCCDD4C7DB4C7DBCCDD4C7DB4C7DBCCDD4C7
          DB4C7DBCCDD4C7DB4C7DBCCDD4C7DB4C7DBCCDD4C7DB4C7DBCCDD4C7DB4C7DBC
          CDD4C7DB4C7DBCCDD4C7DB4C7DBCCDD4C7DB4C7DBCCDD4C7DB4C7DBCCDD4C7DB
          4C7DBCCDD4C7DB4C7DBCCDD4C7DB4C7DBCCDD4C7DB4C7DBCCDD4C7DB4C7DBCCD
          D4C7DB4C7DBCCDD4C7DB4C7DBCCDD4C7DB4C7DBCCDD4C7DB4C7DBCCDD4C7DB4C
          7DBCCDD4C7DB4C7DBCCDD4C7DB4C7DBCCDD4C7DB4C7DBCCDD4C7DB4C7DBCCDD4
          C7DB4C7DBCCDD4C7DB4C7DBCCDD4C7DB4C7DBCCDD4C7DB4C7DBCCDD4C7DB4C7D
          BCCDD4C7DB4C7DBCCDD4C7DB4C7DBCCDD4C7DB4C7DBCCDD4C7DB4C7DBC0DC519
          376EDC134F3C11E84082D1509671DC4C7DFC9AA98FB789FA4C9E3CF9A9A79E0A
          742CC16828CB646EA63E7ECDD4C7DB447DE6CE9D1B1A1A1AE85882D15096B9DC
          4C7DFC9AA98FB789FAAC5EBD3A3C3C3CD0B104A3A12CABB999FAF835531F6F13
          F5F9E28B2F6AD6AC19E85882D150962FB899FAF835531F6F13F5397DFA74BB76
          ED021D4B301ACA729A9BA98F5F33F5F136519FFBF7EF8F1D3BF6F1C71F0F7438
          C1658F3DF6D8983163EE7333F5F135531F6F53F5F9F3CF3FE7CF9F9F3B77EE40
          47145C8682A02C7F7233F5F135531F6FD3EB73E0C081A8A8A84047145C8682A0
          2CA63E0999A98FB7E9F5898F8F1F3D7A74860C19021D54B0184A8182A02CA63E
          7ECDD4C7DB5CF5812D5BB6AC78F1E2818E2B580CA54041FED4CCD44737531F6F
          F3ADCF850B17626262021D57B0184A818298FA2464A63EDEE65B1F31A59A8F20
          C63F7CD4646AEA63EA9352F5311F41C2FC7EF898FA98FA24B33EB0356BD654AD
          5A35D00106D2903E8AF0670266EA63EA939CFAC4C5C5C5C6C6E6CB972FD06106
          C69038D247114C7D4C7D52A33EB013274EB46CD9F22FB86B45CA481CE9FFE969
          A63EA63EC9A90F6CF3E6CD7FC1D7854819893FB038A63EA63EC9ACCF7FFFFBDF
          458B16D5AA552BD021A79D2159A48CC44D7D4C7D52BB3EB07BF7EECD9D3BB77A
          F5EA810E3C2D0C692259A49CC8E298FA98FA24B33E7FF2432FF3E7CF7FE4851E
          09224DFD288BA98FA94F1AD4E74F2EF4EBD6ADAB5FBF7EA64C99029D47CA1B92
          426A4830F1B26EEA63EA9382F51176E0C081D1A347172A5428D009A5A4211D24
          A54E389BFA98FA04AA3EB0D3A74FC7C6C6D6AC59F3B1C71E0B7466C935A48044
          900E924A91E298FA98FA24DFEEDEBDFBE9A79F8E1933A652A54A814E31E986E0
          910212413A29581C531F539F14B1EBD7AFAF5DBBB6478F1E65CA944947BF128E
          501130C246F04821352A63EA63EA935276E9D2A5152B568C1D3BB675EBD6A54A
          957AF2C927035D00FF86C0101E8244A8081861A776654C7D4C7D52CAEEDFBF7F
          EAD4A975EBD64D9A34A973E7CEB56BD706E3D9B905E4780C6E2AEE8E30100C42
          4260080F418AAF19496333F531F549293B77EEDCBE7DFB3EF9E49339DC468F1E
          3D2ACD0D371577471808062105B626A63EA63E642CB99E274F9EDCB9738BFF0C
          B8E5B22C27B7E467977C67E5A259F996AC7C34FD9772FCBF90B7965EA14DEABA
          BA91B86FD916AC4C7356A6292BDD98956A18F0E2C09FC998E7998CB9EDFFCCA4
          7B5EE1CF92E7B33DB3EEF93D5DFB97FA15AC2B73B7EFF874C6DC4F67CCF5F4B3
          B9FEF54C4E7800CB92975B3EA7F9FE6FD2D8445479B809D042B90500ABC8B6AC
          527B56A903ABDC89BC4A6756358655EDC2AA756555BBB26A2FB1E7BB71EF4E5E
          3D155C5C59DC05B7ABCAEF5B258682896CCF2AB426D8056825EBA77D7DC413AE
          1EFE8C99F36714B064C9CFFF7B818C59A467227F2E5356DD0B26C9B52BE08259
          EC5BD0ED1492923ECE1A8116FAAF6772A46565F018E7E75680DB73DC0A06813D
          A719C2439C4255859CA51965AC724756B9B324A8662F56AB2F7BA11FAB3D80D5
          19C4EABECCEA0E665143C95F84BF425E6F586AB9B8FE8B43E51DE9EE83281284
          54A307E18650011A448DE4AC411A91C5A54440C49F73E225337958E610E18532
          678317169E255B912CD9752F9A0CD7AE93AD88BA05DD2EA450A69030724E22A0
          E371E67DC6A62CD59F1FC1940E54216E85B915F1B1A26962BEF7155109E210B3
          50B434A08C55E9440A05D5A8D9871EE3A821ACFE30D660046BF4066B3C8A351D
          C39A8D65CDC7B316F058D672028B9E98168E1BE176B8296EDDEC2DD664346B38
          9235788DC24390357A91A845B663655BB28826A9AA65A29D23BDC82A980ACB12
          52280B08CA5E246BF6A2DCC3E121398A712F0ECF16EAF212E439C9B327DAC5BF
          973FEBBCA0B88BB8A3B87B56855ED630022D73012967A9A9653A596161618229
          3CC9E1DC8A59563C084C4482A8046B88163123782167A9441927AB2BABDE93A4
          0A32517F383DC34DDF622D00D13BACCD54D6EE3DD6E17DD66116EB389B759ACB
          3ACF63311FB098F90EEFB22065DC7559DC08B7C34D716B04D061066B3B95B59A
          4CD0351943A041526BF5A1F8D1379296356225EAA56C7D325A64E189259DCA56
          48A852488EF090D0622178D4250525B3E7829722CF5D3A077904799E32C243A5
          97F5E37935F7FB0FF8CFAA4BC92BE72E8D1BC93BE62A8900442459815B8EA259
          0934523492B34CF95289324116E400CFAAC00AAA8107583CCF25B895D2AC7480
          4CDCBD24371195024DC819128196A1634C59C4A815ACDE83BDD09F14018F6BE3
          3759F371F40083A98E3359E70F58D785ACDB62D67D29EBB982F55AC97AAF26EF
          F331EBBBD6C7D725DB7DAE891B893BE2D608A0FB12F6D2878461A739ACFD74D6
          7A0AE95AA3D7A98124CABAB08A6D692E4BB9ED87EC032158D4FB51BF97350717
          2952130994E2C882A55CCEBCE5C9F3C12BC073915724CFEFF2484F77FE637105
          7E41EEE5C55D703B715FCE1D719D3D67292179045AF6A25CCE0A0A2DE37359CE
          1469175D64C11459787AF118BB808A0802D37113A0215A4599EA188590E5C891
          AC0F225A59A01BC43883D90A9A8526106D189ED8F63338568B588F25ACD70AD6
          6735EBB78EF5DFC0066C640337B3419FB297E15BD9E06D6CF0F654F66D7423DC
          0E37C5AD1100C2E8B79642026BDD3E625DE693AEB57997286BF83A69598D9EAC
          5247DA7E946AC48ABF982CB2C48202DD6008E02A94355B618882208B6325154A
          4A92608A03453469ECE48617A864796597E779CEBFFBFE4BFB222E0635DC2CD6
          84C08132022D44525688778CF95344C81459A21B0459A203546AA53355C69F95
          4D13F37B6B9D35A1688A326424DA45216449468CAF2F7AD308536F186B34929E
          CFD693491140D64B1FB19ECB3956EBD9C04DF46CE3511FFA197BE573366C171B
          B69B0DFF82BDBA87BDBA97FCB57DA9E5E2FAB8116E879BE2D60800612018C26D
          13510F5D83B0426141193E193021D67F95B418ED6285D6349195482262D6DE4F
          0E59783E3959C5B3E7546439B0524C59342976AA482F5835AFEDD51ED2E50FE2
          22F6059FD3B873B0668386202565A465E1D4318684897611429664C474B2C49C
          25E0129AE58B95EF635F2E0DCD033A059AD03264810F0A216462224B1A62B47F
          ABD58F450DA686B0C968D672126B3B8D3A2E6856CF6544D6804FD8A02DF424E3
          91269AF6B2115FB2D70FB09107D9C843EC8DC3DCBF66A352D9710B712FDC14B7
          46000803C120240446A06D61033670CA96D0B086E9ACE5445AC8608A843447B6
          63114D938098D8A26756EB0B6A0869C8E2ADA08B2C0B2BAE2C0A281BA2B0E7F3
          49AF2EBD50925CFD38BF1A2EABD0D370A3180468A4686ECA4AE2F3216BF67021
          64CF66CEF74CC63C4940CC9B2C01970B2BD7035F3ECD2D21E214654ACB409912
          32F48A49408CB6EE90AD175F21D96AC647AD0EEFD3C3D97D31EBBD8AF55F4F0F
          ED901DA417101162EA103DE76F1E65A3BF251FF31D7BEB18F9D8E3DC4FA49AF3
          EB8B7BE1A6E2EE0803C120240486F010244245C0FDD7B15EAB6834C3A70484AC
          E9184AB046AF2420C657DCD6A895BD2846986C39215BA5B86CF16ED0872C8995
          602AAC9AA449A25123BFF0C23535AF25BC80A7E7B75DFB597EB57CE48A3BE046
          AC59EA56D91F65D43166E7421692239C768C3491E57F58C4F47DBB804B8D5ABE
          64058AA6C413E74B9912B2A421464B00356DA1276C3385759CC5BA2E20D9EABB
          969A2E880291F525E9059E6401149EF371DFB3F127D9F8532CF64736017EDAED
          137F4A19F7BD326E879BE2D60800612018811B8176904245C0087BE046D6F763
          D66329ED1BDB4EA55ED146AC49226731F1028B37844542D0138616E35B410117
          C9965FB248AD0456FC995734112645E02F70AF0D7FAEA8EE7512E1F6BF1757B0
          AE260094C459AC09D012A08C0B19721142065D4E02626A43A8A62D175C099155
          2168CC83328118D2D11153B358A2F8127035799376EF6DDE659D66B19716D112
          03A316869AA13B69DE79FD2BEACDF00013562759EC0F1C9F336CD25936E91C7B
          FB3C7BFB027BC7E53FA7A83B2F8EDBE1A6B8350240180806212130848720112A
          0246D8081E296028EBB982168CEDA649C4D02862162BD528717C1512B2C577EF
          C5055CD4135AB2C5E72C9D2CD101DA5871A608019BA0F03A05C3EB3A3DEA21DD
          F1E3B8A0A24FE2265813A0855517DDA383324BC8C48E31BB86181A45318B2546
          BCF4F5BB0E97922D175981862951A029CA44162EC4C42C260E533D08AE81B4CD
          A03D612CBDD59270ADA49EF0E5ADA402986E30EC08B220167892F148E3D91604
          4DFE954DF98DBD7B91FBA534747E47DC1A0108FA08B7B314DE788B32843D820B
          1912E96F21061543A38859AC6A57BE516C9808B80AF39ED01F5CF9CA5BB2A534
          CB228BB77C42A404560E8E8AC15F0CB3BD1E79F144BBF8F7D68F172477706781
          46AC896652A38CB40C015B42E68358B622348B65CA27368A0FEC0C055CAEB650
          87CB83AC8A4160DE94F922866491B87835E6FD5E8CBDD097DE70357C9D5E6FB5
          166DE142275CFB490BD07AA107434B8607184FF2E45F385397D8D4CB6CEAEF6C
          DA15F6DE55EE7F904F4F6517771177C4AD1100C24030C4DA2F141E51F623058C
          B0113C52D01143A3884C1BBD411BC54A1DE9BD58C2AF9ED119DADB0C6A0B4BF8
          C295DB864B76835CB36A29B5B2B112384846EA17125E02DE20192EAF13462ED0
          E3B8B941E394492D9342466B461FC4A851CC41EB8E8C590AF0A57D4E8F2E31A1
          85862F5C4188D50341F38B9898C5F091220631EF2E913AC306AFD1E779AB77E8
          0D173EDE7B2EA7B6D086EB086D1230E6A007434B06B1806AE07926A6D4337F8D
          CDB8CE66DC207FFF665AB8B8176E8A5B2BE888B5CB141E8244A80818612378A4
          A01043A38859ACD31CDA28D67F95DE8B556CCB4A37F2142FD11916CB165A422E
          3474B8444F28472DBEB84037E820CBC64AA7A9708986854B0A6F94901729D558
          B9C73F93D729D15027CE059A46594D5A83909089D587E8156DC468160B2D411B
          C590300C621E5DA26F67E89AB9FCC21568861E8E3217626ADDA1BA44F1DED9AF
          84B1DAFD6912A1CE70021DCC8899470BEDBE6B6960D1E1C25C23640B02810718
          AA2199B2689A19C766DE0A90C7D9C409D6101E8244A842C810BC8E1852EBFB31
          6D143BCCA041ACEE603ADD51B685DF338A42BCC4D8954D76867CA1E1844BF684
          5CB60A48D9D2C9E252C5B1523469E034492177612858E3A256AC9E4E999CCBB8
          9059BDA213B1DC65F031424B7BD925E6E55D620E6FF1129DA1375C81E6268994
          F9454CEF12C52ED10F5F98411A8EA0C7ACF564EA0CF1D4F55E4DDBC2A13B696C
          4167A5E042DF85066CDAEFF40043352456D6433EEBB6C367C7A7AEBB6EA7C290
          A05DA720112A0246D836625F5352486DE0465ADAC7CCA72E118D71AD3E744631
          A2897FF1A263BA7A671821B685A22D1470C99E9064AB962D5BC5A2F06073C152
          52D54807AA68E9A64E6F461E916817FFDE79111D37A96B42D42465BA90A989CC
          424C348A72A318810F93ACA24BCC4C5DA2AF8429F1F2ED0C1F01B8BC11131286
          AC518182050BFA5D74D8E2854EA9DD74D91962EC1ABC9DD66E6F1CA6E105FD95
          0DD7150ED70D9B2C374D77D2DC9DC429CA48CB78BBA810432248074921352488
          410C4ADD7136BD8C881A4A8B8EB22D5DBFCC92593BA1213A43CC26A179CA68DB
          42D1163AE1A2AD6094EC064BD4E764D958152DDD44A214D12C3CA2B9C3CBB448
          8A3B2F6271875B384123CAAC8E313C8A6F1A6DC490021291EB0EB9B4E7AF9EA9
          4B2C4ABB447F8B0E9778F9ED0CD3355CBE88F976891E1226272F215E9D66D361
          DD3E6BE89D2C9AA8D7BFA2E5DBB8EF6984419725E1BA66B7828127CB9B32DE34
          226081D83B7C16433A480AA95197B88594BAEB427A19D14848583B56BAB11FF1
          B27786AA33AC606F0B31736970899E10CFB0942DA9594AAD2CAC2C3A8A956949
          5E5679F443BAF583FC3A3A740A347177BB63242153BDA28E5835B5514482A24B
          CC862E3147B1CCD90A8B4587CE97BE3654E2955067186844520631DF2E514998
          EF14466BC31787D20E8D262F215E2BE8F8D3901DF46616ADD4D8E3B4827B9BCF
          5CA22DF40F5760C9F2A1CC8D186F14910212413A480AA92141A43960039D5114
          128629AC4A8C3E8569931717AF5C42BCACCE90C62EB12DE43397032EAB27B464
          4B90A544CA028A00292EBC5CABE43ABF8E0D9D604D289A4D190999DD2BEA8889
          7587DC2856D2BA443A068C22642209734C617A7398D0E4F5088897CE975F0913
          53985A24DA7C89775E626D28262F255E230FD2E7FCF893BC33FC957605A22D0C
          6AB812404C348A480189509778925243824AC2BAF0290C3A5EA317BD6EB624CC
          5A1B865B47351CE2A58D5DB4D0D0DA42824BEF09092E4BB304564EA05A2B2FE1
          F2F26DFCBBF39F1577B88D9B004DD3B2A68E5ED1424C368A856BF18DA21CC45C
          129695242C8CA6306D91A89A437D6DF8488A978E98DF294C2D12C56F623A361B
          CDC7D10BE5CE736965DD8F4F5EAFEDA3F345245EA779677891D67162A111EC70
          F9434CAC3B900212413A480AA92141A48964FBADA35F66693F9D7E25B3F600FA
          6281324D457DF4B5A1357939C5CB1EBBC4B650B685165C62D46AA66996228BD3
          E4A0A66DB2DDBE9ACD9AA0CCD2322E6456AF2811E3B318DF28DA8398AF84610A
          D31689896C0E1F19F1D2F9F29530F1BA59DF72600AA3DFED8A1AE2680E7BADA4
          B5E12B9FD3F9589ABC4ECAB58610AF74035702884909E38B8E715CC290269245
          CAE88A3BCDA1832B2888759CC3F1CE4BAD0D1DE2A53A43B98AD7662E0B2E5BB6
          6CB22C61E25054685BB242BB14745CD0C6CD4999266412316D16934B7BAD4BD4
          252C82FFE273D1CC59C3AC135339BD9BC3474FBC74C444767E17F5EAD0AFDC1C
          36799345BFCD3ACCB49AC34FE9F73B461EA23D5BEC0F74D688262FB5D6B8954E
          E0722226F9E28B0E9AC2CE536A4810692259A4DC67357DBCB49ACC5BC41EA245
          F4DD6CC8B5A15BBCACB1AB5814DF16CA994BC125658BF76C36593A5615DB2B2F
          9524D7AFE0039AA08CEE2E85CC464CCE6208DB5ADAD7CE4F5DA2AF84D1BBB0AC
          8E2D474EBF9BC347B839F4E5CBB74514BF1D265A441ABEEA0F97C357A7D9B4A9
          46A7446BF9BDCEE6F0121D8AA0C92B7DC1E583185240226291A85A44244B2DE2
          5AFA78693B95BE5A04B21ED91E2DA2D61C6AEFBCE885B29ABC5C9D215FC5976C
          68CD5C2EB87CC8927474901EA97BC744BBF653EA521A688A3221643662A59B59
          B3185FDA8B414C758924616A0A132D6269485816AD457CE0F0F58835873A5FAE
          16D1EF590E7B33DFE65D3AB3D16319FD7EFDD0CFE8F5EB9B47ADB5FCCFEEE630
          3DC16521E66A11919458D4234D7AD7FC19258E8F970E33E8F7496904EBC4CA34
          B737875A73982B5F054BBCAA39C5CB357635B5DB420D2E8D2CC194C4A4B4ED9D
          92E4F2C76DEEF8F56DCA9C8859B358537D102B28BB442561D62251B688A5F916
          B14826F1222CA3832F8FE12BD040A41662BE23986B4BCF971BAFD3B76AB49D46
          C718307C0DD8680F5FF6E6F0779BAF74265E9A84D97CFDEED8228A110C896304
          EB308BBEE4ADEE20B1A5B73687D66B2FBD39E46B436DF212E2A5C62EBE2DF40B
          97D22C4553A554704E9C4599D4325FC4D446517689BA84F145227FDD2C5B44A4
          4F6739B287670AC10846C71113B9DC08340D01E04BFC52187D0340A39134D48B
          E546EF55F42D31F666FE14FD52951ABE66C6A54FF1D2252CCE1EC1901A12545B
          7A248E8F17F9168CFFC64AF9687DF8929B43BB39542F94A5788571F172758662
          A1E1844BB67F4EB23ABB3C22D15EDA8FDB94C906D212320B31BEEE707589251A
          86591286A4E422D1DE72508B983D97CD174630175F09BDF90A340D69C417D2D7
          0F4A71BEF8F2B0E5445A4D775D24971BC3765BCB8D1F690FA036F3E9B53974B6
          886A4B4F2B8E1FE58A032923F1DEABE97B145B5807A5CA47FB1BBE2AF0D386B2
          392C603587B436949397BB33E40B0D075C245B1A566E642AC724C5FD432728F3
          41CC7F9728A630D92216D05B44B14524BEF8418E9042191FC4D7A3BADC70F1E5
          5A21BAF952C70EDBCF90CBC397F9F2F08DC3740E561CDB907CA9E546C04949AA
          DB2B0EC1173FC88134912C527E99F3D5791E5FD10FA56F7D2CDFDA63F8723787
          C5F5E6908B5759215EBC33E40B0D6A0B9D70250BA844E0E683587B6BDDC1BB44
          F1EAD992307B91E86A11B5114CF2659DF5D5BF784DE7EB115E1EFAF28564BDF8
          A2E5FC245ACE77FB887E21E5E5ADF24C2FF1E5777918684C52802F6D8528F842
          CA48BCCFC7F46DC02D27D081B1E7BB49BED4B10D7BF8726C0EEDCD065F1BCA9D
          7C82E2E584CB0145179797498447F87107650A31318BF995306D576F6F39F42D
          223F8E482358F6DCA5437214572B7AC597FEF2EBD15ECEFBE50B292BBE50101F
          BEDEA69351DD16F3E5FC36FFCB797B7918684C92C91712F1BFA2DF461F2F31F3
          E93BEDE94B39045FBE6FBE22395F72F8723687F6DAD09ABC74F1D2672E1D2E27
          325592E16EEE9C88455A88B9244C4E616ACB61B7886A0493C77DF396CFE1E02B
          AFE1EB017CD51B46EB68075FFCE5D728275FD31F2DBEA63BF91A65BD0273F0D5
          9D5568E3BDDCE0C397BFE6909F30B4D686B678599DA10F5C0E4CBA26C31DACF9
          43CC2161D62291CE4DF96F11C508A6AD38E81447A8E1EB21F912277B155FAFED
          E37C9DF0C3577A5D6E088FF7C7D7097E907E9F832F94C5E2CB3A7628971BB9E4
          72831FE82DE2E04B6E0EF5E6D05A1BF2C9CB57BC145CC9612A61D614626E0973
          2C12558B28B688CE118C8EFB8A831CE2A094E08B5E311BBE12C9973A396FF8D2
          F9AA4E7C399687FCD8A1581EDACB8DF03AFC4C94DCCCBB3787AEE690CF414ABC
          52132E1D312561DA1466B788AE2DA2DAD2D3897AC78A43F095A74C36FEBD6D99
          B2D0110EC357B2F9FAF9D1E5EBE744F0F580E5A1CF72C33D7CF96C363A078EAF
          CE3E5B0EDF11CC67C5E15C21DA7CF12F6D337C3D045FEAF0A1E26BE24F8F385F
          48D0C55797059E7CA9931BF69BE5309BAF261E7CF90C5FA9DA1C7AB488DE7C35
          117C85E96F99C3AACB531CF92A1ABE92C7D7FABF365FEB12E6AB4C4E8BAFBCBE
          7CB99687BECB8DC860E22BD2DF8AC3DF0A51F195D7E22B94F82A61F8327CA528
          5FA5255FCE975FDA72BE4152F84A5DB8246249E2AB816345AFBD02B3F82A6AF8
          327CA5005F09BD5C76BCFCF2BF9C576F96AD631BD6F2506DE6D392AFCA31DA0A
          B14329F75B669F153D1DF4D55F8129BECAD2AFA8882FE2C86CF8327CA5065FFA
          AFA544F9E32B3ABDF115ED8FAF28FB1755E42B66C397E12B55F80AF5E04B7FB9
          1C91105FF2E55744E0F88AF0FB0ACC794ACAE715B31FBEB21BBE0C5F69C4579D
          24F395FACB8D045E813D1C5F750C5F86AFD4E42BC1C38705FE1A7C1570F015E9
          E42BBFE1CBF095B27C3DE0F0E1830E47051D5F3E47A4BC8F201ABE0C5F862FC3
          97E1EB11E32B91877B839F2FF7115FC397E12B6DF8CA67F88A0CCD6BF8327C19
          BE0C5F86AFF4C697E90F4D7F68F80A105F66BF61F8327C19BE0C5F86AF60E6CB
          BC5F367C19BE528E2F733ECA9C8F327C058A2F73BED7F065F84A01BECCEFA798
          DF4F317CA5155FE6F72B0D5F86AF94E0CB7C3F80F97E00C357AAF365BEDFC67C
          BF4D8AF065BE9FCD7C3F9BF97EB6D4E1CB7CBFA8F97E51F3FDA269CD97F97E6C
          CFEFC72EEAFA7EEC2689FF7EECD41FC17C96F30FF87EEC268EEFC72E6ABE1F3B
          25F8327FDF21F5FEBE83BF576041F4F71D7C5E7E99BFEF902A7C99BF4F64FE3E
          91F9FB44A9C197F9FB7AA9FBF7F55A25E6EFEBA5CC9FD8F3F3472D1FF8F7F55A
          A5D4DFD7337F1FD6FC7D58F3F76153E9EFC39ABF6F6EFEBEB993AF34F9FBE665
          D2C3DF372F93027FDFDC2F5F42C21E79BE447398205F514358A337385FD359D7
          45C4D7A04FD9B0DD6CE42136E63B160BBECE5B7C5DB7F84AA72B8E788BAFEB16
          5FE72941A4896491F220CE57A7B9ACC578E2AB6A57563E9AF3A5AD10F98A23B7
          5C71A8114C6F11FDFD953DB7843910B3294B266ECE8B94F603977FF1726CE6B5
          E6500E5F61D5D4F2900EF70ABE42C0577E5FBE4A952AF557E60BE9FBF0359835
          1A499FD8EDA6D3ABD5DEABD8C0CD6CD82E36F2201BFD2D1B7F8A4D3AC7A6FCC6
          A65D61D3AFB19971E99FAF384A04E92029A4860491269245CA48BCD74AD67136
          6B3E9ED51DCCAA115F59B217F15A71385B44B5A5F79130FB772D1562DA2C6683
          E6F288447869FF6E5D56CC5C2EB8DC9397DC1C5A9B795773682F37385F253193
          660E097B368BE40B8F93E1CB97AFBC79F3125F755F660D5FA74FECB6D368B4C7
          033660237BE573F6FA01CED74936E92C9BFC2B9BFABB73459FEE108B772CE791
          0E92426A4810692259A48CC47BAE601D66B16663A92C55BBB0722DB3642BA2AF
          38B4114C9CE270B688F6415F92306B0A538B441D31398BF95096722EC9A2998B
          DA42075CDADA90262F215EFAB179AD39142737F8F0452FBF725A7C41BF323AF8
          2A51A2041E30F448BE7C09C42223232B57AE5C855BD5F463552C43F04841C1E5
          E20B8923FD62C58A39F4ABCE20D6E0357AA2DABCCB62E6B11ECB58FF0D6CE867
          6CC497ECCDA36CDCF76CE2193AE730F5321ECB0CEFDF7C7CF6ADBFCFB9FDF7B9
          F14FCCBDA3FBFFCC0B4617B1FD9D3C1E6123F80C92AFCBFC70D4194A10692259
          A48CC4BB2F651DDEA717EE284BD518562E3A4BB6C2FE4730AD45B47E51454A98
          EBACAFEA121D882921B3B4CC624D79A78774F983A56CEF20AE2FC8F2814BEF0C
          D5E425C5CBFEB514AB3914C3172DE77396404132670DCB9839DF3319732BBEC4
          8ADE972F81181E4B3CA8D5AB57AFC1AD26B75AE9C444B42272A480440462FA72
          5EE70B35117CE5C99387D519C8EA0F9747383ACDB68F203A57F47F9B7AE989F7
          FF7872F6CD7FCEBBFDFF3E887F6AFE1DF8BF16DC4D172EA245D8081E2920910C
          7E96F3DB29F16E8B59BBF768E1537B00ABD299FA43C997EB2DB3DAD2F32DA25B
          C2E414A677892EC4C4BAC3A165366BCA3B26DAB59F5297B234CB5A6838E07277
          8672F2728997DA1CCAE690BFFC025F4532672D9891EB57A14285C097EF2B307D
          85884F7E3C9FB56BD7AE5BB76E5454D48B96D54B27A60246F0480189209D4A95
          2AF92E0F5101C1D773CF3D27F5AB767FFB1558879972853888AF10E58AE38727
          A65CF8D78C8BCFCEBE9A69DEF52C0BE2B22EBC9D75517CD60FEF8490DF0D7ABF
          835029E085B7113C52402248E7F1C9E7919A5C6E2059A4DC6735EBBA90B5994A
          0B9F17FAB1CA9D58F99618E4F511CCDD22CA831C2461E2AC2F3F2BA57789BE88
          89758793320E9AEEA51ED25D3FAE2EABC8120B0D175CD64EDE5A1B168BB2CEF4
          0AF1B23687567348CB0D79F8907EF90BFA05BEBC571CF8B4C793D9A04183468D
          1A35B1AC69FA3444DEB8716324827490143E375CC317F8421D5013C117E957AD
          BE7285D862825C7160041BB889E69111FB319BFC63E2A99019E743E75CCC35FF
          6A9E45D7F37C742BCFE2F8BC4BEE902F157E37889D4728A25D1C8FE0732FBA8E
          44900E92FA9F097CB98134912C52EEB58275FE8045BFC31A8CA0B280AF72D1C4
          178D60EE16D13A28E52B61B4487476891231398B29215394B9404B09B7B05264
          B5960B0D3E736970D99DA1B536748897B5D990CD61F65C2543428B41D3E9F021
          F195E74FF6A7C70886B6109FFF7832A3A3A35BB56AD5FA91B0686E480AA9A14B
          D49B435440F055A04001F085E2C0F98A63046B3E8E3EBA3BCF653D96CADF027B
          75EFDF471FC9FEEEC9FCB3CF179A7FB1C887578A2CBE5664C9CD22CB6E15591E
          5F64C51DF29577B9DF0B4AE7B189381130C246F08BAF15FEF00AD2415239A69E
          FC9B3A1985947B2C611D67D2E74CFD61AC662F56A983A80F1E277C626B2D22DF
          223A244C9EE5D0BA447ADDEC1F312164969669A0296F9B0CD7AEA3B0926471D9
          F20797F5DB28566728CE6C88C9CB122FDE1C96CE165A1275C8125228639602E0
          4BD4C7A345441FD5AC59B3B66DDB76B4AC533A379145870E1DDAB56B87D4AA55
          ABA69A4324AE9687E02B6FDEBC922F8C60FA297AD9226E61C376651C7FE4B9E9
          274B7C7036E2C35F23165F8E58762D62C5CD8895B72256C747ACBE237DCD5DEE
          F782CC79542A48048CB0113C52587CB9F4A25F4B7E70B6E0F4934F8DFD9A36F3
          48969AC345347C357D8B04FDF96EAC527B511F4BC2C2AD831CF4BB963E1246C7
          7D4597F85CB83588D98889598C6F14FD53D6AAB8C4A1B5244E77077D0E82742F
          EEF056FEC992DB42BB2DE470F1B12BBC8ED519D2DAD047BC447348BF59C9971B
          74384AF1E5DB220A09431F8547B15BB76E3D7AF4E8F90859F7EEDD911452AB53
          A78E122FD11C8AE546FEFCF96DBE5EE84BC781548B18339FD6D4FD37B021DB73
          4F3A1C31EBFBCA8BCE545BFA4BB5E597ABADBC5A6DCDF56A1FC7555B7BBBDAFA
          F86AEBEF545B7F977CC3BD6074111B05194F01236C048F14965FAEBAE4972A8B
          CE9499FD7DC8F883489392EDB99C759AC75A4D660D47D272A3DA4B2CB2ADC557
          98B6E528E15FC2C4BB3079A29E0F6209212684CCA68C4013EEC42DA96E5D8D7B
          4B4596255BFEE1922F948BD4B23A433FE2953D27C48B37877CB9F1ACC597DE22
          EA5B447CAA376CD8F0A5975EEAD7AFDFC081030759F672BA359502D2E9DFBF3F
          108B8A8A12E2259A437CC888E10B7CA9E27009135BFAB758EBC9B445ECF69190
          B0BC130E549977A2EE9233F556FC5C6FF5C57A1F5FA9B7FE7ABD0D37EB7D72AB
          DEC6F87A9BEED4DB74B7DE66CBB7DCE3FE9F803A8F418584F010244245C0081B
          C1230524B2E2E7A8A567AACE3B9163DC7E295E50EDF633A849A6E6B00FABDC59
          AF8FDC72E82FC2B4292C7781CACE2E51474CCD620D5D94292D134EAC092FEB80
          2ED1DE52D0245C5DD6D22C07597C5BA8662E0D2E4767E89ABC4A43BCB2E608A7
          931BFC372BF5FAE82DA22E61F878C7A7FD9021435E73DA887468AE145E79E595
          5EBD7AD5A85143172F14212C2C4C2C371C7C892DA2388828256C39EBBF3EDB9B
          BB6BCCFBAEC9B2D3D16B2E44AFFB357AC3EFD11BFF88DE7C237A4B5CF4A7B7A2
          B7C6476FBB13BDED2EF9F67BD277FC2790AEC21051213C0489501130C246F048
          0189ACB9D06CF9E99A1F7C9771E42EA4C97A2E23F16A3D85357E93A6D1E7BBB3
          CA1DDD7C3925CC3A4E4FEFC2246205AB5ABB448998D528BEC8378ABE94D9A049
          D6942B3A1ECAB52B886B0AACC4A8A59345ABF8E2F5E4CC155EC7099778A14C70
          213524184A6B435BBCA839D486AF84244C4C61152B56442B357CF8F03163C6BC
          F5D65BE23F958D4D27A6C73C86DBE8D1A381183E3ACA952BA7262F7CBC88CD3C
          862F5771E49643BC6886848929ACF7AAFF1DB2A5FAEC23D1CB7F885977AECBC6
          5F63365F8AF9F46ACCD66B31DB6FC6EC888BD9713BE6B3F8989D776276DE8DF9
          1C7E8F7CD77F02E922060483901018C24390081501236C048F143EF9B5F3BA73
          AD57FC5073CE91C75FDECC7AAFA4C9ABFD743AC4820AD4EACBAA76F1AD8F730A
          D38E23A24BCC5731B73588D98889598C6F1469695FAC1E17323765C22DD69437
          931E910857FFD8718526EAE23E64F19EB05894B52DA473860A2E3176F117CAAA
          338C106BF9AC398A660E119BC3FCBEF55112E65A24B669D3E6D5575F9D3061C2
          DB6FBFFDCE3BEF4C76DA94A0B7C93E8644900EF86AD9B2A5EA0CC56B2F215EAE
          E6D029617C0A6B3B8D1689DD97B0BE1F977A675FABA5C77B6D38D36FCBCFFDB6
          5EECBFE3F7FE9FFDD1FFF3EBFD77DDECBFFB56FFDDB7FBEF89EFBFE70EF9DEBB
          DCEF71FF4F9ABBB82F8F41C483C0101E8244A808186123F8AD179108D269B3EC
          44B1497B9120EBBE98CE1CB67A87E43B6A30ABDE9355E9E48F2F398539DE85D9
          AF9BC520A62126D71D72694F6D18844CA7AC44430DB4C63A6EC976794181156E
          E4244BF584625BC8672E1D2E3176E5537095A6331B42BC42FC8B97AF84A92E31
          32321293CBC4891367CC983173E6CC59FE6C76509ADF5091C2B469D3900EFAC3
          4A952A2141A4897C857889CDA1DFE2C829ACFEABB4488C7E9B86912E0B588F65
          4F0EFEA4C982A37DD6FF387CDBF9113B7F1BB1EBF288DD5746ECB93662EF8D11
          FBE2467C796BC4FEDB23F6C78F3870C7F2BB23BE82DF4B73BF4BB75661202404
          86F010244245C0081BC1EFFC6DE8D6F348A7C5A26FFE39F8137A198166189F27
          CDC6D139965AFD58D5AE09D5C7F12ECCEA12AD5DA28D186F1469DDC1378AD42B
          DA424694591DA3059AC65A434E4432BDA1C61461454B0CD10D926669B2257B42
          BED0C0CCE5824BEE0CD119960AC9519CCE448514127FD321A1FAE88B44D525E2
          096CDCB8311AAAF7DF7F7FC182058B34FB309D981EF3071F7C800F0A348ACD9B
          37177089775EDEE2652F12A386D0715F8CF9A24BECBA90F55C5170CC8E2E2B8E
          BDB6F5ECB8DDBFC4EEB914BBEFF7D8FD7FC41EB81EFBD58DD8AFE2620FC6C51E
          BA1D7B289EFCF01DE95FDF4D6B57B7169120240486F010244245C0087BCFA5B7
          76FDF2EAD633DD561D2F3A6E27CD985D17D081434C9D8D46D2C74BF51E7EC54B
          97306BD1A1BA443AD16123A6D61DB451740899A08C0F654ACE84A27151135EC2
          86EEE1BDBEA0890325981258598245A39620CB962DBE8A970B0D6A0B155C79CA
          D0CE3057A96C39D11986D3DA30A4209AC38C098857425DA218C4BA75EB865E0B
          CFE7F2E5CB57725B95AE4CC4BC6CD9B2F9F3E72391DEBD7B474444203571200A
          2923716FF1B2BAC4015697184B277E3BCDC66C92A1D78AEAEFED1BBCE1E4845D
          17A6EDBF38FDABDFA71FBC3AFDD01FD30F5F9F7EE4C6F42371E4476F4D3F7A7B
          FA37F1D2BF85DF49438FB76F8D30108C880AE12148847AF0EA7B072EBFFBE5C5
          713BCF23913AEFEFFF5BAF95F4E981CF1074864D46B37AAFD0DA3061F1722326
          BB441FC4F255E4EB0EB1B457422628135AF602AD3E74D0B8A859B859D049EE12
          E7C5244AC20BDA526563C597182F08CDB2C822D9E23DA158C5F399CB0D17EF0C
          B31741E299B202AEFCDEF5515DA20BB172E5CA0D1F3E1C4D179ED20D1B366CDC
          B8F1136E1B83DE3EB16CDDBA75F870408B3862C4880A152A28B8446728C4EB81
          C591AF9BD12935799306B1365305624FF45DD57AE1E1519FFE38FDCB5FE61FBE
          B4F0E8950547FF58F0CDB505DF5E5FF0EF1B0BFE7D73C177710BBEBBC5FDF682
          63F0F834F7DB746B19431C8584C0101E8244A847AECC3B7469DADE9FDFF8F4C7
          761F7EFD8F7EFC6D72A759B4336C36963578953E589EEF9698FAA85DA2368859
          8D225F77584BFB4A9690F1894CA3CC9233011A67CDC64D79D443BAFDB3165075
          C4F5C5BDF2177691F5BC4596E80969156F2D34785B4870F1D350D98BCA775E59
          0A24A63EA24BF445AC62C58A6FBCF106246CFDFAF55BB76EDDC1EDB3A03711E7
          B66DDB1036FA5B34BA55AA541170899DA112AFC4F255AB0FED123188E1535D20
          860FF92E0B9EECB7B2D3E2AF277EF6D307077F5DF6CDE555C7AEAE3A766DD5F1
          EBAB4EDC5875E2E6AAEFE171ABBEBFB5EAA4F0DBFEFD54B23DA12B8BFB22000A
          E3268584C0101E823C7675F9B7BF23ECF13B4E775D7AE4E981AB69B4445210E8
          E6E3A933AC3B98D5ECED776DE857C2B441CC56317BDDE116B2CA9A96B940136B
          46899BD543BABC8EA73BFEB1E8FD2CAF2516833A56D40D5A9A654D5B52B6F82A
          5E2E34847221B5901C80AB084D5EE80C13C7970762919191A3468DC244035DD8
          B973E79E3D7BBE0C6EDBBB772F8244A808186103AECA952B2BB8909A122FF095
          C8E270C4FACA753D21C61BC50E3359CCFC7FF65D1EF3D1A1B7779EFEF0D0AF1F
          7FF7FBC6EFFFD8F2C375F21F6F728FDB72FA96F49F94DF4E65B76EA46E8D3044
          3C3F5CDF74EA1A8244A8081861775D7CE85FFD56D04203E920A916E36967586F
          189D964F9C78F92266378A391562BC5794425651D7325A7D3841E35E23BF70C1
          82F45AC20B787A7EDBB59FE557CB27987261E5D42C3E6D71D9E2EFB9245C3925
          5C488DAF3548BCD01C26BE3EBE88898D221ECBB265CB0E1C3870E1C285E8B876
          EDDA75E0C08143870E1D3E7CF86B6E4782C0442408E9E0C18340ECF3CF3F47A8
          90DDA14387A22D1464211D0197102FF0F550C5B11123157B939E430C29EDA7B3
          CE739FE8F151E3997B266C3FB5E8E0CFEB8F5DDEF6C31F3B4F5FFFFCA71BBBCE
          DCDC75F6E6EEB371BBCFDD0AA49F8D4318080621EDF8F1DA969357D77E7709A1
          4EDCF143CBB9FB9EECB584DE3B2011A483A49A00AEE1D40FD7E8F9B0F5F1418C
          368A5AAF4842665326B44C074D285AC16AE412374E9CF0424972F5E3FC6A1C28
          E142AD24567C8921344B91A5CB5649248274045C5CBC30793DC487F303112B55
          AA549B366DE6CC99838E0B4FEF575F7D85A7FADB6FBFFDB765C7D2DCBED30C01
          20182006B8B66FDFFEF1C71FCF9D3BB743870EE2D7BB5C7009F14A4271246275
          06D1C77BA3376848897E9BF6D81D6765E832BFECD84DA3371D9FBFFFDCBA7F5F
          DCF1C3D52F7EBAF6E5B91BFBCFDF24BF10F7D5CFF05B69E9072EC429470CFBCE
          DDD8FDD3B54FBFBFB2EAE8AF73F79D7D6BCBF1C8D82D7F133D21524022480749
          21B5DA03D11926AD3E1662D6463147314DC8F8D2C341992D6796A209D6246EB6
          BAD95E2DD16EFF541E8B26AB03AC2CEE25EE2B058BBA419B2CB1CA50B2854490
          0E92E22FBC0A650E490A5CBEEB0E1765E815870C19B274E9D22D5BB6A007838A
          E1C13E7EFCF88913274E9E3C792A0DED24B7EFBFFF1EB7066BDF7CF30D940BE0
          8B810B4162E07291A5E04A4E65EC75C78BAFD0D2BEE918EA15F1C9DF6E3A1ED4
          7FF5FEB0E5ECDD533F3BB5F4D0854DC72E7DFEE3D5FDE7AE1DBC70E3F0CF378F
          FC1277F457E1B7847FF35B6A392E8EDBC1BFFEE5266EFDD5F91BFBCE5CFBEC87
          2BEBFEFDDB82FD67276C3DD162D6EE67FB2E26B2DA09D98AA544900E92AA3330
          F9F5D1105342C6971E9C32A165B45D74812659B370B38993DCB99C63E870DF7F
          E3B882A42952DE85987262A5BA41491664ABB82D5B165CC9AF8FAF90E994D5AC
          5973D0A04162E9B163C78E7DFBF6E1D9466F06453B7AF4281E7540074D4955E5
          C25D702F008E5B63E0129A356FDEBC7EFDFAD5A85143274B972D249522C5F953
          2CEDA30653AF4842F6162D3D88B2F730C5641BB0A4E98C9D93B61E5FB0EFA7D5
          472E6C397EF1B3539777FD78E58BD357F7FC7475DF993FF69FBD7600DC9DBF9E
          4A8E8BE32EB8D7E73F5CC1AD371FBBB8EAEB0B73F79C1EB7F9BB06D37684F45F
          4CA3164225B22650F0480189209DDA0352AA3E72692F7A4512324599DE316AA0
          49D66CDC2471B293F4F5C804DCE75FE6AB28AE9353038A16179C298515172CAB
          1B44909CAC10224BF684E2A8464AD54721E697321886B2A64D9B0E183060CA94
          294B962C59B972259E701087C167F3E6CDDBB66DDB9E6A06F5DCB871E3DAB56B
          71D38F3EFA68E2C489E0BD59B36611111122365FB252162EAD57E442D6E0357A
          3B26B40C8D569B77A10BFFDB6576F86B2B1B4FDB3674E5C177B71F9FB9EBE4BC
          3D3F2ED877FAC3FD67967C7576E5E1F3ABBFBE20FD48B2FD6BDB577D7D7ED9C1
          731FED3FF3C1DED3EF7F7E72F2B6E303961D68367D7BB111AB9E88E18285F010
          A4D02C848DE0B96C219D94AD8FDD2B264499256752D1C8CB842ADC387116749C
          BBA478398992451377002598126AA509568264154A59B812A24C074DB106BD40
          3FF6C20B2F886F12C0A3DEBE7DFBDEBD7BF74905EBD5AB57D7AE5D7197A8A8A8
          CA952B17B74CC4A3B04A55B21C94BDD08F26323CA2A4652369BB8841064F6FCB
          892410ADA7B0B65333B47F2F638F7939FB2F2A3A7C59D1E1CB8BBDB6B2E2E8B5
          2FBEB3B9DEE494F7A8B737D518BF217CF8F27C833E7AB6FB5CD2A9B653290C04
          83901018C243900815011359839042EAD5C79732EA18C55C668166295A29EB69
          57B849E8C8F3480F4D84AB7F2C7F56BB9ABA85B8A3B8BB85159FB3D28AAC8428
          53A029D694154B4373DD5A8524224C03B27C281B4827A9EA0D2345C0D3DB7814
          0904BAAFE6E3E8A9462786C71B1E3D89E4034F7B2A392E8E5B887BE1A6B83502
          4018A456A32830848720112A024E4DB212A2CC9ECB246882B5128A354DDA4AB9
          B84B926BD7C9A980124CF1DD05A915172C7BCE4A3BB25C9429D0146B3A6E0131
          15860A4CC49996959194A163C45C0645C02C036910AC351C41AB03CC3868C6F0
          84377993E443389EF914747559DC0237C2ED7053DC1A0108A610120243780832
          A5BBC187A44C034D2A9ACD9A94B6D01216740EF41ED2AD1F17571322E566CA81
          5540C87A206B01B74031E5A568C4DA407A65567730E9C58B43E909178EA73D95
          5CDD02B7C34D716B048030104C5AA955E258738066B12671B389531EAA7B714F
          D7FEA57E851CF2CA0228C99413AB94F93F3DFBFF711DAA680A0000004D415354
          45522E424D504CA5020078DAED9D079C1445F3F7F77D9EFF13F4E111330A92E3
          91C371C091E3118E9C3992924410044172942C4A16010141320A489020208848
          504EF10114457D501150411113EAE3BDDFDDE2DABE99D9D9D9BDDDDB75B9A2B9
          4F4F75754DD76CFFA6AA7A52ADC6892BFFE2725376FE67E17FC1FF77D0F5FF5C
          F7B8CA859862CBC55242BD9714574A66C92C915F5C71E5E3CA8792D09F01BB08
          FB71F4AB0C3CFADD802357FA1FFEB6DFA16FFA1EBCF4D081AF1F7CEDCB9EFB2E
          76DF7BFE81DDE7BAECFAACD38EB31DB67DD276CB47AD5FFAB0C586F79BBE702A
          71ED8906AB8FD75BF176ED65C76A2C3D5AF5D9C3F10BDFA830FF40ECBCFD6566
          BF5A72E6EE624FEE8A796247A1A92FE79FB435EF84CDB9C76FBA6FEC86ECA35F
          B867D4FABB47ACBD6BD89A3B86AEBE7DC8AA5B1F5B9975F08A5B063D4FF9F7A3
          CB55110E4D082086305DE8487794A00A85A84539BB6047EC8E9DB26B06C03018
          0C4362600C8F41325406CCB0193C266008E66014A6612066622C266338E67310
          38141C90B0FF2E1981B74A152B554C1F754C37A573009810F6E3E85791F97DEB
          E015B73DB652CDEC7B47ADCF31E6C59CE336E679FCA57C13B7149CBCADF0B4ED
          45A7EF2C31E395D2B3F6969BBB2FEEE9D72A2D385865D1A1EA4B8ED47AEEADBA
          CF27D75FF94EC335FF69BCEE64B317DF6BB9F1749BCD67DA6DFD38E9E5FF76DA
          F169D75D9F9B67F6C36F5C96C9FDC8912BCC6F60AFCA00CF29E091C3DFF63FF4
          6DBF37380B5CEEF3FAD7BD5FFBAAD7FE2F7BBC7AA1DB9E2FEE7FE5F32E3B3FEB
          B8FD6C7BF789E04CAB4D1F34DFF07E93F5A71AADFD4F8355722278ABFA92A355
          9E3DCC20E3E61F60C0A567EF2D39C37D2228326D7BC129DB300AD33010333136
          DB8875770D779F056E1BB2F256CF2920ECBF4B46E0AD4AE52A9503A5F641A580
          878109613F8E19536E102710C5C555A37A8DEA0151EBD66D825E021B092684FD
          38664CC135857D0C99255D78AB5DAB76AD80A879F316412F818D0413C27E1C33
          A6100D867D0C99255D784BA89750CF7F6ADCB849884A0083C184B01FC78C29E4
          60611F434694B4F4FBEFBFFFF6DB6FBFFCF2CB4F3FFDF4C30F3F7CFFFDF7FCA5
          0E073EADC60E611FBF0DDE1A356CD4D07F6A10320A60309810F6E39831E5A103
          5F877D0C198937B0F4EBAFBFFEF8E38FDF7CF3CD850B17CE9E3D7BE6CC990F3E
          F880BFD4E1C0A7159934A80BFBF86DF0D6B449D326FE53DD90510083C184B01F
          C78C290FBEF665D8C7602E053D14944D1D6FFFFBDFFF7EFEF9E76FBFFDF6DCB9
          73A74E9D3A74E8D0AE5DBBB66CD9B269D326FE5287039F56649044FE4F80B716
          EEC42910AA19020A6C249810F6E39831A5E7BE8B611F83A1942E5DBA4B972E64
          D1029BF46CEA78C35F01A1CB972F7FF4D1476FBCF1C6860D1BE6CF9F3F71E2C4
          E1C3873FF6D863FCA50E073EADC82089FC752F17EE636287B736EE85C140A86A
          D56A412F818D0413C27E1C33A674DF7B3EEC6330E3EDC89123C0464128E04D1D
          6F8488782D80B477EFDEC58B178F1C39F2FEFBEF6FD6AC191110F8E42F7538F0
          69450649E4E915E9786BDFAE7DBB40293EBE72104BC0C3C084B01FC78C290FEC
          3E17F63158420E0ACAA614DC1459198122BE0B383DFAE8A3A02B2E2EAE70E1C2
          79F2E4C9952B177FA9C3814F2B3248224F2FB78B0BF701B1C35BC7A48E49E923
          F70D1EE92BE91C002684FD38664CE9B2EBB3B08F2103CA6FBFFDF6CD37DF909B
          112EE2C10055891225EEB9E79EAC59B3FEEB5FFFBAF9E69BF94B1D0E7C5A9141
          12797AD137ECE3B7C35BE74E9D3B85923A77EC4C09ED2E3A750EFB71CC98D269
          C7D9B08F21B8C572BDE4975F7EB970E1C2A14387C8D0081AF163400B98FDFDEF
          7FFF5B2A5187039F566490449E5EF40DBB517678237AEECABF9051D7CE5D2921
          D4EF197CD88F63C6940EDB3EB95ED768E7CE9D03070EAC58B162560F51611366
          8A178A08798F15DED64B7EFAE9A7B367CFEEDAB56BE2C489B82F4247F420337A
          F46840F5F3CF3FF3973A1CF8B4228324F2F4A2AF1C9FE4E4E437DF7CF3E8D1A3
          870F1F46FEA046049F70E0D38ACC3BEFBC63B6E2CB2FBF44C3EEDDBBB76DDBC6
          DFB7DF7E1B8E37937FF710AE9504F29754A22E9707F56B15AEB0CFA1CCE2BCB4
          DDF2918EB74F3EF984EC254B962C2E13C1A409017D5A44907C2ADE2CD74B7EF8
          E1873367CE6CD9B265F8F0E175EBD6255B2B5AB4E8EAD5AB0DB31C0E7C5A9141
          12797AD1170DD45F7AE92582CC175E7861DDBA7548AE5CB972452AAD5AB56ACD
          9A35EBD7AF7FF1C517376EDC88E4D6AD5B95DAAFBEFA6AC99225C4A843860C19
          3C78F0A04183F83B6CD8B051A3462D5FBE9C5633D8C0156781EFBFFFFEDB6FBF
          BD74E9D2D75F7FCD5FEA70E0EB17E5DD3F1D36972953461D1AEA70A4398026EA
          96E70037DFAA85339335D3E5BDC942FB0D515ABFF4A1C21B73B763C78E2E5B42
          404DF1C8924FB5C872BD8469FAC1071F6CDAB4E9B1C71EC3FBE5CA956BECD8B1
          96930A3EADC820893CBDE88B860913268C1B370E848013D0F2C8238FF4E9D3A7
          77EFDEBD7AF5E26FDFBE7D070C1840971123468C193366FCF8F193264D1285C7
          8F1F07FF4D9A3449484800C6F5EBD76FD0A0017FEBD5ABC7DFE6CD9B13BB9E3C
          7952079B5C91BF7CF9F2B973E7003C69E4891327F84B1D0E7CFD8ABC4B60C35F
          1AD8E6AFE2F86C321C4D69728EB779F3E649476BA62B452A700C7ACCCCB02321
          634A8B0DEF2BBCE12E5C0E0831394291256F6BA6D9BF11FB594E2AF896FEAD73
          E7CE1D3A7468DDBA75822F6AD3A60D6781AE5DBBA28DEE8D1B37AE5AB56AA952
          A562AC88195EB3664DC2570257E5D980130E8DF30831E7BE7DFB5E7EF9E5CD9B
          37F3973A1CF8B422235E2E8DCB522470B26FB23C9AC2F78937D09223470ED5CB
          9A998A3708BE02982533EC48C898D2F4855352211DB20CDBCC84D84E0F4594BC
          B2C872BDC49CBF1195594E2AF896F91B4E091056AF5EBD902F023FA0AE51A346
          6803B4AD5AB5026F40AB69D3A64F3CF104C91ECE8ABFD4131313E1A3B36DDBB6
          449B29DA457940052E884B172D5A347DFA74BC257FA9C3814FABBA1CEF3E04E2
          BE74822347C7A6C9866CF0F6CA2BAFE8A012B264EA78530043D29219F8240E2E
          690AC90DBA75EB56A44891BFFDED6FFCA50EC75B3F47C2AE94C4B52764D80307
          0E7432B985067A28A2E4553069B95E625E9F7CF3CD372D8F1B7CCBF5C9162D5A
          1013823A9FBF184803AEC08C089050139708A80841DDD715D2121CF8B4B66BD7
          8E88F4BDF7DE8343F84AD0881F035AB366CD42E081071EC0B5F2973A1CF8B422
          8324F276F0B06FCAC49B37BCF1AB9364FFF5AF7F350C150E7C5AF51E7E0873DA
          5E7D5C865DB16245E7F35B9E828F28798537CBF512F3F5B7D9B3675B1E6FF896
          D7DF9292924005E0F1F98B114F020F424A4E7043860CC189F1D7469E56908C27
          DCB871A3DC0443144AE88837036068AB51A346850A15F84B1D0E7C5A9191DB5F
          DCF607DDBF79EB1589F1642A3974473EC43C0AC189CDC1A15557E887B02BA5DE
          8AB765D859B366753EBF655D3EA2E4D5F177787F49CF9E3D77ECD861F82DE0C0
          B7BCBFA47BF7EEFC34F83D9F78C31121DCA3478FE79E7B8E38D04917344F9932
          65E5CA95F8D24B972E8173B23502485401336645AE5CB9F84B1D0E7C5A914112
          F990E46F96BD5C91B95EE2D8C3381273B901699631C82B88FA258CF2DACB8E45
          19DEBCFD28E6FB27F1152B56AC3879F224B396BFD4E178BB7FB26F2AF904CFC3
          A9B46CD9B2B973E71AE79515CDF390E0EDEBAFBF26C1DBBC793358C54F02C5F5
          EBD75FB97285BFD4E1C0A7151924DD780BFAFAA440C2D0CB25A0B28ADFC27C3D
          C0B1877124E6729FFC7C4E3864D499D2B930CA6B2C3D1A4DF1648AF7E771D2F9
          7C805C3443D2277890918B6C245A4B972E3D7AF4A8CF2EAFBFFE3ACE70CB962D
          66FFA63B61EA16FE2D25D8D7DFAECF8DB4A4668CF35FC55FE1C08A430FE3D411
          B95208247C8E1619391E7E09A3BCEAB3876F84F512A1F43CFF366CD8B0112346
          C82AA23D8D1A350A49007CF0E0C1356BD61C3B76CC6717108E247FCDF99BFB6A
          442A51B7C8DFC4C23C694937DEDF262A964759049CFC1E4A9B4DAB811930DE1C
          7A18A78EC895425EE7531219F949FC124679FCC237A2E97A80CDF33842013FDF
          3D2A959CE04DE8D34F3F5DB76EDDB66DDB7C76D9BA752B925F7CF185797DF2AD
          B7DE5262D42DD6272D1162031EBD2926A6A85EA4293D7833A0D7A78C62068C37
          871EC6A9230AB17FAB30FF809A919175FD3AD0EBDD96EB25060AE0FD2501E00D
          F748E0079074CC98E9CD37DF448658516E8C345C7F8348D560F257368DD7DF6C
          E061DF64009B825C6078CB6322277853BB0B186F0E3D8C534714E2FC2D76DE7E
          352323EBFEAC40EFE7F2F6A3A48702C35B8AE71EE5F5EBD7DB400E3EAD2FBCF0
          82DCBB1CC8FD253738DE82EEDF42BA3E5966F6ABBA0788A0FB8FFD95B75D2F09
          22DE9C938CEBE38F3F16C849D2855FBA76ED1A7F2549834F2B32BAEFF5EFFEC9
          08C19BAE3923E3C9A0E76F29A1BCFE5672E66E73C41511CFD7F82B6FBB5E1246
          BC41172F5E94C0D24CF0CD4FE5F8F77C4044E14DD79F31EB25415F9F4C09E5FD
          25C59EDC25C3D625FFFDEF7FE7C89183295BC24354D884E96DA891206FBF5E92
          7EBCE981A25F601322973B7BF6ECC183075F79E5954D9B36F1973A9C3F96404D
          9073FAFC5B04E24DFD247E090758827DFD4D5128EE9F8C7962878EB7BFFFFDEF
          D9B3672F59B2646C6C6C5C5C9C5C07A3C2264C9A10D007A9E4CB962DEBFE5498
          87A8B0692F1F74FDF6EB2541C15B0690F3F99966A606777DD2BE57C49560DF5F
          A2F8B7DD761B56738267CEF1973A1C6FBF82136194179AFAB2C21B733777EEDC
          CCFEF8F878F3374C60D284809AE2221F1B5BDEDB5B646832CB87487FA8D74B22
          1A6F2941BDFEE6B329B28A9FEEC8E7FD932ECF4265CE9C39414E850A15D447B3
          A8C381FFB7B44B9D4A9834A67EFDFA8D1A35E22F75B330CAF34FDAAAF086BB40
          67555B420031E94E856154B325047479A51F8051974F5B5261D35E7F952A55C4
          5E39086C1AF4DFE878BB614B2087CCF660F2179C30B1E2AD083EAD7A1736EBD6
          ADDBB265CB5669090E7C5D18E579276C9661930E11A1B9BF0D644B0820F66F0F
          51A955AB76EDDA756C0A02BABCE80727C0A670E1C2393D44854D98DEF4D7AC59
          8BF34C912231B93D44854D98BAFE50E32DCDED260E885C2B802E814C91D23730
          85026FC4814C471B9F43AB8A1545382929C9F2BD63F0756194E71EBF4966648E
          1C397032B51D1062393C04421A3468E8B32026F24A3FDEA948D90AB93A8EC937
          F1154ACE0E238A948983E94D3FD02A5EBE4AEE4E63F34DDC4DC99534AA58F9CA
          3075FDA1C6DBA54B97AE5EBDEA7E16CE1781B19F7EFA49D615FDED1220DE2A39
          2099A04EBEEE2B92D28B109F33227F7DEA24A5E667E0AF4F9D411C6700E996BD
          9804D2CC459B77B6D3AAF25B2AB8B25EDE8956258CF2FBC66E901959B0604154
          39F9781062728DAB418306CD1C106222AFF4E3960BF4985A64F9F9C2CF7D5E68
          F12705179CCEDF652C4C6FFA0161A15E4FE8F205EF1F0F53D71F6ABC7DFCF1C7
          E7CE9D03423FFEF8A30D72AE5DBB066CC8BD3FFDF4D300BA0488B72A0E48E6B1
          93AF8D8AA4F42A5C3A36CFE01577E72EE05367A152E544D2A74E40052C4B69C4
          264CB34E8237B3244CA5D3AF74CB49A285424008B38E77A21519D149E5C1071F
          1CE89D6855C228CF3EFA05999130E555363E0931599707BA6D1C106222AFF4E3
          93CB2C385162DD3731AB2F1759F965E1A59F159CF61A4C6FFA131212CA2C4C23
          5FE88903F2A610A53FD4787BEBADB78E1F3F7EFAF4E9B367CFCA8DF9661F2577
          429F3973E6E4C9936FBFFD76005D02C49B936F88CA3C76F2CD0D91A40BB33F67
          FBE1316BBE2934F778F1E2C56D741263E44A9524BEB7D109E19AF2E6CD9B4D23
          36619AC70966F2E5CBA74BB20953E9F42BDD729268A110F8F97C470D32A293CA
          C891236DAE0BD1AA84517ECFA8F50A6F0D1B364C744088091EDAB7EFD0B16327
          9F05319157FADD2789E5A7EA6CB912F7E2B7C5D77E03848ACC380ACF9BFE162D
          5AD67DFE7D5D3E66D65B3075FDA1C6DBCB2FBFBC6BD7AEBD7BF71E3870002081
          2220A4902337F5039843870EEDDFBF7FF7EEDD3B77EE0CA04B807873F20D5199
          C7F51D90F245B90B172FBCE4BF31CF7D0A90EE6BDA178EA54EA67EDE98924816
          F548E66AF6301C4B9DD2CB9DBB2FFBA2D0C20FDD814A6A11B76318274ECF2C09
          53E9749E6E394CB494E769E49DC42128FF3662C48829DE8956DDBFDD3D62AD8A
          27D1D3D4012126F15EBB76EDBA3920C4445EE907548DC62E6EFBCA774DB67F57
          73F39552EBBE891DBC00A637FD5DBB766D3979852E5F65E43298BAFE50E36DA9
          175AE69D02E81220DE9C7C964DE6B1931FF83A8A5A742CF4F80EF013FFF0D432
          93B6155972B640F96A963A1B26752F32712792351E9D113B754791A5678B54AA
          6DA9537A910D965EFF6D91955F9121B89304C2954567609AC789DB344BC2543A
          9DA75B0E132D51C8B9DFE66B75B4EAF95BBF7EFD667B275AF5FCEDAE616BD47A
          0919510B078498AC67903BF576408889BCAEBF59DB8EAD262D6FB7FE8326AB4F
          D71EB32CB14D477BFDDDFB3ED279E60B492F7ED47CDD99C653D7DFFFD02306FD
          A1C6DBA449931E7FFCF1D1A3470F19328463D8B973670EBB64DA59B36665CC70
          E00F1D3A74CC983113264C983C7972005D02C49B933440E6B193044024E95276
          C68152F392A924346D557CE17BF987AC36EC4BE92C3FFB8DB2CFBC43A56552D7
          128B4E1718B68640CE522744985775D395F22F7E0B442945565C242987691E27
          C7CB2C0953E9749E6E394CB494C36456597EAA0EBE797D72FEFCF98BAC08BE61
          7DF28EA1ABF5EB0184B2F65FEA42405FAFEFD3A76FBF7EFD6D0A02BA7CE8F487
          1A6F00839320086184FC88EC545FD6023FFC584088566490ECE7217FBB0488B7
          C60E48E6B1FBDB18BE8A481ABAD7EBF270D1659F91CE010C7B9D2DFB8E28B6FC
          F3DC4923EBD5AB67A9D31DE4995004CFACB34183866649984AA7F374CB61A2A5
          12427E30CEFD2DD3121CF8E6EB6F0F3FFC3071CB8AB40407BEE1FADBED4356E9
          D7BBF1E76D6D0901FD7A340819644B08E8F2A1D31F6ABC313642188E36810FE1
          AB79A919FCE4CF9F9FB41F0811748839FE7609106F4E9689651E77EFDEC36711
          49B3867ABDDC2B22B9EA77C5247B9DAD1E9B8664BEC4EEAD5BB731EBC4DA86DB
          AE246CBD52FD2577213D28BCEC9C5A6ED675B66AD5DA2C0953E9749E6E394CB4
          0C0B9EB2444EA829EBE0F6F79700DA679E7966EDDAB5FCA56E797FC9AD8FAD54
          7893FBA7381D90117530114C9ACCF75B314B060F7E6CE8D06186029326B37C88
          F4871A6FCC31CEECF828B960F397BFFCC53CF3C14FAE5CB9F8D508A6DCD7E9FD
          EF1220DE5A3A2099C7C4033E8B485A2A69D47D20BEAB50F5C6FC54F63A3B0F99
          54E2F92F4AD56F9B94D4D1A093534BD2EEAB9436BBBEA324BEFC5DC975DFC034
          8FB3478F9E6649986A9CCED32D8789560017F49C0BA33CEBE015FA6D31EAFE60
          4E0A38CFF61EA2C2A6FDFDC41D3A247104867A880A9BF6F241D71F6ABC952B57
          2E262686131687F16F5E9E15FEEB5FFF0A7E48260B172E5CA64C9900BA048837
          E759D98001037D16FB4CAFD9FD0F91AD954C68AD722D6F7A7A0D7DBCCA82E4F8
          960F74ED7ABFBFD9A3C3713A4FB71C265AA1BEFBEC9641CF9B6F438B84E76BFC
          950F35DED8E97DF7DDC72FF28F7FFCC366F2230C7E3811102806D02540BCB577
          40328F870C19EAB388A4BDB62A53B634ED3DC489CEFA735FED356EA6139D018C
          D3AF74CB49A29561788BEE927EBC810790F3CF7FFED3E7FCC7E5CAA75203E812
          20DE9C7CB357E6F18811237D1691FC53E8F42BDD729268857A22FEFBD1E5D7EB
          5637F5C983FD57AE5CB974E9D2571EA2C2A63CCFEFF066DC30EB0912DE40CE4D
          37DD649983990987067E02E81220DE6E580A20DDF279FF64C6E3EDF7DF7FFFE5
          975FBEFBEEBBF3E7CF9F3E7D3A3939F9E0C183FB3D44854D9834218098C5DBAC
          224A4FB85D6BA84B463D8F9392F2E187670CEF87852387D83CADF5D63F57C965
          4B64089C17F99BCB31D9E34DEE55FFF2CB2F4F9E3CB967CF9E55AB56CD9D3B77
          D2A449633D44854D9834218018C2968E2552F458B9EEA0D0E1C387172F5E3C64
          C810E297F8F8F80A152ADCA451D9B265613669D2A45FBF7E88BDF6DA6BD7AE5D
          0BC5305C13274E344FF7891EB2E4EB47E4150F99951AF9AEEB6033BF1ADD0D2A
          97F193A886D63F570121254B962C6722014F81E265F20C7A3E67C1A2E6A6EBBD
          62CB5F2FA94D367863A6CA772D385C4C622653EDDAB5C9E381F4FF79482E19C1
          A40901C4E4A31606A844909EA0E2ED934F3E79EAA9A79A376F7ED75D77DDE427
          31D4C4C44426FC891327828937F77F135D6FB3E46B47446EE4312B35F25D2936
          9FFE30E3CDD09A1EA7AA1327D4091326E81F83B524AF62E9C61B6E2D47938762
          D67C93BBCFBC98981833DE4AF59C587CEA1E29D4CD78FB63BDC413B6E11C98AF
          070E1C58B06041DDBA75EFBCF34E6F59034D082086305DE8A802B9C8D2130CBC
          9122E2A3EAD5ABE72FC6BC11CE70D6AC59E62F7707406EFBD4276984D42742AC
          F9A94744B51A3E2962C1F720CAE623559678337CC22A90D99F164571717192AF
          DA40CE4E2CDD78BB274FC14273DF2D36766391A567B3576E6AC61B30ABBCE5A2
          14EA78391BBC91FC108F71569A316306E190935C1D3184E94247F5BC4964E949
          1FDE80C4A851A3B265CB162CA4E974FBEDB7136D1A5EB91908DE523C1E490E81
          C15F59F05D29017471D97E84D1BE153A74E850972E5D70F1FCA5EE2FDE400E13
          57FDCCD4DF7DF75D4BB0D989A51B6FF912BB177DEED3B2B5134B3EF444E1E907
          73E7CEED2FDED4F56E02B0EFBEFB8E01AF5CB9B27CF9F24E26B710C274A123DD
          FFE7A188D21330DEF069C4A840221448D3294B962C3D7BF634BCD4D06FBCF9E5
          AC52FC77892E2BFFA6E3CDFE138DC04CE9A4EE17DEF6EDDBC7CF60F899396ADB
          B76FD777E75B2C18F99B6A2A316C45DE1ED30A152AE417DED4FD5CBFFEFAEBF9
          F3E7F7ECD94372E27C720BD1858E74FFD54311A52730BCAD5FBF3E4F9E3CA146
          9A4EB8D0F9F3E79BBF39EC146F29FE246329FEA77C96F99BC29B7D7607E9D73A
          DC5FEB738CB7A54B97EA37F80D1E3C58BD6D9B4D5A655F8EC4828A370844E56E
          703F899CF3FC4DDDAFFCE38F3F9E3E7D7AEEDCB9F7DE7BAFBFF39B2E74A4FB8F
          1E8A283DFEE20D3F939898989148D3293E3EFECC993301E2CDF96263004B9A86
          F54903DEEC572F5302F56FE4E2AA17BE0B0F463F42443D68DCBA75AB4331BFF0
          6626052A9D8A8FDB94BF6EBB7BEEB9C7A697AE5C3D8F43F8949C9C9C9494E4EF
          E416A223DDAF7828A2F4F885B7575F7D3583DD9A99EEBAEBAE356BD6F881371B
          F2F6650C7F8FA61C44C3F537FBD634D7DFD291BF8D1B370E6D050A14F8F0C30F
          95CDD46551A477EFDEC27124E6186F7E51FECE63F3D66EE3F0FA9B7ADEF4D2A5
          4B070F1E74B82C61263AD2FD9287224A8F73BC4D993225BC48D3A94F9F3E0E63
          4BBBA31030DE2C3FA651A3460D833638D294C78A54AB57C7EC2C7F231AD451A4
          B0A48249A762E9B93211A4A2DEA7F0D5575FEDDFBF9F2C22B0F94D47BACB3D56
          11A5C709DE98D93D7BF60C37C48CD4A44993AB57AFA60B6F2EAB8FD104863701
          9B594C4065F9C901D5EAF28479F9F3E727BEE2AFAC6A38999D669D7A5C6A43B7
          C5D533339DA2C2433D7BF6AA5BB79E14EAFA11B76932787833CED5FB82647E1B
          1E87714E74D47112397A7CE2EDDAB56BAD5AB50A000FD9B3677FE8A18766CE9C
          B965CB9663C78EBDF3CE3BBF6B74EAD429983B77EE5CB0600162850A150A6017
          4C5777489CC178B3EC62FF110FFB560056AA54A97C0F4EC9DD71E87DCD7B5387
          1300DE56AD5A25DF59F631FECE230A3CFC54CE76C6AF753AC71B2832F455B8B2
          6902608657F75C879CA65CBD0F4FE2B7F4CC6F3D0E8C1C3D3EF1D6B56B577F61
          D0A9532777FAED27BDF6DA6BE411FEEEAB5EBD7AF6AFAFF47D2CCCCECA897C10
          F1864F2B3C66558141F315E4E0F8853712330EDFE79F7F7EF6ECD9A3478FAE5D
          BB365FBE7CE6DDFDE3AE1C05FACD2A367E5DD1B16B0A3D3A3F4FD7517FBFE38F
          D536877833234A08BE4D9380EDF9E79FFF5F2A51BF0E394DB97ADFABAC4FA84B
          9DFE121DF5758EC8D1638FB77EFDFAF935FB070F1EFCE9A79FFA8B349D2E5CB8
          406EEFD74E71BF36B99CEF63E117DEBCA57CE9C11B6164D1A95B75C8C1718EB7
          0A152A103C7CFBEDB7CAE63367CEBCFCF2CBB216A2E8E6DC31851F5B5462CA96
          DA8B5EEFB9E1ED5A0B5F8F19B522DF83936FCE5D4419EEA410255ADA2201A4B7
          2697E7738DFAED88D4E5238FBA72F53E73597FAF56AD5A60F39B8EFA3A7EE4E8
          B1C1DB534F3DE57CD2F7EFDF3FE04BD266BA7CF9F2D0A1439DEF7DC0800181E3
          CD40198F37BC59F159AFEA9073EEDFDAB76F8F5B13174FE83F6DDA34496A2F5E
          BCB87BF7EEFAF5EBCB8E6E2B57ABF8E3EB4A3DB93DF1B9371EDDF276D741A376
          9FFC74CABE0F4A4CDC50A0EF93B7C494774506DED4F73AE4FAB2FD27E96C888E
          FA75EAC8D1E30D6F449B59B2647132D74B972EBD6DDBB660214DA723478E2424
          243884DCFAF5EBADF196310B6BE9CFDF14E49CE76F55AA545176921B54AF5EDD
          E579C52A51259C9F7FFEF9FDF7DFAF59B3E63D3165FA6D7E77F88E537D5E3ADE
          66F1DE9C25DCEF332E5CB4D89EE4532BDEFEACF453BB8A8E5C9EA5A0D33BA743
          8A37F53D2AB97F6AEFDEBD64F6FE4E6EBAD051BF0F2B72F458E2EDABAFBE72B8
          80D1AB57AF103D47A368CC98314E46922D5B363C76D8F066B93EA91065BF7AE9
          4AC7FAE4E8D1A3533CCBFAA470BA72B99DE5E9A79F96CD6E8F3C76F8D3CB8357
          BE72CB3D695E56F7C2AE7D4BDF3A9BB7DD40877B0C75FEA6BEB798927A7FF0B0
          61C3FC9DDF7431DF671C297AACF0E6704172EAD4A921459AA2E79E7BCEC978E2
          E3E3CD895CC67DFFCD7CFD4DC85BEB1FD7DF6C8AD89096FEB0CC435DBB76B5FC
          990DFC7A2DDA598AD568DAE6BA5A879606B43E494A69B93EE9BE5D4853AEBE27
          9C92FAFC0BD172870E1D9C4F6E84E9627E8E2652F498F0B67DFB7627937BD1A2
          45190336A18D1B373A19D5C2850B4D780B05F983C32E5DBA74EED4B96352C7F6
          EDDAB769DDA645F3164D9B346DD4B05142BD84DAB56AD7A85EA34AE52A952A56
          8A2B1F57AE5C39F3E476799C957E23984B3DA71796928A2B7FAFBF09E4D444BC
          0EB6B486147B7297BE1779BEF3E4C9939D3A757232B91143D8DB73A211A127ED
          7C24382C5EBCB8CF693D63C68C5082CB9AD6AE5DEB7360D9B367373C35177EBC
          75EDD2553E79D1AE5DBBD6AD5B376FDEBC4993260D1B36AC57AF5EAD5AB548BA
          E4CB52E5CB9737E3CD951A19EA741D7226CB2C7F721F7638EF628A2AF5A23755
          EA39472F7AD3030F74D38BF958959CB95BC75B4AEAFB0B2E5EBC386EDCB862C5
          8A799BD934218098FD7B10C2AF27EDD17572D3167A4232871D104ED5E7F0D43D
          8356F6058BFCF46FE9C19BFD833CD787E3A1C2850BD7AD5B577DE18D3A1C6F10
          F2BB8B77B0E99033804D871CD969C1820573E6CC992B572EFE52375FF62833FB
          5503DE52B4F7F32427274F9C38B171E3C624ABF263536113264DCEDFF3134E3D
          9A6957AF5EE538D8CF66664B4826B0631A3972A4FD08B366CDAA5F034CF3D339
          3FFDFB90F46CC93DFE4AE08F876E828A376FC3D3B33B765DB66CD93BEEB843BF
          01823A1CF8324843777FBBD8834D8A25D8A490AFBA1F48CD970F3C17295284BF
          D4E1A8FC564AECBCFD66BC0945CFFBF05269D6AC59F653B968D1A29F7DF699DF
          100936D5A953C77E9CFAE5B8EBF6994FE7DECEE58E245DD7C1667EC4C60DB90C
          C71B08F176AB117CB9ABDDD0DDDF2EE9C71B006302B99F822B55CA7D89BF6851
          3806BC55987FC01BDEA284524DFBEDB7DF7C3E6B430615EEE1BAE98D37DEB01F
          E7EDB7DFAEB238B77D96A773CB73B953499F8F906614DEE4D4C0F05CDE895639
          5FA8BEFE76B97E20D387371402330E2366F2973A1C03DEE217BEA10C8F4A5278
          DBBA75ABFD24EED5AB574AC4D0E0C183ED473B77EEDC3478F3763A379CCB9D4A
          FACCAC8284372996171814DE70BFF6F7D1D28A8C6EA3BF5D8282B79898183C9B
          7AFA9B3A1C03DEAA3E7BF806C15B870E1DEC67F07BEFBD176E94FD41B82FFBD1
          C6C7C7ABD9E5E374AECEE5CE257D7B9EE0E1CDF242B98E37FAFAFC9945468DD0
          DF2E1986B71A4B8FDE0878E3BC6CFFE61FC3A25F24D0E8D1A3ED2127B79BB88D
          B43F9DAB73B973C90CF36FF6378285056F81AD4F4AFE56BC78716056BA7469F7
          FD6BC58B9BF3B7DACB8ED9E0ED9FFFFC67CE9C39394A090909F2B5202A6CC274
          F2198A48D023BFDA9A356BECE7EEDB6FBF1D6E7C19E9C2850BF6637EE28927AE
          E3CDE7F452020E25332C7F7382B70C8E2703BEFE6673F38D2AF556BCED0D6FB9
          72E5E288F5EDDB77F8F0E113264C98E6212A6CC2A4497F1D8B0D85578FFC6AF6
          CFDDD037DCE0B226FBA7CE99D521C45BC6AC4F3AC15B06AF9784B434587DDC8C
          B7BFFDED6F254A94E8D3A7CFE38F3F4E5EBE78F1E2E5CB97AFF410153661D284
          0062DEBE2418217AE457B3BFA7C4F0228CC8A1575F7DD566D844C8D7AE5D0B15
          DE5232E4FA9B4FBCA564F8F5003BC353EF7DD1496FF279B812D79E30E38D593B
          70E0C09933673EF7DC73AB56AD5A6D229834218018C2DE7EBB48D08369E7CE9D
          B30FCC82F8605BD0C9FE1AC6E1C387DD4686287F73991E8753C73483F19691D7
          BB6D1CBB80CD7CB7A734995F5E660E079ABE70CA8037A2321C057317D76139B9
          D514470031842D03B908D18369F63728376BD62CDC98B223FB4878FEFCF96E23
          43B43E69B972185CBCF9281A7E5C19753F974DE2EAF27EB7A7B78F411BD2DD16
          1BDED7F1F6CF7FFE93A3446CE6CD9398BD0AC274312C57448E1E4CB37F8E7BD8
          B061E1C6941D2D58B0C066F0A03154D7DF7C789EF4E04DC38325FD01002B0859
          0B7B213FBA6897E0BD2DCCDA377935473B56AD5FFA50C75BCE9C39FBF6ED2B5F
          545BED80E46B6C74511F498E343D9886C7B399B2CF3EFB6CB83165473B77EEB4
          5F3209D5FD2521C59B4B8BCA0C73577F1EC7B0EB56AD5A89F2468D1A252424D4
          A953A766CD9AF673DD79171D6F36D0B5697282B7B65B3ED2F1C601193E7CF8E2
          C58B9D4C6E2184E942477D1791A307D3EC9F2EDDB2654BB8316547A74E9DB219
          BCDB21E93F7910EF9F0C1DDE5C5651994EEA791CB5D3F6EDDBB76DDBB6C58827
          EAAF3D5E6BD9E16A0BF6557C6A53D9910B2B364FAA56AD1AFACDE3942EFD273E
          3565DF7BA3B7273FBAE160EFE53B93E6AC4948EA66D92563FC5B876D9FE878E3
          143061C2041221E7F31B61BAD051DF45E4E8715FF3B0FD6EDBFEFDFBC38D293B
          3A7FFEBCCDE0DDA0306329CD8FED857C4886186F969FDA31CC6035293B76ECD8
          FEF1398DB77E527BDDA92ACBDE8A7BE640D999AF949AB6B9C4C4F5C5472C29D4
          756889CA352A55AAA40F922E439F7CFA99E4CFA71DF870D48E77076E38DC6BC5
          DE2ECF6E6F3B6F63B3E92BEB0E9956A97E6343978CC9DF3AED38ABE3AD4D9B36
          D3A64D5BB972A5F3F98D305DE8A8EF2572F4605A7C7CBCCD943D76EC58B83165
          47DF7DF79DCDE0EFBAEB2E57FAF76141E9C31B0EB34183068D1B37F18637DFFB
          4F8BB7663B3EAFB3F14CA515FF29B7E848C939FB62A66D2F3461438151ABF20F
          5D9ABFF7E41CF5DA9AF1B6E4C4C59987CF8EDFF3DEE0CDC90FAD39D075C9AE36
          735F6A3C7D6DC2A4E53587CF2E7FFF006F780BE9FA64975D9F453DDE4A952A65
          3365DF7FFFFD7063CA8E7EFFFDF79B6CC9150A0A787DB26AD56A24480A6FCD9B
          B768DDBA4D7AFC1B9A3B4C7CBAC1D6CFAAAEFB20F6B9E3259F395474C6DE4293
          B7E51BBB3ED7B0E7733EBA28F7C33373B6E95FAC6255F53A4ABA8C98B9E09977
          2E4C7BFD93513B4F0ED8F856CF15FB93166E6F317343FDC92B6B8E5D5C65F8BC
          B887C694AFD3407F8365C65C7F7B60F7B9A88F276362626CE6EBC71F7F1C6E4C
          050F6F7126F286287BC9C0AEBFC5C757B6C41BA954C0F91B9A5BEEB95877F3A7
          F16B3F28B3F49D12F30FC5CCD85B70F2B6BC63D7E71CBA3CFB808539FBCFCDD9
          69D8DD95EAEB785BF1FEE579C9E7A7BCF6F1881D271FD9F0A6E0ADF9CC0DF526
          ADA8367A51FCF0F9E5FB4D2CD1AA9B35DEAC6ECE4A7F9394EE7BCF47FD7A496C
          6CACCD7CFDCF7FFE136E4CD991EF7852A8928738CD33F3EEAA9840A1C2A6F0F5
          632A1CCEEE4CB8622DEEA750615397F4EB2A99BF784BF1677D12CDCD775FA8FD
          D2A795D69C2EB3C48CB70539FACDC99134147B75BC2D7FFFF2DC635F4C7EEDE3
          E1DB4F18F05675D4C24AC39E2ED7F7710CF786379B4716EC9B62628AEAC50CB9
          9EFB2E46FDF580AA55ABDA4CD9A3478F861B5376E47BBD0422602B51B906690C
          9115277BE61F850A9B306952CB71542AD56F4CF6E20EA8FA4D64DA51A8B83749
          69EA37164941C5D2A54B89136EBEF966FEDA7C2254F056B162251BBC91500570
          FD2D2C78B3495CED9B0C60B384DC83AF7D19F5D7BBA3FC7A80CBF3F6F6425D87
          E6EF3DD99DCCF49FEB9E82FDE6506113264DEABDF054EA0E995673F86C7218C2
          2A661E850A9B306912498E1A00FBC73FFEA17E09EA6EC805056F56A197651816
          967832A4787BE8C0D7517F3F97FD2D510B162C0837A6ECC8F7F56EE677C5E649
          C5472CC93F7469CE4717310539EB7BCA423661D284404D0F2524756B367DA57B
          8D6EEC62661E277B0A153661BA9B92BA21C6513364D22E4F321D2CBC799BB86A
          FAEA78CBE0F59290E2ADEFC14B06BCB922E33EE360E989FEFBB9EAD4A95376E4
          C21213D71718B5CA3D05872E57854D98342150C7434973D6B49DB7B1F1F4B5CC
          3C4EF6AAB00993260410E3A811461A7E063841C19B3DD874C8493D83AF078414
          6FFD0E7D63C65B243C47132C3D29517FBF326EA7E2539B4A4DDBCC14E4AC9F57
          2B6CC2A40981040FF55EBEB3CBB3DB99799CEC9B6B854D983421207E2C74FE2D
          00BC65E4F5EE90E2ADFFE16FCD78138A9AE74D7D3E8F637863714491FD77450E
          1E3CE86AD4A851B505FB9882EEB3FEE46D05B5C2264C9A1068E4A147371C64E6
          71B227BE3214983421805848F3377FF1E6CAD8FBB942BA3E39E0C8156F787345
          D1FB14EC9F375DB3664DB861654DC0C966D859B366FDF1C71F5DE4704C41CEFA
          045AE436315A6113264D0834F110338F933DF115298DA1C0A40901F773E3A15C
          9F0C006F421973BF7248AFBF0D3CFA9D0DDEA28064E6D84765898989E1469635
          D97F7FB876EDDA6E04309F38EB1368B9739B670E9598FF476113264D0834F710
          277BE22B529A011BDF7A64C39BAAB009932604DCAF98F6E72352A1C35B149770
          E322B4788BE6F705710A27D022B7A9B4E23FB1CF1D2FB3F49D324B3C65E93B6C
          C2A40981561E22BE22A519BFE7BD513B4F8ED87172F8F613142A6CC2A40901C4
          52523F924898DEB87163FEAA8F24724CDD4077A5F0578E6FE8D627CD147D2FFD
          8E942105D5B4CB972F137DD9CCDD087C1FDE881123ECF176E2C48914B96E4CA2
          D278EB2775369EA9BAEE83F8B51F545A739A42854D983421205399CA33C99FCF
          3C7C76DAEB9F4C79EDE3C99E42854D983489648AE723C0B56AD56A904AD4E523
          C08237A180F1E6F0FA9B4EEA2312E7CF9F3F7DFA74727232D1F67E0F51611326
          4DCE3F46114E3D3780694449F6D3F7DD77DF0D17B4CCE4F37DAFB1B1B1D7ED73
          79D606DA3F3EA7D98ECF1B6CFDACEEE64F6BBFE42E54D8844913ED82372A439F
          7C7AC9898BCFBC73615EF2F9B9C7BEA0506113264D2299E2F9DA0B1853D0A22E
          5F7B31C70F5D3B77EDDCB1B34FBCC5958F8B2D17EB5FDC954AF291A42FBFFCF2
          E4C9937BF6EC91DB88264D9A34D64354E416249A1040CCFE634BE1D7730398B6
          61C306FB191C51EF331F3870A0FD6867CD9AF507DE5C9E1570A8C3C4A75BEEB9
          D87CF7050A153685AF23443823662E58F1FEE5E59E42854D5D52FC5B7C7C7CB5
          54A22EFEAD74E9D2EE4B28AE14FE524FF17CFFAD7327DF78AB50BE42F972E5CD
          698CA5FD2A134849FD08E0B973E78E1C39C22F3D64C810F0CF608858FECF4354
          D8844913028821ECED638211A1E70630EDDAB56B48DA4FE23FE5F73A74EA6422
          6F3992BDA4CADF2A54A800D2F8ABF237C19B90E02DB078D221DEE423B7FCA807
          0E1C58B060019AEFBCF34E6F46D184006208D3C5FCB1DC48D113EDA60945CDF7
          A8060D1AA4CFCCE093CDFA64E9B4146ABCC947DC398FCE9831E3FADDA2BE0831
          84E962FE187CA4E88976D384A2E67B8B9C50FE9899615FDA4E27DE6CBE524094
          42524E9EB072E54ABA3B3F5F204C173AD2FD7F1E8A283DD16D9A4EF6F7520A8D
          1831225C600BFC7BC2F607254D87E04AA61B6F36DFEFFEF5D75FCF9F3F4F6ACE
          59D0F90C10A20B1DE9FEAB87224A4F749BA613599CFDBD264238C98C071BF9A7
          CF8165CF9EDDE00F5C020CB22C82E9A54B972ED7884D9834B9B4F7E1B1396FDE
          BC679F7D76D9B265CF7B880A9B300D92050B16ECDBB7EFB061C31E7FFCF1A91E
          A2C2264C9A5CA94F85A6076FB223F31B41443389F8E9D3A7E7CE9D7BEFBDF7FA
          3B09E84247BAFFE8A188D213DDA619C8FEF66545B367CFCE48B0AD5DBBD6C9A8
          162E5C68E8E836B85AB56A1B366C20733D76ECD83B1AB1099326F5FC5B952A55
          40D7C68D1B77ECD8F1EAABAFCA45152A6CC2A4090191045103070E9C38712238
          84BFC64354D88449D375C8A51B6F292647AACE2457AE5C494E4E4E4A4AF27706
          08D191EE573C14517AA2DB3433B56DDBD6C9E41E3D7A74C680ED99679E71321E
          DCCF6FBFFD66813710F5F6DB6F93D55DBA74E95B8DD884491302725C00CCB66D
          DB0E1E3C081ADF7BEFBD0F3C44854D98342120923831704580FBE28B2FEEDAB5
          EB8087A8B0099326045CE9C69BFD5BC0183FA37298BB9B898E74BFE4A188D213
          DDA69989B0C5FEBE7B4584A6A15EB124407332926CD9B27DF2C927E6EE6E6B65
          4D9658D970B19F4D98B2C22BC70527C671016058F5D5575F7DED212A6CC2A409
          01916458B832D0B56FDF3E10FBBE87A8B0099326045C21C61B03C3FD62796093
          808E74971B91224A4F749B66494CAD2C59B23899E8A54B97E6BC1F0AA491AA30
          399D8C015ABF7EBDA512B7B5C48D9C5A2CEFD081491302725C881B7165A00BEF
          F7D34F3FFDEC212A6CC2A40901911C376EDC92254B5E7EF9E5A3478F129A7FE6
          212A6CC2A409015786E0CDFECB893644477D32458E9EE836CD1BF9BC1CA713D1
          93BE0A9F4E626083070F76BEF70103067853E5B6169C00186F12342120C78554
          0D3FC6EECD173A61D28480488E1F3F7EE9D2A5C0EFCD37DF24E6FCDC4354D884
          491302AE0C8927D33309F4602972F444B769363468D020E7931E1A3870E07FFF
          FBDFF420EDC2850B3E6F443650AB56ADCC695B8078E32404668821716BBA0C9B
          3069424024495E172C58F0D24B2F118B1E3F7E5C323D2A6CC2A409019786373F
          DE87E7186F92C4E7C89123B04940477D312072F444B769F6D4B56B57BF663FD4
          A14387AD5BB7FA8B343C87FDF36C96C4BC2505B351EBB6D639DEF6EEDD7BEAD4
          A9F3E7CF5FBD7AF59A466CC2A4090191E454347DFAF465CB966DDEBC19E6210F
          516113264D08B8D28DB714DB27A665915A2DAEFA4B74D417BB23474F749B664F
          4C36668BBF30B8C9F3AED5871E7AE8C9279FDCB469D3310FFDF0C30FBF7BE8D7
          5F7F150E99CE9C397310F379EBA625D5AB570F20D88FDF6DAD73BC6DDFBE9D61
          9D397306747DAD119B30694240247BF4E88123C6BC458B16AD5AB5EA450F5161
          13264D08B8D2E2CDE1FBCC2D2167F93C8E5C841560074074D42FE6468E9EE836
          CD0991200580879052DBB66DDDE70B5FE4B6F68D37DE387BF6ECB75E882604E4
          B8BCF0C20BF82870852BFB40233661D2848048B66CD91244711CC78E1D3B75EA
          D4191EA2C2264C9A107099F0E6E47B1DCE8BDC64C4A80A152AE4EF0CA00B1DF5
          9B9522474F749BE6909E78E209872B9619404C699B9CCD88B730524A3ABF279C
          92F2E187670C9FB980E3B1CCFD476EA2956B0F7E115DCC37E3468A9E6837CD21
          9162E5B1FD3E7D061061EA860D1B9C8FF9FAFDCAA56D499FE241974C0FDE046C
          E68F3FB921A73DB4F2F9E79F93343B9F0108D3C5BC061B297AA2DD34E774E1C2
          85C4C4C470812D3E3E9E34CAAF015F7F4666E2C489DE246852F0A0D2BF7FFF23
          5E88265D1278D4A953A771E3C62D5AB4689996C88F95647AF066F37143C34399
          274F9EB4799C4F27C410F6F6306544E8B9014CF38BD6AF5F9FC18E2E5BB66CF3
          E7CF0F60A82E7BB0E990B3079B0E39A864C992E0242121A169D3A62DAD48412E
          3D7873D93E8FA3CF03CEA0172F5E1C376E5CB162C5BCFDFC34218098FDCB02C2
          AFE7C630CD2FBA7AF5EAF0E1C389EE428DB4AC59B3F6E9D327E077CEBAF1E644
          4E5074C4018964F1E2C5AB54A9628337282878B3B62A2DDE52B497D824272773
          FAC0EB162850408E20153661D2E4FC6538E1D473C398E62F71AA1D3B762CCE27
          1448BBFDF6DB070C1890CEDB56A2106F66FFA6289A5E1A1759430AA569FE12BB
          58BA7429F3275848234F9B356B5650DEA31E857833E46F514899A639237CD153
          4FB95F881A80C7C39B2526264E9932E5D4A953C1B42F9AF066589F7492B2FF19
          29BA4D0B111D3F7E5CBE5DDCB66DDB780F81288156962C5984C3DC1B34681062
          870F1F76783D2D52F046425CA952A53A75EA709268EA8582823703E9D7DFC23D
          79423829C33D84109A16DD142ABC152952243636B65AB56A402EC10BA51F6F94
          1A356A18EEE782E30D8DD141D16D5A7453A8F0963F7FFE12254A0039BC5C152F
          947EBC09D80CBF99829CE52F1A1D1F6D8AB42105D1B4E8A650E12D57AE5C400E
          2F476059DC0BA51F6FF6CFE398F951F351C2481B52104D8B6E72950E2B6518DE
          22E163B9C1D213DDA6453745CAFB5E438D37F347DCF9E1A74C99326AD428FE52
          0FF863F019AFC7D2B4C993278F1F3F7EE4C891A3340A6048E1D513FD780BC023
          FDE9F046E8C2D9941F98F3AB4C6E88D9409A47D0CB5FEA7068420031842DA39D
          08D16369DAE8D1A31B346850B56AD5BAA9441D8EBF430AAF9E1B026F351CD39F
          116FA4E6A82280519E4468C89021FF4D25EAC294532FC27431E4F4367AEE18B6
          5A4A3AF5744E257B3D96A63DFCF0C3FFB5A27EFDFAF93524F42873F412809ECE
          5664AFE746C19B13CF1676BC99BFFF668937C3FA64CE9C3949D0E5B363AB351A
          3B76AC9A94D4155F3E5946173AEA6A6DF4DC3776839474EA5193D25E8FA569BD
          7BF7C690F6EDDB4F4F25EA70BA76ED3AC54312C8F91C127A30C4A0074E007A30
          C4A0078EBD9E4CBC6504DE3A77EADC31A963FB76EDDBB46ED3A2798BA64D9A36
          6AD828A15E42ED5AB56B54AF51A572954A152BC5958FB3F46F66325C7FA3D7F0
          E1C3F97557A725D2890A152ADC77DF7DFCA5AE37C98D0874D42753E4E8B1344D
          F0C65FD54B38722B8F0AE47C0E895E85A76E37E88113801ED065D003C75ECF8D
          85379B303274780B5D919F30212161C28409640B86F9ADC79378571D0008D385
          8EFA64B2D1536EEE3E29E9D4A3FC9BBD1E4BD3045D4D9B36558B13D4E1B46DDB
          560F2C7D0E093D1862D003073D62A3733D1862D003073D7A6069362DBAC98837
          6F6E4DC7DBF54323FD6D49979143A933D354F4031D54BCB569D366DAB4692B57
          AE34CC6F980A6F850B17E6E757531C615AE9A8DB62A3A7C6D2A352D2A947E1CD
          5E8FA56982B7BBEFBE3B7F2A5187D3AD5B372208E5FA7C0E09310C31E881237A
          A838D78321063D70448F727D66D3A29B2CF066F06C41C49B705493544E9D3A25
          ADB2476F7823B1B6F9EB17DE64E59D7866D0A0410A7265CB969508C7394E743D
          896B4F4849A71E05391B3D96A6C9BB4DCD045F0F357D0E0979658B5E440F15E7
          7A2CD74B444F26DE02C49BA37D38F36F0B162CB4C15B10E3495979274DE2444B
          AB7929CF611C68D0D36EEB4752D2A9C7BC94E7249ED4DDB54E3D7AF490C052E6
          B7CF21A14719A217D143C5B91E4BBC891E85B7CC7832947873A5E4CB97CF5BC5
          4909C0BF99D72754E676CF3DF748D0A55C81E5FA848D9E6E7BBEA0881EA95302
          D0237351F4E8AEC0528FA569CF3DF7DC9C3973A64F9FDEB76FDFD8D8D8FB3C94
          2B57AEBC79F38A8D32BF7D0EC95E0FD605458FC2DB8DBE5EE21C6FFE9282563E
          0FA90A4DB2A9C33288FECDBCFEEECD15C05FEDCF3A3EF27D5FBF642E01E8B174
          05DEF4D85FEAD0D7810C81A55F9728D063695D007ABC059637FAF58050E3CD87
          7F4B497139C39B5FFECD7C7D99CAA851A30CD3118E0838BF4E2D7A061EFD4E2F
          01EB314C471B3D29B697F2BD9D4DA64E9DEAD72578F4184C9312801E4BBC59EA
          B911F1E6737DD267176F1D53ECD72743733DC06575FF948A7684A8CB14F1F73E
          ACB0E8F1CB34A1D9B3672F5AB4283D43CA183D371CDE9C5C7F73D2C5B2A3CB76
          7DB24B972E7EC1C9A17F1332DF1F6CA080EF33CE783DD16D5A745320F79738EF
          E2977FF3176FCEFD9B2B321E3609969EE8362DBA2963F1E6E92B15F5211B5509
          0C6F0EFD9B50D43C941969430AA269D14D813C1FE05717BDA3208ABA54E47647
          57EAEDFC21F56F8AA2E3A5039136A4209A16DD14C8F36FFE76511D7550A98AF2
          6F82434521C25B1450749B16DD14FEE7BB4357C23D79423829C33D84109A16DD
          64615F14BF193BD3B4C837CDE6CB045140697E3AF5A585F3E7CF9F3E7D3A3939
          F9E0C183FB3D44854D983439FF624338F5B8226F4899A63930ED370F81C6E803
          1E16FDF1D3C99784BEFCF2CB93274FEED9B347EEB5993469D2580F5191FB7468
          420031FB2F12855F8F2BF28694699A03D3AE5DBB060E718051033CC62F9F5CC6
          1C973A4C78F973E7CE1D397284C33164C890DAB56BE7CF9F3F6BD6ACFFE7212A
          6CC2A40901C410F6F6C5BD88D0E38ABC21659AE6C0B49F3CF4F3CF3F0BF014F6
          FE74C01398C959031330048B5C29A95F82C5F203070E2C58B0A06EDDBA77DE79
          A7B78C9626041043982EE62FCA468A1E57E40D29D33407A67DFFFDF73F78081C
          1AB0F7A7009E8299C2188409628BFBA7932F9D73B299316346D9B2659DAC2321
          86305DCC5F4C8F143DAEC81B52A6690E4CBB72E5CA771EBA7AF5EAF71EB2C15E
          8400CF06633F7A0813C4161772D84630BD72E5CAF2E5CB3B394C4208D3858E74
          97F034A2F4F0CB45DA90324D7362DAE5CB97BFF1D0B71E32C04FC79EC1E98517
          66068C29805DF510E3BFE22117A2E7CF9F277F6DDEBCB9F3C32444173AD2FD57
          0F45941E7EB9481B52A6694E4C932B075F7BE892877404CAAC35C34FB09731C0
          D331660930852E396530F2CB1EC21617A2A74F9F9E3B77EEBDF7DEEBEF91A20B
          1DE92E4E33A2F4F0CB45DA90324D73621AC0BB904A173DF4A58774101A10C8FC
          3660CFF97542BF6066C0980160022D41979C2964C07206112B5CC82527272725
          25F97B9884E84877417344E9914C20A28694699A13D33ED7E89C87BEF0D0790F
          197028205408D4E127D813A7979E8891EE82310198015D3AB414A86478EAAC71
          3E95B0C285E8C183071D26B866A223DD659711A5875F2ED28694699A13D3F467
          D2CF6AF4692A7DE62105488546054566BC805010083C707D60CF1DAF3A766560
          8C2E0230D0A5A0A570A510A5B0049D4B2519DE671AC9E05D74DEBF7F7FB66CD9
          023B5274A4BB78CC88D2239940440D29D33427A69D31D14756F4B1469F784887
          A8C0520152700854800DF0034896300363000C74012D840195C04901494148C0
          A3CE05FA39E293B4F4715ABA8EB7BFFFFDEF811D293AEA473C72F4A849193943
          CA34CD8969EF652C7D90B1743D9E4CCF91D2238AC8D1A382AEC81952A6694E4C
          FB8F89DE4D4BC7357AC7436FA71249E0310FBDF5D65B6FBEF9E6D1A3470F1F3E
          7CE8D021941F387060DFBE7DBB77EF7EF9E5975F7CF1C5254B968C1F3FBE5EBD
          7A37DD7453DDBA75E51D471B376EDCB163C7DEBD7B5F7BED35BAD0F1C89123E8
          411B3A51CE2E648FB277198F1AE7092B3A9996AEAF97E4C89123B02345473D63
          8E1C3D6A5121728694699A13D31472848E69242812204180E1B08700C61B6FBC
          01425E7FFD757085AB045AC00674EDDCB913806DDEBC198CAD5EBD1A98CD9933
          07A4F5E9D307B0DD7DF7DDE0EDAEBBEE0272EA0510006FCD9A35606FCB962DC0
          EF95575E41150A0121FAD90BFB628FEC9701300C199260526029C8147A279504
          A2D7AF0754AB562DB02345477D453872F4A845F3C81952A6694E4C5358527012
          44E9A0125C010005AD3D7BF680AE5DBB768110000654366DDA04C6D6AE5DBB62
          C50A60367FFEFCA79E7A0AA43DFAE8A35DBB76056C850A15BA29950A162C08E4
          E00F1A3408D4CD9831E399679E91F71DAD5BB70EEC81D86DDBB6A19C5DB023F6
          F8EAABAF0A0819898E43054541A30E48E8FAF56E7613D891A2A37EC53372F4A8
          8BC29133A44CD39C98A683CA802B8859AEA30BF7B57DFB7600B675EB56202118
          0321B8B2E79F7F1E982D58B00087F6C4134F80B4A14387E2C43A74E800D84A96
          2C29CE4D081757A2440920472B324882BAE9D3A7E3EE162E5C08F0002D4EEF85
          175E007B2FBDF4127866A7C08F01E000750432D4D73C24E3171C2A285EBF9F0B
          69E0EEEF61A20B1DF53B7A22478FBAE929728694699A13D32CA10531AD99DC4C
          710530263D531F0008C6C083BC020C98019279F3E6CD9C3973DAB469206DF8F0
          E18F3CF248F7EEDDDBB46903D8CA952B973B77EE7FFFFBDF0A6F59B264C9952B
          57D9B265811C3248223F62C40850075667CD9A857B7CF6D967011E3016A7A763
          0FD7A7E0C75980A132ECBD1E3280F08FFB95870D1BE6EF91A28BF98ED548D1E3
          8ABC21659AE6C034852E715F06808913138CAD5FBF9E70115786F359B66C1930
          5BB46811C0C0A1113A4E9D3A15A48D1C399200129745ACD8AA552BC016171707
          C275E7A65C1C5125AD400E49E4E985E34503A803B70499B83BE24C1D78805CC7
          1EC3B3841F160902FF781EE7F3CF3FC7993A3F4C08D3C5FC4446A4E87145DE90
          324D73609A246010B35600C63C06631B366C108C892B63AE33E315CC80010E0D
          47F4E4934FCAC7BDC0C9638F3DD6AF5FBF9E3D7B76ECD8B1458B1680AD62C58A
          458B16BDEFBEFBB266CD6AC0DB2DB7DC9223470E5A910172C877EAD489BEFDFB
          F747CFA851A3401D1806C9B367CF7EFAE9A78954172F5E0CF0E4ED9AC01EF033
          3C0609F618B0608FD3048670CAD8E1A134CF9B9E3C79927D38394C8821ECED89
          C388D0E38ABC21659AE6C03433C6F01E8231F95E1C3063960333FC0C939EA98F
          43C3F910F84D9E3C19A4810D12B0010306E0A0BA75EB06A49B356B06D8E2E3E3
          49DBF2E5CB8773FBD7BFFE65C0DBCD37DF8C8BCB9B372F895CA54A95801CBDE8
          8B06F40C1C38109DA3478F0675E099D48E601577873B257655C0C3D3EA4E4F61
          4FC24EC8F83E858B172F8E1B37AE58B162DE8E114D082066FF447DF8F5B8226F
          4899A639304DC798848BCC60E631B359C18C29CE44C7A1E16A70380A69E081E8
          9400F2E1871FEED5AB173161BB76ED9A366D0AD82A57AE5CA64C1922499CD86D
          B7DD769315DD7AEBADD9B36727AA2C5DBA34F240CEFDC9BB76EDD083365C25E1
          25A9E098316314EAC0396807F33858DCAC0178E2F474EC59BF2F28393979E2C4
          898D1B372E50A0800C850A9B306972FEC69870EA7145DE90324D73609AEECACC
          3093B891298E7B217424AD9A3469124803032061F0E0C18F3CF208EEA87BF7EE
          38CF366DDA3469D204B055A952A55CB972313131B973E7C6B9E92B253A65C992
          0517972B57AE22458A942D5B965E400E0DE8411B3AD18C7EC2CB11234608EAC0
          396807F384B2E2EE70B90C55010F6F8C21CAE965BE0F2FD3B448D2E34A918851
          8799A467F81026340E0D9782632195524863F60F193284900FB7F6E0830F3EF0
          C003246CAD5BB706DB80AD6AD5AAB1B1B1C58B17CF9F3F3FEEEBF6DB6F2774BC
          C90BE1FAEEBDF75E624E3C30BDE80BE4D0833674A219FDEC0517CA1ED9EFD8B1
          630575201FFC7316E05CC0198101737660F0988021E49902BCE87DBF66F45A16
          DDA6E930C35748DC280E4D42471D6923478E24AD62F6F7EFDF1FE7D3A3470F62
          3F92AE56AD5A09D8AA55AB16171747DA462489E3C2B9DD72CB2D3779275C1F2E
          2E67CE9C44952472F415C8252626A213CDE8672FE2E8082FD93B6310D4312A50
          274126E705CE0E1267EAC07392D6FE2929BA5F421CEE2184D0348199C1A1E13A
          401A2913B1A8421AA91A01E4800103C4AD75EBD6AD73E7CEA45B2D5AB4001E80
          AD7AF5EA152A542019233ECC9B372F8E0BE746D06883B77FFDEB5FB8B87BEEB9
          274F9E3C850B172E55AA141A00AD400ECDE8672FECAB77EFDEEC97BD33064632
          6AD428853ACE08A04E824C71771267625AB80F70287FB9700F21D3B4404C0366
          E2D098AC82349C86421A735A9046124500D9AF5F3F5C4DCF9E3DEFBFFF7EE2BD
          B66DDBEA60AB58B1629932658A162D4A2479DF7DF7E1DCB266CD6A134CAA0B03
          B8B81C39721055D2170DE8D121C75E48E7882DD92F7BC7B5E260190F0924A81B
          376E9C429DA4767866E5EEC27D8043F9CB857B0899A605621A535342475C8401
          69CC66E6348913F39B70AE6FDFBEB8B5EEDDBB13E3252525B569D3A679F3E68D
          1A3512B055AA54A95CB972A46D4492B973E7C6B9DD71C71DDE564A0CAB26B841
          5C1CF12751251ACA962D8B36740239F4B317F6C51ED92F7B1747A7C24B92BAD1
          A3471B50C75983730767106BB3A3E3CB469136A44CD39C98A692B4C99327EB48
          631E339B2580546E4D6248D2AAD6AD5B376BD64CC056A3468DF8F8F8D8D858D2
          362249DC9438B75B6FBDD57CD9CD4C3840DCA0B838A250A24A123986AD438E7D
          B147F62BB165AF5EBD180FA3C2E5324233EA386B486A676173D47CB92FD28694
          699A13D30C4863D632772580D4DD5A8F1E3D882189EBDAB76FDFAA552B1D6C95
          2B572E5FBE3CA917D160810205D811CE0AE766BF52625835C1C565CB968D5303
          B1684C4C0CDAD0098CD10FE41A366CC81ED92F7B670C8C84F1E0E8181B2394F0
          923113FA1A5097C6DA48F8A26CB0F4A444F54777236D4841344D479A4AD50469
          846DF4C299E05288E548D8DAB56BC7A46FDAB4290050608B8B8B23E92A56AC18
          91649E3C79705338B7DB6EBBCD7EA5C4B06A8233C4C565CF9E9D5894A812E896
          2E5D1ACDE8579063BFEC9D313012C6A33B3A9C30E125A12FE717AC1833668CA0
          2ECD91922F9DCBA57AFE7268F4CF9CB3A99A9C7C313DBC7A52AC3E2A2FF2D83F
          CA4430FD1D52B8F4589A46CE433A8EBC59154C9A9C7FE73E8C7A304D471AF395
          598B58FFFEFD711D3810DCC8030F3C401447FAD4B66DDB962D5B2AB0D5AC59B3
          4A952A152A5420DD422D712091240E4A9C1B21A2936052859438437171C4A244
          954097440E181B20D7A44913C6C048184F972E5D6411451C1D6356E1A52CA580
          BA3F4CC5ED024D8E02D6A28E71035335C5A9B0099326041043D8322488103DFA
          A4D4553568D040AEA81808264DCE8714463D96A6E13A38837234F29B08264D08
          38195278F5601A4863764AAA66706BDDBB77971892C4896CB0458B164C7703D8
          48B448DB88008924714D3828716E4E564A0CAB26CAC53142864D2A088C01337B
          615F3AE41809E36154125B324E225E71742ABC94A4EEBA9DE4AF0C5ADEE2C049
          45DE34C4A0658ACBE46653F8082086305D0C89AF41CF1DC35653CC7A84EF5C4F
          670F99F508DF528F9A94BA2A7EB9FFDA12024E86849898E0AD38D7D3D9962CF5
          589A26DFA3F166977C8FC6C990444F8DA5472D8BBF7ABCD9E54D0FA6312F2580
          947511716BB2342231242953EBD6AD0D60E3F454B162C5D8D85849DB70473825
          5C13CEEDCE3BEFC4B9390F265548898BC331E2E28848894B25AA04CC409A7D01
          39F6AB438E51493A27B1A5C1D1E1A8B1EBFA91C2EDD220DFE622AF55BF1373BA
          BB8714D82004E4BB5E74A1A37EC40D7AEE1BBB418AAE47319DEB51BF93AE4731
          2DF5A849A9ABC27EC6CF41996E22983421E0644888317E6F7A6872AE87F17BD3
          4393A51E4BD3F0F9FA0F67209AE4C65F9F43123D038F7E6759FCD5E30D6FDEF4
          609A0490CAADC9D208711AD19A246C4CEBE6CD9B376EDC58075BA54A95001B29
          16511F9124EE08A724CE8DB010E4F8BCEC66B96A8263C4C5DD7BEFBD8C90E814
          189316B217F605E4D8AF408E4884F1302AC626E99CC4968C5C1C9D5C30E02472
          FD4801599CB8446B9C758835D54F758F87D4264D08484447173AEA47DCACA7F0
          D4ED52448FDAF4578FFAA9448FDAF4A6474D4A5D95E08DBFAB4DA437F91C1262
          98E04D8F6A72A2474065A9473539314D0ED49C3973CCD0852987C8C990C2AB07
          D3989706B74684A61236598A647233C575B0952F5F9EE48A784F2249DC91726E
          8485FE3A37E5E2708CCAC5119D4A5429891C7B64BF06C8C9A2A5A4738C59624B
          2261E5E8AE1FA98484840913261052AB23A543CE0C360861BAD0513FE2967ACA
          CDDD672881E9319F266DF4A849A9AB7288379F43420C2BBCE9514D4EF438C19B
          13D31C9293A31D463D98A6BB35892125613383AD56AD5AD5AA558B8F8F8F8B8B
          23AD22D2934812478473C32929E7E67CA5C4B06A627071C4A84495401A60CBDA
          8901728989890A7292CE496CA91CDDF52345B6878B97C754859E7EFAE9A64D9B
          EA606313A61240982E74D48FB8373D7A0E901E3D3AD8ECF5A849A9AB7288379F
          43420C43BCE9514D4EF438C19B13D31C92C3A31D2E3D98266E0DB7A06248426B
          045AB66C6909365923216D23D293481247843BC229897303330104936AD544B9
          38593891A8521239400EE418032331408ED1326646AE624B7174D6474A162418
          BD8E3736F5154227475CE9495C7B4295F4E8D1F166AFC7066F00D5BC482D2717
          E738C1106F7A68F20B6FDEF4DC987813B7A66248D221598A741FD8C44405B6EA
          D5AB57AE5C19B0A9B48D488F481217842352CE2D809512F3AA89B838A2536254
          2255F6C2DC03DE801CA8330633E418AD2C5A327E155B6297452460588DD449AD
          10AE761051283DEDB67E642881E931C793367A6CE2497E09F322354CBFE249AC
          F0A68726BFE2496F7A6ECC781257A06248591DF10636599054699B8A24957303
          270107937A488993C4C5F18BE0E2F4A81290CBDA0990633C408EB101B9FAF5EB
          2BC8C90A0A9093D8F2FA91D233DDF1E3C7E328F5A5647DA1992604563BC89845
          4FB73D5F48113D6AD35F3DFA52B2BED0EC4D8FCD7A890D395FE750865816BFD6
          4B6CC8AFF51227E4649D238C7A304D624895B0D9804DD648246D934852964974
          E7969E60528594BA8B93851315554A2227CB95DE20A7A773D78F94BE92ABA34B
          16240CCB2772F1C4E78A30627D5FBF2445D7A398CEF51816480CCB27967A2C17
          CD070E1C688F37049C0C093165856571AEC71E6F967ABC5D0FF0490ED7F1C3A8
          07D3246113B0356FDE9C29DBA851231D6C55AA549105494EB592B6A94852AE01
          04CBB9A990D2ECE2F4A812C0CB72A5408E112AC831F2264D9A6085400EBBAE1F
          29FD4AE5D4A953CDAB913AE4107072C51331B96863D6237CE77ACCAB913AE42C
          F5585E1456A679237F4DF356FC35CD1B3937CDE714777E9D3A8C7A304D564704
          6C4C564BB0C5C5C5E112256D5391246E473937B0212B25E9C71BEE51564D7098
          CAC5016C892AE5F200B097B513C6C608BD412E4DBAABEEC459B468D1ECD9B3F5
          8B246A8AC3A409012777F484578FE54D4FA26ABA17F27748E1D2E3ED7E2E9B29
          4E93F3FBB0C2A807D3D452A4808D292B60AB51A346D5AA5565F55FC0462C2791
          A45C70C3EDE8CE4D564AD2194C2A1787AB542E0E48CBC209112C5057891CA3B2
          819C2C5AA63958EA4E536FE727392739BF63358C7ABCDDD49B695A849B66065B
          EDDAB515D8644152D2368924713296CE2D28C1A47271B84A4B172751A524724E
          2097E64845C21319C1D213DD0FAD44DA9082689A5C64B3019BA46D2A92946512
          DDB9056BA54427B56AA2BB38593891A8522572B25CC96819B30172D86571BCA2
          E6C9C5481B52A6694E4CB3049B5A9054605391A42C93E070703BE2DC64A5243D
          97DD2C434A593511172797BF65E1448F2A2591639C0A728C5F41AE61C386D607
          2B3A9ECC8FB421659AE6C43403D8AA55ABA6C0A6A76D8648D2ECDC82154CAA90
          52B938F6222ECE1C55EA9063CC66C8393F7A7F328AEE97EA847B082134CD0C36
          B520A9D2363D92F4E6DC82184CDABB383DAA342472728540875CB80F70287FB9
          700F21D3B4404CB3049B5A2391B44D45926A994439B7E0AE9498F186F334BB38
          3DAA54899C25E4B0F1FF030337366B10000000434C4F534542544E474C4F572E
          504E47CB13000078DA3D566554D4DDD7FDC1204397748374370F1D43770CA934
          0C2092A294C2200D4A7723D2A180C41032748374770C03024A084ABDF8FFF0DE
          B5F63A67EF7BEE39EB9E4F3BC6404F9D108F160F0000424D0D15A387C8F80F38
          D80080A123992FF64070BD342C5E0200FEE37FC000B273A901004FDF15023130
          70F1F4F57CE9E2E9C5AC0981307BF978C25C5F380180FF529EB133D4184D2977
          B976AEAC1D0D4FD5F634A2C06136528E83932771F0B0E0926845B3142D521876
          91AAAA62D10D164683E2E3E1EF290CF90862F116C03B2C1FE3C38AA36387AF37
          838ADDE6DA2FF7C6EE1AE7E551D567790D1360240E41BA86A8A1389CA0429991
          74236CA0B77F73474031148FCD0B20C16970647979FB0403B80A9695E5654582
          BF0118FED3F8380052370729441F754F7CA09CF50C031E8E81F44DFA4F1B074E
          0E2806C62B97028A6A18F0BC4C0E63A0100BB01D71B0DF060CF8015BCE90BD69
          009E77951584013C4D65A1C0284C02981F3B45AB002E3240F58469AC2A602E04
          90C3B47BA580057E4048D30CA6017C690690E324F8F5000E012064181DC10D60
          0501B6834F9EF803E15900B9DAA999EC2FDE5A1214CFC3A6B2EA65116C52AAA1
          4F71F8BDC16666028C5CE39A54BCE412769876D98A02DD01593422A162C41B67
          A300509844F1F0DBB35BFF71A2DAF17189F826221BFE834EEC7B567BFBEDBBDD
          892A2F4500D8F40D9EBCE3136CA085CB60C3DDEF3EB21F63B958E317BEBA8C83
          D5132B360285E825B333AF7FBB512D4A442C2EEEEEEC2C68F52A3FB51B367B7B
          E7DC6D8334BB7DF12758F6E6F262E3DB165BA88855A83AD6D546F7E8B94E09FD
          44326EB8FDCA5E82FA4D33FEFD0DC3346BAFA63DC29C877CDB90CC3B5E25FBFD
          9948096B8C7232771FFBD4BDE3D63ADF35487E5D1CF8F25C1E232889BFDCCA01
          F45B9B93C4DC17B9750900A76D9E5D335C3820B84BD8E684DFFD89C2AD7A213B
          008769267B0380B50A9B0074B84161000700540A4379BE28D19D7751F321B1E9
          BB1EAD74E1DFD84A842BB3F5762B9328E339C2E97D6CB9ABDF2973458E7D61E0
          B1159C516410431ABA44A6781109749BB410C97911FFB5C3C9EFE26A0FC5C552
          1AC4796CC7B2148D611F6BFE241E872A2BE28AA54B038B2C8E8D79289ADC9055
          3B495C43D82816CA6CA2C1702AE7832915F54CAD3549661010797713D9AE2E9C
          1A5A6F283743D00841944BD286AB7DC4FFEEE82B9C9D405998F3DDE72BADDC7B
          8922D4F72A17E2A50479C88010729F1A2CDAFB4248A0BF47B9EE3F3EDC148791
          3AD66A82AA7EDA2FA6D5A0B6980B87893A3F2CB2505524AE04969F32B31DA392
          86B98EB9DE824639333D9B18E912AE242E28DCB09B9335A55CFB2B472BE99F5E
          6A7B11E128730DBE277364098F054982A221BD926C643110114E4422A666DD27
          E814D994DA9487D113345F458E9806ED9394A12547B77AB0542A1F33EF60C44E
          DE4ECF8EE80EDD0ECBE953BC3C7B45EF4F57C65B5C46C3CFB568764976C576B1
          9D3245944C8AB38D56CB8BA0A4E20996CA35454D469F0DA3CA1F8BBDCA961A0B
          A3D4D42EA9F998364DEB42E572E9FA79DFB79574358D512FE3BBD9D4085A7D3F
          631F74EE47401849113610EDCC4593430DA676A6F1A3FE9CA9534A331D473300
          1592143ECC44651167799A98F334F1BCA1481AC64BD34AE348A3E31184565496
          56AE55E29B9C998C40132AAC8DDFD6AA99881A6F57E0CEA4579954E6191C1AD3
          193B57C89447553A977B42153E055BDCC6605BF4E8F4E8433E1916D6D96CB7F7
          33E33BD034F8F3B1B8115645BE0A15EFE5A81B5B7CF39AA72DF396A12D4EAEB2
          A2480A22AA256AD66074960A53006F677A5FE5FAEAE1A2B8CA32CE8263D7C84F
          B8B7B8E94AC57410C24ECFDC2AD333D2CDAB34AA0CABD40F3B246A8FCAF24A3B
          54DB2CAE43899406B4389F71AA3B278C3FCA43192F1AAF96E19551EACA495FD4
          0A54BA95D015B5A9F8757A941D67E67FB386E7EB7896AD0574A0FED2BF15BC85
          DEBAFF2DBB502730C76E2060C35E2618A796ED13F7F69465101C58FE6508B1EA
          518494D8A5D9656C86272126658B67D53EA811BF77ED7FB6CDB6EDDEEFDE5FCC
          81CDC1C2A1AD7BA07B9C6DA48B28E52E95D191D119181B1DFB383697259E2327
          3C2F82CA41E5CCE7AC37DB5AFA5BF2359537B53869D6EF58965A1C37B57B4458
          4A5994989B585A35A8D5E4D5B0CFB5D5B495919621F452F4AAF2E79C7BBEFC6A
          1A6AAA68A6F9B2BB80BD5CDBE4DEF4D6CED99ECAB9B9AFB6E738A523E56DEBDB
          0FB77260C2A845A22A064B86E0975F7DC8A54DA5D7B2C7738F15DEF69DA7A305
          9DCD2748261644B79B1E8F70F7BAE619E74CAB3B5339235E869D45C7C568BF1B
          11C89017C8A1EB5F1DECD8D1F2BDF0B6DA0C9CBAC8CB69C8E93E2A5FFE7C2C71
          EC7A1CB552302A56C09D6F21FAF27BCF2064C370775201BF204DC86DBD3A581F
          A21FEADC887A22E82098645633FFA5B9C4AFF2D2EE844AFEB7BC4FC1B6FCB6AC
          E49AC89A85CDA824B279B07944BFC733DF26621D12F2E4DEF13EF07E122883B3
          633883624295429F625E5F05BE61E98C57905E76FA5DBF78A4F4BE10A144A194
          F0AEE6DD6E570D8BCBE08FC41A964B54E678D2B82B518441F0FEDC77B0DD9E5D
          5C4F30016744548459A442BC57B439EDA47086B8DFE40AE4E5BACA5F957495B5
          1C67617DA9CFFC5AE23CF29502CF6597245BC55A15FA056016A3B3E679E69A2F
          B4E9A504786A253C5E7C5BBF393A8BDACADBC2DF0EA2CA141CB4F20A281AEF3E
          8F28A3AC1020E3934E57D489D6FB2FF5A712094F39E57BF6D3C77EECF17801DD
          0CDDCEAC82931293D10B90673C8C7AA71A3CBA81C93F92DAC503D8FA444BF876
          11E19C1589ED3A843AAB39D2F994D9AF99DD45E4A43B84C3929312BD952B5974
          539A9C0F9CF760AF47AA9D22EAEFFA3CE29A0519D3C0436E0D89D58F2CF8F19A
          944BF7A1965CF33CE07A67273358E758CCB0547A553EEFD8D168C3F072A264EE
          49C1FD115937D966725349A4B6193F83F95E47F573A97A59EF8065BC6D8A47BC
          91A6D8D5B22DB14D3CEEB3FA55476619B5C11D1C81BA6EA1D65DC3EFBA1A31DC
          0EF14DF07623DE1EAECC1F59E99B0B5AAC37DAFD8DCCA393A78889AD255FA6CA
          A00859E05AF1DFA58BF21CEECC5A49FD5A51D58B709C804DC1D07B6BFCF94F89
          D22B33F632883C081797BE12AE9B7E3DBAF8ADBA2C9831C6B5DC16D604411477
          CAB6B43B950D8D8FC928403F41CFA17FA112C753AB8D76F3571E93C77441EDBF
          C57ECC2E3F6DBFBC951FFAB66C8261A23B0B9B75BAD6BC6EB854A88DA9445FA5
          5FBB5BD5E8B97B1F0D80A640B7E027444DF3889959862939A851C21CEFA13AD1
          00D3B7BBBC133F7E420942930FB9FD5B4FBC540276D097B8EB978C84D24BAFDF
          07556F82A7995E333833083E57CE3ECD56CB31CEBE7E6AFFB4557F547E72EE60
          2DF0467D998938574CD62240EB0C3AE4BA847E379DE27C3AF13E2F2DEF6DB0C0
          9F15DBE58F4D412887F1F5E7C49E27AD24BE9B53AAF77128997699F167A72DBE
          A7F5CBBB8FCD5ACCB23F4BDBB81FF81EC8DEA54CEB0FB4E5B665D7229EB9218E
          033B1A83609768BA7CC9F1D5F38E805F94F773B3F95272AB1D67819E977D9717
          EB94ABC13E9CB7E3236D8B7E9CC735EDFAED36E78A474A8B90D5A85985A7772B
          0B272B21CF917E8567932BEA97D811611377491709C490470959092391849187
          F9FFC94B496D29F8DCA26FCA20138E131CF954771FEF466AA9280583AF660FE7
          C72733278B324E33523ADDDF94DC1E200F693E2FF777F7337E1BF21715B63E37
          BD3EEAF25BF16338295E27D6DF79C31CC275EFF2A7EEC2F87BD9750A4D4ACA3D
          1628F3ECC641947FF9C16F323B6818E90240203B00C0C300E0CFFD434403C02B
          210038B00500E94C00A0F24CB6E95303009CDF9A2A4A50FF25400568BBC74037
          C83C3C07400F003FE012F31F29F82E7BD37BE57EF1903B63FDBB61E712061EA3
          E380E415F6A87F1597B23829AE6D2BEC3F3D20DB020FFCFEFEFFBB613CD00713
          025C3FE0E65FAD72FF5F8FDF6D4796FF04F03F419314150B60E190FD9B4BF64F
          081BDAA15F55C24F853FE4FBFFEBF62EABAB1F89B4ED412237B05E4DD0606347
          1E11101014981752CED05FA79939097C890B7D38766BC201D8739F9D4F38CC3B
          EBEC439782FF1CA22409ACA25A687C2FCE69CCB39844D9CC3B2D4691C89F11A4
          072699E237069E218EB6B657E30F0AD3FF06E94C74F2867B03C84DD4DA256F07
          4133D7453A594AA84762B2459D37778326F6C9A76326030ED386DA63625B1FF5
          212FF60C1BFC94A38399B4D68FE567967A590A05BB7F14B0088A123C77EC488C
          AA1D68AD72B7A40A3351AF736C64D29894A2F197121AC73EFC39B60CAF581AF1
          71BADF18743F5C53AEF378532A1BD787D3A3993C583F7AD01BB15D05A5C76423
          B5560FCC989F3D88195FC8572B3E46173DF28B686E28A12EF91DD46ED591B5C2
          5392B737BC32C0327ECF45AA069ED33FFF7EEF947C6341165B2C74E33FAB45EA
          39D451682D5A1212C64568474EA844E2A1FB08E15450C45F5E5352545432F75C
          B88298991FCF688383905D80A7C8897281FF6B7BF32E554B1EBA1D15B0263A18
          B3E18B590C571F7DCBB247B80F5821A9CF6DC150DB2EB19882DD30198157A649
          4E59D69FD51B16997FF80FB2DBFF254C04E703ABAD39044B1884E60A638F125A
          D7762C7DD0D3014FEB3789C3EBCCD535F83B0DFCE375536544719B2DEA5A18F6
          647EF2C4CC004215BA7D14203AB3121CB46F76B9EF50FB939EB53E417977FA4E
          CAAD1BF9AF843AA07AB6CC25C52AD32AFB064BEAAAA3972D252F732FEABD0DEC
          FA5EEA7658434EDE08A13CC9E11C3F2FEE738926AF9F97967F627312AEAC94FF
          01E9A1562BF0EC80206E06619FFCB7BC692C36881EBC65532C3B0F09E61BB8F6
          B339CC4A45ABCC7B8C51058E61147BACD0FBED822C8BF915ABBCAFAB50BE1078
          559A4BB53F978AB0269AD6973059D1E870AF4EA1B0154C01CDD09B646FC7490E
          C7634DE3AB4DD79A84A50B88D6F05F6BFBE5E6094CF4D25BAF6564A0AEEFFCF3
          272EBDFBD67C5CF331368001A3FC7A67E202F5F2D882CA5063C62BFCE494CEFA
          26B6BB903C7196729AFDE4FBF9C0DE202495ADF137034C72B3678FBE82400D6E
          5D87EB71566117178457B7C1225904520E23F44C0B01B55CFB483C5B203D391B
          FD995C436DFD0D81FE817BF16A51B650D3D106905DB991CADF24F978A5B5E5DC
          C03013248F616132BAFAF750F1D0A427A3ED834240E44475E218933D834C75FF
          3C62A95E6B00E191CF2FB18E3D8E7F5DC9A3EF917BFD4C863E462C59903E7904
          462DD7A621CBE86CBF2F09F15B2B2EA70867CDB3E3B663D878E94974E47C918E
          17C27E34C945BC86AD99C3EDF1DBC3CBC927A6A282FB477D58ED61F434A647F7
          0B241134D567B7FE2D19D4D76A40EC37E01F28A862346D0037AA08A73BC9BEC1
          1192614537DACB8F1C1FEBDB2F69733052F95324244918CFB09D14BBE255CCC8
          23430D60D770882DCA523FF86E68786E23063E5EBCC8515A36808B0DE2E3036B
          547352BB89BB562D9903DF341DBEA4CDE874EA937971E719AB5B7B9EAF7E5093
          A9C0332DAEA43545E3F42C14BF10E0F438CF1284FBF9284E2E9FEA83849925DA
          28E9D7240E02F1D215660CF2FE08FB6CDA7EAB98B37E240FD884D21BBCEEF3E0
          9D2A111603D9758972FA7344547F641BFD852022B59E26CB254F71A9B7495D4C
          F6076F30E539112FABD1F4FF2A38F91137816A7018E857334C314069873B024A
          A9E58446AC86F2E95A1A0459C30615DA9F287B672A404FDE91F622635943CDE1
          8E2EEC6C586414049A20577AC90F956F665E1BD9FCB8FAD170329A78F9910AD4
          C3BB8AF63DB90F5847DDFF1A4C4E75E2E6D54D77D1E0324CAF5E6F6D5A58494B
          E7A488BAA1FF8199DA25D6B5525EE82348F27878B60DEEBE01755452ADCEF6B5
          343B2575E4FD89D853F7D611ABB5E9B5879D642D75DEB1C9BE369FBDD6A70DB4
          E92851C5606529A3C45F56B7985ECB69FFEEBF50E07519DE7C0C0A5234249F49
          1CE5DB905C54B0231F040401AA0437ADE335D8E9457D90F7294227D2BF9AAA46
          5D9D10DB30B50114941FB7ECB12DE65E9D82D757A6AF599130871A4808D152EB
          C0FC89B340DA377343F733A00677E007582DB42E4DDCE1AE4E4E38838E91E313
          1A5A2D5D0B2E75259B12CBA2FA4A1FF5BC31B652D1535679A48EFB85A7A82FE5
          FB4B78142BF5A5CAB0B4BC6177772918BE329C2DDCE9A03FFA21FE3DA9F0E39B
          D7F7C4F26F50E7F4FB0DB35888674470E522E418EFC478E7DBD38E2EB7CFDF46
          07A3874DF311698D846BB9D2EE71551E5758D04F34420262A90B3CEC6522597C
          AD765BAD0C3E3DC52B16A62DBEB702695A596ED3010265A62DB9969B4BBEF95A
          25A325877E8886EA443AC6BE5732FB919A1C294E55A9B964934964D47270DA9B
          04A8F1213F7FA52B6DECC7AD565B6A52180C46CDC4840A133443BC9DFD3B6012
          7263955B52C24E1683158ACC8291ABAA4E8B61E1CE1EEF9CEB2249954C410716
          D34B8D7CBC54099C8610BB176D43A6C1398BFB2292B0CD729C939040ECBBD99A
          FF2461C485AD4382E0136169119D04D2D25DB12F7C71D5AE47C341D7299FFE4E
          6EC1AB37490ACBC660B75DF1A21A83D1D46AA9603A3A9D169BEF2E3388DB57E4
          82B7D87171717C7C7C3F5FCA0FA3D68F85E4A0AC47ABA8CFDBF8B2059A867CC7
          C6520B5C9D1746BF0632D7B8716027F8AE5277BDD4E4A589E446B4685FEABF7B
          9733CBB31B578EF582BA175F633E6269964DEF07EEACBCC384BBCF73A769F95B
          D34DEF6F5E95872FAE3D0BB94C3B250E051242DB0179CAD2A9F431692E5A2650
          3D9259E83B3AD1CA4A12F69AF7AD60A0DC22948F527DFE95180BF780F717F79C
          94C7F82501E68C3FE4FE9E0DEFA03F870251F62F961E11F569E674AB48CB0B59
          B1E1E38B6AE281B5B5ABDF6BB06C3C85199F4F9041F434FF4B67A227948A77F2
          F9D3CC41F78D7FEB3206987AE4721502A7C35CA13C895F40D9C8F34761593DBA
          EAB1D37E619482A982D612BEB7D1D72AD6A3A2B6E2EE5B0701855F211A268DDF
          6FFFD90E4D553D955A65DB77FF07B9546FFC0C00000045444954474C4F572E50
          4E47940E000078DA01940E6BF189504E470D0A1A0A0000000D49484452000000
          1E0000001E08060000014C379E34000000097048597300000B1300000B130100
          9A9C1800000A4F6943435050686F746F73686F70204943432070726F66696C65
          000078DA9D53675453E9163DF7DEF4424B8880944B6F5215082052428B801491
          262A2109104A8821A1D91551C1114545041BC8A088038E8E808C15512C0C8A0A
          D807E421A28E83A3888ACAFBE17BA36BD6BCF7E6CDFEB5D73EE7ACF39DB3CF07
          C0080C9648335135800CA9421E11E083C7C4C6E1E42E40810A2470001008B364
          2173FD230100F87E3C3C2B22C007BE000178D30B0800C04D9BC0301C87FF0FEA
          42995C01808401C07491384B08801400407A8E42A600404601809D98265300A0
          040060CB6362E300502D0060277FE6D300809DF8997B01005B94211501A09100
          201365884400683B00ACCF568A450058300014664BC43900D82D003049576648
          00B0B700C0CE100BB200080C00305188852900047B0060C82323780084990014
          46F2573CF12BAE10E72A00007899B23CB9243945815B082D710757572E1E28CE
          49172B14366102619A402EC27999193281340FE0F3CC0000A0911511E083F3FD
          78CE0EAECECE368EB60E5F2DEABF06FF226262E3FEE5CFAB70400000E1747ED1
          FE2C2FB31A803B06806DFEA225EE04685E0BA075F78B66B20F40B500A0E9DA57
          F370F87E3C3C45A190B9D9D9E5E4E4D84AC4425B61CA577DFE67C25FC057FD6C
          F97E3CFCF7F5E0BEE22481325D814704F8E0C2CCF44CA51CCF92098462DCE68F
          47FCB70BFFFC1DD322C44962B9582A14E35112718E449A8CF332A52289429229
          C525D2FF64E2DF2CFB033EDF3500B06A3E017B912DA85D6303F64B27105874C0
          E2F70000F2BB6FC1D4280803806883E1CF77FFEF3FFD47A02500806649927100
          005E44242E54CAB33FC708000044A0812AB0411BF4C1182CC0061CC105DCC10B
          FC6036844224C4C24210420A64801C726029AC82422886CDB01D2A602FD4401D
          34C051688693700E2EC255B80E3D700FFA61089EC128BC81090441C808136121
          DA8801628A58238E08179985F821C14804128B2420C9881451224B9135483152
          8A542055481DF23D720239875C46BA913BC8003282FC86BC47319481B2513DD4
          0CB543B9A8371A8446A20BD06474319A8F16A09BD072B41A3D8C36A1E7D0AB68
          0FDA8F3E43C730C0E8180733C46C302EC6C342B1382C099363CBB122AC0CABC6
          1AB056AC03BB89F563CFB17704128145C0093604774220611E4148584C584ED8
          48A8201C243411DA093709038451C2272293A84BB426BA11F9C4186232318758
          482C23D6128F132F107B8843C437241289433227B9900249B1A454D212D246D2
          6E5223E92CA99B34481A2393C9DA646BB20739942C202BC885E49DE4C3E433E4
          1BE421F25B0A9D624071A4F853E22852CA6A4A19E510E534E5066598324155A3
          9A52DDA8A15411358F5A42ADA1B652AF5187A81334759A39CD8316494BA5ADA2
          95D31A681768F769AFE874BA11DD951E4E97D057D2CBE947E897E803F4770C0D
          861583C7886728199B18071867197718AF984CA619D38B19C754303731EB98E7
          990F996F55582AB62A7C1591CA0A954A9526951B2A2F54A9AAA6AADEAA0B55F3
          55CB548FA95E537DAE46553353E3A909D496AB55AA9D50EB531B5367A93BA887
          AA67A86F543FA47E59FD890659C34CC34F43A451A0B15FE3BCC6200B6319B378
          2C216B0DAB86758135C426B1CDD97C762ABB98FD1DBB8B3DAAA9A13943334A33
          57B352F394663F07E39871F89C744E09E728A797F37E8ADE14EF29E2291BA634
          4CB931655C6BAA96979658AB48AB51AB47EBBD36AEEDA79DA6BD45BB59FB810E
          41C74A275C2747678FCE059DE753D953DDA70AA7164D3D3AF5AE2EAA6BA51BA1
          BB4477BF6EA7EE989EBE5E809E4C6FA7DE79BDE7FA1C7D2FFD54FD6DFAA7F547
          0C5806B30C2406DB0CCE183CC535716F3C1D2FC7DBF151435DC34043A5619561
          97E18491B9D13CA3D5468D460F8C69C65CE324E36DC66DC6A326062621264B4D
          EA4DEE9A524DB9A629A63B4C3B4CC7CDCCCDA2CDD699359B3D31D732E79BE79B
          D79BDFB7605A785A2CB6A8B6B86549B2E45AA659EEB6BC6E855A3959A558555A
          5DB346AD9DAD25D6BBADBBA711A7B94E934EAB9ED667C3B0F1B6C9B6A9B719B0
          E5D806DBAEB66DB67D6167621767B7C5AEC3EE93BD937DBA7D8DFD3D070D87D9
          0EAB1D5A1D7E73B472143A563ADE9ACE9CEE3F7DC5F496E92F6758CF10CFD833
          E3B613CB29C4699D539BD347671767B97383F3888B894B82CB2E973E2E9B1BC6
          DDC8BDE44A74F5715DE17AD2F59D9BB39BC2EDA8DBAFEE36EE69EE87DC9FCC34
          9F299E593373D0C3C843E051E5D13F0B9F95306BDFAC7E4F434F8167B5E7232F
          632F9157ADD7B0B7A577AAF761EF173EF63E729FE33EE33C37DE32DE595FCC37
          C0B7C8B7CB4FC36F9E5F85DF437F23FF64FF7AFFD100A7802501670389814181
          5B02FBF87A7C21BF8E3F3ADB65F6B2D9ED418CA0B94115418F82AD82E5C1AD21
          68C8EC90AD21F7E798CE91CE690E85507EE8D6D00761E6618BC37E0C27858785
          57863F8E7088581AD131973577D1DC4373DF44FA449644DE9B67314F39AF2D4A
          352A3EAA2E6A3CDA37BA34BA3FC62E6659CCD5589D58496C4B1C392E2AAE366E
          6CBEDFFCEDF387E29DE20BE37B17982FC85D7079A1CEC2F485A716A92E122C3A
          96404C884E3894F041102AA8168C25F21377258E0A79C21DC267222FD136D188
          D8435C2A1E4EF2482A4D7A92EC91BC357924C533A52CE5B98427A990BC4C0D4C
          DD9B3A9E169A76206D323D3ABD31839291907142AA214D93B667EA67E66676CB
          AC6585B2FEC56E8BB72F1E9507C96BB390AC05592D0AB642A6E8545A28D72A07
          B267655766BFCD89CA3996AB9E2BCDEDCCB3CADB90379CEF9FFFED12C212E192
          B6A5864B572D1D58E6BDAC6A39B23C7179DB0AE315052B865606AC3CB88AB62A
          6DD54FABED5797AE7EBD267A4D6B815EC1CA82C1B5016BEB0B550AE5857DEBDC
          D7ED5D4F582F59DFB561FA869D1B3E15898AAE14DB1797157FD828DC78E51B87
          6FCABF99DC94B4A9ABC4B964CF66D266E9E6DE2D9E5B0E96AA97E6970E6E0DD9
          DAB40DDF56B4EDF5F645DB2F97CD28DBBB83B643B9A3BF3CB8BC65A7C9CECD3B
          3F54A454F454FA5436EED2DDB561D7F86ED1EE1B7BBCF634ECD5DB5BBCF7FD3E
          C9BEDB5501554DD566D565FB49FBB3F73FAE89AAE9F896FB6D5DAD4E6D71EDC7
          03D203FD07230EB6D7B9D4D51DD23D54528FD62BEB470EC71FBEFE9DEF772D0D
          360D558D9CC6E223704479E4E9F709DFF71E0D3ADA768C7BACE107D31F761D67
          1D2F6A429AF29A469B539AFB5B625BBA4FCC3ED1D6EADE7AFC47DB1F0F9C343C
          59794AF354C969DAE982D39367F2CF8C9D959D7D7E2EF9DC60DBA2B67BE763CE
          DF6A0F6FEFBA1074E1D245FF8BE73BBC3BCE5CF2B874F2B2DBE51357B8579AAF
          3A5F6DEA74EA3CFE93D34FC7BB9CBB9AAEB95C6BB9EE7ABDB57B66F7E91B9E37
          CEDDF4BD79F116FFD6D59E393DDDBDF37A6FF7C5F7F5DF16DD7E7227FDCECBBB
          D97727EEADBC4FBC5FF440ED41D943DD87D53F5BFEDCD8EFDC7F6AC077A0F3D1
          DC47F7068583CFFE91F58F0F43058F998FCB860D86EB9E383E3939E23F72FDE9
          FCA743CF64CF269E17FEA2FECBAE17162F7EF8D5EBD7CED198D1A197F29793BF
          6D7CA5FDEAC0EB19AFDBC6C2C61EBEC97833315EF456FBEDC177DC771DEFA3DF
          0F4FE47C207F28FF68F9B1F553D0A7FB93199393FF040398F3FC63332DDB0000
          00206348524D00007A25000080830000F9FF000080E9000075300000EA600000
          3A980000176F925FC546000003BF4944415478DA4CC8A11180300C00C0A707B2
          9E5DB20E1BC6B34F34F820CBCBDF2A0326763C2A6376B7EE5619D7C0613907DE
          5FDC1F000000FFFF627CB9D99A056AC61F9819294866F0323130304820696165
          626060D88724F005000000FFFF64CFB10D40500084E18F4A741A2318428CA032
          8FD20A36318218C204A2912844F5A2F112896BEFFEBB5CECA8507FD21B16AC71
          A02BDB79F890F6A9E931A60838FD752224EFD51C05B2D7BC71E07A000000FFFF
          74D03D0AC2401884E16757C126E04524ADC57A9CDC70BD84BD6708AC9DD82485
          60F32D88C481A9E6FB61DED46A493844D82F2E58F7B175C6298656DC71D36A19
          7BE16FB75AC68CC1B6868CF4274C399E6F69C9981FD7CBF40363C2DC711E83DA
          0E6FBCF0FC000000FFFF8CD33D0AC2401445E12FA3F8838D2044DC81853BD00D
          08EE56C10DB808BB941241B1914044B4790376E6D6E7C2DC33BCBC7380C90F34
          0EB0C0270A4D2EE189B61FDB175896BBD3D19F5C0F9B2DCEB8A4305B86C42E59
          053F4AF125F9055D320C3EA5D8947775C93B77125ADC51752C57C1B745BD5FF7
          C2EE1473CCC2F8EF5DBDC2F40D351E68BE000000FFFFA495CD09C2401085BFC4
          04BD884A506F16600B5A8290262CCB2EB4042BF1A60183A06820315EDEC02062
          220ECC6DDFEECEBE9F35CD76D4B1CDE364534BA6A536A96CC448DDD36903F1DD
          7D0317E2F6A21B3C8032924086C04C3DD1061DF74037E0041CD467A08A34EF14
          984F56FB4D8340D6BAC5DD84DD0392262080D62466594BAB3EEDCB980842F7CA
          6D2B36D384FC517F834D046DEBE9B55D7EC9998FD9234C1D8AB7FC07702E0CA1
          08CF4EBB65DA2245522013A60A8EDB4557C13A568F5C6EE3B23B1730D3C75544
          F2F3558EC95D527863944E968530BC88AF961C048128360C2A448C46176CBC8A
          47F0001ED1037804AFC2C685686210958F9B965402D1C431BE644230F0FA8679
          6D9FA4A427B4F4F1F25058E7A3923E85E78955205221142E84C654A126298102
          906C02568E711F4A57DA9EA32F0194637719987C91DD3685103810BF58F0BB7F
          42D237CCE7D91CC5676A3A76841DCE01B88CD7FBAD711487DD6A638C495040CA
          06519B89001E1BB711236F24CD67DA1E17E2019711216FA05EC22EE5B222F3AE
          C2173634CB9A3F0555D3C8F557F18263650C210F6F8E016FAD59A0917A0272AE
          4B1D03A7C87B95026A2B6AC31127698FAE5F8A4882BC1C601E14100E32212472
          8AA1668635C1EF81486CD7244833C8201267AC13FE5F6400BE53324BDEE09AE1
          F3907B23310C827A1D4D538A31DC51442E8EF472CE03B1AE52ACDD0AA76D8B87
          7DC075874B55323B54CA9CE7005CDB5240B828DD610000000049454E44AE4260
          82986CE4AF0B000000455854424F52442E504E47B216000078DA01B2164DE989
          504E470D0A1A0A0000000D494844520000006A0000004C080600000085D422BC
          000000097048597300000B1300000B1301009A9C1800000A4F6943435050686F
          746F73686F70204943432070726F66696C65000078DA9D53675453E9163DF7DE
          F4424B8880944B6F5215082052428B801491262A2109104A8821A1D91551C111
          4545041BC8A088038E8E808C15512C0C8A0AD807E421A28E83A3888ACAFBE17B
          A36BD6BCF7E6CDFEB5D73EE7ACF39DB3CF07C0080C9648335135800CA9421E11
          E083C7C4C6E1E42E40810A2470001008B3642173FD230100F87E3C3C2B22C007
          BE000178D30B0800C04D9BC0301C87FF0FEA42995C01808401C07491384B0880
          1400407A8E42A600404601809D98265300A0040060CB6362E300502D0060277F
          E6D300809DF8997B01005B94211501A09100201365884400683B00ACCF568A45
          0058300014664BC43900D82D00304957664800B0B700C0CE100BB200080C0030
          5188852900047B0060C8232378008499001446F2573CF12BAE10E72A00007899
          B23CB9243945815B082D710757572E1E28CE49172B14366102619A402EC27999
          193281340FE0F3CC0000A0911511E083F3FD78CE0EAECECE368EB60E5F2DEABF
          06FF226262E3FEE5CFAB70400000E1747ED1FE2C2FB31A803B06806DFEA225EE
          04685E0BA075F78B66B20F40B500A0E9DA57F370F87E3C3C45A190B9D9D9E5E4
          E4D84AC4425B61CA577DFE67C25FC057FD6CF97E3CFCF7F5E0BEE22481325D81
          4704F8E0C2CCF44CA51CCF92098462DCE68F47FCB70BFFFC1DD322C44962B958
          2A14E35112718E449A8CF332A52289429229C525D2FF64E2DF2CFB033EDF3500
          B06A3E017B912DA85D6303F64B27105874C0E2F70000F2BB6FC1D42808038068
          83E1CF77FFEF3FFD47A02500806649927100005E44242E54CAB33FC708000044
          A0812AB0411BF4C1182CC0061CC105DCC10BFC6036844224C4C24210420A6480
          1C726029AC82422886CDB01D2A602FD4401D34C051688693700E2EC255B80E3D
          700FFA61089EC128BC81090441C808136121DA8801628A58238E08179985F821
          C14804128B2420C9881451224B91354831528A542055481DF23D720239875C46
          BA913BC8003282FC86BC47319481B2513DD40CB543B9A8371A8446A20BD06474
          319A8F16A09BD072B41A3D8C36A1E7D0AB680FDA8F3E43C730C0E8180733C46C
          302EC6C342B1382C099363CBB122AC0CABC61AB056AC03BB89F563CFB1770412
          8145C0093604774220611E4148584C584ED848A8201C243411DA093709038451
          C2272293A84BB426BA11F9C4186232318758482C23D6128F132F107B8843C437
          241289433227B9900249B1A454D212D246D26E5223E92CA99B34481A2393C9DA
          646BB20739942C202BC885E49DE4C3E433E41BE421F25B0A9D624071A4F853E2
          2852CA6A4A19E510E534E5066598324155A39A52DDA8A15411358F5A42ADA1B6
          52AF5187A81334759A39CD8316494BA5ADA295D31A681768F769AFE874BA11DD
          951E4E97D057D2CBE947E897E803F4770C0D861583C7886728199B1807186719
          7718AF984CA619D38B19C754303731EB98E7990F996F55582AB62A7C1591CA0A
          954A9526951B2A2F54A9AAA6AADEAA0B55F355CB548FA95E537DAE46553353E3
          A909D496AB55AA9D50EB531B5367A93BA887AA67A86F543FA47E59FD890659C3
          4CC34F43A451A0B15FE3BCC6200B6319B3782C216B0DAB86758135C426B1CDD9
          7C762ABB98FD1DBB8B3DAAA9A13943334A3357B352F394663F07E39871F89C74
          4E09E728A797F37E8ADE14EF29E2291BA6344CB931655C6BAA96979658AB48AB
          51AB47EBBD36AEEDA79DA6BD45BB59FB810E41C74A275C2747678FCE059DE753
          D953DDA70AA7164D3D3AF5AE2EAA6BA51BA1BB4477BF6EA7EE989EBE5E809E4C
          6FA7DE79BDE7FA1C7D2FFD54FD6DFAA7F5470C5806B30C2406DB0CCE183CC535
          716F3C1D2FC7DBF151435DC34043A561956197E18491B9D13CA3D5468D460F8C
          69C65CE324E36DC66DC6A326062621264B4DEA4DEE9A524DB9A629A63B4C3B4C
          C7CDCCCDA2CDD699359B3D31D732E79BE79BD79BDFB7605A785A2CB6A8B6B865
          49B2E45AA659EEB6BC6E855A3959A558555A5DB346AD9DAD25D6BBADBBA711A7
          B94E934EAB9ED667C3B0F1B6C9B6A9B719B0E5D806DBAEB66DB67D6167621767
          B7C5AEC3EE93BD937DBA7D8DFD3D070D87D90EAB1D5A1D7E73B472143A563ADE
          9ACE9CEE3F7DC5F496E92F6758CF10CFD833E3B613CB29C4699D539BD3476717
          67B97383F3888B894B82CB2E973E2E9B1BC6DDC8BDE44A74F5715DE17AD2F59D
          9BB39BC2EDA8DBAFEE36EE69EE87DC9FCC349F299E593373D0C3C843E051E5D1
          3F0B9F95306BDFAC7E4F434F8167B5E7232F632F9157ADD7B0B7A577AAF761EF
          173EF63E729FE33EE33C37DE32DE595FCC37C0B7C8B7CB4FC36F9E5F85DF437F
          23FF64FF7AFFD100A78025016703898141815B02FBF87A7C21BF8E3F3ADB65F6
          B2D9ED418CA0B94115418F82AD82E5C1AD2168C8EC90AD21F7E798CE91CE690E
          85507EE8D6D00761E6618BC37E0C2785878557863F8E7088581AD131973577D1
          DC4373DF44FA449644DE9B67314F39AF2D4A352A3EAA2E6A3CDA37BA34BA3FC6
          2E6659CCD5589D58496C4B1C392E2AAE366E6CBEDFFCEDF387E29DE20BE37B17
          982FC85D7079A1CEC2F485A716A92E122C3A96404C884E3894F041102AA8168C
          25F21377258E0A79C21DC267222FD136D188D8435C2A1E4EF2482A4D7A92EC91
          BC357924C533A52CE5B98427A990BC4C0D4CDD9B3A9E169A76206D323D3ABD31
          839291907142AA214D93B667EA67E66676CBAC6585B2FEC56E8BB72F1E9507C9
          6BB390AC05592D0AB642A6E8545A28D72A07B267655766BFCD89CA3996AB9E2B
          CDEDCCB3CADB90379CEF9FFFED12C212E192B6A5864B572D1D58E6BDAC6A39B2
          3C7179DB0AE315052B865606AC3CB88AB62A6DD54FABED5797AE7EBD267A4D6B
          815EC1CA82C1B5016BEB0B550AE5857DEBDCD7ED5D4F582F59DFB561FA869D1B
          3E15898AAE14DB1797157FD828DC78E51B876FCABF99DC94B4A9ABC4B964CF66
          D266E9E6DE2D9E5B0E96AA97E6970E6E0DD9DAB40DDF56B4EDF5F645DB2F97CD
          28DBBB83B643B9A3BF3CB8BC65A7C9CECD3B3F54A454F454FA5436EED2DDB561
          D7F86ED1EE1B7BBCF634ECD5DB5BBCF7FD3EC9BEDB5501554DD566D565FB49FB
          B3F73FAE89AAE9F896FB6D5DAD4E6D71EDC703D203FD07230EB6D7B9D4D51DD2
          3D54528FD62BEB470EC71FBEFE9DEF772D0D360D558D9CC6E223704479E4E9F7
          09DFF71E0D3ADA768C7BACE107D31F761D671D2F6A429AF29A469B539AFB5B62
          5BBA4FCC3ED1D6EADE7AFC47DB1F0F9C343C59794AF354C969DAE982D39367F2
          CF8C9D959D7D7E2EF9DC60DBA2B67BE763CEDF6A0F6FEFBA1074E1D245FF8BE7
          3BBC3BCE5CF2B874F2B2DBE51357B8579AAF3A5F6DEA74EA3CFE93D34FC7BB9C
          BB9AAEB95C6BB9EE7ABDB57B66F7E91B9E37CEDDF4BD79F116FFD6D59E393DDD
          BDF37A6FF7C5F7F5DF16DD7E7227FDCECBBBD97727EEADBC4FBC5FF440ED41D9
          43DD87D53F5BFEDCD8EFDC7F6AC077A0F3D1DC47F7068583CFFE91F58F0F4305
          8F998FCB860D86EB9E383E3939E23F72FDE9FCA743CF64CF269E17FEA2FECBAE
          17162F7EF8D5EBD7CED198D1A197F29793BF6D7CA5FDEAC0EB19AFDBC6C2C61E
          BEC97833315EF456FBEDC177DC771DEFA3DF0F4FE47C207F28FF68F9B1F553D0
          A7FB93199393FF040398F3FC63332DDB000000206348524D00007A2500008083
          0000F9FF000080E9000075300000EA6000003A980000176F925FC54600000BDD
          4944415478DAEC5DCD8F234715FFBD6A77BB3D6EAF3FD6DED9C96680FD18454A
          C88240447C1EC3018943C4014588433870418213FC0D9C1047AE70E0C02D979C
          C801212EAB481C4004656677C24E20E38CEDB5C75EBBC7EEEAC761AA3C65AFC7
          76B7DD9E78E3924AED1D7BBBEBD5EFBDDF7BF5CAF54CCC8C4DFBF437B199820D
          509BB6016A03D4A66D80DAB4455A6AD60788682D0431A3D79863A619FF5E6878
          97BC9E4B9EB9807ACE1B8DBD16EA3AA94705C5BC9A3D8C035CEA330E12190009
          00D6D8554C0073DEC9358131BB345EF3BCF75B18A8546AB15B04417095206950
          5263DD9E0256148A33C109541FA8AB34409B09566A5161832030B590A60C7C1E
          214D8DE388FF3F2A4896EA360007405A7547FDCD048B62C8360ED200C01980BE
          711D18804DBD672AA6A016008788B68410DF05F02522FA3C809B00F2003E8831
          C9CCCC0700DE9752BEA384D182704296E40070016C01C8A89E15427C93885E02
          B0434465003966FE4F4C3FF598991F8561F857003E801E80AEBA92028C675916
          CDCAF58D45504269DA9665593F25A25F7A9E773D93C9C0B66DD8B60DCBB2E0FB
          7EAC59ECF7FBF07D1F9D4EA7C6CCBF9152FE4E093530045924EA2383EA1C0D0C
          801C00CFB2AC1F10D15B372A9542A15040D6F3B095C9C0761C9CB65AD1698219
          ED761BADD3539C9C9C3499F90F52CA3F01E800680378AA00EB1B74C893A2BE28
          406990F29665FDBA542ABD552A9590C96496CE4DBEEFA3D168A0D168FC3E0882
          5F0168CD026B0EA0B4356990B6007800AE01285896F5F3DD175F7CE3EEDDBBA8
          542A10420CEF4344889BBC66668461885AAD8683870F717474F4B694F2B7009A
          004E15685D032C56EC126BC1AB05CC0921BE97CD66DFDAD9D949042400705D17
          376FDE04801F0B215E571A9F5AC2DAC6A4BCB4B2A66B42886F148BC537EEDFBF
          8F4AA502CBB286409960C5E9420858968572B98CFBAFBE0A22FABE10E26B4A41
          B26A1CA63F5C2833418ACBCB42889F954A2508916C524308815BB76E0921C42F
          0094D5F36909FE4947759AF6AE11D10F777777E138CED07AC2305C5A67661011
          1CC7C1175F794510D18F0CA0324A7152D3D66CF3CEB60DC023A23B00BE92CFE7
          571243ABE77C998876154DD90BDE52FBA7B4068A886E10D1AB2FECEC8C505512
          1D0076767640442F03281940A5D5B8AC452C8AD4045D23A2AF7B9E2756955612
          42C0F33C9B88BEA334D08E6955E6A2565B940B608B885E2E160A421001CCE030
          4CA483196046CAB2502C146C21C47DE5275D359ED4B4755B6A4E21D300724474
          DB719C95AE4CD3E93488E8AEB2A8B472BC1C132C33E27300B844742B93C95CA4
          1112DCF1D6CFC86C6D819E3CD955203906F5599729E23C4009234ABA61DBF64A
          8152998F8A7ABEA3C6132E6055E3605D771C6748794936EDAF94B2978CC5B609
          526CA02C832A3CCBB2560A940A5AF482544747C11280D23D6BA552237E2449A0
          C2308438771D99B1714C4D57CD4B7D9AD7AF6AFF8A0C1E8FEBA3684266C2D26B
          C9555A148F52B1995334D3551C87FAC434FE4C5A38B5D89D4A0D31828A110D0E
          99CFFD53823E2A64860C434829A116B8E618A6267F531135F2AADB22E3B8749F
          6924424B70F03AFA33B20E73EF77A5220A7AD56D5919F591C961C37FACC2474D
          B05A9A35CFEBB27198C4960799F9CE55F928EDA72E0188966151CF63A3613662
          453E2ABC0826A22D53B0692369A3155BD406A88848AD2C98E0D1606203545407
          B82AEA8BBBAFB501CAA0BEA4030AF3391BA0624EE030CB9DE0CEC0F0391BA016
          9840454D94B4E56EA86F098E7E63516BE0A3545F85456D805A54DB133E263BE1
          FEE3DFACE50D50732E782961EA9352CE026C03D42C6BBA028BBA6C59B77E40A9
          75CD199068D260654069ABC2F9D79B9F3B1FC5F3F0F83A58D4672185F4DC5854
          1CB9D6D1A2AEDA875C89326C2CEA0AA82F4EDB9C8A5F9396A8453D7DFA14CD66
          139D4E07BEEFC3755D789E8742A1806C36BB9613B66499F8CA817AF2E409AAD5
          2AF6F6F6502E9791CBE5D06EB751ABD5B0BFBF8FEDED6D148BC5B50249CB74FD
          FA75DCBE7D1BAEEBC2F77DB45A2D1C1D1D252A532A29ADAB56AB78EDB5D7502A
          95867FCFE7F3C8E7F328168B78F0E0011CC7591BCBD232DDB97307C56211A954
          0A44845C2E8762B1887C3E8F478F1E2526532240359B4DECEDED8D8064B652A9
          84BDBD3D1C1F1FAF0D50CD6613DBDBDBB871E3061CC7816559C3B354524AD8B6
          3DA4C524644A2498E8743A2897CB533F532E97D1E974D686F63A9D0E2A950A5C
          D7453A9D1E9E59B66D1BE9741AAEEBA252A92426532216E5FB3E72B9DCD4CFE4
          72B9D887B2AFA2F9BE8F42A100DBB6279EEFB56D1B854221319912B128D775D1
          6EB7A77EA6DD6EC375DDB5014A070EE6B95EDDF4DF7414B83640799E875AAD36
          F533B55A0D9EE7AD0D509EE7A15EAF5FBA0D4244A8D7EB89C9940850854201FB
          FBFB68341A13DF6F341AD8DFDF47A150581BA00A85020E0F0F51AFD727BE5FAF
          D771787898984C89F8A86C368BEDED6D3C78F060EA3A6A9D16BD5AA6F7DE7B0F
          F7EEDD43A55219CA747272828383833832D195020500C562118EE3E0F8F81807
          070723ABF8DDDDDD4F1D48F3E4E0B44CD56A150F1F3E5C864C896526AC285BD5
          D96C766140D4D1D00C9239F6C398523260D93269655073E846012CAA8F92ABAE
          93AE76787B51A922823607AB94C9F8366E0FA31BA1BC4CA07CB58DBCB236180C
          C0CCA751A9620A3866154AD632AD729B23080230736B6C4C5377AF4504014366
          FEE4ECEC6CA5409D9D9D81998F7151798B17B4A0918961E6EA6030B838089D10
          58E661B97EBF0F66AE62B432E654B0E6F151C3E280CC7CD8ED765706929412BD
          5ECF67E6235C548E0C17006ABC64A864E60FCFCECE20A57C26E3B06CBA9352A2
          DFEF633018F4944C6615CCA9A54BC59C400D00F8CCFC71BFDFAFB68CDA7549B6
          5AAD0666FEA7E2F39E1A072F684D1AA48152BEE320083E6EB55A088200411040
          4A19B92895D9CDF7A494C3FB0E0603349B4D30F3DF715101339800582C8B92EA
          A65D00BD300CDF3D3A3A7A3393C95092E5761A8D064E4E4E9E8661F8179C1720
          D435EDE25A54684CC840F53E80411886EF341A8D9F388E43AEEB8E94818B6B5D
          E3C005418056AB8576BBDD0EC3F05DF5EC3E464B96868B529F8FF32280CD300C
          DF07F0B7C78F1F7FBB542A219FCF6359D55C9819DD6E17A7A7A7A8D7EB6D29E5
          DBCCFC09802738AF18B9C8F7FBB43599F55D7B4AF9FE0DE0CFB55AEDF5ADAD2D
          789E37DC6F9A05D2A4F7B59FD3D6D6ED76D1EBF5D0ED765B52CA3F32F31335A7
          3E464BB25E0AD4BC15305D9CD723BA07E025009F23A23B4288AF12D16E269349
          DBB61DA962B31002B66DEB6001BEEFA3D7EB31337FCCCC876118FE03C009800F
          01FC0BC0218086126AEA8275C2E4E9821BBA4EDF350005255319E77589F24474
          5708F12D22FA422A9572C72D6B669A81089665E9A80E83C100411030337FC4CC
          1F8461F800E7952F9B00EAAAD7D4BF3B06BD87710BD40F94451DE3BCC69CCDCC
          2CA5AC02B03B9DCE36115DC379F5AF799B4D449ED22E66E69AA16967CA828E01
          7CA400EBE0A29AF12261796058530717152805333F9452FE0F8023A57C81888A
          8856D0D1513235D4645799B966D07657C975AAAE1A1C4D7F0B519FA6BF9E9A30
          CBA0C3EB00B2CCDC6666B3F474945C979E44ED3BF4043600FC5701555793BBC8
          B9CDCB80D2359ED8F0C76966EE1A32E9B15284F91AA75ADF00AA858B7AB21A28
          394DBE54042107EA21AC6E7CAA6823AFACCC31D231F30824C69C7CDFB0A4E618
          2D3C5DC09A2605145A21AC0920F5F06CB1C37190684EEBD535CFF57D3550DAAA
          9E2A00FB9851363C15512335407DF5B02ACE0B1EEA5A7A760490C8983C53CBBB
          4A80716D5B4656C25C6E90A12C26785BB828543F5E478F62D0AC8E2E7D4336DD
          7B4AEE00338AF2A762081B189A706A0094C28C4AC3133492C6D73546C81A4CE3
          EC05AD0A4650121ACFEDE2A22AA5BD24A002832D7C4321FD3139C36566CF270D
          A48B676BCD2102583CC6E949FDD4C3B855051316C03E2E7EEEC1543C3183F268
          427ACA5CB70546C0602A6280397F9F23B524C1E5927CC84A12D8639665027566
          0064C554C071E533C10A8CD7E118A527F6232AEBDC4C05A3B1A85353DD24CAA3
          08F71E076B5A02767334748E0985C106A4B4FDB21FF9A298563BE9475222D1FB
          E60CEFB327D367F9A1A8F7441C6022A79036EDD3D136E7A3D6A4FD7F0049D9B2
          6CF30ECBE20000000049454E44AE426082D9C5DBD80F000000455854424F5244
          5F3230302E504E47F716000078DA85587554D4CFD7FE2C20DD25A934487723B0
          74772A298D3448092E9D12920B2CDD1DB208D229B08074770948088B84C48FEF
          3FEFBFEF3973E79E3BE79E39E73E33F33C3313A3ADA984874D850D00009E8AB2
          BCEE93777A321B4CF4A7DE95A364FFC961B92B9B7801000EC97F0602B2722800
          005BCB514E4E5BDBC1CDDBCDCBC1CD9D4E454E8ECEDDD3CDCEF1BD2D00F82DC1
          F4ECF5F50EC8A5AED69060B56848AA9A9B2E19269D2E380E429ACCC24E8F45A8
          1A4D5FB048A6D343A4A08046FD233F1A352101124FA6C3891B8BBD80B1435F98
          1056141D3BF26F33B0C879AEFD6A6FECA179FEF57EF505AC6902A31B13375D59
          404708825B017E41B41136D43FB8B9C32D1382CDE40E106236D9D07BDD338280
          EB6049490E866E8C4E00E4378D8309746B6477F3D2443D121C82A16F41907050
          B777B2A81A268414900948009702328A20082C93450FC847032C47DF596F03DA
          5C8025EBA7BD690002BB8606828037A9F464A0FC64808EC4365A1E709000AA27
          0C631500635E80D44EAD5F0C58E00278558CEC9481FA16A07B9C10A711C0C405
          7875A2235E01688180E50F46463F201C0A902A9E1B49FEE1A825DC677F420ADA
          28D9CA24A610F20693CB03C3C888FB05DBB8CA730E52612B14AB2C19EE5E7F28
          257F8820C1C6050200F293C99EAABDB8F71BC7AF1D1F174E80E35B701D76A13F
          32585B6F3FEC4E54B9CB00C0A677F0E403274F131544021DE2F250C87C82E660
          8E93EF731567D74820D30CE41F2C195DB8FF878D424152EBE2E2EECECE826A3F
          F88DD58851D0837DAF45B7D1FDFB9B60C9BBABCB8DCE2DA6107EB31025B4EB8D
          5E0452BD8466E20B56B8F5CA5EA2D25D0BCEE31DED3443BF8A75AB313BE9B60E
          B147827C56FC057F09430CF8CBAB01E6A9479BAD75CE7FA8AFD785807AA7D7A0
          C064AE72B377A87FD558098DBDBBB7AE00E0FCBB5BCF0C1B262AC4216C73C2F7
          F154FA5E299F1980D8A97CF100007379266EFD9126E9214C0090CF0F61AF97A5
          46F6507076A3D3F43C5BE9C1B9B3140E0733F5F78209C1D836101A4FCB57D5A1
          60B6C8B17A5A764B9E19195AC16E1D87C814777CEE5E836FF852EE04B75698B9
          3D6CED215868B23F3049ACE897A241D6B1C68C0998CFA111D7F43DCA68C4714C
          74C3D1A43A0C6AC942CA7CBAB1FA7406CAB4E7529E2862516F15DB92257E00FC
          A17791ED4A7CA9218D3A5233B8CD72ADE52254E18A85383F6DBCF9B212C9F3B3
          7F7A7EA5928A172ED8FF59E540B094F85A6E88B7FB17058640FF7B5EEEC13E70
          83282756CABBD106866ADCAA41AA7AC36AD4EF3197EF261A7CD1884314BAB184
          D17CC174562F64958DD58D351794CBE96898048996B044B050C3757A591952CA
          D5BEB2B411DDF45358F3F345192B7332CE112792F0100646CBF58B3011C7C8F1
          B3B626A1A83414EB4F114F294EB9EA321E7056640B2A5331A60C2FD938376288
          A572D271FC88D881EDF4ED08EC50EFD09FBFC18659CB78145FEB6DB1E98E38A9
          52EE12EE0AEEA2DB66F2CB1A1465E9AE9617E81309259A826B0AE0BA753A51E5
          24823E59626361E42A6A25358569D3540ECF1DAE1CEB7E79B711ADA6BDD0CCF8
          6934357AA0F42BE3172AD217172F922C6C28DA9E8D329B0283C29ED297A22E53
          BD94723A8E72489F5784EF28731F4A007533306687B37F244B1EC14E534D6349
          A366E7D1AFA82CAD5CABC431B83018D54FAC30D70BAA553410D0DBAEC09A49AF
          32A884691FE951EBD95748944755DA97BBE94B17079BDCC7A09BF4A9F769C915
          EBE437586CB70FD2E1BCA36CF2E3A477C6AB8AF40911EA6769185BFCF881FD7B
          E63DEDF738A9CA8A023139015501A326DD8B543B698CED4C8FEB1C6F4DAC7DB6
          B28C8BE0D835D2D3575BAFA84B05D55BF96CDF3A57A667A41B572957E954291D
          7508D71E97C14A3B14BE9BFC0BC1971D52657DCBAA649F38FE0CB6AFB7A8B75A
          865D46AE21257E59CB5DE95C425DF05DDEB7CBB5EC2433B7D31C92ABEE56B6E6
          DFB17F4B13C473AF7FEF725B76A9846B8CDE84CB84BE8C3B4E213920E4E12649
          CB33B4FC4747CEAC4F46AEC42ACD2A63333CB97552B26856F1B32241BCE3E0DB
          6DA66D974197C1221674167A16358D438D932C5D8DD6D257A512EA12EA436388
          B1C2B139A850B614DF3CFF7EF67EF67CF67A8BA5A99F2927BC1CFECD56A571C7
          B4D4E404DEEE1A612A6652626C606AD6A45803AB619EFB5EF3BD8CA8AC553345
          B32A77CEBEAFFE0F7C185ED14259BFBB80BE5C0B77810759D95B3FB76F19A8ED
          3B49E948096A0BFA7C2F858117B5885F456B4A1BECF5D59354DC507C2D6B3CE7
          443A6800997EC0636F3C4138B120B00D27197DD5EF08D3CB9E56B27F6EDFEA15
          76111D17A3163ACA9DF19A3B9B7A70F547C78EAAF7A587D966C0D4252CBB29BB
          F7B87CB9EE44F8C4F1246A250F2198F72AD744C0EB67DF0FB90D9DDD49699CBC
          345EE7F5EA602D39AD10FBE67D469E773CC94635F3F52D25BE955756A7CF5FFF
          7DED99B7FD7A5B52648D7FCDC40221D2DDF2A36554ABCF2DD722625DEE13E3A3
          CD63C0E32450066106D9A3C684C886BC41F9771DF091BE2B415A7CD9F66FE3E2
          B16C7C7EAB2C996C62684DE86E4F0DBDC38FDF4935F457FB99E3C9E38EF811DA
          C1BFE67E6258ED59C5F505E3B246444518454A27B8471B534DF26508F94EAEC8
          79ADCBDFCAA7CBAF65DBF36989D571A90AB1BFAEE476925C1269136C931EE4B6
          3341CC1AC38C55DEABD18871B3D70ABBBEEF5CBF3BBE88DA826DE16C073ECFE4
          F961E6EE5F30DE8B8C2823AFE026E6144F97518FD6144D3D9325642F278F673E
          27F1654EC0F6EFA5EDB567E099149E8C5E907BCBFE42F35C995D23E0CBEFE476
          217FA6018112CEDDD670D68AA476753CF5D56CF15CF2AC0F742EFC52E21D7C61
          5F92933CC095F41A2970FB43FB3DBB0FA3D5B6118D0F03AE712D3C2FD230869D
          9B92AA9F997061C3C1A5BFF44DD9E6D9311AED6D8DECBAC66246C4D2AB7239C6
          8E114D23CB492239A7798FC7C4BDC49B5FE025916A465CB4C67B1DD54E628D92
          1EFECBD8DB64CF38220DD1AB25BFC5C2D95D66B5AA8E8D326A833B5802349C43
          CC7B46427B9A41CE473806D8BB1141472BF3C7665AC63C26EBCD56B79130EAD7
          6431B1B5A4CBCF33C83E2DB0ADF8ED5247B98D74415752BF5654F5B7DA4CD84D
          D91DECAD71E5BEC14FAFCCD8CBC077C55B5CFA8AB76EF8F5F8F2AFC2324FC618
          DBF2F730B85C6B5197E4B776DBB2E1F1310969FD627DA4FEADBEF0C9D46AB3D5
          FCB5EBE4097560FB5FC1DFB3CB6FDAAFEE5F0F772E1B800C3466ED666DFFA9FC
          6BBA92AE8DA93CB84EFFE76256A3E9E2713C843A857A8FC1880F9F6F9D99A59D
          92D2D74D9CE33852C21F7AD9F9003BF5E5C213C633F89C33B8C5E82EEFBF7370
          85B57EF5024F7CE9437C60F526C6F4CB0FB4F6B43C4EE0ACF32CC56CBDAC7F6F
          ACDFB469215E4FCE1DAE05DC292DBF24C8119434F157BDD01F765C3A089D4EB1
          3F9F8887A5C18282B96F562C970BE181FBEFC6D79D08DC4EDB08BD37A7141EE3
          F625DA25C6DF9E7FF33E6F5CDE2531FA669455276EE172E87D28F99032AD35F4
          3DE77B566DEB5BE7D693808EE640BBAB03EA5C91F1556487FF1FF2C7B9D95C31
          A9D58E8B00B7AB81ABCB75F2D5604FD6FBF1D1EF8BBEAC2735ED5AED16489963
          D945B9D5A859E9370F2B0BA72B9F9CBA7DF32F265794AED023C2261E922F1309
          E49E2542134723F1228F72455F8B896D497BDE1FDC95C94DD84CB0E43E7F287C
          18AD7D4ECE137C3D7B343F3E99395990719E91D2E5F2B1E4FEB0FB88B26E79B0
          77F045E7B09F009F39D2F0DF718FEF8A2FED69D13A81D6CE47BA4F6C8F0E370D
          977A3FCBFEA550A6A43CA2A1665EDCBD13E05A7EBA6FD2BD53D6D50080006600
          808401C0CDE3933F00001F5E0038B40400F14C0078EEF6C562401100701954E4
          65F5FD967EC326DC1855C886BAEA96565D878EFF2436B0A6C0F078A50BD33E2C
          82428CFF5C7CA34912A5C3C7A4C71F0DC121CED970DB0817F58C40C5700D5C24
          09948956FB4A8C4118270C1DE63759F07B17F87BA141E283AF347E85E78854C2
          B6C571BCFD914AC9DFFEDC93804BFF538359E7EF2FF904E2251F19108414DA8A
          B86CA823D1205B1B2215B34B1083298E0272F62827A894E3A143FB8ADB5F2AED
          B55E48404F84755D8464827313783231206E0F94719B2AC7809704580E2458E3
          221C318C308A5AB403C7A673DDACB42B66ACCB304337C4E95FB1551837B17667
          31F71FB8A32CA29F5338FDAC0D4F33D55FA4C3F4E628C6A2CD535459DDF21B7C
          94E6605213A686A0D27165333E96F6158A79C7C95101A2A83FE71350F116FABD
          4AF7F467503608272309B796814E19F9BC67EED4322FBA31BC70F9052E5E43AE
          FA783F2AB117916E864B0E8336501680A4642E8EF06B71A20E14CBB8E811C013
          719727B65FC18AB8138D2DEC4239032101EFDD6426DECE91A65F956F2DDE3F63
          2E2E71314EBFD463B82DD9F7171180E2BE5F8E7459AEE7C4E93C9D108ABD0F7E
          D9795A347D309379236245F1A0C92EF493D4C46656C9B4DC8B94021003726D4D
          D6590B5B5C0DD823C00590EA7D2BC69490635151C7663B02128443CBB2032C67
          E3FAFADB30E21366DF9916200E2C019ACCF59DE4F8FE2B956EE4DAD8BA6B8DD5
          1619AA252DAA25C4FC50C4D4BB94D37F0E82544FAD8B2074C3083035EAC94249
          3D6779E6880AC1D8408784DA9A48AF07DFEC9EAE767D7A99A6FA0C1CBDE91F8D
          79C15207A5D4212D30ACB27A9C64A479F1A2933672D30D2408CA517630C3231F
          FDC53F1F69F42A9304FC91357BACB3B9B9390D930970377BDEE2B68E0E798943
          BF964A9E67DABBA648E0EF78A021124E68C1411EB71E787D46CF9E86CD394A15
          3A6535361D4EF884C9AE272581C5275A79A4197DBF5171888DAD34F2C6BD0081
          366C6C4E0EBEABD667978DB649A10263AEB47A2961D20783F239EBB4D432F366
          2A35233AA8E59161C7C72EA20902C85CB6D8F4B94C4A79B4218FB39B79731279
          24239EBE2295A6D354AECBD2241CE427EF4DD09D717E73A73AF7F35CDC82A9D0
          85B2F4F733AD8ABDB2AF280AF22DD1BF2E33E07045B001311E0087C365E4EB50
          D81CF3A71A2DE6185E2878425C09278DA42648AA5439B0E837FC7335E4D7BF90
          3B4C1C18DC961AFAA7E25886459B739163830941880D36D5E2104A4BC591466D
          4ED2F7F4FD72625A6D8DD2152AFFE033A9AAA5A09DE85FB5DBA21CABD0D26947
          C2C9A0031D47B13FE739F548B23CD46EE64209A8FA1EC3E7A40D5A379FCF8841
          F45F07D32E58C393E03C1F28BD26AAAA4355F11BB84B1D692AE2A3FECE25ED62
          9E03A82EB6AFED40749C7787F99553E79741F329E165F1E2565913D3F233CE51
          D3576CAD0E3AD4BACDE2D8E9806A73759AEA6704A34A686C21E6D6C7C31FFDB7
          7C7C66422EBFF43CEEDB4E2C92C987F661450EEA76BDBA81C30601A48991D652
          65E565557EB93F595906268AD352B257630AAC121406A29F2921F62FF442BDF4
          FBE379630923E977D08D4EFBFA77DC9C14E3DA5D4D8A5F66ACD9539914302FF8
          37DF4E37E2EBAD9FAA8E95FFF2196DE43F640CEB5BBA6B8815738A9F9F32D86E
          E716C14FF9B62B1BD0E965E0959A55C60D921F3D2B7FAEE390F9D9789286CC8C
          93C56EB9B4FB87F292C3C00B5B99316527DB38AC1766EA14DA4D9A902AECA08B
          B579FEFCAF3F3390A1E0AE0490D03E80DFB482B54649613E0431B5046C1D0A8B
          A5E6C33B99D59183457396095F5CC89E26E1723AC67A54FF80B8D95EAFB64575
          1AC1E361A6B9EDE56DC7CE04F9A48998852999C16BDE486B7B5A78A13365091A
          53B2ED1A883E065CCC58077B7C63B196A1FC3F6AEB87F0E7C753FC3F217A2AD1
          7FE1654592CFAD41BB38F7FD9B2F5577A5BFCB36CB0A781022B6FB93CEB452EC
          93211FCD3FF7F8CD0885BF6ECAE48D8BB9D9412249C7EC48609A189DA77D3E66
          7EB9514F24F05EF87B3A2ADC0676BD242B15744B3AEB44262121C19631FA63D7
          F38910CA679D169697FBF6F6586207B64C6575C557DBFD497C4FD7228EDACE82
          5ED618E2444545C51CA6AA8E1C56CEB2AFF96DE3A5AA966CAE5FDC489EDF48C6
          0E307CF0F5DD141D5FF24B9F3A58EB0864238F532ED1A563D8F114238D53D8B9
          F0970CBE13E583118366DF0B37343509A0A864E85684C360B434B4B43578E576
          4D3163631A2B6D3E3809DBDD8DD59B02537DBCE12ECB7DF599E19A319C2CE230
          FC91DDF3FE89D4515B6F71583356E0535D4F14537BC400D324704E5E807FF616
          C79BF7D1A9D0279E7E4594781EF4B2F5ADEB96BD67EBCACA8061ADDCC775A502
          6D88CBF2BBA30F4FA9E082A44CCD18BFD4A3B6A7A249A4A75D5B36DB4E9620BA
          38181DE651C49722CDD86FA9B573F79F284BE34EBDC6306CDFDF1975E44272E6
          E852EDA59B8C7CF9FC51CC412A66F9139E1D1D5282549F1B4E45A8F07E1F1F17
          68B355E3FD371C1686FA94DC703A7FE4434343C354AAC7E0A52F9C3DF004EC13
          46AC2745738ED355DE01A71D57671B3DA8FAEC69059A4343430BEBEB794AAC6D
          86DA803627F9A6287E4242427D57977463DCFADA5AF0099D464A989EB8419581
          6400D281529C391D5A6FE78FA6219C6D4611CD799324CB9F7861A7CEF6ECEB7B
          582ADF0F3E6F7B90F0110D190BCC2A21EEA3A79ADB9C365F981046D58C4AE088
          1D419108D81F9AFFF1C62F336DD8921710C84350B1B3744F56A9354D39A6B588
          85D201022DD641597E57A6887CCB7E445E0E0C56433AB3B848997983F99C4CC8
          5F96808A92C2AE161F3D2C0E8515AB67EA65E8FAE9550FC220DEB03D17D3394B
          CCC918990125685B3D19A18BB08A36AFDB17B8A0E766072BE14062335008A037
          7D4FAB1F6E75AD3E68B5B8C98D2B87FC17848B1E963BA352E72AD5C0D49A493C
          034026102FAFFEDD3BA955A96417CF3809F15E48DB4A9E0E079F85AE15D3E115
          FFA17D267BE651350B2644C30C05AC28C6DFBED775BB0DB4A2C09F90A0C0FDF9
          5EB807F16948C1F6C812B7BE55923D95F518E597820EF264737393E04943994D
          14EB261D9E94EF5AF0497537DAEBEB2B0D24EA94149620B83647A814F23A48CD
          A2C9EB986DD19DB61365FF79FF0E0E7C6E4C94AFA65C5F978F3F902A9C8E385F
          F199C64A9A0A226F44794E96E30B7F05019F02CF778645D44A889F4E42BA41C9
          67E8E4F1070F4FCFD0808E35FCBE3317BB07B46EBD1CA350F39DD6A0916C64DB
          B194E3C747F4B37DD39ABF7B8383E89213D46B6E6DD853DFAE6625CBDA6B968F
          0BE78F0A968FE1BDBC778C02D269EF0EDF7D9DB92DC92FAD797FBCD53EBE810A
          D401D7B844AB4F92098D860B40D597E02E0689EE87F7C92ECB4E0DC0FAD5E4D1
          652654DA6E2F8C2DF601B441D11D053C3CDB0064E4D8853CFAC4EDCEF4E9B90C
          3E5D3DE9F54C45FC4540983F431B4FF8353A5110779A6AABC7441BFF980CDA68
          E34C257E580F204BC82BF0A91FF1525EE76BDC45EC9C06E0B3E874BE4ECBD5AE
          E4C13D9DF05B26608668DC79680981B0A230042DC034ED53A25D37DA2BF7BF5A
          9324B3D6C4415B4B4D96A0C87C46E0A58A25ADA34F1CF728EA58B6F8B7724EAE
          CC1B1D8AC847D48DA78D404C44C6F7A6C04EE9702629CCCC762F8B1CFE5DB78E
          C45FDF5DFFFA0D1BB2E26C3E05D5CE71F38C05C229D00235993DCC66CE4F118E
          763AD1465D00CE2CB02AB9317C9303703342749BA94DB213A7112BB3DEBA4125
          94831C2F9C82F0F4719EFB6C9195BB7F09AEA04CA5F911572FF9270697DAFFC0
          36213D01AA484F94BDF32F8B55E89DD5A637C88DAA255F1BDDEA73C84C5F9342
          FC769283EA291E339B8FF93355FFD90AB485F9BF3138FBB7DE3241FE0DECE338
          945554AD7F719394A9255747BEEB867C6BE662E4287013511620A75D8BC48DDA
          3EDC9EA2B132ACE10ED210990DD03DA5831F9889BE1A3D2F2E5B52FD39593DD1
          8BB41D9BF5B0B128E2320953E10B94AD0B85B3C57C3DFAE0A1E3B2644E5C2E13
          47DE699714AC3EE1005DBCF0A03DD85AA46ACC04910F590730742D506C1BF464
          E2D5F38006F0B4DE129D3BA807A8AEB73C5B0A9515E9A713166136548134FF6C
          587A7FEC6939B05F2380972454061AFCAC1545E6505764ACBC6F1B381347D716
          A2F37EB602BCFA2D4949204702DF5917652EF563A6B54C8102EA9739CD0C849A
          60D9FC79E699B09E9F48B3586E8DA8D7ACA4E091181F4126544F59319780AF2B
          D194E4E9F1A0B4DA98E3F956F0BF2F6E40454153BE166C19FA3FAF1A15850F00
          00004855474542544E474C4F572E504E478C21000078DA018C2173DE89504E47
          0D0A1A0A0000000D4948445200000050000000500806000001F916C23B000000
          097048597300000B1300000B1301009A9C1800000A4F6943435050686F746F73
          686F70204943432070726F66696C65000078DA9D53675453E9163DF7DEF4424B
          8880944B6F5215082052428B801491262A2109104A8821A1D91551C111454504
          1BC8A088038E8E808C15512C0C8A0AD807E421A28E83A3888ACAFBE17BA36BD6
          BCF7E6CDFEB5D73EE7ACF39DB3CF07C0080C9648335135800CA9421E11E083C7
          C4C6E1E42E40810A2470001008B3642173FD230100F87E3C3C2B22C007BE0001
          78D30B0800C04D9BC0301C87FF0FEA42995C01808401C07491384B0880140040
          7A8E42A600404601809D98265300A0040060CB6362E300502D0060277FE6D300
          809DF8997B01005B94211501A09100201365884400683B00ACCF568A45005830
          0014664BC43900D82D00304957664800B0B700C0CE100BB200080C0030518885
          2900047B0060C8232378008499001446F2573CF12BAE10E72A00007899B23CB9
          243945815B082D710757572E1E28CE49172B14366102619A402EC27999193281
          340FE0F3CC0000A0911511E083F3FD78CE0EAECECE368EB60E5F2DEABF06FF22
          6262E3FEE5CFAB70400000E1747ED1FE2C2FB31A803B06806DFEA225EE04685E
          0BA075F78B66B20F40B500A0E9DA57F370F87E3C3C45A190B9D9D9E5E4E4D84A
          C4425B61CA577DFE67C25FC057FD6CF97E3CFCF7F5E0BEE22481325D814704F8
          E0C2CCF44CA51CCF92098462DCE68F47FCB70BFFFC1DD322C44962B9582A14E3
          5112718E449A8CF332A52289429229C525D2FF64E2DF2CFB033EDF3500B06A3E
          017B912DA85D6303F64B27105874C0E2F70000F2BB6FC1D4280803806883E1CF
          77FFEF3FFD47A02500806649927100005E44242E54CAB33FC708000044A0812A
          B0411BF4C1182CC0061CC105DCC10BFC6036844224C4C24210420A64801C7260
          29AC82422886CDB01D2A602FD4401D34C051688693700E2EC255B80E3D700FFA
          61089EC128BC81090441C808136121DA8801628A58238E08179985F821C14804
          128B2420C9881451224B91354831528A542055481DF23D720239875C46BA913B
          C8003282FC86BC47319481B2513DD40CB543B9A8371A8446A20BD06474319A8F
          16A09BD072B41A3D8C36A1E7D0AB680FDA8F3E43C730C0E8180733C46C302EC6
          C342B1382C099363CBB122AC0CABC61AB056AC03BB89F563CFB17704128145C0
          093604774220611E4148584C584ED848A8201C243411DA093709038451C22722
          93A84BB426BA11F9C4186232318758482C23D6128F132F107B8843C437241289
          433227B9900249B1A454D212D246D26E5223E92CA99B34481A2393C9DA646BB2
          0739942C202BC885E49DE4C3E433E41BE421F25B0A9D624071A4F853E22852CA
          6A4A19E510E534E5066598324155A39A52DDA8A15411358F5A42ADA1B652AF51
          87A81334759A39CD8316494BA5ADA295D31A681768F769AFE874BA11DD951E4E
          97D057D2CBE947E897E803F4770C0D861583C7886728199B18071867197718AF
          984CA619D38B19C754303731EB98E7990F996F55582AB62A7C1591CA0A954A95
          26951B2A2F54A9AAA6AADEAA0B55F355CB548FA95E537DAE46553353E3A909D4
          96AB55AA9D50EB531B5367A93BA887AA67A86F543FA47E59FD890659C34CC34F
          43A451A0B15FE3BCC6200B6319B3782C216B0DAB86758135C426B1CDD97C762A
          BB98FD1DBB8B3DAAA9A13943334A3357B352F394663F07E39871F89C744E09E7
          28A797F37E8ADE14EF29E2291BA6344CB931655C6BAA96979658AB48AB51AB47
          EBBD36AEEDA79DA6BD45BB59FB810E41C74A275C2747678FCE059DE753D953DD
          A70AA7164D3D3AF5AE2EAA6BA51BA1BB4477BF6EA7EE989EBE5E809E4C6FA7DE
          79BDE7FA1C7D2FFD54FD6DFAA7F5470C5806B30C2406DB0CCE183CC535716F3C
          1D2FC7DBF151435DC34043A561956197E18491B9D13CA3D5468D460F8C69C65C
          E324E36DC66DC6A326062621264B4DEA4DEE9A524DB9A629A63B4C3B4CC7CDCC
          CDA2CDD699359B3D31D732E79BE79BD79BDFB7605A785A2CB6A8B6B86549B2E4
          5AA659EEB6BC6E855A3959A558555A5DB346AD9DAD25D6BBADBBA711A7B94E93
          4EAB9ED667C3B0F1B6C9B6A9B719B0E5D806DBAEB66DB67D6167621767B7C5AE
          C3EE93BD937DBA7D8DFD3D070D87D90EAB1D5A1D7E73B472143A563ADE9ACE9C
          EE3F7DC5F496E92F6758CF10CFD833E3B613CB29C4699D539BD347671767B973
          83F3888B894B82CB2E973E2E9B1BC6DDC8BDE44A74F5715DE17AD2F59D9BB39B
          C2EDA8DBAFEE36EE69EE87DC9FCC349F299E593373D0C3C843E051E5D13F0B9F
          95306BDFAC7E4F434F8167B5E7232F632F9157ADD7B0B7A577AAF761EF173EF6
          3E729FE33EE33C37DE32DE595FCC37C0B7C8B7CB4FC36F9E5F85DF437F23FF64
          FF7AFFD100A78025016703898141815B02FBF87A7C21BF8E3F3ADB65F6B2D9ED
          418CA0B94115418F82AD82E5C1AD2168C8EC90AD21F7E798CE91CE690E85507E
          E8D6D00761E6618BC37E0C2785878557863F8E7088581AD131973577D1DC4373
          DF44FA449644DE9B67314F39AF2D4A352A3EAA2E6A3CDA37BA34BA3FC62E6659
          CCD5589D58496C4B1C392E2AAE366E6CBEDFFCEDF387E29DE20BE37B17982FC8
          5D7079A1CEC2F485A716A92E122C3A96404C884E3894F041102AA8168C25F213
          77258E0A79C21DC267222FD136D188D8435C2A1E4EF2482A4D7A92EC91BC3579
          24C533A52CE5B98427A990BC4C0D4CDD9B3A9E169A76206D323D3ABD31839291
          907142AA214D93B667EA67E66676CBAC6585B2FEC56E8BB72F1E9507C96BB390
          AC05592D0AB642A6E8545A28D72A07B267655766BFCD89CA3996AB9E2BCDEDCC
          B3CADB90379CEF9FFFED12C212E192B6A5864B572D1D58E6BDAC6A39B23C7179
          DB0AE315052B865606AC3CB88AB62A6DD54FABED5797AE7EBD267A4D6B815EC1
          CA82C1B5016BEB0B550AE5857DEBDCD7ED5D4F582F59DFB561FA869D1B3E1589
          8AAE14DB1797157FD828DC78E51B876FCABF99DC94B4A9ABC4B964CF66D266E9
          E6DE2D9E5B0E96AA97E6970E6E0DD9DAB40DDF56B4EDF5F645DB2F97CD28DBBB
          83B643B9A3BF3CB8BC65A7C9CECD3B3F54A454F454FA5436EED2DDB561D7F86E
          D1EE1B7BBCF634ECD5DB5BBCF7FD3EC9BEDB5501554DD566D565FB49FBB3F73F
          AE89AAE9F896FB6D5DAD4E6D71EDC703D203FD07230EB6D7B9D4D51DD23D5452
          8FD62BEB470EC71FBEFE9DEF772D0D360D558D9CC6E223704479E4E9F709DFF7
          1E0D3ADA768C7BACE107D31F761D671D2F6A429AF29A469B539AFB5B625BBA4F
          CC3ED1D6EADE7AFC47DB1F0F9C343C59794AF354C969DAE982D39367F2CF8C9D
          959D7D7E2EF9DC60DBA2B67BE763CEDF6A0F6FEFBA1074E1D245FF8BE73BBC3B
          CE5CF2B874F2B2DBE51357B8579AAF3A5F6DEA74EA3CFE93D34FC7BB9CBB9AAE
          B95C6BB9EE7ABDB57B66F7E91B9E37CEDDF4BD79F116FFD6D59E393DDDBDF37A
          6FF7C5F7F5DF16DD7E7227FDCECBBBD97727EEADBC4FBC5FF440ED41D943DD87
          D53F5BFEDCD8EFDC7F6AC077A0F3D1DC47F7068583CFFE91F58F0F43058F998F
          CB860D86EB9E383E3939E23F72FDE9FCA743CF64CF269E17FEA2FECBAE17162F
          7EF8D5EBD7CED198D1A197F29793BF6D7CA5FDEAC0EB19AFDBC6C2C61EBEC978
          33315EF456FBEDC177DC771DEFA3DF0F4FE47C207F28FF68F9B1F553D0A7FB93
          199393FF040398F3FC63332DDB000000206348524D00007A25000080830000F9
          FF000080E9000075300000EA6000003A980000176F925FC546000016B7494441
          5478DA84CF314AC36018C6F15FBFD882D82152F8B6F606F502717211D1CE8277
          70F4245204AFD11CA1014170E9010A6EE9E4124449824BBA94621E7887F7E1CF
          03FF41B9CA1C24E9AE46BB2F03C4A68031EED36955C68BDF9FB3F4FB1D5718C5
          A630E816C7C9B07E9D5CBF3D1CCEEFF2CB47BC84EEBF3D0641BC5B3F631E90A4
          D36AE9FF2C0292D1F970D203CE02EAEAB3F9E80137016DF575FAD403E67B9975
          67E788F50DB6837295894D619764279863811936C8B18D4DD1FE010000FFFF8C
          D1BF2BC4711CC7F1C7F7E3A44ECA8FEB3318948D4429CB85B29CC5E06FF0075C
          298BDDAC2E7F8BE926D117D92C068BE1265F8592EBFAE2588EBE9D2EDED3BBDE
          CFF7F07A3D933E33094ABDFDAD780805602E84EE515CECE471A19D631FD33D6B
          3FDFD5B8D5FC9494EBA8439CC5D3E14996DAC15DC0785CCA5349F9E2579289BD
          8DD2C87B03C301F366AE9241BD4CD62EB75109A8F87BC6025AFF001F036EF3EB
          E587414476BC76F00DB69F5BA355F7BB37FDD0CBE9CA391AE816CD4C6113EBE8
          A089B3F891BE6643ABBE000000FFFFA495BD2F435118C67F4E2E6DEA2394BC84
          C122064D241289C1C22648C428B19819241274F517D84D6C8626626469C4ED82
          A143BB993AF596B84153BD712FCBDBA6A94BA8673CC979CE93E723A72D643335
          7FBB807E40805E3DAB000F8003B84A18345F6C8CB90748002B32E9EDAABDF761
          2F7AD9A9925BE84C0269A020BE5D6D54680163C0862C5D9C8586F91D8ADB79E7
          E6F600B8041E8D2A1B3526D894E5EBBD3F91010C1E4EC8C26987FADA6D54DDF8
          40C2DBA2555823271A9298FA3482807FE20DF08DEE2CEFE462C956993E9E8ECE
          B53EC55A28061802166576759DBE9DB9DF92BD5C4D672ACFD17DE00E28D77BA8
          A58D00C3C08C15795F8BCFA752EACF174525FB38ABC9E600577CDBFFA9D800ED
          40540B1ED30FC2035E8132506D2E35C027000000FFFFA497CF4B146118C73FEF
          BCBBABB2BAD98A2B2495A06185974A4BD8822822E9122479F1D4D97F21A84320
          1DBA050B5D82C84348D2A1C0C87E08EAC1480F11A51DCA8CA259AB5D37F7D7CC
          EC747946D66A65779AD35CE6F33E3CEFFBF93EEF6C07F45A619445982310B7E2
          865780D4896EAD92336181A545BB35A9D4FA27D00B4853C7834014E806FA1A22
          B9C1C676B75F05030AD7C5CED8EBE9CFF5E38EAD5F008BC0276023E6CC964C1D
          DF5AA1A9E321D9901391B6ECD5FA23CF46309A6FFCB97A4B0FF0EBEE7D733AD1
          87AB2680D7A68EA7BC7E7A3DD4021B88F5E46ED1F14A557364D24F8F3E2EE442
          A3C002B05E3E2F9A80C3ADDD1B896A61003B4ECF9F45B91781BD40C8036AA05D
          079CF36ADF62A0564B6203E37340AF14B5B9A35D2D07ED4BBEBCD3BBC674C039
          25416C1872243AD9331FF1EB72F440F49CA8AB0DB1A10D54C62F50ED1E1B0676
          7A40C36BA8EFC7687E22AA2A2FBE32FF052C2E8F0059A064C8CB2AA5B50B7E79
          D6DBA12B4012B00D198DCBF69B33B7FD027FAE362680AF5E8516F0E1C74A7814
          DCA69AD3FADBB519600EF80EB8863898049EA7A6FAEFD446B33B932F27EFC9BD
          2E57AE5E1E582AE683375353C71E5405B3BF0C9B8F4E0E4A6A9B126F9BB77257
          E45E28E683D7CD87C72F97960E152AB99199EE9D3127873430017C8C39B3852D
          895D96870A68108DBA80FD408784AD2595BC07DE012B324B2CF976DB11E01DF6
          B0CC943AE97556923A273F207F8D82DFC4585B48145118FE6667C6D97557575A
          DDBC7731BC65656017B21E328B1EEAA5CB5304122544E043414F3D4528BE04F9
          1041BD5510459725D02E605A0985954224C8929498E95E7475DDEBCCECF4F21F
          395A5E4A737F38308719E67C9CFF3FDFF7FD67214DF9ED7B8EA1243A1D29F42C
          7139316841951B1AA7498B761533E88F6D25A70A0C10AFA876E201078D0C7281
          16769C0950944E74804AD40F608C748EED9A0A40A79AE0D79D5744E111AB9927
          33132027807C0045A2A457D89CB1834AA69883ACC61BB0D45E9C97F812BE23F0
          5F6ED246DE640747525EAA31F90359D84100A300021EB13A024075EA5D0BDA06
          D6FA58489C0B00948A92BE6B5551F4A450D0D202F39EF34BB37C461ABEEF1D0D
          B823CFE351B91D401F15B49FFC8DCAD7220F9015B29D76AB5C94F41A4769BC0E
          6BBB7301D34F2C774CDC7A1AE8BEA9C7A3722B91CB208071BEB36000054AA703
          C07A0055E9ABC3E7CC9BAEB996BE630B87DE5719F20FD89A00BC279AF0528D26
          24CE566610A76CB3E7862F2895EDA760CA78861508B1BCD79A296E8DF9DCD646
          4AAF4E20638C1A2CE42A8B2DE991A34A59B36BA5C04DD757498F9211AA1C0E0C
          DBFCC4F261002A730CA964790B6D79C64E58F69F451222A5A4D94559CC224A93
          4CB3583E5D902501C90AEB814B546A56521B13CFFC3A000D8691347C30D41C46
          DEAC0B32D124420CEFD582DA64D200FAAF5EE72E31C2AC4766A2ED01F07562C8
          FC00DE86FE24C013C77A1EFB896646480E7513A537463DA05BD7C48EF1DEF79F
          3175E7E14AA20B7656756A31B98DAC9287F120AF2432F53F3900CA2118BB9D15
          F219ACE948FDAFC8B4E113DE17C76B8D84F08AD46488CA4D0560CCD662A6C30E
          EA00372B96F8217B557D1CF6D38797F7406845E177DB9F4CF9536F03E8053040
          590CF19DFC0C807413C2EC95950C433E806208C616C7BA509D58D25A0F31F7EE
          3FE31ABDF2D6F7B1CD6D24844F00FA497FA7AF18D86DCA9C00E7B05C6904369B
          00178A92BE21CD19D9273BF21421B3E13E2C3B5C30D9BB012100235E06F55B0D
          261F1D537FDCDB18F428AFB598FC85C00C514FE423BF1801A039F52EFD4F7E70
          B18EDAC4396833298F8D805B69AED03702B9E738B14388804CD13C42EF74D6C9
          2CDA51CF1309FA699C161C23200277CDC4E68CF80DCEDE1BDCF8ABF845ACB586
          B65586E1E75C9293CB6993356DB7DED6D6DDB4A256D990AD32DD645341B73210
          641337642063E84470EC87E01F4551742A1B0A32708230DCD05D44071B1B3A6C
          E7E6E62EAE53B7CE76B597A597244DD39CE4DCFC91F76BBE64A96B6B9B040E84
          10380FEFF7BEEFF73CCFFB4E5693E4D2274216386401B2A6026CB2110407828D
          811CDC23D36F62C6B579BB68B2260B589E44A42422152C07BD5CFEB9082803A8
          53F36739C81E8DD2C4982850793C45C7553203E621F5E6A73E59428F8FD3BA12
          97AF316AB8214ED58538AE97A0EAB572BCF7CE110C4A4DEC18DD042C406DA60A
          40B55349DEABF88C46A5D8AE165DA2922246948696092B69E9FA307AB5887C25
          11572E507BE9E65A4C04C068506ACA293DEF243B59D4548A520511C9F9EE226D
          855A653D2CF897B7A3E48DED104BBFC1B806B05DA4C48FBF87BE1D3B623DB814
          0BB98F1119F81B400FD7A01341A9292748791C700AF5B832BAF216C94E6399BF
          2EB156AC7CFD30D4F5132C2E210AF7AA2DA85FB5C55B1B7ED2D3F9F8F7D10EF1
          A416538E132970103188B023FF4F8094732C72E5A4F0EE5303A3EB3D730375A8
          6A2D99B23B29FA8F0AF5E7C4E28A9F3E745D7D655BB85BDD93555891A0D464F3
          374A761F143870B3C93D7AD05711DBACCCDFD80EDFAB8F61BA3EF6E852F3EAB2
          638337D45D341AF98B7273980A2C738ACD08233737A806D0503C3BB64959F4F2
          856905070082A7556A38BF20503FB215A989EF5CCA7537E1403640C660C6A2E7
          F1C5D7B8EE5A1987FAE2F4D2ACF4AB7BA58696D5BE8A914D0016528728A25314
          730164D1AB1225EB7EB546588AC0070D334A56054FABD2F0C901C9612EA1620C
          644751E40C232F556D5DD16CED19D41C793E2F5CDFBDFCB559B55A33807A2A4C
          95B3F1C6003A29BCE5A264DEAD94C995902ABE429E3EE2C293CDB2D368A4632E
          669A181C5552E8CA9AA306B415A8FC76635EF59CE83FEAAFD156D385E0A7BB5D
          02470214425EEE2A15EA20557D893C7FC4DA77F75281FAF93C64005D008A25D9
          AC86676EA420A2DDF3C476A74B5F4027E966EC9C3F62AFD39D9C07DFD67D85B1
          1584A86756E2012A92DB8ED801C02DBBAC72284B0E15CAF9905C760967C64B2C
          828C25CB82283853CAAC40319404298B9D67AC0501B005400817CEDEBA5DDFF0
          1AC2B46D246127EF29183CCB665A86D96F60EE960E403313E2208CCE9585C267
          26304CBA45CFF607930062C9B8DC81D8C1670B05301E765E2186AD31F2CA006A
          00A246D2D181F0BE470A13BEFE755A4C69234EA811AEB109AF46B43B9808597D
          D99C2C2FE9D7F7E65BA0D118D2D3CFB11C4C10F25BA3FDCE5388EE39986F8023
          D7CEF613AB6600338A24C900EA49C745A373D7F2BC7AE7E1BD07B411E567B27E
          9980B2F8366390D01E00D011E956BEC3D03B2D798257347C7E77111998B7905E
          45B2F846CD0A2504A0CBD4E5B3F16BFB4B60F66E98F1DAF8E3D1F6C4A8F347A4
          279EA3BC2D2772F61A5B29E903703DDAEFD967B43DB51B30E6CD58EC06DE3F31
          78DDFA829CD63BAA3A3E8A3701FC3ED4A97E66B52DBE3C1320EDA1CF0FF79F3E
          7419C025001D5CF432761744CE3C62518C213569BC01E0B7811BEA47FAC5C567
          A6F3B8AD7FB65DEE6FD9DB4E9AF81AE55E1439A6EE7C0441AA9E55741F09EA5F
          435DEACEE1536B5EC2E0DBFFAF708C9E0DF15F1EFA73E0C2B98300CE90FDD1C3
          55AE3911F3C8A43F47B8DC8C6923CA90D6FAC3425FC5819BCAFCAD17E1DBDC3C
          118F3905ACFB05BDEDE99DA19BDEAF01CFA748ED2C74D149B19BC3C8651E652C
          63721E8DC011592FD28B159548ED31D4B88BB5A5DE52A3519CF3DC39A8EBF6C3
          51770282F32A60FB614596207E7AADD5F7F13A2D782B3832E8394980BAC8820B
          52AEB31DCC0C672BA7CB3F8E81C908A4C2012D416AB65C46DFFD245979033341
          2F0F93E13E40CF20FDC6DC563DDB2C9ACA18628C71130837D21B446C0CE1E22C
          8B31FA86F466519440316755C704177C26E2F3D91C89D4E99E8C22BD75E4E48C
          748123C03A37BA60463A9B8D4CAB89CE0335B99767CF48C4ACFFF28EFE944711
          FF9273AEB1711D65187EE7DCF676D6BBBEAE6F755C9AA2A092925222914B13AA
          2AA2A525092988A80123857253F283A2566A541020D41FF4076D248228A81040
          952AA2A202A5505C421B5501512524A5AD9B420871BDF89238BB6BEFE59C3DE7
          CCF063CF786767CF3A4E1C9BC41E6974D696B5925FCDF7CD37EFF79C994F9FE4
          52CE19F2798348FF1809F81C245050FF854ABF93FF764187B60062C922F1A3B7
          2AC41A7F8A53FC1BF97027AE184F986EC0F4A4298BCC165CC0A08CD86808001F
          91C4D2A4380FF9332C7CE693E7019E0BC4D01357171749CC0FB63F2DE1339F3C
          7FB8A8A7171900D6A83B335B669EF70AF4450B128C8B15467D438F677673E667
          C24C55A54955F75A55CD4B2A1A33158D4509211A08179001209431E6328FD8D4
          2579CF51729EAB643C579B64944C0BBB41417A16516D505B92A81E006F42DD40
          7D21E98287B0DFE42101A2056D7FBCE99804D0ACA85ECA88B8EF31A2EE0ADD44
          871A2651682A81D19345E4B63760DCFC06F4FE2128EDEF80444740F4D1AA47C4
          92604E1758B117DEB9F7C23DF33ED827DF8FD2AB77C11E49529B969D222E3879
          65D82969679DB27ED6DFEF337E4596F32B26BEDD724167C49C5037CC904E735D
          950D379100CE5691EA055D122D8E5AEEB64D5169B71E766F0C27DC5546029DC4
          D014347FF979443E7A086ACFD3732E232FC159849BDE85D21F3E85C91FDCE3E6
          E99495514FD945ED9F9EA3FDC72F3B793738EB0B9A97C414C39C35AAFEE62CA0
          90DFF88AE3E1191144E3956187A2D2BEB069AF0937D39B34536D42F2937F41FC
          730716B399517B2A18DD85DCC13DF4FC2F3F6467C8BF8B59E335CFD14EFBA79F
          737E95CAC5145994192179685FB280FEAA0B0265E2A8F20029005DAAE6DE186B
          B537845AC90A92B8FD6D241F7CF4FF26DA6C624E7EF71177FCE5EEFC39E368B9
          68BCEE9FD4B8989C53284842CE4A80040928961F62A872E1DA7CE1BA55CD5D65
          B6DB9B43AD4A2FDAF63C0F73E0AB80761A57F5706F40EEE01334FDFD3BA6C68C
          57CA45E3EFA83214A29045C1E56D48A70411F2352D13E9109742A54BBB329AB4
          3E12496115691D3882C4DECF5FFDC2050899D9FF9433FC8BD55363E1173D477B
          0BB5BC5B56C8916258B34602CA5C91B8EADA51E93FF669867B7353B7BD456B6E
          D3D1F9F32F5C75A17A19A1CD86773E397DB678DCCA878EFA7619B7142E40C28F
          64119580533917AF095592B10FC0CA50ACBC39D96F6FD37A3FFD267AFE98BAE6
          C50300B5EB6972FDCB5D4DABB76BF1F6E20E54A0897EDFDB69F3A34F842215F1
          A8A949E289AF03257D93A807C0F591B8B5C9ECA5EB48EAA1E760DE772F96D420
          D3687D647D44BFEE59457B7C476E34F61CEA01CD2048B3864491C93BBECBF686
          4D7B9DD9433F4C527B5F587AE209A369E0DED0CA3D279B5285BB7D67B1535885
          DC17D3C555289E61F500E72F6584CA37C53ADCB524B9E934CCDDDBB1D447E2FE
          EDE1DEF56EA4C95AE7E7FD76FF80600A02AAA2808A14BEB199FC47582A9470D7
          A8A61643CBD7F72DC0E9E1AADC56D0F1AD7DB136770D515817AADC6BDCDF1B0C
          21174209C87FBC584E1861E7865013EB4562E7AB8DD0CF2539D4F65F299D3B8F
          4513A55B04CF3D16202091CFB822166DEA61B702F4C6B61EC2721BE68E43A1B8
          D72FF505424121DCE80DE190AAA3098A02A82B0E2F3B01F5FEC38A4E229267A9
          C97EA558072A750E32810A1054FA59CB6C1063C8F72455499B3A0C0AB3D43B74
          C68F5B768325C16A74086C0B2882609E6C97531705500FA0B9B5CB4E3F9A5B4B
          5D56467D6BA0E6A21D5140FECE96ED1FA00B4E494DD3327560FF6DDBB213B0F4
          D76D4E4149A3D6C1E64DE39AF774C5462E7FE1280F2057B68C7F39531845F6C0
          CECBB994E41A0EDF381DDBBFA390091F970C57EE5CD7084805012D5FF1290019
          46C9B895D3DEA453C351945E7A6CD9E85778F1316B627C827AEA08EAAFF9E0D6
          564D08CB02E650E91F8CDBA5D089E2847202630F7F096E7A60C98BE7A607CAEF
          3CFC099F981913BC41FE3EAC18C2336E0C13726041A87774007A311739429452
          2846B6FE0C7D7F9A58ECAB20166FE3C8DEE9BC75CFE3D9B4790815D448345767
          881E791381B04D9751BDAD26E39B8A6900670A99C860FE5DF21A3B7BC70B8B41
          372EFECAFBEFAEF2C9DB0F5620B219806CCC8F44DE7B16F35F8D1F08E19765D4
          B22933254E31172E53D79E369D8FFD54E9DB7F2BC29BBEB624C42BBEF2BDD23F
          1EB87BFA5CEC195480CA11549A4D937E3AE3A05B9D23AD3E745F5FDD1614501B
          728CC2721DEDBC3DA54C68A5DF6E57D5B77723BAE938883E726D6EB6C57534FD
          E0EFA74EFC245CCC850751BD6E694C104F66DE6A7A225A807854D865C41DBAEC
          27D1BCE768D96CDA1C3632476F8977AE1F547BF6FE1989DD5F5C909B8F1626D9
          75B10B4F3D591CFAE175854CE425C0E0F96E5CD8750BC2A6E1A20130D8086F23
          0D5C9AAA5758716A3B01741BD1F207E2A9F246B5FBB3C790FCCABE4BBE697511
          571C9B3CF068F1D433CD854CE4082A7DE151541B4862B9525734070A75113241
          919C1ADE70925FB8EF0090527577A5D9666D345A122DA4F33B3F42E4B66FCEE7
          BAC62B5514A378E4DBDEF0373E934F5BC7ED92F1BA1FA2FC9A52DE0796857331
          1F32818F0012ABCE3794C46C05D0AEEA5E7F34697F3094607D4AF703BF83B9F5
          C78B56FED0EC9D6CEAD7F73B679ED858CAE827EDA2312408C6F918BEDA0A0D8E
          6974DE6C8C381A206DBC8F22A26C9C9949FAB319408B66B87DD1667BB561B22E
          25B9E15D243E7E18A15B07A1B60D5EFE2A657178E7B7C03AB685667FB3D99D38
          DA62E5F453563E34E487640655982887EA9D2CA26832544483E8AC790B287DD9
          AC46AC10E67C858A33EE3F6344614DBAE1A6F488D3AD8769BBA2B3185111220A
          514004DF8D818231463D38CC45C9B5950B4E491B2D5BDA28F554CED3E75125C6
          F3C2E4F4B84861D589868B606D5714B014F202958C08994ED5514BA272F03202
          20C42809972D3D54B67499565725E392A29E501549542B60DA8258A26073166D
          4EBEEB1586CC65585C9556A9261D13C5A726B9BFB331D23217ED48CF40B1B000
          9CF49586CC655ADE958495796AD92A9FCBED4841AF28341269C1497D6D81F743
          263D1BADDAD97E6EF49DC022BCC670B1F1BF01006E0D8560A0B39F7700000000
          49454E44AE426082F14F59CD0E0000004D415842544E474C4F572E504E472013
          000078DA3D567554D4DFD3FE10B27408D2DD20B07449EED2CD02D21D0B22A528
          20020B48FB2524962EE99290AE2524A40494EE4604940569F6C5DF1FEF3DE7B9
          33CF73E6CE9C3BFFCCC418E8A99310D213020040A2A9A102BBB7CCFF808F0700
          583A52B9E2F784C05BC3FC25001051FE031690994D0B0084FA6E50A88181AB97
          AFD74B572F6F564D2894D5FB85978BDB736700F05FC831821B1BED53CB9FAF9C
          42B4A31129DA5EB047F8AC30481C822A899B9F8D805C2B9AAD60FE91610F85AA
          2A2EC3507E344E7C3CE2FD234301E258C239D0165B617CF8C7E8D8AFD7EB811F
          DD673ACE77C6EE1A671576ABD0390D1320143E719A8698A10482B81CC24CB116
          3ED83FB0BE25A4144AC8E90D90E33738B1BDBCE5C0022E82E5E41EB3A3405D00
          96FF34113E80D2CD4209334661C87E4232ACB010EFB050BE49D2DAF8082A40E9
          4D3CA4045052C342E4A4731B01F9B880DD88A3C326602008D8F184EC4C03889C
          8B8C402CC03285ED11567E12C04AE91CAD02B83E01AA269EC6AA0266C200958B
          76BF0C302708086B9ABA6800B5CD006A9C9CA81EC02706840DA323F800DC40C0
          6E8883C31F78970150A99D98CAFD795C43BECB7FDFA98C7AB9564E19D5504B7C
          411F90A9A91033EFB826CD632A497B6CFB4C25A1DE800C3AD15071B235F42800
          E4273DBAFF2DFAD67F9CB4667C5C32BE89D456F067371E86DDC161F36E7BA2D2
          5B0900D67D8327EF04C00DF4882778088FBB42AE235C571BA2FC57E7712EF564
          4A8D40FEFE8229DAFB5F6F540B125BE7E7B7B7B6E6B4FA2196F65F4D83EEE0BD
          B628D3DBE797C17237E7676B5D1B9CA1A2D6A1EAB8176BBDA3A73AC58C131F08
          DE392CED24A8DF3413616E98A6D9FB351D5ACDF8A9360D1FFAC4AB64BE478B16
          B3C7403EF07DE19AC2386DAC0A5CE328AC4A00B5CF14B0029304CBAC1D71FE6A
          F3909BF9A236CE01E0A4DDABE73B2F3E0EC2357C7DC20F73AC78AB9ECF05205C
          343FF800808D0AA790F1D706C5417C0050C90FE5AF556638EDA11540E131F63C
          58EA21BAB1937C07E1ECEF859043089D108C2FECF8AAC220BC9163B54CFC76E0
          EF4A4CE22843D7C8646F52A15E931652796FB22B7BFCDC1EDE8E50025CE5217C
          4A7BB685682C8758338E787C9A8C880BB61E0DDC87719CACC3D15486ECDA4912
          1A22B0586356130DA613F917D83251566A6D494F8600D1B09BC80E759194D07A
          43F9EFC48DD0D63229FA776A8544DF9C7C453213A8F3B3BEBDF84C2FFF5EB260
          F75BA52BD9428202745018B5470B12EB7F2E2C34D007A993162048761CA963AF
          22AE1CA0AF7D5A85D31E73E63851E787FB305415452089EB0761B56756D630D3
          31D39BD3286365E414A758209022C07967D8CBC39E5CA6FD99BB8DE2B29FD641
          5424CA4C438063E6610225983C301ADA2FC5F930062ACAD39A88AD5957643CF5
          704A6DCA13C6B12F509E25AE41CF913CBCE0E45E0F924911607D3C14B195B3D5
          B725B6C5B0C576624998E3A0E4537461B4C10BFBFA4C8B6E9B7C5B7C1BCF395D
          54D9E463266CB9ACC0984222C102525DD004FB6418554629FE2A53662C9C5A53
          BBB8BA30759ADE95C6F5DCEDD39E6F1BC5722AB31EF29BE9D4C8BEFA1E720FE7
          D48F9824F251F860349C972E8B16440BA7F3A3FD94AE5342371D4737682C2C25
          7290BE9B4196E16562C6DFC4FFF651D257C254AD54EE54067EB071794549C54A
          059109DA64C438A1DCC628A846CD44CC68B39CE07B5AA549458EC181118311BC
          FC49595405BCCCCB58B128D8FC3606CFBC4FA74F1F5A64985F67BBD931C04AE4
          48D7E02FC0E64E5219F92A54A29FBB6E6CFEED6BFEF6F45BA6F638F98AF20219
          A898969869030C9DE2A208DA4CF7B9C8F6D523D8E52D45A2836357A88EF936F8
          184AC4755A459CADDC2BD2906966951A958695EA079D923587A539259DAAEDE6
          D7A1A4CA835A3C563CEAF084F10739BB46F346CBA584A5D4BAF2B267354215EE
          C50C05ED2A7EDD9EA547E9B95D36885C1DAFD29580CEDD2BC620F0ADF1ADC755
          E9993AB1195E033127DE22F138ADDC17091F2F3926F0E0E21F43A8759F12B4D8
          3ED51EB9FE2EA97552EEE30FB5FFD4C8DEBB0D586D726E7A0C780C7CE4C6E366
          E3D6D6FDA97B9409D36D2DE12B79A2F34467706C74AC706C2643224B5E645674
          376B376B366BB5D9CEC2DF42A0A9ACA9C559B37ECBA2C4FCA8A9C333C242C6BC
          D8CCC4C2BA41AD3AA79A6BA6BDBABD94A2B4552F59AF327706DE57FBA769B8A9
          BC99AE767B0E6FB1A6C9A329C81EEE40036FFE52D37794DC991CD416F4DFAD3C
          88246A9EB492C98229F8E5E71754B24F655732C7B38F1483BE9CA6ED83E16613
          E41373629B4D94237CFD6E394659D3EA701A78EBCB7074745C8C76D888105241
          288B616079A8734BCBF7CCC77AFDCDD4594E564356EF61D9E2A723C923B7A3A8
          A5BC51F13CBE5C73B197DFFA86A06B86DB938A4479A9C2EEAB55C1FA50FD5078
          E32E07D8119C645A3D5BDB5CEC57716E7F4CA3F057E145DEA6C2A69CD48AE88A
          B9EDA814AA79A87944BFCF2BD73662151AC28171C2BCC14C02A5082E2C384E4C
          A872A825F6F5C59BB76CDDF18AB28BCE7FEBE70F95DFE7B72A3F524E08AB0EDB
          EEA966731DFA9558CD76BE9B3E9E34EE461A6110BC37F30D64BF631FD7174CCC
          131115611AA918EF1D6D463F298294F09B5C82BE5C55B952495359C9828BE8CB
          7C12D492E057A8107A26B720D526DEA63820E4623EFAC32CC74CF3B936A38C10
          7F8DA4E7F3AED59B4374D446CE06D166204D3A78C8DA3BA060BCF734A294BA5C
          E8A1806C9A924EB49E74CA6F6572FE32EAF75C27947E5CF18401BD4CBD7076F0
          A4E464F41CD48A9F59EF44835FF7CD875F491D12019C5FC48A05B65BDFF19427
          76E890E82C67C9E65267BE66F5109597ED1409FF9094E803A960D34D6E82FF84
          EFB8BC1EA9728EA8BFFBE219D70C664E050DBB3724563D3017246C8294EC195B
          F0CEF283EAE1CEA62EDD63315F65D22A731F8F1D8E367C5D4C94CA3ECEC31C3E
          EC7DB8FEA1A93852DB5490C96CA7B3EA994CBD9C4FC022E1E6A3078F239FE255
          C9B5C436F17BFCD0AF3C3445D6047772BFD1750FB5E9F91AD6D388E57E406442
          B81D1174B0347B68AD6F06365F6DB4BF8ACC61507814135B43B548837C1432C7
          BBE4BFCD10E5F5B53B6329E57379657FABD384CB94CBFECE8A60AE25695A0572
          0749EA4932BFF09964F5E9E7C3B3BFAA8B60E418EF627B7813B4F563B75C4B87
          73E9F0F8D81345E322E353E32B63C9A3A9E546FBD90BCFC92386C08EBFE2BF7E
          2C5A769CDF2A0C772D9A6099E8FE70F9E17CAD79DD70AE581353B17F9176ED61
          5DADE7E17338883385730BE2206D9A6DFDFE83694ADE189630F3F8409D7490A5
          EB2EE7D84F904492C4E4BFEC810D0E6F9580ADFD7382D5736612D985D7EF03AB
          D641D32CAF99E04CE06790CC934CB52CA3CC6B4B07CB36FD5185C9999F2B6F6E
          D41759C8B2C5E5CC03B4D0C6C36E0BFB61D3C9F09389F739A93941C142974B76
          8B854D81BB8EE3ABCFC8BC8EDBC87DD7A7543171BB4F3A9E8C5B9DB4F89ED42F
          6E539AB698667E92B5F5F8E9FB53EE2E795A7FB03DBB3DB3A6D5CABDF5E84D67
          63A0CBF93E43AED4F8F26967C01F6ACCCC8F5C19F9E54EF41BAFF32FE767ABD4
          CBC12F786EC747DAE7FD788EAA3BF43B6C4F950E95E7A1CB513F142DEF96E68E
          97429EA1FCF2D1934BEAE77811E1137749670964D0070919092391249107B9D2
          0A32321B8A2F6EF76F4AA1134E13DCB934778577233534D4E0E08B1F07B3E393
          E99305C8136472B7C7DBE2DB9FA803BA4F8B03BD03CC5DC3FE622236A74FAF0F
          7BFC96FC988E3FAE92E96FBD650DE1C5B85ED69D197D2BBD4EA64B4EC6E0E2A4
          A36F1CC50417EFF74D56470D982E00BCE102004438005C62EEED3E00BC120680
          9F7600209B0E00345E1F6CBFA80100BEB6A68AB2B1FF02A002B463B0F61B9EDC
          3F0770EE01BAC739F63F92F74DEEA6FFC2E3ECDE87FF13405CBC22C0D50D06F8
          D0C914F54F3897C34F76FB3E5CF7DB13BA2974CF3198FFCF86754FEF9710E0FA
          1E37FF622103579E7FDB0F2DFE09A07F82E6C5D51DF065F8FBBFBA0F71EFAFF0
          8DC9320384D6AF8FF7FEDEFFB28565F40CA050767D28D41AEEAB093A3CBCC843
          6262E23CB37CEAEF8CD7A9A6CE42B571A1F7A7C05990215C6EB5A19D60C6ABCA
          2CBFC9F6EEEA9204BA313A488CA1BB13937E6226C6B96763318A42FD8EA0F869
          922E7163E015E2646777317EAFB0FCAF90CE44A710D40750FA631B8851100AEF
          3148122EFBC2CAE9C14ECC8DC7C03EE98F8393758A55958BB2FBE5541F47EE26
          3559EE401EA75164047A037E25E8B151B52BB01B422EFC8E19E654002EA90B67
          5F68813CB6631F61FC91DCF7F313AB8A8CD7D8C29D4D6B2793B069E042D5532D
          29BCEF34AF69646CC71C39E31D27AAD59B5918F4C051AA6C4A8CBF45675ABB9E
          B853CD4C9F423E709670AB5757FB47EB91BAB4A3238E5D5A2F92033199E60B16
          472BA65A9F065D899F9ED01E77071786AFB0209D26A6846955D74B59CA25A96C
          0409E6549EA9F6F490F9BA5180408FB065DB2B437AC714D70B37B60A59A5A9AC
          FA8B1F5054B1AB5218A9B832D197A9E2D799B9FD3C69C2055BB58CB42EA1B319
          4E634ECBB1A14AB07126821D4AEF501614D90B038069E855BB1359DC7ECE3B85
          620236D7E64569BD9C3F172F7B32D14208763B1C9BA161301F82E03923D554A0
          D8FC2B8F57BF4231AFAC18ED8577922991EA3BDEBB542D07AAA2843AE9C9E663
          3C5A67CB3BBFDC0AC002C8115A3522778F8CE483D1999AB3D76473F6FBE504E2
          CF1AF92735F0AFB729D854BA4D4CB818B1276E1D56CA5601D2DFCB81E32DA341
          DB1D451E518D5FCCADF50BFAF17EDF920A4E14C3029C5FB67DCED3B93045097E
          239E8A1FE2924DC48229416C66800A54142786C81733C49B35C31D261C8F792D
          052ED2B432A29C568B11347B5CFEDFE7D37C8D97BC9FFD1FE2DE4FB27CDE608A
          4FB92ADFC8585770F9A8020D9463BD12E93D2A0B2468176AB38AD8B2065C96AB
          90F03E0828D23C7257B1011D1220576B2B34268565B59637347D7E48F11BCB64
          D888517A5D0C13EA5D0F5E6DFA4EE63BD3AF6C6EA7B592F73BD4EFBE99917205
          205E6669ECEC073BC8B8C983C5E57288AC3C8497AAF0C7337BBAAC9DE5CBAF62
          AACAA01900A73675A1F2B1BDC8F0D488FE30E8EA62CAF797D9C3411F1F2C5D13
          EF6B494B8683A5AE8BBBA4C25AECB7780B5804E7668DE56315C323D36A9D7D8D
          56191F1DD34A8FF9FD8E1EF1872044BF196E23D54DBB78A861E586C169CD750B
          D51C4686E1FDB064CD246F5A7C7FA9C1BF0B5719E802E11AA27396AC2DF4654F
          8E14F8ED17436B5F6BF50F925B143BC0B8412DFCEC7ADC07A1C30D1542322074
          3725B4E8DF7432DB7496A2D9EC72B5256297F5DAF3F9BFB91E19553F05ADD59A
          404778BF3F0B145633B2DAC145742B6D3FEB6AB872F2684894CFD9B12C57E9F4
          8C0DA40A2B906B1ED019E0286E863C5D3EE0C4625B83F5C1686C537698F57474
          1EC60C189A90B4FB45DBFF9A9252AC5A4D17CBC3F1DA42D4746FE7E1BA2032B6
          1D7CED4768C759E60AE6343ACE024566ADE453BDBB0096505BC48353F9DAD958
          5F37627356BEBF9FFB739F6C54D590EFE075BC8BB665807570B04D3A753FAE14
          3C134285A88D3837FE2716BBD99D91A44EAFFD312B472B5F5C6AD0472351CA3A
          25B130AC403CC5337635DF6B9267CFF2140BBB202E6DC3135742B020C5536061
          402FBB1FD7A49ECB5C6CC6B928496D3A62FC1BD808F954381F6BFFA6FB381BB3
          5DF6C1D8B99C5F37752F564723F5B9785B2B15590ABC8091F42C901DAF2C2CA3
          77E9FD9C3FF350EC8B6ADA5AD07B4E22C680C8AF1E385FD40DAA59095378631B
          445B62FB1DCAE7A5F8FF932AAFFE8BAAB0D2A96AFC333A0A54D55CF43DFF7A90
          EAF1C93CC8EF85191FAEEE9F19C5506E6F6E5026AF4B892A34DE331D4B0BA5BB
          367369B05AA6F838788EC4D364952F75C8199DAE49C491A4348BA4B111C00EBB
          640CF9B96E239D9D935BEFD9F1FCD7923CA620DD9C11071C6AFA22DDFE7B68F4
          6C89B4CB83169CE7874C457E3681E7EE0CCD5E0D0E16D247E975525CC46C6FDD
          9F6BAFBBD25759689EB49AB8740DFE89A35932C37364924EB17BAEF5F58AC210
          E6303D8BF8AF33FC74FCF171F0E1F80E75E5EB509690AB0CB002FA52310FDC2D
          79B9B67EFDDC939E51BEB4C9EF37434293FA4BB7334E763BC83CD6CBC2825EC3
          D296A0571FDFA7361184254ECEF5F95CC95D74C47B2C22B149F17072831BFB5C
          AD58F121559F75CB8D77F65A1A6FA327C1B06BAA3D9CE47EAE7297F770970171
          5DDF6556FC34C5BD570BBF8E8E60953F841EACACAE96CE5EE2F09263B779DA65
          7243201CB9D96DAE23485606ECCDFAC3DC969A91D13C87BD91CBB3710BCCFCCE
          8A3991AEA5DAF468DE469B90F3A2BCA17B65D696D5E96B216A938B3D9BEE3B8F
          4DE1D93AD841F189094C9372701F36A218193E880C9B3959934ED4CA7C174797
          A31767BF5B7BEDD6688B6C13ECF98D687D7D3506859EBAC7B8AFE24AF62532E8
          075B639C125B2C056BACED85333702EEA6D0D421680B1C716B4BB5766787D2E4
          EC73D93934FCBFE5F3B65537FA4FA1BBECE5CD0809E73ABDD88094D00354A370
          D14D10C7ED5ABF797BB346DA6CC33C639AB37DE6CE545110CB04BAA5C57BB2F4
          F0E8ECEDF17942E5C7D24C35CB9912CA7C416ED154D2280A61910FC5FD3AB11B
          76A6EF526586379D46454B45154DD3B2E3A59F5231524AC4737C7ADA5E42DFC5
          F33D8443290D5172F7C09F7D2DB7E31AB6CBA2501D895B87A332B2AE134B9C0A
          4C3AF251DFFA151419D2E270A4C16E2480FD3676CDD76FEB95FFCD724D553D95
          1A885DD8FF019DE62C150E0000004D494E42544E474C4F572E504E47E5120000
          78DA3D566554D4DDD7FD8DC410434B87744977770C2D25DDC880C480A08008D2
          A9205D8284D225DD0CDDDD0C1D2220F0501243BCF8FFF0DEB5F63A67EF75EF39
          EB9EF36547BDD056C5C3A1C20100004F0DAAA4F718E9FE010B1300409AA2D942
          8F04DB1D6AE20900B824FF000232BE5200008E8E93A2E28B178E702FB8A723DC
          9D5E4D5191DEFD0DDCC1C9E51500F82C65E9C30CF4F7C8A42F57CF1534220393
          34E07AA458F47A0A31814FE3593919B009D52319721749753B899495D1A90772
          22D16263033F91EA7241A27116C0DB0C79B121F991D143A80DBF7CE7B9D6CB5F
          A3F775F332BB65675935E360041624052AA82B1C082956A0235A0FE9EFE9DBD8
          E6910BC261760708B16AEC193CEF9840C0558094D4734604B81D00F94CE36201
          08AD4C041F4DC403C1BE42BA3928301484F08A17D3C00A7C0AC8BD8F552800E4
          5440815969ACFA400E3A603D6C67BB05BCE006ACD93EFE9A0602B3AED2FD4080
          5912032928271EA0277915A904384A0265E32FA39501633EE0A983468F38B0C0
          0DF0A919394081AA06003146885B0D6041003EDDC8300E00DD0FB01E6062F201
          42D381A72AA7465227CF2B0877391F27955E2DD5C42CAE1C6486C5ED013632E2
          A1631F53237FFE54C4E6894D861C4F976F3AA5409010C1FAD90800E4C4933EFE
          F6ECCE670CBF626C4C24B61EDF8A7BBF03F381D1D676EB7E67BCD45D0E0036BC
          0226EFB9786BA8022531035DEFF3588ED01D2D7173DE5EC6385413C8D501397B
          4B4667EEFF66A39CFBA5697171677B7B41BD47C1CC66C8C8FF1ED6658530BA73
          B90E90BABDBC586FDF640E12B0085245BF5AEF1A39D7FC41339E801D6ABBFC2B
          4EF5B601F7E196769AB147CDB6C998F3E9962EB147AC52C6A733811F8C510A09
          1CBD2C530FF69B6B5C2834993561A0EAB50CC82F9EBBC8C20EEDAF061BA1B117
          62F312004E5BE09D33EC5868818E211BE3DE0FC7B277AA392C40A0835A820700
          582A31F3180CD5C8F6630180524E1067953CF5792705170293A61363B913F7D6
          5A245481B9A74B815001C73E90E68D354759B0027BF868152DA735EF8C1CAD10
          42D7313CD11D9FA7CBB0115FDA9DE0C6062BBB93BD35081B5D7E008BC4866129
          12641B6DCC148B459E1E76C5D00945278E61A61F8C7CAACBA8112F0CE5D78B36
          A03784D29E4ABF79221E61AED21C2F39000804DF86B7AAF2270555EB4ACF40EA
          149B8A44A94255F27027ECBDF833E2C8723227DED452497F12C9DD9D28752458
          8A9351ECE743FCA6000BF6B8F0F1F4752BFC14E3C24EB41BFEC9580629EDA3AA
          7A5986D612756137FED31B9D384819812D82EEAD406F43270F35D634D65E8016
          D1D3300B112D618B62A385EA76B131261669D4B236135DF750D80AF0471843B9
          98E688E3487809FD22157B449989A31405D89ABE3C51FBF9DD608A784A65CA4D
          8F698FAB3853084AC59438B864EF5C0D164FE2A27F3E10B69DB5DDBD2DB84DBD
          CD706A8693652BE7F1FD4A7F935D6FE8B53AE50EE18ED00EE6AB340179C3FC0C
          BD95A25C0322E1385385F2DC7ABD4ADD882212A1B719E2A321646A1A3FCAF392
          A7A91CC91D2F9D2A7F7B3513AD24D369A74E184D0DEFA9FE4EFD8D76EE0DC10B
          270DE98F84B153665280296094DE1495699A0594D33194FD067CA2FC0769BBE9
          04E9704363CE7ACE0FA4F14338C9EAC9ACC9D49CBC06C5250525AB25B8866786
          C30671C596FAFE152A8682FA5BC5D83329A58625592F0EF4A9F561C592451125
          B022B881ECF70093BB284C936ECD6E1DC5EFBA393FADB65AFBE871ED286B7CB8
          189CF14AC3DF0609F7B0FE1C5DFCF08EB325ED8EB62546BAA438575C51505DD0
          A846EF2CC94116BC95E671F5D54B1B7B97BD30F52C207AF5E931C72607758190
          6613FF2B73E79294D414E35268A96EA9EA419B48C5616156419B728B092A085F
          BE5F9DCD9C4D1516378691B5ABBFA8BF52885348A6252D7151C153E2FC833AB7
          45C9BBC3ADF0282DBBDD32305B135EB8EADBB67B43E3CF7B6770E77A5378A10A
          31C6AC8130632221631452BDC21E70295ADE7EE489AEA245B79CE20F9B649BD4
          8DD0F8A649A9FC5995CF2A049F9CFACCB798B75CFB5CFBF2593159195835B4F6
          B58E32F4B49A0A380A24352535FB474746F346E7D28533A5F9E70576337733E7
          33D71AAC4D7D4CB9EA8BEA1B5FA9556F9B16981CD5B7BA85998A9BFC303634B5
          A85129CF2A67996B296F29242A6CD24ED42ECD9E8375579DD40FD617375056ED
          2C60222BEA5DEBFD6D60B6E4B086DE8AEEA3C4B644FF66FFCF77D260BC8845FC
          525A53DA00CFDA374F255E4AAC668C7D3D92F5EF3D4FD9E385198F138E2F086E
          D5930C73F43865E9674EABC2C8614D9E21679131511AC1C33CA9323C99D47D2B
          036DDBEA5E171E161BEFA72EB2326B32BB0E8B90954722474E4711CBDF4684BE
          71649B087A4E740F28AEEBEE4CCAE27E4BE6735E2B0BD051D40982D5ED32F1DA
          F1C61B95CF5735FCF02EB9B4392697F92BF3E6DB96CC9694E8AAC0AA89D58828
          A261A06158A71B9E6D15B6A6F891E9C1FEE1FDC3245018C80282A14505C90799
          3D415DBDFFC0D0112B2B817CF5B77AF150FE534E933CA97C5C7079F04E673983
          E3C09F2FE50C97BB6963F1634EF8612F027ECF4D806D7ED9C4740740D8C222C2
          8CC26563DD238DA926F95385BD2797153DD7946E945294563361FC3AE295DCEA
          C29C32253CAFA596449B859A65FB781C4C46668DB38CD55C3468C479382B44DC
          5CDAD76E0FCF2236B33671B7FCC8D378072CDC7D73C7BACEC30AC98A7988B924
          52E43423B5C592FE9327E42C22FBC4724AE2CD128BE3DB45DB0563E49D14998C
          5C5034E7A4D33E85726ABD4FF813DF2AECCBDC2BF8836BA72994ADF84BAB269E
          E64AA6443659C63B7A5701698936FE9084F82F1E0A250C5A89F5B07DD82F8777
          C365AFC2AAEF7BDD621A78E992C183CE355FCA304CB871EA150A7E1B98B2CF73
          82AB61AF8C1C3A46A386C4534AB39F8F1E8ED40C21BF887E3DFEF67048DC45BC
          9150FF235CC3889BD6F8575BD96BF16A290F5F24CE1629C6F3F0979865528DD1
          F59CAEB33AA58746A915016DACEFB59C832C3B87823BEB40CE07B886383B61FE
          07CBF387163AC6BC266B753637E159D432A451D1154F91E4A9A41F17D8977D76
          A823E0431DE9CB49B5C5A53D4DF6E30E530E7BBF56B9B3CDF0534A527FA5E2BB
          E12D2ED5E2ADBDAC3DBCF8AB8CE44D1D6547B684D42B36E5774835B6BE2A1C1C
          1B959435F86E706E7063207234B55267337FE5367944EDD7FA57E8CF2CD2ACF5
          F24E66B01D690832D49A75987D855243D55CCA564495EC5DA5A05C2DCAB55D3D
          0EFBD1A6D0EEC04CF8F5F34D33B3B453D2067A7173CF0F54F1FB9FB5DF671D7B
          73E389E0197EFEDAB7C9E4AEE4BBBD7789BD76498727B1F4EE935FD90678FAD9
          3B5A182DEF6B858CD30C954CFD0C9499AD59B3CE88CCE4DCFEEAFB5B55E43382
          AF425226BEEA6706834E4B7BC1D389B0D3F14F59C959FE013CD7CBD6C8BC7ABF
          5DBBB1B5D704F0E36642AF8D29E587985DC956C931F3D346AFD36AE40E8951A3
          5146A58495EBBED7BED47DE2B44E7FCBD7968C8A2673E7A6A3F76D757E0E977B
          D4D9A2632BE76DBE27640F73B3D9E2D22B6D67EFE197BD97176B642B016FD8EE
          C6865B16BDD98ECA5B755AADCEE50EE5171557226665CDEE97178E973FBE4678
          E79C4D2EAB5E6286858CDFC75FC4112862C4A5C70D87E3851F648BC9888B6FCA
          BEB9DBBB2D541CB71F67CD26BFCFBB1FAE2027E30DB89A3D981F9B4C9BCC4D3D
          4D4DEC70FDF0E36E1F71405989ECEBEAA36B1FF411E4B73C7F893AECF45EF6A6
          3DCE5F23D0D9FE40FF91FDC1F1FAE785FE44212A913231F1011D2DEDECD64E90
          1BF9E837E9EDA07A5A00F09E0500024300E0FAE131EE01C05B3E00D8B7060089
          340020872758F5AA000016A19A92BC81CF12A004B43C80F66A241F9F03688F00
          3FE2F2C93FF26D42EAB6E7CAF5E23187FD13C02CECFCC0CDED0390D0461BF14F
          B894C24A749A19FCF99F9BE216CF237F78F8FF6AA047FA684200D4236EFFDD55
          E8BB71FBDB7268FA4F00FF13D4AE6EEE01742CE27F7D89FF09219B93452BF2B8
          49818FF9EFFF550B4EEFEC4320ACBB118875F4B7E3949898E1871008E49B710E
          D90C0D2AD9E8626B5E16F3DF7160550947EDA6AE695505D8F53EA9BB3B9D1F87
          535065A028EE05F9F8CEDF09F3331B77988C2010FF8511ED1BA609DFBE807FB4
          B7B6BE1A7B549EFDAF91E678078FA20D207762757CF725AEB3202A57AB8AA228
          5449A88B999F9178130FE232956A53750EFA434624A2C6C6DA1453AECFB2FF77
          ADCE40EC407CF8FA19BAA675245D341FD999580FE35263B733C245B7D167689C
          9A491EAA21633A9AB8F5F9AF7C70D82FA465BE28F4021CE626A3672963DAF932
          B89822BFEB99131621DA6AA1E425C1E2EEDFB18BD1F2D775B60DED05ED7B2C6D
          12A51F789351E54D836549FDB34B01E5289FE66C8BCD6B6F96CE91AB0B5C5AC8
          C73466BF94F05CF6C0EC3EA5E2A779C29419D0A822B1AB20FDE8462C9EE0B1A3
          FDF5F1FF741A8BF26342D6E9B136E71474FFECE7D09AEA75A2BF2652786A7796
          3DACFFA6B06539CEF368D4334FAC3F083BA7EC5433CA176CBB4E4DE84B80698D
          26CC71A2433D1B92D0669D5EA09651A0A43BA07952DC5E97600EC25BC780E24C
          5E34831A11636A6DEF6BB7E1668AC54C02D770B9E781B9E491ABCD33239982DE
          022D009DB0F05BAAB4B7BB1F347212777040A1A15EEC1EE671676038411A58D3
          821F2F30A0929CEF95A4970428829AE1BAF1F086F9045CAABD80CEB87E762C1E
          B37F9499CAED6C553397E2DA12CC2F114E4869A5A6D9723772647BD0684EEC8D
          90E61B40D2E96AB920D038E5D45CE7C04FD60DD31F40DBBCB43B534B4A14611B
          308784A4659A69561165A8BEA369DDF784A930BD25E5DCD91FC1997FD03BC3AE
          D06EC86FB1716ED07AB47E17BCE0CA0BF689487ACD1B5D47EF0A857E4A171935
          B7F029F814FC0C22F8E1ABB743FB99CCF149AF7C4B2D02631D54BFB085F9170B
          23B4649B031B82BE2E9B907D9B04D3D8D7F930179A43C3C7B0AB83D18342C0AC
          F563AD9F44F3C63EC947FC51170EB833F3B67573E7D36026CE5D71B39B69A06A
          805DD271E248FC47558496A26796BD470225FBD6AAB136A94A1613A5BF475229
          6CD8E9C95D2F3ADFE47BB223AD6C43EA43E06580ED7DAFAA91A9379D1AF3B307
          909EEEAD95E642E6C39A172C237F7A2AD3B50EAC3C19C34595707648D5DE7008
          7F1B84D8487E8C649C78397FF262862F6AE4D1DAFC012BDCA7928069FDC568F6
          BA2FA4EE2DE8D61BE99A2B98D46240D19C84623FAB9C1A2BBA1F529EA4154459
          1DA396D1A8ECD21DEAFC16D27155753C591E7EF16EDCC14C70F2BB675E83BF14
          B2248973BA43FE5864499923171719CBC4CDCD6EA0C5E6B906157C8615D6C87E
          8A0EAA4F4AA2D96856AFF8C4D45D7D5999F11A678466C2FAA9A7BD71C33CF24E
          984B4A6CD2A5F72FFC97FB4A2FA8A73FAB22F47DE545C54EC701969C5ABDCFE3
          F079145B5C199431D3E5A355E384A964E61B19001EC41B086A6C5F78A6DC0C09
          A7F9422685D7E96934B0AFDEDDFAE51BE1461D476F0B31B1D6DF96370DDF57D1
          AE461DAF6FEBB5C23D6EED24DF6EB2BE5B121A49A9AE3343D64D17682A902860
          394149B0B03DE497AF64AF6A082318D053D5BF12827994821DCA90EAD8CEA9B5
          51240DEF02167823A4E88EA70CBB125850A71FD62EAF4FAE656EA0FB76C53A19
          32791A7A0CFEF66753A3CC3E256DE9EFC4CE8FBB8273781C34765F7E4F360274
          58E74D0863833C4F82835AE3DF210DB6B02470DE280E962F247609F790DD69AF
          BDAE8D556FE9672AE4D7FC5A17536C0132B6CC50B2E490C15B6E9C6E8DAFA52E
          75525DB8219800590E0611E339A8586EDF869322C06EA04C587C535D8315AA28
          D54DA4F25AC6108ED1F2DB9A1427EDD76D97494AC29883661FFF863BA2349164
          7FAE662E5F12263BCBB908FA0FE2C31311750AD9F677C5E5A746E057A1BAE13B
          AABC9B7E040DF50DC58DCFED871847E53878465B9C2828308D59D354D485A8DC
          FF3BE710DDED6B04D7F652486E56931C1C54CE794AB663BA44FFEE1FDFF223F0
          763BD6FB3B975680E95462896B15FC29435F83E3459A983665A5DEAFF59E6531
          69EA34E47D6DE55B9F844A976B7CE3644A53FFA9F295CB3BA0F04F74CE7BB408
          23E9F40C7D1E2D52EDC5DE4BB46C2FE7CB5E89FD3C5DFBECAF1A150E169A87D1
          AEC8B482DE8709BFE70E5AD35DF5AEDFB1CB95774718F88898620263107804DD
          7CCB252F9D8D3558AA219BCC366254FC74716B9C2FB9C84ECCC9FB396CD231A7
          D51428C2D1DD7C8AFAE74407D3B7EF3509EB6E0657EE57BDCBDFD51D24ED07B8
          67051B5A77DC81ADFEDC0A1CA39E67C391C767AB21DEBA8B496E972CBA0D2BA8
          D6C5B5C4465E65264C87BEC12D02EEA626A699768CE597D1996BB7A60F2E068F
          5B0AB0A3ED256E9B9699BCC6E044C13B05806EA1A2A4D4E2CA725BBE9DE3FC0E
          7718AA9CF7D979BB28C412F838046D6370718C79ABBB4E0450239AF5D065EB87
          9ED1E0CF1D39F4E61CF91AD2F477D61F8A7F6723D914731083F0F7F7B77D4E9E
          5E9375CD7E70A1A0195EF2C2A2C155EA4BB049C6AD99B0670952D3EAFB435BFE
          3C559864205E3CE526AC7ADB2BCCB8C983B999F6603419A6050E809C073111BD
          51AAF50A7367DCFC79ABC33CC6A27DC0DAD9053ADD71E7947FDCF50806B95FDB
          9EA3DB77B21E63778E7B5AC09D982C25631DF63F23A0A6ACAD54A1601DFC7F69
          A306F2110000004E4F524D414C42544E474C4F572E504E478913000078DA3D56
          6558D4EDD3FDD12C2DDDD202D2290D4B773748494B0AD2B8488720DD082A1D22
          08B8E4D2254BE7D21D120FE122B52FFE3FBC1FCE3573E69E3373CD7CB9275E4F
          4795108F160F0000427535258347CBF80FB8D80080A6255E24F24840DE6AE66F
          00009FEC1FD080BC026A00C0D3755554D4D373F1F2F37AE3E2E5CDA4AEA8C8E4
          EDEBE5E4FADA110002970A0D9D8D0C0F286590AB9760CD384886A69701052E93
          013811429ECAC1CD0C22D188632E59A4D0EF7EA2AC8C4937541C87919C0C49A2
          D0E72148C05BC0D966FE9C1CF9252E61E47623E48BFB5C3B7277ECA1695E76AF
          E6A2B0711C07864B90A526AC2F0A21A804333E598F1CEC1BD8D8E6938FC063F3
          0648701B5F31BFB9674503AEC3A5A59FB3C0703A01B4C0697C5C00A69D0F13A0
          8F45111F8273ADD020516830BFD4179AB81072403E38195C06C8ABA0410A7338
          0C81624CC076D4C17E0BD0E3056C9FBDDB9D062085D7B9216880650633055A71
          2AC044E618A704B8480135E32609CA80990040EEA4D927012CF00202EAA64E6A
          407D0B008393E03700B80480807E5C3417801902D80EB1B2060251B900B9CAB9
          A9F47FCFEB48F6B81F3795DB200D6593508EB0C4E5F5C13135E563E484AB533D
          2717B343B7CB93E7EB09CAA5118A10215EBFF80500C5A9148FD35EDC07C289EA
          E070B1E466221BDEC32E6C148BBDFDD6C3CE78B5B73C006CF8854F3EF0F037D2
          42A4B0211E0F9FD94F305D5EE217FB23139D1A88E59B80E28325D30BEF7FBB51
          2EF9085D5CDCD9DE5ED0E8035BDA8D98863D38F7D8C04CEF5FFF0D97BE435EAD
          776EB245085947A8625EAFF7FCBAD42AA51F4F0345D92FEFA6A8DEB5E0A3EE18
          A659FAD4EDA166DCE45BFAA43EC94A79491742A52CF1E034AE7EF629D4ABCD35
          9E5B0CD93551A0DE4D162D2495B7C2DA01E38FE63312333FD8261200CEDBBCBA
          67387131202E911BE301A853B97BD5627600E2A49EE603002F95D8F88C461AE5
          06710140A93882BB5E81EEB29B9A07864DDF8DB5DC8D7F672B160566EBEB0193
          80F15E41E87D6DB96ADE833963C6EA19B86DF967E4194460FA2E31E9DE447C3D
          C63F8964BC896FEC708BBA39DB2340980A43B86476CC4B7168F60966ACC9B854
          B9D1D7CCDD6A98A4896C4CC371E4FA2C9AA9A26A820609464CC66A0CE732BEE8
          12B1562AADA9524380D0FBBB987655C18C88067D99198226456885386D94CA67
          FC89577E82792994C5F913BE3F686592C44AF626AA5D8897526415070560FBD4
          38C27DAF05F8067AC1DF5FF080D21D46BFB3D410540FD0D69BD460B4C55F398C
          7F0FC0248D508681C43003C04C768C0A6A665A663A0B6A154CF46C224F9640E2
          208C28FD9E672CE9159A3F385A9FFCEDA3B617128C3553E3619D234D21E32709
          8953EC1367238D57147A06FD88AEFEFDABD114E994CA94A701EB014F65BE881A
          2D6BFAF0D22BF7061C890C1EA6E743D1DB85DBBDDBC2DB74DBCCE7967885F6F2
          3E5FAF0D37390D46DC34687648764476B01D7384148CBFE419AC5494183D114D
          B100D796341B7CD38FAD2013F1CF93188BA454D72CADFD9C394DEB42E58274FD
          B6EFD7FA64259351277BC2746AF440753F7B1FE33280803086227230CE999326
          9F1A87DA992680FA5B8E5619CD7422CDA09180B8E051CE5E2E71AE97B1197733
          772845EA085EA6462647261D37BF51655559D56A15BEF185F1A8514AE54BC3B0
          3A156361C3AD4AD04C56B57155A1DE91219DA173A554456C9573859791DCD770
          F3FB786CF35EAD5E5DC5AFFAC5DF6DB6DA0798F01D681A037998DD09AB63FC23
          44FB38BE8F2D86BEE56ECBB967684B94A9AA2C915014D610366D34B8C87092C3
          D9CAF1B92EF0D301ED7196675F8427AC929F726D72D195896841051DADDCABB2
          B2B3CCAAD5AAF5AB558F3AC4EA8ECB0BCB3A94DBCC6F23881406359E593D5375
          4E816315EE192E1AAE94E395536ACB485ED5F155B997D295B429057479969FE4
          1475BE8414697995AF0675ECDDD087F1DF1BDD7BDC945FA91298613712B06123
          08E0D4D2FDA23E5ED20CFC8388FFF415AD7BE5154BED32EDB237A252A193D25F
          66553EA81027B90E586DB16D790C780C7CE1C0E660E6D0D43ED43EC933D08696
          7195496949690D8EFD1AFB3C36972B9A2F23382FB497BF973F9FBFD6626B1168
          C1D35CD1FCD351BD61DBA2CCFCA4B9DD33DA42C2BCD4CCD8C2BA51A5B6B0967D
          AEADB6ADFC493954275DA7BA68CEB9B7FEBFE6E1E6CA169AFA9D056C445DB347
          73989DB33D95734B7F5DEF497A477A586BD8877B191CC2D845A26A060B86F037
          3F7CC9254D2457F3E005277261FD975907FCCE66E324E30BC25BCD64A35C7DAE
          8586F9D3AACE54CED03791177189F19AEF47F9B265F9F2E90656863AB635FCAE
          7CAC3782A7AE0AF31BF37B8E2B10DF4EC44E5C4F62973FFD12F9C455642EFC66
          A27748715D7F67520EFF53A680FB5A4DB8AEA26E8473D31E2BBF037FAA69ED7C
          7D4B694015D2EE944AF68FACEFA72DD92D69F155A155739B5FE2B096A19651DD
          5EAF229BE835C577ACA857A860D424500E614773C6888F5088B044BFBD0E0E65
          EE4A96934438FE69583C56482A862A5028A4BCAF7DBFD35DCBEC32F4FB632D33
          722F079E0A77258AD60BDF9F9BC0B1DBB54BEC0D2778161D1B6D1A2397EC1D67
          463B29982D1A30B9ACF8664DE946294B6935DF595057E21BAF8628B76C159F9B
          F49278AB48ABDC009F93F9AF59B34233F5D79AF4127CDC75629EAF3BD7EE8E2F
          62370B37F1B742A872F887ACBD834AE03D97D1E594957CA43C9259F25A713A2F
          32CE1448B82B2893D8CFC902D893F1827A187A9C59F827C526E31614ADB81975
          CED5B8B583D37EA7B68B06B1F50B97F2EC40A39E557E6CD722D45AC9972CA2CC
          7BCBE4212423D921189996FAD1075CC5AC9DDEEC7CE8BCEBF476B4C631BAE1A1
          DF33B1859F311367D8BDF1630D96392F5E33B86CDFC882739E1BA7C1D9D1D4A9
          6B2C7E4422ABBAE8F9D8F1AFC611C447F182D34FA863D21ED28DB4E6D2184D53
          5E06B3DD8E1A378906699F2004DE1605D6F31813EC1AE99F09CDDC1EB3BAD5C7
          A6D975E11D1CC1DAEE112FBB47DE7737A1B91FE11BE3ED44871D2DCF1F5BEB9A
          F19BAF35D9DDC414D2C952C427D49123A8B229DE2D702E07EED0C57A8D74E52E
          67FCA8ACEE83BE1A779A723AD85DE52DB224CAAACADECD26F2245C5CFA41B866
          F2E3F8EA8F32823F7B8C13D116D9AC08FDD225FDB3DDB17C183E262567F4D5E8
          D2E8C648EC646AA5C96EFEDA73F2842EA4FD8FC8EF5984653BF25E76B813618C
          66AC3DEB34EB78AB7EDB8894AB8BAF3AB8CEBAF5B0AED5F1F0391EC498C2B8C7
          61256A9E87CECC324CC91819A4CC3D3F52251A7CDAF950781AC04B284668FCA1
          606093D55B2968FB00095A4332124A2EBD4D0AA9D9C0997EFA96C19981DF0D9C
          779EA7926F98776B696FD9AAFB4B7672EE7035F84E15F194B84044DA3C48E3C2
          68D875E9E0FD74BAF3F978526166615838DFDF655BC4E7E6903D07F89A1BB1D7
          692B89DFC694322A714FAA5D0A6E75FED3EFBC01B14366FAD334EF9BA48DC7A1
          DFA1F443FAB4EE605B415B5E1DD4CA1D7A12DCD114E2843CA02B1287AF5C7604
          FD47899A9B2D929059E9B808F642F623AFD62857C27D9FDDC347DB16039E9DD4
          B6EBB6DB5CCA1F2B2C2AAEC4CECA593E2C2F9C2EBF738305145F4C2EAB22B1A3
          23C71F52AF528815B1527253466308638E8A5EC84A486CCAF9DE1FDC952B8EBF
          1AE728A27AF8FC305A4745C91F7E3D7B340F9FCC992CC93ECF4EEFF2082DBD3F
          841DD17C430CF40C30760E070A0BBEBC34B93DEE0E580E6038FDB246ACBB1DCA
          F48E13E5F2F7FB95E144F96D3A4D7A3A0A1323E7E2CE419817F1786F3239A819
          680340303B00402201E02FEAD11E0080BF00001CDA0280640E005079A5D9F4AB
          0000EE0F752505A3C02540096843A11D344A3DCA018C47E03C0289FE8F7C9A90
          BEEBBBF6B87AF49D31FFBDB0730A0264078940DA327BECBF0CA4346EBA6BDB32
          FB99A7E216DF2347A1FEBF1ADA237D3C4280DB47DCFDCB050FDC78FE693BB6F8
          17C0F91750874FCC00A3E38BFFFA92FE2B1F49703BA5F75AE9F797477FFF7FD5
          DEE7760FC060B6BD30D83AA6FF380D3676CC310101C127B362CA19FADB4CD3A6
          00945D8C76BE98E0F575A0F0D0854C5BBEEDFD400296DBEDCEB74F6B02CB9DFE
          890AAAAAF9DD638B31DD691E4BF68F72FE24BD6F3D351BB1C1B7AC1818BD018F
          1114F0BF4E5AE372FC183E0064636FE9A92F0176BC261B819B609C0255E3823A
          5BDFDB2F11B507A6130234041C867210051E4A4C6DA5991E364A4197A9AF9172
          A6C69AECBB48EB2294A2FC53C9A109C20E811847F209D81346F49836EBFC6C1B
          BA9DA70A43AA2F0F676733ED1DB86C1B6E7E9A9DA4E4373FA730CF5A5C43E46E
          D8CADA32253B4C4F968868F3B20DE631CB17F44EDB1E5DBE46B2E9575B87D0F1
          42BBDA2210A1AE619B6FB85DE713A34FF7AF1C42DF7E0D0BFF2E866C8FAE96D3
          2052943992B2D8BF13527FE003F5D9D1870B3525453E6FE3AFA472EBC2BD514E
          2715C5E4D51F3B9E9D5A985BE89A983020251415C12454D04480F4B727362768
          B89C23713822ACD376AC474DCF0A570FEEDBC72F3A0B0BD4E0B2C54F71473BD9
          FB4301FF751C6F29194C00EDAB4CCA8CBA58E79738756D63E3BC318E666B3BB6
          0C7193BD027726FC1CC8B4E31A0F36C0B0F0426C1347B8D2FF78FCC290DBFC37
          9FA9CBBCAB18D86B82BD76D5E932628EFD6C3BBDB21796235B346575A7154455
          C34E50F339DE586451CEDDB69332FE401DFE34DD1286597CC36E485891354A19
          C91293FB6E577B11C3F6F2E8A3927DFCD04758E53BA1A7D5CB1862672BE1F08F
          EDB723C63A883FAEF88D6025106688F70A2561B94EC959CFAEDF0967CDCF0018
          86DED18F15DE585C2690129AB2A70916CFBA751E0AABFD1DF7C86E793C67C266
          57AE2B3E4302ABC1EB78ECBF036A1560B5196A339188F52925A40A997692A5E9
          0316C703968A79ABC0C9329312E53585BC7546B19E88BD624953539390E3EF99
          839F508781ECF6F6ECFC90D541E89E15F16FFEECDD7C80EF4C7564FAAC1FF71A
          52755D49E1828C47C9BFF8CB75DBBA8DAA6EE4C03B448FD94179C89E319E8116
          3EF22F4036237AE5E50404B3DDA097B3B44549FD9B516066EE4C3C27BBC64007
          960B357D01886331309379D788AFCD9276507EFAB925A9E82075A88433796B13
          3DAF6A5DECF0ABF8DCCFE09B5919653BB440E2DF387DCB2B8B0D62652AE329FB
          A96FDDDE46267654DFC90D049E09BDB9DF7DE584738D6E8471BE0D8F4EF118EE
          142E342276DBEEA2525BB561C91E7D42801D742F10FF193BDE8F4099799AAB6C
          38445CD5F776203EBD8463B5A6C6FBF8755EAE940F13FCF73953A93DADAABF20
          01864FDEC9935D2099F1C7984AAFC46B73CA80A7EE6CA420834AF2B131F38468
          990CEA85E60FD9A7B9EDD8E438521A5CD5AD295590BA23EA9888BAA3A85EBBAC
          B1E72E7960D94F189C8923F414D784AF9C4867FB6B6BB55B93071756C684E450
          05AFDFC63E74BEC4BE69137C477100FAC60F32976BD721254187676AF91F0EDF
          5C1F474430F7F0D65654A9ACD4E973FE9EE4ECB46E937E5980F572082DAB6BE7
          29964AC424D44853C8FA45DA8B8A5896FFE6465A2A0D77FA1D3CE038B614D704
          39F2BD1821B5431F0726B094948BCA86DE58663882EC3C616FE2F69BD88611F6
          A4DA9B5935FEC301680F53E67C1D1E19FAD4E14E033421F6295EEA6EACB1ABCB
          22C6DCCE91986E782A0951157AE63BE2675423590CF51BB14A605CFD92FA7825
          311E121E7B5A5157C36784CCF10CCF186D843AC708120BE23B6925A7D4B6A2C7
          6FAD572FDA553DD49B7867750C2DFDC092FA1E8B67872A06CB862F6DCCE90F03
          5E69E95108F74341DD81B46A1A7B160E3D7C13993C2E2308FDB7475CF40ACA0A
          FB4D0209E9BE3E58F1FDCB1B50FD0AFABEDD148449C96C63195F8C13BAADAFFD
          84FAC0B2CAEA5B62CDD33FCDF834A77A0B37C4DEB833AF1464B09C2C02873788
          C8E4897E622DCB1EEDF75FED2DA6E876204ADDA1F495AF6885DDEC9458F66F76
          62C2D67AE93E505F5A1798A42F0D83A607AA47CE3B1A6D1A41EFA802B18C1C05
          0BCF30C136F9E05FE8DE5439368824FE532872B45F2A406DC1F50E06BB28993F
          DAFA6171791BD64F409B879D6E92E1E796B6017344EE687ABEC4DE92ACE7ED0E
          E4E492C2FD404AA6658393E09EFFDF4E55485768806791BA54AF37F9FA2D5A38
          F04E06B139BC67BDFA27F43E72389658CED6136EBB87B5D334E62C6DF13B79BB
          22A4048D758420278D71E4F74C636263BFB4C9F2C0057A55C83773F36B320852
          EEBDD385F677AFF01F95B36EA1C86865244BE41E96994FBE15DF38FC647293B5
          B54BF398CC4E8FFF5CAED2C98A602CCA356FBF35624FA1C9A254F0CDAF2DFE96
          7A8F5B8DFA15CF8B4B0456A89C8E646199FE1A8E1026A48E2EA72C3E67825A17
          4E828E016A20F24E6D290C1BF449A834A27460892953F8F2B66F64046FC7F7AF
          46A08343A48A47A1D31B3CC83713DEACACD5EE09D19848C6E4AD8F8F8AA66649
          F5E4AF6B704CFD5C5D4AF8FC27936643FFE76285A3E3A4897922F9E519D3D5F5
          D060762B1D1BC6DBD725B0A9290C116BD6CF8AEBC495F329FB332DBA4FB3E1F3
          A527A92E3F616A527F0F4A98A55AA2965A2050A6F55DE43BAD7773C9CBCF1DCB
          9D5C026E7F9EACA705857B47170786A6859ED0C62BD1AFD1F94EFA5FDFAE8BFE
          D90F72DCE998FE24FA41663DFAC70C5D4F9E90992A1663D03AB6B70CEE10CA20
          5E6EC14B87F77AF2CE4F28B7A781476BBA3DEAD21672D4FAC3822818757DA9D2
          FAFDCAB5F236BFCC87C7615AD69B87E46014845322E0C09108D26A00D7D3F838
          6A9CBF908CF9D5B9FC895551C73A8E025B55F783C3AC1573B9F17A9BFD3DC693
          0625913F941B45716DE7214CFE0FBDAEA26CD496F22FE8894AD5544124613CFD
          3DA81B0D5A2C07FBA45272141100A1D417F9EAE352F5EFD75657D651AA03DBBE
          FF3FE40E5F7470726576696577696D672B11000089504E470D0A1A0A0000000D
          494844520000008C000000640803000000630928E30000001974455874536F66
          74776172650041646F626520496D616765526561647971C9653C000003206954
          5874584D4C3A636F6D2E61646F62652E786D7000000000003C3F787061636B65
          7420626567696E3D22EFBBBF222069643D2257354D304D7043656869487A7265
          537A4E54637A6B633964223F3E203C783A786D706D65746120786D6C6E733A78
          3D2261646F62653A6E733A6D6574612F2220783A786D70746B3D2241646F6265
          20584D5020436F726520352E302D633036302036312E3133343737372C203230
          31302F30322F31322D31373A33323A30302020202020202020223E203C726466
          3A52444620786D6C6E733A7264663D22687474703A2F2F7777772E77332E6F72
          672F313939392F30322F32322D7264662D73796E7461782D6E7323223E203C72
          64663A4465736372697074696F6E207264663A61626F75743D222220786D6C6E
          733A786D704D4D3D22687474703A2F2F6E732E61646F62652E636F6D2F786170
          2F312E302F6D6D2F2220786D6C6E733A73745265663D22687474703A2F2F6E73
          2E61646F62652E636F6D2F7861702F312E302F73547970652F5265736F757263
          65526566232220786D6C6E733A786D703D22687474703A2F2F6E732E61646F62
          652E636F6D2F7861702F312E302F2220786D704D4D3A446F63756D656E744944
          3D22786D702E6469643A42464233393830413039363531314536393337354145
          303145374546333945322220786D704D4D3A496E7374616E636549443D22786D
          702E6969643A4246423339383039303936353131453639333735414530314537
          4546333945322220786D703A43726561746F72546F6F6C3D2241646F62652050
          686F746F73686F70204353352057696E646F7773223E203C786D704D4D3A4465
          726976656446726F6D2073745265663A696E7374616E636549443D22786D702E
          6969643A46334538363638303039343931314536384535463841394539453237
          46344331222073745265663A646F63756D656E7449443D22786D702E6469643A
          4633453836363831303934393131453638453546384139453945323746344331
          222F3E203C2F7264663A4465736372697074696F6E3E203C2F7264663A524446
          3E203C2F783A786D706D6574613E203C3F787061636B657420656E643D227222
          3F3E31D8A90900000060504C54454848473333329394944AB520E1E3E3707170
          DCB4585AA3D6AF8824BC9E4D6A4C1382DB51B0B6B8D4EB6A406C318E7432C89D
          394E78A4F6E4194251705B5A593C3C3C4F4F4F3B3B3B2B2B2B3E3E3E2D2D2D2C
          2C2C3F3F3F3D3D3D4040405050504C063CDF00000D354944415478DACC9B8976
          E320124541B1D276A2B69D099B2440FFFF97F35E8164B9B3587632E74C25B1B5
          01575505144B94813C8B1C0E87E75BF2F73499EFE4FBBB37A455CCA0B0BCBE3E
          EDCB512DF9FC09CD49CDE54D53FD9A2FB8E9A734CA4C6E9262F605E6703EBD3C
          1F5EF6CF67309D0F5754E702E30830150C471CE5EAB9E3C7C35261CEE7F30130
          AFA733CA7B098753D89F5E4EFB9797D3E9B4E7C5F3E970DA93E6945D29D229E5
          8C539302CBF17854131127F713010C32240C595E9F4E87F3E1F40239C9CF0134
          FB9703EEBE84807B84512450B90700789CC33952F290E7D38F6090B113CD08CC
          1E072F421308B4A76A00B37FDE8345602C0A571EBA787D3D120CE513E6989191
          CA2EABC765228C4229A21AB2ECCFB0CF5E800406DFFB3319E5A1F3C9A378955F
          458E3EBA29FAA3C020B3A66BA61FC1B89CD5612FF274DA5739E3E854CE4ECB45
          5E3F9FFA6C55F61526AB9CD351746AB4F2CDAE5D72CEF70B2C9EE2CB61BF550E
          279D73B4F9F8F404969453DFABA299D4679AC8E547254668DCFB7CD82E279D52
          B6DA6B0DB7D1C9824CEBA7D7A3B6A4014E7A546CA23AFD70474BA5ADD71EA275
          9FB58F38F079F4C772F187A2544C560FF811193E8AAE32C84D7C2D693594A4B5
          4FDEFA51F7E58A7E180A49E181482F3F37848FFBF279FD6C1ABC1F6E26DF2202
          43BD8CDB9E5F1455F087F9CAF01B3051A58D590DC58C15BBDA0F1F3EF028FC06
          4CAF524096E102F4AFAF7C6230F1B18154F80ABFA597415B85ACC3FF8BA8A843
          78F0CDFCC55BB6E7E0FD977965E5A168F6B8F776B1932441D030B9FAFB9848C2
          D2FD1B052B21A629D1C83DE254F4685CD004A30987F477494AF3918F8C1D6B70
          E57590086921AD87B76090C72451E6F2BB4D2E61EA7CAEF2D26B2768E613BDDC
          84F1A66D5BC38FE5EB31316AF65FF4FB21B875E1B3526ED9DA9BDF1255AB021A
          3D8B1AE5560E28B1E477BE32C34C621A09CDF17AF798E99F67D55C9B3D6B93AA
          8681B9109A3C1DE7B3A978FBC4E0F412C23B257AD4F5DA3B62D7E767F52E2F60
          10AC99FABCC4B412BDB738947A6718E8B6B5BAB8D91CA9B60E43BBC0F09E5115
          060C9D311D870E4AB2BCD0C0F733AF69C6BFF43A174FBBBF4706A3BEE93AA34A
          88357FB4A6699B1E078D6114EF72D3B55E227A715C566A5F619ADD0A06040546
          710CD43548D634FC6DA76665B8B6DB75AD9BD8C7524ECF7F21CFCF8DCAA93578
          BC336DD7E05759BA278E208D76921FEF8018DF78107411798080718736BBDDCA
          4CD4E113C3D9238A3648DB301BE4D75CC1B866D7413F3AE53EC7D4ABC3DFBFFF
          81B47D1E9040E1AFE147D726A4E4DB98C63539C9177EBBC60861637C8C08A723
          5A3A8967DE76BB2B3329F37A818182F9D78A7ADC6AD807D5473369DB273475B9
          D77BB2BCE8E863D3FA96BA44CA063121DF9FBA6972E37DD35645176D83D8ABBE
          C7DBE41290E93F7FFF736526A78E4F62A6094370E70A8E11DDACAA3E0C0E47D5
          364644D1D9551836C3C67845B376DD0425E4A905F704D5A8367B980C0A457EE0
          980889C449F56A8179FBFBBC8681B76719A94A8D816B8A1B4E6C1A9559C138C2
          6A2B9D40D613C62FA733470D1E76CB084351141C52B19BF0D6FA3E0D592B9C0F
          BCC48ED2E22327F1171B0193D0ADF8F7E67505630408E5963E81C5A250379583
          EB9606559B303D3E623B697F3292395A0AFE110356B00978AAF759C59C703D21
          94EBA3B87D8A38883EA94898DEDA68FDDB9F02B3EA74B776945A3C86BF9781CF
          63032634BDD027C027C2B847E62F304461E929FF5422473DC82625A7105B39F7
          C0C01883A65F81C12852863BF0238E0E8204E5F7C779D730F1414B25AF97D81E
          0179C88C912E962F722B135483D85706A957719D7ABBD03E02C5817F0E0143E7
          F80FCA964C00B3BED0D39763BA1786211FE3C4C8813AE2193FC083BC4F7CD79B
          99CDE3F40F70480A187FBF66F856008A51A91E303A4B3348C27489523F9705CA
          2651C72C39D9FE111844C392154A76CA0E210DA9E774426FA134281A39A3A5F2
          30A3B59B03ED1493879E637FF5360CB88B6FDD4A0F1A31931DD0EA30551F6DEA
          6DDFB39AA11122CE7698FE1A06D94157BDC7DB797EDC844980491A9AB116750B
          FD0348D096230BB46838B49E4DE346A930F3296A28740C4FC4BBE1C0DE4E4ECD
          8CD04CCF591FCBF26127BC13549338EF72078C853E91DBE26BCA8A6ED86C58E8
          BBBF0963AD627760179F49A20C0B5FC17BB163E7331B25094C9A4F591FA2975A
          C1AABA2139607A9A89FDFAA8D991270DCF7D5FE492F92DA11EAF60D8E9A09DC7
          4B5A9AEB268C240FB36652E415DBEBF7B7F7F7B72278DDAD229D8B4FAB79B16C
          DE10F1BDB3EF495B922B8E28AD6866902B54AFC4D090DDAE53FA4E98053E7BC4
          BB3B4887306F5BF2EA33DEB2E71314D4E866374B87A178F19D4B22CD60CD96E4
          D0BF2E538DBCA0D5AA58EDFF6018D1757F109A0FB03E6709742CB7D8C4DA1814
          0EF2D56C2761C6358CD76B9854349C2CA1108E455BF3D4B0A9DCE3F55498D630
          F6FDCF1FB240DE320723BD8E9CB61DF8068C3E3DAAADBE9AB29D61AA99CAFBAE
          60B2AF3A60ADA709C5299155D445298C79FD3C37BC8619DEFF14797B63585F26
          4A117BB6533BC8636CDB7CF2DFC2A42B9877D6AC24E372148EF6074465FE49A2
          A1E8A50AFA4F60FC0CD3BC7294F77A94383CCB4826FB89CD509FBDFEA899B082
          B9369341B56A302CE96D996BE5CCB8EF6BD97CD59474991AFE08F3267A79028B
          AC7AB4743F8C556C1939351CAEF8DE7F0FA357303BA95586850D034B8FF4BE6A
          4D99B9672FC2B5848F9A89AD340E65FDE595EB1EF4908CE1AD6E3A554673FAA3
          667C81A939AECD54A4250C066179F241B786EDA30D0386C859665586D90DAF61
          86248DD593A0508E20E73440A309C22393B5FF16063E2AD44D6D6A20A219AA95
          ABBDF8C0B8B1C528D10007DCDD347C0A832CD9763E2D02CDF41A396044E58D19
          8D7771F8D781C79082F6EBD953AE5784A95B3463702B34597306A02B83E59603
          785CF5DDCE5C66C7D53FD3AAC8C8AF61063D8620D3EC81D3E0E19F29DB2C2184
          DCA98FCD306605C3A44DB48DCC027446754DA09A8711342670A6BC4C3E7D02A3
          8F0B8BBCB0C983CF2829E16618AE61FA62265D6F95BB0566B7D20CEE3605A5CE
          D814F71B3D6E04CE2497D1C61A6618EADC7FA539462A64E0AC8CB3192E889109
          23DE55024B337951F4780D33AD60020D3265382D8628A1CFA1ED1A78EFACE6B2
          8880649CF7B95EAAA2F2ECF1481B055C08A191E922F9C3DB0CE37A69CBB3A39C
          CD24E9878F9A6969A630F26310630F6A552C2D34B0A4012DEB8AA4D2202A1842
          3E8AFA5076C34ADD664ED7366D081778D18C2D3070AD51284A2ED04CB3889387
          A152F10C143C0A03F3AEAA198B66AE606643710128A0F32B99B702D34B1D6860
          927005736DA6E54E088A711E3A48AD04D3879144BA14834B6136F5584B16187D
          BDA4286FC1A6118532EDE03C271507873ADEBAB5666633793E49338DE305265F
          E6B073C912BE51CC11743983E1844A2E7D0653B21A5991A904AA01361B69B822
          D78FFAD21D0CB5360166065AC1A85187E1B68CE3DA4CCB55BA596F75186F66E0
          4B3B3316CDD40423455FA6B0FB306C855974BBD493C05086F31E7A038CF8CC50
          7D66943CC6912D6099DB94358B6D309CCEB8C00479256486288C8339F88D9C7E
          FD2E80B13413204433973247AD96A517D6E8A2AEEFA4C084EB6BEC10FCBCB239
          B2982F938FE302132ACCFC6A120A3196C220589A976D3097E716DD2F8DAC5CFB
          3A9F302E6612071EE9E9E3F8EFD2EDB61555C2E8D5E9F532F050ADF46572DCF1
          1CC4D9D5A54A430F18972B9B64BC8699B5134261908FEFF3F2A5A31CC5698775
          4E61697CAA11EF8459F219259F71B8FD52B56F0A5A1E1DE77AFD80C8BAB4DEE0
          5B5FA7F7328DF61B0BE4F437A57F9485AC51F6B78CB915260DE127DB07BC8A83
          C0FCCA1E041D7EAA19C6C0BF24C32FC0A8FF93AD195AF54370B9D7CB2CCFA3FB
          B77A990688FED1F43254C92138E5D4FF834C75BDE9F785CB7793ECFC545C3BDB
          B6B7133EB3C40ABF29756D7F5E8BDD06D3C381A3FF5F89F5B2C777CB16182E0C
          27B6E2BFB46DEAB39D54BEAC71BA4D9B9361A63C7AFF3FC090E8C18F6E72D366
          18B6C05AA75FAF1A5C6C8C18474CF7C1E4E07F6F37CC9538C47765C9DC6DF219
          566D0479BFCE215B9F266AC6B92D7A991D38C34C5F574F2EB3973D3BA66CA72F
          6753D9EB3F2D057FDA3808CC262BDD86A91F75EDDDD51D39F3368479579499BE
          5A9B7777C2D80AF369232A852977D974201BFAE41F0DE44C95F6EC8B7D7AB83F
          DC09330ACC2728B2FDAA36E9577BFC4A5D71B2197EDEA555B6FDFF9BC5BD30BE
          C07CA89A02909921F72429615BF6F1BBB2A5DFC956A6EF360CFC120CA4E7662D
          231BA72AD0450C4F3277CB4CDCFAFF15CC7827CC50603ED9786F64E6CEA88993
          AEF4DCC83D3E46B62E36E51F659A8E53B1B2E34676F7AFB6F8CB85F04B30DEB7
          28A9ABF36FDC80D5AAB61E35CDAEAB87B2BF0B472CFAE39E858760864FB692A8
          6C3815280032FD6BA66E329DEB3A53E68279D8C9DEB2E6BD99D4B23D63DE1D91
          FBFEB6CFCCADC2F730D9CB046B6704A69569E83A71DE0A5E5B15D3CAD7A330DB
          34E3B36A1B6EFF020877B3D1554DD99F06C7E684167789963FF927951C1F84A9
          2D98FB1A26B18A64342686F565CAAE56EEDAA2B0ADC9AAEC51560ED4938AFD75
          0EDB6056FFD6E2FE2BC00056151E7CF9561CF00000000049454E44AE426082}
        OriginName = 'FM.asz'
      end>
    SkinDirectory = 'C:\ProjectIDTU\Delphi\Lib102\acnt_regdx10tokyo\Skins'
    SkinName = 'FM (internal)'
    SkinInfo = '10.25'
    ThirdParty.ThirdEdits = 
      'TEdit'#13#10'TMemo'#13#10'TMaskEdit'#13#10'TSpinEdit'#13#10'TLabeledEdit'#13#10'THotKey'#13#10'TList' +
      'Box'#13#10'TSearchBox'#13#10'TCheckListBox'#13#10'TRichEdit'#13#10'TDateTimePicker'#13#10'TCat' +
      'egoryButtons'#13#10'TFileListBox'#13#10'TImageEnView'#13#10'ImageEn'#13#10'TDBLUEdit'#13#10'TA' +
      'dvSpinEdit'#13#10'TAdvLUEdit'#13#10'TAdvEditBtn'#13#10'TUnitAdvEditBtn'#13#10'TAdvFileNa' +
      'meEdit'#13#10'TAdvDirectoryEdit'#13#10'TDBAdvLUEdit'#13#10'TDBAdvSpinEdit'#13#10'TDBAdvE' +
      'dit'#13#10'TDBAdvMaskEdit'#13#10'TEditBtn'#13#10'TUnitEditBtn'#13#10'TMoneyEdit'#13#10'TDBMone' +
      'yEdit'#13#10'TMaskEditEx'#13#10'TEditListBox'#13#10'TAdvEdit'#13#10'TAdvMaskEdit'#13#10'TLUEdi' +
      't'#13#10'TDBAdvEditBtn'#13#10'TAdvMoneyEdit'#13#10'TDBAdvMoneyEdit'#13#10'THTMListBox'#13#10'T' +
      'HTMLCheckList'#13#10'TParamListBox'#13#10'TParamCheckList'#13#10
    ThirdParty.ThirdButtons = 'TButton'#13#10
    ThirdParty.ThirdBitBtns = 'TBitBtn'#13#10
    ThirdParty.ThirdCheckBoxes = 'TCheckBox'#13#10'TRadioButton'#13#10'TGroupButton'#13#10
    ThirdParty.ThirdGroupBoxes = 'TGroupBox'#13#10'TRadioGroup'#13#10
    ThirdParty.ThirdListViews = 'TListView'#13#10'TAdvListView'#13#10
    ThirdParty.ThirdPanels = 'TPanel'#13#10'TPage'#13#10'TGridPanel'#13#10'TTabPage'#13#10
    ThirdParty.ThirdGrids = 
      'TStringGrid'#13#10'TDrawGrid'#13#10'TValueListEditor'#13#10'TAdvStringGrid'#13#10'TDBAdv' +
      'Grid'#13#10
    ThirdParty.ThirdTreeViews = 'TTreeView'#13#10'THTMLTreeview'#13#10'TParamTreeview'#13#10
    ThirdParty.ThirdComboBoxes = 
      'TComboBox'#13#10'TComboBoxEx'#13#10'TColorBox'#13#10'TDBLUCombo'#13#10'TAdvComboBox'#13#10'TLU' +
      'Combo'#13#10'TAdvDBLookupComboBox'#13#10'TAdvTreeComboBox'#13#10'THTMLComboBox'#13#10
    ThirdParty.ThirdWWEdits = 'TCheckListEdit'#13#10
    ThirdParty.ThirdVirtualTrees = ' '#13#10
    ThirdParty.ThirdGridEh = ' '#13#10
    ThirdParty.ThirdPageControl = 'TPageControl'#13#10
    ThirdParty.ThirdTabControl = 'TTabControl'#13#10'TTabbedNotebook'#13#10
    ThirdParty.ThirdToolBar = 'TToolBar'#13#10
    ThirdParty.ThirdStatusBar = 'TStatusBar'#13#10
    ThirdParty.ThirdSpeedButton = 'TSpeedButton'#13#10
    ThirdParty.ThirdScrollControl = 'TScrollBox'#13#10
    ThirdParty.ThirdUpDown = 'TSpinButton'#13#10'TUpDown'#13#10
    ThirdParty.ThirdScrollBar = 'TScrollBar'#13#10
    ThirdParty.ThirdStaticText = 'TStaticText'#13#10
    ThirdParty.ThirdNativePaint = 'TImageEnFolderMView'#13#10
    Left = 354
    Top = 202
  end
  object AdvPanelStyler1: TAdvPanelStyler
    Tag = 0
    Settings.AnchorHint = False
    Settings.BevelInner = bvNone
    Settings.BevelOuter = bvNone
    Settings.BevelWidth = 1
    Settings.BorderColor = clNone
    Settings.BorderShadow = False
    Settings.BorderStyle = bsNone
    Settings.BorderWidth = 0
    Settings.BottomIndent = 0
    Settings.CanMove = True
    Settings.CanSize = True
    Settings.Caption.Color = 4473924
    Settings.Caption.ColorTo = clNone
    Settings.Caption.Font.Charset = DEFAULT_CHARSET
    Settings.Caption.Font.Color = 15790320
    Settings.Caption.Font.Height = -11
    Settings.Caption.Font.Name = 'Tahoma'
    Settings.Caption.Font.Style = []
    Settings.Caption.GradientDirection = gdVertical
    Settings.Caption.Indent = 2
    Settings.Caption.ShadeLight = 255
    Settings.Collaps = False
    Settings.CollapsColor = clNone
    Settings.CollapsDelay = 0
    Settings.CollapsSteps = 0
    Settings.Color = 11711154
    Settings.ColorTo = clNone
    Settings.ColorMirror = clNone
    Settings.ColorMirrorTo = clNone
    Settings.Cursor = crDefault
    Settings.Font.Charset = DEFAULT_CHARSET
    Settings.Font.Color = 2500134
    Settings.Font.Height = -11
    Settings.Font.Name = 'Tahoma'
    Settings.Font.Style = []
    Settings.FixedTop = False
    Settings.FixedLeft = False
    Settings.FixedHeight = False
    Settings.FixedWidth = False
    Settings.Height = 120
    Settings.Hover = False
    Settings.HoverColor = clNone
    Settings.HoverFontColor = clNone
    Settings.Indent = 0
    Settings.ShadowColor = clBlack
    Settings.ShadowOffset = 0
    Settings.ShowHint = False
    Settings.ShowMoveCursor = False
    Settings.StatusBar.BorderColor = clNone
    Settings.StatusBar.BorderStyle = bsSingle
    Settings.StatusBar.Font.Charset = DEFAULT_CHARSET
    Settings.StatusBar.Font.Color = 15790320
    Settings.StatusBar.Font.Height = -11
    Settings.StatusBar.Font.Name = 'Tahoma'
    Settings.StatusBar.Font.Style = []
    Settings.StatusBar.Color = 4473924
    Settings.StatusBar.GradientDirection = gdVertical
    Settings.TextVAlign = tvaTop
    Settings.TopIndent = 0
    Settings.URLColor = clBlue
    Settings.Width = 0
    Style = psOffice2016Gray
    Left = 432
    Top = 200
  end
  object sSkinProvider1: TsSkinProvider
    AddedTitle.Font.Charset = DEFAULT_CHARSET
    AddedTitle.Font.Color = clNone
    AddedTitle.Font.Height = -11
    AddedTitle.Font.Name = 'Tahoma'
    AddedTitle.Font.Style = []
    SkinData.SkinSection = 'FORM'
    TitleButtons = <>
    Left = 535
    Top = 201
  end
end
