program IPVEditor;

uses
  Forms,
  fmain in 'fmain.pas' {mainForm},
  RayTracingEngineStub in 'RayTracingEngineStub.pas',
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Interactive Protein Visualizer Editor';
  Application.CreateForm(TmainForm, mainForm);
  Application.Run;
end.
