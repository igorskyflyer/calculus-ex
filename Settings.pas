unit Settings;

interface

uses
  Winapi.Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, System.UITypes, Vcl.ComCtrls, System.Win.Registry,
  Winapi.ShellAPI;

type
  TFormSettings = class(TForm)
    ColorPicker: TColorDialog;
    ButtonApply: TButton;
    ButtonCancel: TButton;
    CheckBoxClose: TCheckBox;
    Pages: TPageControl;
    TabTable: TTabSheet;
    LabelCellBg: TLabel;
    LabelCellText: TLabel;
    LabelFontName: TLabel;
    LabelFontSize: TLabel;
    BoxFonts: TComboBox;
    ColorCellBg: TEdit;
    ColorCellText: TEdit;
    EditFontSize: TEdit;
    UpDownFont: TUpDown;
    TabGeneral: TTabSheet;
    LabelSound: TLabel;
    BoxSound: TComboBox;
    TabFunctions: TTabSheet;
    GroupFill: TGroupBox;
    EditFillFrom: TEdit;
    EditFillTo: TEdit;
    UpDownFrom: TUpDown;
    UpDownTo: TUpDown;
    GroupFormat: TGroupBox;
    LabelFillInterval: TLabel;
    LabelFillFrom: TLabel;
    LabelFillTo: TLabel;
    LabelFormatDefault: TLabel;
    EditFormatNumber: TEdit;
    UpDownNum: TUpDown;
    TabConfig: TTabSheet;
    LabelResetConfig: TLabel;
    SaveConfig: TSaveDialog;
    OpenConfig: TOpenDialog;
    LabelImport: TLabel;
    LabelExport: TLabel;
    GroupConfig: TGroupBox;
    procedure ColorCellTextClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ColorCellBgClick(Sender: TObject);
    procedure ButtonApplyClick(Sender: TObject);
    procedure ButtonCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure LabelResetConfigClick(Sender: TObject);

    procedure LabelHover(Sender: TObject);
    procedure LabelUnHover(Sender: TObject);
    procedure LabelExportClick(Sender: TObject);
    procedure LabelImportClick(Sender: TObject);
  private
   procedure WINDOWPOSCHANGING(var Msg: TWMWindowPosChanging); message WM_WINDOWPOSCHANGING;
  public

  end;

var
  FormSettings: TFormSettings;

implementation

{$R *.dfm}
{$SetPEFlags IMAGE_FILE_RELOCS_STRIPPED}
{$SetPEFlags IMAGE_FILE_LINE_NUMS_STRIPPED}
{$SetPEFlags IMAGE_FILE_LOCAL_SYMS_STRIPPED}
{$SetPEFlags IMAGE_FILE_DEBUG_STRIPPED}
{$SetPEFlags IMAGE_FILE_EXECUTABLE_IMAGE}

uses Main, Splash;

procedure TFormSettings.WINDOWPOSCHANGING(var Msg: TWMWindowPosMsg);
begin
 inherited;
 If Visible Then
  begin
   Msg.WindowPos.x:=Left;
   Msg.WindowPos.y:=Top;
   Msg.Result:=0;
  end;
end;

procedure TFormSettings.LabelExportClick(Sender: TObject);
var
  ConfigFile: File Of TConfig;
  Filename: string;
begin
 If SaveConfig.Execute Then
  begin
   Filename:=ChangeFileExt(SaveConfig.Filename, '.cxc');
   AssignFile(ConfigFile, Filename);
   Rewrite(ConfigFile);
   Write(ConfigFile, Config);
   CloseFile(ConfigFile);
   MessageBeep(MB_ICONINFORMATION);
   MessageDlg('Podešavanja aplikacije su uspešno izvezena.', mtInformation, [mbOK], 0, mbOK);
  end;
end;

procedure TFormSettings.LabelHover(Sender: TObject);
begin
 Cursor:=crHandPoint;
 TLabel(Sender).Font.Style:=[fsBold];
 TLabel(Sender).Font.Size:=10;
end;

procedure TFormSettings.LabelImportClick(Sender: TObject);
var
  ConfigFile: File Of TConfig;
begin
 If OpenConfig.Execute Then
  begin
   AssignFile(ConfigFile, OpenConfig.FileName);
   Reset(ConfigFile);
   Read(ConfigFile, Config);
   CloseFile(ConfigFile);
   Main.FormMain.WriteConfig;
   Main.FormMain.Grid.Repaint;
   MessageBeep(MB_ICONINFORMATION);
   MessageDlg('Podešavanja aplikacije su uspešno uvezena.', mtInformation, [mbOK], 0, mbOK);
   Close;
  end;
end;

