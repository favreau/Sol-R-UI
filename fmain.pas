unit fmain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, RayTRacingEngineStub, ComCtrls, jpeg,
  VCLTee.TeCanvas, Vcl.ColorGrd, Vcl.Ribbon, Vcl.RibbonLunaStyleActnCtrls,
  Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls, Vcl.PlatformDefaultStyleActnCtrls,
  Vcl.ActnList, Vcl.Mask, Vcl.Samples.Spin, Vcl.ActnColorMaps,
  Vcl.Buttons, Vcl.Menus, Vcl.ImgList;

type
  TModelType = ( mtNone = 0, mtPDB = 1, mtOBJ = 2, mtIRT );

type
  TModel = record
    modelType: TModelType;
    filename : AnsiString;
  end;

type
  TmainForm = class(TForm)
    cdColor: TColorDialog;
    Timer: TTimer;
    pnlCenter: TPanel;
    img3DView: TImage;
    odOpenFile: TOpenDialog;
    Panel1: TPanel;
    pbProcessing: TProgressBar;
    lblPathTracingIterations: TLabel;
    lblElements: TLabel;
    MainMenu: TMainMenu;
    File1: TMenuItem;
    Open1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    miSaveAs: TMenuItem;
    sdSaveFile: TSaveDialog;
    miSave: TMenuItem;
    memLogs: TMemo;
    Panel3: TPanel;
    pgParameters: TPageControl;
    tsControls: TTabSheet;
    rgMouseControls: TRadioGroup;
    tsScene: TTabSheet;
    GroupBox4: TGroupBox;
    lbl3DVisionType: TLabel;
    lbl3DVisionStrength: TLabel;
    cb3DVision: TComboBox;
    sbWith3DVision: TScrollBar;
    GroupBox3: TGroupBox;
    lblRayIterations: TLabel;
    lblViewDistance: TLabel;
    sbRayInterations: TScrollBar;
    sbViewDistance: TScrollBar;
    sbShadowIntensity: TScrollBar;
    cbGraphicsLevel: TComboBox;
    gbPostProcessing: TGroupBox;
    Label16: TLabel;
    Label17: TLabel;
    cbPostProcessing: TComboBox;
    sbPPIntensity: TScrollBar;
    rgMisc: TRadioGroup;
    GroupBox1: TGroupBox;
    shBackgroundColor: TShape;
    Label14: TLabel;
    Label15: TLabel;
    cbScene: TComboBox;
    gbHelpers: TGroupBox;
    cbBoundingBoxes: TCheckBox;
    cbContinuousRendering: TCheckBox;
    tsMaterial: TTabSheet;
    gbMaterialColor: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    shMaterialColor: TShape;
    Label28: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    sbSpecValue: TScrollBar;
    sbSpecPower: TScrollBar;
    sbSpecCoef: TScrollBar;
    sbInnerIllumination: TScrollBar;
    Button2: TButton;
    sbIlluminationPropagation: TScrollBar;
    sbIlluminationDiffusion: TScrollBar;
    gbBasicParameters: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    cbProcedural: TCheckBox;
    sbReflection: TScrollBar;
    sbTransparency: TScrollBar;
    sbRefraction: TScrollBar;
    sbNoise: TScrollBar;
    cbFastTransparency: TCheckBox;
    tsObject: TTabSheet;
    gbCoordinates: TGroupBox;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    seCenterX: TSpinEdit;
    seCenterY: TSpinEdit;
    seCenterZ: TSpinEdit;
    seOtherCenterX: TSpinEdit;
    seOtherCenterY: TSpinEdit;
    seOtherCenterZ: TSpinEdit;
    gbMaterial: TGroupBox;
    Label22: TLabel;
    seMaterialId: TSpinEdit;
    GroupBox2: TGroupBox;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    seSizeX: TSpinEdit;
    seSizeY: TSpinEdit;
    seSizeZ: TSpinEdit;
    gbTextures: TGroupBox;
    gbPDB: TGroupBox;
    Label29: TLabel;
    Label30: TLabel;
    sbDefaultAtomSize: TScrollBar;
    sbStickSize: TScrollBar;
    cbGeometryType: TComboBox;
    cbRepresentation: TComboBox;
    cbTheme: TComboBox;
    GroupBox5: TGroupBox;
    Label18: TLabel;
    btnOpen: TButton;
    edtMoleculeId: TMaskEdit;
    lblPrimitiveID: TLabel;
    lblReflectionValue: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    gbTextureIds: TGroupBox;
    Label40: TLabel;
    lblTransparencyId: TLabel;
    lblReflectionId: TLabel;
    Label39: TLabel;
    Label38: TLabel;
    Label37: TLabel;
    Label36: TLabel;
    Label31: TLabel;
    lblNormalId: TLabel;
    lblSpecularId: TLabel;
    lblBumpId: TLabel;
    lblDiffuseId: TLabel;
    sbTransparencyTextureId: TScrollBar;
    sbReflectionTextureId: TScrollBar;
    sbDiffuseTextureId: TScrollBar;
    sbBumpTextureId: TScrollBar;
    sbNormalTextureId: TScrollBar;
    sbSpecularTextureId: TScrollBar;
    cbDoubleSidedTriangles: TCheckBox;
    cbGradientBackGround: TCheckBox;
    cbAdvancedRenderingFeatures: TCheckBox;
    pnlSystem: TPanel;
    lblPlatforms: TLabel;
    cbPlatforms: TComboBox;
    lblDevices: TLabel;
    cbDevices: TComboBox;
    cbDraftMode: TCheckBox;
    miScreenshot: TMenuItem;
    N2: TMenuItem;
    procedure FormDestroy(Sender: TObject);
    procedure tbReflectionChange(Sender: TObject);
    procedure tbRefractionChange(Sender: TObject);
    procedure tbTransparencyChange(Sender: TObject);
    procedure sbSpecValueChange(Sender: TObject);
    procedure sbSpecPowerChange(Sender: TObject);
    procedure sbSpecCoefChange(Sender: TObject);
    procedure sbReflectionChange(Sender: TObject);
    procedure sbTransparencyChange(Sender: TObject);
    procedure sbRefractionChange(Sender: TObject);
    procedure sbNoiseChange(Sender: TObject);
    procedure cbProceduralClick(Sender: TObject);
    procedure cbShadowsClick(Sender: TObject);
    procedure sbShadowIntensityChange(Sender: TObject);
    procedure sbRayInterationsChange(Sender: TObject);
    procedure sbViewDistanceChange(Sender: TObject);
    procedure cb3DVisionChange(Sender: TObject);
    procedure sbWith3DVisionChange(Sender: TObject);
    procedure cbBoundingBoxesClick(Sender: TObject);
    procedure img3DViewMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure img3DViewMouseown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure img3DViewMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TimerTimer(Sender: TObject);
    procedure btnOpenClick(Sender: TObject);
    procedure cbFixedSizeAtomClick(Sender: TObject);
    procedure cbSticksClick(Sender: TObject);
    procedure sbPPIntensityChange(Sender: TObject);
    procedure cbPostProcessingChange(Sender: TObject);
    procedure pnlCenterMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sbDefaultAtomSizeChange(Sender: TObject);
    procedure cbContinuousRenderingClick(Sender: TObject);
    procedure sbStickSizeChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbGeometryTypeChange(Sender: TObject);
    procedure cbRepresentationChange(Sender: TObject);
    procedure updateObjectAttributes(Sender: TObject);
    procedure cbFastTransparencyClick(Sender: TObject);
    procedure cbFogEffectClick(Sender: TObject);
    procedure cbThemeChange(Sender: TObject);
    procedure cbSceneChange(Sender: TObject);
    procedure cbIsometric3DClick(Sender: TObject);
    procedure cbMaterialColorChange(Sender: TObject);
    procedure shMaterialColorMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure edtMoleculeIdExit(Sender: TObject);
    procedure shBackgroundColorMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure rgMiscClick(Sender: TObject);
    procedure rgMouseControlsClick(Sender: TObject);
    procedure sbIlluminationDiffusionChange(Sender: TObject);
    procedure sbIlluminationPropagationChange(Sender: TObject);
    procedure Open1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure miSaveAsClick(Sender: TObject);
    procedure miSaveClick(Sender: TObject);
    procedure cbGraphicsLevelChange(Sender: TObject);
    procedure sbDiffuseTextureIdChange(Sender: TObject);
    procedure cbDoubleSidedTrianglesClick(Sender: TObject);
    procedure cbPlatformsChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure miScreenshotClick(Sender: TObject);
  private
    { Private declarations }
    pathTracingIteration : integer;

    procedure updateScene;
    procedure updateWorld;

    procedure initializeMaterials;
    procedure updateMaterials;
    procedure updateMaterial;
    procedure updateMaterialControls;

  public
    {initialization}
    procedure Initialize;

    { Public declarations }
    Procedure RenderScene;

    { Controls }
    procedure setMaterialControls( material: TMaterial );
    procedure updatePrimitiveControls;

    {textures}
    procedure loadTextures( filter: string );

  private
    { Kernel }
    FKernelInitialized : boolean;

    { camera }
    viewPos    : T3DPoint;
    viewDir    : T3DPoint;
    viewAngles : T3DPoint;

    {light source}
    lamp    : integer;
    lampSize: double;
    lampPos : T3DPoint;

    {mouse}
    mouseDown: boolean;
    mouseButton: TMouseButton;
    previousMouseX : integer;
    previousMouseY : integer;

    {postProcessing}
    postProcessingParam : double;

  private
    {Models}
    currentModel : TModel;

  private
    {Selection}
    previousSelectedPrimitive: integer;
    previousSelectedMaterial: integer;

    currentMaterial : integer;
    currentPrimitive: integer;
    controlUpdate : boolean;

    {Models}
    nbPrimitives : integer;

  private
    {bitmap}
    F3DBitmap      : TBitmap;

    {rendering}
    maxPathTracingIterations: integer;
    SceneInitialized : boolean;

  private
    {Folders}
    ApplicationFolder: string;
  end;

