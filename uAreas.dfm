object fAreas: TfAreas
  Left = 236
  Top = 147
  BorderStyle = bsDialog
  Caption = #1057#1087#1080#1089#1086#1082' '#1088#1072#1081#1086#1085#1086#1074
  ClientHeight = 309
  ClientWidth = 349
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
  object ToolBar: TToolBar
    Left = 0
    Top = 0
    Width = 349
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
    object btnQuit: TToolButton
      Left = 0
      Top = 0
      Cursor = crHandPoint
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1086#1082#1085#1086' (ESC)'
      Caption = 'btnQuit'
      ImageIndex = 11
      ParentShowHint = False
      ShowHint = True
      OnClick = btnQuitClick
    end
    object ToolButton2: TToolButton
      Left = 39
      Top = 0
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 11
      Style = tbsSeparator
    end
    object btnAdd: TToolButton
      Left = 47
      Top = 0
      Cursor = crHandPoint
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1099#1081' '#1088#1072#1081#1086#1085' (INSERT)'
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
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1088#1072#1081#1086#1085' (ENTER)'
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
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1088#1072#1081#1086#1085' (DELETE)'
      Caption = 'btnDelete'
      ImageIndex = 10
      ParentShowHint = False
      ShowHint = True
      OnClick = btnDeleteClick
    end
  end
  object grAreas: TDBGrid
    Left = 0
    Top = 42
    Width = 349
    Height = 267
    Align = alClient
    DataSource = dsAreas
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = Menu
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = btnEditClick
    Columns = <
      item
        Expanded = False
        FieldName = 'A_Name'
        Title.Alignment = taCenter
        Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1088#1072#1081#1086#1085#1072
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 311
        Visible = True
      end>
  end
  object tAreas: TTable
    Active = True
    DatabaseName = 'Labor_WIN32'
    IndexFieldNames = 'A_Name'
    TableName = 'Areas.db'
    Left = 178
    Top = 6
    object tAreasA_Code: TAutoIncField
      FieldName = 'A_Code'
      ReadOnly = True
    end
    object tAreasA_Name: TStringField
      FieldName = 'A_Name'
      Size = 35
    end
  end
  object dsAreas: TDataSource
    DataSet = tAreas
    Left = 214
    Top = 6
  end
  object Menu: TPopupMenu
    Left = 172
    Top = 168
    object iAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1088#1072#1081#1086#1085
      OnClick = btnAddClick
    end
    object iEdit: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1088#1072#1081#1086#1085
      OnClick = btnEditClick
    end
    object iDel: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1088#1072#1081#1086#1085
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
end
