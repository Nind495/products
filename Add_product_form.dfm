object FPAddProduct: TFPAddProduct
  Left = 0
  Top = 0
  Caption = #1053#1086#1074#1099#1081' '#1087#1088#1086#1076#1091#1082#1090
  ClientHeight = 284
  ClientWidth = 348
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PClient: TPanel
    Left = 0
    Top = 0
    Width = 348
    Height = 284
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 104
      Top = 24
      Width = 113
      Height = 19
      Caption = #1053#1086#1074#1099#1081' '#1087#1088#1086#1076#1091#1082#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object label2: TLabel
      Left = 40
      Top = 134
      Width = 49
      Height = 13
      Caption = #1057#1090#1086#1080#1084#1086#1090#1100
    end
    object Label3: TLabel
      Left = 40
      Top = 80
      Width = 108
      Height = 13
      Caption = #1053#1086#1084#1077#1088' '#1085#1086#1084#1077#1085#1082#1083#1072#1090#1091#1088#1099
    end
    object Label4: TLabel
      Left = 40
      Top = 107
      Width = 73
      Height = 13
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
    end
    object EdNnmoner: TEdit
      Left = 160
      Top = 77
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object EdName: TEdit
      Left = 160
      Top = 104
      Width = 121
      Height = 21
      TabOrder = 1
    end
    object EdPricce: TEdit
      Left = 160
      Top = 131
      Width = 121
      Height = 21
      TabOrder = 2
    end
    object Button1: TButton
      Left = 206
      Top = 176
      Width = 75
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      TabOrder = 3
      OnClick = Button1Click
    end
  end
end
