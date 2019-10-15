unit About;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Winapi.ShellAPI;

type
  TFormAbout = class(TForm)
    LabelAuthor: TLabel;
    LabelIgor: TLabel;
    LabelWeb: TLabel;
    procedure LabelWebMouseEnter(Sender: TObject);
    procedure LabelWebMouseLeave(Sender: TObject);
    procedure LabelWebClick(Sender: TObject);
    procedure LabelIgorMouseEnter(Sender: TObject);
    procedure LabelIgorMouseLeave(Sender: TObject);
    procedure LabelIgorClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAbout: TFormAbout;

implementation

{$R *.dfm}
{$SetPEFlags IMAGE_FILE_RELOCS_STRIPPED}
{$SetPEFlags IMAGE_FILE_LINE_NUMS_STRIPPED}
{$SetPEFlags IMAGE_FILE_LOCAL_SYMS_STRIPPED}
{$SetPEFlags IMAGE_FILE_DEBUG_STRIPPED}
{$SetPEFlags IMAGE_FILE_EXECUTABLE_IMAGE}

procedure TFormAbout.LabelIgorClick(Sender: TObject);
begin
 ShellExecute(Application.MainForm.Handle, 'open', 'http://www.facebook.com/IgorSkyFlyer',
  Nil, Nil, SW_SHOW);
end;

procedure TFormAbout.LabelIgorMouseEnter(Sender: TObject);
begin
 LabelIgor.Font.Style:=[fsBold, fsUnderline];
 Cursor:=crHandPoint;
end;

procedure TFormAbout.LabelIgorMouseLeave(Sender: TObject);
begin
 LabelIgor.Font.Style:=[];
 Cursor:=crDefault;
end;

procedure TFormAbout.LabelWebClick(Sender: TObject);
begin
 ShellExecute(Application.MainForm.Handle, 'open', 'http://neovisio.wordpress.com/?from=calculusex', Nil,
  Nil, SW_SHOW);
end;

procedure TFormAbout.LabelWebMouseEnter(Sender: TObject);
begin
 LabelWeb.Font.Style:=[fsBold, fsUnderline];
 Cursor:=crHandPoint;
end;

procedure TFormAbout.LabelWebMouseLeave(Sender: TObject);
begin
 LabelWeb.Font.Style:=[];
 Cursor:=crDefault;
end;

end.
