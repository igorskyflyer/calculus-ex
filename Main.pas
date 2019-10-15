unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, Menus, jpeg, pngimage, ShellAPI, ComCtrls, System.UITypes,
  System.Types, System.Win.Registry, System.Math, Vcl.AppEvnts;

type
 TGridCell=record
  Col, Row: Integer;
 end;

type
  TConfig=record
    Bg: TColor;
    Font: TColor;
    FontName: string[255];
    Criteria: Integer;
    Alternative: Integer;
    Filename: string[255];
    Modified: Boolean;
    Separator: Char;
    SelRow: Integer;
    SelCol: Integer;
    Cell: TGridCell;
    MinFill: Integer;
    MaxFill: Integer;
    DefaultDec: Integer;
    ForceClose: Boolean;
  end;

type
 TGridSize=record
  X, Y: Integer;
 end;

type
  TFormMain=class(TForm)
    Grid: TStringGrid;
    MainMenu: TMainMenu;
    PopupMenu: TPopupMenu;
    MainTable: TMenuItem;
    SubNewFile: TMenuItem;
    SubEmpty: TMenuItem;
    SubFill: TMenuItem;
    SubFormat: TMenuItem;
    SubSaveAs: TMenuItem;
    MainFile: TMenuItem;
    SaveTable: TSaveDialog;
    MainTools: TMenuItem;
    SubEnumerate: TMenuItem;
    SubOpen: TMenuItem;
    OpenTable: TOpenDialog;
    SubFontSize: TMenuItem;
    SubIncFont: TMenuItem;
    SubDecFont: TMenuItem;
    MainAbout: TMenuItem;
    SubExit: TMenuItem;
    SubSave: TMenuItem;
    N1: TMenuItem;
    MainWindow: TMenuItem;
    SubMinimizeWin: TMenuItem;
    Status: TStatusBar;
    SubSettings: TMenuItem;
    SubJump: TMenuItem;
    MainMethod: TMenuItem;
    SubCompromiseProg: TMenuItem;
    SubResults: TMenuItem;
    N2: TMenuItem;
    SubAutoCells: TMenuItem;
    SubRestart: TMenuItem;
    N3: TMenuItem;
    SubClose: TMenuItem;
    SubAlternatives: TMenuItem;
    SubPosition: TMenuItem;
    SubCRL: TMenuItem;
    SubAllResults: TMenuItem;
    N4: TMenuItem;
    SubView: TMenuItem;
    SubFullscreen: TMenuItem;
    SubStandard: TMenuItem;
    SubAuthor: TMenuItem;
    SubWebsite: TMenuItem;
    PopDelete: TMenuItem;
    SubFind: TMenuItem;
    App: TApplicationEvents;
    PopAdd: TMenuItem;
    procedure GridKeyPress(Sender: TObject; var Key: Char);
    procedure SubNewFileClick(Sender: TObject);
    procedure SubEmptyClick(Sender: TObject);
    procedure SubFillClick(Sender: TObject);
    procedure MainTableClick(Sender: TObject);
    procedure SubFormatClick(Sender: TObject);
    procedure SubSaveAsClick(Sender: TObject);
    procedure MainFileClick(Sender: TObject);
    procedure MainToolsClick(Sender: TObject);
    procedure SubEnumerateClick(Sender: TObject);
    procedure SubOpenClick(Sender: TObject);
    procedure SubIncFontClick(Sender: TObject);
    procedure SubDecFontClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SubExitClick(Sender: TObject);
    procedure SubMinimizeWinClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SubJumpClick(Sender: TObject);
    procedure MainWindowClick(Sender: TObject);
    procedure SubSettingsClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SubAutoCellsClick(Sender: TObject);
    procedure SubRestartClick(Sender: TObject);
    procedure GridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure GridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure StatusHint(Sender: TObject);
    procedure SubResultsClick(Sender: TObject);
    procedure SubCloseClick(Sender: TObject);
    procedure SubAlternativesClick(Sender: TObject);
    procedure SubPositionClick(Sender: TObject);
    procedure SubCRLClick(Sender: TObject);
    procedure SubFullscreenClick(Sender: TObject);
    procedure SubStandardClick(Sender: TObject);
    procedure SubSaveClick(Sender: TObject);
    procedure SubCompromiseProgClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SubWebsiteClick(Sender: TObject);
    procedure SubAuthorClick(Sender: TObject);
    procedure GridMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure GridSetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: string);
    procedure GridClick(Sender: TObject);
    procedure GridMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PopDeleteClick(Sender: TObject);
    procedure MenuDrawItem(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; Selected: Boolean);
    procedure MenuMeasureItem(Sender: TObject; ACanvas: TCanvas;
      var Width, Height: Integer);
    procedure SubFindClick(Sender: TObject);
    procedure GridMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SubAllResultsClick(Sender: TObject);
    procedure AppException(Sender: TObject; E: Exception);
    procedure PopupMenuPopup(Sender: TObject);
    procedure PopAddClick(Sender: TObject);
  private

  public
   procedure Calculate;
   procedure AcceptFiles(var Msg: TWMDropFiles); message WM_DROPFILES;
   procedure OpenExFile(const Filename: string);
   procedure SaveExFile(const Filename: string);
   procedure SaveAsHTML(const StringGrid: TStringGrid; const Filename: string);
   procedure GenerateGrid(const Cols, Rows: Integer; const ColWidth, RowHeight: Integer); overload;
   procedure GenerateGrid(const Criteria, Alternatives: Integer); overload;
   procedure EnumerateGrid;
   procedure FormatCells;
   procedure EmptyCells(const Forced: Boolean=False);
   procedure FillCells(const Min: Integer=0; Max: Integer=0);
   procedure JumpTo(const Criteria, Alternative: Integer);
   procedure LoadConfig;
   procedure AdaptToWidth(const IsBlank: Boolean=False);
   procedure GetBitmap (const ABitmap: TBitmap);
   procedure WriteConfig;
   procedure InvokeBrowser(const Filename: string);
   procedure SetSelection(const Col, Row: Integer);
   procedure DeleteRow;
   procedure DeleteColumn;
   procedure SetModifiedState(const Value: Boolean=True);
   procedure DoneCalculating(Sender: TObject);
   procedure AddAlternative;
   procedure AddCriteria;

   function HasEmptyCells(const StringGrid: TStringGrid): Boolean;
   function GetRelativeImportance(const Number: Integer): Double;
   function GetDemand(const Number: Integer): Integer;
   function GetMax(const Number: Integer): Double;
   function GetMin(const Number: Integer): Double;
   function GetDesiredValue(const Number: Integer): Double;
   function GetNonDesiredValue(const Number: Integer): Double;
   function GetSelectedValue(const Col, Row: Integer): Double;
   function GetGridSize: TGridSize;
   function GetNegativeColor(const InputColor: TColor): TColor;
   function GetModifiedState: Boolean;
  end;

const
     MAX_FIELDS=300;
var
  FormMain: TFormMain;
  Config: TConfig;
  HTML_Icon: TBytes;

