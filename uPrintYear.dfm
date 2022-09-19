object fPrintYear: TfPrintYear
  Left = 312
  Top = 208
  Width = 335
  Height = 294
  Caption = 'fPrintYear'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 12
    Top = 16
    Width = 300
    Height = 13
    Caption = #1057#1074#1077#1076#1077#1085#1080#1103' '#1086' '#1089#1086#1089#1090#1072#1074#1077' '#1089#1090#1086#1095#1085#1099#1093' '#1074#1086#1076' ('#1076#1083#1103' '#1086#1076#1085#1086#1075#1086' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1103')'
  end
  object tTemp: TTable
    TableName = 'TempSostav'
    TableType = ttParadox
    Left = 18
    Top = 40
  end
  object tIngreds: TTable
    Active = True
    DatabaseName = 'Labor_WIN32'
    IndexFieldNames = 'I_Sorted'
    TableName = 'Ingreds.DB'
    Left = 52
    Top = 40
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
  object tNorms: TTable
    Active = True
    DatabaseName = 'Labor_WIN32'
    IndexFieldNames = 'N_W_Code;N_Date;N_I_Code'
    TableName = 'Norms.db'
    Left = 52
    Top = 72
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
  object tActs: TTable
    Active = True
    DatabaseName = 'Labor_WIN32'
    IndexFieldNames = 'AC_W_Code;AC_Date'
    TableName = 'Acts.db'
    Left = 52
    Top = 104
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
  object tValues: TTable
    Active = True
    DatabaseName = 'Labor_WIN32'
    IndexFieldNames = 'V_AC_Code;V_I_Code'
    TableName = 'Values.db'
    Left = 52
    Top = 136
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
  object tWorks: TTable
    Active = True
    DatabaseName = 'Labor_WIN32'
    IndexFieldNames = 'W_Code'
    TableName = 'Works.DB'
    Left = 52
    Top = 168
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
  object tIngreds2: TTable
    Active = True
    DatabaseName = 'Labor_WIN32'
    IndexFieldNames = 'I_Code'
    TableName = 'Ingreds.DB'
    Left = 92
    Top = 40
    object tIngreds2I_Code: TAutoIncField
      FieldName = 'I_Code'
      ReadOnly = True
    end
    object tIngreds2I_Name: TStringField
      FieldName = 'I_Name'
      Size = 35
    end
    object tIngreds2I_Sorted: TIntegerField
      FieldName = 'I_Sorted'
    end
  end
  object MyExcel: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 192
    Top = 72
  end
  object tFormats: TTable
    Active = True
    DatabaseName = 'Labor_WIN32'
    IndexFieldNames = 'F_I_Code'
    TableName = 'Formats.db'
    Left = 52
    Top = 200
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
  end
  object tTemp2: TTable
    TableName = 'TempSostav'
    TableType = ttParadox
    Left = 18
    Top = 76
  end
  object tActs2: TTable
    Active = True
    DatabaseName = 'Labor_WIN32'
    IndexFieldNames = 'AC_Act'
    TableName = 'Acts.db'
    Left = 86
    Top = 104
    object tActs2AC_Act: TFloatField
      FieldName = 'AC_Act'
    end
    object tActs2AC_Proba: TBooleanField
      FieldName = 'AC_Proba'
    end
  end
end
