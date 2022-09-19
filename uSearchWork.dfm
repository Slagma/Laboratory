object fSearchWork: TfSearchWork
  Left = 192
  Top = 179
  BorderStyle = bsDialog
  Caption = #1055#1086#1080#1089#1082' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1103
  ClientHeight = 373
  ClientWidth = 613
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
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 613
    Height = 42
    AutoSize = True
    ButtonHeight = 38
    ButtonWidth = 39
    Caption = 'ToolBar1'
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    Flat = True
    HotImages = fDm.HotImages
    Images = fDm.Images
    TabOrder = 2
    object btnOk: TToolButton
      Left = 0
      Top = 0
      Cursor = crHandPoint
      Hint = #1042#1099#1073#1088#1072#1090#1100' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1077' (ENTER)'
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
      Hint = #1054#1090#1084#1077#1085#1080#1090#1100' '#1074#1099#1073#1086#1088' (ESC)'
      Caption = 'btnCancel'
      ImageIndex = 12
      ParentShowHint = False
      ShowHint = True
      OnClick = btnCancelClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 342
    Width = 613
    Height = 31
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 12
      Top = 8
      Width = 42
      Height = 13
      Caption = #1055#1086#1080#1089#1082':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object eWork: TEdit
      Left = 60
      Top = 4
      Width = 529
      Height = 21
      TabOrder = 0
      OnChange = eWorkChange
    end
  end
  object grWorks: TDBGrid
    Left = 0
    Top = 42
    Width = 613
    Height = 300
    Align = alClient
    DataSource = dsWorks
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
    OnDblClick = btnOkClick
    Columns = <
      item
        Expanded = False
        FieldName = 'W_ShortName'
        Title.Alignment = taCenter
        Title.Caption = #1055#1088#1077#1076#1087#1088#1080#1103#1090#1080#1077
        Width = 244
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'W_Otbor'
        Title.Alignment = taCenter
        Title.Caption = #1052#1077#1089#1090#1086' '#1086#1090#1073#1086#1088#1072
        Width = 174
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Area'
        Title.Alignment = taCenter
        Title.Caption = #1056#1072#1081#1086#1085
        Width = 155
        Visible = True
      end>
  end
  object tWorks: TTable
    Active = True
    DatabaseName = 'Labor_WIN32'
    OnFilterRecord = tWorksFilterRecord
    IndexFieldNames = 'W_ShortName'
    TableName = 'Works.DB'
    Left = 144
    Top = 8
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
    object tWorksArea: TStringField
      FieldKind = fkLookup
      FieldName = 'Area'
      LookupDataSet = tArea
      LookupKeyFields = 'A_Code'
      LookupResultField = 'A_Name'
      KeyFields = 'W_A_Code'
      Size = 35
      Lookup = True
    end
    object tWorksW_Side: TIntegerField
      FieldName = 'W_Side'
    end
    object tWorksW_K_Code: TIntegerField
      FieldName = 'W_K_Code'
    end
    object tWorksKNS: TStringField
      FieldKind = fkLookup
      FieldName = 'KNS'
      LookupDataSet = tKNS
      LookupKeyFields = 'K_Code'
      LookupResultField = 'K_Name'
      KeyFields = 'W_K_Code'
      Size = 35
      Lookup = True
    end
  end
  object dsWorks: TDataSource
    DataSet = tWorks
    Left = 176
    Top = 8
  end
  object tArea: TTable
    Active = True
    DatabaseName = 'Labor_WIN32'
    IndexFieldNames = 'A_Name'
    TableName = 'Areas.db'
    Left = 262
    Top = 6
    object tAreaA_Code: TAutoIncField
      FieldName = 'A_Code'
      ReadOnly = True
    end
    object tAreaA_Name: TStringField
      FieldName = 'A_Name'
      Size = 35
    end
  end
  object tKNS: TTable
    Active = True
    DatabaseName = 'Labor_WIN32'
    IndexFieldNames = 'K_Name'
    TableName = 'KNS.db'
    Left = 298
    Top = 6
    object tKNSK_Code: TAutoIncField
      FieldName = 'K_Code'
      ReadOnly = True
    end
    object tKNSK_Name: TStringField
      FieldName = 'K_Name'
      Size = 35
    end
  end
end
