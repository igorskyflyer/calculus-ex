object FindDialog: TFindDialog
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Prona'#273'i...'
  ClientHeight = 100
  ClientWidth = 456
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object LabelFind: TLabel
    Left = 8
    Top = 13
    Width = 433
    Height = 13
    AutoSize = False
    Caption = 'Unesite klju'#269' za pretragu:'
  end
  object ButtonFind: TButton
    Left = 8
    Top = 68
    Width = 75
    Height = 25
    Caption = 'Prona'#273'i...'
    Enabled = False
    TabOrder = 0
    OnClick = ButtonFindClick
  end
  object ButtonCancel: TButton
    Left = 366
    Top = 67
    Width = 75
    Height = 25
    Caption = 'Poni'#353'ti'
    TabOrder = 1
    OnClick = ButtonCancelClick
  end
  object EditFind: TEdit
    Left = 8
    Top = 32
    Width = 433
    Height = 21
    TabOrder = 2
    OnChange = EditFindChange
    OnKeyPress = EditFindKeyPress
  end
end
