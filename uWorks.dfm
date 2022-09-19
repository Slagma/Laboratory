object fWorks: TfWorks
  Left = 131
  Top = 88
  BorderStyle = bsDialog
  Caption = #1057#1087#1080#1089#1086#1082' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1081
  ClientHeight = 407
  ClientWidth = 552
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
    Width = 552
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
    object ToolButton1: TToolButton
      Left = 39
      Top = 0
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 1
      Style = tbsSeparator
    end
    object btnAdd: TToolButton
      Left = 47
      Top = 0
      Cursor = crHandPoint
      Hint = #1053#1086#1074#1086#1077' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1077' (INSERT)'
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
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1077' (ENTER)'
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
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1077' (DELETE)'
      Caption = 'btnDelete'
      ImageIndex = 10
      ParentShowHint = False
      ShowHint = True
      OnClick = btnDeleteClick
    end
    object btnLabel: TToolButton
      Left = 164
      Top = 0
      Cursor = crHandPoint
      Hint = #1055#1086#1084#1077#1090#1080#1090#1100' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1077'/'#1057#1085#1103#1090#1100' '#1087#1086#1084#1077#1090#1082#1091' ('#1055#1056#1054#1041#1045#1051')'
      Caption = 'btnLabel'
      ImageIndex = 15
      ParentShowHint = False
      ShowHint = True
      OnClick = btnLabelClick
    end
    object btnSostav: TToolButton
      Left = 203
      Top = 0
      Cursor = crHandPoint
      Hint = 'C'#1086#1089#1090#1072#1074' '#1089#1090#1086#1095#1085#1099#1093' '#1074#1086#1076' (F5)'
      Caption = 'btnSostav'
      ImageIndex = 14
      ParentShowHint = False
      ShowHint = True
      OnClick = btnSostavClick
    end
    object ToolButton5: TToolButton
      Left = 242
      Top = 0
      Width = 8
      Caption = 'ToolButton5'
      ImageIndex = 11
      Style = tbsSeparator
    end
    object btnSearch: TToolButton
      Left = 250
      Top = 0
      Cursor = crHandPoint
      Hint = #1055#1086#1080#1089#1082' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1103' (F7)'
      Caption = 'btnSearch'
      ImageIndex = 13
      ParentShowHint = False
      ShowHint = True
      OnClick = btnSearchClick
    end
    object ToolButton2: TToolButton
      Left = 289
      Top = 0
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 14
      Style = tbsSeparator
    end
    object btnPrintLabel: TToolButton
      Left = 297
      Top = 0
      Cursor = crHandPoint
      Hint = #1055#1077#1095#1072#1090#1100' '#1086#1090#1084#1077#1095#1077#1085#1085#1099#1093' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1081' (F2)'
      Caption = 'btnPrintLabel'
      ImageIndex = 16
      ParentShowHint = False
      ShowHint = True
      OnClick = btnPrintLabelClick
    end
    object btnPrintMonth: TToolButton
      Left = 336
      Top = 0
      Cursor = crHandPoint
      Hint = #1052#1077#1089#1103#1095#1085#1099#1081' '#1086#1090#1095#1077#1090' (F4)'
      Caption = 'btnPrintMonth'
      DropdownMenu = PrintMenu
      ImageIndex = 17
      ParentShowHint = False
      ShowHint = True
      Style = tbsDropDown
      OnClick = btnPrintMonthClick
    end
    object ToolButton4: TToolButton
      Left = 388
      Top = 0
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 19
      Style = tbsSeparator
    end
    object btnOrder: TToolButton
      Left = 396
      Top = 0
      Cursor = crHandPoint
      Hint = #1042#1099#1073#1088#1072#1090#1100' '#1091#1087#1086#1088#1103#1076#1086#1095#1080#1074#1072#1085#1080#1077' (F9)'
      Caption = 'btnOrder'
      DropdownMenu = PopupMenu
      ImageIndex = 21
      ParentShowHint = False
      ShowHint = True
      Style = tbsDropDown
      OnClick = btnOrderClick
    end
    object ToolButton3: TToolButton
      Left = 448
      Top = 0
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 22
      Style = tbsSeparator
    end
    object btnMega: TToolButton
      Left = 456
      Top = 0
      Cursor = crHandPoint
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' "'#1084#1077#1075#1072#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1081'" (F10)'
      Caption = 'btnMega'
      ImageIndex = 1
      ParentShowHint = False
      ShowHint = True
      OnClick = btnMegaClick
    end
  end
  object grWorks: TDBGrid
    Left = 0
    Top = 77
    Width = 552
    Height = 275
    Align = alClient
    DataSource = dsWorks
    DefaultDrawing = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    PopupMenu = Menu
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clNavy
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    OnDrawColumnCell = grWorksDrawColumnCell
    OnDblClick = btnEditClick
    Columns = <
      item
        Expanded = False
        FieldName = 'W_ShortName'
        Title.Alignment = taCenter
        Title.Caption = #1055#1088#1077#1076#1087#1088#1080#1103#1090#1080#1077
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'W_Otbor'
        Title.Alignment = taCenter
        Title.Caption = #1052#1077#1089#1090#1086' '#1086#1090#1073#1088#1072
        Width = 212
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 352
    Width = 552
    Height = 55
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    object Label2: TLabel
      Left = 8
      Top = 8
      Width = 83
      Height = 13
      Caption = #1055#1088#1077#1076#1087#1088#1080#1103#1090#1080#1077':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 48
      Top = 32
      Width = 41
      Height = 13
      Caption = #1040#1076#1088#1077#1089':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBEdit1: TDBEdit
      Left = 92
      Top = 4
      Width = 453
      Height = 21
      DataField = 'W_FullName'
      DataSource = dsWorks
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 92
      Top = 28
      Width = 453
      Height = 21
      DataField = 'W_Address'
      DataSource = dsWorks
      ReadOnly = True
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 42
    Width = 552
    Height = 35
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 3
    object lbl1: TLabel
      Left = 12
      Top = 11
      Width = 41
      Height = 13
      Caption = #1056#1072#1081#1086#1085':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnChoice1: TSpeedButton
      Left = 232
      Top = 7
      Width = 23
      Height = 22
      Cursor = crHandPoint
      Hint = #1042#1099#1073#1088#1072#1090#1100' '#1088#1072#1081#1086#1085' (F8)'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333333333333333FFF333333333333000333333333
        3333777FFF3FFFFF33330B000300000333337F777F777773F333000E00BFBFB0
        3333777F773333F7F333000E0BFBF0003333777F7F3337773F33000E0FBFBFBF
        0333777F7F3333FF7FFF000E0BFBF0000003777F7F3337777773000E0FBFBFBF
        BFB0777F7F33FFFFFFF7000E0BF000000003777F7FF777777773000000BFB033
        33337777773FF733333333333300033333333333337773333333333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btnChoice1Click
    end
    object lbl2: TLabel
      Left = 268
      Top = 12
      Width = 30
      Height = 13
      Caption = #1050#1053#1057':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object btnKNS: TSpeedButton
      Left = 508
      Top = 8
      Width = 23
      Height = 22
      Cursor = crHandPoint
      Hint = #1042#1099#1073#1088#1072#1090#1100' '#1050#1053#1057
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333333333333333FFF333333333333000333333333
        3333777FFF3FFFFF33330B000300000333337F777F777773F333000E00BFBFB0
        3333777F773333F7F333000E0BFBF0003333777F7F3337773F33000E0FBFBFBF
        0333777F7F3333FF7FFF000E0BFBF0000003777F7F3337777773000E0FBFBFBF
        BFB0777F7F33FFFFFFF7000E0BF000000003777F7FF777777773000000BFB033
        33337777773FF733333333333300033333333333337773333333333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = btnKNSClick
    end
    object Edit1: TEdit
      Left = 56
      Top = 7
      Width = 173
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 0
    end
    object Edit2: TEdit
      Left = 304
      Top = 8
      Width = 201
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 1
      Visible = False
    end
  end
  object tWorks: TTable
    Active = True
    DatabaseName = 'Labor_WIN32'
    IndexFieldNames = 'W_A_Code;W_ShortName;W_Otbor'
    TableName = 'Works.db'
    Left = 434
    Top = 6
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
    object tWorksArea: TStringField
      FieldKind = fkLookup
      FieldName = 'Area'
      LookupDataSet = tAreas
      LookupKeyFields = 'A_Code'
      LookupResultField = 'A_Name'
      KeyFields = 'W_A_Code'
      Size = 35
      Lookup = True
    end
    object tWorksKNS: TStringField
      FieldKind = fkLookup
      FieldName = 'KNS'
      LookupDataSet = tKNS
      LookupKeyFields = 'K_Code'
      LookupResultField = 'K_Name'
      KeyFields = 'W_K_Code'
      Size = 35
      Lookup = True
    end
  end
  object dsWorks: TDataSource
    DataSet = tWorks
    Left = 434
    Top = 30
  end
  object tAreas: TTable
    Active = True
    DatabaseName = 'Labor_WIN32'
    IndexFieldNames = 'A_Name'
    TableName = 'Areas.db'
    Left = 510
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
  object Menu: TPopupMenu
    Left = 316
    Top = 224
    object iAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1077
      OnClick = btnAddClick
    end
    object iEdit: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1077
      OnClick = btnEditClick
    end
    object iDel: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1077
      OnClick = btnDeleteClick
    end
    object iLabel: TMenuItem
      Caption = #1054#1090#1084#1077#1090#1080#1090#1100' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1077'/'#1057#1085#1103#1090#1100' '#1087#1086#1084#1077#1090#1082#1091
      OnClick = btnLabelClick
    end
    object N13: TMenuItem
      Caption = '-'
    end
    object iSostav: TMenuItem
      Caption = #1057#1086#1089#1090#1072#1074' '#1089#1090#1086#1095#1085#1099#1093' '#1074#1086#1076
      OnClick = btnSostavClick
    end
    object N6: TMenuItem
      Caption = '-'
    end
    object iSearch: TMenuItem
      Caption = #1055#1086#1080#1089#1082' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1103
      OnClick = btnSearchClick
    end
    object N8: TMenuItem
      Caption = '-'
    end
    object iPrintLabel: TMenuItem
      Caption = #1055#1077#1095#1072#1090#1100' '#1086#1090#1084#1077#1095#1077#1085#1085#1099#1093' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1081
      OnClick = btnPrintLabelClick
    end
    object iPrintMonth: TMenuItem
      Caption = #1055#1077#1095#1072#1090#1100' '#1084#1077#1089#1103#1095#1085#1086#1075#1086' '#1086#1090#1095#1077#1090#1072
      OnClick = btnPrintMonthClick
    end
    object N11: TMenuItem
      Caption = '-'
    end
    object iClose: TMenuItem
      Caption = #1047#1072#1082#1088#1099#1090#1100' '#1086#1082#1085#1086
      OnClick = btnCloseClick
    end
  end
  object PopupMenu: TPopupMenu
    Left = 396
    Top = 10
    object iArea: TMenuItem
      Caption = #1043#1088#1091#1087#1087#1080#1088#1086#1074#1072#1090#1100' '#1087#1086' '#1088#1072#1081#1086#1085#1072#1084
      Checked = True
      GroupIndex = 1
      RadioItem = True
      OnClick = iAreaClick
    end
    object iSide: TMenuItem
      Caption = #1043#1088#1091#1087#1087#1080#1088#1086#1074#1072#1090#1100' '#1087#1086' '#1073#1077#1088#1077#1075#1072#1084
      GroupIndex = 1
      RadioItem = True
      OnClick = iSideClick
    end
    object iKNS: TMenuItem
      Caption = #1043#1088#1091#1087#1087#1080#1088#1086#1074#1072#1090#1100' '#1087#1086' '#1050#1053#1057
      GroupIndex = 1
      RadioItem = True
      OnClick = iKNSClick
    end
    object iSideKNS: TMenuItem
      Caption = #1043#1088#1091#1087#1087#1080#1088#1086#1074#1072#1090#1100' '#1087#1086' '#1073#1077#1088#1077#1075#1072#1084' '#1080' '#1050#1053#1057
      GroupIndex = 1
      RadioItem = True
      OnClick = iSideKNSClick
    end
  end
  object tKNS: TTable
    Active = True
    DatabaseName = 'Labor_WIN32'
    IndexFieldNames = 'K_Name'
    TableName = 'KNS.db'
    Left = 424
    Top = 104
    object tKNSK_Code: TAutoIncField
      FieldName = 'K_Code'
      ReadOnly = True
    end
    object tKNSK_Name: TStringField
      FieldName = 'K_Name'
      Size = 35
    end
  end
  object PrintMenu: TPopupMenu
    Left = 342
    Top = 8
    object F41: TMenuItem
      Caption = #1052#1077#1089#1103#1095#1085#1099#1081' '#1086#1090#1095#1077#1090' '#1087#1086' '#1076#1072#1090#1072#1084
      OnClick = F41Click
    end
    object N1: TMenuItem
      Caption = #1052#1077#1089#1103#1095#1085#1099#1081' '#1086#1090#1095#1077#1090' '#1087#1086' '#1072#1082#1090#1072#1084
      OnClick = N1Click
    end
  end
end
