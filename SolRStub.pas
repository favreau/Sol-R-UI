unit SolRStub;

interface

uses Windows;

const
  SOLR_DLL = 'solr.dll';

  PRIMITIVE_NONE = -1;
  MATERIAL_NONE = -1;
  TEXTURE_NONE  = -1;
  TEXTURE_MANDELBROT = -2;
  TEXTURE_JULIA = -3;

  BOUNDING_BOXES_TREE_DEPTH = 64;
  NB_MAX_BOXES      = 2097152;
  NB_MAX_PRIMITIVES = 2097152;
  NB_MAX_LAMPS      = 512;
  NB_MAX_MATERIALS  = 65506+30; // Last 30 materials are reserved
  NB_MAX_TEXTURES   = 512;
  NB_MAX_FRAMES     = 128;
  NB_MAX_LIGHTINFORMATIONS = 512;

  // Skybox matrerials
  SKYBOX_FRONT_MATERIAL  = NB_MAX_MATERIALS-2;
  SKYBOX_RIGHT_MATERIAL  = NB_MAX_MATERIALS-3;
  SKYBOX_BACK_MATERIAL   = NB_MAX_MATERIALS-4;
  SKYBOX_LEFT_MATERIAL   = NB_MAX_MATERIALS-5;
  SKYBOX_TOP_MATERIAL    = NB_MAX_MATERIALS-6;
  SKYBOX_BOTTOM_MATERIAL = NB_MAX_MATERIALS-7;

  // Ground material
  SKYBOX_GROUND_MATERIAL = NB_MAX_MATERIALS-8;

  // Cornell Box material
  CORNELLBOX_FRONT_MATERIAL  = NB_MAX_MATERIALS-9;
  CORNELLBOX_RIGHT_MATERIAL  = NB_MAX_MATERIALS-10;
  CORNELLBOX_BACK_MATERIAL   = NB_MAX_MATERIALS-11;
  CORNELLBOX_LEFT_MATERIAL   = NB_MAX_MATERIALS-12;
  CORNELLBOX_TOP_MATERIAL    = NB_MAX_MATERIALS-13;
  CORNELLBOX_BOTTOM_MATERIAL = NB_MAX_MATERIALS-14;
  CORNELLBOX_GROUND_MATERIAL = NB_MAX_MATERIALS-15;

  // Fractals
  MANDELBROT_MATERIAL = NB_MAX_MATERIALS-16;
  JULIA_MATERIAL      = NB_MAX_MATERIALS-17;

  // Basic reflection materials
  BASIC_REFLECTION_MATERIAL_001 = NB_MAX_MATERIALS-18;
  BASIC_REFLECTION_MATERIAL_002 = NB_MAX_MATERIALS-19;
  BASIC_REFLECTION_MATERIAL_003 = NB_MAX_MATERIALS-20;
  BASIC_REFLECTION_MATERIAL_004 = NB_MAX_MATERIALS-21;
  BASIC_REFLECTION_MATERIAL_005 = NB_MAX_MATERIALS-22;
  BASIC_REFLECTION_MATERIAL_006 = NB_MAX_MATERIALS-23;

  // Light source materials
  LIGHT_MATERIAL_001            = NB_MAX_MATERIALS-24;
  LIGHT_MATERIAL_002            = NB_MAX_MATERIALS-25;
  LIGHT_MATERIAL_003            = NB_MAX_MATERIALS-26;
  LIGHT_MATERIAL_004            = NB_MAX_MATERIALS-27;
  LIGHT_MATERIAL_005            = NB_MAX_MATERIALS-28;
  LIGHT_MATERIAL_006            = NB_MAX_MATERIALS-29;
  LIGHT_MATERIAL_007            = NB_MAX_MATERIALS-30;
  LIGHT_MATERIAL_008            = NB_MAX_MATERIALS-31;
  LIGHT_MATERIAL_009            = NB_MAX_MATERIALS-32;
  LIGHT_MATERIAL_010            = NB_MAX_MATERIALS-33;
  DEFAULT_LIGHT_MATERIAL        = NB_MAX_MATERIALS-34;

  // Basic color materials
  WHITE_MATERIAL                = NB_MAX_MATERIALS-35;
  RED_MATERIAL                  = NB_MAX_MATERIALS-36;
  GREEN_MATERIAL                = NB_MAX_MATERIALS-37;
  BLUE_MATERIAL                 = NB_MAX_MATERIALS-38;
  YELLOW_MATERIAL               = NB_MAX_MATERIALS-39;
  PURPLE_MATERIAL               = NB_MAX_MATERIALS-40;

  SKYBOX_SPHERE_MATERIAL        = NB_MAX_MATERIALS-41;

