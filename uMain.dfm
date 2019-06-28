object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = #1056#1072#1089#1089#1099#1083#1082#1072' '#1087#1086#1095#1090#1099
  ClientHeight = 487
  ClientWidth = 923
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 923
    Height = 41
    Align = alTop
    TabOrder = 0
    ExplicitLeft = 232
    ExplicitTop = 152
    ExplicitWidth = 185
    object Label1: TLabel
      Left = 24
      Top = 14
      Width = 73
      Height = 13
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
    end
    object eName: TEdit
      Left = 103
      Top = 11
      Width = 121
      Height = 21
      TabOrder = 0
      Text = 'BeginenDeveloper'
    end
  end
  object mLog: TMemo
    Left = 0
    Top = 398
    Width = 923
    Height = 89
    Align = alBottom
    Lines.Strings = (
      'mLog')
    ScrollBars = ssVertical
    TabOrder = 1
    ExplicitTop = 374
    ExplicitWidth = 727
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 41
    Width = 923
    Height = 357
    ActivePage = TabSheet4
    Align = alClient
    TabOrder = 2
    ExplicitWidth = 635
    ExplicitHeight = 170
    object TabSheet1: TTabSheet
      Caption = #1054#1090#1087#1088#1072#1074#1082#1072' '#1087#1086#1095#1090#1099
      ExplicitLeft = 8
      ExplicitTop = 40
      ExplicitWidth = 719
      ExplicitHeight = 339
      object Label2: TLabel
        Left = 20
        Top = 3
        Width = 62
        Height = 13
        Caption = #1058#1077#1084#1072' '#1087#1080#1100#1089#1084#1072
      end
      object Label3: TLabel
        Left = 20
        Top = 30
        Width = 41
        Height = 13
        Caption = #1054#1090' '#1082#1086#1074#1086
      end
      object Label4: TLabel
        Left = 20
        Top = 57
        Width = 28
        Height = 13
        Caption = #1050#1086#1084#1091' '
      end
      object Label5: TLabel
        Left = 20
        Top = 95
        Width = 62
        Height = 13
        Caption = #1058#1077#1083#1086' '#1087#1080#1089#1100#1084#1072
      end
      object mBody1: TMemo
        Left = 18
        Top = 124
        Width = 589
        Height = 89
        Lines.Strings = (
          #1044#1086#1073#1088#1086' '#1087#1086#1078#1072#1083#1086#1074#1072#1090#1100' '#1085#1072' '#1089#1090#1088#1080#1084'!')
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object btSend1: TButton
        Left = 18
        Top = 235
        Width = 183
        Height = 25
        Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100' '#1087#1080#1089#1100#1084#1086
        TabOrder = 1
        OnClick = btSend1Click
      end
      object eSubject1: TEdit
        Left = 99
        Top = 3
        Width = 406
        Height = 21
        TabOrder = 2
        Text = #1055#1088#1080#1074#1077#1090#1089#1090#1074#1080#1077
      end
      object eFrom1: TEdit
        Left = 99
        Top = 30
        Width = 406
        Height = 21
        TabOrder = 3
        Text = 'beginendtest1@mail.ru'
      end
      object eFor1: TEdit
        Left = 99
        Top = 57
        Width = 406
        Height = 21
        TabOrder = 4
        Text = 'beginendtest1@mail.ru'
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1054#1090#1087#1088#1072#1074#1082#1072' '#1089' '#1074#1083#1086#1078#1077#1085#1080#1077#1084
      ImageIndex = 1
      ExplicitWidth = 627
      ExplicitHeight = 142
      object Label6: TLabel
        Left = 8
        Top = 6
        Width = 62
        Height = 13
        Caption = #1058#1077#1084#1072' '#1087#1080#1089#1100#1084#1072
      end
      object Label7: TLabel
        Left = 8
        Top = 124
        Width = 62
        Height = 13
        Caption = #1058#1077#1083#1086' '#1087#1080#1089#1100#1084#1072
      end
      object Label8: TLabel
        Left = 8
        Top = 33
        Width = 40
        Height = 13
        Caption = #1054#1090' '#1082#1086#1075#1086
      end
      object Label9: TLabel
        Left = 8
        Top = 60
        Width = 25
        Height = 13
        Caption = #1050#1086#1084#1091
      end
      object Label10: TLabel
        Left = 8
        Top = 92
        Width = 26
        Height = 13
        Caption = #1060#1072#1081#1083
      end
      object btSend2: TButton
        Left = 12
        Top = 216
        Width = 113
        Height = 25
        Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100' '#1087#1080#1089#1100#1084#1086
        TabOrder = 0
        OnClick = btSend2Click
      end
      object eSubject2: TEdit
        Left = 76
        Top = 3
        Width = 377
        Height = 21
        TabOrder = 1
        Text = #1054#1090#1087#1088#1072#1074#1082#1072' '#1074#1083#1086#1078#1077#1085#1080#1103
      end
      object mBody2: TMemo
        Left = 4
        Top = 143
        Width = 609
        Height = 67
        Lines.Strings = (
          #1071' '#1088#1072#1076' '#1087#1088#1080#1074#1077#1090#1089#1090#1074#1086#1074#1072#1090#1100' '#1090#1077#1073#1103'!'
          #1054#1090#1087#1088#1072#1074#1083#1103#1102' '#1086#1090#1095#1105#1090' '#1074#1086' '#1074#1083#1086#1078#1077#1085#1080#1080'!')
        TabOrder = 2
      end
      object eFrom2: TEdit
        Left = 76
        Top = 30
        Width = 377
        Height = 21
        TabOrder = 3
        Text = 'beginendtest1@mail.ru'
      end
      object eFor2: TEdit
        Left = 76
        Top = 57
        Width = 377
        Height = 21
        TabOrder = 4
        Text = 'beginendtest1@mail.ru'
      end
      object eFileName2: TEdit
        Left = 76
        Top = 84
        Width = 377
        Height = 21
        ReadOnly = True
        TabOrder = 5
      end
      object Button1: TButton
        Left = 459
        Top = 82
        Width = 26
        Height = 25
        Caption = '...'
        TabOrder = 6
        OnClick = Button1Click
      end
    end
    object TabSheet3: TTabSheet
      Caption = #1054#1090#1087#1088#1072#1074#1082#1072' '#1096#1072#1073#1083#1086#1085#1072
      ImageIndex = 2
      ExplicitWidth = 627
      ExplicitHeight = 142
      object Label11: TLabel
        Left = 20
        Top = 6
        Width = 62
        Height = 13
        Caption = #1058#1077#1084#1072' '#1087#1080#1089#1100#1084#1072
      end
      object Label13: TLabel
        Left = 20
        Top = 33
        Width = 40
        Height = 13
        Caption = #1054#1090' '#1082#1086#1075#1086
      end
      object Label14: TLabel
        Left = 20
        Top = 60
        Width = 25
        Height = 13
        Caption = #1050#1086#1084#1091
      end
      object Button3: TButton
        Left = 20
        Top = 120
        Width = 190
        Height = 27
        Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100' '#1087#1080#1089#1100#1084#1086' '#1089' '#1096#1072#1073#1083#1086#1085#1086#1084
        TabOrder = 0
        WordWrap = True
        OnClick = Button3Click
      end
      object eSubject3: TEdit
        Left = 88
        Top = 3
        Width = 377
        Height = 21
        TabOrder = 1
        Text = 'Happy Holidays!'
      end
      object eFrom3: TEdit
        Left = 88
        Top = 30
        Width = 377
        Height = 21
        TabOrder = 2
        Text = 'beginendtest1@mail.ru'
      end
      object eFor3: TEdit
        Left = 88
        Top = 57
        Width = 377
        Height = 21
        TabOrder = 3
        Text = 'beginendtest1@mail.ru'
      end
    end
    object TabSheet4: TTabSheet
      Caption = #1056#1072#1089#1089#1099#1083#1082#1072' '#1087#1086#1095#1090#1099
      ImageIndex = 3
      ExplicitWidth = 627
      ExplicitHeight = 142
      object Label12: TLabel
        Left = 28
        Top = 14
        Width = 62
        Height = 13
        Caption = #1058#1077#1084#1072' '#1087#1080#1089#1100#1084#1072
      end
      object Label15: TLabel
        Left = 28
        Top = 41
        Width = 40
        Height = 13
        Caption = #1054#1090' '#1082#1086#1075#1086
      end
      object Label16: TLabel
        Left = 28
        Top = 68
        Width = 31
        Height = 13
        Caption = #1050#1086#1087#1080#1103
      end
      object Label17: TLabel
        Left = 20
        Top = 92
        Width = 245
        Height = 13
        Caption = 'BccList - '#1086#1090#1082#1088#1099#1090#1072#1103' '#1082#1086#1087#1080#1103', CCList -'#1089#1082#1088#1099#1090#1072#1103' '#1082#1086#1087#1080#1103
      end
      object Button2: TButton
        Left = 3
        Top = 248
        Width = 190
        Height = 29
        Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100' '#1087#1080#1089#1100#1084#1086' '#1089' '#1096#1072#1073#1083#1086#1085#1086#1084
        TabOrder = 0
        WordWrap = True
        OnClick = Button2Click
      end
      object eSubject4: TEdit
        Left = 96
        Top = 11
        Width = 377
        Height = 21
        TabOrder = 1
        Text = #1040#1085#1082#1077#1090#1080#1088#1086#1074#1072#1085#1080#1077
      end
      object eFrom4: TEdit
        Left = 96
        Top = 38
        Width = 377
        Height = 21
        TabOrder = 2
        Text = 'beginendtest1@mail.ru'
      end
      object DBGrid1: TDBGrid
        Left = 28
        Top = 114
        Width = 765
        Height = 120
        DataSource = dsClients
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'FirstName'
            Width = 173
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MiddleName'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LastName'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Mail'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SendStatus'
            Width = 64
            Visible = True
          end>
      end
      object Edit1: TEdit
        Left = 96
        Top = 65
        Width = 377
        Height = 21
        TabOrder = 4
        Text = 'beginendtest1@mail.ru'
      end
    end
  end
  object cdsClients: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 736
    Top = 104
    object cdsClientsFirstName: TStringField
      DisplayLabel = #1048#1084#1103
      FieldName = 'FirstName'
      Size = 25
    end
    object cdsClientsMiddleName: TStringField
      DisplayLabel = #1054#1090#1095#1077#1089#1090#1074#1086
      FieldName = 'MiddleName'
      Size = 25
    end
    object cdsClientsLastName: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103
      FieldName = 'LastName'
      Size = 25
    end
    object cdsClientsMail: TStringField
      DisplayLabel = #1055#1086#1095#1090#1072
      FieldName = 'Mail'
      Size = 25
    end
    object cdsClientsSendStatus: TBooleanField
      DisplayLabel = #1057#1090#1072#1090#1091#1089
      FieldKind = fkCalculated
      FieldName = 'SendStatus'
      Calculated = True
    end
  end
  object dsClients: TDataSource
    DataSet = cdsClients
    Left = 696
    Top = 88
  end
end
