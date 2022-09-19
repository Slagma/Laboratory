object fValues: TfValues
  Left = 484
  Top = 175
  BorderStyle = bsDialog
  Caption = #1042#1074#1086#1076' '#1079#1085#1072#1095#1077#1085#1080#1081
  ClientHeight = 382
  ClientWidth = 403
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
    Width = 403
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
  end
  object Panel1: TPanel
    Left = 0
    Top = 42
    Width = 403
    Height = 55
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    object Label1: TLabel
      Left = 12
      Top = 8
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
      Left = 8
      Top = 32
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
      Left = 98
      Top = 5
      Width = 233
      Height = 21
      DataField = 'W_ShortName'
      DataSource = fActs.dsWorks
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 98
      Top = 29
      Width = 233
      Height = 21
      DataField = 'W_Otbor'
      DataSource = fActs.dsWorks
      ReadOnly = True
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 129
    Width = 403
    Height = 253
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object grTempValues: TDBGrid
      Left = 2
      Top = 2
      Width = 399
      Height = 249
      Align = alClient
      DataSource = dsTempValues
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clNavy
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      Columns = <
        item
          Expanded = False
          FieldName = 'TV_I_Name'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1080#1085#1075#1088#1077#1076#1080#1077#1085#1090#1072
          Width = 205
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TV_Norma'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = #1053#1086#1088#1084#1072
          Width = 74
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TV_Value'
          Title.Alignment = taCenter
          Title.Caption = #1047#1085#1072#1095#1077#1085#1080#1077
          Width = 75
          Visible = True
        end>
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 97
    Width = 403
    Height = 32
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 3
    object Label3: TLabel
      Left = 54
      Top = 8
      Width = 38
      Height = 13
      Caption = #1040#1082#1090' '#8470
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 204
      Top = 8
      Width = 14
      Height = 13
      Caption = #1086#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object eNumber: TDBEdit
      Left = 98
      Top = 4
      Width = 91
      Height = 21
      DataField = 'AC_Act'
      DataSource = fActs.dsActs
      ReadOnly = True
      TabOrder = 0
    end
    object eDate: TDBEdit
      Left = 230
      Top = 4
      Width = 101
      Height = 21
      DataField = 'AC_Date'
      DataSource = fActs.dsActs
      ReadOnly = True
      TabOrder = 1
    end
  end
  object tTempValues: TTable
    FieldDefs = <
      item
        Name = 'TV_Code'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'TV_I_Code'
        DataType = ftInteger
      end
      item
        Name = 'TV_I_Name'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'TV_I_Sorted'
        DataType = ftInteger
      end
      item
        Name = 'TV_Norma'
        DataType = ftFloat
      end
      item
        Name = 'TV_Value'
        DataType = ftFloat
      end>
    StoreDefs = True
    TableName = 'TempValues'
    Left = 64
    Top = 184
    object tTempValuesTV_Code: TAutoIncField
      FieldName = 'TV_Code'
      ReadOnly = True
    end
    object tTempValuesTV_I_Code: TIntegerField
      FieldName = 'TV_I_Code'
    end
    object tTempValuesTV_I_Name: TStringField
      FieldName = 'TV_I_Name'
      Size = 35
    end
    object tTempValuesTV_I_Sorted: TIntegerField
      FieldName = 'TV_I_Sorted'
    end
    object tTempValuesTV_Norma: TFloatField
      FieldName = 'TV_Norma'
    end
    object tTempValuesTV_Value: TFloatField
      FieldName = 'TV_Value'
    end
  end
  object dsTempValues: TDataSource
    DataSet = tTempValues
    Left = 96
    Top = 184
  end
  object tValues: TTable
    Active = True
    DatabaseName = 'Labor_WIN32'
    IndexFieldNames = 'V_AC_Code;V_I_Code'
    TableName = 'Values.db'
    Left = 236
    Top = 200
    object tValuesV_Code: TAutoIncField
      FieldName = 'V_Code'
      ReadOnly = True
    end
    object tValuesV_AC_Code: TIntegerField
      FieldName = 'V_AC_Code'
    end
    object tValuesV_I_Code: TIntegerField
      FieldName = 'V_I_Code'
    end
    object tValuesV_Value: TFloatField
      FieldName = 'V_Value'
    end
  end
  object tIngreds: TTable
    Active = True
    DatabaseName = 'Labor_WIN32'
    IndexFieldNames = 'I_Code'
    TableName = 'Ingreds.DB'
    Left = 236
    Top = 228
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
  object tActs: TTable
    Active = True
    DatabaseName = 'Labor_WIN32'
    IndexFieldNames = 'AC_Act'
    TableName = 'Acts.db'
    Left = 236
    Top = 172
    object tActsAC_Code: TAutoIncField
      FieldName = 'AC_Code'
      ReadOnly = True
    end
    object tActsAC_Act: TFloatField
      FieldName = 'AC_Act'
    end
    object tActsAC_Date: TDateField
      FieldName = 'AC_Date'
    end
    object tActsAC_W_Code: TIntegerField
      FieldName = 'AC_W_Code'
    end
    object tActsAC_Plan: TBooleanField
      FieldName = 'AC_Plan'
    end
    object tActsAC_Proba: TBooleanField
      FieldName = 'AC_Proba'
    end
  end
  object qNorms: TQuery
    DatabaseName = 'Labor_WIN32'
    SQL.Strings = (
      'select distinct N_W_Code, N_Date from norms'
      'where N_W_Code = :MyCode and n_date <= :MyDate')
    Left = 312
    Top = 172
    ParamData = <
      item
        DataType = ftInteger
        Name = 'MyCode'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'MyDate'
        ParamType = ptUnknown
      end>
    object qNormsN_Date: TDateField
      FieldName = 'N_Date'
      Origin = 'LABOR_WIN32."Norms.DB".N_Date'
    end
    object qNormsN_W_Code: TIntegerField
      FieldName = 'N_W_Code'
      Origin = 'LABOR_WIN32."Norms.DB".N_W_Code'
    end
  end
  object tNorms: TTable
    Active = True
    DatabaseName = 'Labor_WIN32'
    IndexFieldNames = 'N_W_Code;N_Date;N_I_Code'
    TableName = 'Norms.db'
    Left = 312
    Top = 204
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
  object tWorks: TTable
    Active = True
    DatabaseName = 'Labor_WIN32'
    TableName = 'Works.DB'
    Left = 312
    Top = 236
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
    object tWorksW_Side: TIntegerField
      FieldName = 'W_Side'
    end
    object tWorksW_K_Code: TIntegerField
      FieldName = 'W_K_Code'
    end
    object tWorksW_OldCode: TFloatField
      FieldName = 'W_OldCode'
    end
  end
end
