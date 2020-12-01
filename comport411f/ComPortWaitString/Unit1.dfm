object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 348
  ClientWidth = 643
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 8
    Top = 8
    Width = 321
    Height = 313
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
  end
  object btnOpen: TButton
    Left = 360
    Top = 8
    Width = 75
    Height = 25
    Caption = 'btnOpen'
    TabOrder = 1
    OnClick = btnOpenClick
  end
  object btnSettings: TButton
    Left = 360
    Top = 39
    Width = 75
    Height = 25
    Caption = 'btnSettings'
    TabOrder = 2
    OnClick = btnSettingsClick
  end
  object edtSend: TEdit
    Left = 360
    Top = 80
    Width = 257
    Height = 21
    TabOrder = 3
    Text = 'LOG IN'
  end
  object btnSend: TButton
    Left = 542
    Top = 107
    Width = 75
    Height = 25
    Caption = 'btnSend'
    TabOrder = 4
    OnClick = btnSendClick
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 329
    Width = 643
    Height = 19
    Panels = <
      item
        Width = 200
      end>
  end
  object ComPort1: TComPort
    BaudRate = br115200
    Port = 'COM27'
    Parity.Bits = prNone
    StopBits = sbOneStopBit
    DataBits = dbEight
    Events = [evRxChar, evTxEmpty, evRxFlag, evRing, evBreak, evCTS, evDSR, evError, evRLSD, evRx80Full]
    FlowControl.OutCTSFlow = False
    FlowControl.OutDSRFlow = False
    FlowControl.ControlDTR = dtrDisable
    FlowControl.ControlRTS = rtsDisable
    FlowControl.XonXoffOut = False
    FlowControl.XonXoffIn = False
    StoredProps = [spBasic]
    TriggersOnRxChar = True
    OnAfterOpen = ComPort1AfterOpen
    OnAfterClose = ComPort1AfterClose
    OnRxChar = ComPort1RxChar
    Left = 376
    Top = 168
  end
end
