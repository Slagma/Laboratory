object fEditWork: TfEditWork
  Left = 243
  Top = 165
  BorderStyle = bsDialog
  Caption = 'Новое предприятие'
  ClientHeight = 257
  ClientWidth = 578
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
    Width = 578
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
      Hint = 'Записать (ENTER)'
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
      Hint = 'Отменить (ESC)'
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
    Width = 578
    Height = 215
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object Label1: TLabel
      Left = 37
      Top = 19
      Width = 83
      Height = 13
      Caption = 'Предприятие:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 33
      Top = 43
      Width = 87
      Height = 13
      Caption = 'Место отбора:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 11
      Top = 67
      Width = 109
      Height = 13
      Caption = 'Полное название:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 79
      Top = 91
      Width = 41
      Height = 13
      Caption = 'Адрес:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 79
      Top = 128
      Width = 41
      Height = 13
      Alignment = taRightJustify
      Caption = 'Район:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnChangeArea: TSpeedButton
      Left = 380
      Top = 124
      Width = 23
      Height = 22
      Cursor = crHandPoint
      Hint = 'Сменить район (F8)'
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
      OnClick = btnChangeAreaClick
    end
    object KNS: TLabel
      Left = 90
      Top = 152
      Width = 30
      Height = 13
      Caption = 'КНС:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnChangeKNS: TSpeedButton
      Left = 380
      Top = 148
      Width = 23
      Height = 22
      Hint = 'Выбрать КНС (F9)'
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
      OnClick = btnChangeKNSClick
    end
    object eShortName: TDBEdit
      Left = 124
      Top = 15
      Width = 249
      Height = 21
      DataField = 'W_ShortName'
      DataSource = fWorks.dsWorks
      TabOrder = 0
    end
    object eOtbor: TDBEdit
      Left = 124
      Top = 39
      Width = 249
      Height = 21
      DataField = 'W_Otbor'
      DataSource = fWorks.dsWorks
      TabOrder = 1
    end
    object eFullName: TDBEdit
      Left = 124
      Top = 63
      Width = 441
      Height = 21
      DataField = 'W_FullName'
      DataSource = fWorks.dsWorks
      TabOrder = 2
    end
    object eAddress: TDBEdit
      Left = 124
      Top = 87
      Width = 441
      Height = 21
      DataField = 'W_Address'
      DataSource = fWorks.dsWorks
      TabOrder = 3
    end
    object eArea: TEdit
      Left = 124
      Top = 124
      Width = 249
      Height = 21
      ReadOnly = True
      TabOrder = 4
      Text = 'eArea'
    end
    object DBRadioGroup1: TDBRadioGroup
      Left = 124
      Top = 172
      Width = 177
      Height = 33
      Caption = 'Берег'
      Columns = 2
      DataField = 'W_Side'
      DataSource = fWorks.dsWorks
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Items.Strings = (
        'Правый'
        'Левый')
      ParentFont = False
      TabOrder = 5
      Values.Strings = (
        '1'
        '0')
    end
    object eKNS: TEdit
      Left = 124
      Top = 148
      Width = 249
      Height = 21
      TabOrder = 6
    end
  end
  object tAreas: TTable
    Active = True
    DatabaseName = 'Labor_WIN32'
    IndexFieldNames = 'A_Name'
    TableName = 'Areas.db'
    Left = 166
    Top = 10
    object tAreasA_Code: TAutoIncField
      FieldName = 'A_Code'
      ReadOnly = True
    end
    object tAreasA_Name: TStringField
      FieldName = 'A_Name'
      Size = 35
    end
  end
  object tKNS: TTable
    Active = True
    DatabaseName = 'Labor_WIN32'
    IndexFieldNames = 'K_Name'
    TableName = 'KNS.db'
    Left = 242
    Top = 6
    object tKNSK_Code: TAutoIncField
      FieldName = 'K_Code'
      ReadOnly = True
    end
    object tKNSK_Name: TStringField
      FieldName = 'K_Name'
      Size = 35
    end
  end
end
