object L8Form: TL8Form
  Left = 0
  Top = 0
  Caption = #1056#1072#1073#1086#1090#1072' '#1089' '#1084#1072#1089#1089#1080#1074#1072#1084#1080
  ClientHeight = 243
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
    Width = 88
    Height = 13
    Caption = #1048#1089#1093#1086#1076#1085#1099#1081' '#1084#1072#1089#1089#1080#1074
  end
  object SrcArray: TListBox
    Left = 8
    Top = 32
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
    TabOrder = 0
  end
  object MinButton: TButton
    Left = 184
    Top = 56
    Width = 89
    Height = 25
    Caption = #1052#1080#1085#1080#1084#1091#1084
    TabOrder = 1
  end
  object SortButton: TButton
    Left = 184
    Top = 87
    Width = 89
    Height = 25
    Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072
    TabOrder = 2
    OnClick = SortButtonClick
  end
  object DstArray: TListBox
    Left = 288
    Top = 32
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
    TabOrder = 3
  end
end
