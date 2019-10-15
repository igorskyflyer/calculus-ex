unit Lists;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, System.Types,
  Vcl.Menus, System.UITypes;

type
  TFormList = class(TForm)
    Grid: TStringGrid;
    MainMenu: TMainMenu;
    MenuFile: TMenuItem;
    SubSaveAs: TMenuItem;
    SaveFile: TSaveDialog;
    procedure FormShow(Sender: TObject);
    procedure GridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SubSaveAsClick(Sender: TObject);
  private

  public
   procedure SortGrid;
   procedure CalculateSp;
  end;

var
  FormList: TFormList;

implementation

{$R *.dfm}
{$SetPEFlags IMAGE_FILE_RELOCS_STRIPPED}
{$SetPEFlags IMAGE_FILE_LINE_NUMS_STRIPPED}
{$SetPEFlags IMAGE_FILE_LOCAL_SYMS_STRIPPED}
{$SetPEFlags IMAGE_FILE_DEBUG_STRIPPED}
{$SetPEFlags IMAGE_FILE_EXECUTABLE_IMAGE}

uses Main, PositionList;

procedure TFormList.FormShow(Sender: TObject);
begin
 Grid.Cells[0, 0]:='Rang';
 Grid.Cells[1, 0]:='Alternativa';
 Grid.Cells[2, 0]:='Sn';
 Grid.Cells[3, 0]:='Rn';
end;

procedure TFormList.GridDrawCell(Sender: TObject; ACol, ARow: Integer;
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

procedure TFormList.SubSaveAsClick(Sender: TObject);
begin
 If SaveFile.Execute Then
  begin
   Main.FormMain.SaveAsHTML(Grid, ChangeFileExt(SaveFile.FileName, '.html'));
   MessageBeep(MB_ICONINFORMATION);
   MessageDlg('Datoteka je uspešno sačuvana.', mtInformation, [mbOK], 0, mbOK);
  end;
end;

procedure TFormList.SortGrid;
var
   I, J: Integer;
   Sn, Rn: string;
   Alt: string;
begin
 CalculateSp;
 For I:=1 To Grid.RowCount-1 Do
  For J:=I+1 To Grid.RowCount-1 Do
   If (Grid.Cells[2, I].ToDouble>Grid.Cells[2, J].ToDouble) Then
    begin
     Alt:=Grid.Cells[1, I];
     Sn:=Grid.Cells[2, I];
     Rn:=Grid.Cells[3, I];
     Grid.Cells[1, I]:=Grid.Cells[1, J];
     Grid.Cells[2, I]:=Grid.Cells[2, J];
     Grid.Cells[3, I]:=Grid.Cells[3, J];

     Grid.Cells[1, J]:=Alt;
     Grid.Cells[2, J]:=Sn;
     Grid.Cells[3, J]:=Rn;
    end;
end;

procedure TFormList.CalculateSp;
var
   I: Integer;
   MaxS, MinS, MaxR, MinR, Sp: Double;
begin
 MaxS:=Grid.Cells[2, 1].ToDouble;
 MinS:=Grid.Cells[2, Grid.RowCount-1].ToDouble;
 MaxR:=Grid.Cells[3, 1].ToDouble;
 MinR:=Grid.Cells[3, Grid.RowCount-1].ToDouble;
 For I:=1 To Grid.RowCount-1 Do
  begin
   Sp:=((Grid.Cells[2, I].ToDouble-MaxS)/(MinS-MaxS))+((Grid.Cells[3,I].toDouble-MaxR)/(MinR-MaxR));
   PositionList.FormPosition.Grid.Cells[2, I]:=FormatFloat('0.000', Sp);
  end;
end;

end.
