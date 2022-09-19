object fMagazins: TfMagazins
  Left = 216
  Top = 133
  BorderStyle = bsDialog
  Caption = #1056#1072#1073#1086#1090#1072' '#1089' '#1078#1091#1088#1085#1072#1083#1072#1084#1080
  ClientHeight = 469
  ClientWidth = 606
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
    Width = 606
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
    object btnClose: TToolButton
      Left = 0
      Top = 0
      Cursor = crHandPoint
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1086#1082#1085#1086' (ESC)'
      Caption = 'btnClose'
      ImageIndex = 11
      ParentShowHint = False
      ShowHint = True
      OnClick = btnCloseClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 42
    Width = 303
    Height = 427
    Align = alLeft
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object ToolBar2: TToolBar
      Left = 2
      Top = 33
      Width = 299
      Height = 42
      AutoSize = True
      ButtonHeight = 38
      ButtonWidth = 39
      Caption = 'ToolBar2'
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      Flat = True
      HotImages = fDm.HotImages
      Images = fDm.Images
      TabOrder = 1
      object btnAddMag: TToolButton
        Left = 0
        Top = 0
        Cursor = crHandPoint
        Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1078#1091#1088#1085#1072#1083' (INSERT)'
        Caption = 'btnAddMag'
        ImageIndex = 8
        ParentShowHint = False
        ShowHint = True
        OnClick = btnAddMagClick
      end
      object btnEditMag: TToolButton
        Left = 39
        Top = 0
        Cursor = crHandPoint
        Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1078#1091#1088#1085#1072#1083' (ENTER)'
        Caption = 'btnEditMag'
        ImageIndex = 9
        ParentShowHint = False
        ShowHint = True
        OnClick = btnEditMagClick
      end
      object btnDelMag: TToolButton
        Left = 78
        Top = 0
        Cursor = crHandPoint
        Hint = #1059#1076#1072#1083#1080#1090#1100' '#1078#1091#1088#1085#1072#1083' (DELETE)'
        Caption = 'btnDelMag'
        ImageIndex = 10
        ParentShowHint = False
        Wrap = True
        ShowHint = True
        OnClick = btnDelMagClick
      end
    end
    object grMags: TDBGrid
      Left = 2
      Top = 75
      Width = 299
      Height = 350
      Align = alLeft
      DataSource = dsMags
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      PopupMenu = MenuMag
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = grMagsCellClick
      OnDblClick = btnEditMagClick
      OnEnter = grMagsEnter
      OnKeyUp = grMagsKeyUp
      Columns = <
        item
          Expanded = False
          FieldName = 'M_Name'
          Title.Alignment = taCenter
          Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1078#1091#1088#1085#1072#1083#1072
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 258
          Visible = True
        end>
    end
    object Panel4: TPanel
      Left = 2
      Top = 2
      Width = 299
      Height = 31
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Caption = #1046#1059#1056#1053#1040#1051#1067
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
      TabOrder = 2
    end
  end
  object Panel2: TPanel
    Left = 303
    Top = 42
    Width = 303
    Height = 427
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    object ToolBar3: TToolBar
      Left = 2
      Top = 33
      Width = 299
      Height = 42
      AutoSize = True
      ButtonHeight = 38
      ButtonWidth = 39
      Caption = 'ToolBar3'
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      Flat = True
      HotImages = fDm.HotImages
      Images = fDm.Images
      TabOrder = 0
      object btnAddIngr: TToolButton
        Left = 0
        Top = 0
        Cursor = crHandPoint
        Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1080#1085#1075#1088#1077#1076#1080#1077#1085#1090' (F2)'
        Caption = 'btnAddIngr'
        ImageIndex = 8
        ParentShowHint = False
        ShowHint = True
        OnClick = btnAddIngrClick
      end
      object btnDelIngr: TToolButton
        Left = 39
        Top = 0
        Cursor = crHandPoint
        Hint = #1059#1076#1072#1083#1080#1090#1100' '#1080#1085#1075#1088#1077#1076#1080#1077#1085#1090' (DELETE)'
        Caption = 'btnDelIngr'
        ImageIndex = 10
        ParentShowHint = False
        ShowHint = True
        OnClick = btnDelIngrClick
      end
    end
    object grIngrs: TDBGrid
      Left = 2
      Top = 75
      Width = 299
      Height = 350
      Align = alClient
      DataSource = dsIngrs
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      PopupMenu = MenuIngr
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'i_name'
          Title.Alignment = taCenter
          Title.Caption = #1048#1085#1075#1088#1077#1076#1080#1077#1085#1090
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clNavy
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 261
          Visible = True
        end>
    end
    object Panel3: TPanel
      Left = 2
      Top = 2
      Width = 299
      Height = 31
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Caption = #1048#1053#1043#1056#1045#1044#1048#1045#1053#1058#1067
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
      TabOrder = 2
    end
  end
  object tMags: TTable
    Active = True
    DatabaseName = 'Labor_WIN32'
    IndexFieldNames = 'M_Name'
    TableName = 'Magazins.db'
    Left = 104
    Top = 166
    object tMagsM_Code: TAutoIncField
      FieldName = 'M_Code'
      ReadOnly = True
    end
    object tMagsM_Name: TStringField
      FieldName = 'M_Name'
      Size = 35
    end
  end
  object dsMags: TDataSource
    DataSet = tMags
    Left = 104
    Top = 202
  end
  object MenuMag: TPopupMenu
    Left = 172
    Top = 166
    object iAddMag: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1078#1091#1088#1085#1072#1083
      OnClick = btnAddMagClick
    end
    object iEditMag: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1078#1091#1088#1085#1072#1083
      OnClick = btnEditMagClick
    end
    object iDelMag: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1078#1091#1088#1085#1072#1083
      OnClick = btnDelMagClick
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object iCloseMag: TMenuItem
      Caption = #1047#1072#1082#1088#1099#1090#1100' '#1086#1082#1085#1086
      OnClick = btnCloseClick
    end
  end
  object MenuIngr: TPopupMenu
    Left = 335
    Top = 170
    object iAddIngr: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1080#1085#1075#1088#1077#1076#1080#1077#1085#1090
      OnClick = btnAddIngrClick
    end
    object iDelIngr: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1080#1085#1075#1088#1077#1076#1080#1077#1085#1090
      OnClick = btnDelIngrClick
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object iCloseIngr: TMenuItem
      Caption = #1047#1072#1082#1088#1099#1090#1100' '#1086#1082#1085#1086
      OnClick = btnCloseClick
    end
  end
  object tIngrs: TQuery
    DatabaseName = 'Labor_WIN32'
    SQL.Strings = (
      'select i.I_code, i.i_name, i_Sorted'
      'from Mags_Ingreds mi, ingreds i'
      'where mi.mi_m_code = :MyMag and'
      '      mi.mi_i_code = i.i_code'
      'order by i.i_Sorted')
    Left = 411
    Top = 170
    ParamData = <
      item
        DataType = ftInteger
        Name = 'MyMag'
        ParamType = ptUnknown
      end>
    object tIngrsI_code: TIntegerField
      FieldName = 'I_code'
      Origin = 'LABOR_WIN32."Ingreds.DB".I_Code'
    end
    object tIngrsi_name: TStringField
      FieldName = 'i_name'
      Origin = 'LABOR_WIN32."Ingreds.DB".I_Name'
      Size = 35
    end
  end
  object dsIngrs: TDataSource
    DataSet = tIngrs
    Left = 411
    Top = 206
  end
  object tMI: TTable
    DatabaseName = 'Labor_WIN32'
    IndexFieldNames = 'MI_M_Code;MI_I_Code'
    TableName = 'Mags_Ingreds.db'
    Left = 491
    Top = 178
    object tMIMI_M_Code: TIntegerField
      FieldName = 'MI_M_Code'
    end
    object tMIMI_I_Code: TIntegerField
      FieldName = 'MI_I_Code'
    end
  end
end
