object FormResults: TFormResults
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Vrednosti alternativa'
  ClientHeight = 315
  ClientWidth = 340
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  Menu = MenuAlt
  OldCreateOrder = False
  Position = poDesktopCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object MemoResults: TMemo
    Left = 0
    Top = 0
    Width = 340
    Height = 315
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
    WantReturns = False
  end
  object MenuAlt: TMainMenu
    Left = 160
    Top = 160
    object MainAltFile: TMenuItem
      Caption = 'Datoteka'
      object SubAltSaveAs: TMenuItem
        Caption = 'Sa'#269'uvaj kao...'
        ShortCut = 16467
        OnClick = SubAltSaveAsClick
      end
    end
  end
  object SaveAlt: TSaveDialog
    Filter = 'Tekstualna datoteka (*.txt)|*.txt'
    Left = 88
    Top = 200
  end
end
