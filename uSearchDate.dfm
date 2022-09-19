object fSearchDate: TfSearchDate
  Left = 279
  Top = 198
  BorderStyle = bsDialog
  Caption = 'Поиск акта по дате'
  ClientHeight = 62
  ClientWidth = 234
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
  object eDate: TDateTimePicker
    Left = 36
    Top = 21
    Width = 161
    Height = 21
    CalAlignment = dtaLeft
    Date = 37197
    Time = 37197
    DateFormat = dfLong
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 0
  end
end
