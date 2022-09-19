object fEditNorm: TfEditNorm
  Left = 307
  Top = 242
  BorderStyle = bsDialog
  Caption = #1053#1086#1088#1084#1072' '#1086#1090' '
  ClientHeight = 72
  ClientWidth = 255
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
  object Label2: TLabel
    Left = 25
    Top = 54
    Width = 205
    Height = 13
    Caption = '(ENTER - '#1079#1072#1087#1080#1089#1072#1090#1100'; ESC - '#1086#1090#1084#1077#1085#1072')'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBText1: TDBText
    Left = 11
    Top = 5
    Width = 233
    Height = 17
    Alignment = taCenter
    DataField = 'TN_I_Name'
    DataSource = fNorms.dsTempNorms
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
  end
  object eValue: TDBEdit
    Left = 67
    Top = 29
    Width = 121
    Height = 21
    DataSource = fNorms.dsTempNorms
    TabOrder = 0
  end
end
