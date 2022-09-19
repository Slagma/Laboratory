object fEditIngreds: TfEditIngreds
  Left = 352
  Top = 209
  BorderStyle = bsDialog
  Caption = #1053#1086#1074#1099#1081' '#1080#1085#1075#1088#1077#1076#1080#1077#1085#1090
  ClientHeight = 337
  ClientWidth = 343
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 48
    Width = 142
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1080#1085#1075#1088#1077#1076#1080#1077#1085#1090#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 120
    Width = 144
    Height = 13
    Caption = #1050#1072#1082' '#1074#1099#1074#1086#1076#1080#1090#1100' ('#1095#1072#1089#1090#1100' 1):'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 160
    Width = 144
    Height = 13
    Caption = #1050#1072#1082' '#1074#1099#1074#1086#1076#1080#1090#1100' ('#1095#1072#1089#1090#1100' 2):'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 208
    Width = 149
    Height = 13
    Caption = #1045#1076'. '#1080#1079#1084#1077#1088#1077#1085#1080#1103' ('#1095#1072#1089#1090#1100' 1):'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 8
    Top = 248
    Width = 149
    Height = 13
    Caption = #1045#1076'. '#1080#1079#1084#1077#1088#1077#1085#1080#1103' ('#1095#1072#1089#1090#1100' 2):'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 8
    Top = 288
    Width = 64
    Height = 13
    Caption = #1044#1086#1082#1091#1084#1077#1085#1090':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object eName: TDBEdit
    Left = 8
    Top = 65
    Width = 329
    Height = 21
    DataField = 'I_Name'
    DataSource = fIngreds.dsIngreds
    TabOrder = 0
  end
  object DBCheckBox1: TDBCheckBox
    Left = 8
    Top = 96
    Width = 329
    Height = 17
    Alignment = taLeftJustify
    Caption = #1048#1085#1075#1088#1077#1076#1080#1077#1085#1090' - PH ('#1084#1080#1085') ('#1090'.'#1077'. '#1074' '#1087#1080#1089#1100#1084#1077' '#1085#1077' '#1074#1099#1074#1086#1076#1080#1090#1100'):'
    DataField = 'I_IsPH'
    DataSource = fIngreds.dsIngreds
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    ValueChecked = 'True'
    ValueUnchecked = 'False'
  end
  object DBEdit1: TDBEdit
    Left = 8
    Top = 136
    Width = 329
    Height = 21
    DataField = 'I_HowOutput'
    DataSource = fIngreds.dsIngreds
    TabOrder = 2
  end
  object DBEdit2: TDBEdit
    Left = 8
    Top = 176
    Width = 169
    Height = 21
    DataField = 'I_HowOutput2'
    DataSource = fIngreds.dsIngreds
    TabOrder = 3
  end
  object DBRadioGroup1: TDBRadioGroup
    Left = 184
    Top = 168
    Width = 153
    Height = 33
    Caption = ' '#1056#1077#1075#1080#1089#1090#1088' '#1074#1099#1074#1086#1076#1072': '
    Columns = 2
    DataField = 'I_HowRegistr'
    DataSource = fIngreds.dsIngreds
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Items.Strings = (
      #1042#1077#1088#1093#1085#1080#1081
      #1053#1080#1078#1085#1080#1081)
    ParentFont = False
    TabOrder = 4
    Values.Strings = (
      'True'
      'False')
  end
  object DBEdit3: TDBEdit
    Left = 8
    Top = 224
    Width = 329
    Height = 21
    DataField = 'I_EdIzm'
    DataSource = fIngreds.dsIngreds
    TabOrder = 5
  end
  object DBEdit4: TDBEdit
    Left = 8
    Top = 264
    Width = 169
    Height = 21
    DataField = 'I_EdIzm2'
    DataSource = fIngreds.dsIngreds
    TabOrder = 6
  end
  object DBRadioGroup2: TDBRadioGroup
    Left = 184
    Top = 256
    Width = 153
    Height = 33
    Caption = ' '#1056#1077#1075#1080#1089#1090#1088' '#1074#1099#1074#1086#1076#1072': '
    Columns = 2
    DataField = 'I_EdRegistr'
    DataSource = fIngreds.dsIngreds
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Items.Strings = (
      #1042#1077#1088#1093#1085#1080#1081
      #1053#1080#1078#1085#1080#1081)
    ParentFont = False
    TabOrder = 7
    Values.Strings = (
      'True'
      'False')
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 343
    Height = 42
    AutoSize = True
    ButtonHeight = 38
    ButtonWidth = 39
    Caption = 'ToolBar1'
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    Flat = True
    HotImages = fDm.HotImages
    Images = fDm.Images
    TabOrder = 8
    object btnOk: TToolButton
      Left = 0
      Top = 0
      Cursor = crHandPoint
      Hint = #1047#1072#1087#1080#1089#1072#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' (ENTER)'
      Caption = 'btnOk'
      ImageIndex = 11
      ParentShowHint = False
      ShowHint = True
      OnClick = btnOkClick
    end
    object btnCancel: TToolButton
      Left = 39
      Top = 0
      Cursor = crHandPoint
      Hint = #1054#1090#1084#1077#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' (ESC)'
      Caption = 'btnCancel'
      ImageIndex = 12
      ParentShowHint = False
      ShowHint = True
      OnClick = btnCancelClick
    end
  end
  object DBEdit5: TDBEdit
    Left = 8
    Top = 304
    Width = 169
    Height = 21
    DataField = 'Document'
    DataSource = fIngreds.dsIngreds
    TabOrder = 9
  end
  object DBRadioGroup3: TDBRadioGroup
    Left = 184
    Top = 296
    Width = 153
    Height = 33
    Caption = ' '#1047#1074#1077#1079#1076#1086#1095#1082#1072
    Columns = 2
    DataField = 'Starlet'
    DataSource = fIngreds.dsIngreds
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Items.Strings = (
      #1044#1072
      #1053#1077#1090)
    ParentFont = False
    TabOrder = 10
    Values.Strings = (
      'True'
      'False')
  end
  object tIngreds: TTable
    Active = True
    DatabaseName = 'Labor_WIN32'
    IndexFieldNames = 'I_Name'
    ReadOnly = True
    TableName = 'Ingreds.db'
    Left = 120
    Top = 44
  end
end
