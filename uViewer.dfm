object Viewer: TViewer
  Left = 970
  Top = 376
  BorderStyle = bsNone
  Caption = 'Viewer'
  ClientHeight = 849
  ClientWidth = 1413
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object sSplitter1: TsSplitter
    Left = 241
    Top = 0
    Height = 849
    ExplicitLeft = 360
    ExplicitTop = 296
    ExplicitHeight = 100
  end
  object pnlInfo: TsPanel
    Left = 0
    Top = 0
    Width = 241
    Height = 849
    Align = alLeft
    TabOrder = 0
    DesignSize = (
      241
      849)
    object lblFileName: TsLabel
      Left = 8
      Top = 118
      Width = 3
      Height = 13
    end
    object lblDescription: TsLabel
      Left = 8
      Top = 98
      Width = 3
      Height = 13
    end
    object sLabel1: TsLabel
      Left = 8
      Top = 143
      Width = 3
      Height = 13
    end
    object sgInfo: TAdvStringGrid
      Left = 4
      Top = 182
      Width = 185
      Height = 193
      Cursor = crDefault
      DefaultColWidth = 50
      DefaultRowHeight = 18
      DrawingStyle = gdsClassic
      RowCount = 3
      FixedRows = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine]
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 0
      HoverRowCells = [hcNormal, hcSelected]
      ActiveCellFont.Charset = DEFAULT_CHARSET
      ActiveCellFont.Color = clWindowText
      ActiveCellFont.Height = -11
      ActiveCellFont.Name = 'Tahoma'
      ActiveCellFont.Style = [fsBold]
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
      FixedColWidth = 50
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
        'DimCnt'
        'Points'
        'Loaded')
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
      ShowDesignHelper = False
      SortSettings.DefaultFormat = ssAutomatic
      Version = '8.1.3.0'
      WordWrap = False
      ColWidths = (
        50
        50
        50
        50
        50)
      RowHeights = (
        18
        18
        18)
    end
    object ToolBarViewer: TsToolBar
      Left = 1
      Top = 1
      Width = 239
      Height = 65
      ButtonHeight = 21
      ButtonWidth = 76
      Caption = 'ToolBarViewer'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      ShowCaptions = True
      TabOrder = 1
      object btnOpen: TToolButton
        Left = 0
        Top = 0
        Caption = 'Open'
        ImageIndex = 0
        OnClick = btnOpenClick
      end
      object btnDecompose: TToolButton
        Left = 76
        Top = 0
        Caption = 'Decomposition'
        ImageIndex = 1
        Wrap = True
        OnClick = btnDecomposeClick
      end
      object btnSaveDecomposition: TToolButton
        Left = 0
        Top = 21
        Caption = 'SaveD'
        ImageIndex = 2
        OnClick = btnSaveDecompositionClick
      end
      object btnSaveRaw: TToolButton
        Left = 76
        Top = 21
        AutoSize = True
        Caption = 'SaveRaw'
        ImageIndex = 3
        OnClick = btnSaveRawClick
      end
      object btnMath: TToolButton
        Left = 132
        Top = 21
        Caption = 'Math'
        ImageIndex = 6
        Wrap = True
        OnClick = btnMathClick
      end
      object btnSmooth: TToolButton
        Left = 0
        Top = 42
        Caption = 'Smooth'
        ImageIndex = 4
        OnClick = btnSmoothClick
      end
      object btnRemoveBaseline: TToolButton
        Left = 76
        Top = 42
        Caption = 'Wheel'
        ImageIndex = 5
        OnClick = btnRemoveBaselineClick
      end
    end
    object sgLayout: TAdvStringGrid
      Left = 8
      Top = 449
      Width = 69
      Height = 133
      Cursor = crDefault
      ColCount = 4
      DefaultColWidth = 16
      DefaultRowHeight = 16
      DrawingStyle = gdsClassic
      Enabled = False
      FixedCols = 0
      RowCount = 8
      FixedRows = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ScrollBars = ssNone
      TabOrder = 2
      OnMouseUp = sgLayoutMouseUp
      HoverRowCells = [hcNormal, hcSelected]
      ActiveCellFont.Charset = DEFAULT_CHARSET
      ActiveCellFont.Color = clWindowText
      ActiveCellFont.Height = -11
      ActiveCellFont.Name = 'Tahoma'
      ActiveCellFont.Style = [fsBold]
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
      FixedColWidth = 16
      FixedRowHeight = 16
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
      WordWrap = False
      ColWidths = (
        16
        16
        16
        16)
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
    object btnChangeLayout: TsButton
      Left = 5
      Top = 426
      Width = 75
      Height = 18
      Caption = 'ChangeLayout'
      TabOrder = 3
      OnClick = btnChangeLayoutClick
    end
    object btnHide: TsButton
      Left = 7
      Top = 381
      Width = 41
      Height = 42
      Caption = '<<'
      TabOrder = 4
      OnClick = btnHideClick
    end
    object trbOpenProgress: TsProgressBar
      Left = 7
      Top = 72
      Width = 181
      Height = 11
      TabOrder = 5
    end
    object pnlCompare: TsPanel
      Left = 3
      Top = 637
      Width = 232
      Height = 255
      Anchors = [akLeft, akTop, akRight]
      Caption = 'pnlCompare'
      ShowCaption = False
      TabOrder = 6
    end
  end
  object sScrollBox1: TsScrollBox
    Left = 247
    Top = 0
    Width = 1166
    Height = 849
    HorzScrollBar.Tracking = True
    VertScrollBar.Tracking = True
    Align = alClient
    TabOrder = 1
    object pnlViewPole: TsPanel
      Left = 0
      Top = 0
      Width = 1162
      Height = 845
      Align = alClient
      TabOrder = 0
    end
  end
  object OpenDialog: TsOpenDialog
    Filter = '*.scn2|*.scn2'
    Left = 128
    Top = 296
  end
  object SaveDialog: TsSaveDialog
    Filter = '*.scn2|*.scn2'
    Left = 128
    Top = 360
  end
end