procedure TFormSettings.LabelUnHover(Sender: TObject);
begin
 Cursor:=crDefault;
 TLabel(Sender).Font.Style:=[];
 TLabel(Sender).Font.Size:=9;
end;

procedure TFormSettings.ButtonApplyClick(Sender: TObject);
var
   RegistryObj: TRegistry;
begin
 RegistryObj:=TRegistry.Create;
  try
   RegistryObj.RootKey:=HKEY_LOCAL_MACHINE;
   RegistryObj.OpenKey('SOFTWARE', False);
   RegistryObj.OpenKey('NeoVisio', True);
   RegistryObj.OpenKey('CalculusEx', True);
   RegistryObj.WriteString('BgColor', ColorToString(ColorCellBg.Color));
   RegistryObj.WriteString('TextColor', ColorToString(ColorCellText.Color));
   RegistryObj.WriteString('FontName', BoxFonts.Items[BoxFonts.ItemIndex]);
   RegistryObj.WriteInteger('FontSize', StrToInt(EditFontSize.Text));
   RegistryObj.WriteInteger('FormatNum', StrToInt(EditFormatNumber.Text));
   RegistryObj.WriteInteger('FillFrom', UpDownFrom.Position);
   RegistryObj.WriteInteger('FillTo', UpDownTo.Position);
   If (BoxSound.ItemIndex=0) Then
    RegistryObj.WriteInteger('Sound', 0)
   Else
    RegistryObj.WriteInteger('Sound', 1);
   RegistryObj.CloseKey;
  finally
   RegistryObj.Free;
  end;

 Main.FormMain.LoadConfig;

 If (Main.FormMain.Grid.Visible) Then
  begin
   Main.FormMain.Grid.Repaint;
   Main.FormMain.AdaptToWidth;
  end;

 If (CheckBoxClose.Checked) Then
  Close;
end;

procedure TFormSettings.ButtonCancelClick(Sender: TObject);
begin
 Close;
end;

procedure TFormSettings.ColorCellBgClick(Sender: TObject);
begin
 ColorPicker.Color:=ColorCellBg.Color;
 If (ColorPicker.Execute) Then
  ColorCellBg.Color:=ColorPicker.Color;
end;

procedure TFormSettings.ColorCellTextClick(Sender: TObject);
begin
 ColorPicker.Color:=ColorCellText.Color;
 If (ColorPicker.Execute) Then
  ColorCellText.Color:=ColorPicker.Color;
end;

procedure TFormSettings.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 If Main.FormMain.Grid.Visible Then
  begin
   Main.Config.SelCol:=-1;
   Main.Config.SelRow:=-1;
   Main.FormMain.Grid.Repaint;
  end;
end;

procedure TFormSettings.FormCreate(Sender: TObject);
begin
 UpDownFrom.Max:=MaxInt;
 UpDownTo.Max:=MaxInt;
end;

procedure TFormSettings.FormShow(Sender: TObject);
var
 PCReg: TRegistry;
begin
 PCReg:=TRegistry.Create;
 BoxFonts.Items.Assign(Screen.Fonts);
 ColorCellBg.Color:=Main.Config.Bg;
 ColorCellText.Color:=Main.Config.Font;
 BoxFonts.ItemIndex:=BoxFonts.Items.IndexOf(String(Main.Config.FontName));
 try
  PCReg.RootKey:=HKEY_LOCAL_MACHINE;
  PCReg.OpenKey('SOFTWARE\NeoVisio\CalculusEx', False);
  BoxSound.ItemIndex:=PCReg.ReadInteger('Sound');
  UpDownFont.Position:=PCReg.ReadInteger('FontSize');
  UpDownNum.Position:=PCReg.ReadInteger('FormatNum');
  UpDownFrom.Position:=PCReg.ReadInteger('FillFrom');
  UpDownTo.Position:=PCReg.ReadInteger('FillTo');
  PCReg.CloseKey;
 finally
  PCReg.Free;
 end;
end;

procedure TFormSettings.LabelResetConfigClick(Sender: TObject);
begin
 Main.Config.ForceClose:=True;
 MessageBeep(MB_ICONINFORMATION);
 MessageDlg('Aplikacija će sada biti zatvorena i njena podešavanja će biti vraćena na podrazumevana.', mtInformation, [mbOK], 0, mbOK);
 ShellExecute(Handle, 'open', PWideChar(ParamStr(0)), PWideChar('-setup'), Nil, SW_HIDE);
 Sleep(100);
 ShellExecute(Handle, 'open', PWideChar(ParamStr(0)), PWideChar('-reset'), Nil, SW_SHOW);
 Application.MainForm.Close;
end;

end.

