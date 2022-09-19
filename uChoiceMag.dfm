object fChoiceMag: TfChoiceMag
  Left = 322
  Top = 234
  BorderStyle = bsDialog
  Caption = #1042#1099#1073#1086#1088' '#1078#1091#1088#1085#1072#1083#1072
  ClientHeight = 327
  ClientWidth = 431
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
    Width = 431
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
      Hint = #1042#1099#1073#1088#1072#1090#1100' '#1078#1091#1088#1085#1072#1083' (ENTER)'
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
      Hint = #1054#1090#1084#1077#1085#1072' '#1074#1099#1073#1086#1088#1072' (ESC)'
      Caption = 'btnCancel'
      ImageIndex = 12
      ParentShowHint = False
      ShowHint = True
      OnClick = btnCancelClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 42
    Width = 205
    Height = 285
    Align = alLeft
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 2
      Top = 2
      Width = 201
      Height = 281
      Align = alClient
      DataSource = dsMagazins
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
      OnDblClick = DBGrid1DblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'M_Name'
          Title.Alignment = taCenter
          Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1093#1091#1088#1085#1072#1083#1072
          Width = 165
          Visible = True
        end>
    end
  end
  object Panel2: TPanel
    Left = 205
    Top = 42
    Width = 226
    Height = 285
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    object DBGrid2: TDBGrid
      Left = 2
      Top = 2
      Width = 222
      Height = 281
      TabStop = False
      Align = alClient
      DataSource = dsMagsIngreds
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
          FieldName = 'Ingreds'
          Title.Alignment = taCenter
          Title.Caption = #1048#1085#1075#1088#1077#1076#1080#1077#1085#1090
          Width = 185
          Visible = True
        end>
    end
  end
  object dsMagazins: TDataSource
    DataSet = tMagazins
    Left = 100
    Top = 104
  end
  object dsMagsIngreds: TDataSource
    DataSet = tMagsIngreds
    Left = 280
    Top = 160
  end
  object tMagazins: TTable
    Active = True
    DatabaseName = 'Labor_WIN32'
    IndexFieldNames = 'M_Name'
    ReadOnly = True
    TableName = 'Magazins.db'
    Left = 100
    Top = 72
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
    ReadOnly = True
    TableName = 'Mags_Ingreds.db'
    Left = 280
    Top = 128
    object tMagsIngredsMI_M_Code: TIntegerField
      FieldName = 'MI_M_Code'
    end
    object tMagsIngredsMI_I_Code: TIntegerField
      FieldName = 'MI_I_Code'
    end
    object tMagsIngredsIngreds: TStringField
      FieldKind = fkLookup
      FieldName = 'Ingreds'
      LookupDataSet = tIngreds
      LookupKeyFields = 'I_Code'
      LookupResultField = 'I_Name'
      KeyFields = 'MI_I_Code'
      Size = 35
      Lookup = True
    end
  end
  object tIngreds: TTable
    Active = True
    DatabaseName = 'Labor_WIN32'
    TableName = 'Ingreds.DB'
    Left = 316
    Top = 128
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
end
