object fEditAct: TfEditAct
  Left = 209
  Top = 179
  BorderStyle = bsDialog
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1072#1082#1090#1072
  ClientHeight = 296
  ClientWidth = 396
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
    Width = 396
    Height = 42
    AutoSize = True
    ButtonHeight = 38
    ButtonWidth = 39
    Caption = 'ToolBar1'
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    Flat = True
    HotImages = fDm.HotImages
    Images = fDm.Images
    TabOrder = 1
    object btnOk: TToolButton
      Left = 0
      Top = 0
      Cursor = crHandPoint
      Hint = #1047#1072#1087#1080#1089#1072#1090#1100' (ENTER)'
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
      Hint = #1054#1090#1084#1077#1085#1080#1090#1100' (ESC)'
      Caption = 'btnCancel'
      ImageIndex = 12
      ParentShowHint = False
      ShowHint = True
      OnClick = btnCancelClick
    end
    object ToolButton1: TToolButton
      Left = 78
      Top = 0
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 13
      Style = tbsSeparator
    end
    object btnWork: TToolButton
      Left = 86
      Top = 0
      Cursor = crHandPoint
      Hint = #1042#1099#1073#1086#1088' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1103' (F8)'
      Caption = 'btnWork'
      ImageIndex = 1
      ParentShowHint = False
      ShowHint = True
      OnClick = btnWorkClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 42
    Width = 396
    Height = 127
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 161
      Top = 8
      Width = 80
      Height = 13
      Caption = #1044#1072#1090#1072' '#1086#1090#1073#1086#1088#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 5
      Top = 8
      Width = 48
      Height = 13
      Caption = #8470' '#1072#1082#1090#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnChoiceDate: TSpeedButton
      Left = 364
      Top = 4
      Width = 23
      Height = 22
      Cursor = crHandPoint
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1076#1072#1090#1091' (F7)'
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
      OnClick = btnChoiceDateClick
    end
    object DBRadioGroup1: TDBRadioGroup
      Left = 126
      Top = 32
      Width = 145
      Height = 41
      Caption = ' '#1055#1083#1072#1085#1086#1074#1099#1081'? '
      Columns = 2
      DataField = 'AC_Plan'
      DataSource = fActs.dsActs
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Items.Strings = (
        #1044#1072
        #1053#1077#1090)
      ParentFont = False
      TabOrder = 2
    end
    object eAct: TDBEdit
      Left = 57
      Top = 4
      Width = 100
      Height = 21
      DataField = 'AC_Act'
      DataSource = fActs.dsActs
      TabOrder = 0
    end
    object eDate: TDBEdit
      Left = 245
      Top = 4
      Width = 112
      Height = 21
      DataField = 'AC_Date'
      DataSource = fActs.dsActs
      ReadOnly = True
      TabOrder = 1
    end
    object DBRadioGroup2: TDBRadioGroup
      Left = 126
      Top = 80
      Width = 145
      Height = 41
      Caption = ' '#1055#1088#1086#1073#1072' '#1086#1090#1086#1073#1088#1072#1085#1072'? '
      Columns = 2
      DataField = 'AC_Proba'
      DataSource = fActs.dsActs
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Items.Strings = (
        #1044#1072
        #1053#1077#1090)
      ParentFont = False
      TabOrder = 3
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 169
    Width = 396
    Height = 127
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    object Label3: TLabel
      Left = 56
      Top = 8
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
    object Label4: TLabel
      Left = 14
      Top = 32
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
    object Label5: TLabel
      Left = 10
      Top = 80
      Width = 87
      Height = 13
      Caption = #1052#1077#1089#1090#1086' '#1086#1090#1073#1086#1088#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 56
      Top = 104
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
    object eArea: TDBEdit
      Left = 100
      Top = 4
      Width = 165
      Height = 21
      TabStop = False
      DataField = 'Area'
      DataSource = fActs.dsWorks
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 100
      Top = 28
      Width = 165
      Height = 21
      TabStop = False
      DataField = 'W_ShortName'
      DataSource = fActs.dsWorks
      ReadOnly = True
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 100
      Top = 52
      Width = 289
      Height = 21
      TabStop = False
      DataField = 'W_FullName'
      DataSource = fActs.dsWorks
      ReadOnly = True
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 100
      Top = 76
      Width = 165
      Height = 21
      TabStop = False
      DataField = 'W_Otbor'
      DataSource = fActs.dsWorks
      ReadOnly = True
      TabOrder = 3
    end
    object DBEdit5: TDBEdit
      Left = 100
      Top = 100
      Width = 289
      Height = 21
      TabStop = False
      DataField = 'W_Address'
      DataSource = fActs.dsWorks
      ReadOnly = True
      TabOrder = 4
    end
  end
  object tAct: TTable
    Active = True
    DatabaseName = 'Labor_WIN32'
    IndexFieldNames = 'AC_Act'
    TableName = 'Acts.db'
    Left = 274
    Top = 6
    object tActAC_Act: TFloatField
      FieldName = 'AC_Act'
    end
    object tActAC_Code: TAutoIncField
      FieldName = 'AC_Code'
      ReadOnly = True
    end
  end
end
