program SolRUI;









{$R *.dres}

uses
  Windows,
  Forms,
  fmain in 'fmain.pas' {mainForm},
  SolRStub in 'SolRStub.pas',
  Vcl.Themes,
  Vcl.Styles,
  fOpenCLSettings in 'fOpenCLSettings.pas' {frmOpenCLSettings},
  fAbout in 'fAbout.pas' {frmAbout};

{$R *.res}

var
   Semafor     : THandle;

procedure RestoreWindow(aFormName : string);
var
   Wnd,
   App : HWND;
begin
  Wnd := FindWindow(PChar(aFormName), nil);
  if (Wnd <> 0) then
  begin // Set Window to foreground
    App := GetWindowLong(Wnd, GWL_HWNDPARENT);
    if IsIconic(App) then
      ShowWindow(App, SW_RESTORE);

    SetForegroundwindow(App);
  end;
end;

begin
  // Don't start twice ... if already running bring this instance to front
  Semafor := CreateSemaphore(nil, 0, 1, 'MY_APPLICATION_IS_RUNNING');
  if ((Semafor <> 0) and // application is already running
    (GetLastError = ERROR_ALREADY_EXISTS)) then
  begin
     RestoreWindow('TMyApplication');
     CloseHandle(Semafor);
     Halt;
  end;
  Set8087CW($133f);
  Application.Initialize;
  TStyleManager.TrySetStyle('Amakrits');
  Application.Title := 'SoL-R Editor';
  Application.CreateForm(TmainForm, mainForm);
  Application.CreateForm(TfrmAbout, frmAbout);
  Application.Run;
end.
