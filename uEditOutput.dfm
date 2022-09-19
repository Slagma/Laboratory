object fEditOutput: TfEditOutput
  Left = 363
  Top = 252
  BorderStyle = bsDialog
  Caption = #1042#1099#1074#1086#1076#1080#1090#1100'?'
  ClientHeight = 61
  ClientWidth = 194
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
  object DBRadioGroup1: TDBRadioGroup
    Left = 0
    Top = 0
    Width = 194
    Height = 61
    Align = alClient
    Columns = 2
    DataField = 'TN_N_Output'
    DataSource = fNorms.dsTempNorms
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Items.Strings = (
      #1044#1072
      #1053#1077#1090)
    ParentFont = False
    TabOrder = 0
  end
end
