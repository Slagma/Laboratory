object fEditValueMag: TfEditValueMag
  Left = 420
  Top = 288
  BorderStyle = bsDialog
  Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1077' '#1079#1085#1072#1095#1077#1085#1080#1103
  ClientHeight = 84
  ClientWidth = 247
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
    Left = 19
    Top = 61
    Width = 208
    Height = 13
    Caption = '('#1047#1072#1087#1080#1089#1072#1090#1100' - ENTER; '#1054#1090#1084#1077#1085#1072' - ESC)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBText1: TDBText
    Left = 11
    Top = 9
    Width = 225
    Height = 17
    Alignment = taCenter
    DataField = 'TV_I_Name'
    DataSource = fValuesMags.dsTempValues
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
  end
  object DBEdit1: TDBEdit
    Left = 63
    Top = 35
    Width = 121
    Height = 21
    DataField = 'TV_Value'
    DataSource = fValuesMags.dsTempValues
    TabOrder = 0
  end
end
