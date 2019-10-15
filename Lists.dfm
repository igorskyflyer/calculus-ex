object FormList: TFormList
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Rezultati - Rang lista'
  ClientHeight = 524
  ClientWidth = 509
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Grid: TStringGrid
    Left = 0
    Top = 0
    Width = 509
    Height = 524
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    Color = clWhite
    DefaultColWidth = 96
    DefaultRowHeight = 32
    DoubleBuffered = True
    DrawingStyle = gdsClassic
    FixedColor = 16750848
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentDoubleBuffered = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    StyleElements = []
    OnDrawCell = GridDrawCell
  end
  object MainMenu: TMainMenu
    Left = 240
    Top = 264
    object MenuFile: TMenuItem
      Caption = 'Datoteka'
      object SubSaveAs: TMenuItem
        Caption = 'Sa'#269'uvaj kao...'
        OnClick = SubSaveAsClick
      end
    end
  end
  object SaveFile: TSaveDialog
    Filter = 'HTML dokument (*.html)|*.html'
    Left = 160
    Top = 264
  end
end