implementation

{$R *.dfm}
{$SetPEFlags IMAGE_FILE_RELOCS_STRIPPED}
{$SetPEFlags IMAGE_FILE_LINE_NUMS_STRIPPED}
{$SetPEFlags IMAGE_FILE_LOCAL_SYMS_STRIPPED}
{$SetPEFlags IMAGE_FILE_DEBUG_STRIPPED}
{$SetPEFlags IMAGE_FILE_EXECUTABLE_IMAGE}

uses Settings, Results, Lists, PositionList, About, Find;

procedure TFormMain.OpenExFile(const Filename: string);
var
   FS: TFileStream;
   Crit, Alt, I, J: Integer;
   Data: Double;
begin
 Grid.Hide;
 Status.SimpleText:='Učitavanje datoteke u toku...';
 FS:=TFileStream.Create(Filename, fmOpenRead);
  try
   FS.Read(Crit, 4);
   FS.Read(Alt, 4);
   If (Crit<1) Or (Crit>MAX_FIELDS) Or (Alt<1) Or (Alt>MAX_FIELDS) Then
    begin
     MessageBeep(MB_ICONERROR);
     MessageDlg('Datoteka nije validna!', mtError, [mbOK], 0, mbOK);
     Status.SimpleText:='';
     Exit;
    end;
    GenerateGrid(Crit, Alt);
    For I:=1 To Grid.ColCount-1 Do
     For J:=1 To Grid.RowCount-1 Do
      begin
       FS.Read(Data, SizeOf(Double));
       If Data=INFINITE Then
        Grid.Cells[I, J]:=''
       Else
        Grid.Cells[I, J]:=FloatToStr(Data);
      end;
  finally
   FS.Free;
    end;
Config.Criteria:=Crit;
Config.Alternative:=Alt;
Status.SimpleText:='Učitana datoteka: '+ExtractFileName(Filename);
Caption:='CalculusEx - '+Copy(ChangeFileExt(ExtractFileName(Filename), ''), 1, 50);
AdaptToWidth;
Grid.Show;
Config.Filename:=Filename;
end;

procedure TFormMain.PopAddClick(Sender: TObject);
begin
If (Config.SelCol>2) Then
 AddAlternative
Else
If (Config.SelRow>0) Then
 AddCriteria;
SetSelection(-1, -1);
end;

procedure TFormMain.PopDeleteClick(Sender: TObject);
begin
If (Config.SelCol>2) Then
 DeleteColumn
Else
If (Config.SelRow>0) Then
 DeleteRow;
SetSelection(-1, -1);
end;

procedure TFormMain.PopupMenuPopup(Sender: TObject);
begin
 If Config.SelCol>2 Then
  begin
   PopDelete.Caption:='Izbriši alternativu';
   PopAdd.Caption:='Dodaj alternativu';
  end
 Else
 If Config.SelRow>0 Then
 begin
  PopDelete.Caption:='Izbriši kriterijum';
  PopAdd.Caption:='Dodaj kriterijum';
 end;
end;

procedure TFormMain.SaveExFile(const Filename: string);
var
 FS: TFileStream;
 I, J: Integer;
 Data: Double;
begin
 FS:=TFileStream.Create(ChangeFileExt(FileName, '.cxf'), fmCreate);
  try
   FS.Write(Config.Criteria, 4);
   FS.Write(Config.Alternative, 4);
   For I:=1 To Grid.ColCount-1 Do
    For J:=1 To Grid.RowCount-1 Do
     begin
     If Length(Grid.Cells[I, J])>0 Then
      Data:=StrToFloat(Grid.Cells[I, J])
     Else
      Data:=INFINITE;
     FS.Write(Data, SizeOf(Double));
     end;
  finally
   Config.Filename:=String(ChangeFileExt(FileName, '.cxf'));
   FS.Free;
  end;
end;

procedure TFormMain.SaveAsHTML(const StringGrid: TStringGrid; const Filename: string);
var
 HTMLFile: TStringStream;
 Data: String;
 rgbBg, rgbText: string;
 TD, TR: Integer;
begin
 Config.Filename:=ChangeFileExt(Filename, '.html');
 rgbBg:='rgb('+GetRValue(ColorToRGB(Config.Bg)).ToString+', '+GetGValue(ColorToRGB(Config.Bg)).ToString+', '+GetBValue(ColorToRGB(Config.Bg)).ToString+')';
 rgbText:='rgb('+GetRValue(ColorToRGB(Config.Font)).ToString+', '+GetGValue(ColorToRGB(Config.Font)).ToString+', '+GetBValue(ColorToRGB(Config.Font)).ToString+')';
 Data:=
  '<!doctype html>'+#13#10+'<html>'
  +#13#10+'<head>' +#13#10
  +'<title>Metoda kompromisnog programiranja - '+ChangeFileExt(ExtractFileName(FileName), '')+'</title>'
  +#13#10
  +'<meta http-equiv="content-type" content="text/html; charset=UTF-8" />'
  +#13#10
  +'<meta charset="utf-8" />'+#13#10
  +'<link rel="icon" href="'+TEncoding.UTF8.GetString(HTML_Icon)+'" />'
  +#13#10
  +'<style>'
  +#13#10
  +'table {margin: auto auto; table-layout: fixed; font-size: x-large; color: '+rgbText+';'
  +' border: '+(StringGrid.Canvas.Pen.Width.toString)+'px solid rgb(0, 0, 0); text-align: center;}'
  +#13#10
  +'th {background-color:rgb(0, 132, 255); padding: 10px; border: '+(StringGrid.Canvas.Pen.Width.toString)+'px solid rgb(0, 0, 0);}'
  +#13#10
  +'tr {background-color: '+rgbBg+'; padding: 10px; border: '+(StringGrid.Canvas.Pen.Width.toString)+'px solid rgb(0, 0, 0);}'
  +#13#10
  +'td {border: '+(StringGrid.Canvas.Pen.Width.toString)+'px solid rgb(0, 0, 0);}'
  +#13#10
  +'</style>'
  +#13#10+'</head>'
  +#13#10
  +'<body>'+#13#10
  +'<table><caption>Metoda kompromisnog programiranja</caption>';

 For TR:=0 To StringGrid.RowCount-1 Do
  begin
  Data:=Data+'<tr>';
    For TD:=0 To StringGrid.ColCount-1 Do
     If (TR>0) And (TD>0) Then
      Data:=Data+'<td>'+StringGrid.Cells[TD, TR]+'</td>'
     Else
      Data:=Data+'<th>'+StringGrid.Cells[TD, TR]+'</th>';
  Data:=Data+'</tr>';
  end;

 Data:=Data+'</table>'+#13#10+'</body>'+#13#10+'</html>';
 HTMLFile:=TStringStream.Create(Data, TEncoding.UTF8);
 try
  HTMLFile.SaveToFile(String(Config.Filename));
 finally
  HTMLFile.Free;
 end;
end;

