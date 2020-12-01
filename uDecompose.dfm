object formDecompose: TformDecompose
  Left = 0
  Top = 0
  Caption = 'Decomposition library'
  ClientHeight = 861
  ClientWidth = 1508
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object sSplitter1: TsSplitter
    Left = 0
    Top = 28
    Width = 1508
    Height = 6
    Cursor = crVSplit
    Align = alTop
    ExplicitLeft = 8
    ExplicitTop = 705
    ExplicitWidth = 1625
  end
  object pnlHGraph: TsPanel
    Left = 0
    Top = 34
    Width = 1508
    Height = 467
    Align = alClient
    Caption = 'pnlHGraph'
    ShowCaption = False
    TabOrder = 0
  end
  object pnlBrowse: TsPanel
    Left = 0
    Top = 501
    Width = 1508
    Height = 360
    Align = alBottom
    Caption = 'pnlBrowse'
    ShowCaption = False
    TabOrder = 1
    object sSplitter2: TsSplitter
      Left = 265
      Top = 1
      Height = 339
      ExplicitLeft = 520
      ExplicitTop = 112
      ExplicitHeight = 100
    end
    object sShellTreeView1: TsShellTreeView
      Left = 1
      Top = 1
      Width = 264
      Height = 339
      Align = alLeft
      Color = 3355443
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 15724527
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Indent = 19
      ParentFont = False
      TabOrder = 0
      ObjectTypes = [otFolders]
      Root = 'rfDesktop'
      ShellListView = sShellListView1
      UseShellImages = True
      AutoRefresh = False
      ShowExt = seSystem
    end
    object sStatusBar1: TsStatusBar
      Left = 1
      Top = 340
      Width = 1506
      Height = 19
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
    object sPanel1: TsPanel
      Left = 271
      Top = 1
      Width = 1404
      Height = 325
      Caption = 'sPanel1'
      ShowCaption = False
      TabOrder = 2
      DesignSize = (
        1404
        325)
      object sShellListView1: TsShellListView
        Left = 6
        Top = 5
        Width = 435
        Height = 324
        Color = 3355443
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 15724527
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        OnKeyUp = sShellListView1KeyUp
        Anchors = [akLeft, akTop, akBottom]
        OnClick = sShellListView1Click
        ReadOnly = False
        GridLines = True
        Sorted = True
        HideSelection = False
        TabOrder = 0
        ViewStyle = vsReport
        AutoRefresh = True
        ObjectTypes = [otNonFolders]
        Root = 'rfDesktop'
        ShellTreeView = sShellTreeView1
        ShowExt = seShow
      end
      object sgAnalysw: TAdvStringGrid
        Left = 518
        Top = 5
        Width = 625
        Height = 236
        Cursor = crDefault
        ColCount = 3
        DrawingStyle = gdsClassic
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goRowSelect]
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 1
        OnKeyUp = sgAnalyswKeyUp
        OnMouseUp = sgAnalyswMouseUp
        HoverRowCells = [hcNormal, hcSelected]
        OnGetEditorType = sgAnalyswGetEditorType
        OnCheckBoxChange = sgAnalyswCheckBoxChange
        ActiveCellFont.Charset = DEFAULT_CHARSET
        ActiveCellFont.Color = clWindowText
        ActiveCellFont.Height = -11
        ActiveCellFont.Name = 'Tahoma'
        ActiveCellFont.Style = [fsBold]
        ColumnHeaders.Strings = (
          ''
          'Use'
          'Name')
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
          40
          40
          531)
        RowHeights = (
          22
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
      object btnAddToAnalyse: TsButton
        Left = 447
        Top = 24
        Width = 65
        Height = 25
        Caption = '>>'
        TabOrder = 2
        OnClick = btnAddToAnalyseClick
      end
      object btnRemoveFromAnalyse: TsButton
        Left = 447
        Top = 55
        Width = 65
        Height = 25
        Caption = '<<'
        TabOrder = 3
        OnClick = btnRemoveFromAnalyseClick
      end
      object btnDecompose: TsButton
        Left = 1149
        Top = 21
        Width = 73
        Height = 33
        Caption = 'Decompose'
        TabOrder = 4
        OnClick = btnDecomposeClick
      end
      object cbSmoothedDecomp: TsCheckBox
        Left = 1149
        Top = 60
        Width = 76
        Height = 16
        Caption = 'Smoothed'
        TabOrder = 5
      end
      object cbRemoveAir: TsCheckBox
        Left = 1149
        Top = 82
        Width = 80
        Height = 16
        Caption = 'RemoveAir'
        TabOrder = 6
      end
    end
  end
  object sToolBar1: TsToolBar
    Left = 0
    Top = 0
    Width = 1508
    Height = 28
    ButtonHeight = 21
    ButtonWidth = 8
    Caption = 'sToolBar1'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    ShowCaptions = True
    TabOrder = 2
    object edtGraphName: TsEdit
      Left = 0
      Top = 0
      Width = 271
      Height = 21
      Color = 3355443
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 15724527
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object btnSmooth: TsButton
      Left = 271
      Top = 0
      Width = 75
      Height = 21
      Caption = 'Smooth9'
      TabOrder = 1
      OnClick = btnSmoothClick
    end
    object btnSmoothCoarse: TsButton
      Left = 346
      Top = 0
      Width = 69
      Height = 21
      Caption = 'Smooth25'
      TabOrder = 2
      OnClick = btnSmoothCoarseClick
    end
    object btnWheel: TsButton
      Left = 415
      Top = 0
      Width = 75
      Height = 21
      Caption = 'Wheel'
      TabOrder = 3
      OnClick = btnWheelClick
    end
  end
  object sSkinProvider1: TsSkinProvider
    AddedTitle.Font.Charset = DEFAULT_CHARSET
    AddedTitle.Font.Color = clNone
    AddedTitle.Font.Height = -11
    AddedTitle.Font.Name = 'Tahoma'
    AddedTitle.Font.Style = []
    SkinData.SkinSection = 'FORM'
    TitleButtons = <>
    Left = 1104
    Top = 232
  end
end
