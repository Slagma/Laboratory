object fActs: TfActs
  Left = 322
  Top = 206
  BorderStyle = bsDialog
  Caption = #1042#1074#1086#1076' '#1072#1082#1090#1086#1074
  ClientHeight = 314
  ClientWidth = 489
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  PopupMenu = Menu
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 489
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
    object ToolButton1: TToolButton
      Left = 39
      Top = 0
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 12
      Style = tbsSeparator
    end
    object btnAdd: TToolButton
      Left = 47
      Top = 0
      Cursor = crHandPoint
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1072#1082#1090' (INSERT)'
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
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1072#1082#1090' (ENTER)'
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
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1072#1082#1090' (DELETE)'
      Caption = 'btnDelete'
      ImageIndex = 10
      ParentShowHint = False
      ShowHint = True
      OnClick = btnDeleteClick
    end
    object ToolButton2: TToolButton
      Left = 164
      Top = 0
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 11
      Style = tbsSeparator
    end
    object btnSearchAct: TToolButton
      Left = 172
      Top = 0
      Cursor = crHandPoint
      Hint = #1048#1089#1082#1072#1090#1100' '#1072#1082#1090' '#1087#1086' '#1085#1086#1084#1077#1088#1091' (F7)'
      Caption = 'btnSearchAct'
      ImageIndex = 13
      ParentShowHint = False
      ShowHint = True
      OnClick = btnSearchActClick
    end
    object btnSearchDate: TToolButton
      Left = 211
      Top = 0
      Cursor = crHandPoint
      Hint = #1048#1089#1082#1072#1090#1100' '#1072#1082#1090' '#1087#1086' '#1076#1072#1090#1077' (F6)'
      Caption = 'btnSearchDate'
      ImageIndex = 18
      ParentShowHint = False
      ShowHint = True
      OnClick = btnSearchDateClick
    end
    object ToolButton7: TToolButton
      Left = 250
      Top = 0
      Width = 8
      Caption = 'ToolButton7'
      ImageIndex = 13
      Style = tbsSeparator
    end
    object btnValues: TToolButton
      Left = 258
      Top = 0
      Cursor = crHandPoint
      Hint = #1042#1074#1086#1076' '#1079#1085#1072#1095#1077#1085#1080#1081' (F2)'
      Caption = 'btnValues'
      ImageIndex = 19
      ParentShowHint = False
      ShowHint = True
      OnClick = btnValuesClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 42
    Width = 489
    Height = 147
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object grActs: TDBGrid
      Left = 2
      Top = 2
      Width = 485
      Height = 143
      Align = alClient
      DataSource = dsActs
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clNavy
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      OnDblClick = btnEditClick
      Columns = <
        item
          Expanded = False
          FieldName = 'AC_Act'
          Title.Alignment = taCenter
          Title.Caption = #8470' '#1072#1082#1090#1072
          Width = 116
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AC_Date'
          Title.Alignment = taCenter
          Title.Caption = #1044#1072#1090#1072' '#1086#1090#1073#1086#1088#1072
          Width = 101
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AC_Plan'
          Title.Alignment = taCenter
          Title.Caption = #1055#1083#1072#1085#1086#1074#1099#1081'?'
          Width = 89
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AC_Proba'
          Title.Alignment = taCenter
          Title.Caption = #1055#1088#1086#1073#1072' '#1086#1090#1086#1073#1088#1072#1085#1072'?'
          Width = 139
          Visible = True
        end>
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 189
    Width = 489
    Height = 125
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    object Label2: TLabel
      Left = 52
      Top = 8
      Width = 41
      Height = 13
      Caption = #1056#1072#1081#1086#1085':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 12
      Top = 32
      Width = 83
      Height = 13
      Caption = #1055#1088#1077#1076#1087#1088#1080#1103#1090#1080#1077':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 8
      Top = 80
      Width = 87
      Height = 13
      Caption = #1052#1077#1089#1090#1086' '#1086#1090#1073#1086#1088#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 54
      Top = 104
      Width = 41
      Height = 13
      Caption = #1040#1076#1088#1077#1089':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBEdit2: TDBEdit
      Left = 96
      Top = 4
      Width = 185
      Height = 21
      DataField = 'Area'
      DataSource = dsWorks
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit3: TDBEdit
      Left = 96
      Top = 28
      Width = 185
      Height = 21
      DataField = 'W_ShortName'
      DataSource = dsWorks
      ReadOnly = True
      TabOrder = 1
    end
    object DBEdit4: TDBEdit
      Left = 96
      Top = 52
      Width = 385
      Height = 21
      DataField = 'W_FullName'
      DataSource = dsWorks
      ReadOnly = True
      TabOrder = 2
    end
    object DBEdit5: TDBEdit
      Left = 96
      Top = 76
      Width = 185
      Height = 21
      DataField = 'W_Otbor'
      DataSource = dsWorks
      ReadOnly = True
      TabOrder = 3
    end
    object DBEdit6: TDBEdit
      Left = 96
      Top = 100
      Width = 385
      Height = 21
      DataField = 'W_Address'
      DataSource = dsWorks
      ReadOnly = True
      TabOrder = 4
    end
  end
  object tActs: TTable
    Active = True
    DatabaseName = 'Labor_WIN32'
    IndexFieldNames = 'AC_Act'
    TableName = 'Acts.db'
    Left = 382
    Top = 6
    object tActsAC_Code: TAutoIncField
      FieldName = 'AC_Code'
      ReadOnly = True
    end
    object tActsAC_Act: TFloatField
      FieldName = 'AC_Act'
    end
    object tActsAC_Date: TDateField
      FieldName = 'AC_Date'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object tActsAC_W_Code: TIntegerField
      FieldName = 'AC_W_Code'
    end
    object tActsAC_Plan: TBooleanField
      FieldName = 'AC_Plan'
      DisplayValues = #1044#1072';'#1053#1077#1090
    end
    object tActsAC_Proba: TBooleanField
      FieldName = 'AC_Proba'
      DisplayValues = #1044#1072';'#1053#1077#1090
    end
  end
  object Menu: TPopupMenu
    Left = 458
    Top = 6
    object iAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1072#1082#1090
      OnClick = btnAddClick
    end
    object iEdit: TMenuItem
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1072#1082#1090
      OnClick = btnEditClick
    end
    object iDelete: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1072#1082#1090
      OnClick = btnDeleteClick
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object iSearchAct: TMenuItem
      Caption = #1055#1086#1080#1089#1082' '#1072#1082#1090#1072' '#1087#1086' '#1085#1086#1084#1077#1088#1091
      OnClick = btnSearchActClick
    end
    object iSearchDate: TMenuItem
      Caption = #1055#1086#1080#1089#1082' '#1072#1082#1090#1072' '#1087#1086' '#1076#1072#1090#1077
      OnClick = btnSearchDateClick
    end
    object N7: TMenuItem
      Caption = '-'
    end
    object iWorks: TMenuItem
      Caption = #1042#1099#1073#1088#1072#1090#1100' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1077
    end
    object N9: TMenuItem
      Caption = '-'
    end
    object iValues: TMenuItem
      Caption = #1042#1074#1086#1076' '#1079#1085#1072#1095#1077#1085#1080#1081
      OnClick = btnValuesClick
    end
    object N11: TMenuItem
      Caption = '-'
    end
    object iClose: TMenuItem
      Caption = #1047#1072#1082#1088#1099#1090#1100' '#1086#1082#1085#1086
      OnClick = btnOkClick
    end
  end
  object dsActs: TDataSource
    DataSet = tActs
    Left = 414
    Top = 6
  end
  object tWorks: TTable
    Active = True
    DatabaseName = 'Labor_WIN32'
    IndexFieldNames = 'W_Code'
    MasterFields = 'AC_W_Code'
    MasterSource = dsActs
    TableName = 'Works.DB'
    Left = 384
    Top = 58
    object tWorksW_Code: TAutoIncField
      FieldName = 'W_Code'
      ReadOnly = True
    end
    object tWorksW_A_Code: TIntegerField
      FieldName = 'W_A_Code'
    end
    object tWorksW_ShortName: TStringField
      FieldName = 'W_ShortName'
      Size = 50
    end
    object tWorksW_Otbor: TStringField
      FieldName = 'W_Otbor'
      Size = 35
    end
    object tWorksW_Address: TStringField
      FieldName = 'W_Address'
      Size = 100
    end
    object tWorksW_FullName: TStringField
      FieldName = 'W_FullName'
      Size = 100
    end
    object tWorksW_Label: TBooleanField
      FieldName = 'W_Label'
    end
    object tWorksArea: TStringField
      FieldKind = fkLookup
      FieldName = 'Area'
      LookupDataSet = tAreas
      LookupKeyFields = 'A_Code'
      LookupResultField = 'A_Name'
      KeyFields = 'W_A_Code'
      Size = 35
      Lookup = True
    end
  end
  object tAreas: TTable
    Active = True
    DatabaseName = 'Labor_WIN32'
    TableName = 'Areas.db'
    Left = 428
    Top = 58
    object tAreasA_Code: TAutoIncField
      FieldName = 'A_Code'
      ReadOnly = True
    end
    object tAreasA_Name: TStringField
      FieldName = 'A_Name'
      Size = 35
    end
  end
  object dsWorks: TDataSource
    DataSet = tWorks
    Left = 384
    Top = 90
  end
end
