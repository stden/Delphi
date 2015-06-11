object L8Form: TL8Form
  Left = 0
  Top = 0
  Caption = #1056#1072#1073#1086#1090#1072' '#1089' '#1084#1072#1089#1089#1080#1074#1072#1084#1080
  ClientHeight = 481
  ClientWidth = 640
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object SrcArrayLabel: TLabel
    Left = 16
    Top = 8
    Width = 45
    Height = 13
    Caption = #1052#1072#1089#1089#1080#1074' 1'
  end
  object Label1: TLabel
    Left = 424
    Top = 8
    Width = 45
    Height = 13
    Caption = #1052#1072#1089#1089#1080#1074' 2'
  end
  object Result1: TLabel
    Left = 16
    Top = 237
    Width = 36
    Height = 13
    Caption = 'Result1'
  end
  object Result2: TLabel
    Left = 416
    Top = 223
    Width = 185
    Height = 146
    Caption = 'Label2'
  end
  object SortButton: TButton
    Left = 256
    Top = 25
    Width = 89
    Height = 25
    Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072
    TabOrder = 0
    OnClick = SortButtonClick
  end
  object DstArray: TListBox
    Left = 448
    Top = 288
    Width = 153
    Height = 185
    ItemHeight = 13
    Items.Strings = (
      '1'
      '2'
      '-3'
      '3'
      '10'
      '5')
    TabOrder = 1
  end
  object Memo1: TMemo
    Left = 8
    Top = 27
    Width = 185
    Height = 190
    Lines.Strings = (
      '-1'
      '2'
      '-3'
      '4'
      '5'
      '11'
      '6')
    TabOrder = 2
  end
  object Memo2: TMemo
    Left = 416
    Top = 27
    Width = 185
    Height = 190
    Lines.Strings = (
      '8'
      '3'
      '-2'
      '1'
      '5'
      '4'
      '1')
    TabOrder = 3
  end
  object RadioButton1: TRadioButton
    Left = 216
    Top = 56
    Width = 185
    Height = 42
    Caption = #1053#1072#1081#1090#1080' '#1085#1072#1080#1084#1077#1085#1100#1096#1080#1081' '#1101#1083#1077#1084#1077#1085#1090' '#1080' '#1091#1082#1072#1079#1072#1090#1100' '#1077#1075#1086' '#1087#1086#1083#1086#1078#1077#1085#1080#1077
    TabOrder = 4
    WordWrap = True
  end
  object RadioButton2: TRadioButton
    Left = 216
    Top = 104
    Width = 194
    Height = 33
    Caption = #1053#1072#1081#1090#1080' '#1089#1091#1084#1084#1099' '#1086#1090#1088#1080#1094#1072#1090#1077#1083#1100#1085#1099#1093' '#1080' '#1087#1086#1083#1086#1078#1080#1090#1077#1083#1100#1085#1099#1093' '#1101#1083#1077#1084#1077#1085#1090#1086#1074
    TabOrder = 5
    WordWrap = True
  end
  object Calc: TBitBtn
    Left = 232
    Top = 344
    Width = 113
    Height = 25
    Caption = #1042#1099#1095#1080#1089#1083#1080#1090#1100
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 6
    OnClick = CalcClick
  end
  object RadioButton3: TRadioButton
    Left = 216
    Top = 143
    Width = 194
    Height = 42
    Caption = #1053#1072#1081#1090#1080' '#1089#1091#1084#1084#1091' '#1080' '#1095#1080#1089#1083#1086' '#1095#1105#1090#1085#1099#1093' '#1101#1083#1077#1084#1077#1085#1090#1086#1074' '#1094#1077#1083#1086#1095#1080#1089#1083#1077#1085#1085#1086#1075#1086' '#1084#1072#1089#1089#1080#1074#1072
    TabOrder = 7
    WordWrap = True
  end
  object RadioButton4: TRadioButton
    Left = 216
    Top = 191
    Width = 194
    Height = 42
    Caption = #1059#1076#1074#1086#1080#1090#1100' '#1085#1077#1095#1105#1090#1085#1099#1077' '#1101#1083#1077#1084#1077#1085#1090#1099' '#1094#1077#1083#1086#1095#1080#1089#1083#1077#1085#1085#1086#1075#1086' '#1084#1072#1089#1089#1080#1074#1072', '#1089#1086#1089#1095#1080#1090#1072#1090#1100' '#1080#1093
    TabOrder = 8
    WordWrap = True
  end
  object RadioButton5: TRadioButton
    Left = 216
    Top = 239
    Width = 194
    Height = 42
    Caption = #1053#1072#1081#1090#1080' '#1089#1088#1077#1076#1085#1077#1077' '#1072#1088#1080#1092#1084#1077#1090#1080#1095#1077#1089#1082#1086#1077' '#1101#1083#1077#1084#1077#1085#1090#1086#1074
    TabOrder = 9
    WordWrap = True
  end
end
