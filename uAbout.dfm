object fAbout: TfAbout
  Left = 192
  Top = 107
  BorderStyle = bsDialog
  Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077'...'
  ClientHeight = 257
  ClientWidth = 307
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Panel: TPanel
    Left = 0
    Top = 0
    Width = 307
    Height = 216
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object Bevel: TBevel
      Left = 36
      Top = 88
      Width = 235
      Height = 9
      Shape = bsTopLine
    end
    object Label1: TLabel
      Left = 56
      Top = 16
      Width = 193
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = #1051#1072#1073#1086#1088#1072#1090#1086#1088#1080#1103' '#1087#1088#1086#1084#1089#1090#1086#1082#1086#1074' v2.0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label2: TLabel
      Left = 57
      Top = 17
      Width = 193
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = #1051#1072#1073#1086#1088#1072#1090#1086#1088#1080#1103' '#1087#1088#1086#1084#1089#1090#1086#1082#1086#1074' v2.0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label3: TLabel
      Left = 49
      Top = 34
      Width = 207
      Height = 13
      Caption = #1052#1059#1055#1055' "'#1042#1086#1076#1086#1082#1072#1085#1072#1083'" '#1075'. '#1050#1088#1072#1089#1085#1086#1103#1088#1089#1082
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label4: TLabel
      Left = 50
      Top = 35
      Width = 207
      Height = 13
      Caption = #1052#1059#1055#1055' "'#1042#1086#1076#1086#1082#1072#1085#1072#1083'" '#1075'. '#1050#1088#1072#1089#1085#1086#1103#1088#1089#1082
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label5: TLabel
      Left = 122
      Top = 52
      Width = 61
      Height = 13
      Caption = #1045#1085#1080#1085' '#1070'.'#1055'.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label6: TLabel
      Left = 123
      Top = 53
      Width = 61
      Height = 13
      Caption = #1045#1085#1080#1085' '#1070'.'#1055'.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label7: TLabel
      Left = 131
      Top = 69
      Width = 43
      Height = 13
      Caption = '2002 '#1075'.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label8: TLabel
      Left = 132
      Top = 70
      Width = 43
      Height = 13
      Caption = '2002 '#1075'.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Info: TMemo
      Left = 2
      Top = 96
      Width = 303
      Height = 118
      TabStop = False
      Align = alBottom
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 216
    Width = 307
    Height = 41
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 84
      Top = 8
      Width = 139
      Height = 25
      Cursor = crHandPoint
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1086#1082#1085#1086' (ENTER)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Kind = bkOK
    end
  end
end
