unit Find;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.UITypes;

type
  TFindDialog=class(TForm)
    ButtonFind: TButton;
    ButtonCancel: TButton;
    LabelFind: TLabel;
    EditFind: TEdit;
    procedure EditFindChange(Sender: TObject);
    procedure ButtonCancelClick(Sender: TObject);
    procedure EditFindKeyPress(Sender: TObject; var Key: Char);
    procedure ButtonFindClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private

  public

  end;

var
  FindDialog: TFindDialog;

implementation

{$R *.dfm}
{$SetPEFlags IMAGE_FILE_RELOCS_STRIPPED}
{$SetPEFlags IMAGE_FILE_LINE_NUMS_STRIPPED}
{$SetPEFlags IMAGE_FILE_LOCAL_SYMS_STRIPPED}
{$SetPEFlags IMAGE_FILE_DEBUG_STRIPPED}
{$SetPEFlags IMAGE_FILE_EXECUTABLE_IMAGE}

uses Main;

procedure TFindDialog.ButtonCancelClick(Sender: TObject);
begin
 Close;
end;

procedure TFindDialog.ButtonFindClick(Sender: TObject);
var
  I, J: Integer;
  Found: Boolean;
begin
 Found:=False;

 If Not Main.FormMain.HasEmptyCells(Main.FormMain.Grid) Then
  begin
   For I:=3 To Main.FormMain.Grid.ColCount-1 Do
    For J:=1 To Main.FormMain.Grid.RowCount-1 Do
     If Main.FormMain.Grid.Cells[I, J]=EditFind.Text Then
      begin
       Main.Config.Cell.Col:=I;
       Main.Config.Cell.Row:=J;
       Main.FormMain.Grid.Repaint;
       Found:=True;
       Exit;
      end;
  end;

 If Not Found Then
  begin
   MessageBeep(MB_ICONERROR);
   MessageDlg('Zadati ključ nije pronađen.', mtError, [mbOK], 0);
  end;
end;

procedure TFindDialog.EditFindChange(Sender: TObject);
begin
 ButtonFind.Enabled:=EditFind.GetTextLen>0;
end;

procedure TFindDialog.EditFindKeyPress(Sender: TObject; var Key: Char);
var
   Cell: string;
begin
 Cell:=EditFind.Text;
 If (Not(Ord(Key) In ([48..57])) And (Not(Ord(Key) In [8..13])) And ((Key<>Main.Config.Separator))
   And (Not(Ord(Key)=45))) Then
  begin
    Beep;
    Key:=#0;
  end
 Else
  If (((Cell.CountChar(Main.Config.Separator)>0) Or (Cell.Length<1)) And (Key=Main.Config.Separator)) Then
   begin
    Beep;
    Key:=#0;
   end;
end;

procedure TFindDialog.FormKeyPress(Sender: TObject; var Key: Char);
begin
 If Key=#13 Then
  begin
   If EditFind.GetTextLen>0 Then
    ButtonFind.Click
   Else
    ButtonCancel.Click;
  end;
end;

procedure TFindDialog.FormShow(Sender: TObject);
begin
 EditFind.SetFocus;
end;

end.
