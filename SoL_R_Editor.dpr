program SoL_R_Editor;



{$R *.dres}

uses
  Forms,
  fmain in 'fmain.pas' {mainForm},
  RayTracingEngineStub in 'RayTracingEngineStub.pas',
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Set8087CW($133f);
  Application.Initialize;
  TStyleManager.TrySetStyle('Amakrits');
  Application.Title := 'SoL-R Editor (Powered by Cuda)';
  Application.CreateForm(TmainForm, mainForm);
  Application.Run;
end.
