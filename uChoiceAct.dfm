object fChoiceAct: TfChoiceAct
  Left = 282
  Top = 129
  BorderStyle = bsDialog
  Caption = #1042#1099#1073#1086#1088' '#1072#1082#1090#1072
  ClientHeight = 368
  ClientWidth = 381
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
    Width = 381
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
      Hint = #1042#1099#1073#1088#1072#1090#1100' '#1072#1082#1090' (ENTER)'
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
      Hint = #1054#1090#1084#1077#1085#1080#1090#1100' '#1074#1099#1073#1086#1088' (ESC)'
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
    Width = 381
    Height = 55
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object Label1: TLabel
      Left = 9
      Top = 7
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
    object Label2: TLabel
      Left = 5
      Top = 32
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
    object DBEdit1: TDBEdit
      Left = 96
      Top = 4
      Width = 277
      Height = 21
      TabStop = False
      DataField = 'W_ShortName'
      DataSource = dsWorks
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 96
      Top = 28
      Width = 277
      Height = 21
      TabStop = False
      DataField = 'W_Otbor'
      DataSource = dsWorks
      ReadOnly = True
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 97
    Width = 381
    Height = 271
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    object DBGrid1: TDBGrid
      Left = 2
      Top = 2
      Width = 377
      Height = 267
      Align = alClient
      DataSource = dsActs
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
      OnDblClick = btnOkClick
      Columns = <
        item
          Expanded = False
          FieldName = 'AC_Act'
          Title.Alignment = taCenter
          Title.Caption = #8470' '#1072#1082#1090#1072
          Width = 182
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AC_Date'
          Title.Alignment = taCenter
          Title.Caption = #1044#1072#1090#1072' '#1086#1090#1073#1086#1088#1072
          Width = 155
          Visible = True
        end>
    end
  end
  object dsWorks: TDataSource
    DataSet = tWorks
    Left = 272
    Top = 52
  end
  object dsActs: TDataSource
    DataSet = tActs
    Left = 164
    Top = 144
  end
  object tWorks: TTable
    Active = True
    DatabaseName = 'Labor_WIN32'
    IndexFieldNames = 'W_Code'
    MasterFields = 'AC_W_Code'
    MasterSource = dsActs
    TableName = 'Works.DB'
    Left = 240
    Top = 52
    object tWorksW_Code: TAutoIncField
      FieldName = 'W_Code'
      ReadOnly = True
    end
    object tWorksW_ShortName: TStringField
      FieldName = 'W_ShortName'
      Size = 50
    end
    object tWorksW_Otbor: TStringField
      FieldName = 'W_Otbor'
      Size = 35
    end
  end
  object tActs: TTable
    Active = True
    DatabaseName = 'Labor_WIN32'
    IndexFieldNames = 'AC_Act'
    TableName = 'Acts.db'
    Left = 128
    Top = 144
    object tActsAC_Code: TAutoIncField
      FieldName = 'AC_Code'
      ReadOnly = True
    end
    object tActsAC_Act: TFloatField
      FieldName = 'AC_Act'
    end
    object tActsAC_Date: TDateField
      FieldName = 'AC_Date'
    end
    object tActsAC_W_Code: TIntegerField
      FieldName = 'AC_W_Code'
    end
    object tActsAC_Plan: TBooleanField
      FieldName = 'AC_Plan'
    end
    object tActsAC_Proba: TBooleanField
      FieldName = 'AC_Proba'
    end
  end
end
