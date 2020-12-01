object FormMathSpectra: TFormMathSpectra
  Left = 0
  Top = 0
  Caption = 'MathSpectra'
  ClientHeight = 1387
  ClientWidth = 1287
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    1287
    1387)
  PixelsPerInch = 96
  TextHeight = 13
  object sPageControl1: TsPageControl
    Left = 0
    Top = 0
    Width = 1273
    Height = 1369
    ActivePage = sTabSheet1
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object sTabSheet1: TsTabSheet
      Caption = 'Addition'
      DesignSize = (
        1265
        1341)
      object sFilenameEdit1: TsFilenameEdit
        Left = 104
        Top = 2
        Width = 601
        Height = 21
        MaxLength = 255
        TabOrder = 0
        Text = ''
        OnChange = sFilenameEdit1Change
        CheckOnExit = True
      end
      object sFilenameEdit2: TsFilenameEdit
        Left = 104
        Top = 29
        Width = 601
        Height = 21
        MaxLength = 255
        TabOrder = 1
        Text = ''
        OnChange = sFilenameEdit2Change
        CheckOnExit = True
      end
      object pnlScaler: TPanel
        Left = 3
        Top = 113
        Width = 62
        Height = 438
        Caption = 'pnlScaler'
        TabOrder = 2
      end
      object pnlSource: TPanel
        Left = 71
        Top = 86
        Width = 1178
        Height = 515
        Anchors = [akLeft, akTop, akRight]
        BorderStyle = bsSingle
        Caption = 'pnlSource'
        TabOrder = 3
      end
      object pnlRes: TPanel
        Left = 71
        Top = 624
        Width = 1178
        Height = 714
        Anchors = [akLeft, akTop, akRight, akBottom]
        BorderStyle = bsSingle
        Caption = 'pnlRes'
        TabOrder = 4
      end
      object Button1: TButton
        Left = 711
        Top = 0
        Width = 75
        Height = 25
        Caption = 'Button1'
        TabOrder = 5
      end
      object edtWLshift: TsSpinEdit
        Left = 3
        Top = 86
        Width = 54
        Height = 21
        TabOrder = 6
        OnChange = sFilenameEdit2Change
        MaxValue = 0
        MinValue = 0
      end
      object pnlScaler2: TPanel
        Left = 3
        Top = 593
        Width = 62
        Height = 438
        Caption = 'pnlScaler2'
        TabOrder = 7
      end
      object sFilenameEdit3: TsFilenameEdit
        Left = 104
        Top = 56
        Width = 601
        Height = 21
        MaxLength = 255
        TabOrder = 8
        Text = ''
        OnChange = sFilenameEdit3Change
        CheckOnExit = True
      end
      object edtWLshift2: TsSpinEdit
        Left = 3
        Top = 566
        Width = 54
        Height = 21
        TabOrder = 9
        OnChange = sFilenameEdit3Change
        MaxValue = 0
        MinValue = 0
      end
    end
  end
end
