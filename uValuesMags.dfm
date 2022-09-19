object fValuesMags: TfValuesMags
  Left = 469
  Top = 199
  BorderStyle = bsDialog
  Caption = #1042#1074#1086#1076' '#1079#1085#1072#1095#1077#1085#1080#1081
  ClientHeight = 420
  ClientWidth = 400
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
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 400
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
    object btnChoiceMag: TToolButton
      Left = 47
      Top = 0
      Cursor = crHandPoint
      Hint = #1042#1099#1073#1086#1088' '#1078#1091#1088#1085#1072#1083#1072' (F7)'
      Caption = 'btnChoiceMag'
      ImageIndex = 1
      ParentShowHint = False
      ShowHint = True
      OnClick = btnChoiceMagClick
    end
    object btnChoiceAct: TToolButton
      Left = 86
      Top = 0
      Cursor = crHandPoint
      Hint = #1042#1099#1073#1086#1088' '#1072#1082#1090#1072' (F8)'
      Caption = 'btnChoiceAct'
      ImageIndex = 18
      ParentShowHint = False
      ShowHint = True
      OnClick = btnChoiceActClick
    end
    object ToolButton5: TToolButton
      Left = 125
      Top = 0
      Width = 8
      Caption = 'ToolButton5'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object btnEdit: TToolButton
      Left = 133
      Top = 0
      Cursor = crHandPoint
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1079#1085#1072#1095#1077#1085#1080#1077' (ENTER)'
      Caption = 'btnEdit'
      ImageIndex = 9
      ParentShowHint = False
      ShowHint = True
      OnClick = btnEditClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 127
    Width = 400
    Height = 293
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object grTempValues: TDBGrid
      Left = 2
      Top = 2
      Width = 396
      Height = 289
      Align = alClient
      DataSource = dsTempValues
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'TV_I_Name'
          Title.Alignment = taCenter
          Title.Caption = #1048#1085#1075#1088#1077#1076#1080#1077#1085#1090
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 197
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TV_Norma'
          Title.Alignment = taCenter
          Title.Caption = #1053#1086#1088#1084#1072
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 78
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TV_Value'
          Title.Alignment = taCenter
          Title.Caption = #1047#1085#1072#1095#1077#1085#1080#1077
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 79
          Visible = True
        end>
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 42
    Width = 400
    Height = 31
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    object Label1: TLabel
      Left = 14
      Top = 7
      Width = 51
      Height = 13
      Caption = #1046#1091#1088#1085#1072#1083':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 168
      Top = 7
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
    object Label3: TLabel
      Left = 280
      Top = 7
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
    object DBEdit3: TDBEdit
      Left = 68
      Top = 4
      Width = 97
      Height = 21
      DataField = 'M_Name'
      DataSource = dsMagazins
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit4: TDBEdit
      Left = 208
      Top = 4
      Width = 69
      Height = 21
      DataField = 'AC_Act'
      DataSource = dsActs
      ReadOnly = True
      TabOrder = 1
    end
    object DBEdit5: TDBEdit
      Left = 296
      Top = 4
      Width = 97
      Height = 21
      DataField = 'AC_Date'
      DataSource = dsActs
      ReadOnly = True
      TabOrder = 2
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 73
    Width = 400
    Height = 54
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 3
    object Label4: TLabel
      Left = 14
      Top = 7
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
      Left = 10
      Top = 31
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
      Left = 100
      Top = 4
      Width = 293
      Height = 21
      DataField = 'W_ShortName'
      DataSource = dsWorks
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 100
      Top = 28
      Width = 293
      Height = 21
      DataField = 'W_Otbor'
      DataSource = dsWorks
      ReadOnly = True
      TabOrder = 1
    end
  end
  object Menu: TPopupMenu
    Left = 244
    Top = 8
    object F71: TMenuItem
      Caption = #1042#1099#1073#1086#1088' '#1078#1091#1088#1085#1072#1083#1072' (F7)'
      OnClick = btnChoiceMagClick
    end
    object F81: TMenuItem
      Caption = #1042#1099#1073#1086#1088' '#1072#1082#1090#1072' (F8)'
      OnClick = btnChoiceActClick
    end
    object ENTER1: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1079#1085#1072#1095#1077#1085#1080#1077' (ENTER)'
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object N2: TMenuItem
      Caption = #1047#1072#1082#1088#1099#1090#1100' '#1086#1082#1085#1086
      OnClick = N2Click
    end
  end
  object tWorks: TTable
    Active = True
    DatabaseName = 'Labor_WIN32'
    IndexFieldNames = 'W_Code'
    MasterFields = 'AC_W_Code'
    MasterSource = dsActs
    TableName = 'Works.DB'
    Left = 320
    Top = 204
    object tWorksW_Code: TAutoIncField
      FieldName = 'W_Code'
      ReadOnly = True
    end
    object tWorksW_ShortName: TStringField
      FieldName = 'W_ShortName'
      Size = 50
    end
    object tWorksW_Otbor: TStringField
      FieldName = 'W_Otbor'
      Size = 35
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
    Left = 104
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
    Left = 136
    Top = 184
  end
  object tActs: TTable
    Active = True
    DatabaseName = 'Labor_WIN32'
    IndexFieldNames = 'AC_Code'
    TableName = 'Acts.db'
    Left = 320
    Top = 236
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
  object tMagazins: TTable
    Active = True
    DatabaseName = 'Labor_WIN32'
    IndexFieldNames = 'M_Code'
    TableName = 'Magazins.db'
    Left = 320
    Top = 268
    object tMagazinsM_Code: TAutoIncField
      FieldName = 'M_Code'
      ReadOnly = True
    end
    object tMagazinsM_Name: TStringField
      FieldName = 'M_Name'
      Size = 35
    end
  end
  object tMagsIngreds: TTable
    Active = True
    DatabaseName = 'Labor_WIN32'
    IndexFieldNames = 'MI_M_Code'
    MasterFields = 'M_Code'
    MasterSource = dsMagazins
    TableName = 'Mags_Ingreds.db'
    Left = 320
    Top = 300
    object tMagsIngredsMI_M_Code: TIntegerField
      FieldName = 'MI_M_Code'
    end
    object tMagsIngredsMI_I_Code: TIntegerField
      FieldName = 'MI_I_Code'
    end
  end
  object tIngreds: TTable
    Active = True
    DatabaseName = 'Labor_WIN32'
    IndexFieldNames = 'I_Code'
    TableName = 'Ingreds.DB'
    Left = 320
    Top = 172
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
  object dsMagazins: TDataSource
    DataSet = tMagazins
    Left = 356
    Top = 268
  end
  object dsWorks: TDataSource
    DataSet = tWorks
    Left = 356
    Top = 204
  end
  object dsActs: TDataSource
    DataSet = tActs
    Left = 356
    Top = 236
  end
  object tValues: TTable
    Active = True
    DatabaseName = 'Labor_WIN32'
    IndexFieldNames = 'V_AC_Code;V_I_Code'
    TableName = 'Values.db'
    Left = 320
    Top = 332
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
  object qNorms: TQuery
    DatabaseName = 'Labor_WIN32'
    SQL.Strings = (
      'select distinct N_W_Code, N_Date from norms'
      'where n_w_code = :MyCode and n_date <= :MyDate')
    Left = 104
    Top = 216
    ParamData = <
      item
        DataType = ftUnknown
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
  end
  object tNorms: TTable
    Active = True
    DatabaseName = 'Labor_WIN32'
    IndexFieldNames = 'N_W_Code;N_Date;N_I_Code'
    TableName = 'Norms.db'
    Left = 104
    Top = 248
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
  end
end