Type
  T3DPoint = record
    x: double;
    y: double;
    z: double;
  end;

  TPrimtiveType = (
	ptSphere      = 0,
	ptCylinder    = 1,
	ptTriangle    = 2,
	ptCheckboard  = 3,
	ptCamera      = 4,
	ptXYPlane     = 5,
	ptYZPlane     = 6,
	ptXZPlane     = 7,
  ptMagicCarpet = 8,
  ptEnvironment = 9,
  ptEllipsoid   = 10 );

  TPostProcessingType = (
    ppe_none             = 0,
    ppe_depthOfField     = 1,
    ppe_ambientOcclusion = 2,
    ppe_radiosity        = 3,
    ppe_filters          = 4 );

  TFrameBufferType = (
    fb_RGB = 0,
    fb_BGR = 1 );

  TGeometryType = (
   gtAtoms           = 0,
   gtFixedSizeAtoms  = 1,
   gtSticks          = 2,
   gtAtomsAndSticks  = 3,
   gtBackbone        = 4 );

  TPrimitive = record
    p0: T3DPoint;
    p1: T3DPoint;
    p2: T3DPoint;
    size: T3DPoint;
    materialId: integer;
    materialXPadding: double;
    materialYPadding: double;
  end;

  TMaterial = record
    innerIllumination: double;
    illuminationDiffusion: double;
    illuminationPropagation: double;
    color: T3DPoint;
    noise : double;
    specular: T3DPoint;       
    reflection : double;
    refraction : double;
    transparency : double;
    opacity: double;
    procedural : integer;
    wireframe : integer;
    wireframeDepth : integer;
    diffuseTextureId : integer;
    normalTextureId : integer;
    bumpTextureId : integer;
    specularTextureId : integer;
    reflectionTextureId : integer;
    transparencyTextureId : integer;
    ambientOcclusionTextureId: integer;
    fastTransparency: integer;
  end;

Function SolR_PopulateOpenCLInformation() : Integer; cdecl; external SOLR_DLL;

Function SolR_GetOpenCLPlaformCount() : Integer; cdecl; external SOLR_DLL;

Function SolR_GetOpenCLPlatformDescription(
  platform: integer; value: PAnsiChar; valueLength: integer) : Integer; cdecl; external SOLR_DLL;

Function SolR_GetOpenCLDeviceCount(
  platform: integer) : Integer; cdecl; external SOLR_DLL;

Function SolR_GetOpenCLDeviceDescription(
  platform, device: integer; value: PAnsiChar; valueLength: integer) : Integer; cdecl; external SOLR_DLL;

Function SolR_RecompileKernels(
  filename: PAnsiChar) : Integer; cdecl; external SOLR_DLL;

Function SolR_SetSceneInfo(
   width, height, graphicsLevel, nbRayIterations : integer;
   transparentColor, viewDistance, shadowIntensity : Double;
   eyeSeparation : Double;
   bgColorR, bgColorG, bgColorB, bgColorA : Double;
   renderBoxes, pathTracingIteration, maxPathTracingIterations, frameBufferType,
   timestamp, atmosphericEffect, cameraType, oubleSidedTriangles,
   extendedGeometry, advancedIllumination, sbyboxSize, skyboxMaterialId: integer;
   geometryEpsilon, rayEpsilon: Double ) : Integer; cdecl; external SOLR_DLL;

Function SolR_SetPostProcessingInfo(
   atype : Integer;param1,param2 : Double;param3 : integer ) : Integer; cdecl; external SOLR_DLL;

Function SolR_SetDraftMode(draft: integer) : Integer; cdecl; external SOLR_DLL;

Function SolR_GenerateScreenshot(filename: AnsiString; quality: integer) : Integer; cdecl; external SOLR_DLL;

Function SolR_InitializeKernel( activeLogging: boolean; platform : Integer;device : integer) : Integer; cdecl; external SOLR_DLL;
Function SolR_FinalizeKernel : Integer; cdecl; external SOLR_DLL;
Function SolR_ResetKernel : Integer; cdecl; external SOLR_DLL;

// ---------- Camera ----------
Procedure SolR_SetCamera(
   eye_x, eye_y, eye_z,
   dir_x, dir_y, dir_z,
   angle_x, angle_y, angle_z : Double); cdecl; external SOLR_DLL;

// ---------- Rendering ----------
Function SolR_RunKernel(timer : Double; image : Pointer) : Integer; cdecl; external SOLR_DLL;

// ---------- Primitives ----------
Function SolR_AddPrimitive( aType : integer; movable : integer ) : Integer; cdecl; external SOLR_DLL;

Function SolR_SetPrimitive(
   index: Integer;
   p0_x, p0_y, p0_z: double;
   p1_x, p1_y, p1_z: double;
   P2_x, p2_y, p2_z: double;
   size_x, size_y, size_z : Double;
   materialId : Integer) : Integer; cdecl; external SOLR_DLL;

Function SolR_GetPrimitiveAt(
   x,y: integer) : Integer; cdecl; external SOLR_DLL;