procedure TFormMain.AcceptFiles(var Msg: TWMDropFiles);
var
   Filename: Array[0..MAX_PATH] Of Char;
begin
  DragQueryFile(Msg.Drop, 0, Filename, MAX_PATH);
  OpenExFile(Filename);
  DragFinish(Msg.Drop);
end;

procedure TFormMain.FormShow(Sender: TObject);
begin
 DragAcceptFiles(Handle, True);
 If FileExists(ParamStr(1)) Then
  OpenExFile(ParamStr(1));
end;

procedure TFormMain.GenerateGrid(const Cols, Rows: Integer; const ColWidth, RowHeight: Integer);
begin
Grid.DefaultColWidth:=ColWidth;
Grid.DefaultRowHeight:=RowHeight;

If (Cols<=0) Or (Rows<=0) Then
 begin
  Grid.RowCount:=(ClientHeight Div Grid.DefaultRowHeight)-1;
  Grid.ColCount:=(ClientWidth Div Grid.DefaultColWidth)-1;
 end
Else
 begin
  Grid.RowCount:=Rows+1;
  Grid.ColCount:=Cols+1;
 end;

EnumerateGrid;
end;

procedure TFormMain.GenerateGrid(const Criteria: Integer; const Alternatives: Integer);
begin
 Grid.ColCount:=Alternatives+3;
 Grid.RowCount:=Criteria+1;
 Grid.FixedCols:=1;
 EnumerateGrid;
 If (Assigned(Lists.FormList)) And (Assigned(PositionList.FormPosition)) Then
  begin
   Lists.FormList.Grid.ColCount:=4;
   Lists.FormList.Grid.RowCount:=Alternatives+1;
   PositionList.FormPosition.Grid.ColCount:=3;
   PositionList.FormPosition.Grid.RowCount:=Alternatives+1;
  end;
end;

procedure TFormMain.EnumerateGrid;
var
	 Cols, Rows, CurrAlt: Integer;
begin
 CurrAlt:=1;
 Grid.Perform(WM_SETREDRAW, 0, 0);
 Grid.Cells[0, 0]:='Broj';
 Grid.Cells[1, 0]:='W';
 Grid.Cells[2, 0]:='Zahtev (0/1)';

 For Cols:=3 To Grid.ColCount-1 Do
  begin
   Grid.Cells[Cols, 0]:='a'+IntToStr(CurrAlt);
   Inc(CurrAlt);
  end;

 For Rows:=1 To Grid.RowCount-1 Do
  Grid.Cells[0, Rows]:='f'+IntToStr(Rows);

 Grid.Perform(WM_SETREDRAW, 1, 0);
 Grid.Repaint;
 Grid.Show;
end;

procedure TFormMain.FormatCells;
var
	 I, J: Integer;
   NumDec: Integer;
   StrNum: string;
