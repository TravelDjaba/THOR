object FormControllerSettings: TFormControllerSettings
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'ControllerSettings'
  ClientHeight = 442
  ClientWidth = 674
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
  object sGroupBox4: TsGroupBox
    Left = 431
    Top = 8
    Width = 225
    Height = 225
    Caption = 'FilterWheel'
    TabOrder = 0
    object sgFilters: TStringGrid
      Left = 11
      Top = 26
      Width = 207
      Height = 192
      ColCount = 3
      DefaultColWidth = 50
      DefaultRowHeight = 20
      RowCount = 9
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowMoving, goEditing]
      ScrollBars = ssNone
      TabOrder = 0
      OnRowMoved = sgFiltersRowMoved
      OnSetEditText = sgFiltersSetEditText
      ColWidths = (
        50
        92
        59)
      RowHeights = (
        20
        20
        20
        20
        20
        20
        20
        20
        20)
    end
  end
  object gbSlit: TsGroupBox
    Left = 432
    Top = 240
    Width = 225
    Height = 129
    Caption = 'Slit'
    TabOrder = 1
    object edtSlitProportion: TsDecimalSpinEdit
      Left = 14
      Top = 30
      Width = 97
      Height = 21
      TabOrder = 0
      OnChange = edtSlitProportionChange
      BoundLabel.Active = True
      BoundLabel.Caption = 'Proportion'
      BoundLabel.Layout = sclTopLeft
      Increment = 1.000000000000000000
      DecimalPlaces = 3
    end
  end
  object sGroupBox3: TsGroupBox
    Left = 0
    Top = 8
    Width = 425
    Height = 433
    Caption = 'Steppers'
    TabOrder = 2
    object btnError: TsSpeedButton
      Left = 265
      Top = 15
      Width = 73
      Height = 22
      Caption = 'Error?'
      OnClick = btnErrorClick
    end
    object btnReset: TsSpeedButton
      Left = 342
      Top = 15
      Width = 73
      Height = 22
      Caption = 'Reset Driver'
      OnClick = btnResetClick
    end
    object btnSend: TsSpeedButton
      Left = 347
      Top = 407
      Width = 57
      Height = 21
      Caption = 'Send'
      OnClick = btnSendClick
    end
    object cboxStepper: TsComboBox
      Left = 104
      Top = 16
      Width = 89
      Height = 21
      BoundLabel.Caption = 'Current'
      ItemIndex = -1
      TabOrder = 0
      Text = 'MotX'
      OnChange = cboxStepperChange
      Items.Strings = (
        'MotX'
        'MotY'
        'MotZ'
        'BackFocus'
        'FilterWheel'
        'Slit'
        'Colimator')
    end
    object gb: TsGroupBox
      Left = 0
      Top = 37
      Width = 407
      Height = 364
      Caption = 'Parameters'
      TabOrder = 1
      object btnStop: TsSpeedButton
        Left = 179
        Top = 251
        Width = 74
        Height = 33
        Caption = 'Stop'
        OnClick = btnStopClick
      end
      object btnCal1: TsSpeedButton
        Left = 16
        Top = 259
        Width = 65
        Height = 25
        Caption = 'Cal  |<-'
        OnClick = btnCal1Click
      end
      object btnCal2: TsSpeedButton
        Left = 96
        Top = 259
        Width = 65
        Height = 25
        Caption = 'Cal  ->|'
        OnClick = btnCal2Click
      end
      object btnES: TsSpeedButton
        Left = 356
        Top = 259
        Width = 42
        Height = 25
        Caption = 'ES?'
        OnClick = btnESClick
      end
      object btnSetCurrent: TsSpeedButton
        Left = 156
        Top = 51
        Width = 23
        Height = 22
        Caption = 'S'
        OnClick = btnSetCurrentClick
      end
      object btnSetSpeed: TsSpeedButton
        Left = 301
        Top = 15
        Width = 23
        Height = 22
        Caption = 'S'
        OnClick = btnSetSpeedClick
      end
      object btnSetMaxSpeed: TsSpeedButton
        Left = 301
        Top = 51
        Width = 23
        Height = 22
        Caption = 'S'
        OnClick = btnSetMaxSpeedClick
      end
      object btnSetAcceleration: TsSpeedButton
        Left = 301
        Top = 87
        Width = 23
        Height = 22
        Caption = 'S'
        OnClick = btnSetAccelerationClick
      end
      object btnUpdate: TsSpeedButton
        Left = 355
        Top = 15
        Width = 49
        Height = 22
        Caption = 'Update'
        OnClick = btnUpdateClick
      end
      object cboxStepMode: TsComboBox
        Left = 88
        Top = 16
        Width = 65
        Height = 21
        BoundLabel.Active = True
        BoundLabel.Caption = 'Microstep mode'
        ItemIndex = -1
        TabOrder = 0
        OnChange = cboxStepModeChange
        Items.Strings = (
          '1'
          '1/2'
          '1/4'
          '1/8'
          '1/16'
          '1/32')
      end
      object edtCurrent: TsEdit
        Left = 88
        Top = 52
        Width = 65
        Height = 21
        TabOrder = 1
        Text = '---'
        OnExit = edtCurrentExit
        OnKeyDown = edtCurrentKeyDown
        BoundLabel.Active = True
        BoundLabel.Caption = 'Current'#13#10'1-2500 mA'
      end
      object cboxEndStopType: TsComboBox
        Left = 88
        Top = 88
        Width = 65
        Height = 21
        BoundLabel.Active = True
        BoundLabel.Caption = 'EndStop type'
        ItemIndex = -1
        TabOrder = 2
        Text = '---'
        OnChange = cboxEndStopTypeChange
        Items.Strings = (
          'Switch'
          'Optical')
      end
      object edtSpeed: TsEdit
        Left = 246
        Top = 16
        Width = 53
        Height = 21
        TabOrder = 3
        Text = '---'
        OnExit = edtSpeedExit
        OnKeyDown = edtSpeedKeyDown
        BoundLabel.Active = True
        BoundLabel.Caption = 'Speed'#13#10'1-10000'
      end
      object edtMaxSpeed: TsEdit
        Left = 246
        Top = 52
        Width = 53
        Height = 21
        TabOrder = 4
        Text = '---'
        OnExit = edtMaxSpeedExit
        OnKeyDown = edtMaxSpeedKeyDown
        BoundLabel.Active = True
        BoundLabel.Caption = 'Max Speed'#13#10'1-10000'
      end
      object edtAcceleration: TsEdit
        Left = 246
        Top = 88
        Width = 53
        Height = 21
        TabOrder = 5
        Text = '---'
        OnExit = edtAccelerationExit
        OnKeyDown = edtAccelerationKeyDown
        BoundLabel.Active = True
        BoundLabel.Caption = 'Acceleration'#13#10'1-20000'
      end
      object sGroupBox1: TsGroupBox
        Left = 3
        Top = 131
        Width = 196
        Height = 114
        Caption = 'Stepper'
        TabOrder = 6
        object btnGetPos: TsSpeedButton
          Left = 143
          Top = 28
          Width = 23
          Height = 22
          Caption = '?'
          OnClick = btnGetPosClick
        end
        object btnStepperRigth: TsSpeedButton
          Left = 125
          Top = 56
          Width = 33
          Height = 25
          Caption = '>>'
          OnClick = btnStepperRigthClick
        end
        object btnStepperLeft: TsSpeedButton
          Left = 17
          Top = 56
          Width = 33
          Height = 25
          Caption = '<<'
          OnClick = btnStepperLeftClick
        end
        object btnMovAbs: TsSpeedButton
          Left = 141
          Top = 86
          Width = 52
          Height = 22
          Caption = 'GoTo'
          OnClick = btnMovAbsClick
        end
        object btnSetPosition: TsSpeedButton
          Left = 114
          Top = 28
          Width = 23
          Height = 22
          Caption = 'S'
          OnClick = btnSetPositionClick
        end
        object edtPosition: TsEdit
          Left = 37
          Top = 28
          Width = 71
          Height = 21
          TabOrder = 0
          Text = '---'
          OnExit = edtPositionExit
          OnKeyDown = edtPositionKeyDown
          BoundLabel.Active = True
          BoundLabel.Caption = 'Position'
          BoundLabel.Layout = sclTopCenter
        end
        object cboxStep: TsComboBox
          Left = 56
          Top = 58
          Width = 63
          Height = 21
          ItemIndex = 0
          TabOrder = 1
          Text = '1'
          Items.Strings = (
            '1'
            '2'
            '5'
            '10'
            '25'
            '50'
            '100'
            '250'
            '500'
            '1000'
            '5000')
        end
        object edtMovAbs: TsEdit
          Left = 88
          Top = 87
          Width = 49
          Height = 21
          TabOrder = 2
          Text = '1000'
          OnExit = edtMovAbsExit
          OnKeyDown = edtMovAbsKeyDown
          BoundLabel.Active = True
          BoundLabel.Caption = 'GoTo absolute'
        end
      end
      object sGroupBox2: TsGroupBox
        Left = 205
        Top = 131
        Width = 199
        Height = 114
        Caption = 'Encoder'
        TabOrder = 7
        object btnEncGetPos: TsSpeedButton
          Left = 153
          Top = 28
          Width = 23
          Height = 22
          Caption = '?'
          OnClick = btnEncGetPosClick
        end
        object btnEncRigth: TsSpeedButton
          Left = 134
          Top = 56
          Width = 33
          Height = 25
          Caption = '>>'
        end
        object btnEncLeft: TsSpeedButton
          Left = 15
          Top = 56
          Width = 33
          Height = 25
          Caption = '<<'
        end
        object btnEncMovAbs: TsSpeedButton
          Left = 132
          Top = 86
          Width = 50
          Height = 22
          Caption = 'GoTo'
          Visible = False
        end
        object btnEncSetPosition: TsSpeedButton
          Left = 126
          Top = 28
          Width = 23
          Height = 22
          Caption = 'S'
          OnClick = btnEncSetPositionClick
        end
        object edtEncPosition: TsEdit
          Left = 39
          Top = 28
          Width = 81
          Height = 21
          TabOrder = 0
          Text = '---'
          OnExit = edtEncPositionExit
          OnKeyDown = edtEncPositionKeyDown
          BoundLabel.Active = True
          BoundLabel.Caption = 'Position'
          BoundLabel.Layout = sclTopCenter
        end
        object cboxEncStep: TsComboBox
          Left = 54
          Top = 58
          Width = 66
          Height = 21
          ItemIndex = 0
          TabOrder = 1
          Text = '1'
          Items.Strings = (
            '1'
            '2'
            '5'
            '10'
            '25'
            '50'
            '100'
            '250'
            '500'
            '1000'
            '5000')
        end
        object edtEncMovAbs: TsEdit
          Left = 79
          Top = 87
          Width = 49
          Height = 21
          TabOrder = 2
          Text = '1000'
          OnExit = edtEncMovAbsExit
          OnKeyDown = edtEncMovAbsKeyDown
          BoundLabel.Active = True
          BoundLabel.Caption = 'GoTo absolute'
        end
      end
      object pnlES1: TsPanel
        Left = 268
        Top = 259
        Width = 31
        Height = 25
        SkinData.CustomColor = True
        SkinData.ColorTone = clMenuText
        Caption = 'ES1'
        Color = clMenuText
        ParentBackground = False
        TabOrder = 8
      end
      object pnlES2: TsPanel
        Left = 306
        Top = 259
        Width = 31
        Height = 25
        SkinData.CustomColor = True
        SkinData.ColorTone = clMenuText
        Caption = 'ES2'
        Color = clMenuText
        ParentBackground = False
        TabOrder = 9
      end
      object pnlXYZaddSettings: TsPanel
        Left = 7
        Top = 290
        Width = 393
        Height = 63
        TabOrder = 10
        object btnLim1Set: TsSpeedButton
          Left = 106
          Top = 11
          Width = 23
          Height = 22
          Caption = 'S'
          OnClick = btnLim1SetClick
        end
        object btnLim1Get: TsSpeedButton
          Left = 135
          Top = 11
          Width = 23
          Height = 22
          Caption = '?'
          OnClick = btnLim1GetClick
        end
        object btnLim2Set: TsSpeedButton
          Left = 106
          Top = 39
          Width = 23
          Height = 22
          Caption = 'S'
          OnClick = btnLim2SetClick
        end
        object btnLim2Get: TsSpeedButton
          Left = 135
          Top = 39
          Width = 23
          Height = 22
          Caption = '?'
          OnClick = btnLim2GetClick
        end
        object edtLimit1: TsEdit
          Left = 43
          Top = 12
          Width = 58
          Height = 21
          TabOrder = 0
          Text = '---'
          OnExit = edtLimit1Exit
          OnKeyDown = edtLimit1KeyDown
          BoundLabel.Active = True
          BoundLabel.Caption = 'Limit1'
        end
        object edtLimit2: TsEdit
          Left = 43
          Top = 39
          Width = 58
          Height = 21
          TabOrder = 1
          Text = '---'
          OnExit = edtLimit2Exit
          OnKeyDown = edtLimit2KeyDown
          BoundLabel.Active = True
          BoundLabel.Caption = 'Limit2'
        end
        object cbReverse: TsCheckBox
          Left = 190
          Top = 13
          Width = 66
          Height = 15
          Caption = 'Reverse'
          TabOrder = 2
          OnClick = cbReverseClick
        end
        object cbCanUseLastPos: TsCheckBox
          Left = 271
          Top = 13
          Width = 120
          Height = 15
          Caption = 'CanUseLastPosition'
          Enabled = False
          TabOrder = 3
        end
      end
    end
    object edtCmd: TsEdit
      Left = 6
      Top = 407
      Width = 335
      Height = 21
      TabOrder = 2
      Text = 'M0 POS?'
      OnKeyDown = edtCmdKeyDown
    end
  end
  object btnReconnect: TsButton
    Left = 431
    Top = 413
    Width = 58
    Height = 25
    Caption = 'Reconnect'
    TabOrder = 3
    OnClick = btnReconnectClick
  end
  object TimerES: TTimer
    Enabled = False
    Interval = 500
    Left = 192
    Top = 176
  end
end
