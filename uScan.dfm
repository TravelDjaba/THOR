object FormScan: TFormScan
  Left = 0
  Top = 0
  Caption = 'Scan'
  ClientHeight = 663
  ClientWidth = 1404
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object sSplitter1: TsSplitter
    Left = 0
    Top = 474
    Width = 1404
    Height = 14
    Cursor = crVSplit
    Align = alBottom
    ExplicitTop = 648
    ExplicitWidth = 1304
  end
  object sPanel1: TsPanel
    Left = 0
    Top = 0
    Width = 1404
    Height = 169
    Align = alTop
    TabOrder = 0
    object pcScanType: TsPageControl
      Left = 6
      Top = 8
      Width = 211
      Height = 154
      ActivePage = tsConf
      TabOrder = 0
      object tsXY: TsTabSheet
        Caption = 'X-Y'
        object sGroupBox1: TsGroupBox
          Left = 3
          Top = 3
          Width = 198
          Height = 123
          Caption = 'Scan parameters'
          TabOrder = 0
          object vleScanParamsXY: TValueListEditor
            Left = 14
            Top = 22
            Width = 169
            Height = 98
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goEditing, goTabs, goAlwaysShowEditor, goThumbTracking]
            ScrollBars = ssNone
            Strings.Strings = (
              'X steps count=10'
              'Y steps count=10'
              'X step size=10'
              'Y step size=10')
            TabOrder = 0
            TitleCaptions.Strings = (
              'Parameter'
              'Value')
            OnSetEditText = vleScanParamsXYSetEditText
            ColWidths = (
              106
              57)
            RowHeights = (
              18
              18
              18
              18
              18)
          end
        end
      end
      object tsKinetic: TsTabSheet
        Caption = 'Kinetic'
        object sGroupBox3: TsGroupBox
          Left = 2
          Top = 3
          Width = 198
          Height = 123
          Caption = 'Scan parameters'
          TabOrder = 0
          object vleScanParamsKinetic: TValueListEditor
            Left = 13
            Top = 22
            Width = 169
            Height = 98
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goEditing, goTabs, goAlwaysShowEditor, goThumbTracking]
            ScrollBars = ssNone
            Strings.Strings = (
              'Count=10'
              'Time period (s)=30')
            TabOrder = 0
            TitleCaptions.Strings = (
              'Parameter'
              'Value')
            OnSetEditText = vleScanParamsKineticSetEditText
            ColWidths = (
              106
              57)
            RowHeights = (
              18
              18
              18)
          end
        end
      end
      object tsXZ: TsTabSheet
        Caption = 'X-Z'
        object sGroupBox2: TsGroupBox
          Left = 5
          Top = 3
          Width = 198
          Height = 123
          Caption = 'Scan parameters'
          TabOrder = 0
          object vleScanParamsXZ: TValueListEditor
            Left = 14
            Top = 22
            Width = 169
            Height = 98
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goEditing, goTabs, goAlwaysShowEditor, goThumbTracking]
            ScrollBars = ssNone
            Strings.Strings = (
              'X steps count=1'
              'Z steps count=10'
              'X step size=1'
              'Z step size=10')
            TabOrder = 0
            TitleCaptions.Strings = (
              'Parameter'
              'Value')
            OnSetEditText = vleScanParamsXZSetEditText
            ColWidths = (
              106
              57)
            RowHeights = (
              18
              18
              18
              18
              18)
          end
        end
      end
      object tsPower: TsTabSheet
        Caption = 'Power'
        object sGroupBox4: TsGroupBox
          Left = 5
          Top = 3
          Width = 198
          Height = 123
          Caption = 'Scan parameters'
          TabOrder = 0
          object vleScanParamsPower: TValueListEditor
            Left = 13
            Top = 16
            Width = 169
            Height = 98
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goEditing, goTabs, goAlwaysShowEditor, goThumbTracking]
            ScrollBars = ssNone
            Strings.Strings = (
              'Count=20'
              'Step Size (mW)=10'
              'Start Power (mW)=50'
              'Finish Power (mW)=250')
            TabOrder = 0
            TitleCaptions.Strings = (
              'Parameter'
              'Value')
            OnExit = vleScanParamsPowerExit
            OnKeyDown = vleScanParamsPowerKeyDown
            OnSelectCell = vleScanParamsPowerSelectCell
            OnSetEditText = vleScanParamsPowerSetEditText
            ColWidths = (
              106
              57)
            RowHeights = (
              18
              18
              18
              18
              18)
          end
        end
      end
      object tsConf: TsTabSheet
        Caption = 'Conf'
        object vleScanParamsOneAxis: TValueListEditor
          Left = 13
          Top = 11
          Width = 169
          Height = 98
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goEditing, goTabs, goAlwaysShowEditor, goThumbTracking]
          ScrollBars = ssNone
          Strings.Strings = (
            'Steps count=120'
            'Step size=2692'
            'StartLine=91')
          TabOrder = 0
          TitleCaptions.Strings = (
            'Parameter'
            'Value')
          OnSetEditText = vleScanParamsKineticSetEditText
          ColWidths = (
            106
            57)
          RowHeights = (
            18
            18
            18
            18)
        end
      end
    end
    object DirectoryEdit: TsDirectoryEdit
      Left = 407
      Top = 8
      Width = 413
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
      TabOrder = 1
      Text = 'C:\ProjectIDTU\Scan'
      OnChange = DirectoryEditChange
      CheckOnExit = True
      BoundLabel.Active = True
      BoundLabel.Caption = 'Save path'
      GlyphMode.Grayed = False
      GlyphMode.Blend = 0
      InitialDir = 'C:\'
      Root = 'rfDesktop'
    end
    object FileNameEdit: TsEdit
      Left = 407
      Top = 35
      Width = 165
      Height = 21
      Color = 3355443
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 15724527
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Text = 'Scan1'
      BoundLabel.Active = True
      BoundLabel.Caption = 'File name'
    end
    object sPanel2: TsPanel
      Left = 223
      Top = 63
      Width = 106
      Height = 99
      TabOrder = 3
      object btnPause: TsSpeedButton
        Tag = 1
        Left = 16
        Top = 37
        Width = 75
        Height = 23
        AllowAllUp = True
        GroupIndex = 1
        Caption = 'Pause'
        Enabled = False
        OnClick = btnPauseClick
        ButtonStyle = tbsCheck
      end
      object btnStart: TsBitBtn
        Left = 16
        Top = 6
        Width = 75
        Height = 25
        Caption = 'Start'
        TabOrder = 0
        OnClick = btnStartClick
      end
      object btnStop: TsBitBtn
        Left = 16
        Top = 65
        Width = 75
        Height = 25
        Caption = 'Stop'
        Enabled = False
        TabOrder = 1
        OnClick = btnStopClick
      end
    end
    object gbStatus: TsGroupBox
      Left = 386
      Top = 71
      Width = 244
      Height = 91
      Caption = 'Status'
      TabOrder = 4
      object vleStatus: TValueListEditor
        Left = 11
        Top = 14
        Width = 214
        Height = 67
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goEditing, goAlwaysShowEditor, goThumbTracking]
        Strings.Strings = (
          'Count='
          'Status=')
        TabOrder = 0
        TitleCaptions.Strings = (
          'Parameter'
          'Value')
        ColWidths = (
          74
          134)
        RowHeights = (
          18
          18
          18)
      end
    end
    object rgAutoScale: TsRadioGroup
      Left = 636
      Top = 71
      Width = 128
      Height = 92
      Caption = 'AutoScale'
      TabOrder = 5
      ItemIndex = 1
      Items.Strings = (
        'Global'
        'Current Wavelength'
        'Custom')
      OnChange = rgAutoScaleChange
    end
    object ValueListEditor1: TValueListEditor
      Left = 888
      Top = 8
      Width = 249
      Height = 153
      TabOrder = 6
      ColWidths = (
        104
        139)
      RowHeights = (
        18
        18)
    end
    object btnReturnToStart: TsButton
      Left = 239
      Top = 8
      Width = 75
      Height = 25
      Caption = 'ReturnToStart'
      TabOrder = 7
      OnClick = btnReturnToStartClick
    end
  end
  object pnlGraphMain: TsPanel
    Left = 0
    Top = 169
    Width = 1404
    Height = 305
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 1
    TabOrder = 1
    object splitterGraph2: TsSplitter
      Left = 1
      Top = 173
      Width = 1402
      Height = 6
      Cursor = crVSplit
      Align = alBottom
      ExplicitTop = 267
      ExplicitWidth = 115
    end
    object pnlGraphTop: TsPanel
      Left = 1
      Top = 1
      Width = 1402
      Height = 172
      Align = alClient
      BevelOuter = bvNone
      Constraints.MinHeight = 50
      Constraints.MinWidth = 50
      TabOrder = 0
      object splitterGraph1: TsSplitter
        Left = 97
        Top = 0
        Height = 172
        ExplicitLeft = 0
        ExplicitTop = 260
        ExplicitHeight = 1302
      end
      object pnlLGraph: TsPanel
        Left = 0
        Top = 0
        Width = 97
        Height = 172
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
        Width = 1299
        Height = 172
        Align = alClient
        BevelOuter = bvLowered
        Caption = 'pnlIGraph'
        TabOrder = 1
      end
    end
    object pnlBottom: TsPanel
      Left = 1
      Top = 179
      Width = 1402
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
      end
      object pnlHGraph: TsPanel
        Left = 104
        Top = 1
        Width = 1297
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
      Top = 285
      Width = 1402
      Height = 19
      Panels = <
        item
          Width = 100
        end
        item
          Width = 100
        end
        item
          Width = 100
        end
        item
          Width = 100
        end>
    end
  end
  object pnlSpectra: TsPanel
    Left = 0
    Top = 488
    Width = 1404
    Height = 175
    Align = alBottom
    Caption = 'pnlSpectra'
    TabOrder = 2
  end
  object MainMenu1: TMainMenu
    Left = 648
    Top = 424
    object F1: TMenuItem
      Caption = 'File'
      object S1: TMenuItem
        Caption = 'Save'
        object t1: TMenuItem
          Caption = 'to CSV'
          OnClick = t1Click
        end
        object E1: TMenuItem
          Caption = 'ExportAsLineCorrection'
          OnClick = E1Click
        end
        object N1: TMenuItem
          Caption = 'Multilayer CSV'
          OnClick = N1Click
        end
        object A1: TMenuItem
          Caption = 'Average Cols&&Rows'
          OnClick = A1Click
        end
      end
      object L1: TMenuItem
        Caption = 'Open'
        object O1: TMenuItem
          Caption = 'Open map'
          OnClick = O1Click
        end
      end
    end
  end
  object SaveDialog: TsSaveDialog
    Left = 120
    Top = 184
  end
  object OpenDialog: TsOpenDialog
    Filter = 'scn|*.scn'
    Left = 184
    Top = 186
  end
  object sSkinProvider1: TsSkinProvider
    SkinData.SkinSection = 'FORM'
    TitleButtons = <>
    Left = 304
    Top = 194
  end
end
