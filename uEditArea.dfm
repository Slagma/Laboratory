object fEditArea: TfEditArea
  Left = 381
  Top = 230
  BorderStyle = bsDialog
  Caption = 'Новый район'
  ClientHeight = 49
  ClientWidth = 296
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
  object eName: TDBEdit
    Left = 16
    Top = 14
    Width = 265
    Height = 21
    DataField = 'A_Name'
    DataSource = fAreas.dsAreas
    TabOrder = 0
  end
  object tAreas: TTable
    Active = True
    DatabaseName = 'Labor_WIN32'
    IndexFieldNames = 'A_Name'
    TableName = 'Areas.db'
    Left = 124
    Top = 4
    object tAreasA_Name: TStringField
      FieldName = 'A_Name'
      Size = 35
    end
  end
end
