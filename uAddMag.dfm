object fAddMag: TfAddMag
  Left = 185
  Top = 159
  BorderStyle = bsDialog
  Caption = 'Новый журнал'
  ClientHeight = 64
  ClientWidth = 245
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
    Left = 18
    Top = 21
    Width = 209
    Height = 21
    DataField = 'M_Name'
    DataSource = fMagazins.dsMags
    TabOrder = 0
  end
end
