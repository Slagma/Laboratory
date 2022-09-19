object fEditFormat: TfEditFormat
  Left = 347
  Top = 244
  BorderStyle = bsDialog
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1080#1085#1075#1088#1077#1076#1080#1077#1085#1090#1072
  ClientHeight = 146
  ClientWidth = 264
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
  object DBText1: TDBText
    Left = 8
    Top = 12
    Width = 249
    Height = 17
    Alignment = taCenter
    DataField = 'Ingred'
    DataSource = fFormats.dsFormats
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 8
    Top = 40
    Width = 47
    Height = 13
    Caption = #1057#1090#1088#1086#1082#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 28
    Top = 64
    Width = 27
    Height = 13
    Caption = #1042#1089#1077':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 13
    Top = 88
    Width = 42
    Height = 13
    Caption = #1055#1086#1089#1083#1077':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 28
    Top = 116
    Width = 208
    Height = 13
    Caption = '('#1047#1072#1087#1080#1089#1072#1090#1100' - ENTER, '#1054#1090#1084#1077#1085#1072' - ESC)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clPurple
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBEdit1: TDBEdit
    Left = 60
    Top = 36
    Width = 197
    Height = 21
    DataField = 'F_Header'
    DataSource = fFormats.dsFormats
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 60
    Top = 60
    Width = 65
    Height = 21
    DataField = 'F_All'
    DataSource = fFormats.dsFormats
    TabOrder = 1
  end
  object DBEdit3: TDBEdit
    Left = 60
    Top = 84
    Width = 65
    Height = 21
    DataField = 'F_Posle'
    DataSource = fFormats.dsFormats
    TabOrder = 2
  end
end
