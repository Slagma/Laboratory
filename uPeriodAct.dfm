object fPeriodAct: TfPeriodAct
  Left = 286
  Top = 230
  BorderStyle = bsDialog
  Caption = #1054#1090#1095#1077#1090' '#1087#1086' '#1072#1082#1090#1072#1084' (ESC - '#1086#1090#1084#1077#1085#1072')'
  ClientHeight = 69
  ClientWidth = 269
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
  object Label1: TLabel
    Left = 38
    Top = 17
    Width = 44
    Height = 13
    Caption = #1057' '#1072#1082#1090#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 37
    Top = 39
    Width = 45
    Height = 13
    Caption = #1055#1086' '#1072#1082#1090':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object SpeedButton1: TSpeedButton
    Left = 212
    Top = 36
    Width = 23
    Height = 22
    Cursor = crHandPoint
    Hint = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1086#1090#1095#1077#1090' (ENTER)'
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
    OnClick = SpeedButton1Click
  end
  object BeginAct: TEdit
    Left = 85
    Top = 13
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object EndAct: TEdit
    Left = 85
    Top = 35
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object tAct: TTable
    Active = True
    DatabaseName = 'Labor_WIN32'
    IndexFieldNames = 'AC_Act;AC_Date'
    TableName = 'Acts.db'
    Left = 8
    Top = 16
    object tActAC_Code: TAutoIncField
      FieldName = 'AC_Code'
      ReadOnly = True
    end
    object tActAC_Act: TFloatField
      FieldName = 'AC_Act'
    end
    object tActAC_Date: TDateField
      FieldName = 'AC_Date'
    end
    object tActAC_W_Code: TIntegerField
      FieldName = 'AC_W_Code'
    end
    object tActAC_Plan: TBooleanField
      FieldName = 'AC_Plan'
    end
    object tActAC_Proba: TBooleanField
      FieldName = 'AC_Proba'
    end
  end
end
