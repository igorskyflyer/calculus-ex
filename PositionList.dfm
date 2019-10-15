object FormPosition: TFormPosition
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Rezultati - Kompromisna rang lista'
  ClientHeight = 493
  ClientWidth = 494
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
    Width = 494
    Height = 493
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    Color = clWhite
    DefaultColWidth = 128
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
    ExplicitHeight = 513
  end
  object SaveFile: TSaveDialog
    Filter = 'HTML dokument (*.html)|*.html'
    Left = 160
    Top = 264
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
end
