object fNorms: TfNorms
  Left = 208
  Top = 121
  BorderStyle = bsDialog
  Caption = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072' '#1085#1086#1088#1084
  ClientHeight = 413
  ClientWidth = 578
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  PopupMenu = Popup
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 578
    Height = 42
    AutoSize = True
    ButtonHeight = 38
    ButtonWidth = 39
    Caption = 'ToolBar1'
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
    object btnNew: TToolButton
      Left = 47
      Top = 0
      Cursor = crHandPoint
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1080#1085#1075#1088#1077#1076#1080#1077#1085#1090' (INSERT)'
      Caption = 'btnNew'
      ImageIndex = 8
      ParentShowHint = False
      ShowHint = True
      OnClick = btnNewClick
    end
    object btnDelete: TToolButton
      Left = 86
      Top = 0
      Cursor = crHandPoint
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1080#1085#1075#1088#1077#1076#1080#1077#1085#1090' (DELETE)'
      Caption = 'btnDelete'
      ImageIndex = 10
      ParentShowHint = False
      ShowHint = True
      OnClick = btnDeleteClick
    end
    object btnEdit: TToolButton
      Left = 125
      Top = 0
      Cursor = crHandPoint
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1085#1086#1088#1084#1091' (ENTER)'
      Caption = 'btnEdit'
      ImageIndex = 9
      ParentShowHint = False
      ShowHint = True
      OnClick = btnEditClick
    end
    object ToolButton1: TToolButton
      Left = 164
      Top = 0
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 14
      Style = tbsSeparator
    end
    object btnEditDate: TToolButton
      Left = 172
      Top = 0
      Cursor = crHandPoint
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1076#1072#1090#1091' (F7)'
      Caption = 'btnEditDate'
      ImageIndex = 19
      ParentShowHint = False
      ShowHint = True
      OnClick = btnEditDateClick
    end
    object ToolButton6: TToolButton
      Left = 211
      Top = 0
      Width = 8
      Caption = 'ToolButton6'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object btnWorks: TToolButton
      Left = 219
      Top = 0
      Cursor = crHandPoint
      Hint = #1042#1099#1073#1086#1088' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1103' (F8)'
      Caption = 'btnWorks'
      ImageIndex = 13
      ParentShowHint = False
      ShowHint = True
      OnClick = btnWorksClick
    end
    object ToolButton3: TToolButton
      Left = 258
      Top = 0
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 14
      Style = tbsSeparator
    end
    object btnNewNorms: TToolButton
      Left = 266
      Top = 0
      Cursor = crHandPoint
      Hint = #1053#1086#1074#1099#1077' '#1085#1086#1088#1084#1099' (F11)'
      Caption = 'btnNewNorms'
      ImageIndex = 20
      ParentShowHint = False
      ShowHint = True
      OnClick = btnNewNormsClick
    end
    object btnDelNorms: TToolButton
      Left = 305
      Top = 0
      Cursor = crHandPoint
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1085#1086#1088#1084#1099' (F12)'
      Caption = 'btnDelNorms'
      ImageIndex = 10
      ParentShowHint = False
      ShowHint = True
      OnClick = N9Click
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 42
    Width = 578
    Height = 87
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    object Label1: TLabel
      Left = 8
      Top = 11
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
    object Label2: TLabel
      Left = 4
      Top = 63
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
    object DBEdit1: TDBEdit
      Left = 96
      Top = 7
      Width = 193
      Height = 21
      DataField = 'W_ShortName'
      DataSource = dsWorks
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 96
      Top = 31
      Width = 473
      Height = 21
      DataField = 'W_FullName'
      DataSource = dsWorks
      ReadOnly = True
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 96
      Top = 59
      Width = 193
      Height = 21
      DataField = 'W_Otbor'
      DataSource = dsWorks
      ReadOnly = True
      TabOrder = 2
    end
  end
  object grTempNorms: TDBGrid
    Left = 0
    Top = 129
    Width = 578
    Height = 284
    Align = alClient
    DataSource = dsTempNorms
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
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
        FieldName = 'TN_I_Name'
        Title.Alignment = taCenter
        Title.Caption = #1048#1085#1075#1088#1077#1076#1080#1077#1085#1090
        Width = 175
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TN_N_Output'
        Title.Alignment = taCenter
        Title.Caption = #1042#1099#1074#1086#1076
        Width = 70
        Visible = True
      end>
  end
  object Popup: TPopupMenu
    Left = 354
    Top = 6
    object N1: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1080#1085#1075#1088#1077#1076#1080#1077#1085#1090
      OnClick = btnNewClick
    end
    object N3: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1080#1085#1075#1088#1077#1076#1080#1077#1085#1090
      OnClick = btnDeleteClick
    end
    object N2: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1085#1086#1088#1084#1091
      OnClick = btnEditClick
    end
    object N4: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1076#1072#1090#1091
      OnClick = btnEditDateClick
    end
    object N8: TMenuItem
      Caption = '-'
    end
    object N7: TMenuItem
      Caption = #1053#1086#1074#1099#1077' '#1085#1086#1088#1084#1099
      OnClick = btnNewNormsClick
    end
    object N9: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1085#1086#1088#1084#1099
      OnClick = N9Click
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object N6: TMenuItem
      Caption = #1047#1072#1082#1088#1099#1090#1100' '#1086#1082#1085#1086
      OnClick = btnOkClick
    end
  end
  object tWorks: TTable
    DatabaseName = 'Labor_WIN32'
    IndexFieldNames = 'W_Code'
    ReadOnly = True
    TableName = 'Works.DB'
    Left = 414
    Top = 6
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
  end
  object dsWorks: TDataSource
    DataSet = tWorks
    Left = 446
    Top = 6
  end
  object tTempNorms: TTable
    TableName = 'TempNorms'
    Left = 324
    Top = 152
  end
  object dsTempNorms: TDataSource
    DataSet = tTempNorms
    Left = 360
    Top = 152
  end
  object qNorms: TQuery
    DatabaseName = 'Labor_WIN32'
    SQL.Strings = (
      
        'select distinct N_Date from norms where n_w_code=:MyCode order b' +
        'y n_date')
    Left = 324
    Top = 184
    ParamData = <
      item
        DataType = ftInteger
        Name = 'MyCode'
        ParamType = ptUnknown
      end>
  end
  object tNorms: TTable
    Active = True
    DatabaseName = 'Labor_WIN32'
    IndexFieldNames = 'N_W_Code;N_Date;N_I_Code'
    TableName = 'Norms.db'
    Left = 444
    Top = 156
    object tNormsN_Code: TAutoIncField
      FieldName = 'N_Code'
      ReadOnly = True
    end
    object tNormsN_W_Code: TIntegerField
      FieldName = 'N_W_Code'
    end
    object tNormsN_I_Code: TIntegerField
      FieldName = 'N_I_Code'
    end
    object tNormsN_Date: TDateField
      FieldName = 'N_Date'
    end
    object tNormsN_Value: TFloatField
      FieldName = 'N_Value'
    end
    object tNormsN_Output: TBooleanField
      FieldName = 'N_Output'
    end
  end
  object tIngreds: TTable
    Active = True
    DatabaseName = 'Labor_WIN32'
    IndexFieldNames = 'I_Code'
    TableName = 'Ingreds.DB'
    Left = 444
    Top = 188
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
end
