object FormMain: TFormMain
  Left = 0
  Top = 0
  HorzScrollBar.ButtonSize = 10
  HorzScrollBar.Smooth = True
  HorzScrollBar.Size = 10000
  VertScrollBar.Size = 10000
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  Caption = 'CalculusEx'
  ClientHeight = 417
  ClientWidth = 472
  Color = clWhite
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu
  OldCreateOrder = False
  Position = poDefault
  StyleElements = [seFont, seBorder]
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Status: TStatusBar
    Left = 0
    Top = 398
    Width = 472
    Height = 19
    AutoHint = True
    Panels = <>
    SimplePanel = True
    SizeGrip = False
    OnHint = StatusHint
  end
  object Grid: TStringGrid
    Left = 0
    Top = 0
    Width = 472
    Height = 398
    TabStop = False
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    Color = clWhite
    ColCount = 2
    DefaultColWidth = 35
    DefaultRowHeight = 35
    DefaultDrawing = False
    DoubleBuffered = True
    DrawingStyle = gdsClassic
    FixedColor = 16750848
    RowCount = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    GradientEndColor = 16750848
    GradientStartColor = 16742144
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goRowSizing, goColSizing, goEditing, goTabs, goAlwaysShowEditor, goThumbTracking, goFixedColClick, goFixedRowClick]
    ParentDoubleBuffered = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    Visible = False
    StyleElements = []
    OnClick = GridClick
    OnDrawCell = GridDrawCell
    OnKeyDown = GridKeyDown
    OnKeyPress = GridKeyPress
    OnMouseDown = GridMouseDown
    OnMouseMove = GridMouseMove
    OnMouseUp = GridMouseUp
    OnSetEditText = GridSetEditText
  end
  object MainMenu: TMainMenu
    OwnerDraw = True
    Left = 16
    Top = 8
    object MainFile: TMenuItem
      Caption = 'Datoteka'
      OnClick = MainFileClick
      object SubNewFile: TMenuItem
        Caption = 'Nova'
        Hint = 'Kreira novu datoteku [CTRL+N]'
        ShortCut = 16462
        OnClick = SubNewFileClick
        OnDrawItem = MenuDrawItem
        OnMeasureItem = MenuMeasureItem
      end
      object SubOpen: TMenuItem
        Caption = 'Otvori...'
        Hint = 'Otvara ve'#263' postoje'#263'u datoteku [CTRL+O]'
        ShortCut = 16463
        OnClick = SubOpenClick
        OnDrawItem = MenuDrawItem
        OnMeasureItem = MenuMeasureItem
      end
      object SubSave: TMenuItem
        Caption = 'Sa'#269'uvaj'
        Hint = #268'uva postoje'#263'u datoteku (samo CXF datoteke) [CTRL+S]'
        ShortCut = 16467
        OnClick = SubSaveClick
        OnDrawItem = MenuDrawItem
        OnMeasureItem = MenuMeasureItem
      end
      object SubSaveAs: TMenuItem
        Caption = 'Sa'#269'uvaj kao...'
        Hint = #268'uva postoje'#263'u datoteku u drugom formatu [SHIFT+CTRL+S]'
        ShortCut = 24659
        OnClick = SubSaveAsClick
        OnDrawItem = MenuDrawItem
        OnMeasureItem = MenuMeasureItem
      end
      object SubClose: TMenuItem
        Caption = 'Zatvori'
        Hint = 'Zatvara aktivnu datoteku [ALT+'#8595']'
        ShortCut = 32808
        OnClick = SubCloseClick
        OnDrawItem = MenuDrawItem
        OnMeasureItem = MenuMeasureItem
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object SubSettings: TMenuItem
        Caption = 'Opcije...'
        Hint = 'Prikazuje pode'#353'avanja aplikacije [F10]'
        ShortCut = 121
        OnClick = SubSettingsClick
        OnDrawItem = MenuDrawItem
        OnMeasureItem = MenuMeasureItem
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object SubRestart: TMenuItem
        Caption = 'Pokreni ponovo...'
        Hint = 'Ponovo pokre'#263'e aplikaciju [SHIFT+ESC]'
        ShortCut = 8219
        OnClick = SubRestartClick
        OnDrawItem = MenuDrawItem
        OnMeasureItem = MenuMeasureItem
      end
      object SubExit: TMenuItem
        Caption = 'Iza'#273'i'
        Hint = 'Zatvara aplikaciju [ESC]'
        ShortCut = 27
        OnClick = SubExitClick
        OnDrawItem = MenuDrawItem
        OnMeasureItem = MenuMeasureItem
      end
    end
    object MainTable: TMenuItem
      Caption = 'Tabela'
      OnClick = MainTableClick
      object SubFormat: TMenuItem
        Caption = 'Formatiraj...'
        Hint = 'Pode'#353'ava broj decimala [CTRL+F]'
        ShortCut = 16454
        OnClick = SubFormatClick
        OnDrawItem = MenuDrawItem
        OnMeasureItem = MenuMeasureItem
      end
      object SubFill: TMenuItem
        Caption = 'Popuni...'
        Hint = 'Popunjava tabelu nasumi'#269'nim podacima [CTRL+ENTER]'
        ShortCut = 16397
        OnClick = SubFillClick
        OnDrawItem = MenuDrawItem
        OnMeasureItem = MenuMeasureItem
      end
      object SubEmpty: TMenuItem
        Caption = 'Isprazni'
        Hint = 'Bri'#353'e sve podatke iz trenutne tabele [CTRL+DEL]'
        ShortCut = 16430
        OnClick = SubEmptyClick
        OnDrawItem = MenuDrawItem
        OnMeasureItem = MenuMeasureItem
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object SubResults: TMenuItem
        Caption = 'Rezultati'
        Enabled = False
        OnClick = SubResultsClick
        OnDrawItem = MenuDrawItem
        OnMeasureItem = MenuMeasureItem
        object SubAllResults: TMenuItem
          Caption = 'Svi'
          Hint = 'Prikazuje sve rezultate [SHIFT+S]'
          ShortCut = 8275
          OnClick = SubAllResultsClick
          OnDrawItem = MenuDrawItem
        end
        object N4: TMenuItem
          Caption = '-'
        end
        object SubAlternatives: TMenuItem
          Caption = 'Vrednosti alternativa'
          Hint = 'Prikazuje vrednosti alternativa [SHIFT+A]'
          ShortCut = 8257
          OnClick = SubAlternativesClick
          OnDrawItem = MenuDrawItem
        end
        object SubPosition: TMenuItem
          Caption = 'Rang pozicije'
          Hint = 'Prikazuje rang pozicije [SHIFT+R]'
          ShortCut = 8274
          OnClick = SubPositionClick
          OnDrawItem = MenuDrawItem
        end
        object SubCRL: TMenuItem
          Caption = 'Kompromisna rang lista'
          Hint = 'Prikazuje kompromisnu rang listu [SHIFT+K]'
          ShortCut = 8267
          OnClick = SubCRLClick
          OnDrawItem = MenuDrawItem
        end
      end
    end
    object MainMethod: TMenuItem
      Caption = 'Metoda'
      object SubCompromiseProg: TMenuItem
        AutoCheck = True
        Caption = 'MCP'
        Checked = True
        Default = True
        Hint = 'Metoda kompromisnog programiranja [ALT+M]'
        RadioItem = True
        ShortCut = 32845
        OnClick = SubCompromiseProgClick
        OnDrawItem = MenuDrawItem
        OnMeasureItem = MenuMeasureItem
      end
    end
    object MainTools: TMenuItem
      Caption = 'Alatke'
      OnClick = MainToolsClick
      object SubFind: TMenuItem
        Caption = 'Prona'#273'i...'
        Hint = 'Pronalazi zadatu vrednost u tabeli [CTRL+P]'
        ShortCut = 16464
        OnClick = SubFindClick
        OnDrawItem = MenuDrawItem
        OnMeasureItem = MenuMeasureItem
      end
      object SubJump: TMenuItem
        Caption = 'Pre'#273'i na '#263'eliju...'
        Hint = 
          'Prelazi na odre'#273'enu '#263'eliju u odre'#273'enoj koloni, tj. redu [SHIFT+E' +
          'NTER]'
        ShortCut = 8205
        OnClick = SubJumpClick
        OnDrawItem = MenuDrawItem
        OnMeasureItem = MenuMeasureItem
      end
      object SubEnumerate: TMenuItem
        Caption = 'Izvr'#353'i enumeraciju'
        Hint = 'Izvr'#353'ava numeraciju svih kolona/redova [ALT+N]'
        ShortCut = 32846
        OnClick = SubEnumerateClick
        OnDrawItem = MenuDrawItem
        OnMeasureItem = MenuMeasureItem
      end
      object SubAutoCells: TMenuItem
        Caption = 'Automatske dimenzije '#263'elija'
        Hint = 'Automatski pode'#353'ava veli'#269'inu '#263'elija [ALT+ENTER]'
        ShortCut = 32781
        OnClick = SubAutoCellsClick
        OnDrawItem = MenuDrawItem
        OnMeasureItem = MenuMeasureItem
      end
    end
    object MainWindow: TMenuItem
      Caption = 'Prozor'
      OnClick = MainWindowClick
      object SubMinimizeWin: TMenuItem
        Caption = 'Minimizuj prozor'
        Hint = 'Minimizuje prozor [CTRL+M]'
        ShortCut = 16461
        OnClick = SubMinimizeWinClick
        OnDrawItem = MenuDrawItem
        OnMeasureItem = MenuMeasureItem
      end
      object SubFontSize: TMenuItem
        Caption = 'Veli'#269'ina fonta'
        OnDrawItem = MenuDrawItem
        OnMeasureItem = MenuMeasureItem
        object SubIncFont: TMenuItem
          Caption = 'Pove'#263'aj'
          Hint = 'Pove'#263'ava veli'#269'inu fonta [CTRL+'#8593']'
          ShortCut = 16422
          OnClick = SubIncFontClick
          OnDrawItem = MenuDrawItem
          OnMeasureItem = MenuMeasureItem
        end
        object SubDecFont: TMenuItem
          Caption = 'Smanji'
          Hint = 'Smanjuje veli'#269'inu fonta [CTRL+'#8595']'
          ShortCut = 16424
          OnClick = SubDecFontClick
          OnDrawItem = MenuDrawItem
          OnMeasureItem = MenuMeasureItem
        end
      end
      object SubView: TMenuItem
        Caption = 'Prikaz'
        Hint = 'Pode'#353'ava na'#269'in prikazivanja'
        OnDrawItem = MenuDrawItem
        OnMeasureItem = MenuMeasureItem
        object SubStandard: TMenuItem
          AutoCheck = True
          Caption = 'Podrazumevani'
          Checked = True
          Default = True
          Hint = 'Prikazuje prozor podrazumevanih dimenzija [SHIFT+F11]'
          ShortCut = 8314
          OnClick = SubStandardClick
          OnDrawItem = MenuDrawItem
          OnMeasureItem = MenuMeasureItem
        end
        object SubFullscreen: TMenuItem
          AutoCheck = True
          Caption = 'Ceo ekran'
          Hint = 'Prozor zauzima ceo ekran [F11]'
          ShortCut = 122
          OnClick = SubFullscreenClick
          OnDrawItem = MenuDrawItem
          OnMeasureItem = MenuMeasureItem
        end
      end
    end
    object MainAbout: TMenuItem
      Caption = 'O...'
      object SubAuthor: TMenuItem
        Caption = 'Autor'
        Hint = 'Prikazuje podatke o autoru ovog programa [F2]'
        ShortCut = 113
        OnClick = SubAuthorClick
        OnDrawItem = MenuDrawItem
        OnMeasureItem = MenuMeasureItem
      end
      object SubWebsite: TMenuItem
        Caption = 'Vebsajt'
        Hint = 'Otvara vebsajt autora [F3]'
        ShortCut = 114
        OnClick = SubWebsiteClick
        OnDrawItem = MenuDrawItem
        OnMeasureItem = MenuMeasureItem
      end
    end
  end
  object PopupMenu: TPopupMenu
    OnPopup = PopupMenuPopup
    Left = 16
    Top = 64
    object PopDelete: TMenuItem
      Caption = 'Izbri'#353'i'
      OnClick = PopDeleteClick
    end
    object PopAdd: TMenuItem
      Caption = 'Dodaj'
      OnClick = PopAddClick
    end
  end
  object SaveTable: TSaveDialog
    Filter = 
      'CalculusEx datoteka (*.cxf)|*.cxf|HTML dokument (*.html)|*.html|' +
      'JPEG slika (*.jpg)|*.jpg|PNG slika (*.png)|*.png|BMP slika (*.bm' +
      'p)|*.bmp'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing, ofForceShowHidden]
    Title = 'Sa'#269'uvaj tabelu kao...'
    Left = 16
    Top = 112
  end
  object OpenTable: TOpenDialog
    Filter = 'CalculusEx datoteka (*.cxf)|*.cxf'
    Title = 'Otvori datoteku...'
    Left = 16
    Top = 168
  end
  object App: TApplicationEvents
    OnException = AppException
    Left = 16
    Top = 216
  end
end
