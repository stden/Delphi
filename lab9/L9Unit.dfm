object L9Form: TL9Form
  Left = 0
  Top = 0
  Caption = #1052#1085#1086#1075#1086#1084#1077#1088#1085#1099#1077' '#1084#1072#1089#1089#1080#1074#1099
  ClientHeight = 495
  ClientWidth = 729
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 16
  object Res: TLabel
    Left = 24
    Top = 333
    Width = 198
    Height = 18
    Caption = #1047#1076#1077#1089#1100' '#1073#1091#1076#1091#1090' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1099
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 97
    Height = 16
    Caption = #1050#1086#1083'-'#1074#1086' '#1089#1090#1088#1086#1082':'
  end
  object Label2: TLabel
    Left = 8
    Top = 42
    Width = 122
    Height = 16
    Caption = #1050#1086#1083'-'#1074#1086' '#1089#1090#1086#1083#1073#1094#1086#1074':'
  end
  object Calc1: TBitBtn
    Left = 24
    Top = 277
    Width = 313
    Height = 44
    Caption = #1042#1099#1095#1080#1089#1083#1080#1090#1100
    Enabled = False
    Kind = bkAll
    NumGlyphs = 2
    TabOrder = 0
    WordWrap = True
    OnClick = Calc1Click
  end
  object RowEdit: TSpinEdit
    Left = 136
    Top = 8
    Width = 82
    Height = 26
    MaxValue = 10000
    MinValue = 2
    TabOrder = 1
    Value = 3
  end
  object ColEdit: TSpinEdit
    Left = 136
    Top = 40
    Width = 82
    Height = 26
    MaxValue = 10000
    MinValue = 2
    TabOrder = 2
    Value = 4
  end
  object StringGrid1: TStringGrid
    Left = 24
    Top = 72
    Width = 337
    Height = 153
    FixedCols = 0
    FixedRows = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goTabs]
    ParentFont = False
    TabOrder = 3
    Visible = False
  end
  object Variant: TRadioGroup
    Left = 384
    Top = 8
    Width = 337
    Height = 449
    Hint = #1042#1099#1073#1077#1088#1080#1090#1077' '#1074#1072#1088#1080#1072#1085#1090
    Caption = #1042#1072#1088#1080#1072#1085#1090#1099
    ItemIndex = 2
    Items.Strings = (
      '1. '#1059#1084#1085#1086#1078#1080#1090#1100' '#1101#1083#1077#1084#1077#1085#1090#1099' 1-'#1086#1081' '#1089#1090#1088#1086#1082#1080' '#1080' 1-'#1075#1086' '#1089#1090#1086#1083#1073#1094#1072' '#1085#1072' '#1082#1086#1101#1092#1092#1080#1094#1080#1077#1085#1090
      '2. '#1053#1072#1081#1090#1080' '#1089#1091#1084#1084#1099' '#1101#1083#1077#1084#1077#1085#1090#1086#1074' '#1082#1072#1078#1076#1086#1081' '#1089#1090#1088#1086#1082#1080' '#1080' '#1074#1089#1077#1093' '#1101#1083#1077#1084#1077#1085#1090#1086#1074
      '3. '#1053#1072#1081#1090#1080' '#1089#1091#1084#1084#1099' '#1101#1083#1077#1084#1077#1085#1090#1086#1074' '#1082#1072#1078#1076#1086#1075#1086' '#1089#1090#1086#1083#1073#1094#1072' '#1080' '#1074#1089#1077#1093' '#1101#1083#1077#1084#1077#1085#1090#1086#1074
      '4. '#1053#1072#1081#1090#1080' '#1089#1090#1086#1083#1073#1077#1094' '#1089' '#1085#1072#1080#1084#1077#1085#1100#1096#1077#1081' '#1089#1091#1084#1084#1086#1081' '#1101#1083#1077#1084#1077#1085#1090#1086#1074
      '5. '#1053#1072#1081#1090#1080' '#1089#1090#1088#1086#1082#1091' '#1089' '#1085#1072#1080#1073#1086#1083#1100#1096#1077#1081' '#1089#1091#1084#1084#1086#1081' '#1101#1083#1077#1084#1077#1085#1090#1086#1074
      '6. '#1054#1087#1088#1077#1076#1077#1083#1080#1090#1100' '#1077#1089#1090#1100' '#1083#1080' '#1079#1072#1076#1072#1085#1085#1099#1081' '#1101#1083#1077#1084#1077#1085#1090', '#1091#1082#1072#1079#1072#1090#1100' '#1077#1075#1086' '#1087#1086#1083#1086#1078#1077#1085#1080#1103
      '7. '#1054#1087#1088#1077#1076#1077#1083#1080#1090#1100' '#1095#1080#1089#1083#1086' '#1087#1086#1083#1086#1078#1080#1090#1077#1083#1100#1085#1099#1093' '#1101#1083#1077#1084#1077#1085#1090#1086#1074' '#1074' '#1082#1072#1078#1076#1086#1081' '#1089#1090#1088#1086#1082#1077
      '8. '#1054#1087#1088#1077#1076#1077#1083#1080#1090#1100' '#1095#1080#1089#1083#1086' '#1085#1077#1095#1105#1090#1085#1099#1093' '#1101#1083#1077#1084#1077#1085#1090#1086#1074' '#1074' '#1082#1072#1078#1076#1086#1084' '#1089#1090#1086#1083#1073#1094#1077
      '9. '#1053#1072#1081#1090#1080' '#1085#1072#1080#1073#1086#1083#1100#1096#1080#1081' '#1101#1083#1077#1084#1077#1085#1090', '#1091#1082#1072#1079#1072#1090#1100' '#1077#1075#1086' '#1087#1086#1083#1086#1078#1077#1085#1080#1077)
    TabOrder = 4
    WordWrap = True
  end
  object BitBtn1: TBitBtn
    Left = 238
    Top = 8
    Width = 123
    Height = 50
    Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1084#1072#1090#1088#1080#1094#1091
    TabOrder = 5
    WordWrap = True
    OnClick = BitBtn1Click
  end
  object CoefEdit: TLabeledEdit
    Left = 24
    Top = 250
    Width = 137
    Height = 24
    EditLabel.Width = 100
    EditLabel.Height = 16
    EditLabel.Caption = #1050#1086#1101#1092#1092#1080#1094#1080#1077#1085#1090':'
    TabOrder = 6
    Text = '1.5'
  end
  object SaveBtn: TBitBtn
    Left = 424
    Top = 462
    Width = 130
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    Kind = bkAll
    NumGlyphs = 2
    TabOrder = 7
    OnClick = SaveBtnClick
  end
  object LoadBtn: TBitBtn
    Left = 568
    Top = 462
    Width = 129
    Height = 25
    Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 8
    OnClick = LoadBtnClick
  end
  object OpenDialog: TOpenTextFileDialog
    DefaultExt = 'txt'
    Filter = #1058#1077#1082#1089#1090#1086#1074#1099#1077' '#1092#1072#1081#1083#1099'|*.txt'
    EncodingIndex = 4
    Left = 288
    Top = 360
  end
  object SaveDialog: TSaveTextFileDialog
    DefaultExt = 'txt'
    Filter = #1058#1077#1082#1089#1090#1086#1074#1099#1077' '#1092#1072#1081#1083#1099'|*.txt'
    EncodingIndex = 4
    Left = 288
    Top = 416
  end
end
