object FProduct: TFProduct
  Left = 0
  Top = 0
  Caption = 'FProduct'
  ClientHeight = 433
  ClientWidth = 1013
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Pclient: TPanel
    Left = 0
    Top = 0
    Width = 1013
    Height = 433
    Align = alClient
    TabOrder = 0
    object Ptable: TPanel
      Left = 1
      Top = 1
      Width = 524
      Height = 431
      Align = alClient
      TabOrder = 0
      object DBGProduct: TDBGrid
        Left = 1
        Top = 1
        Width = 522
        Height = 429
        Align = alClient
        DataSource = DataModule1.DSProduct
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
    object PNavigation: TPanel
      AlignWithMargins = True
      Left = 528
      Top = 4
      Width = 481
      Height = 425
      Align = alRight
      TabOrder = 1
      object Label2: TLabel
        Left = 16
        Top = 48
        Width = 120
        Height = 13
        Caption = #1053#1086#1084#1077#1085#1082#1083#1072#1090#1091#1088#1085#1099#1081' '#1085#1086#1084#1077#1088
      end
      object Label3: TLabel
        Left = 88
        Top = 72
        Width = 48
        Height = 13
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077
      end
      object Label4: TLabel
        Left = 88
        Top = 104
        Width = 26
        Height = 13
        Caption = #1062#1077#1085#1072
      end
      object EDNnomer: TEdit
        Left = 160
        Top = 43
        Width = 121
        Height = 21
        TabOrder = 0
      end
      object EDName: TEdit
        Left = 160
        Top = 70
        Width = 121
        Height = 21
        TabOrder = 1
      end
      object EDPrice: TEdit
        Left = 160
        Top = 97
        Width = 121
        Height = 21
        TabOrder = 2
      end
      object BTAdd: TButton
        Left = 26
        Top = 192
        Width = 111
        Height = 25
        Caption = #1053#1086#1074#1099#1081' '#1087#1088#1086#1076#1091#1082#1090
        TabOrder = 3
        OnClick = BTAddClick
      end
      object BTSave: TButton
        Left = 256
        Top = 192
        Width = 75
        Height = 25
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        TabOrder = 4
        OnClick = BTSaveClick
      end
      object BTdelete: TButton
        Left = 160
        Top = 192
        Width = 75
        Height = 25
        Caption = #1059#1076#1072#1083#1080#1090#1100
        TabOrder = 5
        OnClick = BTdeleteClick
      end
      object BTUpadate: TButton
        Left = 344
        Top = 192
        Width = 75
        Height = 25
        Caption = #1048#1079#1084#1077#1085#1080#1090#1100
        TabOrder = 6
        OnClick = BTUpadateClick
      end
      object DBNavigatorProduct: TDBNavigator
        Left = 99
        Top = 136
        Width = 184
        Height = 25
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        TabOrder = 7
        OnClick = DBNavigatorProductClick
      end
      object BTLoadtoFile: TButton
        Left = 288
        Top = 240
        Width = 121
        Height = 25
        Caption = #1079#1072#1075#1088#1091#1079#1082#1072' '#1080#1079' '#1092#1072#1081#1083#1072
        TabOrder = 8
        OnClick = BTLoadtoFileClick
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 840
    Top = 304
  end
  object MainMenu1: TMainMenu
    Left = 128
    Top = 320
    object N1: TMenuItem
      Caption = #1060#1072#1081#1083
      object N2: TMenuItem
        Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1080#1079' '#1092#1072#1081#1083#1072
        OnClick = N2Click
      end
    end
    object N3: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077
      object N4: TMenuItem
        Caption = #1057#1086#1079#1076#1072#1090#1100
        OnClick = N4Click
      end
      object N5: TMenuItem
        Caption = #1059#1076#1072#1083#1080#1090#1100
        OnClick = N5Click
      end
      object N6: TMenuItem
        Caption = #1048#1079#1084#1077#1085#1080#1090#1100
        OnClick = N6Click
      end
      object N7: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        OnClick = N7Click
      end
    end
  end
end
