unit Results;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus, System.Math, System.UITypes;

type
  TFormResults = class(TForm)
    MemoResults: TMemo;
    MenuAlt: TMainMenu;
    SaveAlt: TSaveDialog;
    MainAltFile: TMenuItem;
    SubAltSaveAs: TMenuItem;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure SubAltSaveAsClick(Sender: TObject);
  private

  protected

  public

  end;

var
  FormResults: TFormResults;

implementation

{$R *.dfm}
{$SetPEFlags IMAGE_FILE_RELOCS_STRIPPED}
{$SetPEFlags IMAGE_FILE_LINE_NUMS_STRIPPED}
{$SetPEFlags IMAGE_FILE_LOCAL_SYMS_STRIPPED}
{$SetPEFlags IMAGE_FILE_DEBUG_STRIPPED}
{$SetPEFlags IMAGE_FILE_EXECUTABLE_IMAGE}

procedure TFormResults.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
If (Key=VK_ESCAPE) Then
 Close;
end;

procedure TFormResults.FormShow(Sender: TObject);
begin
 MemoResults.SelLength:=0;
 MemoResults.SelStart:=0;
end;

procedure TFormResults.SubAltSaveAsClick(Sender: TObject);
var
   Filename: string;
begin
 Randomize;
 Filename:=IntToStr(RandomRange(10000, MaxInt));
 SaveAlt.FileName:=Filename;
 If SaveAlt.Execute Then
  begin
   MemoResults.Lines.SaveToFile(ChangeFileExt(SaveAlt.FileName, '.txt'));
   MessageBeep(MB_ICONINFORMATION);
   MessageDlg('Datoteka je uspešno sačuvana!', mtInformation, [mbOK], 0, mbOK);
  end;
end;

end.
