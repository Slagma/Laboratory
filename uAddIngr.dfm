object fAddIngr: TfAddIngr
  Left = 305
  Top = 151
  BorderStyle = bsDialog
  Caption = 'fAddIngr'
  ClientHeight = 369
  ClientWidth = 358
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
    Width = 358
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
      Hint = 'Выбрать ингредиент (ENTER)'
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
      Hint = 'Отменить выбор ингредиента (ESC)'
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
    Width = 358
    Height = 327
    Align = alClient
    DataSource = dsIngrs
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
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
        FieldName = 'i_name'
        Title.Alignment = taCenter
        Title.Caption = 'Ингредиент'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 320
        Visible = True
      end>
  end
  object tIngrs: TQuery
    DatabaseName = 'Labor_WIN32'
    SQL.Strings = (
      'select I_code, i_name'
      'from ingreds i'
      'where i_code not in (select mi_i_code from mags_ingreds)')
    Left = 126
    Top = 6
    object tIngrsI_code: TIntegerField
      FieldName = 'I_code'
      Origin = 'LABOR_WIN32."ingreds.DB".I_Code'
    end
    object tIngrsi_name: TStringField
      FieldName = 'i_name'
      Origin = 'LABOR_WIN32."ingreds.DB".I_Name'
      Size = 35
    end
  end
  object dsIngrs: TDataSource
    DataSet = tIngrs
    Left = 166
    Top = 6
  end
end
