object FormSettings: TFormSettings
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'CalculusEx '#8212' Pode'#353'avanja'
  ClientHeight = 314
  ClientWidth = 551
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Pages: TPageControl
    Left = 0
    Top = 0
    Width = 551
    Height = 314
    ActivePage = TabGeneral
    Align = alClient
    DoubleBuffered = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 16750848
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    MultiLine = True
    ParentDoubleBuffered = False
    ParentFont = False
    TabOrder = 3
    object TabGeneral: TTabSheet
      Caption = 'Op'#353'ta'
      ImageIndex = 1
      object LabelSound: TLabel
        Left = 3
        Top = 16
        Width = 521
        Height = 14
        AutoSize = False
        Caption = 'Zvuk prilikom pokretanja aplikacije'
      end
      object BoxSound: TComboBox
        Left = 3
        Top = 36
        Width = 521
        Height = 22
        AutoComplete = False
        AutoCompleteDelay = 0
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 0
        Text = 'Isklju'#269'en'
        Items.Strings = (
          'Isklju'#269'en'
          'Uklju'#269'en')
      end
    end
    object TabTable: TTabSheet
      Caption = 'Tabele'
      object LabelCellBg: TLabel
        Left = 3
        Top = 24
        Width = 105
        Height = 14
        Caption = 'Pozadinska boja '#263'elija'
        Layout = tlCenter
      end
      object LabelCellText: TLabel
        Left = 3
        Top = 54
        Width = 80
        Height = 14
        Caption = 'Boja teksta '#263'elija'
        Layout = tlCenter
      end
      object LabelFontName: TLabel
        Left = 3
        Top = 86
        Width = 44
        Height = 14
        Caption = 'Ime fonta'
        Layout = tlCenter
      end
      object LabelFontSize: TLabel
        Left = 3
        Top = 141
        Width = 66
        Height = 14
        Caption = 'Veli'#269'ina fonta'
      end
      object BoxFonts: TComboBox
        Left = 3
        Top = 105
        Width = 521
        Height = 22
        AutoCompleteDelay = 0
        AutoDropDown = True
        Style = csDropDownList
        DropDownCount = 14
        Sorted = True
        TabOrder = 0
      end
      object ColorCellBg: TEdit
        Left = 497
        Top = 21
        Width = 24
        Height = 24
        TabStop = False
        AutoSelect = False
        AutoSize = False
        ReadOnly = True
        TabOrder = 1
        StyleElements = []
        OnClick = ColorCellBgClick
      end
      object ColorCellText: TEdit
        Left = 497
        Top = 51
        Width = 24
        Height = 24
        TabStop = False
        AutoSelect = False
        AutoSize = False
        ReadOnly = True
        TabOrder = 2
        StyleElements = []
        OnClick = ColorCellTextClick
      end
      object EditFontSize: TEdit
        Left = 3
        Top = 161
        Width = 505
        Height = 21
        AutoSelect = False
        AutoSize = False
        MaxLength = 3
        ReadOnly = True
        TabOrder = 3
        Text = '5'
      end
      object UpDownFont: TUpDown
        Left = 508
        Top = 161
        Width = 16
        Height = 21
        Associate = EditFontSize
        Min = 5
        Max = 500
        Position = 5
        TabOrder = 4
        Thousands = False
        Wrap = True
      end
    end
    object TabFunctions: TTabSheet
      Caption = 'Funkcije'
      ImageIndex = 2
      object GroupFill: TGroupBox
        Left = 3
        Top = 120
        Width = 520
        Height = 103
        Caption = 'Parametri funkcije za popunjavanje tabela'
        TabOrder = 0
        object LabelFillInterval: TLabel
          Left = 9
          Top = 20
          Width = 35
          Height = 14
          Caption = 'Interval'
        end
        object LabelFillFrom: TLabel
          Left = 33
          Top = 48
          Width = 14
          Height = 14
          Caption = 'Od'
        end
        object LabelFillTo: TLabel
          Left = 344
          Top = 44
          Width = 13
          Height = 14
          Caption = 'Do'
        end
        object EditFillFrom: TEdit
          Left = 33
          Top = 68
          Width = 121
          Height = 22
          AutoSize = False
          MaxLength = 8
          NumbersOnly = True
          TabOrder = 0
          Text = '0'
        end
        object EditFillTo: TEdit
          Left = 344
          Top = 64
          Width = 121
          Height = 22
          AutoSize = False
          MaxLength = 8
          NumbersOnly = True
          TabOrder = 1
          Text = '0'
        end
        object UpDownFrom: TUpDown
          Left = 154
          Top = 68
          Width = 16
          Height = 22
          Associate = EditFillFrom
          TabOrder = 2
        end
        object UpDownTo: TUpDown
          Left = 465
          Top = 64
          Width = 16
          Height = 22
          Associate = EditFillTo
          TabOrder = 3
        end
      end
      object GroupFormat: TGroupBox
        Left = 3
        Top = 11
        Width = 520
        Height = 94
        Caption = 'Parametri funkcije za formatiranje tabela'
        TabOrder = 1
        object LabelFormatDefault: TLabel
          Left = 12
          Top = 24
          Width = 140
          Height = 14
          Caption = 'Podrazumevani broj decimala'
        end
        object EditFormatNumber: TEdit
          Left = 8
          Top = 52
          Width = 493
          Height = 22
          AutoSize = False
          MaxLength = 1
          NumbersOnly = True
          TabOrder = 0
          Text = '0'
        end
        object UpDownNum: TUpDown
          Left = 501
          Top = 52
          Width = 16
          Height = 22
          Associate = EditFormatNumber
          Max = 8
          TabOrder = 1
        end
      end
    end
    object TabConfig: TTabSheet
      Caption = 'Konfiguracija'
      ImageIndex = 3
      object GroupConfig: TGroupBox
        Left = 3
        Top = 3
        Width = 536
        Height = 182
        Caption = 'Konfiguracija'
        TabOrder = 0
        object LabelExport: TLabel
          Left = 11
          Top = 32
          Width = 35
          Height = 15
          Caption = '- Izvezi'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          StyleElements = [seClient, seBorder]
          OnClick = LabelExportClick
          OnMouseEnter = LabelHover
          OnMouseLeave = LabelUnHover
        end
        object LabelImport: TLabel
          Left = 11
          Top = 88
          Width = 36
          Height = 15
          Caption = '- Uvezi'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          StyleElements = [seClient, seBorder]
          OnClick = LabelImportClick
          OnMouseEnter = LabelHover
          OnMouseLeave = LabelUnHover
        end
        object LabelResetConfig: TLabel
          Left = 11
          Top = 149
          Width = 170
          Height = 15
          Caption = '- Podrazumevana pode'#353'avanja'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 16750848
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          StyleElements = [seClient, seBorder]
          OnClick = LabelResetConfigClick
          OnMouseEnter = LabelHover
          OnMouseLeave = LabelUnHover
        end
      end
    end
  end
  object ButtonApply: TButton
    Left = 8
    Top = 277
    Width = 75
    Height = 25
    Caption = 'Primeni'
    TabOrder = 0
    OnClick = ButtonApplyClick
  end
  object ButtonCancel: TButton
    Left = 453
    Top = 277
    Width = 75
    Height = 25
    Caption = 'Odustani'
    TabOrder = 1
    OnClick = ButtonCancelClick
  end
  object CheckBoxClose: TCheckBox
    Left = 8
    Top = 254
    Width = 305
    Height = 17
    Caption = 'Zatvori ovaj prozor nakon izmene pode'#353'avanja '
    TabOrder = 2
  end
  object ColorPicker: TColorDialog
    Options = [cdFullOpen, cdAnyColor]
    Left = 504
    Top = 216
  end
  object SaveConfig: TSaveDialog
    Filter = 'CalculusEx konfiguraciona datoteka (*.cxc)|*.cxc'
    Left = 504
    Top = 176
  end
  object OpenConfig: TOpenDialog
    Filter = 'CalculusEx konfiguraciona datoteka (*.cxc)|*.cxc'
    Left = 504
    Top = 136
  end
end
