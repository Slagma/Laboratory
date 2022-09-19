object fIngreds: TfIngreds
  Left = 355
  Top = 221
  BorderStyle = bsDialog
  Caption = #1057#1087#1080#1089#1086#1082' '#1080#1085#1075#1088#1077#1076#1080#1077#1085#1090#1086#1074
  ClientHeight = 343
  ClientWidth = 341
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
    Width = 341
    Height = 42
    AutoSize = True
    ButtonHeight = 38
    ButtonWidth = 39
    Caption = 'ToolBar'
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    Flat = True
    HotImages = fDm.HotImages
    Images = fDm.Images
    TabOrder = 1
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
    object btnAdd: TToolButton
      Left = 47
      Top = 0
      Cursor = crHandPoint
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1099#1081' '#1080#1085#1075#1088#1077#1076#1080#1077#1085#1090' (INSERT)'
      Caption = 'btnAdd'
      ImageIndex = 8
      ParentShowHint = False
      ShowHint = True
      OnClick = btnAddClick
    end
    object btnEdit: TToolButton
      Left = 86
      Top = 0
      Cursor = crHandPoint
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1080#1085#1075#1088#1077#1076#1080#1077#1085#1090' (ENTER)'
      Caption = 'btnEdit'
      ImageIndex = 9
      ParentShowHint = False
      ShowHint = True
      OnClick = btnEditClick
    end
    object btnDelete: TToolButton
      Left = 125
      Top = 0
      Cursor = crHandPoint
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1080#1085#1075#1088#1077#1076#1080#1077#1085#1090' (DELETE)'
      Caption = 'btnDelete'
      ImageIndex = 10
      ParentShowHint = False
      ShowHint = True
      OnClick = btnDeleteClick
    end
    object ToolButton1: TToolButton
      Left = 164
      Top = 0
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 11
      Style = tbsSeparator
    end
    object btnMoves: TToolButton
      Left = 172
      Top = 0
      Cursor = crHandPoint
      Hint = #1053#1072#1095#1072#1090#1100' '#1087#1077#1088#1077#1085#1086#1089'/'#1047#1072#1074#1077#1088#1096#1080#1090#1100' '#1087#1077#1088#1077#1085#1086#1089' ('#1055#1056#1054#1041#1045#1051')'
      ImageIndex = 15
      ParentShowHint = False
      ShowHint = True
      OnClick = btnMovesClick
    end
  end
  object grIngreds: TDBGrid
    Left = 0
    Top = 42
    Width = 341
    Height = 301
    Align = alClient
    DataSource = dsIngreds
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    PopupMenu = Menu
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clNavy
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    OnCellClick = grIngredsCellClick
    OnDblClick = btnEditClick
    OnKeyUp = grIngredsKeyUp
    Columns = <
      item
        Expanded = False
        FieldName = 'I_Name'
        Title.Alignment = taCenter
        Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1080#1085#1075#1088#1077#1076#1080#1077#1085#1090#1072
        Width = 301
        Visible = True
      end>
  end
  object tIngreds: TTable
    Active = True
    DatabaseName = 'Labor_WIN32'
    IndexFieldNames = 'I_Sorted'
    TableName = 'Ingreds.db'
    Left = 248
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
    object tIngredsI_HowOutput: TStringField
      FieldName = 'I_HowOutput'
      Size = 50
    end
    object tIngredsI_HowOutput2: TStringField
      FieldName = 'I_HowOutput2'
      Size = 10
    end
    object tIngredsI_EdIzm: TStringField
      FieldName = 'I_EdIzm'
      Size = 10
    end
    object tIngredsI_EdIzm2: TStringField
      FieldName = 'I_EdIzm2'
      Size = 5
    end
    object tIngredsI_IsPH: TBooleanField
      FieldName = 'I_IsPH'
    end
    object tIngredsI_HowRegistr: TBooleanField
      FieldName = 'I_HowRegistr'
    end
    object tIngredsI_EdRegistr: TBooleanField
      FieldName = 'I_EdRegistr'
    end
    object tIngredsDocument: TStringField
      DisplayWidth = 45
      FieldName = 'Document'
      Size = 45
    end
    object tIngredsStarlet: TBooleanField
      FieldName = 'Starlet'
    end
  end
  object dsIngreds: TDataSource
    DataSet = tIngreds
    Left = 278
    Top = 6
  end
  object Menu: TPopupMenu
    Left = 144
    Top = 112
    object iAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1080#1085#1075#1088#1077#1076#1080#1077#1085#1090
      OnClick = btnAddClick
    end
    object iEdit: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1080#1085#1075#1088#1077#1076#1080#1077#1085#1090
      OnClick = btnEditClick
    end
    object iDel: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1080#1085#1075#1088#1077#1076#1080#1077#1085#1090
      OnClick = btnDeleteClick
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object iClose: TMenuItem
      Caption = #1047#1072#1082#1088#1099#1090#1100' '#1086#1082#1085#1086
      OnClick = iCloseClick
    end
  end
  object tIngreds2: TTable
    DatabaseName = 'Labor_WIN32'
    IndexFieldNames = 'I_Sorted'
    TableName = 'Ingreds.DB'
    Left = 264
    Top = 112
    object tIngreds2I_Name: TStringField
      FieldName = 'I_Name'
      Size = 35
    end
    object tIngreds2I_Sorted: TIntegerField
      FieldName = 'I_Sorted'
    end
  end
  object tQuery: TQuery
    DatabaseName = 'Labor_WIN32'
    Left = 144
    Top = 208
  end
end
