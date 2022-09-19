object fChoiceArea: TfChoiceArea
  Left = 333
  Top = 171
  BorderStyle = bsDialog
  Caption = 'Выбор района'
  ClientHeight = 325
  ClientWidth = 342
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
    Width = 342
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
      Hint = 'Выбрать (ENTER)'
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
      Hint = 'Отменить выбор (ESC)'
      Caption = 'btnCancel'
      ImageIndex = 12
      ParentShowHint = False
      ShowHint = True
      OnClick = btnCancelClick
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 42
    Width = 342
    Height = 283
    Align = alClient
    DataSource = dsAreas
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = btnOkClick
    Columns = <
      item
        Expanded = False
        FieldName = 'A_Name'
        Title.Alignment = taCenter
        Title.Caption = 'Название района'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 305
        Visible = True
      end>
  end
  object tAreas: TTable
    Active = True
    DatabaseName = 'Labor_WIN32'
    IndexFieldNames = 'A_Name'
    TableName = 'Areas.db'
    Left = 118
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
    Left = 158
    Top = 6
  end
end