Function SolR_GetPrimitive(
  FSelectedObject: integer;
  var p0_x: double; var p0_y: double; var p0_z : double;
  var p1_x: double; var p1_y: double; var p1_z : double;
  var p2_x: double; var p2_y: double; var p2_z : double;
  var size_x: double; var size_y: double; var size_z : double;
  var materialId: long) : Integer; cdecl; external SOLR_DLL;

Function SolR_GetPrimitiveCenter(
   index: integer;
   var x,y,z: double) : Integer; cdecl; external SOLR_DLL;

Function SolR_RotatePrimitive(
   index: Integer;
   center_x, center_y, center_z : double;
   angles_x, angles_y, angles_z : double) : Integer; cdecl; external SOLR_DLL;

Function SolR_RotatePrimitives(
   fromBoxId, toBoxId: integer;
   center_x, center_y, center_z : double;
   angles_x, angles_y, angles_z : double) : Integer; cdecl; external SOLR_DLL;

Function SolR_SetPrimitiveMaterial(
   index,
   materialId : Integer) : Integer; cdecl; external SOLR_DLL;

Function SolR_GetPrimitiveMaterial(
   index: Integer) : Integer; cdecl; external SOLR_DLL;

Function SolR_GetLight(
   index: Integer) : Integer; cdecl; external SOLR_DLL;

Function SolR_SetPrimitiveNormals(
   index : integer;
   n0_x, n0_y, n0_z : double;
   n1_x, n1_y, n1_z : double;
   n2_x, n2_y, n2_z : double) : Integer; cdecl; external SOLR_DLL;

Function SolR_SetPrimitiveTextureCoordinates(
   index : integer;
   t0_x, t0_y, t0_z : double;
   t1_x, t1_y, t1_z : double;
   t2_x, t2_y, t2_z : double) : Integer; cdecl; external SOLR_DLL;

// ---------- Materials ----------
Function SolR_AddMaterial : Integer; cdecl; external SOLR_DLL;
Function SolR_SetMaterial(
   index : Integer;
   color_r, color_g, color_b, noise, reflection, refraction : Double;
   procedural : Integer;
   wireframe : Integer; wireframeDepth: Integer;
   transparency : Double; opacity: Double;
   diffuseTextureId, normalTextureId, bumpTextureId, specularTextureId, reflectionTextureId, transparencyTrextureId, ambientOcclusionTextureId : Integer;
   specValue, specPower, specCoef : Double;
   innerIllumination, illuminationDiffusion, illuminationPropagation : Double;
   fastTransparency: Integer) : Integer; cdecl; external SOLR_DLL;

Function SolR_GetMaterial(
   index : Integer;
   var color_r: double; var color_g: double; var color_b: double;
   var noise: double; var reflection: double; var refraction : Double;
   var procedural : integer;
   var wireframe    : Integer; var wireframeDepth: Integer;
   var transparency : Double;  var opacity: Double;
   var diffuseTextureId : Integer; var normalTextureId : Integer; var bumpTextureId : Integer;
   var specularTextureId : Integer; var reflectionTextureId : Integer;
   var transparencyTextureId : Integer; var ambientOcclusionTextureId : Integer;
   var specValue: double; var specPower: double; var specCoef: double;
   var innerIllumination: double; var illuminationDiffusion: double; var illuminationPropagation : double;
   var fastTransparency: Integer) : Integer; cdecl; external SOLR_DLL;

// ---------- PDB Files ----------
Function SolR_LoadMolecule(
  filename: AnsiString;
  geometryType : TGeometryType;
  defaultAtomSize: double;
  defaultStickSize: double;
  atomMaterialType: integer;
  scale: double ) : Integer; cdecl; external SOLR_DLL;

// ---------- OBJ Files ----------
Function SolR_LoadOBJModel(
  filename  : AnsiString;
  materialId: integer;
  autoScale : integer;
  scale     : double;
  autoCenter: integer;
  var height: double ) : Integer; cdecl; external SOLR_DLL;

Function SolR_CompactBoxes(
  update: boolean ) : Integer; cdecl; external SOLR_DLL;

// ---------- IRT Files ----------
Function SolR_LoadFromFile(
  filename: AnsiString; Scale: double ) : Integer; cdecl; external SOLR_DLL;

Function SolR_SaveToFile(
  filename: AnsiString ) : Integer; cdecl; external SOLR_DLL;

// ---------- Textures ----------
Function SolR_LoadTextureFromFile(
  index: integer; filename: AnsiString ) : Integer; cdecl; external SOLR_DLL;

Function SolR_GetNbTextures : Integer; cdecl; external SOLR_DLL;

Function SolR_GetTextureSize(
  index: integer; var width,height,depth: Integer) : Integer; cdecl; external SOLR_DLL;
Function SolR_GetTexture(
  index: integer; image: Pointer) : Integer; cdecl; external SOLR_DLL;

Implementation
end.


