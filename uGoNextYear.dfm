object fGoNextYear: TfGoNextYear
  Left = 265
  Top = 204
  Width = 348
  Height = 255
  Caption = 'fGoNextYear'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object tNorms: TTable
    DatabaseName = 'Labor_WIN32'
    IndexFieldNames = 'N_W_Code;N_Date;N_I_Code'
    TableName = 'Norms.db'
    Left = 56
    Top = 52
    object tNormsN_Date: TDateField
      FieldName = 'N_Date'
    end
    object tNormsN_W_Code: TIntegerField
      FieldName = 'N_W_Code'
    end
    object tNormsN_Code: TAutoIncField
      FieldName = 'N_Code'
      ReadOnly = True
    end
    object tNormsN_I_Code: TIntegerField
      FieldName = 'N_I_Code'
    end
    object tNormsN_Value: TFloatField
      FieldName = 'N_Value'
    end
    object tNormsN_Output: TBooleanField
      FieldName = 'N_Output'
    end
  end
  object tActs: TTable
    DatabaseName = 'Labor_WIN32'
    TableName = 'Acts.db'
    Left = 92
    Top = 52
  end
  object tValues: TTable
    DatabaseName = 'Labor_WIN32'
    TableName = 'Values.db'
    Left = 128
    Top = 52
  end
  object tWorks: TTable
    DatabaseName = 'Labor_WIN32'
    TableName = 'Works.DB'
    Left = 164
    Top = 52
    object tWorksW_Code: TAutoIncField
      FieldName = 'W_Code'
      ReadOnly = True
    end
  end
  object qNorms: TQuery
    DatabaseName = 'Labor_WIN32'
    SQL.Strings = (
      
        'select distinct N_Date from norms where N_W_Code = :MyCode order' +
        ' by N_Date')
    Left = 212
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'MyCode'
        ParamType = ptUnknown
      end>
    object qNormsN_Date: TDateField
      FieldName = 'N_Date'
      Origin = 'LABOR_WIN32."norms.DB".N_Date'
    end
  end
end
