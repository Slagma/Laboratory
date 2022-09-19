object fMain: TfMain
  Left = 27
  Top = 166
  BorderStyle = bsDialog
  Caption = #1051#1072#1073#1086#1088#1072#1090#1086#1088#1080#1103' '#1089#1090#1086#1095#1085#1099#1093' '#1074#1086#1076' v2.0'
  ClientHeight = 90
  ClientWidth = 751
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar: TToolBar
    Left = 0
    Top = 0
    Width = 751
    Height = 56
    AutoSize = True
    ButtonHeight = 52
    ButtonWidth = 78
    Caption = 'ToolBar'
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    HotImages = fDm.HotImages
    Images = fDm.Images
    ParentFont = False
    ShowCaptions = True
    TabOrder = 0
    Transparent = True
    object btnClose: TToolButton
      Left = 0
      Top = 0
      Cursor = crHandPoint
      Hint = #1042#1099#1081#1090#1080' '#1080#1079' '#1087#1088#1086#1075#1088#1072#1084#1084#1099' (ESC)'
      Caption = #1042#1099#1093#1086#1076
      ImageIndex = 0
      ParentShowHint = False
      ShowHint = True
      OnClick = btnCloseClick
    end
    object ToolButton1: TToolButton
      Left = 78
      Top = 0
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 1
      Style = tbsSeparator
    end
    object btnWorks: TToolButton
      Left = 86
      Top = 0
      Cursor = crHandPoint
      Hint = #1057#1087#1080#1089#1086#1082' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1081' (F2)'
      Caption = #1055#1088#1077#1076#1087#1088#1080#1103#1090#1080#1103
      ImageIndex = 1
      ParentShowHint = False
      ShowHint = True
      OnClick = btnWorksClick
    end
    object btnActs: TToolButton
      Left = 164
      Top = 0
      Cursor = crHandPoint
      Hint = #1042#1074#1086#1076' '#1072#1082#1090#1086#1074' (F3)'
      Caption = #1040#1082#1090#1099
      ImageIndex = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btnActsClick
    end
    object btnValues: TToolButton
      Left = 242
      Top = 0
      Cursor = crHandPoint
      Hint = #1042#1074#1086#1076' '#1079#1085#1072#1095#1077#1085#1080#1081' (F4)'
      Caption = #1047#1085#1072#1095#1077#1085#1080#1103
      ImageIndex = 3
      ParentShowHint = False
      ShowHint = True
      OnClick = btnValuesClick
    end
    object btnMiscs: TToolButton
      Left = 320
      Top = 0
      Cursor = crHandPoint
      Hint = #1056#1072#1079#1085#1086#1077'... (F5)'
      Caption = #1056#1072#1079#1085#1086#1077'...'
      DropdownMenu = MiscsMenu
      ImageIndex = 4
      ParentShowHint = False
      ShowHint = True
      Style = tbsDropDown
      OnClick = btnMiscsClick
    end
    object ToolButton2: TToolButton
      Left = 413
      Top = 0
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object btnSave: TToolButton
      Left = 421
      Top = 0
      Cursor = crHandPoint
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1041#1044' (F6)'
      Caption = #1047#1072#1087#1080#1089#1072#1090#1100
      ImageIndex = 5
      ParentShowHint = False
      ShowHint = True
      OnClick = btnSaveClick
    end
    object btnRestore: TToolButton
      Left = 499
      Top = 0
      Cursor = crHandPoint
      Hint = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1041#1044' (F7)'
      Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1080#1090#1100
      ImageIndex = 6
      ParentShowHint = False
      ShowHint = True
      OnClick = btnRestoreClick
    end
    object ToolButton6: TToolButton
      Left = 577
      Top = 0
      Width = 8
      Caption = 'ToolButton6'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object btnInfo: TToolButton
      Left = 585
      Top = 0
      Cursor = crHandPoint
      Hint = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077'... (F12)'
      Caption = #1048#1085#1092'-'#1094#1080#1103
      ImageIndex = 7
      ParentShowHint = False
      ShowHint = True
      OnClick = btnInfoClick
    end
  end
  object MiscsMenu: TPopupMenu
    Left = 370
    Top = 6
    object iNorms: TMenuItem
      Caption = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072' '#1085#1086#1088#1084
      OnClick = iNormsClick
    end
    object iAreas: TMenuItem
      Caption = #1057#1087#1080#1089#1086#1082' '#1088#1072#1081#1086#1085#1086#1074
      OnClick = iAreasClick
    end
    object iIngreds: TMenuItem
      Caption = #1057#1087#1080#1089#1086#1082' '#1080#1085#1075#1088#1077#1076#1080#1077#1085#1090#1086#1074
      OnClick = iIngredsClick
    end
    object iMagazins: TMenuItem
      Caption = #1056#1072#1073#1086#1090#1072' '#1089' '#1078#1091#1088#1085#1072#1083#1072#1084#1080
      OnClick = iMagazinsClick
    end
    object N1: TMenuItem
      Caption = #1057#1087#1080#1089#1086#1082' '#1050#1053#1057
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1092#1086#1088#1084#1099
      OnClick = N2Click
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object iNextYear: TMenuItem
      Caption = #1055#1077#1088#1077#1093#1086#1076' '#1085#1072' '#1089#1083#1077#1076#1091#1102#1097#1080#1081' '#1075#1086#1076
      OnClick = iNextYearClick
    end
    object iCurrentYear: TMenuItem
      Caption = #1057#1076#1077#1083#1072#1090#1100' '#1090#1077#1082#1091#1097#1080#1084' '#1075#1086#1076'...'
      OnClick = iCurrentYearClick
    end
    object iReturnWork: TMenuItem
      Caption = #1042#1086#1079#1074#1088#1072#1090' '#1082' '#1088#1072#1073#1086#1095#1077#1084#1091' '#1075#1086#1076#1091'...'
      OnClick = iReturnWorkClick
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object iRemont: TMenuItem
      Caption = #1056#1077#1084#1086#1085#1090' '#1041#1044
      OnClick = iRemontClick
    end
  end
  object tNorms: TTable
    DatabaseName = 'Labor_WIN32'
    TableName = 'Norms.db'
    Left = 112
    Top = 8
    object tNormsN_Date: TDateField
      FieldName = 'N_Date'
    end
  end
  object Table: TTable
    DatabaseName = 'Labor_WIN32'
    Exclusive = True
    TableName = 'Areas.db'
    Left = 200
    Top = 16
  end
end
