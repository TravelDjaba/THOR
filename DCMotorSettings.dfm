object FormDCMotorSettings: TFormDCMotorSettings
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'DCMotor Settings'
  ClientHeight = 351
  ClientWidth = 548
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnHide = FormHide
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pcSettings: TsPageControl
    Left = 0
    Top = 0
    Width = 548
    Height = 351
    ActivePage = tsProfileVelocity
    Align = alClient
    TabOrder = 0
    OnChange = pcSettingsChange
    object tsHoming: TsTabSheet
      Caption = 'Homing Mode'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 543
      ExplicitHeight = 420
      object gbHomeProfile: TsGroupBox
        Left = 18
        Top = 52
        Width = 249
        Height = 198
        Caption = 'Home Profile'
        TabOrder = 0
        object sLabel1: TsLabel
          Left = 212
          Top = 54
          Width = 11
          Height = 13
          Caption = 'qc'
        end
        object sLabel2: TsLabel
          Left = 212
          Top = 77
          Width = 18
          Height = 13
          Caption = 'rpm'
        end
        object sLabel3: TsLabel
          Left = 212
          Top = 100
          Width = 18
          Height = 13
          Caption = 'rpm'
        end
        object sLabel4: TsLabel
          Left = 212
          Top = 124
          Width = 27
          Height = 13
          Caption = 'rpm/s'
        end
        object sLabel5: TsLabel
          Left = 212
          Top = 146
          Width = 15
          Height = 13
          Caption = 'mA'
        end
        object sLabel6: TsLabel
          Left = 212
          Top = 169
          Width = 11
          Height = 13
          Caption = 'qc'
        end
        object cboxHomingMode: TsComboBox
          Left = 7
          Top = 24
          Width = 232
          Height = 21
          Alignment = taLeftJustify
          VerticalAlignment = taAlignTop
          ItemIndex = 0
          TabOrder = 0
          Text = 'ACTUAL_POSITION'
          Items.Strings = (
            'ACTUAL_POSITION'
            'INDEX_POSITIVE_SPEED'
            'INDEX_NEGATIVE_SPEED'
            'HOME_SWITCH_NEGATIVE_SPEED'
            'HOME_SWITCH_POSITIVE_SPEED'
            'POSITIVE_LIMIT_SWITCH'
            'NEGATIVE_LIMIT_SWITCH'
            'HOME_SWITCH_NEGATIVE_SPEED_AND_INDEX'
            'HOME_SWITCH_POSITIVE_SPEED_AND_INDEX'
            'POSITIVE_LIMIT_SWITCH_AND_INDEX'
            'NEGATIVE_LIMIT_SWITCH_AND_INDEX'
            'CURRENT_THRESHOLD_POSITIVE_SPEED_AND_INDEX'
            'CURRENT_THRESHOLD_NEGATIVE_SPEED_AND_INDEX'
            'CURRENT_THRESHOLD_POSITIVE_SPEED'
            'CURRENT_THRESHOLD_NEGATIVE_SPEED')
        end
        object edtHomeOffset: TsEdit
          Left = 127
          Top = 51
          Width = 79
          Height = 20
          TabOrder = 1
          Text = '0'
          BoundLabel.Active = True
          BoundLabel.Caption = 'Home Offset'
        end
        object edtSpeedforSwitchSearch: TsEdit
          Left = 127
          Top = 74
          Width = 79
          Height = 20
          TabOrder = 2
          Text = '0'
          BoundLabel.Active = True
          BoundLabel.Caption = 'Speed for Switch Search'
        end
        object edtSpeedforIndexSearch: TsEdit
          Left = 127
          Top = 97
          Width = 79
          Height = 20
          TabOrder = 3
          Text = '0'
          BoundLabel.Active = True
          BoundLabel.Caption = 'Speed for Index Search'
        end
        object edtAcceleration: TsEdit
          Left = 127
          Top = 121
          Width = 79
          Height = 20
          TabOrder = 4
          Text = '0'
          BoundLabel.Active = True
          BoundLabel.Caption = 'Acceleration'
        end
        object edtCurrentTreshold: TsEdit
          Left = 127
          Top = 143
          Width = 79
          Height = 20
          TabOrder = 5
          Text = '0'
          BoundLabel.Active = True
          BoundLabel.Caption = 'Current Treshold'
        end
        object edtHomePosition: TsEdit
          Left = 127
          Top = 166
          Width = 79
          Height = 20
          TabOrder = 6
          Text = '0'
          BoundLabel.Active = True
          BoundLabel.Caption = 'Home Position'
        end
      end
      object gbParameters: TsGroupBox
        Left = 287
        Top = 52
        Width = 242
        Height = 102
        Caption = 'Parameters'
        TabOrder = 1
        object sLabel7: TsLabel
          Left = 212
          Top = 73
          Width = 18
          Height = 13
          Caption = 'rpm'
        end
        object sLabel8: TsLabel
          Left = 212
          Top = 27
          Width = 18
          Height = 13
          Caption = 'rpm'
        end
        object sLabel9: TsLabel
          Left = 212
          Top = 50
          Width = 11
          Height = 13
          Caption = 'qc'
        end
        object edtMaxProfileVelocity: TsEdit
          Left = 127
          Top = 24
          Width = 79
          Height = 20
          TabOrder = 0
          Text = '0'
          BoundLabel.Active = True
          BoundLabel.Caption = 'Max Profile Velocity'
        end
        object edtMaxFollowingError: TsEdit
          Left = 127
          Top = 47
          Width = 79
          Height = 20
          TabOrder = 1
          Text = '0'
          BoundLabel.Active = True
          BoundLabel.Caption = 'Max Following Error'
        end
        object edtQuickStopDeceleration: TsEdit
          Left = 127
          Top = 70
          Width = 79
          Height = 20
          TabOrder = 2
          Text = '0'
          BoundLabel.Active = True
          BoundLabel.Caption = 'Quick Stop Deceleration'
        end
      end
      object gbActualValues: TsGroupBox
        Left = 287
        Top = 179
        Width = 242
        Height = 71
        Caption = 'Actual Values'
        TabOrder = 2
        object sLabel10: TsLabel
          Left = 212
          Top = 22
          Width = 11
          Height = 13
          Caption = 'qc'
        end
        object sLabel11: TsLabel
          Left = 212
          Top = 45
          Width = 11
          Height = 13
          Caption = 'qc'
        end
        object edtPositionActualValue: TsEdit
          Left = 127
          Top = 19
          Width = 79
          Height = 20
          Enabled = False
          ReadOnly = True
          TabOrder = 0
          Text = '0'
          BoundLabel.Active = True
          BoundLabel.Caption = 'Position Actual Value'
        end
        object edtPositionDemandValue: TsEdit
          Left = 127
          Top = 45
          Width = 79
          Height = 20
          Enabled = False
          ReadOnly = True
          TabOrder = 1
          Text = '0'
          BoundLabel.Active = True
          BoundLabel.Caption = 'Position Demand Value'
        end
      end
      object btnStopHoming: TsBitBtn
        Left = 123
        Top = 286
        Width = 100
        Height = 20
        Caption = 'Stop Homing'
        TabOrder = 4
        OnClick = btnStopHomingClick
      end
      object btnStartHoming: TsBitBtn
        Left = 123
        Top = 263
        Width = 100
        Height = 20
        Caption = 'Start Homing'
        TabOrder = 3
        OnClick = btnStartHomingClick
      end
    end
    object tsProfilePosition: TsTabSheet
      Caption = 'Profile Position Mode'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 823
      ExplicitHeight = 419
      object gbProfilePos: TsGroupBox
        Left = 18
        Top = 55
        Width = 249
        Height = 154
        Caption = 'Profile'
        TabOrder = 0
        object sLabel12: TsLabel
          Left = 212
          Top = 29
          Width = 11
          Height = 13
          Caption = 'qc'
        end
        object sLabel14: TsLabel
          Left = 212
          Top = 77
          Width = 18
          Height = 13
          Caption = 'rpm'
        end
        object sLabel15: TsLabel
          Left = 212
          Top = 124
          Width = 27
          Height = 13
          Caption = 'rpm/s'
        end
        object sLabel13: TsLabel
          Left = 212
          Top = 100
          Width = 27
          Height = 13
          Caption = 'rpm/s'
        end
        object cboxProfileTypePos: TsComboBox
          Left = 127
          Top = 50
          Width = 79
          Height = 21
          Alignment = taLeftJustify
          BoundLabel.Active = True
          BoundLabel.Caption = 'Profile Type'
          VerticalAlignment = taAlignTop
          ItemIndex = -1
          TabOrder = 0
        end
        object edtTargetPositionPos: TsEdit
          Left = 127
          Top = 26
          Width = 79
          Height = 21
          TabOrder = 1
          Text = '0'
          BoundLabel.Active = True
          BoundLabel.Caption = 'Target Position'
        end
        object edtProfileVelocityPos: TsEdit
          Left = 127
          Top = 74
          Width = 79
          Height = 21
          TabOrder = 2
          Text = '0'
          BoundLabel.Active = True
          BoundLabel.Caption = 'Profile Velocity'
        end
        object edtDecelerationPos: TsEdit
          Left = 127
          Top = 122
          Width = 79
          Height = 21
          TabOrder = 3
          Text = '0'
          BoundLabel.Active = True
          BoundLabel.Caption = 'Deceleration'
        end
        object edtAccelerationPos: TsEdit
          Left = 127
          Top = 98
          Width = 79
          Height = 21
          TabOrder = 4
          Text = '0'
          BoundLabel.Active = True
          BoundLabel.Caption = 'Acceleration'
        end
      end
      object gbParametersPos: TsGroupBox
        Left = 287
        Top = 55
        Width = 242
        Height = 102
        Caption = 'Parameters'
        TabOrder = 1
        object sLabel18: TsLabel
          Left = 212
          Top = 73
          Width = 18
          Height = 13
          Caption = 'rpm'
        end
        object sLabel19: TsLabel
          Left = 212
          Top = 27
          Width = 18
          Height = 13
          Caption = 'rpm'
        end
        object sLabel20: TsLabel
          Left = 212
          Top = 50
          Width = 11
          Height = 13
          Caption = 'qc'
        end
        object edtMaxProfileVelocityPos: TsEdit
          Left = 127
          Top = 24
          Width = 79
          Height = 21
          TabOrder = 0
          Text = '0'
          BoundLabel.Active = True
          BoundLabel.Caption = 'Max Profile Velocity'
        end
        object edtMaxFollowingErrorPos: TsEdit
          Left = 127
          Top = 47
          Width = 79
          Height = 21
          TabOrder = 1
          Text = '0'
          BoundLabel.Active = True
          BoundLabel.Caption = 'Max Following Error'
        end
        object edtQuickStopDecelerationPos: TsEdit
          Left = 127
          Top = 70
          Width = 79
          Height = 21
          TabOrder = 2
          Text = '0'
          BoundLabel.Active = True
          BoundLabel.Caption = 'Quick Stop Deceleration'
        end
      end
      object gbActualValuesPos: TsGroupBox
        Left = 287
        Top = 179
        Width = 242
        Height = 71
        Caption = 'Actual Values'
        TabOrder = 2
        object sLabel21: TsLabel
          Left = 212
          Top = 22
          Width = 11
          Height = 13
          Caption = 'qc'
        end
        object sLabel22: TsLabel
          Left = 212
          Top = 45
          Width = 11
          Height = 13
          Caption = 'qc'
        end
        object edtPositionActualValuePos: TsEdit
          Left = 127
          Top = 19
          Width = 79
          Height = 21
          Enabled = False
          ReadOnly = True
          TabOrder = 0
          Text = '0'
          BoundLabel.Active = True
          BoundLabel.Caption = 'Position Actual Value'
        end
        object edtPositionDemandValuePos: TsEdit
          Left = 127
          Top = 45
          Width = 79
          Height = 21
          Enabled = False
          ReadOnly = True
          TabOrder = 1
          Text = '0'
          BoundLabel.Active = True
          BoundLabel.Caption = 'Position Demand Value'
        end
      end
      object btnMoveAbsolute: TsBitBtn
        Left = 123
        Top = 263
        Width = 100
        Height = 20
        Caption = 'Move Absolute'
        TabOrder = 3
        OnClick = btnMoveAbsoluteClick
      end
      object btnMoveRelative: TsBitBtn
        Left = 123
        Top = 286
        Width = 100
        Height = 20
        Caption = 'Move Relative'
        TabOrder = 4
        OnClick = btnMoveRelativeClick
      end
    end
    object tsProfileVelocity: TsTabSheet
      Caption = 'Profile Velocity Mode'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 321
      object gbProfileVel: TsGroupBox
        Left = 18
        Top = 55
        Width = 249
        Height = 130
        Caption = 'Profile'
        TabOrder = 0
        object sLabel16: TsLabel
          Left = 212
          Top = 29
          Width = 18
          Height = 13
          Caption = 'rpm'
        end
        object sLabel23: TsLabel
          Left = 212
          Top = 100
          Width = 27
          Height = 13
          Caption = 'rpm/s'
        end
        object sLabel24: TsLabel
          Left = 212
          Top = 76
          Width = 27
          Height = 13
          Caption = 'rpm/s'
        end
        object cboxProfileTypeVel: TsComboBox
          Left = 127
          Top = 50
          Width = 79
          Height = 21
          Alignment = taLeftJustify
          BoundLabel.Active = True
          BoundLabel.Caption = 'Profile Type'
          VerticalAlignment = taAlignTop
          ItemIndex = -1
          TabOrder = 0
        end
        object edtTargetVelocity: TsEdit
          Left = 127
          Top = 26
          Width = 79
          Height = 21
          TabOrder = 1
          Text = '0'
          BoundLabel.Active = True
          BoundLabel.Caption = 'Target Velocity'
        end
        object edtDecelerationVel: TsEdit
          Left = 127
          Top = 98
          Width = 79
          Height = 21
          TabOrder = 2
          Text = '0'
          BoundLabel.Active = True
          BoundLabel.Caption = 'Deceleration'
        end
        object edtAccelerationVel: TsEdit
          Left = 127
          Top = 74
          Width = 79
          Height = 21
          TabOrder = 3
          Text = '0'
          BoundLabel.Active = True
          BoundLabel.Caption = 'Acceleration'
        end
      end
      object gbParametersVel: TsGroupBox
        Left = 287
        Top = 55
        Width = 242
        Height = 102
        Caption = 'Parameters'
        TabOrder = 1
        object sLabel25: TsLabel
          Left = 212
          Top = 53
          Width = 27
          Height = 13
          Caption = 'rpm/s'
        end
        object sLabel26: TsLabel
          Left = 212
          Top = 27
          Width = 18
          Height = 13
          Caption = 'rpm'
        end
        object edtMaxProfileVelocityVel: TsEdit
          Left = 127
          Top = 24
          Width = 79
          Height = 21
          TabOrder = 0
          Text = '0'
          BoundLabel.Active = True
          BoundLabel.Caption = 'Max Profile Velocity'
        end
        object edtQuickStopDecelerationVel: TsEdit
          Left = 127
          Top = 50
          Width = 79
          Height = 21
          TabOrder = 1
          Text = '0'
          BoundLabel.Active = True
          BoundLabel.Caption = 'Quick Stop Deceleration'
        end
      end
      object gbActualValuesVel: TsGroupBox
        Left = 287
        Top = 179
        Width = 243
        Height = 71
        Caption = 'Actual Values'
        TabOrder = 2
        object sLabel28: TsLabel
          Left = 212
          Top = 22
          Width = 18
          Height = 13
          Caption = 'rpm'
        end
        object sLabel29: TsLabel
          Left = 212
          Top = 45
          Width = 18
          Height = 13
          Caption = 'rpm'
        end
        object edtVelocityActualValueAVG: TsEdit
          Left = 127
          Top = 19
          Width = 79
          Height = 21
          Enabled = False
          ReadOnly = True
          TabOrder = 0
          Text = '0'
          BoundLabel.Active = True
          BoundLabel.Caption = 'Velocity Actual Value AVG'
        end
        object edtVelocityDemandValue: TsEdit
          Left = 127
          Top = 45
          Width = 79
          Height = 21
          Enabled = False
          ReadOnly = True
          TabOrder = 1
          Text = '0'
          BoundLabel.Active = True
          BoundLabel.Caption = 'Value Demand Value'
        end
      end
      object btnSetVelocity: TsBitBtn
        Left = 123
        Top = 263
        Width = 100
        Height = 20
        Caption = 'Set Velocity'
        TabOrder = 3
        OnClick = btnSetVelocityClick
      end
    end
  end
  object gbOperationMode: TsGroupBox
    Left = 8
    Top = 24
    Width = 526
    Height = 49
    TabOrder = 1
    object edtActiveOperationMode: TsEdit
      Left = 120
      Top = 16
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 0
      BoundLabel.Active = True
      BoundLabel.Caption = 'ActiveOperationMode'
    end
    object btnActivateOperationMode: TsButton
      Left = 272
      Top = 16
      Width = 221
      Height = 20
      Caption = 'Activate Operation Mode'
      TabOrder = 1
      OnClick = btnActivateOperationModeClick
    end
  end
  object btnEnable: TsBitBtn
    Tag = 1
    Left = 17
    Top = 287
    Width = 100
    Height = 20
    Caption = 'Enable'
    TabOrder = 2
    OnClick = btnEnableClick
  end
  object btnHalt: TsBitBtn
    Left = 240
    Top = 287
    Width = 100
    Height = 20
    Caption = 'Halt'
    TabOrder = 3
    OnClick = btnHaltClick
  end
  object btnClearFault: TsBitBtn
    Tag = 1
    Left = 454
    Top = 316
    Width = 79
    Height = 20
    Caption = 'Clear Fault'
    TabOrder = 4
    OnClick = btnClearFaultClick
  end
  object btnResetDevice: TsBitBtn
    Tag = 1
    Left = 454
    Top = 293
    Width = 79
    Height = 20
    Caption = 'Reset Device'
    TabOrder = 5
    OnClick = btnResetDeviceClick
  end
  object gbState: TsGroupBox
    Left = 15
    Top = 308
    Width = 102
    Height = 35
    Caption = 'State'
    TabOrder = 6
    object lblState: TsLabel
      Left = 28
      Top = 15
      Width = 48
      Height = 13
      Caption = 'Disabled'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 380
    Top = 288
  end
end
