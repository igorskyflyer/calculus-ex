program CalculusEx;



{$R *.dres}

uses
  Vcl.Forms,
  Winapi.Windows,
  System.Win.Registry,
  Winapi.ShlObj,
  Vcl.Themes,
  Vcl.Styles,
  Vcl.Graphics,
  Vcl.Dialogs,
  System.UITypes,
  Main in 'Main.pas' {FormMain},
  Splash in 'Splash.pas' {FormSplash},
  Settings in 'Settings.pas',
  Results in 'Results.pas' {FormResults},
  Lists in 'Lists.pas' {FormList},
  PositionList in 'PositionList.pas' {FormPosition},
  About in 'About.pas' {FormAbout},
  Find in 'Find.pas' {FindDialog};

{FormSettings}

{$R *.res}

var
   RegistryObj: TRegistry;

begin
 ReportMemoryLeaksOnShutdown:=True;
 Application.Initialize;
 Application.MainFormOnTaskbar:=True;
 TStyleManager.TrySetStyle('Cobalt XEMedia');
 Application.Title:='CalculusEx';

 If (ParamStr(1)='-setup') Then
  begin
   RegistryObj:=TRegistry.Create;
   try
    RegistryObj.RootKey:=HKEY_CLASSES_ROOT;
    RegistryObj.OpenKey('.cxf', True);
    RegistryObj.WriteString('', 'CalculusEx.File');
    RegistryObj.CloseKey;
    RegistryObj.OpenKey('CalculusEx.File', True);
    RegistryObj.OpenKey('DefaultIcon', True);
    RegistryObj.WriteString('', '"'+ParamStr(0)+'",1');
    RegistryObj.CloseKey;
    RegistryObj.OpenKey('CalculusEx.File', True);
    RegistryObj.WriteString('', 'CalculusEx File');
    RegistryObj.OpenKey('shell', True);
    RegistryObj.OpenKey('open', True);
    RegistryObj.OpenKey('command', True);
    RegistryObj.WriteString('', '"'+ParamStr(0)+'" "%1"');
    RegistryObj.CloseKey;

    RegistryObj.RootKey:=HKEY_LOCAL_MACHINE;
    RegistryObj.OpenKey('SOFTWARE', False);
    RegistryObj.OpenKey('NeoVisio', True);
    RegistryObj.OpenKey('CalculusEx', True);
    RegistryObj.WriteString('BgColor', '$00EE5346');
    RegistryObj.WriteString('TextColor', ColorToString(clWhite));
    RegistryObj.WriteString('FontName', 'Arial');
    RegistryObj.WriteInteger('FontSize', 9);
    RegistryObj.WriteInteger('Sound', 1);
    RegistryObj.WriteInteger('FormatNum', 2);
    RegistryObj.WriteInteger('FillFrom', 0);
    RegistryObj.WriteInteger('FillTo', 1000);
    RegistryObj.CloseKey;
    SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, Nil, Nil);
   finally
    RegistryObj.Free;
    Application.Terminate;
   end;
 end
 Else
  begin
   Application.CreateForm(TFormMain, FormMain);
   Application.CreateForm(TFormAbout, FormAbout);
   Application.CreateForm(TFindDialog, FindDialog);

   If ParamStr(1)<>'-gui' Then
    FormMain.Hide
   Else
    ShowWindow(Application.MainFormHandle, SW_SHOWNORMAL);

   If (ParamStr(1)<>'-gui') Or (ParamStr(1)='') Then
    begin
     Application.CreateForm(TFormSplash, FormSplash);
     FormSplash.ShowModal;
     FormSplash.Free;
    end;

   If ParamStr(1)='-reset' Then
    begin
     MessageBeep(MB_ICONINFORMATION);
     MessageDlg('Podešavanja aplikacije su uspešno vraćena na podrazumevana.', mtInformation, [mbOK], 0, mbOK);
    end;

   Application.CreateForm(TFormList, FormList);
   Application.CreateForm(TFormPosition, FormPosition);
   Application.CreateForm(TFormSettings, FormSettings);
   Application.CreateForm(TFormResults, FormResults);
   Application.Run;
  end;
end.
