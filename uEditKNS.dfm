object fEditKNS: TfEditKNS
  Left = 320
  Top = 226
  BorderStyle = bsDialog
  Caption = 'Новая КНС'
  ClientHeight = 38
  ClientWidth = 355
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
  object DBEdit1: TDBEdit
    Left = 33
    Top = 8
    Width = 289
    Height = 21
    DataField = 'K_Name'
    DataSource = fKns.dsKNS
    TabOrder = 0
  end
end
