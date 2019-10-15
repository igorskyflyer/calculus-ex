unit PositionList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.Menus, System.Types, System.UITypes;

type
  TFormPosition = class(TForm)
    Grid: TStringGrid;
    SaveFile: TSaveDialog;
    MainMenu: TMainMenu;
    MenuFile: TMenuItem;
    SubSaveAs: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure GridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SubSaveAsClick(Sender: TObject);
  private

  public
   procedure SortGrid;
  end;

var
  FormPosition: TFormPosition;

implementation

{$R *.dfm}

 uses Main;

procedure TFormPosition.FormShow(Sender: TObject);
begin
 Grid.Cells[0, 0]:='Rang';
 Grid.Cells[1, 0]:='Alternativa';
 Grid.Cells[2, 0]:='Mera odstupanja';
end;

procedure TFormPosition.GridDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
   CellString: string;
   Format: Integer;
begin
Format:=(DT_VCENTER Or DT_CENTER Or DT_SINGLELINE);
CellString:=Grid.Cells[ACol, ARow];
Grid.Canvas.Brush.Color:=Main.Config.Bg;
Grid.Canvas.Font.Color:=Main.Config.Font;
Grid.Canvas.Font.Name:=Main.Config.FontName;
Grid.Canvas.Font.Style:=[];
Grid.Canvas.Pen.Color:=clBlack;
Grid.Canvas.Pen.Width:=2;

 If (gdSelected In State) Then
  begin
   Grid.Canvas.Brush.Color:=Main.Config.Font;
   Grid.Canvas.Font.Color:=Main.Config.Bg;
  end
 Else
  If (gdFixed In State) Then
   begin
    Grid.Canvas.Brush.Color:=$00FF9900;
    Grid.Canvas.Font.Color:=clWhite;
    Grid.Canvas.Font.Style:=[fsBold];
   end;

Grid.Canvas.FillRect(Rect);
DrawText(Grid.Canvas.Handle, CellString, CellString.Length, Rect, Format);
Grid.Canvas.MoveTo(Rect.Left, Rect.Top);
Grid.Canvas.LineTo(Rect.Right, Rect.Top);
Grid.Canvas.MoveTo(Rect.Right, Rect.Top);
Grid.Canvas.LineTo(Rect.Right, Rect.Bottom);
end;

procedure TFormPosition.SortGrid;
var
   I, J: Integer;
   AltPos, Alt: string;
begin
 For I:=1 To Grid.RowCount-1 Do
  For J:=I+1 To Grid.RowCount-1 Do
   If (Grid.Cells[2, I].ToDouble>Grid.Cells[2, J].ToDouble) Then
    begin
     AltPos:=Grid.Cells[1, I];
     Alt:=Grid.Cells[2, I];

     Grid.Cells[1, I]:=Grid.Cells[1, J];
     Grid.Cells[2, I]:=Grid.Cells[2, J];

     Grid.Cells[1, J]:=AltPos;
     Grid.Cells[2, J]:=Alt;
    end;
end;

procedure TFormPosition.SubSaveAsClick(Sender: TObject);
begin
 If SaveFile.Execute Then
  begin
   Main.FormMain.SaveAsHTML(Grid, ChangeFileExt(SaveFile.FileName, '.html'));
   MessageBeep(MB_ICONINFORMATION);
   MessageDlg('Datoteka je uspešno sačuvana.', mtInformation, [mbOK], 0, mbOK);
  end;
end;

end.