var
  mainForm: TmainForm;

implementation

uses Math,idHTTP,System.UITypes;

{$R *.dfm}

const
  pdbFolder = 'pdb';
  pdbUrl    = 'http://www.rcsb.org/pdb/files/';
  irtFolder = 'irt';
  objFolder = 'models';
  texFolder = 'textures';

procedure TmainForm.loadTextures( filter: string );
var
  i: integer;
  SR: TSearchRec;
  status : integer;
  filename: string;
begin
  i := 0;
  if FindFirst(texFolder+'\' + filter, faAnyFile, SR) = 0 then
  repeat
    filename := ApplicationFolder+texFolder+'\'+SR.Name;
    status := RayTracer_LoadTextureFromFile( i, AnsiString(filename) );
    if( status=-1 ) then
      memLogs.Lines.Add('Failed to load ' + filename);
    inc(i);
  until FindNext(SR) <> 0;
  FindClose(SR);
end;

procedure TmainForm.initializeMaterials;
var
  i: integer;
begin
  loadTextures('*.bmp');
  loadTextures('*.jpg');
  loadTextures('*.tga');

  i := RayTracer_GetNbTextures;
  memLogs.Lines.Add( IntToStr(i) + ' textures loaded');
  sbDiffuseTextureId.Max := i-1;
  sbDiffuseTextureId.Min := -1;
  sbDiffuseTextureId.Enabled := ( sbDiffuseTextureId.Max <> 0 );

  sbBumpTextureId.Max := i-1;
  sbBumpTextureId.Min := -1;
  sbBumpTextureId.Enabled := ( sbBumpTextureId.Max <> 0 );

  sbNormalTextureId.Max := i-1;
  sbNormalTextureId.Min := -1;
  sbNormalTextureId.Enabled := ( sbNormalTextureId.Max <> 0 );

  sbSpecularTextureId.Max := i-1;
  sbSpecularTextureId.Min := -1;
  sbSpecularTextureId.Enabled := ( sbSpecularTextureId.Max <> 0 );

  sbReflectionTextureId.Max := i-1;
  sbReflectionTextureId.Min := -1;
  sbReflectionTextureId.Enabled := ( sbSpecularTextureId.Max <> 0 );

  sbTransparencyTextureId.Max := i-1;
  sbTransparencyTextureId.Min := -1;
  sbTransparencyTextureId.Enabled := ( sbSpecularTextureId.Max <> 0 );

  for i := 0 to NB_MAX_MATERIALS-1 do
    RayTracer_AddMaterial;
end;

procedure TmainForm.Open1Click(Sender: TObject);
var
  fileExtension: string;
begin
  odOpenFile.InitialDir := ApplicationFolder + irtFolder;
  if odOpenFile.Execute then
  begin
    fileExtension := ExtractFileExt(odOpenFile.FileName);
    currentModel.filename  := AnsiString(odOpenFile.FileName);
    if fileExtension = '.pdb' then
    begin
      currentModel.modelType := mtPDB;
    end
    else
    begin
      if fileExtension = '.obj' then
      begin
        currentModel.modelType := mtOBJ;
      end
      else
      if fileExtension = '.irt' then
      begin
        currentModel.modelType := mtIRT;
      end;
    end;
    updateWorld;
    Application.ProcessMessages;
  end;
end;

procedure TmainForm.updateMaterials;
var
  r,g,b: double;
  i : integer;
  specular: T3DPoint;
  noise : double;
  reflection : double;
  refraction : double;
  procedural : boolean;
  transparency : double;
  innerIllumination: double;
  illuminationDiffusion: double;
  illuminationPropagation: double;
  fastTransparency: boolean;
  diffuseTextureId: integer;
  bumpTextureId: integer;
  normalTextureId: integer;
  specularTextureId: integer;
  reflectionTextureId: integer;
  transparencyTextureId: integer;
begin
  controlUpdate := false;
  currentMaterial := -1;
  for i := 0 to NB_MAX_MATERIALS-1 do
  begin
		diffuseTextureId := TEXTURE_NONE;
    normalTextureId  := TEXTURE_NONE;
		bumpTextureId    := TEXTURE_NONE;
		specularTextureId:= TEXTURE_NONE;
    reflectionTextureId:= TEXTURE_NONE;
    transparencyTextureId:= TEXTURE_NONE;

    // Molecules
    reflection   := 0;
    refraction   := 0;
    transparency := 0;
    innerIllumination       := 0;
    illuminationDiffusion   := sbViewDistance.Position*5000;
    illuminationPropagation := sbViewDistance.Position*5000;
    procedural   := false;
    noise := 0;
    specular.x := 0.5;
    specular.y := 50;
    specular.z := 0;
    fastTransparency := false;

    r := 0.5+random(40)/100;
    g := 0.5+random(40)/100;
    b := 0.5+random(40)/100;

    if( i>=20 ) and ( i<40 ) then
    begin
      refraction := 1.6;
      transparency := 0.9;
    end;
    case cbTheme.ItemIndex of
      0: case (i mod 10) of
        0: {C} begin r :=  64/255; g :=  64/255; b :=  64/255; end;
        1: {N} begin r :=   0/255; g :=   0/255; b := 255/255; end;
        2: {O} begin r := 255/255; g :=   0/255; b :=   0/255; end;
        3: {H} begin r := 255/255; g := 255/255; b := 255/255; end;
        4: {B} begin r := 255/255; g := 170/255; b := 119/255; end;
        5: {F} begin r :=  85/255; g := 187/255; b :=   0/255; end;
        6: {P} begin r := 255/255; g := 153/255; b :=   0/255; end;
        7: {S} begin r :=  85/255; g := 187/255; b :=   0/255; end;
        8: {V} begin r := 221/255; g := 119/255; b := 255/255; end;
        9: {K} begin r := 221/255; g := 119/255; b := 255/255; end;
      end;
      1: case (i mod 10) of
        { Jmol scheme color }
        0: {K} begin r := 143/255; g :=  64/255; b := 212/255; end;
        1: {C} begin r := 128/255; g := 128/255; b := 128/255; end;
        2: {N} begin r :=  48/255; g :=  80/255; b := 248/255; end;
        3: {O} begin r := 255/255; g :=  13/255; b :=  13/255; end;
        4: {H} begin r := 255/255; g := 255/255; b := 255/255; end;
        5: {B} begin r := 255/255; g := 181/255; b := 181/255; end;
        6: {F} begin r := 144/255; g := 224/255; b :=  80/255; end;
        7: {P} begin r := 255/255; g := 128/255; b :=   0/255; end;
        8: {S} begin r := 255/255; g := 255/255; b :=  48/255; end;
        9: {V} begin r := 128/255; g := 128/255; b := 128/255; end;
      end;
      2: case (i mod 10) of
       { QuteMol scheme color }
       0: {K} begin r :=   0/255; g :=  77/255; b :=  77/255; end;
       1: {C} begin r := 200/255; g := 200/255; b := 200/255; end;
       2: {N} begin r := 166/255; g := 166/255; b := 205/255; end;
       3: {O} begin r := 255/255; g := 140/255; b := 140/255; end;
       4: {H} begin r := 199/255; g := 199/255; b := 199/255; end;
       5: {B} begin r :=  51/255; g :=  51/255; b := 150/255; end;
       6: {F} begin r :=   0/255; g :=  99/255; b :=  51/255; end;
       7: {P} begin r :=  84/255; g :=  20/255; b := 128/255; end;
       8: {S} begin r := 252/255; g := 202/255; b :=   0/255; end;
       9: {V} begin r := 106/255; g := 106/255; b :=  30/255; end;
      end;
    end;

    case i of
      // Cornell Box
      CORNELLBOX_FRONT_MATERIAL: begin r:=127/255; g:=127/255; b:=127/255; end;
      CORNELLBOX_RIGHT_MATERIAL: begin r:=154/255; g:=94/255;  b:=64/255; end;
      CORNELLBOX_BACK_MATERIAL : begin r:=92/255;  g:=93/255;  b:=150/255; end;
      CORNELLBOX_LEFT_MATERIAL : begin r:=92/255;  g:=150/255; b:=93/255; end;

      // Fractals
      MANDELBROT_MATERIAL: begin r:=127/255; g:=127/255; b:=127/255; diffuseTextureId:=TEXTURE_MANDELBROT; end;
      JULIA_MATERIAL     : begin r:=154/255; g:=94/255;  b:=64/255;  diffuseTextureId:=TEXTURE_JULIA; end;

      // Basic reflection
      BASIC_REFLECTION_MATERIAL_001: begin reflection:=0.5; refraction:=1.6; transparency:=0.7; end;
      BASIC_REFLECTION_MATERIAL_002: begin reflection:=0.9; end;
      BASIC_REFLECTION_MATERIAL_003: begin r:=0.5; g:=1.0; b:=0.7; reflection:=0; diffuseTextureId:=6; bumpTextureId:=8; end;
      BASIC_REFLECTION_MATERIAL_004: begin reflection:=1; refraction:=1.66; transparency:=0.95; end;
      BASIC_REFLECTION_MATERIAL_005: begin r:=1; g:=0; b:=0; reflection:=0.5; end;
      BASIC_REFLECTION_MATERIAL_006: begin r:=0; g:=1; b:=1; reflection:=0.5; end;

      // White
      WHITE_MATERIAL: begin r:=1; g:=1; b:=1; end;

      // Wireframe
      LIGHT_MATERIAL_001: begin r:=1; g:=1; b:=1; innerIllumination:=1; end;
      LIGHT_MATERIAL_002: begin innerIllumination:=1; end;
      LIGHT_MATERIAL_003: begin innerIllumination:=1; end;
      LIGHT_MATERIAL_004: begin innerIllumination:=1; end;
      LIGHT_MATERIAL_005: begin innerIllumination:=1; end;
      LIGHT_MATERIAL_006: begin innerIllumination:=1; end;
      LIGHT_MATERIAL_007: begin innerIllumination:=1; end;
      LIGHT_MATERIAL_008: begin innerIllumination:=1; end;
      LIGHT_MATERIAL_009: begin innerIllumination:=1; end;
      LIGHT_MATERIAL_010: begin innerIllumination:=1; end;
      DEFAULT_LIGHT_MATERIAL: begin r:=1; g:=1; b:=1; innerIllumination:=1; end;
    end;

    RayTracer_SetMaterial(
      i,
      r,g,b,
      noise,
      reflection,
      refraction,
      integer(procedural),
      0, 0,
      transparency,
      diffuseTextureId,normalTextureId,bumpTextureId,specularTextureId,
      reflectionTextureId,transparencyTextureId,
      specular.x, specular.y, specular.z,
      innerIllumination, illuminationDiffusion, illuminationPropagation,
      integer(fastTransparency) );
  end;
  updateScene;
end;

procedure TmainForm.Initialize;
begin
  maxPathTracingIterations := 10;
  F3DBitmap := TBitmap.Create;
  F3DBitmap.Width  := img3DView.Width;
  F3DBitmap.Height := img3DView.Height;
  F3DBitmap.PixelFormat := pf24bit;

  currentPrimitive := -1;

  if( not FKernelInitialized ) then
  begin
      updateScene;
      RayTracer_InitializeKernel( false, cbPlatforms.ItemIndex, cbDevices.ItemIndex );
      FKernelInitialized := true;
      pnlSystem.Enabled := false;
  end;
  RayTracer_ResetKernel();

  previousSelectedPrimitive := -1;
  previousSelectedMaterial  := -1;

  // 3D View
  viewPos.x := 1; viewPos.y := 0; viewPos.z := -10000;
  viewDir.x := 1; viewDir.y := 0; viewDir.z := -5000;
  viewAngles.x := 0; viewAngles.y := 0; viewAngles.z := 0;

  lampPos.x :=  10000;
  lampPos.y :=  20000;
  lampPos.z := -10000;
  lampSize  :=  500;

  mouseDown := false;
  previousMouseX := 0;
  previousMouseY := 0;

  pathTracingIteration := 0;
  postProcessingParam := 0;

  initializeMaterials;
  updateMaterials;

  SceneInitialized := true;

  timer.Enabled := false;
end;

procedure TmainForm.RenderScene;
begin
  if( SceneInitialized ) then
  begin
    pbProcessing.Position := pathTracingIteration;
    RayTracer_SetPostProcessingInfo(
      cbPostProcessing.itemIndex,
      postProcessingParam,
      sbPPIntensity.Position*50,
      sbPPIntensity.Position );

    RayTracer_SetCamera(
      viewPos.x, viewPos.y, viewPos.z,
      viewDir.x, viewDir.y, viewDir.z,
      viewAngles.x, viewAngles.y, viewAngles.z );
    RayTracer_RunKernel(0,F3DBitmap.ScanLine[img3DView.Height-1]);

    img3DView.Picture.Assign(F3DBitmap);
    img3DView.Refresh;
  end;
end;

procedure TmainForm.rgMiscClick(Sender: TObject);
begin
  updateScene;
end;

procedure TmainForm.rgMouseControlsClick(Sender: TObject);
begin
  if( rgMouseControls.ItemIndex = 2 ) then
  begin
    currentMaterial := DEFAULT_LIGHT_MATERIAL;
    updateMaterialControls;
  end;
end;

procedure TmainForm.miSaveAsClick(Sender: TObject);
begin
  if sdSaveFile.Execute then
  begin
    RayTracer_SaveToFile( AnsiString(sdSaveFile.FileName) );
    currentModel.modelType := mtIRT;
    currentModel.Filename := AnsiString(sdSaveFile.FileName);
  end;
end;

procedure TmainForm.miSaveClick(Sender: TObject);
begin
  if currentModel.modelType <> mtIRT then
    miSaveAsClick(sender)
  else
    RayTracer_SaveToFile(currentModel.Filename);
end;

procedure TmainForm.miScreenshotClick(Sender: TObject);
begin
  sdSaveFile.Filter:='JPG file|*.jpg';
  if sdSaveFile.Execute then
  begin
    RayTracer_GenerateScreenshot(sdSaveFile.FileName,1);
  end;
end;

procedure TmainForm.FormCreate(Sender: TObject);
{$ifndef CUDA}
var
  platforms: integer;
  devices  : integer;
  value    : PAnsiChar;
  p,d      : Integer;
{$endif CUDA}
begin
{$ifndef CUDA}
  RayTracer_PopulateOpenCLInformation;
  cbPlatforms.Items.Clear;
  value := AllocMem(100);
  platforms := RayTracer_GetOpenCLPlaformCount;
  for p := 0 to platforms-1 do
  begin
    RayTracer_GetOpenCLPlatformDescription(p,value,100);
    cbPlatforms.Items.add(string(value));
    memLogs.lines.Add(IntToStr(p) + ': ' + string(value));
    devices := RayTracer_GetOpenCLDeviceCount(p);
    for d := 0 to devices-1 do
    begin
      RayTracer_GetOpenCLDeviceDescription(p,d,value,100);
      memLogs.lines.Add('-' + IntToStr(d) + ': ' + string(value));
    end;
  end;
  FreeMem(value);
  cbPlatforms.ItemIndex := 0;
  cbDevices.ItemIndex := 0;
{$else}
  pnlSystem.Visible := false;
{$endif CUDA}
end;

procedure TmainForm.FormDestroy(Sender: TObject);
begin
 RayTracer_FinalizeKernel;
end;

procedure TmainForm.FormShow(Sender: TObject);
begin
  FKernelInitialized := false;
  ApplicationFolder := ExtractFileDir(Application.ExeName) + '\';
  pgParameters.Enabled := false;
  tsMaterial.Enabled := false;
  tsObject.Enabled := false;
  SceneInitialized := false;
  currentModel.modelType := mtNone;
end;

procedure TmainForm.tbReflectionChange(Sender: TObject);
begin
  updateMaterial;
end;

procedure TmainForm.updateMaterial;
var
  fastTransparency: integer;
begin
  if( not controlUpdate ) and ( currentMaterial <> -1 ) then
  begin
    if( cbFastTransparency.Checked ) then fastTransparency := 1 else fastTransparency := 0;
    pathTracingIteration := 0;
    RayTracer_SetMaterial(
      currentMaterial,
      GetRValue(shMaterialColor.Brush.Color)/255,
      GetGValue(shMaterialColor.Brush.Color)/255,
      GetBValue(shMaterialColor.Brush.Color)/255,
      sbNoise.Position/100,
      sbReflection.Position/100,
      1+sbRefraction.Position/100,
      integer(cbProcedural.checked),
      0, 0,
      sbTransparency.Position/100,
      sbDiffuseTextureId.Position,
      sbNormalTextureId.Position,
      sbBumpTextureId.Position,
      sbSpecularTextureId.Position,
      sbReflectionTextureId.Position,
      sbTransparencyTextureId.Position,
      sbSpecValue.Position/100,
      sbSpecPower.Position,
      sbSpecCoef.Position/100,
      sbInnerIllumination.Position/100,
      sbIlluminationDiffusion.Position*5000,
      sbIlluminationPropagation.Position*5000,
      fastTransparency );
    lblDiffuseId.Caption := IntToStr(sbDiffuseTextureId.Position);
    lblBumpId.Caption := IntToStr(sbBumpTextureId.Position);
    lblNormalId.Caption := IntToStr(sbNormalTextureId.Position);
    lblSpecularId.Caption := IntToStr(sbSpecularTextureId.Position);
    lblReflectionId.Caption := IntToStr(sbReflectionTextureId.Position);
    lblTransparencyId.Caption := IntToStr(sbTransparencyTextureId.Position);
    updateScene;
  end;
end;

procedure TmainForm.updateScene;
begin
  if( not controlUpdate ) then
  begin
    RayTracer_SetSceneInfo(
      img3DView.Width,
      img3DView.Height,
      cbGraphicsLevel.ItemIndex,
      sbRayInterations.Position,
      0,     // transparent Color
      sbViewDistance.Position*500,
      sbShadowIntensity.Position/100,
      cb3DVision.ItemIndex,
      sbWith3DVision.Position*5,
      GetRValue( shBackgroundColor.Brush.Color)/255,
      GetGValue( shBackgroundColor.Brush.Color)/255,
      GetBValue( shBackgroundColor.Brush.Color)/255,
      0.1,
      integer(cbBoundingBoxes.checked),
      pathTracingIteration,
      maxPathTracingIterations,
      integer(ot_Delphi),
      random(1000),
      1,
      rgMisc.ItemIndex,
      integer(cbDoubleSidedTriangles.Checked),
      integer(cbGradientBackGround.Checked),
      integer(cbAdvancedRenderingFeatures.Checked));
    RenderScene;
  end;
end;

procedure TmainForm.tbRefractionChange(Sender: TObject);
begin
  updateMaterial;
end;

procedure TmainForm.tbTransparencyChange(Sender: TObject);
begin
  updateMaterial;
end;

procedure TmainForm.sbSpecValueChange(Sender: TObject);
begin
  updateMaterial;
end;

procedure TmainForm.sbStickSizeChange(Sender: TObject);
begin
  updateWorld;
end;

procedure TmainForm.sbSpecPowerChange(Sender: TObject);
begin
  updateMaterial;
end;

procedure TmainForm.sbSpecCoefChange(Sender: TObject);
begin
  updateMaterial;
end;

procedure TmainForm.sbReflectionChange(Sender: TObject);
begin
  updateMaterial;
end;

procedure TmainForm.sbDiffuseTextureIdChange(Sender: TObject);
begin
  updateMaterial;
end;

procedure TmainForm.sbTransparencyChange(Sender: TObject);
begin
  updateMaterial;
end;

procedure TmainForm.sbRefractionChange(Sender: TObject);
begin
  updateMaterial;
end;

procedure TmainForm.sbDefaultAtomSizeChange(Sender: TObject);
begin
  updateWorld;
end;

procedure TmainForm.sbIlluminationDiffusionChange(Sender: TObject);
begin
  updateMaterial;
end;

procedure TmainForm.sbIlluminationPropagationChange(Sender: TObject);
begin
  updateMaterial;
end;

procedure TmainForm.sbNoiseChange(Sender: TObject);
begin
  updateMaterial;
end;

procedure TmainForm.cbProceduralClick(Sender: TObject);
begin
  updateMaterial;
end;

procedure TmainForm.cbRepresentationChange(Sender: TObject);
begin
  updateWorld;
end;

procedure TmainForm.cbSceneChange(Sender: TObject);
begin
  updateWorld;
end;

procedure TmainForm.cbShadowsClick(Sender: TObject);
begin
  updateScene;
end;

procedure TmainForm.sbShadowIntensityChange(Sender: TObject);
begin
  updateScene;
end;

procedure TmainForm.sbRayInterationsChange(Sender: TObject);
begin
  updateScene;
end;

procedure TmainForm.sbViewDistanceChange(Sender: TObject);
begin
  updateScene;
end;

procedure TmainForm.cb3DVisionChange(Sender: TObject);
begin
  updateScene;
end;

procedure TmainForm.sbWith3DVisionChange(Sender: TObject);
begin
  updateScene;
end;

procedure TmainForm.cbBoundingBoxesClick(Sender: TObject);
begin
  updateScene;
end;

procedure TmainForm.cbContinuousRenderingClick(Sender: TObject);
begin
  if( cbContinuousRendering.Checked ) then
  begin
    maxPathTracingIterations := 100;
    timer.Enabled := true;
  end
  else
    maxPathTracingIterations := 1;
end;

procedure TmainForm.cbDoubleSidedTrianglesClick(Sender: TObject);
begin
  updateScene;
end;

procedure TmainForm.img3DViewMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var
  mx, my: integer;
  angles: T3DPoint;
  value : double;
begin
  if FKernelInitialized then
  begin
    currentPrimitive := RayTracer_GetPrimitiveAt(x,img3DView.Height-y);
    lblPrimitiveID.Caption := 'Primitive ID: ' + IntToStr(currentPrimitive);
  end;

  if(cbDraftMode.Checked) then RayTracer_SetDraftMode(1);
  mx := (X-img3DView.Width div 2);
  my := (Y-img3DView.Height div 2);

  try
    if( mouseDown ) then
    begin
      pathTracingIteration := 0;
      case mouseButton of
        mbLeft:
        begin
          case rgMouseControls.ItemIndex of
            0..1: // Camera
            begin
              if( ssShift in Shift ) then
              begin
                viewPos.z := viewPos.z - 20*( my - previousMouseY );
              end
              else
              begin
                viewPos.z := viewPos.z - 20*( my - previousMouseY );
                viewDir.z := viewDir.z - 20*( my - previousMouseY );
              end;
            end;
            2: // light source
            begin
              lampPos.x := lampPos.x - 50*( mx - previousMouseX );
              lampPos.y := lampPos.y - 50*( my - previousMouseY );
              lamp := RayTracer_GetLight(0);
              RayTracer_SetPrimitive(
                lamp,
                lampPos.x, lampPos.y, lampPos.z,
                0, 0, 0,
                0, 0, 0,
                lampSize, 0, 0,
                DEFAULT_LIGHT_MATERIAL);
              RayTracer_CompactBoxes(false);
            end;
            3: // post processing
            begin
              postProcessingParam := postProcessingParam + 20*( my - previousMouseY );
            end;

          end;
        end;
        mbRight:
        begin
          case rgMouseControls.ItemIndex of
            0..1:
            begin
              value := (previousMouseX - mx)/100;
              if abs(value)<1 then
                viewAngles.y :=  viewAngles.y + ArcSin(value);
              value := (previousMouseY - my)/100;
              if abs(value)<1 then
                viewAngles.x :=  viewAngles.x + ArcSin(value);
            end;
            2: // light source
            begin
              lampPos.x := lampPos.x - 50*( mx - previousMouseX );
              lampPos.z := lampPos.z - 50*( my - previousMouseY );
              lamp := RayTracer_GetLight(0);
              RayTracer_SetPrimitive(
                lamp,
                lampPos.x, lampPos.y, lampPos.z,
                0, 0, 0,
                0, 0, 0,
                lampSize, 0, 0,
                DEFAULT_LIGHT_MATERIAL);
              RayTracer_CompactBoxes(false);
            end;
          end;
        end;
        mbMiddle:
        begin
          case rgMouseControls.ItemIndex of
            0..4: begin
              // Object Rotation
              angles.x := 0;
              angles.y := 0;
              value := (previousMouseX - mx)/100;
              if abs(value)<1 then
                viewAngles.y :=  viewAngles.y + ArcSin(value);
              value := (previousMouseY - my)/100;
              if abs(value)<1 then
                viewAngles.x :=  viewAngles.x + ArcSin(value);
              angles.z := 0;
              RayTracer_RotatePrimitives( 0, nbPrimitives, 0,0,0, angles.x, angles.y, angles.z );
            end;
          end;
        end;
      end;
      RenderScene;
    end;
  finally
  end;

  previousMouseX := mx;
  previousMouseY := my;

end;

procedure TmainForm.updateMaterialControls;
var
  material: TMaterial;
begin
  if( currentMaterial <> -1 ) then
  begin
    // Selection
    RayTracer_GetMaterial(
      currentMaterial,
      material.color.x,material.color.y,material.color.z,
      material.noise, material.reflection, material.refraction,
      material.procedural,
      material.wireframe, material.wireframeDepth,
      material.transparency,
      material.diffuseTextureId,
      material.normalTextureId,
      material.bumpTextureId,
      material.specularTextureId,
      material.reflectionTextureId,
      material.transparencyTextureId,
      material.specular.x, material.specular.y, material.specular.z,
      material.innerIllumination, material.illuminationDiffusion, material.illuminationPropagation,
      material.FastTransparency );
    setMaterialControls( material );

    tsMaterial.Enabled := true;
    tsObject.Enabled := true;
    pgParameters.ActivePage := tsMaterial;
  end;
end;

procedure TmainForm.img3DViewMouseown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  center: T3DPoint;
begin
  mouseDown := true;
  mouseButton := Button;
  previousMouseY := (Y-img3DView.Height div 2);

  if( currentPrimitive <> -1 ) and ( Button = mbLeft ) then
  begin
    case rgMouseControls.ItemIndex of
      1: // Molecule
      begin
        currentMaterial := RayTracer_GetPrimitiveMaterial(currentPrimitive);
        updateMaterialControls;
        updatePrimitiveControls;
        pathTracingIteration := 0;
      end;
      3: // Post processing effetcs
      begin
        RayTracer_GetPrimitiveCenter(currentPrimitive, center.x, center.y, center.z);
        postProcessingParam := center.z-viewPos.z;
        pathTracingIteration := 0;
      end;
    end;
  end
  else
  begin
    tsMaterial.Enabled := false;
    tsObject.Enabled := false;
  end;

end;

procedure TmainForm.img3DViewMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if(cbDraftMode.Checked) then
  begin
    RayTracer_SetDraftMode(0);
    RenderScene;
  end;
  mouseDown := false;
end;

procedure TmainForm.TimerTimer(Sender: TObject);
begin
  if( pathTracingIteration < maxPathTracingIterations ) then
  begin
    inc( pathTracingIteration );
    lblPathTracingIterations.Caption := '(' + IntToStr(pathTracingIteration) +
    '/' + IntToStr(maxPathTracingIterations) + ')';
    UpdateScene;
  end
  else
  begin
    pathTracingIteration := 0;
    timer.Enabled := false;
    cbContinuousRendering.Checked := false;
  end;
end;

procedure TmainForm.updateWorld;
var
  primitiveId: integer;
  size: double;
  groundHeight : double;
  boxSize : double;
  tiles: integer;
begin
  Timer.Enabled := false;
  cbContinuousRendering.Checked := false;
  SceneInitialized := false;
  Screen.Cursor := crHourGlass;
  groundHeight := -2510;
  tiles:=20;

  Initialize;

  // Load Files
  case currentModel.modelType of
    mtPDB:
      nbPrimitives := RayTracer_LoadMolecule(
        currentModel.Filename,
        TGeometryType( cbGeometryType.ItemIndex ),
        sbDefaultAtomSize.Position,
        sbStickSize.Position,
        cbRepresentation.ItemIndex,
        50);
    mtOBJ:
      RayTracer_LoadOBJModel( currentModel.Filename, 0, 5000, groundHeight);
    mtIRT:
      RayTracer_LoadFromFile( currentModel.Filename, 5000 );
  end;

  // Light
  lamp := RayTracer_AddPrimitive(integer(ptSphere));
  RayTracer_SetPrimitive(
    lamp,
    lampPos.x, lampPos.y, lampPos.z,
    0, 0, 0,
    0, 0, 0,
    lampSize, lampSize, lampSize,
    DEFAULT_LIGHT_MATERIAL);

  // Create Scene
  boxSize:=20000;
  case cbScene.ItemIndex of
    0: ;// nothing
    1: // Wall
    begin
      primitiveId := RayTracer_AddPrimitive(integer(ptTriangle));
      RayTracer_SetPrimitive(
        primitiveId,
        -boxSize, -boxSize, boxSize,
         boxSize, -boxSize, boxSize,
         boxSize,  boxSize, boxSize,
         0,0,0,
        CORNELLBOX_GROUND_MATERIAL);
      RayTracer_SetPrimitiveNormals(primitiveId,0,0,-1,0,0,-1,0,0,-1);
      RayTracer_SetPrimitiveTextureCoordinates(primitiveId,0,0,0,0,1,0,1,1,0);
      primitiveId := RayTracer_AddPrimitive(integer(ptTriangle));
      RayTracer_SetPrimitive(
        primitiveId,
         boxSize,  boxSize, boxSize,
        -boxSize,  boxSize, boxSize,
        -boxSize, -boxSize, boxSize,
         0,0,0,
        CORNELLBOX_GROUND_MATERIAL);
      RayTracer_SetPrimitiveNormals(primitiveId,0,0,-1,0,0,-1,0,0,-1);
      RayTracer_SetPrimitiveTextureCoordinates(primitiveId,1,1,0,1,0,0,0,0,0);
    end;
    2: // Water ball
    begin
      primitiveId := RayTracer_AddPrimitive(integer(ptSphere));
      RayTracer_SetPrimitive(
        primitiveId,
        0, 0, 0,
        0, 0, 0,
        0, 0, 0,
        boxSize/2, boxSize/2, boxSize/2,
        CORNELLBOX_GROUND_MATERIAL);
    end;
    3: // Ground
    begin
      primitiveId := RayTracer_AddPrimitive(integer(ptTriangle));
      RayTracer_SetPrimitive(
        primitiveId,
        -boxSize, groundHeight, -boxSize,
         boxSize, groundHeight, -boxSize,
         boxSize, groundHeight,  boxSize,
         0,0,0,
        CORNELLBOX_GROUND_MATERIAL);
      RayTracer_SetPrimitiveNormals(primitiveId,0,1,0,0,1,0,0,1,0);
      RayTracer_SetPrimitiveTextureCoordinates(primitiveId,0,0,0,0,tiles,0,tiles,tiles,0);
      primitiveId := RayTracer_AddPrimitive(integer(ptTriangle));
      RayTracer_SetPrimitive(
        primitiveId,
         boxSize, groundHeight,  boxSize,
        -boxSize, groundHeight,  boxSize,
        -boxSize, groundHeight, -boxSize,
         0,0,0,
        CORNELLBOX_GROUND_MATERIAL);
      RayTracer_SetPrimitiveNormals(primitiveId,0,1,0,0,1,0,0,1,0);
      RayTracer_SetPrimitiveTextureCoordinates(primitiveId,tiles,tiles,0,tiles,0,0,0,0,0);
    end;
    4: // Cornell Box
    begin
      size := 10000;
      primitiveId := RayTracer_AddPrimitive(integer(ptXYPlane));
      RayTracer_SetPrimitive(primitiveId, 0, groundHeight + size, size, 0,0,0,0,0,0, size, size,  0, 107); // front
      primitiveId := RayTracer_AddPrimitive(integer(ptYZPlane));
      RayTracer_SetPrimitive(primitiveId, size, groundHeight + size, 0, 0,0,0,0,0,0, 0, size, size, 108); // right
      primitiveId := RayTracer_AddPrimitive(integer(ptYZPlane));
      RayTracer_SetPrimitive(primitiveId,-size, groundHeight + size, 0, 0,0,0,0,0,0, 0, size, size, 109); // left
      primitiveId := RayTracer_AddPrimitive(integer(ptXZPlane));
      RayTracer_SetPrimitive(primitiveId, 0, groundHeight+size + size, 0, 0,0,0,0,0,0, size,  0, size, 110); // Roof
      primitiveId := RayTracer_AddPrimitive(integer(ptXZPlane));
      RayTracer_SetPrimitive(primitiveId, 0, groundHeight-size + size, 0,0,0,0,0,0,0,  size,  0, size, 109); // Floor
    end;
    5: // SkyBox
    begin
      size := 100000;
      primitiveId := RayTracer_AddPrimitive(integer(ptXYPlane));
      RayTracer_SetPrimitive(primitiveId, 0, 0, size, 0,0,0,0,0,0, size, size,  0, 101); // front
      primitiveId := RayTracer_AddPrimitive(integer(ptYZPlane));
      RayTracer_SetPrimitive(primitiveId, size, 0, 0, 0,0,0,0,0,0, 0, size, size, 102); // right
      primitiveId := RayTracer_AddPrimitive(integer(ptXYPlane));
      RayTracer_SetPrimitive(primitiveId, 0, 0,-size, 0,0,0,0,0,0, size, size,  0, 103); // back
      primitiveId := RayTracer_AddPrimitive(integer(ptYZPlane));
      RayTracer_SetPrimitive(primitiveId,-size, 0, 0, 0,0,0,0,0,0, 0, size, size, 104); // left
      primitiveId := RayTracer_AddPrimitive(integer(ptXZPlane));
      RayTracer_SetPrimitive(primitiveId, 0, size, 0, 0,0,0,0,0,0, size,  0, size, 105); // Roof
      primitiveId := RayTracer_AddPrimitive(integer(ptXZPlane));
      RayTracer_SetPrimitive(primitiveId, 0, -size, 0,0,0,0,0,0,0,  size,  0, size, 106); // Floor
    end;
  end;

  nbPrimitives := RayTracer_CompactBoxes(true);

  memLogs.Lines.Add( 'Current model: ' + String(currentModel.Filename));

  pgParameters.Enabled := true;
  SceneInitialized := true;

  lblElements.Caption := IntToStr(nbPrimitives) + ' element(s)';
  RenderScene;
  Screen.Cursor := crDefault;
end;

procedure TmainForm.btnOpenClick(Sender: TObject);
var
  httpRequest: TIdHTTP;
  pdbFile: TFileStream;
  pdbFileName : String;
  url : string;
begin
  try
    pdbFileName := ApplicationFolder + pdbFolder + '\' + edtMoleculeId.Text + '.pdb';
    url := pdbUrl + edtMoleculeId.Text + '.pdb';
    memLogs.Lines.Add('Downloading ' + edtMoleculeId.Text + ' from ' + url );
    httpRequest := TIdHTTP.Create(nil);
    try
      pdbFile := TFileStream.Create(pdbFileName, fmCreate);
      httpRequest.get(url,pdbFile);
      memLogs.Lines.Add(httpRequest.ResponseText);
      if( httpRequest.ResponseCode<>200) then
      begin
        memLogs.Lines.Add('Download failed with error HTTP ' + IntToStr(httpRequest.ResponseCode));
      end
      else
      begin
        memLogs.Lines.Add('Download successfull');
      end;
    finally
      httpRequest.Free;
      pdbFile.Free;
    end;

    Application.ProcessMessages;
    currentModel.Filename  := AnsiString(pdbFileName);
    currentModel.modelType := mtPDB;
    updateWorld;
    Application.ProcessMessages;
  finally
  end;
end;

procedure TmainForm.cbFastTransparencyClick(Sender: TObject);
begin
  updateMaterial;
end;

procedure TmainForm.cbFixedSizeAtomClick(Sender: TObject);
begin
  updateWorld;
end;

procedure TmainForm.cbFogEffectClick(Sender: TObject);
begin
  updateScene;
end;

procedure TmainForm.cbGeometryTypeChange(Sender: TObject);
begin
  updateWorld;
end;

procedure TmainForm.cbGraphicsLevelChange(Sender: TObject);
begin
  updateScene;
end;

procedure TmainForm.cbIsometric3DClick(Sender: TObject);
begin
  updateScene;
end;

procedure TmainForm.cbSticksClick(Sender: TObject);
begin
  updateWorld;
end;

procedure TmainForm.cbThemeChange(Sender: TObject);
begin
  updateMaterials;
end;

procedure TmainForm.edtMoleculeIdExit(Sender: TObject);
begin
  btnOpenClick(sender);
end;

procedure TmainForm.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TmainForm.cbMaterialColorChange(Sender: TObject);
begin
  updateMaterial;
end;

procedure TmainForm.updateObjectAttributes(Sender: TObject);
begin
  if( currentPrimitive <> -1 ) and ( not controlUpdate ) then
  begin
    RayTracer_SetPrimitive(
      currentPrimitive,
      seCenterX.Value, seCenterY.Value, seCenterZ.Value,
      seOtherCenterX.Value, seOtherCenterY.Value, seOtherCenterZ.Value,
      0,0,0,
      seSizeX.Value, seSizeY.Value, seSizeZ.Value,
      seMaterialId.Value );
    RayTracer_CompactBoxes(false);
    updateScene;
  end;
end;

procedure TmainForm.updatePrimitiveControls;
var
  primitive: TPrimitive;
begin
  controlUpdate := true;

  // Primitive
  if( RayTracer_GetPrimitive(
    currentPrimitive,
    primitive.p0.x,primitive.p0.y,primitive.p0.z,
    primitive.p1.x,primitive.p1.y,primitive.p1.z,
    primitive.p2.x,primitive.p2.y,primitive.p2.z,
    primitive.size.x,primitive.size.y,primitive.size.z,
    primitive.materialId) = 0 ) then
  begin
    //setPrimitiveControls(primitive);
  end;

  seCenterX.Value := trunc(primitive.p0.x);
  seCenterY.Value := trunc(primitive.p0.y);
  seCenterZ.Value := trunc(primitive.p0.z);

  seOtherCenterX.Value := trunc(primitive.p1.x);
  seOtherCenterY.Value := trunc(primitive.p1.y);
  seOtherCenterZ.Value := trunc(primitive.p1.z);

  seSizeX.Value := trunc(primitive.Size.x);
  seSizeY.Value := trunc(primitive.Size.y);
  seSizeZ.Value := trunc(primitive.Size.z);

  seMaterialId.Value := primitive.materialId;

  //tsObject.Enabled := true;
  controlUpdate := false;
end;

procedure TmainForm.shBackgroundColorMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if( cdColor.Execute ) then
  begin
    shBackgroundColor.Brush.Color := cdColor.Color;
    updateScene;
  end;
end;

procedure TmainForm.shMaterialColorMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
  begin
    if( cdColor.Execute ) then
    begin
      shMaterialColor.Brush.Color := cdColor.Color;
      updateMaterial;
    end;
  end;
end;

procedure TmainForm.setMaterialControls( material: TMaterial );
begin
  controlUpdate := true;

  sbSpecValue.Position := trunc(material.specular.x*100);
  sbSpecPower.Position := trunc(material.specular.y);
  sbSpecCoef.Position  := trunc(material.specular.z*100);
  sbInnerIllumination.Position  := trunc(material.innerIllumination*100);
  sbIlluminationDiffusion.Position := trunc(material.illuminationDiffusion/5000);
  sbIlluminationPropagation.Position := trunc(material.illuminationPropagation/5000);
  cbProcedural.Checked := ( material.procedural = 1 );
  sbReflection.Position := trunc(material.reflection*100);
  sbTransparency.Position := trunc(material.transparency*100);
  sbRefraction.Position := trunc((material.refraction-1)*100);
  sbNoise.Position := trunc(material.noise*100);
  sbDiffuseTextureId.Position := material.diffuseTextureId;
  sbBumpTextureId.Position := material.bumpTextureId;
  sbNormalTextureId.Position := material.normalTextureId;
  sbSpecularTextureId.Position := material.specularTextureId;

  shMaterialColor.Brush.Color := RGB(
    trunc(material.color.x*255),
    trunc(material.color.y*255),
    trunc(material.color.z*255));

  cbFastTransparency.Checked := (material.FastTransparency = 1);

  //tsMaterial.Enabled := true;
  controlUpdate := false;
end;
    
procedure TmainForm.sbPPIntensityChange(Sender: TObject);
begin
  updateScene;
end;

procedure TmainForm.cbPlatformsChange(Sender: TObject);
{$ifndef CUDA}
var
  devices  : integer;
  value    : PAnsiChar;
  p,d      : Integer;
{$endif CUDA}
begin
{$ifndef CUDA}
  p := cbPlatforms.ItemIndex;
  cbDevices.Items.Clear;
  value := AllocMem(100);
  RayTracer_GetOpenCLPlatformDescription(p,value,100);
  devices := RayTracer_GetOpenCLDeviceCount(p);
  for d := 0 to devices-1 do
  begin
    RayTracer_GetOpenCLDeviceDescription(p,d,value,100);
    cbDevices.Items.Add(string(value));
  end;
  FreeMem(value);
  cbDevices.ItemIndex := 0;
{$endif CUDA}
end;

procedure TmainForm.cbPostProcessingChange(Sender: TObject);
begin
  updateScene;
end;

procedure TmainForm.pnlCenterMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  mouseDown := false;
end;

end.
