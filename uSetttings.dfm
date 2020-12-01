object FormSettings: TFormSettings
  Left = 0
  Top = 0
  Caption = 'Settings'
  ClientHeight = 685
  ClientWidth = 915
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object TreeSettings: TsTreeView
    Left = 0
    Top = 0
    Width = 193
    Height = 685
    Align = alLeft
    Color = 3355443
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 15724527
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Indent = 19
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    OnClick = TreeSettingsClick
    Items.NodeData = {
      030A0000002A0000000000000001000000FFFFFFFFFFFFFFFF00000000000000
      000000000001064C00610079006F0075007400440000000000000002000000FF
      FFFFFFFFFFFFFF000000000000000000000000011358002D007300630061006C
      0065002000630061006C006900620072006100740069006F006E004400000000
      00000007000000FFFFFFFFFFFFFFFF000000000000000000000000011359002D
      007300630061006C0065002000630061006C006900620072006100740069006F
      006E00280000000000000003000000FFFFFFFFFFFFFFFF000000000000000000
      00000001054F007400680065007200380000000000000004000000FFFFFFFFFF
      FFFFFF000000000000000000000000010D430072006F00730073002000730065
      006300740069006F006E003A0000000000000005000000FFFFFFFFFFFFFFFF00
      0000000000000000000000010E4C0069006E00650043006F0072007200650063
      00740069006F006E00260000000000000006000000FFFFFFFFFFFFFFFF000000
      00000000000000000001045600690065007700320000000000000008000000FF
      FFFFFFFFFFFFFF000000000000000000000000010A4D0075006C007400690074
      007200610063006B00300000000000000009000000FFFFFFFFFFFFFFFF000000
      00000000000000000001094F0062006A00650063007400690076006500380000
      00000000000A000000FFFFFFFFFFFFFFFF000000000000000000000000010D45
      00780070004200610063006B00670072006F0075006E006400}
  end
  object PageControlSettings: TsPageControl
    Left = 193
    Top = 0
    Width = 722
    Height = 685
    ActivePage = tsXcalibration
    Align = alClient
    DoubleBuffered = False
    ParentDoubleBuffered = False
    TabHeight = 14
    TabOrder = 1
    TabPosition = tpBottom
    object tsLayout: TsTabSheet
      Caption = 'Layout'
      object sPanel1: TsPanel
        Left = 0
        Top = 0
        Width = 714
        Height = 663
        Align = alClient
        ParentBackground = False
        TabOrder = 0
        DesignSize = (
          714
          663)
        object cbSaveAtClose: TsCheckBox
          Left = 8
          Top = 532
          Width = 126
          Height = 17
          Caption = 'Save Layout at close'
          Anchors = [akLeft, akBottom]
          TabOrder = 0
          OnClick = cbSaveAtCloseClick
          ImgChecked = 0
          ImgUnchecked = 0
        end
        object lbLayouts: TEditListBox
          Left = 8
          Top = 26
          Width = 313
          Height = 451
          Anchors = [akLeft, akTop, akBottom]
          ItemHeight = 13
          ScrollWidth = 17
          TabOrder = 1
          OnEditDone = lbLayoutsEditDone
          OnEditStart = lbLayoutsEditStart
          AutoInsert = False
          AutoDelete = False
          AllowEdit = True
          ItemIndex = -1
          ScrollStyle = ssNormal
          ScrollColor = clNone
          ScrollHorizontal = True
          LookupIncr = False
          LookupFull = False
          ReturnIsTab = False
          ReturnIsClick = False
          ReturnIsDblClick = False
          FocusColor = clWindow
          Hovering = False
          Persist.Enable = False
          Persist.Storage = stInifile
          Persist.Count = 0
          Persist.MaxCount = False
          HintColor = clWhite
          TabPositions = <>
          Version = '2.1.1.1'
        end
        object btnNew: TsButton
          Left = 165
          Top = 491
          Width = 75
          Height = 25
          Anchors = [akLeft, akBottom]
          Caption = 'New'
          TabOrder = 2
          OnClick = btnNewClick
        end
        object btnApply: TsButton
          Left = 8
          Top = 491
          Width = 75
          Height = 25
          Anchors = [akLeft, akBottom]
          Caption = 'Apply'
          TabOrder = 3
          OnClick = btnApplyClick
        end
        object btnDelete: TsButton
          Left = 246
          Top = 491
          Width = 75
          Height = 25
          Anchors = [akLeft, akBottom]
          Caption = 'Delete'
          TabOrder = 4
          OnClick = btnDeleteClick
        end
      end
    end
    object tsXcalibration: TsTabSheet
      Caption = 'Xcalibration'
      object CalXChart: TChart
        Left = 228
        Top = 40
        Width = 483
        Height = 333
        AllowPanning = pmNone
        Legend.Visible = False
        Title.Text.Strings = (
          'Calibration curve')
        Panning.InsideBounds = True
        Panning.MouseWheel = pmwNone
        View3D = False
        Zoom.Allow = False
        Zoom.FullRepaint = True
        TabOrder = 0
        DefaultCanvas = 'TGDIPlusCanvas'
        PrintMargins = (
          15
          29
          15
          29)
        ColorPaletteIndex = 13
        object Series1: THorizLineSeries
          Brush.BackColor = clDefault
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          XValues.Name = 'X'
          XValues.Order = loNone
          YValues.Name = 'Y'
          YValues.Order = loAscending
        end
      end
      object tcLasers: TsTabControl
        Left = 16
        Top = 32
        Width = 194
        Height = 361
        TabOrder = 1
        Tabs.Strings = (
          'Laser1'
          'Laser2'
          'Laser3'
          'Laser4')
        TabIndex = 0
        OnChange = tcLasersChange
        object edtLaserWavelengthNm: TsDecimalSpinEdit
          Left = 42
          Top = 42
          Width = 65
          Height = 21
          Color = 3355443
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 15724527
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Text = '785.2'
          OnChange = edtLaserWavelengthNmChange
          BoundLabel.Active = True
          BoundLabel.Caption = 'Laser wavelength (nm)'
          BoundLabel.Layout = sclTopCenter
          Increment = 0.100000000000000000
          MaxValue = 5000.000000000000000000
          MinValue = 100.000000000000000000
          Value = 785.200000000000000000
          DecimalPlaces = 1
        end
        object rgCalXUnits: TsRadioGroup
          Left = 11
          Top = 65
          Width = 145
          Height = 43
          Caption = 'Use calibration curve in'
          TabOrder = 1
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'nm'
            'cm-1')
          OnChange = rgCalXUnitsChange
        end
        object sgXcalibrationCoef: TStringGrid
          Left = 11
          Top = 117
          Width = 168
          Height = 193
          ColCount = 3
          DefaultColWidth = 30
          DefaultRowHeight = 18
          RowCount = 10
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goTabs, goAlwaysShowEditor]
          TabOrder = 2
          ColWidths = (
            30
            59
            72)
          RowHeights = (
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18)
        end
        object btnCalcCalibrationPolinom: TsButton
          Left = 19
          Top = 320
          Width = 153
          Height = 25
          Caption = 'Apply'
          TabOrder = 3
          OnClick = btnCalcCalibrationPolinomClick
        end
      end
      object cboxLaserInUse: TsComboBox
        Left = 27
        Top = 432
        Width = 145
        Height = 21
        Alignment = taLeftJustify
        BoundLabel.Active = True
        BoundLabel.Caption = 'Laser In Use'
        BoundLabel.Layout = sclTopLeft
        VerticalAlignment = taAlignTop
        Color = 3355443
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 15724527
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemIndex = -1
        ParentFont = False
        TabOrder = 2
        OnChange = cboxLaserInUseChange
      end
    end
    object tsOther: TsTabSheet
      Caption = 'Other'
      object rgBackgroundType: TsRadioGroup
        Left = 16
        Top = 16
        Width = 113
        Height = 65
        Caption = 'BackgroundType'
        TabOrder = 0
        ItemIndex = 0
        Items.Strings = (
          'Dark'
          'Light')
        OnChange = rgBackgroundTypeChange
      end
    end
    object tsCrossSection: TsTabSheet
      Caption = 'CrossSection'
      object sGroupBox1: TsGroupBox
        Left = 16
        Top = 43
        Width = 193
        Height = 174
        Caption = 'Instrument parameters'
        TabOrder = 0
        object edtCSSERSMonolayer: TsDecimalSpinEdit
          Left = 117
          Top = 99
          Width = 57
          Height = 21
          Color = 3355443
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 15724527
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Text = '1.00'
          BoundLabel.Active = True
          BoundLabel.Caption = 'SERS monolayer (nm)'
          ShowSpinButtons = False
          Increment = 1.000000000000000000
          Value = 1.000000000000000000
        end
        object edtCSPSF: TsDecimalSpinEdit
          Left = 117
          Top = 72
          Width = 57
          Height = 21
          Color = 3355443
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 15724527
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          Text = '1000.00'
          BoundLabel.Active = True
          BoundLabel.Caption = 'Axial PSF (nm)'
          ShowSpinButtons = False
          Increment = 1.000000000000000000
          Value = 1000.000000000000000000
        end
        object edtCSRI: TsDecimalSpinEdit
          Left = 117
          Top = 45
          Width = 57
          Height = 21
          Color = 3355443
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 15724527
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          Text = '1.00'
          BoundLabel.Active = True
          BoundLabel.Caption = 'Refractive index'
          ShowSpinButtons = False
          Increment = 1.000000000000000000
          Value = 1.000000000000000000
        end
        object edtCSNA: TsDecimalSpinEdit
          Left = 117
          Top = 18
          Width = 57
          Height = 21
          Color = 3355443
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 15724527
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          Text = '0.30'
          BoundLabel.Active = True
          BoundLabel.Caption = 'NA objective'
          ShowSpinButtons = False
          Increment = 1.000000000000000000
          Value = 0.300000000000000000
        end
        object edtCSSystemThroughput: TsDecimalSpinEdit
          Left = 117
          Top = 139
          Width = 57
          Height = 21
          Color = 3355443
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 15724527
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          Text = '1.00'
          BoundLabel.Active = True
          BoundLabel.Caption = 'SystemThroughput'
          ShowSpinButtons = False
          Increment = 1.000000000000000000
          Value = 1.000000000000000000
        end
      end
      object sGroupBox2: TsGroupBox
        Left = 224
        Top = 43
        Width = 209
        Height = 174
        Caption = 'Sample parameters'
        TabOrder = 1
        object edtCSdensity: TsDecimalSpinEdit
          Left = 137
          Top = 55
          Width = 57
          Height = 21
          Color = 3355443
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 15724527
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Text = '1000.00'
          BoundLabel.Active = True
          BoundLabel.Caption = 'Density  (kg/m3)'
          ShowSpinButtons = False
          Increment = 1.000000000000000000
          Value = 1000.000000000000000000
        end
        object edtCSMolecularWeight: TsDecimalSpinEdit
          Left = 137
          Top = 28
          Width = 57
          Height = 21
          Color = 3355443
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 15724527
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          Text = '196.97'
          BoundLabel.Active = True
          BoundLabel.Caption = 'Molecular weight  (g/mol)'
          ShowSpinButtons = False
          Increment = 1.000000000000000000
          Value = 196.967000000000000000
        end
        object edtCSSampleAttenuation: TsDecimalSpinEdit
          Left = 137
          Top = 139
          Width = 57
          Height = 21
          Color = 3355443
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 15724527
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          Text = '1.00'
          BoundLabel.Active = True
          BoundLabel.Caption = 'SampleAttenuation'
          ShowSpinButtons = False
          Increment = 1.000000000000000000
          Value = 1.000000000000000000
        end
      end
      object btnApplyCrossSection: TsButton
        Left = 16
        Top = 256
        Width = 75
        Height = 25
        Caption = 'Apply'
        TabOrder = 2
        OnClick = btnApplyCrossSectionClick
      end
    end
    object tsLineCorrection: TsTabSheet
      Caption = 'LineCorrection'
      DesignSize = (
        714
        663)
      object rgUsedLineCorrection: TsRadioGroup
        Left = 24
        Top = 16
        Width = 113
        Height = 81
        Caption = 'Used line correction'
        TabOrder = 0
        Items.Strings = (
          'None'
          'Default'
          'User')
        OnChange = rgUsedLineCorrectionChange
      end
      object btnCopyUsrToDefault: TsButton
        Left = 312
        Top = 16
        Width = 89
        Height = 26
        Caption = 'Copy Usr to Def'
        TabOrder = 1
        OnClick = btnCopyUsrToDefaultClick
      end
      object pnlLineCorrGraph: TsPanel
        Left = 3
        Top = 103
        Width = 709
        Height = 485
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = 'pnlLineCorrGraph'
        Constraints.MinHeight = 50
        Constraints.MinWidth = 50
        TabOrder = 2
      end
      object btnLoadLineCorrection: TsButton
        Left = 208
        Top = 16
        Width = 81
        Height = 25
        Caption = 'Load from file'
        TabOrder = 3
        OnClick = btnLoadLineCorrectionClick
      end
    end
    object tsView: TsTabSheet
      Caption = 'View'
      object sLabel1: TsLabel
        Left = 19
        Top = 157
        Width = 94
        Height = 13
        Caption = 'Aluminium (internal)'
      end
      object rgAndorPalette: TsRadioGroup
        Left = 19
        Top = 16
        Width = 94
        Height = 121
        Caption = 'AndorPalette'
        TabOrder = 0
        ItemIndex = 0
        Items.Strings = (
          'Gray'
          'WYRB'
          'WYRGBB'
          'RYGLB'
          'DRYGLBD')
        OnChange = rgAndorPaletteChange
      end
      object rgMapPalette: TsRadioGroup
        Left = 119
        Top = 16
        Width = 94
        Height = 121
        Caption = 'MapPalette'
        TabOrder = 1
        ItemIndex = 0
        Items.Strings = (
          'Gray'
          'WYRB'
          'WYRGBB'
          'RYGLB'
          'DRYGLBD')
        OnChange = rgMapPaletteChange
      end
      object sSkinSelector1: TsSkinSelector
        Left = 19
        Top = 176
        Width = 225
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 15724527
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
    end
    object tsYcalibration: TsTabSheet
      Caption = 'Ycalibration'
      object btnCalcCalibrationPolinomY: TsButton
        Left = 11
        Top = 264
        Width = 153
        Height = 25
        Caption = 'Apply'
        TabOrder = 0
        OnClick = btnCalcCalibrationPolinomYClick
      end
      object sgYcalibrationCoef: TStringGrid
        Left = 11
        Top = 64
        Width = 168
        Height = 194
        ColCount = 3
        DefaultColWidth = 30
        DefaultRowHeight = 18
        RowCount = 10
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goTabs, goAlwaysShowEditor]
        TabOrder = 1
        ColWidths = (
          30
          59
          72)
        RowHeights = (
          18
          18
          18
          18
          18
          18
          18
          18
          18
          18)
      end
      object CalYChart: TChart
        Left = 185
        Top = 15
        Width = 343
        Height = 274
        AllowPanning = pmNone
        Legend.Visible = False
        Title.Text.Strings = (
          'Y Calibration')
        Panning.InsideBounds = True
        Panning.MouseWheel = pmwNone
        View3D = False
        Zoom.Allow = False
        Zoom.FullRepaint = True
        TabOrder = 2
        DefaultCanvas = 'TGDIPlusCanvas'
        PrintMargins = (
          15
          10
          15
          10)
        ColorPaletteIndex = 13
        object HorizLineSeries1: THorizLineSeries
          Brush.BackColor = clDefault
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          XValues.Name = 'X'
          XValues.Order = loNone
          YValues.Name = 'Y'
          YValues.Order = loAscending
        end
      end
      object cbUseCalibrationY: TsCheckBox
        Left = 11
        Top = 15
        Width = 95
        Height = 17
        Caption = 'UseCalibration'
        TabOrder = 3
        OnClick = cbUseCalibrationYClick
        ImgChecked = 0
        ImgUnchecked = 0
      end
    end
    object tsMultitrack: TsTabSheet
      Caption = 'Multitrack'
      DesignSize = (
        714
        663)
      object sgMultitrack: TAdvStringGrid
        Left = 3
        Top = 11
        Width = 593
        Height = 584
        Cursor = crDefault
        Anchors = [akLeft, akTop, akRight, akBottom]
        ColCount = 6
        DrawingStyle = gdsClassic
        FixedCols = 0
        RowCount = 9
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goEditing]
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 0
        HoverRowCells = [hcNormal, hcSelected]
        OnDblClickCell = sgMultitrackDblClickCell
        OnGetEditorType = sgMultitrackGetEditorType
        OnCheckBoxChange = sgMultitrackCheckBoxChange
        OnEditCellDone = sgMultitrackEditCellDone
        ActiveCellFont.Charset = DEFAULT_CHARSET
        ActiveCellFont.Color = clWindowText
        ActiveCellFont.Height = -11
        ActiveCellFont.Name = 'Tahoma'
        ActiveCellFont.Style = [fsBold]
        ColumnHeaders.Strings = (
          'Use'
          'Color'
          'Name'
          'Central line'
          'Width'
          'k')
        ControlLook.FixedGradientHoverFrom = clGray
        ControlLook.FixedGradientHoverTo = clWhite
        ControlLook.FixedGradientDownFrom = clGray
        ControlLook.FixedGradientDownTo = clSilver
        ControlLook.DropDownHeader.Font.Charset = DEFAULT_CHARSET
        ControlLook.DropDownHeader.Font.Color = clWindowText
        ControlLook.DropDownHeader.Font.Height = -11
        ControlLook.DropDownHeader.Font.Name = 'Tahoma'
        ControlLook.DropDownHeader.Font.Style = []
        ControlLook.DropDownHeader.Visible = True
        ControlLook.DropDownHeader.Buttons = <>
        ControlLook.DropDownFooter.Font.Charset = DEFAULT_CHARSET
        ControlLook.DropDownFooter.Font.Color = clWindowText
        ControlLook.DropDownFooter.Font.Height = -11
        ControlLook.DropDownFooter.Font.Name = 'Tahoma'
        ControlLook.DropDownFooter.Font.Style = []
        ControlLook.DropDownFooter.Visible = True
        ControlLook.DropDownFooter.Buttons = <>
        Filter = <>
        FilterDropDown.Font.Charset = DEFAULT_CHARSET
        FilterDropDown.Font.Color = clWindowText
        FilterDropDown.Font.Height = -11
        FilterDropDown.Font.Name = 'Tahoma'
        FilterDropDown.Font.Style = []
        FilterDropDown.TextChecked = 'Checked'
        FilterDropDown.TextUnChecked = 'Unchecked'
        FilterDropDownClear = '(All)'
        FilterEdit.TypeNames.Strings = (
          'Starts with'
          'Ends with'
          'Contains'
          'Not contains'
          'Equal'
          'Not equal'
          'Larger than'
          'Smaller than'
          'Clear')
        FixedColWidth = 40
        FixedRowHeight = 22
        FixedFont.Charset = DEFAULT_CHARSET
        FixedFont.Color = clWindowText
        FixedFont.Height = -11
        FixedFont.Name = 'Tahoma'
        FixedFont.Style = [fsBold]
        FloatFormat = '%.2f'
        HoverButtons.Buttons = <>
        HoverButtons.Position = hbLeftFromColumnLeft
        HTMLSettings.ImageFolder = 'images'
        HTMLSettings.ImageBaseName = 'img'
        MouseActions.DirectEdit = True
        MouseActions.WheelAction = waScroll
        Navigation.AlwaysEdit = True
        PrintSettings.DateFormat = 'dd/mm/yyyy'
        PrintSettings.Font.Charset = DEFAULT_CHARSET
        PrintSettings.Font.Color = clWindowText
        PrintSettings.Font.Height = -11
        PrintSettings.Font.Name = 'Tahoma'
        PrintSettings.Font.Style = []
        PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
        PrintSettings.FixedFont.Color = clWindowText
        PrintSettings.FixedFont.Height = -11
        PrintSettings.FixedFont.Name = 'Tahoma'
        PrintSettings.FixedFont.Style = []
        PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
        PrintSettings.HeaderFont.Color = clWindowText
        PrintSettings.HeaderFont.Height = -11
        PrintSettings.HeaderFont.Name = 'Tahoma'
        PrintSettings.HeaderFont.Style = []
        PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
        PrintSettings.FooterFont.Color = clWindowText
        PrintSettings.FooterFont.Height = -11
        PrintSettings.FooterFont.Name = 'Tahoma'
        PrintSettings.FooterFont.Style = []
        PrintSettings.PageNumSep = '/'
        SearchFooter.FindNextCaption = 'Find &next'
        SearchFooter.FindPrevCaption = 'Find &previous'
        SearchFooter.Font.Charset = DEFAULT_CHARSET
        SearchFooter.Font.Color = clWindowText
        SearchFooter.Font.Height = -11
        SearchFooter.Font.Name = 'Tahoma'
        SearchFooter.Font.Style = []
        SearchFooter.HighLightCaption = 'Highlight'
        SearchFooter.HintClose = 'Close'
        SearchFooter.HintFindNext = 'Find next occurrence'
        SearchFooter.HintFindPrev = 'Find previous occurrence'
        SearchFooter.HintHighlight = 'Highlight occurrences'
        SearchFooter.MatchCaseCaption = 'Match case'
        ShowSelection = False
        SizeWithForm = True
        SortSettings.DefaultFormat = ssAutomatic
        Version = '8.1.3.0'
        ColWidths = (
          40
          42
          214
          73
          76
          77)
        RowHeights = (
          22
          22
          22
          22
          22
          22
          22
          22
          22)
      end
      object btnApplyMultitrack: TsButton
        Left = 523
        Top = 601
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'Apply'
        TabOrder = 1
        OnClick = btnApplyMultitrackClick
      end
    end
    object tsObjective: TsTabSheet
      Caption = 'Objective'
      object rgObjective: TRadioGroup
        Left = 16
        Top = 3
        Width = 177
        Height = 118
        Caption = 'Objective'
        ItemIndex = 0
        Items.Strings = (
          'Objective1'
          'Objective2'
          'Objective3'
          'Objective4'
          'Objective5')
        TabOrder = 0
      end
      object sgObjective: TAdvStringGrid
        Left = 16
        Top = 171
        Width = 259
        Height = 92
        Cursor = crDefault
        ColCount = 3
        DefaultColWidth = 85
        DrawingStyle = gdsClassic
        RowCount = 4
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
        ScrollBars = ssBoth
        TabOrder = 1
        HoverRowCells = [hcNormal, hcSelected]
        ActiveCellFont.Charset = DEFAULT_CHARSET
        ActiveCellFont.Color = clWindowText
        ActiveCellFont.Height = -11
        ActiveCellFont.Name = 'Tahoma'
        ActiveCellFont.Style = [fsBold]
        ColumnHeaders.Strings = (
          ''
          'X'
          'Y')
        ControlLook.FixedGradientHoverFrom = clGray
        ControlLook.FixedGradientHoverTo = clWhite
        ControlLook.FixedGradientDownFrom = clGray
        ControlLook.FixedGradientDownTo = clSilver
        ControlLook.DropDownHeader.Font.Charset = DEFAULT_CHARSET
        ControlLook.DropDownHeader.Font.Color = clWindowText
        ControlLook.DropDownHeader.Font.Height = -11
        ControlLook.DropDownHeader.Font.Name = 'Tahoma'
        ControlLook.DropDownHeader.Font.Style = []
        ControlLook.DropDownHeader.Visible = True
        ControlLook.DropDownHeader.Buttons = <>
        ControlLook.DropDownFooter.Font.Charset = DEFAULT_CHARSET
        ControlLook.DropDownFooter.Font.Color = clWindowText
        ControlLook.DropDownFooter.Font.Height = -11
        ControlLook.DropDownFooter.Font.Name = 'Tahoma'
        ControlLook.DropDownFooter.Font.Style = []
        ControlLook.DropDownFooter.Visible = True
        ControlLook.DropDownFooter.Buttons = <>
        Filter = <>
        FilterDropDown.Font.Charset = DEFAULT_CHARSET
        FilterDropDown.Font.Color = clWindowText
        FilterDropDown.Font.Height = -11
        FilterDropDown.Font.Name = 'Tahoma'
        FilterDropDown.Font.Style = []
        FilterDropDown.TextChecked = 'Checked'
        FilterDropDown.TextUnChecked = 'Unchecked'
        FilterDropDownClear = '(All)'
        FilterEdit.TypeNames.Strings = (
          'Starts with'
          'Ends with'
          'Contains'
          'Not contains'
          'Equal'
          'Not equal'
          'Larger than'
          'Smaller than'
          'Clear')
        FixedColWidth = 85
        FixedRowHeight = 22
        FixedFont.Charset = DEFAULT_CHARSET
        FixedFont.Color = clWindowText
        FixedFont.Height = -11
        FixedFont.Name = 'Tahoma'
        FixedFont.Style = [fsBold]
        FloatFormat = '%.2f'
        HoverButtons.Buttons = <>
        HoverButtons.Position = hbLeftFromColumnLeft
        HTMLSettings.ImageFolder = 'images'
        HTMLSettings.ImageBaseName = 'img'
        PrintSettings.DateFormat = 'dd/mm/yyyy'
        PrintSettings.Font.Charset = DEFAULT_CHARSET
        PrintSettings.Font.Color = clWindowText
        PrintSettings.Font.Height = -11
        PrintSettings.Font.Name = 'Tahoma'
        PrintSettings.Font.Style = []
        PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
        PrintSettings.FixedFont.Color = clWindowText
        PrintSettings.FixedFont.Height = -11
        PrintSettings.FixedFont.Name = 'Tahoma'
        PrintSettings.FixedFont.Style = []
        PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
        PrintSettings.HeaderFont.Color = clWindowText
        PrintSettings.HeaderFont.Height = -11
        PrintSettings.HeaderFont.Name = 'Tahoma'
        PrintSettings.HeaderFont.Style = []
        PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
        PrintSettings.FooterFont.Color = clWindowText
        PrintSettings.FooterFont.Height = -11
        PrintSettings.FooterFont.Name = 'Tahoma'
        PrintSettings.FooterFont.Style = []
        PrintSettings.PageNumSep = '/'
        RowHeaders.Strings = (
          ''
          'StepsToPix'
          'EncoderToPix'
          'LaserPosition')
        SearchFooter.FindNextCaption = 'Find &next'
        SearchFooter.FindPrevCaption = 'Find &previous'
        SearchFooter.Font.Charset = DEFAULT_CHARSET
        SearchFooter.Font.Color = clWindowText
        SearchFooter.Font.Height = -11
        SearchFooter.Font.Name = 'Tahoma'
        SearchFooter.Font.Style = []
        SearchFooter.HighLightCaption = 'Highlight'
        SearchFooter.HintClose = 'Close'
        SearchFooter.HintFindNext = 'Find next occurrence'
        SearchFooter.HintFindPrev = 'Find previous occurrence'
        SearchFooter.HintHighlight = 'Highlight occurrences'
        SearchFooter.MatchCaseCaption = 'Match case'
        ShowDesignHelper = False
        SortSettings.DefaultFormat = ssAutomatic
        Version = '8.1.3.0'
        ColWidths = (
          85
          85
          85)
        RowHeights = (
          22
          22
          22
          22)
      end
      object sEdit1: TsEdit
        Left = 48
        Top = 144
        Width = 145
        Height = 21
        Color = 3355443
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 15724527
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        Text = 'Objective'
        BoundLabel.Active = True
        BoundLabel.Caption = 'Name'
      end
      object btnObjApply: TsButton
        Left = 186
        Top = 269
        Width = 89
        Height = 36
        Caption = 'Apply'
        TabOrder = 3
      end
    end
    object tsExpBackground: TsTabSheet
      Caption = 'tsExpBackground'
      DesignSize = (
        714
        663)
      object sLabel2: TsLabel
        Left = 40
        Top = 43
        Width = 85
        Height = 39
        Caption = 't = T*exp(kz),  '#13#10#13#10'        z=0,1....n-1'
      end
      object sGroupBox3: TsGroupBox
        Left = 152
        Top = -3
        Width = 217
        Height = 142
        Caption = 'Calculate'
        TabOrder = 0
        object edtExpStepsCountN: TsEdit
          Left = 144
          Top = 16
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
          Text = '1'
          BoundLabel.Active = True
          BoundLabel.Caption = 'Steps count n'
        end
        object edtExpStartExposition: TsEdit
          Left = 144
          Top = 43
          Width = 49
          Height = 21
          Color = 3355443
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 15724527
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          Text = '1'
          BoundLabel.Active = True
          BoundLabel.Caption = 'Start exposition T(0)'
        end
        object edtExpLastExposition: TsEdit
          Left = 144
          Top = 70
          Width = 49
          Height = 21
          Color = 3355443
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 15724527
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          Text = '1'
          BoundLabel.Active = True
          BoundLabel.Caption = 'Last exposition t(n-1)'
        end
        object edtExpK: TsEdit
          Left = 144
          Top = 113
          Width = 49
          Height = 21
          Color = 3355443
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 15724527
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
          Text = '0'
          BoundLabel.Active = True
          BoundLabel.Caption = 'k'
        end
        object btnExpCalculate: TsButton
          Left = 32
          Top = 111
          Width = 75
          Height = 25
          Caption = 'Calculate'
          TabOrder = 4
          OnClick = btnExpCalculateClick
        end
      end
      object sgExpGrid: TAdvStringGrid
        Left = 40
        Top = 145
        Width = 268
        Height = 496
        Cursor = crDefault
        Anchors = [akLeft, akTop, akBottom]
        ColCount = 4
        DefaultRowHeight = 18
        DrawingStyle = gdsClassic
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goEditing]
        ScrollBars = ssBoth
        TabOrder = 1
        HoverRowCells = [hcNormal, hcSelected]
        OnButtonClick = sgExpGridButtonClick
        ActiveCellFont.Charset = DEFAULT_CHARSET
        ActiveCellFont.Color = clWindowText
        ActiveCellFont.Height = -11
        ActiveCellFont.Name = 'Tahoma'
        ActiveCellFont.Style = [fsBold]
        ColumnHeaders.Strings = (
          ''
          't'
          'collected')
        ControlLook.FixedGradientHoverFrom = clGray
        ControlLook.FixedGradientHoverTo = clWhite
        ControlLook.FixedGradientDownFrom = clGray
        ControlLook.FixedGradientDownTo = clSilver
        ControlLook.DropDownHeader.Font.Charset = DEFAULT_CHARSET
        ControlLook.DropDownHeader.Font.Color = clWindowText
        ControlLook.DropDownHeader.Font.Height = -11
        ControlLook.DropDownHeader.Font.Name = 'Tahoma'
        ControlLook.DropDownHeader.Font.Style = []
        ControlLook.DropDownHeader.Visible = True
        ControlLook.DropDownHeader.Buttons = <>
        ControlLook.DropDownFooter.Font.Charset = DEFAULT_CHARSET
        ControlLook.DropDownFooter.Font.Color = clWindowText
        ControlLook.DropDownFooter.Font.Height = -11
        ControlLook.DropDownFooter.Font.Name = 'Tahoma'
        ControlLook.DropDownFooter.Font.Style = []
        ControlLook.DropDownFooter.Visible = True
        ControlLook.DropDownFooter.Buttons = <>
        Filter = <>
        FilterDropDown.Font.Charset = DEFAULT_CHARSET
        FilterDropDown.Font.Color = clWindowText
        FilterDropDown.Font.Height = -11
        FilterDropDown.Font.Name = 'Tahoma'
        FilterDropDown.Font.Style = []
        FilterDropDown.TextChecked = 'Checked'
        FilterDropDown.TextUnChecked = 'Unchecked'
        FilterDropDownClear = '(All)'
        FilterEdit.TypeNames.Strings = (
          'Starts with'
          'Ends with'
          'Contains'
          'Not contains'
          'Equal'
          'Not equal'
          'Larger than'
          'Smaller than'
          'Clear')
        FixedColWidth = 30
        FixedRowHeight = 18
        FixedFont.Charset = DEFAULT_CHARSET
        FixedFont.Color = clWindowText
        FixedFont.Height = -11
        FixedFont.Name = 'Tahoma'
        FixedFont.Style = [fsBold]
        FloatFormat = '%.2f'
        HoverButtons.Buttons = <>
        HoverButtons.Position = hbLeftFromColumnLeft
        HTMLSettings.ImageFolder = 'images'
        HTMLSettings.ImageBaseName = 'img'
        Navigation.AlwaysEdit = True
        PrintSettings.DateFormat = 'dd/mm/yyyy'
        PrintSettings.Font.Charset = DEFAULT_CHARSET
        PrintSettings.Font.Color = clWindowText
        PrintSettings.Font.Height = -11
        PrintSettings.Font.Name = 'Tahoma'
        PrintSettings.Font.Style = []
        PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
        PrintSettings.FixedFont.Color = clWindowText
        PrintSettings.FixedFont.Height = -11
        PrintSettings.FixedFont.Name = 'Tahoma'
        PrintSettings.FixedFont.Style = []
        PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
        PrintSettings.HeaderFont.Color = clWindowText
        PrintSettings.HeaderFont.Height = -11
        PrintSettings.HeaderFont.Name = 'Tahoma'
        PrintSettings.HeaderFont.Style = []
        PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
        PrintSettings.FooterFont.Color = clWindowText
        PrintSettings.FooterFont.Height = -11
        PrintSettings.FooterFont.Name = 'Tahoma'
        PrintSettings.FooterFont.Style = []
        PrintSettings.PageNumSep = '/'
        SearchFooter.FindNextCaption = 'Find &next'
        SearchFooter.FindPrevCaption = 'Find &previous'
        SearchFooter.Font.Charset = DEFAULT_CHARSET
        SearchFooter.Font.Color = clWindowText
        SearchFooter.Font.Height = -11
        SearchFooter.Font.Name = 'Tahoma'
        SearchFooter.Font.Style = []
        SearchFooter.HighLightCaption = 'Highlight'
        SearchFooter.HintClose = 'Close'
        SearchFooter.HintFindNext = 'Find next occurrence'
        SearchFooter.HintFindPrev = 'Find previous occurrence'
        SearchFooter.HintHighlight = 'Highlight occurrences'
        SearchFooter.MatchCaseCaption = 'Match case'
        ShowDesignHelper = False
        SortSettings.DefaultFormat = ssAutomatic
        Version = '8.1.3.0'
        ColWidths = (
          30
          70
          64
          80)
        RowHeights = (
          18
          18)
      end
    end
  end
  object OpenDialog: TsOpenDialog
    Left = 141
    Top = 12
  end
  object sSkinProvider1: TsSkinProvider
    SkinData.SkinSection = 'FORM'
    TitleButtons = <>
    Left = 789
    Top = 404
  end
  object ColorDialog: TsColorDialog
    Left = 128
    Top = 304
  end
end
