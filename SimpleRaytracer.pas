unit SimpleRaytracer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TmainForm = class(TForm)
    img3DView: TImage;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    {bitmap}
    F3DBitmap      : TBitmap;

  public
    { Public declarations }
  end;

var
  mainForm: TmainForm;

implementation

{$R *.dfm}

uses
  RayTracingEngineStub;

procedure TmainForm.Button1Click(Sender: TObject);
var
   m: integer;
begin
   F3DBitmap := TBitmap.Create;
   F3DBitmap.Width  := img3DView.Width;
   F3DBitmap.Height := img3DView.Height;
   F3DBitmap.PixelFormat := pf24bit;

   RayTracer_SetSceneInfo(F3DBitmap.Width,F3DBitmap.Height,4,5,0,500000,1,0,0,0,0,0,0,0,20,integer(ot_Delphi),0,1,0);
   RayTracer_InitializeKernel(false,1,0);
   RayTracer_ResetKernel();

   RayTracer_SetPostProcessingInfo(0,0,0,0);
   RayTracer_SetCamera(0,0,-10000,0,0,-5000,0,0,0);

   m:=RayTracer_AddMaterial();
   RayTracer_SetMaterial(m,1,1,1,0,0,0,0,0,0,0,MATERIAL_NONE,MATERIAL_NONE,MATERIAL_NONE,MATERIAL_NONE,MATERIAL_NONE,MATERIAL_NONE,1,100,0,0,0,0,0);
   {
   int l=RayTracer_AddMaterial();
   RayTracer_SetMaterial(l,1,1,1,0,0,0,0,0,0,0,MATERIAL_NONE,MATERIAL_NONE,MATERIAL_NONE,MATERIAL_NONE,MATERIAL_NONE,MATERIAL_NONE,1,100,0,1,50000,50000,0);

   int p=RayTracer_AddPrimitive(0);
   RayTracer_SetPrimitive(p,0,0,0,0,0,0,0,0,0,0,0,0,m);

   int light=RayTracer_AddPrimitive(0);
   RayTracer_SetPrimitive(p,-5000,5000,-5000,0,0,0,0,0,0,0,0,0,l);
   }
   RayTracer_LoadOBJModel('e:\Deployments\bin\obj\abc.obj',0,5000);
   RayTracer_CompactBoxes(true);

   RayTracer_RunKernel(0,F3DBitmap.ScanLine[img3DView.Height-1]);
   img3DView.Picture.Assign(F3DBitmap);
   img3DView.Refresh;
   RayTracer_FinalizeKernel();
end;

end.
