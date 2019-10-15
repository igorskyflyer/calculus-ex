object FormAbout: TFormAbout
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'CalculusEx '#8212' O autoru'
  ClientHeight = 146
  ClientWidth = 314
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = 16750848
  Font.Height = -16
  Font.Name = 'Calibri'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 19
  object LabelAuthor: TLabel
    Left = 0
    Top = 5
    Width = 310
    Height = 32
    Alignment = taCenter
    AutoSize = False
    Caption = 'Autor:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 16750848
    Font.Height = -20
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
    WordWrap = True
    StyleElements = []
  end
  object LabelIgor: TLabel
    Left = 0
    Top = 45
    Width = 310
    Height = 32
    Alignment = taCenter
    AutoSize = False
    Caption = 'Igor Dimitrijevi'#263
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 16750848
    Font.Height = -20
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
    WordWrap = True
    StyleElements = []
    OnClick = LabelIgorClick
    OnMouseEnter = LabelIgorMouseEnter
    OnMouseLeave = LabelIgorMouseLeave
  end
  object LabelWeb: TLabel
    Left = 0
    Top = 105
    Width = 310
    Height = 32
    Alignment = taCenter
    AutoSize = False
    Caption = 'NeoVisio '#169' 2014.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 16750848
    Font.Height = -20
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
    WordWrap = True
    StyleElements = []
    OnClick = LabelWebClick
    OnMouseEnter = LabelWebMouseEnter
    OnMouseLeave = LabelWebMouseLeave
  end
end
