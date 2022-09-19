object fChoiceDate: TfChoiceDate
  Left = 411
  Top = 272
  BorderStyle = bsDialog
  Caption = 'Выбор даты'
  ClientHeight = 197
  ClientWidth = 258
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
  object Calendar: TMonthCalendar
    Left = 34
    Top = 21
    Width = 191
    Height = 154
    Date = 37197
    TabOrder = 0
    OnDblClick = CalendarDblClick
  end
end
