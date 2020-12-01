object FormCCD: TFormCCD
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'FormCCD'
  ClientHeight = 493
  ClientWidth = 805
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object sToolBar1: TsToolBar
    Left = 0
    Top = 0
    Width = 805
    Height = 21
    AutoSize = True
    ButtonHeight = 21
    Caption = 'sToolBar1'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 0
    DesignSize = (
      805
      21)
    object ComboBox1: TComboBox
      Left = 0
      Top = 0
      Width = 116
      Height = 21
      Style = csDropDownList
      Anchors = [akTop, akRight]
      TabOrder = 0
    end
    object btnPlay: TSpeedButton
      Left = 116
      Top = 0
      Width = 84
      Height = 21
      AllowAllUp = True
      Anchors = [akTop, akRight]
      GroupIndex = 1
      Caption = 'Play'
      OnClick = btnPlayClick
    end
    object btnSettings: TsSpeedButton
      Left = 200
      Top = 0
      Width = 81
      Height = 21
      AllowAllUp = True
      Anchors = [akTop, akRight]
      Caption = 'Settings'
      OnClick = btnSettingsClick
    end
    object btnVideoInputSource: TsSpeedButton
      Left = 281
      Top = 0
      Width = 81
      Height = 21
      AllowAllUp = True
      Anchors = [akTop, akRight]
      Caption = 'VideoInputSource'
      OnClick = btnVideoInputSourceClick
    end
    object btnProperty: TsSpeedButton
      Left = 362
      Top = 0
      Width = 81
      Height = 21
      AllowAllUp = True
      Anchors = [akTop, akRight]
      Caption = 'Property'
      OnClick = btnPropertyClick
    end
    object ToolButton1: TToolButton
      Left = 443
      Top = 0
      Width = 50
      Caption = 'ToolButton1'
      Style = tbsSeparator
    end
    object sDecimalSpinEdit1: TsDecimalSpinEdit
      Left = 493
      Top = 0
      Width = 94
      Height = 21
      Color = 3355443
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 15724527
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = '1.10'
      OnKeyDown = sDecimalSpinEdit1KeyDown
      Increment = 1.000000000000000000
      Value = 1.100000000000000000
    end
  end
  object sPanel1: TsPanel
    Left = 0
    Top = 21
    Width = 805
    Height = 472
    Align = alClient
    TabOrder = 1
    object sSplitter1: TsSplitter
      Left = 75
      Top = 1
      Height = 392
      ExplicitLeft = 408
      ExplicitTop = 272
      ExplicitHeight = 100
    end
    object sSplitter2: TsSplitter
      Left = 1
      Top = 393
      Width = 803
      Height = 6
      Cursor = crVSplit
      Align = alBottom
      ExplicitLeft = 155
      ExplicitTop = 1
      ExplicitWidth = 383
    end
    object sPanel2: TsPanel
      Left = 1
      Top = 1
      Width = 74
      Height = 392
      Align = alLeft
      Constraints.MinHeight = 30
      Constraints.MinWidth = 30
      TabOrder = 0
      OnResize = sPanel2Resize
      object ImageEnView3: TImageEnView
        Left = 1
        Top = 1
        Width = 44
        Height = 390
        Background = clBtnFace
        ParentCtl3D = False
        ScrollBars = ssNone
        EnableInteractionHints = True
        Align = alClient
        TabOrder = 0
      end
      object VertRuler: TRulerBox
        Left = 45
        Top = 1
        Width = 28
        Height = 390
        GripBaseDim = 5
        DotPerUnit = 1.000000000000000000
        Frequency = 10.000000000000000000
        LabelFreq = 40.000000000000000000
        RulerDir = rdVertical
        MaxGripHeight = 15
        Align = alRight
      end
    end
    object sPanel3: TsPanel
      Left = 1
      Top = 399
      Width = 803
      Height = 72
      Align = alBottom
      Constraints.MinHeight = 30
      Constraints.MinWidth = 30
      TabOrder = 1
      object sPanel5: TsPanel
        Left = 1
        Top = 1
        Width = 79
        Height = 70
        Align = alLeft
        TabOrder = 0
        object Label1: TLabel
          Left = 8
          Top = 16
          Width = 20
          Height = 26
          Caption = 'X=0'#13#10'Y=0'
        end
      end
      object sPanel6: TsPanel
        Left = 80
        Top = 1
        Width = 722
        Height = 70
        Align = alClient
        TabOrder = 1
        object ImageEnView2: TImageEnView
          Left = 1
          Top = 33
          Width = 720
          Height = 36
          Background = clBtnFace
          ParentCtl3D = False
          ScrollBars = ssNone
          EnableInteractionHints = True
          Align = alClient
          TabOrder = 0
        end
        object HorizRuler: TRulerBox
          Left = 1
          Top = 1
          Width = 720
          Height = 32
          GripBaseDim = 5
          DotPerUnit = 1.000000000000000000
          Frequency = 10.000000000000000000
          LabelFreq = 40.000000000000000000
          MaxGripHeight = 15
          Align = alTop
        end
      end
    end
    object sPanel4: TsPanel
      Left = 81
      Top = 1
      Width = 723
      Height = 392
      Align = alClient
      TabOrder = 2
      object ImageEnView1: TImageEnView
        Left = 1
        Top = 1
        Width = 721
        Height = 390
        Background = cl3DDkShadow
        ParentCtl3D = False
        OnResize = ImageEnView1Resize
        LegacyBitmap = False
        OnViewChange = ImageEnView1ViewChange
        MouseInteract = [miScroll]
        AutoFit = True
        OnMouseWheel = ImageEnView1MouseWheel
        OnDShowNewFrame = ImageEnView1DShowNewFrame
        EnableInteractionHints = True
        Align = alClient
        TabOrder = 0
        OnMouseDown = ImageEnView1MouseDown
        OnMouseMove = ImageEnView1MouseMove
        OnMouseUp = ImageEnView1MouseUp
      end
    end
  end
end