begin
  StrNum:=InputBox('Formatiranje podataka', 'Unesite broj decimala:', Config.DefaultDec.ToString);
  If (Not TryStrToInt(StrNum, NumDec)) Or ((NumDec>16) Or (NumDec<0)) Then
   begin
    MessageBeep(MB_ICONERROR);
    MessageDlg('Uneta vrednost nije validna!'+#13#10+'Unesite vrednost u rasponu od 0 do 16.', mtError, [mbOK], 0, mbOK);
    Exit;
   end;
	If (NumDec>=0) And (NumDec<=16) Then
  	begin
     Grid.Perform(WM_SETREDRAW, 0, 0);
			For I:=3 To Grid.ColCount-1 Do
   		 For J:=1 To Grid.RowCount-1 Do
   			begin
   			 If Grid.Cells[I, J]<>'' Then
    			Grid.Cells[I, J]:=Format('%0.'+IntToStr(NumDec)+'f', [StrToFloat(Grid.Cells[I, J])]);
		   	end;
     AdaptToWidth;
		end;
end;

procedure TFormMain.JumpTo(const Criteria: Integer; const Alternative: Integer);
begin
 Grid.Col:=Alternative+2;
 Grid.Row:=Criteria;
end;

procedure TFormMain.LoadConfig;
var
   RegistryObj: TRegistry;
begin
 RegistryObj:=TRegistry.Create;
  try
   RegistryObj.RootKey:=HKEY_LOCAL_MACHINE;
   RegistryObj.OpenKey('SOFTWARE\NeoVisio\CalculusEx', False);
   If (RegistryObj.ReadString('BgColor')<>'') Then
    Config.Bg:=StringToColor(RegistryObj.ReadString('BgColor'));
   If (RegistryObj.ReadString('TextColor')<>'') Then
    Config.Font:=StringToColor(RegistryObj.ReadString('TextColor'));
   If (RegistryObj.ReadString('FontName')<>'') Then
    Config.FontName:= RegistryObj.ReadString('FontName');
   If (RegistryObj.ReadInteger('FontSize')>4) And (RegistryObj.ReadInteger('FontSize')<501) Then
     Grid.Canvas.Font.Size:=RegistryObj.ReadInteger('FontSize');
   If (RegistryObj.ReadInteger('FormatNum')>-1) And (RegistryObj.ReadInteger('FormatNum')<10) Then
     Config.DefaultDec:=RegistryObj.ReadInteger('FormatNum');
   If (RegistryObj.ReadInteger('FillFrom')>-1) And (RegistryObj.ReadInteger('FillFrom')<MaxInt) Then
     Config.MinFill:=RegistryObj.ReadInteger('FillFrom');
   If (RegistryObj.ReadInteger('FillTo')>-1) And (RegistryObj.ReadInteger('FillTo')<MaxInt) Then
     Config.MaxFill:=RegistryObj.ReadInteger('FillTo');
   RegistryObj.CloseKey;
  finally
   RegistryObj.Free;
  end;
end;

function TFormMain.GetRelativeImportance(const Number: Integer): Double;
begin
 Result:=0;
 If (Grid.RowCount>Number) Then
  Result:=(Grid.Cells[1, Number]).ToDouble;
end;

function TFormMain.GetDemand(const Number: Integer): Integer;
begin
 Result:=0;
 If (Grid.RowCount>Number) Then
  Result:=(Grid.Cells[2, Number].ToInteger);
end;

function TFormMain.GetMax(const Number: Integer): Double;
var
   Col: Integer;
begin
 Result:=0;
 If (Grid.RowCount>Number) Then
  For Col:=3 To Grid.ColCount-1 Do
   If (Result<(Grid.Cells[Col, Number]).ToDouble) Then
     Result:=(Grid.Cells[Col, Number].ToDouble);
end;

function TFormMain.GetMin(const Number: Integer): Double;
var
   Col: Integer;
begin
 Result:=(Grid.Cells[3, 1]).ToDouble;
 If (Grid.RowCount>Number) Then
  For Col:=3 To Grid.ColCount-1 Do
   If (Result>(Grid.Cells[Col, Number]).ToDouble) Then
     Result:=(Grid.Cells[Col, Number].ToDouble);
end;

function TFormMain.GetDesiredValue(const Number: Integer): Double;
begin
 If (GetDemand(Number)=0) Then
  Result:=GetMin(Number)
 Else
  Result:=GetMax(Number);
end;

function TFormMain.GetNonDesiredValue(const Number: Integer): Double;
begin
 If (GetDemand(Number)=0) Then
  Result:=GetMax(Number)
 Else
  Result:=GetMin(Number);
end;

function TFormMain.GetSelectedValue(const Col, Row: Integer): Double;
begin
 Result:=0;
 If (Grid.ColCount>Col) And (Grid.RowCount>Row) Then
  Result:=(Grid.Cells[Col, Row].toDouble);
end;


function TFormMain.GetGridSize: TGridSize;
var
   CellRect: TRect;
begin
 CellRect:=Grid.CellRect(Grid.ColCount-1, Grid.RowCount-1);
 Result.X:=CellRect.BottomRight.X;
 Result.Y:=CellRect.BottomRight.Y;
end;

procedure TFormMain.GetBitmap(const ABitmap: TBitmap);
var
   ControlCanvas: TControlCanvas;
   Size: TGridSize;
begin
 ControlCanvas:=TControlCanvas.Create;
 Size:=GetGridSize;
 try
  ControlCanvas.Handle:=Grid.Canvas.Handle;
  ABitmap.SetSize(Size.X, Size.Y);
  BitBlt(ABitmap.Canvas.Handle, 0, 0, ABitmap.Width, ABitmap.Height, ControlCanvas.Handle, 0, 0, SRCCOPY);
 finally
  ReleaseDC(Grid.Handle, ControlCanvas.Handle);
  ControlCanvas.Free;
 end;
end;

procedure TFormMain.WriteConfig;
var
  PC: TRegistry;
begin
 PC:=TRegistry.Create;
  try
   PC.RootKey:=HKEY_LOCAL_MACHINE;
   PC.OpenKey('SOFTWARE', False);
   PC.OpenKey('NeoVisio', True);
   PC.OpenKey('CalculusEx', True);
   PC.WriteString('BgColor', ColorToString(Config.Bg));
   PC.WriteString('TextColor', ColorToString(Config.Font));
   PC.WriteString('FontName', String(Config.FontName));
   PC.WriteInteger('FontSize', Grid.Canvas.Font.Size);
   PC.WriteInteger('FormatNum', Config.DefaultDec);
   PC.WriteInteger('FillFrom', Config.MinFill);
   PC.WriteInteger('FillTo', Config.MaxFill);
   PC.CloseKey;
  finally
   PC.Free;
  end;
end;

procedure TFormMain.InvokeBrowser(const Filename: string);
var
   Dialog: Integer;
begin
 Dialog:=MessageDlg('Da li želite da pregledate HTML dokument?', mtConfirmation, [mbYes, mbNo], 0, mbNo);
 If Dialog=mrYes Then
  ShellExecute(Handle, 'open', PWideChar(Filename), Nil, Nil, SW_SHOWNORMAL);
end;

procedure TFormMain.SetSelection(const Col: Integer; const Row: Integer);
begin
 If (Col>2) Or (Row>0) Then
  Grid.PopupMenu:=PopupMenu
 Else
  Grid.PopupMenu:=Nil;
 Config.SelRow:=Row;
 Config.SelCol:=Col;
 Grid.Repaint;
end;

function TFormMain.GetNegativeColor(const InputColor: TColor): TColor;
begin
 Result:=RGB(255-GetRValue(InputColor), 255-GetGValue(InputColor), 255-GetBValue(InputColor))
end;

procedure TFormMain.DeleteRow;
var
   I: Integer;
begin
 If Config.SelRow<Grid.RowCount Then
  begin
   For I:=Config.SelRow To Grid.RowCount-2 Do
    Grid.Rows[I].Assign(Grid.Rows[I+1]);
   Grid.RowCount:=Grid.RowCount-1;
   EnumerateGrid;
  end;
end;

procedure TFormMain.DeleteColumn;
var
   I: Integer;
begin
 If Config.SelCol<Grid.ColCount Then
  begin
   For I:=Config.SelCol To Grid.ColCount-2 Do
    Grid.Cols[I].Assign(Grid.Cols[I+1]);
   Grid.ColCount:=Grid.ColCount-1;
   EnumerateGrid;
  end;
end;

procedure TFormMain.SetModifiedState(const Value: Boolean);
begin
If Config.Modified<>Value Then
 Config.Modified:=Value;
end;

procedure TFormMain.AddAlternative;
begin
 GenerateGrid(Config.Criteria, Config.Alternative+1);
 Inc(Config.Alternative);
end;

procedure TFormMain.AddCriteria;
begin
 GenerateGrid(Config.Criteria+1, Config.Alternative);
 Inc(Config.Criteria);
end;

function TFormMain.GetModifiedState;
begin
 Result:=Config.Modified;
end;

procedure TFormMain.DoneCalculating(Sender: TObject);
begin
 Status.SimpleText:='';
 Results.FormResults.Show;
end;

{********************************************************




*********************************************************}

procedure TFormMain.FormClose(Sender: TObject; var Action: TCloseAction);
Var
   Dialog: Integer;
begin
 If Config.ForceClose Then Exit;

 If GetModifiedState Then
  begin
   Action:=caNone;
   Beep;
   Dialog:=MessageDlg('Da li želite da sačuvate aktivnu datoteku?', mtConfirmation, [mbYes, mbClose, mbCancel], 0, mbYes);
 If Dialog=mrYes Then
  begin
   If FileExists(String(Config.Filename)) Then
    SaveExFile(String(Config.Filename))
   Else
    SubSaveAs.Click;
  end
 Else
 If Dialog=mrClose Then
  begin
   Action:=caFree;
   DragAcceptFiles(Handle, False);
  end;
 end;
end;

procedure TFormMain.FormCreate(Sender: TObject);
var
   Format: TFormatSettings;
   RS: TResourceStream;
begin
 {$FINITEFLOAT OFF}
 SetErrorMode(SEM_FAILCRITICALERRORS);
 LoadConfig;
 Format:=FormatSettings;
 Config.Separator:=Format.DecimalSeparator;
 Application.OnException:=AppException;
 SetModifiedState(False);
 Screen.MenuFont.Style:=[fsBold];
 Config.Cell.Col:=-1;
 Config.Cell.Row:=-1;

 If (FindResource(HInstance, 'html_icon', 'HTML')<>0) Then
  begin
   RS:=TResourceStream.Create(HInstance, 'html_icon', 'HTML');
   try
    SetLength(HTML_Icon, RS.Size);
    RS.Read(HTML_Icon[0], RS.Size);
   finally
    RS.Free;
   end;
  end;
end;

procedure TFormMain.FormKeyPress(Sender: TObject; var Key: Char);
begin
 If (Key=#116) Then
  Repaint;
end;

procedure TFormMain.EmptyCells(const Forced: Boolean=False);
var
	 I, J: Integer;
begin
If Not Forced Then
 MessageBeep(MB_ICONEXCLAMATION);
If ((Not Forced) And (MessageDlg('Da li ste sigurni da želite da ispraznite trenutnu tabelu?', mtConfirmation, [mbYes, mbNo], 0, mbYes)=mrYes)) Or (Forced) Then
 begin
  Grid.Perform(WM_SETREDRAW, 1, 0);
  For I:=1 To Grid.ColCount-1 Do
   For J:=1 To Grid.RowCount-1 Do
    Grid.Cells[I, J]:='';
   Grid.Perform(WM_SETREDRAW, 1, 0);
   Grid.Repaint;
   SetModifiedState;
 end;
end;

procedure TFormMain.FillCells(const Min: Integer = 0; Max: Integer = 0);
var
	 I, J: Integer;
   MaxVal, MinVal: Integer;
begin
Randomize;
MaxVal:=1000;
MinVal:=99;
If (Min>-1) And (Max>-1) And (Min<Max) Then
 begin
  MaxVal:=Max;
  MinVal:=Min;
 end;
Grid.Perform(WM_SETREDRAW, 0, 0);

 For I:=1 To Grid.ColCount-1 Do
  For J:=1 To Grid.RowCount-1 Do
   If (I>2) Then
    Grid.Cells[I, J]:=FloatToStr(StrToFloat(IntToStr(RandomRange(MinVal, MaxVal)+1)+Config.Separator+IntToStr(Random(99)+1)))
   Else
    If (I=2) Then
     Grid.Cells[I, J]:=FloatToStr(StrToFloat(IntToStr(RandomFrom([0, 1]))))
   Else
    If (I=1) Then
     Grid.Cells[I, J]:=FloatToStr(StrToFloat('0'+Config.Separator+IntToStr(RandomRange(1, 99))));

Grid.Perform(WM_SETREDRAW, 1, 0);
Grid.Repaint;
SetModifiedState;
end;

procedure TFormMain.AdaptToWidth(const IsBlank: Boolean=False);
var
	 I, J, CalculatedWidth, CalculatedHeight, TestWidth: Integer;
   Size: TGridSize;
begin
Grid.Perform(WM_SETREDRAW, 0, 0);

If (Not IsBlank) Then
 begin
  CalculatedHeight:=Grid.Canvas.TextHeight('0')+4;
  For I:=0 To Grid.ColCount-1 Do
   begin
    CalculatedWidth:=0;
    For J:=0 To Grid.RowCount-1 Do
     If (Length(Grid.Cells[I, J])>0) Then
      begin
       TestWidth:=(Grid.Canvas.TextWidth('0')*(Grid.Cells[I, J].Length+4));
       If (TestWidth>CalculatedWidth) Then
        CalculatedWidth:=TestWidth;
      end;
     Grid.ColWidths[I]:=CalculatedWidth;
    end;
   Grid.DefaultRowHeight:=CalculatedHeight;
  end;

Size:=GetGridSize;
If (Screen.WorkAreaWidth>Size.X) And (Screen.WorkAreaHeight>Size.Y) Then
 begin
  Constraints.MinWidth:=Size.X;
  Constraints.MinHeight:=Size.Y;
 end
Else
 begin
  Constraints.MinWidth:=0;
  Constraints.MinHeight:=0;
 end;

Grid.Perform(WM_SETREDRAW, 1, 0);
Grid.Repaint;
Repaint;
end;

procedure TFormMain.AppException(Sender: TObject; E: Exception);
begin
If (E is EDivByZero) Or (E is EZeroDivide) Or (E is EInvalidOperation) Or (E is EMathError) Then
 ShowMessage('Greška pri proračunu!'+#13#10+'Proverite unete podatke i pokušajte ponovo');
end;

function TFormMain.HasEmptyCells(const StringGrid: TStringGrid): Boolean;
var
   I, J: Integer;
begin
Result:=False;
If (Not StringGrid.Visible) Then
 begin
  Result:=True;
  Exit;
 end;
For I:=1 To StringGrid.ColCount-1 Do
 For J:=0 To StringGrid.RowCount-1 Do
  If (StringGrid.Cells[I, J]='') Then
   begin
    Result:=True;
    Exit;
   end;
end;

procedure TFormMain.GridClick(Sender: TObject);
var
   Col, Row: Integer;
begin
 Col:=Grid.Col;
 Row:=Grid.Row;
 Config.Cell.Col:=-1;
 Config.Cell.Row:=-1;
 Config.SelCol:=-1;
 Config.SelRow:=-1;
 Grid.Repaint;

 If (Col>-1) And (Row>-1) And (Grid.Cells[Col, Row]<>'') And (Grid.Cells[Col, Row]<>Status.SimpleText) Then
  Status.SimpleText:='['+(Grid.Col.ToString)+', '+(Grid.Row.ToString)+'] = '+Grid.Cells[Col, Row];
end;

procedure TFormMain.GridDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
   CellString: string;
   Format: Integer;
begin
Format:=(DT_VCENTER Or DT_CENTER Or DT_SINGLELINE);
CellString:=Grid.Cells[ACol, ARow];
Grid.Canvas.Brush.Color:=Config.Bg;
Grid.Canvas.Font.Color:=Config.Font;
Grid.Canvas.Font.Name:=String(Config.FontName);
Grid.Canvas.Font.Style:=[];

 If gdSelected In State Then
  begin
   Grid.Canvas.Brush.Color:=Config.Font;
   Grid.Canvas.Font.Color:=Config.Bg;
  end
 Else
  If gdFixed In State Then
   begin
    Grid.Canvas.Brush.Color:=$00FF9900;
    Grid.Canvas.Font.Color:=clWhite;
    Grid.Canvas.Font.Style:=[fsBold];
   end;

 If (Config.SelRow>0) And (ARow=Config.SelRow) Then
  begin
   Grid.Canvas.Brush.Color:=GetNegativeColor(Config.Bg);
   Grid.Canvas.Font.Color:=GetNegativeColor(Config.Font);
   Grid.Canvas.Font.Style:=[fsBold];
   If (ACol=0) Or (ARow=0) Then
    begin
     Grid.Canvas.Brush.Color:=clBlue;
     Grid.Canvas.Font.Color:=clWhite;
    end;
  end;

 If (Config.SelCol>2) And (ACol=Config.SelCol) Then
  begin
   Grid.Canvas.Brush.Color:=GetNegativeColor(Config.Bg);
   Grid.Canvas.Font.Color:=GetNegativeColor(Config.Font);
   Grid.Canvas.Font.Style:=[fsBold];
   If (ACol=0) Or (ARow=0) Then
    begin
     Grid.Canvas.Brush.Color:=clBlue;
     Grid.Canvas.Font.Color:=clWhite;
    end;
  end;

 If (Config.Cell.Col=ACol) And (Config.Cell.Row=ARow) Then
  begin
   Grid.Canvas.Brush.Color:=GetNegativeColor(Config.Bg);
   Grid.Canvas.Font.Color:=GetNegativeColor(Config.Font);
   Grid.Canvas.Font.Style:=[fsItalic, fsBold];
  end;

Grid.Canvas.FillRect(Rect);
DrawText(Grid.Canvas.Handle, CellString, CellString.Length, Rect, Format);
end;

procedure TFormMain.GridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 If Key=VK_F5 Then
  Grid.Repaint;
end;

procedure TFormMain.GridKeyPress(Sender: TObject; var Key: Char);
var
   Cell: string;
begin
 Cell:=Grid.Cells[Grid.Col, Grid.Row];
 If (Grid.Col=2) Then
  begin
   If ((Key<>'0') And (Key<>'1') And (Key<>#8)) Or ((Cell.Length>=1) And (Key<>#8)) Then
    begin
     Beep;
     Key:=#0;
    end;
  end
 Else
 If (Not(Ord(Key) In ([48..57])) And (Not(Ord(Key) In [8..13])) And ((Key<>Config.Separator))
   And (Not(Ord(Key)=45))) Then
  begin
    Beep;
    Key:=#0;
  end
 Else
  If (((Cell.CountChar(Config.Separator)>0) Or (Cell.Length<1)) And (Key=Config.Separator)) Then
   begin
    Beep;
    Key:=#0;
   end;
end;

procedure TFormMain.GridMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
   Col, Row: Integer;
   Coords: TPoint;
begin
 Grid.MouseToCell(X, Y, Col, Row);
 ClientToScreen(Coords);

 If (Col>2) Or (Row>0) Then
  Grid.Options:=Grid.Options+[goColMoving, goRowMoving]
 Else
  Grid.Options:=Grid.Options-[goColMoving, goRowMoving];
end;

procedure TFormMain.GridMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
 Col, Row: Integer;
begin
 Grid.MouseToCell(X, Y, Col, Row);
 If (Col>-1) And (Row>-1) And (Grid.Cells[Col, Row]<>'') Then
  Status.SimpleText:='['+(Col.toString)+', '+(Row.toString)+'] = '+Grid.Cells[Col, Row];
end;

procedure TFormMain.GridMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
   Col, Row: Integer;
   Coords: TPoint;
begin
Grid.MouseToCell(X, Y, Col, Row);
ClientToScreen(Coords);

If (Col<=Grid.ColCount-1) And (Row=0) Then
 SetSelection(Col, -1)
Else
 If (Row<=Grid.RowCount-1) And (Col=0) Then
  SetSelection(-1, Row);

 If (Col>2) Or (Row>0) Then
  Grid.Options:=Grid.Options+[goColMoving, goRowMoving]
 Else
  Grid.Options:=Grid.Options-[goColMoving, goRowMoving];
end;

procedure TFormMain.GridSetEditText(Sender: TObject; ACol, ARow: Integer;
  const Value: string);
begin
If (Grid.Cells[ACol, ARow]<>Value) Then
 SetModifiedState;
end;

procedure TFormMain.SubIncFontClick(Sender: TObject);
begin
 If (Grid.Canvas.Font.Size>=4) And (Grid.Canvas.Font.Size<501) Then
  begin
   Grid.Canvas.Font.Size:=Grid.Canvas.Font.Size+1;
   AdaptToWidth;
   Status.SimpleText:='Veličina fonta: '+(Grid.Canvas.Font.Size).ToString;
   WriteConfig;
  end;
end;

procedure TFormMain.SubJumpClick(Sender: TObject);
var
   Criteria, Alternative: Integer;
   ColStr, RowStr: string;
begin
 ColStr:=InputBox('Tabela - pređi na ćeliju', 'Broj kriterijuma:', '');
 RowStr:=InputBox('Tabela - pređi na ćeliju', 'Broj alternative:', '');
 If (Not TryStrToInt(ColStr, Criteria)) Or (Not TryStrToInt(RowStr, Alternative)) Or
  (Criteria>Config.Criteria) Or (Alternative>Config.Alternative) Then
  begin
   MessageBeep(MB_ICONERROR);
   MessageDlg('Uneli ste nepostojeći broj kriterijuma/alternative.'+#13#10+'Pokušajte ponovo.', mtError, [mbOK], 0, mbOK);
   Exit;
  end;
 JumpTo(Criteria, Alternative);
end;

procedure TFormMain.SubSettingsClick(Sender: TObject);
begin
 Settings.FormSettings.ShowModal;
end;

procedure TFormMain.SubStandardClick(Sender: TObject);
begin
 BorderStyle:=bsSizeable;
 WindowState:=wsNormal;
 SubFullscreen.Checked:=Not SubStandard.Checked;
 Status.SimpleText:='Prikaz: podrazumevani';
end;

procedure TFormMain.MainTableClick(Sender: TObject);
var
	 EnableItem, IsEmpty: Boolean;
begin
 EnableItem:=(Grid.Visible);
 IsEmpty:=Not HasEmptyCells(Grid);
 SubEmpty.Enabled:=EnableItem;
 SubFill.Enabled:=EnableItem;
 SubFormat.Enabled:=EnableItem;
 SubResults.Enabled:=EnableItem And IsEmpty;

 If SubResults.Enabled Then
  SubResults.Hint:='Računanje u toku, molimo sačekajte...'
 Else
  SubResults.Hint:='Tabela sadrži nepopunjena polja ili nema aktivne datoteke.';
end;

procedure TFormMain.MainWindowClick(Sender: TObject);
begin
 SubFontSize.Enabled:=Grid.Visible;
end;

procedure TFormMain.StatusHint(Sender: TObject);
begin
 Status.SimpleText:=Application.Hint;
end;

procedure TFormMain.Calculate;
var
   I, J, Curr: Integer;
   Calculation: Double;
   W, DesiredValue, CurrentValue, NotDesiredValue: Double;
   RelationValue: Double;
   MaxRelationValue: Double;
begin
 Curr:=1;
 Results.FormResults.MemoResults.Lines.Clear;
 For I:=3 To Grid.ColCount-1 Do
  begin
   Calculation:=0;
   MaxRelationValue:=0;
   For J:=1 To Grid.RowCount-1 Do
    begin
     W:=GetRelativeImportance(J);
     DesiredValue:=GetDesiredValue(J);
     CurrentValue:=GetSelectedValue(I, J);
     NotDesiredValue:=GetNonDesiredValue(J);
     RelationValue:=(W*((DesiredValue-CurrentValue)/(DesiredValue-NotDesiredValue)));
     If (MaxRelationValue<RelationValue) Then
      MaxRelationValue:=RelationValue;
     Calculation:=Calculation+RelationValue;
   end;
   Lists.FormList.Grid.Cells[0, Curr]:=Curr.ToString;
   Lists.FormList.Grid.Cells[1, Curr]:='a'+Curr.ToString;
   Lists.FormList.Grid.Cells[2, Curr]:=FormatFloat('0.000', Calculation);
   Lists.FormList.Grid.Cells[3, Curr]:=FormatFloat('0.000', MaxRelationValue);
   PositionList.FormPosition.Grid.Cells[0, Curr]:=Curr.ToString;
   PositionList.FormPosition.Grid.Cells[1, Curr]:='a'+Curr.ToString;
   Results.FormResults.MemoResults.Lines.Add('ALTERNATIVA a'+Curr.ToString);
   Results.FormResults.MemoResults.Lines.Add('S'+(Curr.ToString)+' = '+FormatFloat('0.000', Calculation));
   Results.FormResults.MemoResults.Lines.Add('R'+(Curr.ToString)+' = '+FormatFloat('0.000', MaxRelationValue));
   Results.FormResults.MemoResults.Lines.Add('');
   Inc(Curr);
  end;
end;

procedure TFormMain.SubAllResultsClick(Sender: TObject);
begin
 Status.SimpleText:='Prikaži sve rezultate';
 Calculate;
 Lists.FormList.SortGrid;
 PositionList.FormPosition.SortGrid;
 Results.FormResults.Show;
 Lists.FormList.Show;
 PositionList.FormPosition.Show;
end;

procedure TFormMain.SubAlternativesClick(Sender: TObject);
begin
 Status.SimpleText:='Vrednost alternativa';
 Calculate;
 Results.FormResults.Show;
end;

procedure TFormMain.SubAuthorClick(Sender: TObject);
begin
 If Assigned(About.FormAbout) Then
  About.FormAbout.ShowModal;
end;

procedure TFormMain.SubAutoCellsClick(Sender: TObject);
begin
 AdaptToWidth;
 Status.SimpleText:='Dimenzije ćelija su automatski podešene.';
end;

procedure TFormMain.SubResultsClick(Sender: TObject);
begin
 Status.SimpleText:='Računanje u toku...';
end;

procedure TFormMain.SubCloseClick(Sender: TObject);
var
 I, J: Integer;
begin
 Grid.Hide;
 For I:=1 To Grid.ColCount-1 Do
  For J:=1 To Grid.RowCount-1 Do
   Grid.Cells[I, J]:='';
 Status.SimpleText:='Aktivna datoteka je zatvorena.';
 SetModifiedState(False);
end;

procedure TFormMain.SubCompromiseProgClick(Sender: TObject);
begin
 Status.SimpleText:='Izabrali ste metodu kompromisnog programiranja.';
end;

procedure TFormMain.SubCRLClick(Sender: TObject);
begin
 Status.SimpleText:='Kompromisna rang lista';
 Calculate;
 Lists.FormList.CalculateSp;
 PositionList.FormPosition.SortGrid;
 PositionList.FormPosition.Show;
end;

procedure TFormMain.SubDecFontClick(Sender: TObject);
begin
 If (Grid.Canvas.Font.Size>4) And (Grid.Canvas.Font.Size<501) Then
  begin
   Grid.Canvas.Font.Size:=Grid.Canvas.Font.Size-1;
   AdaptToWidth;
   Status.SimpleText:='Veličina fonta: '+(Grid.Canvas.Font.Size).ToString;
   WriteConfig;
  end;
end;

procedure TFormMain.SubEmptyClick(Sender: TObject);
begin
 EmptyCells;
 Status.SimpleText:='Sve ćelije su uspešno ispražnjene.';
end;

procedure TFormMain.SubEnumerateClick(Sender: TObject);
begin
 EnumerateGrid;
 AdaptToWidth;
 Status.SimpleText:='Završena enumeracija ćelija.';
end;

procedure TFormMain.SubExitClick(Sender: TObject);
begin
 Status.SimpleText:='Zatvaranje aplikacije...';
 Close;
end;

procedure TFormMain.MainFileClick(Sender: TObject);
begin
 SubSave.Enabled:=(Grid.Visible) And ((Pos('.cxf', String(Config.Filename))>0) And (GetModifiedState));
 SubSaveAs.Enabled:=Grid.Visible;
 SubClose.Enabled:=Grid.Visible;
 SubSettings.Enabled:=Assigned(Settings.FormSettings);
 Grid.EditorMode:=True;
end;

procedure TFormMain.SubFillClick(Sender: TObject);
begin
 If (Config.MinFill<Config.MaxFill) Then
  FillCells(Config.MinFill, Config.MaxFill)
 Else
  FillCells;
 AdaptToWidth;
 Status.SimpleText:='Ćelije su uspešno popunjene nasumičnim podacima.';
end;

procedure TFormMain.SubFindClick(Sender: TObject);
begin
 Find.FindDialog.ShowModal;
end;

procedure TFormMain.SubFormatClick(Sender: TObject);
begin
 FormatCells;
 Status.SimpleText:='Formatiranje ćelija završeno.';
end;

procedure TFormMain.SubFullscreenClick(Sender: TObject);
begin
 BorderStyle:=bsNone;
 WindowState:=wsMaximized;
 WindowState:=wsMaximized;
 SubStandard.Checked:=Not SubFullscreen.Checked;
 Status.SimpleText:='Prikaz: ceo ekran';
end;

procedure TFormMain.SubMinimizeWinClick(Sender: TObject);
begin
 Application.Minimize;
end;

procedure TFormMain.SubNewFileClick(Sender: TObject);
var
   strAlt, strCrit: string;
   Alt, Crit: Integer;
   KeepData: Integer;
begin
 strCrit:=InputBox('Broj kriterijuma', 'Unesite broj kriterijuma:', '');
 If (Not TryStrToInt(strCrit, Crit)) Or (Crit<=0) Or (Crit>MAX_FIELDS) Then
  begin
   MessageBeep(MB_ICONERROR);
   MessageDlg('Niste uneli validan broj kriterijuma!'+#13#10+'Pokušajte ponovo.'#13#10+'Napomena: Unesite vrednost između 1 i 300.', mtError, [mbOK], 0, mbOK);
   Exit;
  end;
 strAlt:=InputBox('Broj alternativa', 'Unesite broj alternativa:', '');
 If (Not TryStrToInt(strAlt, Alt)) Or (Alt<=1) Or (Alt>MAX_FIELDS) Then
  begin
   MessageBeep(MB_ICONERROR);
   MessageDlg('Niste uneli validan broj alternativa!'+#13#10+'Pokušajte ponovo.'+#13#10+'Napomena: Unesite vrednost između 2 i 300.', mtError, [mbOK], 0, mbOK);
   Exit;
  end;

 If GetModifiedState Then
  begin
   MessageBeep(MB_ICONQUESTION);
   KeepData:=MessageDlg('Da li želite da sačuvate podatke već postojeće tabele?', mtConfirmation, [mbYes, mbNo], 0, mbNo);
   If KeepData=mrNo Then
    SubClose.Click;
  end;

 GenerateGrid(Crit, Alt);
 Config.Criteria:=Crit;
 Config.Alternative:=Alt;
 Config.SelCol:=-1;
 Config.SelRow:=-1;
 Config.Cell.Col:=-1;
 Config.Cell.Row:=-1;
 Config.ForceClose:=False;
 AdaptToWidth;
 Status.SimpleText:='Nova datoteka je uspešno kreirana.';
 Config.Filename:='';
 Caption:='CalculusEx - Nova datoteka';
 SetModifiedState(False);
end;

procedure TFormMain.MenuMeasureItem(Sender: TObject;
  ACanvas: TCanvas; var Width, Height: Integer);
begin
If Sender Is TMenuItem Then
 begin
  Width:=ACanvas.TextWidth('I')*TMenuItem(Sender).Caption.Length;
  Width:=Width+Round(Width*0.4);
  If TMenuItem(Sender).ShortCut>0 Then
   Width:=Width+(ACanvas.TextWidth('I')*ShortCutToText(TMenuItem(Sender).ShortCut).Length+8);
  If TMenuItem(Sender).Checked Then
   Width:=Width+20;
 end;
end;

procedure TFormMain.MenuDrawItem(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; Selected: Boolean);
var
   Item: TMenuItem;
   ItemCaption: string;
begin
If Not (Sender Is TMenuItem) Then Exit;
Item:=TMenuItem(Sender);
ItemCaption:=Item.Caption;
ACanvas.Brush.Color:=$00FFFFFF;
ACanvas.Font.Style:=[];

If Item.ShortCut>0 Then
 ItemCaption:=ItemCaption+' ('+ShortCutToText(Item.ShortCut)+')';

If Item.Enabled Then
 begin
 If Selected Then
  begin
   ACanvas.Font.Color:=$00FFFFFF;

   If Item.Parent=MainFile Then
    ACanvas.Brush.Color:=$00FF6600
   Else
   If (Item.Parent=MainTable) Or (Item.Parent=SubResults) Then
    ACanvas.Brush.Color:=$00008000
   Else
   If Item.Parent=MainMethod Then
    ACanvas.Brush.Color:=$000000FF
   Else
   If Item.Parent=MainTools Then
    ACanvas.Brush.Color:=$00FF0000
   Else
   If (Item.Parent=MainWindow) Or (Item.Parent=SubFontSize) Or (Item.Parent=SubView) Then
    ACanvas.Brush.Color:=$000C53FA
   Else
   If Item.Parent=MainAbout Then
    ACanvas.Brush.Color:=$00FF0077
  end
 Else
  begin
   ACanvas.Brush.Color:=$00FFFFFF;

   If Item.Parent=MainFile Then
    ACanvas.Font.Color:=$00FF6600
   Else
   If (Item.Parent=MainTable) Or (Item.Parent=SubResults) Then
    ACanvas.Font.Color:=$00008000
   Else
   If Item.Parent=MainMethod Then
    ACanvas.Font.Color:=$000000FF
   Else
   If Item.Parent=MainTools Then
    ACanvas.Font.Color:=$00FF0000
   Else
   If (Item.Parent=MainWindow) Or (Item.Parent=SubFontSize) Or (Item.Parent=SubView) Then
    ACanvas.Font.Color:=$000C53FA
   Else
   If Item.Parent=MainAbout Then
    ACanvas.Font.Color:=$00FF0077
  end;
 end
Else
 ACanvas.Font.Color:=$00C0C0C0;

If Item.Checked Then
 ItemCaption:='● '+ItemCaption;

ACanvas.FillRect(ARect);
ACanvas.TextRect(ARect, ItemCaption, [tfCenter, tfVerticalCenter, tfSingleLine]);
end;

procedure TFormMain.SubOpenClick(Sender: TObject);
begin
 If OpenTable.Execute Then
  OpenExFile(OpenTable.FileName);
end;

procedure TFormMain.SubPositionClick(Sender: TObject);
begin
 Status.SimpleText:='Rang pozicije';
 Calculate;
 Lists.FormList.SortGrid;
 Lists.FormList.Show;
end;

procedure TFormMain.SubRestartClick(Sender: TObject);
begin
 Config.ForceClose:=True;
 Status.SimpleText:='Za nekoliko trenutaka, aplikacija će biti ponovo pokrenuta.';
 ShellExecute(Handle, 'open', PWideChar(Application.ExeName)
 , '-gui', Nil, SW_SHOW);
 Close;
end;

procedure TFormMain.SubSaveAsClick(Sender: TObject);
var
 GeneratedFilename: string;
 BMP: TBitmap;
 JPG: TJPEGImage;
 PNG: TPngImage;
begin
Grid.EditorMode:=False;
GeneratedFilename:=(RandomRange(10000, MaxInt)).ToString;
SaveTable.FileName:=GeneratedFilename;
BMP:=Nil;
 If (SaveTable.Execute) Then
  begin
    BMP:=TBitmap.Create;
    If (SaveTable.FilterIndex=1) Then
     SaveExFile(SaveTable.FileName)
    Else
     If (SaveTable.FilterIndex=2) Then
      SaveAsHTML(Grid, SaveTable.FileName)
    Else
     If (SaveTable.FilterIndex=3) Then
      begin
       GetBitmap(BMP);
       JPG:=TJPEGImage.Create;
       Config.Filename:=ChangeFileExt(SaveTable.FileName, '.jpg');
        try
         JPG.Assign(BMP);
         JPG.SaveToFile(String(Config.Filename));
        finally
         JPG.Free;
        end;
      end
    Else
     If (SaveTable.FilterIndex=4) Then
      begin
       GetBitmap(BMP);
       PNG:=TPngImage.Create;
       Config.Filename:=ChangeFileExt(SaveTable.FileName, '.png');
        try
         PNG.Assign(BMP);
         PNG.SaveToFile(String(Config.Filename));
        finally
         PNG.Free;
        end;
      end
    Else
     If (SaveTable.FilterIndex=5) Then
      begin
       Config.Filename:=ChangeFileExt(SaveTable.FileName, '.bmp');
       GetBitmap(BMP);
       BMP.SaveToFile(String(Config.Filename));
      end;
  Status.SimpleText:='Datoteka je uspešno sačuvana!';
  MessageBeep(MB_ICONINFORMATION);
  SetModifiedState(False);
  end;
If (Pos('.html', String(Config.Filename))>0) Then
 InvokeBrowser(String(Config.Filename));
SaveTable.FileName:='';
Caption:='CalculusEx - '+ChangeFileExt(ExtractFileName(String(Config.Filename)), '');
If (Assigned(BMP)) Then BMP.Free;
end;

procedure TFormMain.SubSaveClick(Sender: TObject);
begin
 SaveExFile(String(Config.Filename));
 Status.SimpleText:='Datoteka '+'je uspešno sačuvana.';
 MessageBeep(MB_ICONINFORMATION);
 SetModifiedState(False);
end;

procedure TFormMain.MainToolsClick(Sender: TObject);
begin
 SubEnumerate.Enabled:=Grid.Visible;
 SubJump.Enabled:=Grid.Visible;
 SubAutoCells.Enabled:=Grid.Visible;
 SubFind.Enabled:=Grid.Visible;
end;

procedure TFormMain.SubWebsiteClick(Sender: TObject);
begin
 ShellExecute(Handle, 'open', PWideChar('http://neovisio.wordpress.com/'), Nil, Nil, SW_SHOW);
end;

end.
