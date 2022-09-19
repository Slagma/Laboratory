object fFormats: TfFormats
  Left = 259
  Top = 139
  BorderStyle = bsDialog
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1092#1086#1088#1084#1099' '#1076#1083#1103' '#1087#1077#1095#1072#1090#1080
  ClientHeight = 440
  ClientWidth = 554
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 554
    Height = 42
    AutoSize = True
    ButtonHeight = 38
    ButtonWidth = 39
    Caption = 'ToolBar1'
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    Flat = True
    HotImages = fDm.HotImages
    Images = fDm.Images
    TabOrder = 0
    object btnOk: TToolButton
      Left = 0
      Top = 0
      Cursor = crHandPoint
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1086#1082#1085#1086' (ESC)'
      Caption = 'btnOk'
      ImageIndex = 11
      ParentShowHint = False
      ShowHint = True
      OnClick = btnOkClick
    end
    object ToolButton2: TToolButton
      Left = 39
      Top = 0
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 1
      Style = tbsSeparator
    end
    object btnEdit: TToolButton
      Left = 47
      Top = 0
      Cursor = crHandPoint
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' (ENTER)'
      Caption = 'btnEdit'
      ImageIndex = 9
      ParentShowHint = False
      ShowHint = True
      OnClick = btnEditClick
    end
  end
  object grFormats: TDBGrid
    Left = 0
    Top = 42
    Width = 554
    Height = 398
    Align = alClient
    DataSource = dsFormats
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clNavy
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    OnDblClick = btnEditClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Ingred'
        Title.Alignment = taCenter
        Title.Caption = #1048#1085#1075#1088#1077#1076#1080#1077#1085#1090
        Width = 173
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'F_Header'
        Title.Alignment = taCenter
        Title.Caption = #1057#1090#1088#1086#1082#1072
        Width = 212
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'F_All'
        Title.Alignment = taCenter
        Title.Caption = #1042#1089#1105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'F_Posle'
        Title.Alignment = taCenter
        Title.Caption = #1055#1086#1089#1083#1077
        Visible = True
      end>
  end
  object tFormats: TTable
    Active = True
    DatabaseName = 'Labor_WIN32'
    IndexFieldNames = 'F_I_Code'
    TableName = 'Formats.db'
    Left = 164
    Top = 8
    object tFormatsF_Code: TAutoIncField
      FieldName = 'F_Code'
      ReadOnly = True
    end
    object tFormatsF_I_Code: TIntegerField
      FieldName = 'F_I_Code'
    end
    object tFormatsF_Header: TStringField
      FieldName = 'F_Header'
      Size = 50
    end
    object tFormatsF_All: TIntegerField
      FieldName = 'F_All'
    end
    object tFormatsF_Posle: TIntegerField
      FieldName = 'F_Posle'
    end
    object tFormatsIngred: TStringField
      FieldKind = fkLookup
      FieldName = 'Ingred'
      LookupDataSet = tIngreds
      LookupKeyFields = 'I_Code'
      LookupResultField = 'I_Name'
      KeyFields = 'F_I_Code'
      Size = 35
      Lookup = True
    end
  end
  object dsFormats: TDataSource
    DataSet = tFormats
    Left = 200
    Top = 8
  end
  object tIngreds: TTable
    Active = True
    DatabaseName = 'Labor_WIN32'
    IndexFieldNames = 'I_Code'
    TableName = 'Ingreds.DB'
    Left = 296
    Top = 8
    object tIngredsI_Code: TAutoIncField
      FieldName = 'I_Code'
      ReadOnly = True
    end
    object tIngredsI_Name: TStringField
      FieldName = 'I_Name'
      Size = 35
    end
    object tIngredsI_Sorted: TIntegerField
      FieldName = 'I_Sorted'
    end
  end
  object dsIngreds: TDataSource
    DataSet = tIngreds
    Left = 328
    Top = 8
  end
end
