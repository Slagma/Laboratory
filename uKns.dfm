object fKns: TfKns
  Left = 292
  Top = 125
  BorderStyle = bsDialog
  Caption = 'Список КНС'
  ClientHeight = 399
  ClientWidth = 434
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
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 434
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
      Hint = 'Закрыть окно (ESC)'
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
    object btnAdd: TToolButton
      Left = 47
      Top = 0
      Cursor = crHandPoint
      Hint = 'Добавить КНС (INSERT)'
      Caption = 'btnAdd'
      ImageIndex = 8
      ParentShowHint = False
      ShowHint = True
      OnClick = btnAddClick
    end
    object btnEdit: TToolButton
      Left = 86
      Top = 0
      Cursor = crHandPoint
      Hint = 'Редактировать КНС (ENTER)'
      Caption = 'btnEdit'
      ImageIndex = 9
      ParentShowHint = False
      ShowHint = True
      OnClick = btnEditClick
    end
    object btnDelete: TToolButton
      Left = 125
      Top = 0
      Cursor = crHandPoint
      Hint = 'Удалить КНС (DELETE)'
      Caption = 'btnDelete'
      ImageIndex = 10
      ParentShowHint = False
      ShowHint = True
      OnClick = btnDeleteClick
    end
  end
  object DBGrid: TDBGrid
    Left = 0
    Top = 42
    Width = 434
    Height = 357
    Align = alClient
    DataSource = dsKNS
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = btnEditClick
    Columns = <
      item
        Expanded = False
        FieldName = 'K_Name'
        Title.Alignment = taCenter
        Title.Caption = 'Название КНС'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 397
        Visible = True
      end>
  end
  object tKNS: TTable
    Active = True
    DatabaseName = 'Labor_WIN32'
    IndexFieldNames = 'K_Name'
    TableName = 'KNS.db'
    Left = 198
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
    Left = 238
    Top = 10
  end
  object Popup: TPopupMenu
    Left = 278
    Top = 10
    object N1: TMenuItem
      Caption = 'Добавить КНС'
      OnClick = btnAddClick
    end
    object N2: TMenuItem
      Caption = 'Редактировать КНС'
      OnClick = btnEditClick
    end
    object N3: TMenuItem
      Caption = 'Удалить КНС'
      OnClick = btnDeleteClick
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object N5: TMenuItem
      Caption = 'Закрыть окно'
      OnClick = btnOkClick
    end
  end
  object tWorks: TTable
    DatabaseName = 'Labor_WIN32'
    TableName = 'Works.DB'
    Left = 358
    Top = 10
    object tWorksW_K_Code: TIntegerField
      FieldName = 'W_K_Code'
    end
  end
end
