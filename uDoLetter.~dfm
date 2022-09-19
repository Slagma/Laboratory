object fDoLetter: TfDoLetter
  Left = 167
  Top = 83
  BorderStyle = bsDialog
  Caption = #1055#1077#1095#1072#1090#1100' '#1087#1080#1089#1100#1084#1072
  ClientHeight = 412
  ClientWidth = 557
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  PopupMenu = PopupMenu
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 557
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
    object btnLetter1: TToolButton
      Left = 47
      Top = 0
      Cursor = crHandPoint
      Hint = #1055#1077#1095#1072#1090#1100' '#1087#1080#1089#1100#1084#1072' ('#1073#1077#1079' '#1085#1086#1088#1084') (F2)'
      Caption = 'btnLetter1'
      ImageIndex = 16
      ParentShowHint = False
      ShowHint = True
      OnClick = btnLetter1Click
    end
    object btnLetter2: TToolButton
      Left = 86
      Top = 0
      Cursor = crHandPoint
      Hint = #1055#1077#1095#1072#1090#1100' '#1087#1080#1089#1100#1084#1072' ('#1089' '#1085#1086#1088#1084#1072#1084#1080') (F4)'
      Caption = 'btnLetter2'
      DropdownMenu = MenuPrint
      ImageIndex = 17
      ParentShowHint = False
      ShowHint = True
      Style = tbsDropDown
      OnClick = btnLetter2Click
    end
    object btnParams: TToolButton
      Left = 140
      Top = 0
      Cursor = crHandPoint
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1087#1072#1088#1072#1084#1077#1090#1088#1086#1074' (F8)'
      Caption = 'btnParams'
      ImageIndex = 20
      ParentShowHint = False
      ShowHint = True
      OnClick = btnParamsClick
    end
  end
  object pName: TPanel
    Left = 0
    Top = 42
    Width = 557
    Height = 31
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    TabOrder = 1
  end
  object Panel2: TPanel
    Left = 0
    Top = 73
    Width = 265
    Height = 339
    Align = alLeft
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    object grWorks: TDBGrid
      Left = 2
      Top = 2
      Width = 261
      Height = 183
      Align = alTop
      DataSource = dsWorks
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
      Columns = <
        item
          Expanded = False
          FieldName = 'W_Otbor'
          Title.Alignment = taCenter
          Title.Caption = #1052#1077#1089#1090#1086' '#1086#1090#1073#1086#1088#1072
          Width = 226
          Visible = True
        end>
    end
    object gr_cdsActs: TDBGrid
      Left = 2
      Top = 185
      Width = 261
      Height = 152
      Hint = #1053#1072#1078#1084#1080' '#1055#1056#1054#1041#1045#1051' '#1076#1083#1103' '#1091#1076#1072#1083#1077#1085#1080#1103' '#1072#1082#1090#1072
      Align = alClient
      DataSource = ds_cdsActs
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = gr_cdsActsDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'Act'
          Title.Alignment = taCenter
          Title.Caption = #8470' '#1072#1082#1090#1072
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 106
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Act_Date'
          Title.Alignment = taCenter
          Title.Caption = #1044#1072#1090#1072' '#1072#1082#1090#1072
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 113
          Visible = True
        end>
    end
  end
  object Panel3: TPanel
    Left = 265
    Top = 73
    Width = 292
    Height = 339
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 3
    object grActs: TDBGrid
      Left = 2
      Top = 2
      Width = 288
      Height = 335
      Hint = #1053#1072#1078#1084#1080' '#1055#1056#1054#1041#1045#1051' '#1076#1083#1103' '#1076#1086#1073#1072#1074#1083#1077#1085#1080#1103' '#1072#1082#1090#1072
      Align = alClient
      DataSource = dsActs
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = grActsDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'AC_Act'
          Title.Alignment = taCenter
          Title.Caption = #8470' '#1072#1082#1090#1072
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 53
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AC_Date'
          Title.Alignment = taCenter
          Title.Caption = #1044#1072#1090#1072
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 61
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AC_Plan'
          Title.Alignment = taCenter
          Title.Caption = #1055#1083#1072#1085
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AC_Proba'
          Title.Alignment = taCenter
          Title.Caption = #1055#1088#1086#1073#1072' '#1086#1090#1086#1073#1088#1072#1085#1072
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Visible = True
        end>
    end
  end
  object tMega: TTable
    Active = True
    DatabaseName = 'Labor_WIN32'
    IndexFieldNames = 'MW_Code'
    TableName = 'MegaWorks.db'
    Left = 24
    Top = 139
    object tMegaMW_Code: TAutoIncField
      FieldName = 'MW_Code'
      ReadOnly = True
    end
    object tMegaMW_Name: TStringField
      FieldName = 'MW_Name'
      Size = 100
    end
    object tMegaMW_Address: TStringField
      FieldName = 'MW_Address'
      Size = 100
    end
  end
  object tWorks: TTable
    Active = True
    DatabaseName = 'Labor_WIN32'
    IndexFieldNames = 'W_MW_Code'
    MasterFields = 'MW_Code'
    MasterSource = dsMega
    TableName = 'Works.DB'
    Left = 120
    Top = 97
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
    object tWorksW_MW_Code: TIntegerField
      FieldName = 'W_MW_Code'
    end
    object tWorksW_Filial: TStringField
      FieldName = 'W_Filial'
      Size = 100
    end
  end
  object dsWorks: TDataSource
    DataSet = tWorks
    Left = 120
    Top = 129
  end
  object dsMega: TDataSource
    DataSet = tMega
    Left = 24
    Top = 169
  end
  object dsActs: TDataSource
    DataSet = tActs
    Left = 337
    Top = 161
  end
  object tActs: TTable
    Active = True
    DatabaseName = 'Labor_WIN32'
    IndexFieldNames = 'AC_W_Code'
    MasterFields = 'W_Code'
    MasterSource = dsWorks
    TableName = 'Acts.db'
    Left = 337
    Top = 129
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
      DisplayValues = #1044#1072';'#1053#1077#1090
    end
    object tActsAC_Proba: TBooleanField
      FieldName = 'AC_Proba'
      DisplayValues = #1044#1072';'#1053#1077#1090
    end
  end
  object PopupMenu: TPopupMenu
    Left = 136
    Top = 177
    object N11: TMenuItem
      Caption = #1055#1077#1095#1072#1090#1100' '#1087#1080#1089#1100#1084#1072' 1'
      OnClick = btnLetter1Click
    end
    object N21: TMenuItem
      Caption = #1055#1077#1095#1072#1090#1100' '#1087#1080#1089#1100#1084#1072' 2'
      OnClick = btnLetter2Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object N2: TMenuItem
      Caption = #1047#1072#1082#1088#1099#1090#1100' '#1086#1082#1085#1086
      OnClick = btnOkClick
    end
  end
  object cdsActs: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'I_Act'
        Fields = 'Act'
        Options = [ixPrimary]
      end>
    IndexFieldNames = 'Act'
    Params = <>
    StoreDefs = True
    Left = 24
    Top = 297
    object cdsActsAct: TFloatField
      FieldName = 'Act'
      KeyFields = 'Act'
    end
    object cdsActsAct_Date: TDateField
      FieldName = 'Act_Date'
    end
  end
  object ds_cdsActs: TDataSource
    DataSet = cdsActs
    Left = 24
    Top = 329
  end
  object ExcelLetter1: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 481
    Top = 9
  end
  object tIngreds: TTable
    Active = True
    DatabaseName = 'Labor_WIN32'
    IndexFieldNames = 'I_Sorted'
    TableName = 'Ingreds.DB'
    Left = 80
    Top = 289
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
    object tIngredsI_IsPH: TBooleanField
      FieldName = 'I_IsPH'
    end
    object tIngredsI_HowOutput: TStringField
      FieldName = 'I_HowOutput'
      Size = 50
    end
    object tIngredsI_HowOutput2: TStringField
      FieldName = 'I_HowOutput2'
      Size = 10
    end
    object tIngredsI_HowRegistr: TBooleanField
      FieldName = 'I_HowRegistr'
    end
    object tIngredsI_EdIzm: TStringField
      FieldName = 'I_EdIzm'
      Size = 10
    end
    object tIngredsI_EdIzm2: TStringField
      FieldName = 'I_EdIzm2'
      Size = 5
    end
    object tIngredsI_EdRegistr: TBooleanField
      FieldName = 'I_EdRegistr'
    end
    object tIngredsDocument: TStringField
      FieldName = 'Document'
      Size = 35
    end
    object tIngredsStarlet: TBooleanField
      FieldName = 'Starlet'
    end
  end
  object tWorkActs: TTable
    Active = True
    DatabaseName = 'Labor_WIN32'
    IndexFieldNames = 'AC_Act;AC_Date'
    TableName = 'Acts.db'
    Left = 112
    Top = 289
    object tWorkActsAC_Code: TAutoIncField
      FieldName = 'AC_Code'
      ReadOnly = True
    end
    object tWorkActsAC_Act: TFloatField
      FieldName = 'AC_Act'
    end
    object tWorkActsAC_Date: TDateField
      FieldName = 'AC_Date'
    end
    object tWorkActsAC_W_Code: TIntegerField
      FieldName = 'AC_W_Code'
    end
  end
  object cdsLetter1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 144
    Top = 289
  end
  object tValues: TTable
    Active = True
    DatabaseName = 'Labor_WIN32'
    IndexFieldNames = 'V_AC_Code;V_I_Code'
    TableName = 'Values.db'
    Left = 176
    Top = 289
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
  object tFormats: TTable
    Active = True
    DatabaseName = 'Labor_WIN32'
    IndexFieldNames = 'F_I_Code'
    TableName = 'Formats.db'
    Left = 208
    Top = 289
    object tFormatsF_I_Code: TIntegerField
      FieldName = 'F_I_Code'
    end
    object tFormatsF_All: TIntegerField
      FieldName = 'F_All'
    end
    object tFormatsF_Posle: TIntegerField
      FieldName = 'F_Posle'
    end
  end
  object tWorksWorks: TTable
    Active = True
    DatabaseName = 'Labor_WIN32'
    IndexFieldNames = 'W_Code'
    TableName = 'Works.DB'
    Left = 112
    Top = 321
    object tWorksWorksW_Otbor: TStringField
      FieldName = 'W_Otbor'
      Size = 35
    end
    object tWorksWorksW_Filial: TStringField
      FieldName = 'W_Filial'
      Size = 100
    end
    object tWorksWorksW_Code: TAutoIncField
      FieldName = 'W_Code'
      ReadOnly = True
    end
  end
  object tNorms: TTable
    Active = True
    DatabaseName = 'Labor_WIN32'
    IndexFieldNames = 'N_W_Code;N_Date;N_I_Code'
    TableName = 'Norms.db'
    Left = 204
    Top = 365
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
  object qNorms: TQuery
    DatabaseName = 'Labor_WIN32'
    SQL.Strings = (
      'select distinct N_Date from norms'
      'where n_w_code=:MyCode and N_Date <= :MyDate'
      'order by n_date')
    Left = 168
    Top = 365
    ParamData = <
      item
        DataType = ftInteger
        Name = 'MyCode'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'MyDate'
        ParamType = ptInput
      end>
    object qNormsN_Date: TDateField
      FieldName = 'N_Date'
      Origin = 'LABOR_WIN32."Norms.DB".N_Date'
    end
  end
  object MenuPrint: TPopupMenu
    Left = 200
    Top = 8
    object N3: TMenuItem
      Caption = #1055#1077#1095#1072#1090#1100' '#1087#1080#1089#1100#1084#1072' '#1089' '#1085#1086#1088#1084#1072#1084#1080' '#1087#1086' '#1087#1088#1077#1074#1099#1096#1077#1085#1080#1103#1084
      OnClick = N3Click
    end
    object N4: TMenuItem
      Caption = #1055#1077#1095#1072#1090#1100' '#1087#1080#1089#1100#1084#1072' '#1089' '#1085#1086#1088#1084#1072#1084#1080
      OnClick = N4Click
    end
  end
end
