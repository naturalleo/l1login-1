object frm_LoadWG: Tfrm_LoadWG
  Left = 574
  Top = 382
  BorderStyle = bsNone
  ClientHeight = 82
  ClientWidth = 239
  Color = clBlack
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 32
    Top = 24
    Width = 46
    Height = 13
    Caption = #35831#31245#31561'!'
    Font.Charset = GB2312_CHARSET
    Font.Color = clLime
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 32
    Top = 48
    Width = 177
    Height = 13
    Caption = #27491#22312#21152#36733#28216#25103#65292#26816#27979#22806#25346#20013'...'
    Font.Charset = GB2312_CHARSET
    Font.Color = clLime
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Timer1: TTimer
    Interval = 3000
    OnTimer = Timer1Timer
    Left = 112
    Top = 8
  end
end
