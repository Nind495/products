object FLogin: TFLogin
  Left = 0
  Top = 0
  Caption = #1055#1086#1076#1082#1083#1102#1095#1077#1085#1080#1077
  ClientHeight = 288
  ClientWidth = 296
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 32
    Width = 37
    Height = 13
    Caption = #1057#1077#1088#1074#1077#1088
  end
  object Label2: TLabel
    Left = 24
    Top = 75
    Width = 65
    Height = 13
    Caption = #1041#1072#1079#1072' '#1076#1072#1085#1085#1099#1093
  end
  object Label3: TLabel
    Left = 24
    Top = 115
    Width = 30
    Height = 13
    Caption = #1051#1086#1075#1080#1085
  end
  object Label4: TLabel
    Left = 24
    Top = 152
    Width = 37
    Height = 13
    Caption = #1055#1072#1088#1086#1083#1100
  end
  object bt_connect: TButton
    Left = 80
    Top = 227
    Width = 113
    Height = 25
    Caption = #1055#1086#1076#1082#1083#1102#1095#1080#1090#1100#1089#1103
    TabOrder = 0
    OnClick = bt_connectClick
  end
  object EDServerName: TEdit
    Left = 128
    Top = 29
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'EDServerName'
  end
  object EDBDNAme: TEdit
    Left = 128
    Top = 72
    Width = 121
    Height = 21
    TabOrder = 2
    Text = 'EDBDNAme'
  end
  object EDLogin: TEdit
    Left = 128
    Top = 112
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object EDPass: TEdit
    Left = 128
    Top = 149
    Width = 121
    Height = 21
    TabOrder = 4
  end
  object CBWin: TCheckBox
    Left = 56
    Top = 176
    Width = 209
    Height = 17
    Caption = #1055#1088#1086#1074#1077#1088#1082#1072' '#1087#1086#1076#1083#1080#1085#1085#1086#1089#1090#1080' Windows'
    TabOrder = 5
    OnClick = CBWinClick
  end
end
