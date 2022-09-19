object fChoiceKNS: TfChoiceKNS
  Left = 382
  Top = 185
  BorderStyle = bsDialog
  Caption = 'Выбор КНС'
  ClientHeight = 359
  ClientWidth = 389
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
    Width = 389
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
    Width = 389
    Height = 317
    Align = alClient
    DataSource = dsKNS
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
        FieldName = 'K_Name'
        Title.Alignment = taCenter
        Title.Caption = 'Название КНС'
        Width = 351
        Visible = True
      end>
  end
  object tKNS: TTable
    Active = True
    DatabaseName = 'Labor_WIN32'
    IndexFieldNames = 'K_Name'
    TableName = 'KNS.db'
    Left = 222
    Top = 10
    object tKNSK_Code: TAutoIncField
      FieldName = 'K_Code'
      ReadOnly = True
    end
    object tKNSK_Name: TStringField
      FieldName = 'K_Name'
      Size = 35
    end
  end
  object dsKNS: TDataSource
    DataSet = tKNS
    Left = 254
    Top = 10
  end
end
