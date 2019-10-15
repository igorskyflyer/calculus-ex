unit Splash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, jpeg, MMSystem, Registry;

type
  TFormSplash = class(TForm)
    TimerClose: TTimer;
    BG: TImage;
    LabelCalculusEx: TLabel;
    LabelLoading: TLabel;
    procedure TimerCloseTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  FormSplash: TFormSplash;
  CFG_SOUND: Integer;

implementation

{$R *.dfm}
{$R resources.RES}
{$SetPEFlags IMAGE_FILE_RELOCS_STRIPPED}
{$SetPEFlags IMAGE_FILE_LINE_NUMS_STRIPPED}
{$SetPEFlags IMAGE_FILE_LOCAL_SYMS_STRIPPED}
{$SetPEFlags IMAGE_FILE_DEBUG_STRIPPED}
{$SetPEFlags IMAGE_FILE_EXECUTABLE_IMAGE}


uses Main;

procedure TFormSplash.FormCreate(Sender: TObject);
var
   PCReg: TRegistry;
begin
 PCReg:=TRegistry.Create;
 try
  PCReg.RootKey:=HKEY_LOCAL_MACHINE;
  PCReg.OpenKey('SOFTWARE\NeoVisio\CalculusEx', False);
  CFG_SOUND:=PCReg.ReadInteger('Sound');
  PCReg.CloseKey;
 finally
  PCReg.Free;
 end;
end;

procedure TFormSplash.FormKeyPress(Sender: TObject; var Key: Char);
begin
If (Key=#27) Then Application.MainForm.Close;
end;

procedure TFormSplash.FormShow(Sender: TObject);
var
	Ellipse: HRGN;
begin
 Ellipse:=CreateRoundRectRgn(0, 0, ClientWidth,ClientHeight, 20, 20);
 SetWindowRgn(Handle, Ellipse, True);
 If (CFG_SOUND=1) Then
  sndPlaySound('audio', SND_ASYNC Or SND_RESOURCE);
 Left:=(Screen.WorkAreaWidth-Width) Div 2;
 Top:=(Screen.WorkAreaHeight-Height) Div 2;
 AnimateWindow(FormSplash.Handle, 500, AW_BLEND);

 If (Length(ParamStr(1))>1) And (FileExists(ParamStr(1))) Then
  Main.FormMain.OpenExFile(ParamStr(1));
end;

procedure TFormSplash.TimerCloseTimer(Sender: TObject);
begin
 TimerClose.Enabled:=False;
 Main.FormMain.Show;
 Close;
end;

end.
