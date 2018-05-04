// Compiled shader for custom platforms

//////////////////////////////////////////////////////////////////////////
// 
// NOTE: This is *not* a valid shader file, the contents are provided just
// for information and for debugging purposes only.
// 
//////////////////////////////////////////////////////////////////////////
// Skipping shader variants that would not be included into build of current scene.

Shader "Hidden/Nature/Tree Creator Leaves Optimized" {
Properties {
 _Color ("Main Color", Color) = (1.000000,1.000000,1.000000,1.000000)
 _TranslucencyColor ("Translucency Color", Color) = (0.730000,0.850000,0.410000,1.000000)
 _Cutoff ("Alpha cutoff", Range(0.000000,1.000000)) = 0.300000
 _TranslucencyViewDependency ("View dependency", Range(0.000000,1.000000)) = 0.700000
 _ShadowStrength ("Shadow Strength", Range(0.000000,1.000000)) = 0.800000
 _ShadowOffsetScale ("Shadow Offset Scale", Float) = 1.000000
 _MainTex ("Base (RGB) Alpha (A)", 2D) = "white" { }
 _ShadowTex ("Shadow (RGB)", 2D) = "white" { }
 _BumpSpecMap ("Normalmap (GA) Spec (R) Shadow Offset (B)", 2D) = "bump" { }
 _TranslucencyMap ("Trans (B) Gloss(A)", 2D) = "white" { }
[HideInInspector]  _TreeInstanceColor ("TreeInstanceColor", Vector) = (1.000000,1.000000,1.000000,1.000000)
[HideInInspector]  _TreeInstanceScale ("TreeInstanceScale", Vector) = (1.000000,1.000000,1.000000,1.000000)
[HideInInspector]  _SquashAmount ("Squash", Float) = 1.000000
}
SubShader { 
 LOD 200
 Tags { "IGNOREPROJECTOR"="true" "RenderType"="TreeLeaf" }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="FORWARDBASE" "IGNOREPROJECTOR"="true" "SHADOWSUPPORT"="true" "RenderType"="TreeLeaf" }
  ColorMask RGB
  //////////////////////////////////
  //                              //
  //      Compiled programs       //
  //                              //
  //////////////////////////////////
//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL 
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "TexCoord3"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"
Uses vertex data channel "TexCoord0"
Uses vertex data channel "Normal"

Constant Buffer "Globals" (512 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 128
  Matrix4x4 unity_WorldToObject at 192
  Matrix4x4 unity_MatrixInvV at 272
  Matrix4x4 unity_MatrixVP at 336
  Vector4 _Time at 0
  Vector4 unity_SHAr at 16
  Vector4 unity_SHAg at 32
  Vector4 unity_SHAb at 48
  Vector4 unity_SHBr at 64
  Vector4 unity_SHBg at 80
  Vector4 unity_SHBb at 96
  Vector4 unity_SHC at 112
  Vector4 unity_WorldTransformParams at 256
  Vector4 _TreeInstanceColor at 400
  Vector4 _TreeInstanceScale at 416
  Vector4 _SquashPlaneNormal at 432
  Float _SquashAmount at 448
  Vector4 _Wind at 464
  Vector4 _Color at 480
  Vector4 _MainTex_ST at 496
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

struct Globals_Type
{
    float4 _Time;
    float4 unity_SHAr;
    float4 unity_SHAg;
    float4 unity_SHAb;
    float4 unity_SHBr;
    float4 unity_SHBg;
    float4 unity_SHBb;
    float4 unity_SHC;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 unity_WorldTransformParams;
    float4 hlslcc_mtx4x4unity_MatrixInvV[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _TreeInstanceColor;
    float4 _TreeInstanceScale;
    float4 _SquashPlaneNormal;
    float _SquashAmount;
    float4 _Wind;
    float4 _Color;
    float4 _MainTex_ST;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float4 TANGENT0 [[ attribute(1) ]] ;
    float3 NORMAL0 [[ attribute(2) ]] ;
    float4 TEXCOORD0 [[ attribute(3) ]] ;
    float4 TEXCOORD1 [[ attribute(4) ]] ;
    float4 COLOR0 [[ attribute(5) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float2 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float4 COLOR0 [[ user(COLOR0) ]];
    float3 TEXCOORD4 [[ user(TEXCOORD4) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant Globals_Type& Globals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    float4 u_xlat2;
    float4 u_xlat3;
    float4 u_xlat4;
    float3 u_xlat5;
    float4 u_xlat6;
    float3 u_xlat9;
    float u_xlat17;
    float u_xlat21;
    float u_xlat22;
    u_xlat0 = Globals.hlslcc_mtx4x4unity_WorldToObject[1] * Globals.hlslcc_mtx4x4unity_MatrixInvV[1].yyyy;
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_WorldToObject[0], Globals.hlslcc_mtx4x4unity_MatrixInvV[1].xxxx, u_xlat0);
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_WorldToObject[2], Globals.hlslcc_mtx4x4unity_MatrixInvV[1].zzzz, u_xlat0);
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_WorldToObject[3], Globals.hlslcc_mtx4x4unity_MatrixInvV[1].wwww, u_xlat0);
    u_xlat1 = u_xlat0 * input.NORMAL0.yyyy;
    u_xlat0 = u_xlat0 * input.TANGENT0.yyyy;
    u_xlat2 = Globals.hlslcc_mtx4x4unity_WorldToObject[1] * Globals.hlslcc_mtx4x4unity_MatrixInvV[0].yyyy;
    u_xlat2 = fma(Globals.hlslcc_mtx4x4unity_WorldToObject[0], Globals.hlslcc_mtx4x4unity_MatrixInvV[0].xxxx, u_xlat2);
    u_xlat2 = fma(Globals.hlslcc_mtx4x4unity_WorldToObject[2], Globals.hlslcc_mtx4x4unity_MatrixInvV[0].zzzz, u_xlat2);
    u_xlat2 = fma(Globals.hlslcc_mtx4x4unity_WorldToObject[3], Globals.hlslcc_mtx4x4unity_MatrixInvV[0].wwww, u_xlat2);
    u_xlat1 = fma(input.NORMAL0.xxxx, u_xlat2, u_xlat1);
    u_xlat0 = fma(input.TANGENT0.xxxx, u_xlat2, u_xlat0);
    u_xlat2.x = -abs(input.TANGENT0.w) + 1.0;
    u_xlat9.xyz = fma(u_xlat1.xyz, u_xlat2.xxx, input.POSITION0.xyz);
    u_xlat9.xyz = u_xlat9.xyz * Globals._TreeInstanceScale.xyz;
    u_xlat3.x = dot(Globals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, float3(1.0, 1.0, 1.0));
    u_xlat3.y = u_xlat3.x + input.COLOR0.x;
    u_xlat17 = u_xlat3.y + input.COLOR0.y;
    u_xlat3.x = dot(u_xlat9.xyz, float3(u_xlat17));
    u_xlat3 = u_xlat3.xxyy + Globals._Time.yyyy;
    u_xlat3 = u_xlat3 * float4(1.97500002, 0.792999983, 0.375, 0.193000004);
    u_xlat3 = fract(u_xlat3);
    u_xlat3 = fma(u_xlat3, float4(2.0, 2.0, 2.0, 2.0), float4(-0.5, -0.5, -0.5, -0.5));
    u_xlat3 = fract(u_xlat3);
    u_xlat3 = fma(u_xlat3, float4(2.0, 2.0, 2.0, 2.0), float4(-1.0, -1.0, -1.0, -1.0));
    u_xlat4 = abs(u_xlat3) * abs(u_xlat3);
    u_xlat3 = fma(-abs(u_xlat3), float4(2.0, 2.0, 2.0, 2.0), float4(3.0, 3.0, 3.0, 3.0));
    u_xlat3 = u_xlat3 * u_xlat4;
    u_xlat3.xy = u_xlat3.yw + u_xlat3.xz;
    u_xlat4.xyz = u_xlat3.yyy * Globals._Wind.xyz;
    u_xlat4.xyz = u_xlat4.xyz * input.TEXCOORD1.yyy;
    u_xlat5.y = u_xlat3.y * input.TEXCOORD1.y;
    u_xlat6 = Globals.hlslcc_mtx4x4unity_WorldToObject[1] * Globals.hlslcc_mtx4x4unity_MatrixInvV[2].yyyy;
    u_xlat6 = fma(Globals.hlslcc_mtx4x4unity_WorldToObject[0], Globals.hlslcc_mtx4x4unity_MatrixInvV[2].xxxx, u_xlat6);
    u_xlat6 = fma(Globals.hlslcc_mtx4x4unity_WorldToObject[2], Globals.hlslcc_mtx4x4unity_MatrixInvV[2].zzzz, u_xlat6);
    u_xlat6 = fma(Globals.hlslcc_mtx4x4unity_WorldToObject[3], Globals.hlslcc_mtx4x4unity_MatrixInvV[2].wwww, u_xlat6);
    u_xlat1 = fma(input.NORMAL0.zzzz, u_xlat6, u_xlat1);
    u_xlat0 = fma(input.TANGENT0.zzzz, u_xlat6, u_xlat0);
    u_xlat22 = dot(u_xlat1, u_xlat1);
    u_xlat22 = rsqrt(u_xlat22);
    u_xlat1.xyz = fma(u_xlat1.xyz, float3(u_xlat22), (-input.NORMAL0.xyz));
    u_xlat1.xyz = fma(u_xlat2.xxx, u_xlat1.xyz, input.NORMAL0.xyz);
    u_xlat22 = input.COLOR0.y * 0.100000001;
    u_xlat5.xz = u_xlat1.xz * float2(u_xlat22);
    u_xlat3.z = 0.300000012;
    u_xlat3.xyz = fma(u_xlat3.xzx, u_xlat5.xyz, u_xlat4.xyz);
    u_xlat9.xyz = fma(u_xlat3.xyz, Globals._Wind.www, u_xlat9.xyz);
    u_xlat9.xyz = fma(input.TEXCOORD1.xxx, Globals._Wind.xyz, u_xlat9.xyz);
    u_xlat22 = dot(Globals._SquashPlaneNormal.xyz, u_xlat9.xyz);
    u_xlat22 = u_xlat22 + Globals._SquashPlaneNormal.w;
    u_xlat3.xyz = fma((-float3(u_xlat22)), Globals._SquashPlaneNormal.xyz, u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz + (-u_xlat3.xyz);
    u_xlat9.xyz = fma(float3(Globals._SquashAmount), u_xlat9.xyz, u_xlat3.xyz);
    u_xlat3 = u_xlat9.yyyy * Globals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat3 = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[0], u_xlat9.xxxx, u_xlat3);
    u_xlat3 = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[2], u_xlat9.zzzz, u_xlat3);
    u_xlat3 = u_xlat3 + Globals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat4 = u_xlat3.yyyy * Globals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat4 = fma(Globals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat3.xxxx, u_xlat4);
    u_xlat4 = fma(Globals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat3.zzzz, u_xlat4);
    output.mtl_Position = fma(Globals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat3.wwww, u_xlat4);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, Globals._MainTex_ST.xy, Globals._MainTex_ST.zw);
    output.TEXCOORD5.xy = float2(0.0, 0.0);
    output.TEXCOORD1.w = u_xlat3.x;
    u_xlat21 = dot(u_xlat0, u_xlat0);
    u_xlat21 = rsqrt(u_xlat21);
    u_xlat0.xyz = float3(u_xlat21) * u_xlat0.xyz;
    u_xlat0.w = -1.0;
    u_xlat0 = u_xlat0 + (-input.TANGENT0);
    u_xlat0 = fma(u_xlat2.xxxx, u_xlat0, input.TANGENT0);
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat22 = rsqrt(u_xlat22);
    u_xlat0.xyz = u_xlat0.xyz * float3(u_xlat22);
    u_xlat21 = u_xlat0.w * Globals.unity_WorldTransformParams.w;
    u_xlat2.xyz = u_xlat0.yyy * Globals.hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat2.xyz = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[0].yzx, u_xlat0.xxx, u_xlat2.xyz);
    u_xlat0.xyz = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[2].yzx, u_xlat0.zzz, u_xlat2.xyz);
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat22 = rsqrt(u_xlat22);
    u_xlat0.xyz = u_xlat0.xyz * float3(u_xlat22);
    output.TEXCOORD1.x = u_xlat0.z;
    u_xlat22 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat22 = rsqrt(u_xlat22);
    u_xlat1.xyz = float3(u_xlat22) * u_xlat1.xyz;
    u_xlat2.x = dot(u_xlat1.xyz, Globals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(u_xlat1.xyz, Globals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(u_xlat1.xyz, Globals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = rsqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.zxy;
    u_xlat2.xyz = fma(u_xlat1.yzx, u_xlat0.yzx, (-u_xlat2.xyz));
    u_xlat2.xyz = float3(u_xlat21) * u_xlat2.xyz;
    output.TEXCOORD1.y = u_xlat2.x;
    output.TEXCOORD1.z = u_xlat1.x;
    output.TEXCOORD2.w = u_xlat3.y;
    output.TEXCOORD3.w = u_xlat3.z;
    output.TEXCOORD2.x = u_xlat0.x;
    output.TEXCOORD3.x = u_xlat0.y;
    output.TEXCOORD2.y = u_xlat2.y;
    output.TEXCOORD3.y = u_xlat2.z;
    output.TEXCOORD2.z = u_xlat1.y;
    output.TEXCOORD3.z = u_xlat1.z;
    output.COLOR0.xyz = Globals._TreeInstanceColor.xyz * Globals._Color.xyz;
    output.COLOR0.w = input.COLOR0.w;
    u_xlat0.x = u_xlat1.y * u_xlat1.y;
    u_xlat0.x = fma(u_xlat1.x, u_xlat1.x, (-u_xlat0.x));
    u_xlat2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat3.x = dot(Globals.unity_SHBr, u_xlat2);
    u_xlat3.y = dot(Globals.unity_SHBg, u_xlat2);
    u_xlat3.z = dot(Globals.unity_SHBb, u_xlat2);
    u_xlat0.xyz = fma(Globals.unity_SHC.xyz, u_xlat0.xxx, u_xlat3.xyz);
    u_xlat1.w = 1.0;
    u_xlat2.x = dot(Globals.unity_SHAr, u_xlat1);
    u_xlat2.y = dot(Globals.unity_SHAg, u_xlat1);
    u_xlat2.z = dot(Globals.unity_SHAb, u_xlat1);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat0.xyz = max(u_xlat0.xyz, float3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * float3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = fma(u_xlat0.xyz, float3(1.05499995, 1.05499995, 1.05499995), float3(-0.0549999997, -0.0549999997, -0.0549999997));
    output.TEXCOORD4.xyz = max(u_xlat0.xyz, float3(0.0, 0.0, 0.0));
    return output;
}


-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 1
Set 2D Texture "_TranslucencyMap" to slot 1 sampler slot 3
Set 2D Texture "_BumpSpecMap" to slot 2
Set 3D Texture "unity_ProbeVolumeSH" to slot 3 sampler slot 0

Constant Buffer "Globals" (220 bytes) on slot 0 {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 64
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_OcclusionMaskSelector at 32
  Vector4 unity_ProbeVolumeParams at 48
  Vector3 unity_ProbeVolumeSizeInv at 128
  Vector3 unity_ProbeVolumeMin at 144
  Vector4 _LightColor0 at 160
  Vector4 _Color at 176
  Vector3 _TranslucencyColor at 192
  Float _TranslucencyViewDependency at 208
  Float _ShadowStrength at 212
  Float _Cutoff at 216
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

#ifndef XLT_REMAP_O
#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
#endif
constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
struct Globals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 _WorldSpaceLightPos0;
    float4 unity_OcclusionMaskSelector;
    float4 unity_ProbeVolumeParams;
    float4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
    float3 unity_ProbeVolumeSizeInv;
    float3 unity_ProbeVolumeMin;
    float4 _LightColor0;
    float4 _Color;
    float3 _TranslucencyColor;
    float _TranslucencyViewDependency;
    float _ShadowStrength;
    float _Cutoff;
};

struct Mtl_FragmentIn
{
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
    float4 COLOR0 [[ user(COLOR0) ]] ;
    float3 TEXCOORD4 [[ user(TEXCOORD4) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant Globals_Type& Globals [[ buffer(0) ]],
    sampler samplerunity_ProbeVolumeSH [[ sampler (0) ]],
    sampler sampler_MainTex [[ sampler (1) ]],
    sampler sampler_BumpSpecMap [[ sampler (2) ]],
    sampler sampler_TranslucencyMap [[ sampler (3) ]],
    texture2d<float, access::sample > _MainTex [[ texture (0) ]] ,
    texture2d<float, access::sample > _TranslucencyMap [[ texture (1) ]] ,
    texture2d<float, access::sample > _BumpSpecMap [[ texture (2) ]] ,
    texture3d<float, access::sample > unity_ProbeVolumeSH [[ texture (3) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float4 u_xlat0;
    float3 u_xlat1;
    float3 u_xlat2;
    float4 u_xlat3;
    float3 u_xlat4;
    float2 u_xlat5;
    float3 u_xlat6;
    float4 u_xlat7;
    float3 u_xlat8;
    float3 u_xlat9;
    float3 u_xlat13;
    float u_xlat16;
    float u_xlat24;
    float u_xlat25;
    float u_xlat26;
    bool u_xlatb26;
    u_xlat8.x = input.TEXCOORD1.w;
    u_xlat8.y = input.TEXCOORD2.w;
    u_xlat8.z = input.TEXCOORD3.w;
    u_xlat1.xyz = (-u_xlat8.xyz) + Globals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = rsqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat3 = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy);
    u_xlat4.xyz = u_xlat3.xyz * input.COLOR0.xyz;
    u_xlat4.xyz = u_xlat4.xyz * input.COLOR0.www;
    u_xlat5.xy = _TranslucencyMap.sample(sampler_TranslucencyMap, input.TEXCOORD0.xy).zw;
    u_xlat25 = u_xlat5.y * Globals._Color.x;
    u_xlat13.xyz = _BumpSpecMap.sample(sampler_BumpSpecMap, input.TEXCOORD0.xy).xyw;
    u_xlat6.xy = fma(u_xlat13.zy, float2(2.0, 2.0), float2(-1.0, -1.0));
    u_xlat26 = dot(u_xlat6.xy, u_xlat6.xy);
    u_xlat26 = min(u_xlat26, 1.0);
    u_xlat26 = (-u_xlat26) + 1.0;
    u_xlat6.z = sqrt(u_xlat26);
    u_xlat26 = u_xlat3.w + (-Globals._Cutoff);
    u_xlatb26 = u_xlat26<0.0;
    if((int(u_xlatb26) * int(0xffffffffu))!=0){discard_fragment();}
    u_xlatb26 = Globals.unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb26){
        u_xlatb26 = Globals.unity_ProbeVolumeParams.y==1.0;
        u_xlat7.xyz = input.TEXCOORD2.www * Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat7.xyz = fma(Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz, input.TEXCOORD1.www, u_xlat7.xyz);
        u_xlat7.xyz = fma(Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz, input.TEXCOORD3.www, u_xlat7.xyz);
        u_xlat7.xyz = u_xlat7.xyz + Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat8.xyz = (bool(u_xlatb26)) ? u_xlat7.xyz : u_xlat8.xyz;
        u_xlat8.xyz = u_xlat8.xyz + (-Globals.unity_ProbeVolumeMin.xyzx.xyz);
        u_xlat7.yzw = u_xlat8.xyz * Globals.unity_ProbeVolumeSizeInv.xyzx.xyz;
        u_xlat8.x = fma(u_xlat7.y, 0.25, 0.75);
        u_xlat16 = fma(Globals.unity_ProbeVolumeParams.z, 0.5, 0.75);
        u_xlat7.x = max(u_xlat16, u_xlat8.x);
        u_xlat7 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat7.xzw);
    } else {
        u_xlat7.x = float(1.0);
        u_xlat7.y = float(1.0);
        u_xlat7.z = float(1.0);
        u_xlat7.w = float(1.0);
    }
    u_xlat8.x = dot(u_xlat7, Globals.unity_OcclusionMaskSelector);
    u_xlat8.x = clamp(u_xlat8.x, 0.0f, 1.0f);
    u_xlat7.x = dot(input.TEXCOORD1.xyz, u_xlat6.xyz);
    u_xlat7.y = dot(input.TEXCOORD2.xyz, u_xlat6.xyz);
    u_xlat7.z = dot(input.TEXCOORD3.xyz, u_xlat6.xyz);
    u_xlat16 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16 = rsqrt(u_xlat16);
    u_xlat6.xyz = float3(u_xlat16) * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat4.xyz * input.TEXCOORD4.xyz;
    u_xlat0.xzw = fma(u_xlat1.xyz, u_xlat0.xxx, Globals._WorldSpaceLightPos0.xyz);
    u_xlat1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat1.x = rsqrt(u_xlat1.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat1.xxx;
    u_xlat1.x = dot(u_xlat6.xyz, Globals._WorldSpaceLightPos0.xyz);
    u_xlat0.x = dot(u_xlat6.xyz, u_xlat0.xzw);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16 = u_xlat13.x * 128.0;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * u_xlat16;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat25 * u_xlat0.x;
    u_xlat16 = dot(u_xlat2.xyz, (-Globals._WorldSpaceLightPos0.xyz));
    u_xlat16 = clamp(u_xlat16, 0.0f, 1.0f);
    u_xlat24 = (-u_xlat1.x);
    u_xlat24 = clamp(u_xlat24, 0.0f, 1.0f);
    u_xlat16 = (-u_xlat24) + u_xlat16;
    u_xlat16 = fma(Globals._TranslucencyViewDependency, u_xlat16, u_xlat24);
    u_xlat16 = u_xlat5.x * u_xlat16;
    u_xlat9.xyz = float3(u_xlat16) * Globals._TranslucencyColor.xyzx.xyz;
    u_xlat16 = fma(u_xlat1.x, 0.600000024, 0.400000006);
    u_xlat16 = max(u_xlat16, 0.0);
    u_xlat1.xyz = fma(u_xlat9.xyz, float3(2.0, 2.0, 2.0), float3(u_xlat16));
    u_xlat1.xyz = u_xlat1.xyz * u_xlat4.xyz;
    u_xlat0.xzw = fma(u_xlat1.xyz, Globals._LightColor0.xyz, u_xlat0.xxx);
    u_xlat8.x = u_xlat8.x + -1.0;
    u_xlat8.x = fma(Globals._ShadowStrength, u_xlat8.x, 1.0);
    u_xlat3.xyz = u_xlat8.xxx * u_xlat0.xzw;
    u_xlat7.w = 0.0;
    output.SV_Target0 = u_xlat3 + u_xlat7;
    return output;
}


//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL SHADOWS_SCREEN 
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "TexCoord3"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"
Uses vertex data channel "TexCoord0"
Uses vertex data channel "Normal"

Constant Buffer "Globals" (528 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 144
  Matrix4x4 unity_WorldToObject at 208
  Matrix4x4 unity_MatrixInvV at 288
  Matrix4x4 unity_MatrixVP at 352
  Vector4 _Time at 0
  Vector4 _ProjectionParams at 16
  Vector4 unity_SHAr at 32
  Vector4 unity_SHAg at 48
  Vector4 unity_SHAb at 64
  Vector4 unity_SHBr at 80
  Vector4 unity_SHBg at 96
  Vector4 unity_SHBb at 112
  Vector4 unity_SHC at 128
  Vector4 unity_WorldTransformParams at 272
  Vector4 _TreeInstanceColor at 416
  Vector4 _TreeInstanceScale at 432
  Vector4 _SquashPlaneNormal at 448
  Float _SquashAmount at 464
  Vector4 _Wind at 480
  Vector4 _Color at 496
  Vector4 _MainTex_ST at 512
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

struct Globals_Type
{
    float4 _Time;
    float4 _ProjectionParams;
    float4 unity_SHAr;
    float4 unity_SHAg;
    float4 unity_SHAb;
    float4 unity_SHBr;
    float4 unity_SHBg;
    float4 unity_SHBb;
    float4 unity_SHC;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 unity_WorldTransformParams;
    float4 hlslcc_mtx4x4unity_MatrixInvV[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _TreeInstanceColor;
    float4 _TreeInstanceScale;
    float4 _SquashPlaneNormal;
    float _SquashAmount;
    float4 _Wind;
    float4 _Color;
    float4 _MainTex_ST;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float4 TANGENT0 [[ attribute(1) ]] ;
    float3 NORMAL0 [[ attribute(2) ]] ;
    float4 TEXCOORD0 [[ attribute(3) ]] ;
    float4 TEXCOORD1 [[ attribute(4) ]] ;
    float4 COLOR0 [[ attribute(5) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float4 COLOR0 [[ user(COLOR0) ]];
    float3 TEXCOORD4 [[ user(TEXCOORD4) ]];
    float4 TEXCOORD5 [[ user(TEXCOORD5) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant Globals_Type& Globals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    float4 u_xlat2;
    float4 u_xlat3;
    float4 u_xlat4;
    float3 u_xlat5;
    float4 u_xlat6;
    float3 u_xlat9;
    float u_xlat17;
    float u_xlat21;
    float u_xlat22;
    u_xlat0 = Globals.hlslcc_mtx4x4unity_WorldToObject[1] * Globals.hlslcc_mtx4x4unity_MatrixInvV[1].yyyy;
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_WorldToObject[0], Globals.hlslcc_mtx4x4unity_MatrixInvV[1].xxxx, u_xlat0);
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_WorldToObject[2], Globals.hlslcc_mtx4x4unity_MatrixInvV[1].zzzz, u_xlat0);
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_WorldToObject[3], Globals.hlslcc_mtx4x4unity_MatrixInvV[1].wwww, u_xlat0);
    u_xlat1 = u_xlat0 * input.NORMAL0.yyyy;
    u_xlat0 = u_xlat0 * input.TANGENT0.yyyy;
    u_xlat2 = Globals.hlslcc_mtx4x4unity_WorldToObject[1] * Globals.hlslcc_mtx4x4unity_MatrixInvV[0].yyyy;
    u_xlat2 = fma(Globals.hlslcc_mtx4x4unity_WorldToObject[0], Globals.hlslcc_mtx4x4unity_MatrixInvV[0].xxxx, u_xlat2);
    u_xlat2 = fma(Globals.hlslcc_mtx4x4unity_WorldToObject[2], Globals.hlslcc_mtx4x4unity_MatrixInvV[0].zzzz, u_xlat2);
    u_xlat2 = fma(Globals.hlslcc_mtx4x4unity_WorldToObject[3], Globals.hlslcc_mtx4x4unity_MatrixInvV[0].wwww, u_xlat2);
    u_xlat1 = fma(input.NORMAL0.xxxx, u_xlat2, u_xlat1);
    u_xlat0 = fma(input.TANGENT0.xxxx, u_xlat2, u_xlat0);
    u_xlat2.x = -abs(input.TANGENT0.w) + 1.0;
    u_xlat9.xyz = fma(u_xlat1.xyz, u_xlat2.xxx, input.POSITION0.xyz);
    u_xlat9.xyz = u_xlat9.xyz * Globals._TreeInstanceScale.xyz;
    u_xlat3.x = dot(Globals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, float3(1.0, 1.0, 1.0));
    u_xlat3.y = u_xlat3.x + input.COLOR0.x;
    u_xlat17 = u_xlat3.y + input.COLOR0.y;
    u_xlat3.x = dot(u_xlat9.xyz, float3(u_xlat17));
    u_xlat3 = u_xlat3.xxyy + Globals._Time.yyyy;
    u_xlat3 = u_xlat3 * float4(1.97500002, 0.792999983, 0.375, 0.193000004);
    u_xlat3 = fract(u_xlat3);
    u_xlat3 = fma(u_xlat3, float4(2.0, 2.0, 2.0, 2.0), float4(-0.5, -0.5, -0.5, -0.5));
    u_xlat3 = fract(u_xlat3);
    u_xlat3 = fma(u_xlat3, float4(2.0, 2.0, 2.0, 2.0), float4(-1.0, -1.0, -1.0, -1.0));
    u_xlat4 = abs(u_xlat3) * abs(u_xlat3);
    u_xlat3 = fma(-abs(u_xlat3), float4(2.0, 2.0, 2.0, 2.0), float4(3.0, 3.0, 3.0, 3.0));
    u_xlat3 = u_xlat3 * u_xlat4;
    u_xlat3.xy = u_xlat3.yw + u_xlat3.xz;
    u_xlat4.xyz = u_xlat3.yyy * Globals._Wind.xyz;
    u_xlat4.xyz = u_xlat4.xyz * input.TEXCOORD1.yyy;
    u_xlat5.y = u_xlat3.y * input.TEXCOORD1.y;
    u_xlat6 = Globals.hlslcc_mtx4x4unity_WorldToObject[1] * Globals.hlslcc_mtx4x4unity_MatrixInvV[2].yyyy;
    u_xlat6 = fma(Globals.hlslcc_mtx4x4unity_WorldToObject[0], Globals.hlslcc_mtx4x4unity_MatrixInvV[2].xxxx, u_xlat6);
    u_xlat6 = fma(Globals.hlslcc_mtx4x4unity_WorldToObject[2], Globals.hlslcc_mtx4x4unity_MatrixInvV[2].zzzz, u_xlat6);
    u_xlat6 = fma(Globals.hlslcc_mtx4x4unity_WorldToObject[3], Globals.hlslcc_mtx4x4unity_MatrixInvV[2].wwww, u_xlat6);
    u_xlat1 = fma(input.NORMAL0.zzzz, u_xlat6, u_xlat1);
    u_xlat0 = fma(input.TANGENT0.zzzz, u_xlat6, u_xlat0);
    u_xlat22 = dot(u_xlat1, u_xlat1);
    u_xlat22 = rsqrt(u_xlat22);
    u_xlat1.xyz = fma(u_xlat1.xyz, float3(u_xlat22), (-input.NORMAL0.xyz));
    u_xlat1.xyz = fma(u_xlat2.xxx, u_xlat1.xyz, input.NORMAL0.xyz);
    u_xlat22 = input.COLOR0.y * 0.100000001;
    u_xlat5.xz = u_xlat1.xz * float2(u_xlat22);
    u_xlat3.z = 0.300000012;
    u_xlat3.xyz = fma(u_xlat3.xzx, u_xlat5.xyz, u_xlat4.xyz);
    u_xlat9.xyz = fma(u_xlat3.xyz, Globals._Wind.www, u_xlat9.xyz);
    u_xlat9.xyz = fma(input.TEXCOORD1.xxx, Globals._Wind.xyz, u_xlat9.xyz);
    u_xlat22 = dot(Globals._SquashPlaneNormal.xyz, u_xlat9.xyz);
    u_xlat22 = u_xlat22 + Globals._SquashPlaneNormal.w;
    u_xlat3.xyz = fma((-float3(u_xlat22)), Globals._SquashPlaneNormal.xyz, u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz + (-u_xlat3.xyz);
    u_xlat9.xyz = fma(float3(Globals._SquashAmount), u_xlat9.xyz, u_xlat3.xyz);
    u_xlat3 = u_xlat9.yyyy * Globals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat3 = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[0], u_xlat9.xxxx, u_xlat3);
    u_xlat3 = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[2], u_xlat9.zzzz, u_xlat3);
    u_xlat3 = u_xlat3 + Globals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat4 = u_xlat3.yyyy * Globals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat4 = fma(Globals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat3.xxxx, u_xlat4);
    u_xlat4 = fma(Globals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat3.zzzz, u_xlat4);
    u_xlat4 = fma(Globals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat3.wwww, u_xlat4);
    output.mtl_Position = u_xlat4;
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, Globals._MainTex_ST.xy, Globals._MainTex_ST.zw);
    output.TEXCOORD1.w = u_xlat3.x;
    u_xlat21 = dot(u_xlat0, u_xlat0);
    u_xlat21 = rsqrt(u_xlat21);
    u_xlat0.xyz = float3(u_xlat21) * u_xlat0.xyz;
    u_xlat0.w = -1.0;
    u_xlat0 = u_xlat0 + (-input.TANGENT0);
    u_xlat0 = fma(u_xlat2.xxxx, u_xlat0, input.TANGENT0);
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat22 = rsqrt(u_xlat22);
    u_xlat0.xyz = u_xlat0.xyz * float3(u_xlat22);
    u_xlat21 = u_xlat0.w * Globals.unity_WorldTransformParams.w;
    u_xlat2.xyz = u_xlat0.yyy * Globals.hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat2.xyz = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[0].yzx, u_xlat0.xxx, u_xlat2.xyz);
    u_xlat0.xyz = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[2].yzx, u_xlat0.zzz, u_xlat2.xyz);
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat22 = rsqrt(u_xlat22);
    u_xlat0.xyz = u_xlat0.xyz * float3(u_xlat22);
    output.TEXCOORD1.x = u_xlat0.z;
    u_xlat22 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat22 = rsqrt(u_xlat22);
    u_xlat1.xyz = float3(u_xlat22) * u_xlat1.xyz;
    u_xlat2.x = dot(u_xlat1.xyz, Globals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(u_xlat1.xyz, Globals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(u_xlat1.xyz, Globals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = rsqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.zxy;
    u_xlat2.xyz = fma(u_xlat1.yzx, u_xlat0.yzx, (-u_xlat2.xyz));
    u_xlat2.xyz = float3(u_xlat21) * u_xlat2.xyz;
    output.TEXCOORD1.y = u_xlat2.x;
    output.TEXCOORD1.z = u_xlat1.x;
    output.TEXCOORD2.w = u_xlat3.y;
    output.TEXCOORD3.w = u_xlat3.z;
    output.TEXCOORD2.x = u_xlat0.x;
    output.TEXCOORD3.x = u_xlat0.y;
    output.TEXCOORD2.y = u_xlat2.y;
    output.TEXCOORD3.y = u_xlat2.z;
    output.TEXCOORD2.z = u_xlat1.y;
    output.TEXCOORD3.z = u_xlat1.z;
    output.COLOR0.xyz = Globals._TreeInstanceColor.xyz * Globals._Color.xyz;
    output.COLOR0.w = input.COLOR0.w;
    u_xlat0.x = u_xlat1.y * u_xlat1.y;
    u_xlat0.x = fma(u_xlat1.x, u_xlat1.x, (-u_xlat0.x));
    u_xlat2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat3.x = dot(Globals.unity_SHBr, u_xlat2);
    u_xlat3.y = dot(Globals.unity_SHBg, u_xlat2);
    u_xlat3.z = dot(Globals.unity_SHBb, u_xlat2);
    u_xlat0.xyz = fma(Globals.unity_SHC.xyz, u_xlat0.xxx, u_xlat3.xyz);
    u_xlat1.w = 1.0;
    u_xlat2.x = dot(Globals.unity_SHAr, u_xlat1);
    u_xlat2.y = dot(Globals.unity_SHAg, u_xlat1);
    u_xlat2.z = dot(Globals.unity_SHAb, u_xlat1);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat0.xyz = max(u_xlat0.xyz, float3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * float3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = fma(u_xlat0.xyz, float3(1.05499995, 1.05499995, 1.05499995), float3(-0.0549999997, -0.0549999997, -0.0549999997));
    output.TEXCOORD4.xyz = max(u_xlat0.xyz, float3(0.0, 0.0, 0.0));
    u_xlat0.x = u_xlat4.y * Globals._ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat4.xw * float2(0.5, 0.5);
    output.TEXCOORD5.zw = u_xlat4.zw;
    output.TEXCOORD5.xy = u_xlat0.zz + u_xlat0.xw;
    return output;
}


-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 2
Set 2D Texture "_TranslucencyMap" to slot 1 sampler slot 4
Set 2D Texture "_BumpSpecMap" to slot 2 sampler slot 3
Set 2D Texture "_ShadowMapTexture" to slot 3 sampler slot 1
Set 3D Texture "unity_ProbeVolumeSH" to slot 4 sampler slot 0

Constant Buffer "Globals" (316 bytes) on slot 0 {
  Matrix4x4 unity_MatrixV at 80
  Matrix4x4 unity_ProbeVolumeWorldToObject at 160
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_OcclusionMaskSelector at 32
  Vector4 _LightShadowData at 48
  Vector4 unity_ShadowFadeCenterAndType at 64
  Vector4 unity_ProbeVolumeParams at 144
  Vector3 unity_ProbeVolumeSizeInv at 224
  Vector3 unity_ProbeVolumeMin at 240
  Vector4 _LightColor0 at 256
  Vector4 _Color at 272
  Vector3 _TranslucencyColor at 288
  Float _TranslucencyViewDependency at 304
  Float _ShadowStrength at 308
  Float _Cutoff at 312
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

#ifndef XLT_REMAP_O
#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
#endif
constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
struct Globals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 _WorldSpaceLightPos0;
    float4 unity_OcclusionMaskSelector;
    float4 _LightShadowData;
    float4 unity_ShadowFadeCenterAndType;
    float4 hlslcc_mtx4x4unity_MatrixV[4];
    float4 unity_ProbeVolumeParams;
    float4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
    float3 unity_ProbeVolumeSizeInv;
    float3 unity_ProbeVolumeMin;
    float4 _LightColor0;
    float4 _Color;
    float3 _TranslucencyColor;
    float _TranslucencyViewDependency;
    float _ShadowStrength;
    float _Cutoff;
};

struct Mtl_FragmentIn
{
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
    float4 COLOR0 [[ user(COLOR0) ]] ;
    float3 TEXCOORD4 [[ user(TEXCOORD4) ]] ;
    float4 TEXCOORD5 [[ user(TEXCOORD5) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant Globals_Type& Globals [[ buffer(0) ]],
    sampler samplerunity_ProbeVolumeSH [[ sampler (0) ]],
    sampler sampler_ShadowMapTexture [[ sampler (1) ]],
    sampler sampler_MainTex [[ sampler (2) ]],
    sampler sampler_BumpSpecMap [[ sampler (3) ]],
    sampler sampler_TranslucencyMap [[ sampler (4) ]],
    texture2d<float, access::sample > _MainTex [[ texture (0) ]] ,
    texture2d<float, access::sample > _TranslucencyMap [[ texture (1) ]] ,
    texture2d<float, access::sample > _BumpSpecMap [[ texture (2) ]] ,
    texture2d<float, access::sample > _ShadowMapTexture [[ texture (3) ]] ,
    texture3d<float, access::sample > unity_ProbeVolumeSH [[ texture (4) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float4 u_xlat0;
    float3 u_xlat1;
    float3 u_xlat2;
    float4 u_xlat3;
    float3 u_xlat4;
    float2 u_xlat5;
    float3 u_xlat6;
    float4 u_xlat7;
    float3 u_xlat8;
    float3 u_xlat9;
    float3 u_xlat13;
    float2 u_xlat16;
    bool u_xlatb21;
    float u_xlat24;
    float u_xlat25;
    float u_xlat26;
    bool u_xlatb26;
    float u_xlat28;
    bool u_xlatb28;
    u_xlat8.x = input.TEXCOORD1.w;
    u_xlat8.y = input.TEXCOORD2.w;
    u_xlat8.z = input.TEXCOORD3.w;
    u_xlat1.xyz = (-u_xlat8.xyz) + Globals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = rsqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat3 = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy);
    u_xlat4.xyz = u_xlat3.xyz * input.COLOR0.xyz;
    u_xlat4.xyz = u_xlat4.xyz * input.COLOR0.www;
    u_xlat5.xy = _TranslucencyMap.sample(sampler_TranslucencyMap, input.TEXCOORD0.xy).zw;
    u_xlat25 = u_xlat5.y * Globals._Color.x;
    u_xlat13.xyz = _BumpSpecMap.sample(sampler_BumpSpecMap, input.TEXCOORD0.xy).xyw;
    u_xlat6.xy = fma(u_xlat13.zy, float2(2.0, 2.0), float2(-1.0, -1.0));
    u_xlat26 = dot(u_xlat6.xy, u_xlat6.xy);
    u_xlat26 = min(u_xlat26, 1.0);
    u_xlat26 = (-u_xlat26) + 1.0;
    u_xlat6.z = sqrt(u_xlat26);
    u_xlat26 = u_xlat3.w + (-Globals._Cutoff);
    u_xlatb26 = u_xlat26<0.0;
    if((int(u_xlatb26) * int(0xffffffffu))!=0){discard_fragment();}
    u_xlat7.x = Globals.hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat7.y = Globals.hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat7.z = Globals.hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat26 = dot(u_xlat1.xyz, u_xlat7.xyz);
    u_xlat7.xyz = u_xlat8.xyz + (-Globals.unity_ShadowFadeCenterAndType.xyz);
    u_xlat28 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat28 = sqrt(u_xlat28);
    u_xlat28 = (-u_xlat26) + u_xlat28;
    u_xlat26 = fma(Globals.unity_ShadowFadeCenterAndType.w, u_xlat28, u_xlat26);
    u_xlat26 = fma(u_xlat26, Globals._LightShadowData.z, Globals._LightShadowData.w);
    u_xlat26 = clamp(u_xlat26, 0.0f, 1.0f);
    u_xlatb28 = Globals.unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb28){
        u_xlatb21 = Globals.unity_ProbeVolumeParams.y==1.0;
        u_xlat7.xyz = input.TEXCOORD2.www * Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat7.xyz = fma(Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz, input.TEXCOORD1.www, u_xlat7.xyz);
        u_xlat7.xyz = fma(Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz, input.TEXCOORD3.www, u_xlat7.xyz);
        u_xlat7.xyz = u_xlat7.xyz + Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat8.xyz = (bool(u_xlatb21)) ? u_xlat7.xyz : u_xlat8.xyz;
        u_xlat8.xyz = u_xlat8.xyz + (-Globals.unity_ProbeVolumeMin.xyzx.xyz);
        u_xlat7.yzw = u_xlat8.xyz * Globals.unity_ProbeVolumeSizeInv.xyzx.xyz;
        u_xlat8.x = fma(u_xlat7.y, 0.25, 0.75);
        u_xlat16.x = fma(Globals.unity_ProbeVolumeParams.z, 0.5, 0.75);
        u_xlat7.x = max(u_xlat16.x, u_xlat8.x);
        u_xlat7 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat7.xzw);
    } else {
        u_xlat7.x = float(1.0);
        u_xlat7.y = float(1.0);
        u_xlat7.z = float(1.0);
        u_xlat7.w = float(1.0);
    }
    u_xlat8.x = dot(u_xlat7, Globals.unity_OcclusionMaskSelector);
    u_xlat8.x = clamp(u_xlat8.x, 0.0f, 1.0f);
    u_xlat16.xy = input.TEXCOORD5.xy / input.TEXCOORD5.ww;
    u_xlat16.x = _ShadowMapTexture.sample(sampler_ShadowMapTexture, u_xlat16.xy).x;
    u_xlat16.x = u_xlat26 + u_xlat16.x;
    u_xlat16.x = clamp(u_xlat16.x, 0.0f, 1.0f);
    u_xlat8.x = min(u_xlat16.x, u_xlat8.x);
    u_xlat8.x = (u_xlatb28) ? u_xlat8.x : u_xlat16.x;
    u_xlat7.x = dot(input.TEXCOORD1.xyz, u_xlat6.xyz);
    u_xlat7.y = dot(input.TEXCOORD2.xyz, u_xlat6.xyz);
    u_xlat7.z = dot(input.TEXCOORD3.xyz, u_xlat6.xyz);
    u_xlat16.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16.x = rsqrt(u_xlat16.x);
    u_xlat6.xyz = u_xlat16.xxx * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat4.xyz * input.TEXCOORD4.xyz;
    u_xlat0.xzw = fma(u_xlat1.xyz, u_xlat0.xxx, Globals._WorldSpaceLightPos0.xyz);
    u_xlat1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat1.x = rsqrt(u_xlat1.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat1.xxx;
    u_xlat1.x = dot(u_xlat6.xyz, Globals._WorldSpaceLightPos0.xyz);
    u_xlat0.x = dot(u_xlat6.xyz, u_xlat0.xzw);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16.x = u_xlat13.x * 128.0;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * u_xlat16.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat25 * u_xlat0.x;
    u_xlat16.x = dot(u_xlat2.xyz, (-Globals._WorldSpaceLightPos0.xyz));
    u_xlat16.x = clamp(u_xlat16.x, 0.0f, 1.0f);
    u_xlat24 = (-u_xlat1.x);
    u_xlat24 = clamp(u_xlat24, 0.0f, 1.0f);
    u_xlat16.x = (-u_xlat24) + u_xlat16.x;
    u_xlat16.x = fma(Globals._TranslucencyViewDependency, u_xlat16.x, u_xlat24);
    u_xlat16.x = u_xlat5.x * u_xlat16.x;
    u_xlat9.xyz = u_xlat16.xxx * Globals._TranslucencyColor.xyzx.xyz;
    u_xlat16.x = fma(u_xlat1.x, 0.600000024, 0.400000006);
    u_xlat16.x = max(u_xlat16.x, 0.0);
    u_xlat1.xyz = fma(u_xlat9.xyz, float3(2.0, 2.0, 2.0), u_xlat16.xxx);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat4.xyz;
    u_xlat0.xzw = fma(u_xlat1.xyz, Globals._LightColor0.xyz, u_xlat0.xxx);
    u_xlat8.x = u_xlat8.x + -1.0;
    u_xlat8.x = fma(Globals._ShadowStrength, u_xlat8.x, 1.0);
    u_xlat3.xyz = u_xlat8.xxx * u_xlat0.xzw;
    u_xlat7.w = 0.0;
    output.SV_Target0 = u_xlat3 + u_xlat7;
    return output;
}


//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL VERTEXLIGHT_ON 
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "TexCoord3"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"
Uses vertex data channel "TexCoord0"
Uses vertex data channel "Normal"

Constant Buffer "Globals" (704 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 320
  Matrix4x4 unity_WorldToObject at 384
  Matrix4x4 unity_MatrixInvV at 464
  Matrix4x4 unity_MatrixVP at 528
  Vector4 _Time at 0
  Vector4 unity_4LightPosX0 at 16
  Vector4 unity_4LightPosY0 at 32
  Vector4 unity_4LightPosZ0 at 48
  Vector4 unity_4LightAtten0 at 64
  Vector4 unity_LightColor[8] at 80
  Vector4 unity_SHAr at 208
  Vector4 unity_SHAg at 224
  Vector4 unity_SHAb at 240
  Vector4 unity_SHBr at 256
  Vector4 unity_SHBg at 272
  Vector4 unity_SHBb at 288
  Vector4 unity_SHC at 304
  Vector4 unity_WorldTransformParams at 448
  Vector4 _TreeInstanceColor at 592
  Vector4 _TreeInstanceScale at 608
  Vector4 _SquashPlaneNormal at 624
  Float _SquashAmount at 640
  Vector4 _Wind at 656
  Vector4 _Color at 672
  Vector4 _MainTex_ST at 688
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

struct Globals_Type
{
    float4 _Time;
    float4 unity_4LightPosX0;
    float4 unity_4LightPosY0;
    float4 unity_4LightPosZ0;
    float4 unity_4LightAtten0;
    float4 unity_LightColor[8];
    float4 unity_SHAr;
    float4 unity_SHAg;
    float4 unity_SHAb;
    float4 unity_SHBr;
    float4 unity_SHBg;
    float4 unity_SHBb;
    float4 unity_SHC;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 unity_WorldTransformParams;
    float4 hlslcc_mtx4x4unity_MatrixInvV[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _TreeInstanceColor;
    float4 _TreeInstanceScale;
    float4 _SquashPlaneNormal;
    float _SquashAmount;
    float4 _Wind;
    float4 _Color;
    float4 _MainTex_ST;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float4 TANGENT0 [[ attribute(1) ]] ;
    float3 NORMAL0 [[ attribute(2) ]] ;
    float4 TEXCOORD0 [[ attribute(3) ]] ;
    float4 TEXCOORD1 [[ attribute(4) ]] ;
    float4 COLOR0 [[ attribute(5) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float2 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float4 COLOR0 [[ user(COLOR0) ]];
    float3 TEXCOORD4 [[ user(TEXCOORD4) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant Globals_Type& Globals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    float4 u_xlat2;
    float4 u_xlat3;
    float4 u_xlat4;
    float4 u_xlat5;
    float4 u_xlat6;
    float3 u_xlat9;
    float u_xlat17;
    float u_xlat21;
    float u_xlat22;
    u_xlat0 = Globals.hlslcc_mtx4x4unity_WorldToObject[1] * Globals.hlslcc_mtx4x4unity_MatrixInvV[1].yyyy;
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_WorldToObject[0], Globals.hlslcc_mtx4x4unity_MatrixInvV[1].xxxx, u_xlat0);
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_WorldToObject[2], Globals.hlslcc_mtx4x4unity_MatrixInvV[1].zzzz, u_xlat0);
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_WorldToObject[3], Globals.hlslcc_mtx4x4unity_MatrixInvV[1].wwww, u_xlat0);
    u_xlat1 = u_xlat0 * input.NORMAL0.yyyy;
    u_xlat0 = u_xlat0 * input.TANGENT0.yyyy;
    u_xlat2 = Globals.hlslcc_mtx4x4unity_WorldToObject[1] * Globals.hlslcc_mtx4x4unity_MatrixInvV[0].yyyy;
    u_xlat2 = fma(Globals.hlslcc_mtx4x4unity_WorldToObject[0], Globals.hlslcc_mtx4x4unity_MatrixInvV[0].xxxx, u_xlat2);
    u_xlat2 = fma(Globals.hlslcc_mtx4x4unity_WorldToObject[2], Globals.hlslcc_mtx4x4unity_MatrixInvV[0].zzzz, u_xlat2);
    u_xlat2 = fma(Globals.hlslcc_mtx4x4unity_WorldToObject[3], Globals.hlslcc_mtx4x4unity_MatrixInvV[0].wwww, u_xlat2);
    u_xlat1 = fma(input.NORMAL0.xxxx, u_xlat2, u_xlat1);
    u_xlat0 = fma(input.TANGENT0.xxxx, u_xlat2, u_xlat0);
    u_xlat2.x = -abs(input.TANGENT0.w) + 1.0;
    u_xlat9.xyz = fma(u_xlat1.xyz, u_xlat2.xxx, input.POSITION0.xyz);
    u_xlat9.xyz = u_xlat9.xyz * Globals._TreeInstanceScale.xyz;
    u_xlat3.x = dot(Globals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, float3(1.0, 1.0, 1.0));
    u_xlat3.y = u_xlat3.x + input.COLOR0.x;
    u_xlat17 = u_xlat3.y + input.COLOR0.y;
    u_xlat3.x = dot(u_xlat9.xyz, float3(u_xlat17));
    u_xlat3 = u_xlat3.xxyy + Globals._Time.yyyy;
    u_xlat3 = u_xlat3 * float4(1.97500002, 0.792999983, 0.375, 0.193000004);
    u_xlat3 = fract(u_xlat3);
    u_xlat3 = fma(u_xlat3, float4(2.0, 2.0, 2.0, 2.0), float4(-0.5, -0.5, -0.5, -0.5));
    u_xlat3 = fract(u_xlat3);
    u_xlat3 = fma(u_xlat3, float4(2.0, 2.0, 2.0, 2.0), float4(-1.0, -1.0, -1.0, -1.0));
    u_xlat4 = abs(u_xlat3) * abs(u_xlat3);
    u_xlat3 = fma(-abs(u_xlat3), float4(2.0, 2.0, 2.0, 2.0), float4(3.0, 3.0, 3.0, 3.0));
    u_xlat3 = u_xlat3 * u_xlat4;
    u_xlat3.xy = u_xlat3.yw + u_xlat3.xz;
    u_xlat4.xyz = u_xlat3.yyy * Globals._Wind.xyz;
    u_xlat4.xyz = u_xlat4.xyz * input.TEXCOORD1.yyy;
    u_xlat5.y = u_xlat3.y * input.TEXCOORD1.y;
    u_xlat6 = Globals.hlslcc_mtx4x4unity_WorldToObject[1] * Globals.hlslcc_mtx4x4unity_MatrixInvV[2].yyyy;
    u_xlat6 = fma(Globals.hlslcc_mtx4x4unity_WorldToObject[0], Globals.hlslcc_mtx4x4unity_MatrixInvV[2].xxxx, u_xlat6);
    u_xlat6 = fma(Globals.hlslcc_mtx4x4unity_WorldToObject[2], Globals.hlslcc_mtx4x4unity_MatrixInvV[2].zzzz, u_xlat6);
    u_xlat6 = fma(Globals.hlslcc_mtx4x4unity_WorldToObject[3], Globals.hlslcc_mtx4x4unity_MatrixInvV[2].wwww, u_xlat6);
    u_xlat1 = fma(input.NORMAL0.zzzz, u_xlat6, u_xlat1);
    u_xlat0 = fma(input.TANGENT0.zzzz, u_xlat6, u_xlat0);
    u_xlat22 = dot(u_xlat1, u_xlat1);
    u_xlat22 = rsqrt(u_xlat22);
    u_xlat1.xyz = fma(u_xlat1.xyz, float3(u_xlat22), (-input.NORMAL0.xyz));
    u_xlat1.xyz = fma(u_xlat2.xxx, u_xlat1.xyz, input.NORMAL0.xyz);
    u_xlat22 = input.COLOR0.y * 0.100000001;
    u_xlat5.xz = u_xlat1.xz * float2(u_xlat22);
    u_xlat3.z = 0.300000012;
    u_xlat3.xyz = fma(u_xlat3.xzx, u_xlat5.xyz, u_xlat4.xyz);
    u_xlat9.xyz = fma(u_xlat3.xyz, Globals._Wind.www, u_xlat9.xyz);
    u_xlat9.xyz = fma(input.TEXCOORD1.xxx, Globals._Wind.xyz, u_xlat9.xyz);
    u_xlat22 = dot(Globals._SquashPlaneNormal.xyz, u_xlat9.xyz);
    u_xlat22 = u_xlat22 + Globals._SquashPlaneNormal.w;
    u_xlat3.xyz = fma((-float3(u_xlat22)), Globals._SquashPlaneNormal.xyz, u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz + (-u_xlat3.xyz);
    u_xlat9.xyz = fma(float3(Globals._SquashAmount), u_xlat9.xyz, u_xlat3.xyz);
    u_xlat3 = u_xlat9.yyyy * Globals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat3 = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[0], u_xlat9.xxxx, u_xlat3);
    u_xlat3 = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[2], u_xlat9.zzzz, u_xlat3);
    u_xlat3 = u_xlat3 + Globals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat4 = u_xlat3.yyyy * Globals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat4 = fma(Globals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat3.xxxx, u_xlat4);
    u_xlat4 = fma(Globals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat3.zzzz, u_xlat4);
    output.mtl_Position = fma(Globals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat3.wwww, u_xlat4);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, Globals._MainTex_ST.xy, Globals._MainTex_ST.zw);
    output.TEXCOORD5.xy = float2(0.0, 0.0);
    u_xlat21 = dot(u_xlat0, u_xlat0);
    u_xlat21 = rsqrt(u_xlat21);
    u_xlat0.xyz = float3(u_xlat21) * u_xlat0.xyz;
    u_xlat0.w = -1.0;
    u_xlat0 = u_xlat0 + (-input.TANGENT0);
    u_xlat0 = fma(u_xlat2.xxxx, u_xlat0, input.TANGENT0);
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat22 = rsqrt(u_xlat22);
    u_xlat0.xyz = u_xlat0.xyz * float3(u_xlat22);
    u_xlat21 = u_xlat0.w * Globals.unity_WorldTransformParams.w;
    u_xlat2.xyz = u_xlat0.yyy * Globals.hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat2.xyz = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[0].yzx, u_xlat0.xxx, u_xlat2.xyz);
    u_xlat0.xyz = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[2].yzx, u_xlat0.zzz, u_xlat2.xyz);
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat22 = rsqrt(u_xlat22);
    u_xlat0.xyz = u_xlat0.xyz * float3(u_xlat22);
    output.TEXCOORD1.x = u_xlat0.z;
    output.TEXCOORD1.w = u_xlat3.x;
    u_xlat22 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat22 = rsqrt(u_xlat22);
    u_xlat1.xyz = float3(u_xlat22) * u_xlat1.xyz;
    u_xlat2.x = dot(u_xlat1.xyz, Globals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(u_xlat1.xyz, Globals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(u_xlat1.xyz, Globals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = rsqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.zxy;
    u_xlat2.xyz = fma(u_xlat1.yzx, u_xlat0.yzx, (-u_xlat2.xyz));
    u_xlat2.xyz = float3(u_xlat21) * u_xlat2.xyz;
    output.TEXCOORD1.y = u_xlat2.x;
    output.TEXCOORD1.z = u_xlat1.x;
    output.TEXCOORD2.x = u_xlat0.x;
    output.TEXCOORD3.x = u_xlat0.y;
    output.TEXCOORD2.w = u_xlat3.y;
    output.TEXCOORD2.y = u_xlat2.y;
    output.TEXCOORD3.y = u_xlat2.z;
    output.TEXCOORD2.z = u_xlat1.y;
    output.TEXCOORD3.w = u_xlat3.z;
    output.TEXCOORD3.z = u_xlat1.z;
    output.COLOR0.xyz = Globals._TreeInstanceColor.xyz * Globals._Color.xyz;
    output.COLOR0.w = input.COLOR0.w;
    u_xlat0.x = u_xlat1.y * u_xlat1.y;
    u_xlat0.x = fma(u_xlat1.x, u_xlat1.x, (-u_xlat0.x));
    u_xlat2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat4.x = dot(Globals.unity_SHBr, u_xlat2);
    u_xlat4.y = dot(Globals.unity_SHBg, u_xlat2);
    u_xlat4.z = dot(Globals.unity_SHBb, u_xlat2);
    u_xlat0.xyz = fma(Globals.unity_SHC.xyz, u_xlat0.xxx, u_xlat4.xyz);
    u_xlat1.w = 1.0;
    u_xlat2.x = dot(Globals.unity_SHAr, u_xlat1);
    u_xlat2.y = dot(Globals.unity_SHAg, u_xlat1);
    u_xlat2.z = dot(Globals.unity_SHAb, u_xlat1);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat0.xyz = max(u_xlat0.xyz, float3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * float3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = fma(u_xlat0.xyz, float3(1.05499995, 1.05499995, 1.05499995), float3(-0.0549999997, -0.0549999997, -0.0549999997));
    u_xlat0.xyz = max(u_xlat0.xyz, float3(0.0, 0.0, 0.0));
    u_xlat2 = (-u_xlat3.xxxx) + Globals.unity_4LightPosX0;
    u_xlat4 = (-u_xlat3.yyyy) + Globals.unity_4LightPosY0;
    u_xlat3 = (-u_xlat3.zzzz) + Globals.unity_4LightPosZ0;
    u_xlat5 = u_xlat1.yyyy * u_xlat4;
    u_xlat4 = u_xlat4 * u_xlat4;
    u_xlat4 = fma(u_xlat2, u_xlat2, u_xlat4);
    u_xlat2 = fma(u_xlat2, u_xlat1.xxxx, u_xlat5);
    u_xlat1 = fma(u_xlat3, u_xlat1.zzzz, u_xlat2);
    u_xlat2 = fma(u_xlat3, u_xlat3, u_xlat4);
    u_xlat2 = max(u_xlat2, float4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat3 = rsqrt(u_xlat2);
    u_xlat2 = fma(u_xlat2, Globals.unity_4LightAtten0, float4(1.0, 1.0, 1.0, 1.0));
    u_xlat2 = float4(1.0, 1.0, 1.0, 1.0) / u_xlat2;
    u_xlat1 = u_xlat1 * u_xlat3;
    u_xlat1 = max(u_xlat1, float4(0.0, 0.0, 0.0, 0.0));
    u_xlat1 = u_xlat2 * u_xlat1;
    u_xlat2.xyz = u_xlat1.yyy * Globals.unity_LightColor[1].xyz;
    u_xlat2.xyz = fma(Globals.unity_LightColor[0].xyz, u_xlat1.xxx, u_xlat2.xyz);
    u_xlat1.xyz = fma(Globals.unity_LightColor[2].xyz, u_xlat1.zzz, u_xlat2.xyz);
    u_xlat1.xyz = fma(Globals.unity_LightColor[3].xyz, u_xlat1.www, u_xlat1.xyz);
    output.TEXCOORD4.xyz = u_xlat0.xyz + u_xlat1.xyz;
    return output;
}


-- Fragment shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL SHADOWS_SCREEN VERTEXLIGHT_ON 
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "TexCoord3"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"
Uses vertex data channel "TexCoord0"
Uses vertex data channel "Normal"

Constant Buffer "Globals" (720 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 336
  Matrix4x4 unity_WorldToObject at 400
  Matrix4x4 unity_MatrixInvV at 480
  Matrix4x4 unity_MatrixVP at 544
  Vector4 _Time at 0
  Vector4 _ProjectionParams at 16
  Vector4 unity_4LightPosX0 at 32
  Vector4 unity_4LightPosY0 at 48
  Vector4 unity_4LightPosZ0 at 64
  Vector4 unity_4LightAtten0 at 80
  Vector4 unity_LightColor[8] at 96
  Vector4 unity_SHAr at 224
  Vector4 unity_SHAg at 240
  Vector4 unity_SHAb at 256
  Vector4 unity_SHBr at 272
  Vector4 unity_SHBg at 288
  Vector4 unity_SHBb at 304
  Vector4 unity_SHC at 320
  Vector4 unity_WorldTransformParams at 464
  Vector4 _TreeInstanceColor at 608
  Vector4 _TreeInstanceScale at 624
  Vector4 _SquashPlaneNormal at 640
  Float _SquashAmount at 656
  Vector4 _Wind at 672
  Vector4 _Color at 688
  Vector4 _MainTex_ST at 704
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

struct Globals_Type
{
    float4 _Time;
    float4 _ProjectionParams;
    float4 unity_4LightPosX0;
    float4 unity_4LightPosY0;
    float4 unity_4LightPosZ0;
    float4 unity_4LightAtten0;
    float4 unity_LightColor[8];
    float4 unity_SHAr;
    float4 unity_SHAg;
    float4 unity_SHAb;
    float4 unity_SHBr;
    float4 unity_SHBg;
    float4 unity_SHBb;
    float4 unity_SHC;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 unity_WorldTransformParams;
    float4 hlslcc_mtx4x4unity_MatrixInvV[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _TreeInstanceColor;
    float4 _TreeInstanceScale;
    float4 _SquashPlaneNormal;
    float _SquashAmount;
    float4 _Wind;
    float4 _Color;
    float4 _MainTex_ST;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float4 TANGENT0 [[ attribute(1) ]] ;
    float3 NORMAL0 [[ attribute(2) ]] ;
    float4 TEXCOORD0 [[ attribute(3) ]] ;
    float4 TEXCOORD1 [[ attribute(4) ]] ;
    float4 COLOR0 [[ attribute(5) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float4 COLOR0 [[ user(COLOR0) ]];
    float3 TEXCOORD4 [[ user(TEXCOORD4) ]];
    float4 TEXCOORD5 [[ user(TEXCOORD5) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant Globals_Type& Globals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    float4 u_xlat2;
    float4 u_xlat3;
    float4 u_xlat4;
    float4 u_xlat5;
    float4 u_xlat6;
    float3 u_xlat9;
    float u_xlat17;
    float u_xlat21;
    float u_xlat22;
    u_xlat0 = Globals.hlslcc_mtx4x4unity_WorldToObject[1] * Globals.hlslcc_mtx4x4unity_MatrixInvV[1].yyyy;
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_WorldToObject[0], Globals.hlslcc_mtx4x4unity_MatrixInvV[1].xxxx, u_xlat0);
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_WorldToObject[2], Globals.hlslcc_mtx4x4unity_MatrixInvV[1].zzzz, u_xlat0);
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_WorldToObject[3], Globals.hlslcc_mtx4x4unity_MatrixInvV[1].wwww, u_xlat0);
    u_xlat1 = u_xlat0 * input.NORMAL0.yyyy;
    u_xlat0 = u_xlat0 * input.TANGENT0.yyyy;
    u_xlat2 = Globals.hlslcc_mtx4x4unity_WorldToObject[1] * Globals.hlslcc_mtx4x4unity_MatrixInvV[0].yyyy;
    u_xlat2 = fma(Globals.hlslcc_mtx4x4unity_WorldToObject[0], Globals.hlslcc_mtx4x4unity_MatrixInvV[0].xxxx, u_xlat2);
    u_xlat2 = fma(Globals.hlslcc_mtx4x4unity_WorldToObject[2], Globals.hlslcc_mtx4x4unity_MatrixInvV[0].zzzz, u_xlat2);
    u_xlat2 = fma(Globals.hlslcc_mtx4x4unity_WorldToObject[3], Globals.hlslcc_mtx4x4unity_MatrixInvV[0].wwww, u_xlat2);
    u_xlat1 = fma(input.NORMAL0.xxxx, u_xlat2, u_xlat1);
    u_xlat0 = fma(input.TANGENT0.xxxx, u_xlat2, u_xlat0);
    u_xlat2.x = -abs(input.TANGENT0.w) + 1.0;
    u_xlat9.xyz = fma(u_xlat1.xyz, u_xlat2.xxx, input.POSITION0.xyz);
    u_xlat9.xyz = u_xlat9.xyz * Globals._TreeInstanceScale.xyz;
    u_xlat3.x = dot(Globals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, float3(1.0, 1.0, 1.0));
    u_xlat3.y = u_xlat3.x + input.COLOR0.x;
    u_xlat17 = u_xlat3.y + input.COLOR0.y;
    u_xlat3.x = dot(u_xlat9.xyz, float3(u_xlat17));
    u_xlat3 = u_xlat3.xxyy + Globals._Time.yyyy;
    u_xlat3 = u_xlat3 * float4(1.97500002, 0.792999983, 0.375, 0.193000004);
    u_xlat3 = fract(u_xlat3);
    u_xlat3 = fma(u_xlat3, float4(2.0, 2.0, 2.0, 2.0), float4(-0.5, -0.5, -0.5, -0.5));
    u_xlat3 = fract(u_xlat3);
    u_xlat3 = fma(u_xlat3, float4(2.0, 2.0, 2.0, 2.0), float4(-1.0, -1.0, -1.0, -1.0));
    u_xlat4 = abs(u_xlat3) * abs(u_xlat3);
    u_xlat3 = fma(-abs(u_xlat3), float4(2.0, 2.0, 2.0, 2.0), float4(3.0, 3.0, 3.0, 3.0));
    u_xlat3 = u_xlat3 * u_xlat4;
    u_xlat3.xy = u_xlat3.yw + u_xlat3.xz;
    u_xlat4.xyz = u_xlat3.yyy * Globals._Wind.xyz;
    u_xlat4.xyz = u_xlat4.xyz * input.TEXCOORD1.yyy;
    u_xlat5.y = u_xlat3.y * input.TEXCOORD1.y;
    u_xlat6 = Globals.hlslcc_mtx4x4unity_WorldToObject[1] * Globals.hlslcc_mtx4x4unity_MatrixInvV[2].yyyy;
    u_xlat6 = fma(Globals.hlslcc_mtx4x4unity_WorldToObject[0], Globals.hlslcc_mtx4x4unity_MatrixInvV[2].xxxx, u_xlat6);
    u_xlat6 = fma(Globals.hlslcc_mtx4x4unity_WorldToObject[2], Globals.hlslcc_mtx4x4unity_MatrixInvV[2].zzzz, u_xlat6);
    u_xlat6 = fma(Globals.hlslcc_mtx4x4unity_WorldToObject[3], Globals.hlslcc_mtx4x4unity_MatrixInvV[2].wwww, u_xlat6);
    u_xlat1 = fma(input.NORMAL0.zzzz, u_xlat6, u_xlat1);
    u_xlat0 = fma(input.TANGENT0.zzzz, u_xlat6, u_xlat0);
    u_xlat22 = dot(u_xlat1, u_xlat1);
    u_xlat22 = rsqrt(u_xlat22);
    u_xlat1.xyz = fma(u_xlat1.xyz, float3(u_xlat22), (-input.NORMAL0.xyz));
    u_xlat1.xyz = fma(u_xlat2.xxx, u_xlat1.xyz, input.NORMAL0.xyz);
    u_xlat22 = input.COLOR0.y * 0.100000001;
    u_xlat5.xz = u_xlat1.xz * float2(u_xlat22);
    u_xlat3.z = 0.300000012;
    u_xlat3.xyz = fma(u_xlat3.xzx, u_xlat5.xyz, u_xlat4.xyz);
    u_xlat9.xyz = fma(u_xlat3.xyz, Globals._Wind.www, u_xlat9.xyz);
    u_xlat9.xyz = fma(input.TEXCOORD1.xxx, Globals._Wind.xyz, u_xlat9.xyz);
    u_xlat22 = dot(Globals._SquashPlaneNormal.xyz, u_xlat9.xyz);
    u_xlat22 = u_xlat22 + Globals._SquashPlaneNormal.w;
    u_xlat3.xyz = fma((-float3(u_xlat22)), Globals._SquashPlaneNormal.xyz, u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz + (-u_xlat3.xyz);
    u_xlat9.xyz = fma(float3(Globals._SquashAmount), u_xlat9.xyz, u_xlat3.xyz);
    u_xlat3 = u_xlat9.yyyy * Globals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat3 = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[0], u_xlat9.xxxx, u_xlat3);
    u_xlat3 = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[2], u_xlat9.zzzz, u_xlat3);
    u_xlat3 = u_xlat3 + Globals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat4 = u_xlat3.yyyy * Globals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat4 = fma(Globals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat3.xxxx, u_xlat4);
    u_xlat4 = fma(Globals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat3.zzzz, u_xlat4);
    u_xlat4 = fma(Globals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat3.wwww, u_xlat4);
    output.mtl_Position = u_xlat4;
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, Globals._MainTex_ST.xy, Globals._MainTex_ST.zw);
    u_xlat21 = dot(u_xlat0, u_xlat0);
    u_xlat21 = rsqrt(u_xlat21);
    u_xlat0.xyz = float3(u_xlat21) * u_xlat0.xyz;
    u_xlat0.w = -1.0;
    u_xlat0 = u_xlat0 + (-input.TANGENT0);
    u_xlat0 = fma(u_xlat2.xxxx, u_xlat0, input.TANGENT0);
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat22 = rsqrt(u_xlat22);
    u_xlat0.xyz = u_xlat0.xyz * float3(u_xlat22);
    u_xlat21 = u_xlat0.w * Globals.unity_WorldTransformParams.w;
    u_xlat2.xyz = u_xlat0.yyy * Globals.hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat2.xyz = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[0].yzx, u_xlat0.xxx, u_xlat2.xyz);
    u_xlat0.xyz = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[2].yzx, u_xlat0.zzz, u_xlat2.xyz);
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat22 = rsqrt(u_xlat22);
    u_xlat0.xyz = u_xlat0.xyz * float3(u_xlat22);
    output.TEXCOORD1.x = u_xlat0.z;
    output.TEXCOORD1.w = u_xlat3.x;
    u_xlat22 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat22 = rsqrt(u_xlat22);
    u_xlat1.xyz = float3(u_xlat22) * u_xlat1.xyz;
    u_xlat2.x = dot(u_xlat1.xyz, Globals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(u_xlat1.xyz, Globals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(u_xlat1.xyz, Globals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = rsqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.zxy;
    u_xlat2.xyz = fma(u_xlat1.yzx, u_xlat0.yzx, (-u_xlat2.xyz));
    u_xlat2.xyz = float3(u_xlat21) * u_xlat2.xyz;
    output.TEXCOORD1.y = u_xlat2.x;
    output.TEXCOORD1.z = u_xlat1.x;
    output.TEXCOORD2.x = u_xlat0.x;
    output.TEXCOORD3.x = u_xlat0.y;
    output.TEXCOORD2.w = u_xlat3.y;
    output.TEXCOORD2.y = u_xlat2.y;
    output.TEXCOORD3.y = u_xlat2.z;
    output.TEXCOORD2.z = u_xlat1.y;
    output.TEXCOORD3.w = u_xlat3.z;
    output.TEXCOORD3.z = u_xlat1.z;
    output.COLOR0.xyz = Globals._TreeInstanceColor.xyz * Globals._Color.xyz;
    output.COLOR0.w = input.COLOR0.w;
    u_xlat0.x = u_xlat1.y * u_xlat1.y;
    u_xlat0.x = fma(u_xlat1.x, u_xlat1.x, (-u_xlat0.x));
    u_xlat2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat5.x = dot(Globals.unity_SHBr, u_xlat2);
    u_xlat5.y = dot(Globals.unity_SHBg, u_xlat2);
    u_xlat5.z = dot(Globals.unity_SHBb, u_xlat2);
    u_xlat0.xyz = fma(Globals.unity_SHC.xyz, u_xlat0.xxx, u_xlat5.xyz);
    u_xlat1.w = 1.0;
    u_xlat2.x = dot(Globals.unity_SHAr, u_xlat1);
    u_xlat2.y = dot(Globals.unity_SHAg, u_xlat1);
    u_xlat2.z = dot(Globals.unity_SHAb, u_xlat1);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat0.xyz = max(u_xlat0.xyz, float3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * float3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = fma(u_xlat0.xyz, float3(1.05499995, 1.05499995, 1.05499995), float3(-0.0549999997, -0.0549999997, -0.0549999997));
    u_xlat0.xyz = max(u_xlat0.xyz, float3(0.0, 0.0, 0.0));
    u_xlat2 = (-u_xlat3.xxxx) + Globals.unity_4LightPosX0;
    u_xlat5 = (-u_xlat3.yyyy) + Globals.unity_4LightPosY0;
    u_xlat3 = (-u_xlat3.zzzz) + Globals.unity_4LightPosZ0;
    u_xlat6 = u_xlat1.yyyy * u_xlat5;
    u_xlat5 = u_xlat5 * u_xlat5;
    u_xlat5 = fma(u_xlat2, u_xlat2, u_xlat5);
    u_xlat2 = fma(u_xlat2, u_xlat1.xxxx, u_xlat6);
    u_xlat1 = fma(u_xlat3, u_xlat1.zzzz, u_xlat2);
    u_xlat2 = fma(u_xlat3, u_xlat3, u_xlat5);
    u_xlat2 = max(u_xlat2, float4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat3 = rsqrt(u_xlat2);
    u_xlat2 = fma(u_xlat2, Globals.unity_4LightAtten0, float4(1.0, 1.0, 1.0, 1.0));
    u_xlat2 = float4(1.0, 1.0, 1.0, 1.0) / u_xlat2;
    u_xlat1 = u_xlat1 * u_xlat3;
    u_xlat1 = max(u_xlat1, float4(0.0, 0.0, 0.0, 0.0));
    u_xlat1 = u_xlat2 * u_xlat1;
    u_xlat2.xyz = u_xlat1.yyy * Globals.unity_LightColor[1].xyz;
    u_xlat2.xyz = fma(Globals.unity_LightColor[0].xyz, u_xlat1.xxx, u_xlat2.xyz);
    u_xlat1.xyz = fma(Globals.unity_LightColor[2].xyz, u_xlat1.zzz, u_xlat2.xyz);
    u_xlat1.xyz = fma(Globals.unity_LightColor[3].xyz, u_xlat1.www, u_xlat1.xyz);
    output.TEXCOORD4.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.x = u_xlat4.y * Globals._ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat4.xw * float2(0.5, 0.5);
    output.TEXCOORD5.zw = u_xlat4.zw;
    output.TEXCOORD5.xy = u_xlat0.zz + u_xlat0.xw;
    return output;
}


-- Fragment shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

 }
 Pass {
  Name "SHADOWCASTER"
  Tags { "LIGHTMODE"="SHADOWCASTER" "IGNOREPROJECTOR"="true" "SHADOWSUPPORT"="true" "RenderType"="TreeLeaf" }
  //////////////////////////////////
  //                              //
  //      Compiled programs       //
  //                              //
  //////////////////////////////////
//////////////////////////////////////////////////////
Keywords set in this variant: SHADOWS_DEPTH 
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "TexCoord3"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"
Uses vertex data channel "TexCoord0"
Uses vertex data channel "Normal"

Constant Buffer "Globals" (384 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 48
  Matrix4x4 unity_WorldToObject at 112
  Matrix4x4 unity_MatrixInvV at 176
  Matrix4x4 unity_MatrixVP at 240
  Vector4 _Time at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_LightShadowBias at 32
  Vector4 _TreeInstanceScale at 304
  Vector4 _SquashPlaneNormal at 320
  Float _SquashAmount at 336
  Vector4 _Wind at 352
  Vector4 _MainTex_ST at 368
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

struct Globals_Type
{
    float4 _Time;
    float4 _WorldSpaceLightPos0;
    float4 unity_LightShadowBias;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixInvV[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _TreeInstanceScale;
    float4 _SquashPlaneNormal;
    float _SquashAmount;
    float4 _Wind;
    float4 _MainTex_ST;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float4 TANGENT0 [[ attribute(1) ]] ;
    float3 NORMAL0 [[ attribute(2) ]] ;
    float4 TEXCOORD0 [[ attribute(3) ]] ;
    float4 TEXCOORD1 [[ attribute(4) ]] ;
    float4 COLOR0 [[ attribute(5) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float2 TEXCOORD1 [[ user(TEXCOORD1) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant Globals_Type& Globals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    float4 u_xlat2;
    float4 u_xlat3;
    float3 u_xlat4;
    float4 u_xlat5;
    float3 u_xlat7;
    float u_xlat12;
    float u_xlat14;
    float u_xlat18;
    bool u_xlatb18;
    u_xlat0 = Globals.hlslcc_mtx4x4unity_WorldToObject[1] * Globals.hlslcc_mtx4x4unity_MatrixInvV[1].yyyy;
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_WorldToObject[0], Globals.hlslcc_mtx4x4unity_MatrixInvV[1].xxxx, u_xlat0);
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_WorldToObject[2], Globals.hlslcc_mtx4x4unity_MatrixInvV[1].zzzz, u_xlat0);
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_WorldToObject[3], Globals.hlslcc_mtx4x4unity_MatrixInvV[1].wwww, u_xlat0);
    u_xlat0 = u_xlat0 * input.NORMAL0.yyyy;
    u_xlat1 = Globals.hlslcc_mtx4x4unity_WorldToObject[1] * Globals.hlslcc_mtx4x4unity_MatrixInvV[0].yyyy;
    u_xlat1 = fma(Globals.hlslcc_mtx4x4unity_WorldToObject[0], Globals.hlslcc_mtx4x4unity_MatrixInvV[0].xxxx, u_xlat1);
    u_xlat1 = fma(Globals.hlslcc_mtx4x4unity_WorldToObject[2], Globals.hlslcc_mtx4x4unity_MatrixInvV[0].zzzz, u_xlat1);
    u_xlat1 = fma(Globals.hlslcc_mtx4x4unity_WorldToObject[3], Globals.hlslcc_mtx4x4unity_MatrixInvV[0].wwww, u_xlat1);
    u_xlat0 = fma(input.NORMAL0.xxxx, u_xlat1, u_xlat0);
    u_xlat1.x = -abs(input.TANGENT0.w) + 1.0;
    u_xlat7.xyz = fma(u_xlat0.xyz, u_xlat1.xxx, input.POSITION0.xyz);
    u_xlat7.xyz = u_xlat7.xyz * Globals._TreeInstanceScale.xyz;
    u_xlat2.x = dot(Globals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, float3(1.0, 1.0, 1.0));
    u_xlat2.y = u_xlat2.x + input.COLOR0.x;
    u_xlat14 = u_xlat2.y + input.COLOR0.y;
    u_xlat2.x = dot(u_xlat7.xyz, float3(u_xlat14));
    u_xlat2 = u_xlat2.xxyy + Globals._Time.yyyy;
    u_xlat2 = u_xlat2 * float4(1.97500002, 0.792999983, 0.375, 0.193000004);
    u_xlat2 = fract(u_xlat2);
    u_xlat2 = fma(u_xlat2, float4(2.0, 2.0, 2.0, 2.0), float4(-0.5, -0.5, -0.5, -0.5));
    u_xlat2 = fract(u_xlat2);
    u_xlat2 = fma(u_xlat2, float4(2.0, 2.0, 2.0, 2.0), float4(-1.0, -1.0, -1.0, -1.0));
    u_xlat3 = abs(u_xlat2) * abs(u_xlat2);
    u_xlat2 = fma(-abs(u_xlat2), float4(2.0, 2.0, 2.0, 2.0), float4(3.0, 3.0, 3.0, 3.0));
    u_xlat2 = u_xlat2 * u_xlat3;
    u_xlat2.xy = u_xlat2.yw + u_xlat2.xz;
    u_xlat3.xyz = u_xlat2.yyy * Globals._Wind.xyz;
    u_xlat3.xyz = u_xlat3.xyz * input.TEXCOORD1.yyy;
    u_xlat4.y = u_xlat2.y * input.TEXCOORD1.y;
    u_xlat5 = Globals.hlslcc_mtx4x4unity_WorldToObject[1] * Globals.hlslcc_mtx4x4unity_MatrixInvV[2].yyyy;
    u_xlat5 = fma(Globals.hlslcc_mtx4x4unity_WorldToObject[0], Globals.hlslcc_mtx4x4unity_MatrixInvV[2].xxxx, u_xlat5);
    u_xlat5 = fma(Globals.hlslcc_mtx4x4unity_WorldToObject[2], Globals.hlslcc_mtx4x4unity_MatrixInvV[2].zzzz, u_xlat5);
    u_xlat5 = fma(Globals.hlslcc_mtx4x4unity_WorldToObject[3], Globals.hlslcc_mtx4x4unity_MatrixInvV[2].wwww, u_xlat5);
    u_xlat0 = fma(input.NORMAL0.zzzz, u_xlat5, u_xlat0);
    u_xlat18 = dot(u_xlat0, u_xlat0);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat0.xyz = fma(u_xlat0.xyz, float3(u_xlat18), (-input.NORMAL0.xyz));
    u_xlat0.xyz = fma(u_xlat1.xxx, u_xlat0.xyz, input.NORMAL0.xyz);
    u_xlat18 = input.COLOR0.y * 0.100000001;
    u_xlat4.xz = u_xlat0.xz * float2(u_xlat18);
    u_xlat2.z = 0.300000012;
    u_xlat2.xyz = fma(u_xlat2.xzx, u_xlat4.xyz, u_xlat3.xyz);
    u_xlat1.xyz = fma(u_xlat2.xyz, Globals._Wind.www, u_xlat7.xyz);
    u_xlat1.xyz = fma(input.TEXCOORD1.xxx, Globals._Wind.xyz, u_xlat1.xyz);
    u_xlat18 = dot(Globals._SquashPlaneNormal.xyz, u_xlat1.xyz);
    u_xlat18 = u_xlat18 + Globals._SquashPlaneNormal.w;
    u_xlat2.xyz = fma((-float3(u_xlat18)), Globals._SquashPlaneNormal.xyz, u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz + (-u_xlat2.xyz);
    u_xlat1.xyz = fma(float3(Globals._SquashAmount), u_xlat1.xyz, u_xlat2.xyz);
    u_xlat2 = u_xlat1.yyyy * Globals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[0], u_xlat1.xxxx, u_xlat2);
    u_xlat1 = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[2], u_xlat1.zzzz, u_xlat2);
    u_xlat1 = u_xlat1 + Globals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2.xyz = fma((-u_xlat1.xyz), Globals._WorldSpaceLightPos0.www, Globals._WorldSpaceLightPos0.xyz);
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat2.xyz = float3(u_xlat18) * u_xlat2.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat0.xyz = float3(u_xlat18) * u_xlat0.xyz;
    u_xlat3.x = dot(u_xlat0.xyz, Globals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat3.y = dot(u_xlat0.xyz, Globals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat3.z = dot(u_xlat0.xyz, Globals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = rsqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat18 = fma((-u_xlat18), u_xlat18, 1.0);
    u_xlat18 = sqrt(u_xlat18);
    u_xlat18 = u_xlat18 * Globals.unity_LightShadowBias.z;
    u_xlat0.xyz = fma((-u_xlat0.xyz), float3(u_xlat18), u_xlat1.xyz);
    u_xlatb18 = Globals.unity_LightShadowBias.z!=0.0;
    u_xlat0.xyz = (bool(u_xlatb18)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat2 = u_xlat0.yyyy * Globals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = fma(Globals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat0.xxxx, u_xlat2);
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat0.zzzz, u_xlat2);
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat0);
    u_xlat1.x = Globals.unity_LightShadowBias.x / u_xlat0.w;
    u_xlat1.x = min(u_xlat1.x, 0.0);
    u_xlat1.x = max(u_xlat1.x, -1.0);
    u_xlat12 = u_xlat0.z + u_xlat1.x;
    u_xlat1.x = min(u_xlat0.w, u_xlat12);
    output.mtl_Position.xyw = u_xlat0.xyw;
    u_xlat0.x = (-u_xlat12) + u_xlat1.x;
    output.mtl_Position.z = fma(Globals.unity_LightShadowBias.y, u_xlat0.x, u_xlat12);
    output.TEXCOORD1.xy = fma(input.TEXCOORD0.xy, Globals._MainTex_ST.xy, Globals._MainTex_ST.zw);
    return output;
}


-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0

Constant Buffer "Globals" (4 bytes) on slot 0 {
  Float _Cutoff at 0
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

#ifndef XLT_REMAP_O
#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
#endif
constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
struct Globals_Type
{
    float _Cutoff;
};

struct Mtl_FragmentIn
{
    float2 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant Globals_Type& Globals [[ buffer(0) ]],
    sampler sampler_MainTex [[ sampler (0) ]],
    texture2d<float, access::sample > _MainTex [[ texture (0) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float u_xlat0;
    bool u_xlatb0;
    u_xlat0 = _MainTex.sample(sampler_MainTex, input.TEXCOORD1.xy).w;
    u_xlat0 = u_xlat0 + (-Globals._Cutoff);
    u_xlatb0 = u_xlat0<0.0;
    if((int(u_xlatb0) * int(0xffffffffu))!=0){discard_fragment();}
    output.SV_Target0 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


//////////////////////////////////////////////////////
Keywords set in this variant: SHADOWS_CUBE 
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "TexCoord3"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"
Uses vertex data channel "TexCoord0"
Uses vertex data channel "Normal"

Constant Buffer "Globals" (368 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 32
  Matrix4x4 unity_WorldToObject at 96
  Matrix4x4 unity_MatrixInvV at 160
  Matrix4x4 unity_MatrixVP at 224
  Vector4 _Time at 0
  Vector4 _LightPositionRange at 16
  Vector4 _TreeInstanceScale at 288
  Vector4 _SquashPlaneNormal at 304
  Float _SquashAmount at 320
  Vector4 _Wind at 336
  Vector4 _MainTex_ST at 352
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

struct Globals_Type
{
    float4 _Time;
    float4 _LightPositionRange;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixInvV[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _TreeInstanceScale;
    float4 _SquashPlaneNormal;
    float _SquashAmount;
    float4 _Wind;
    float4 _MainTex_ST;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float4 TANGENT0 [[ attribute(1) ]] ;
    float3 NORMAL0 [[ attribute(2) ]] ;
    float4 TEXCOORD0 [[ attribute(3) ]] ;
    float4 TEXCOORD1 [[ attribute(4) ]] ;
    float4 COLOR0 [[ attribute(5) ]] ;
};

struct Mtl_VertexOut
{
    float3 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 mtl_Position [[ position ]];
    float2 TEXCOORD1 [[ user(TEXCOORD1) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant Globals_Type& Globals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    float4 u_xlat2;
    float4 u_xlat3;
    float u_xlat12;
    u_xlat0 = Globals.hlslcc_mtx4x4unity_WorldToObject[1] * Globals.hlslcc_mtx4x4unity_MatrixInvV[1].yyyy;
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_WorldToObject[0], Globals.hlslcc_mtx4x4unity_MatrixInvV[1].xxxx, u_xlat0);
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_WorldToObject[2], Globals.hlslcc_mtx4x4unity_MatrixInvV[1].zzzz, u_xlat0);
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_WorldToObject[3], Globals.hlslcc_mtx4x4unity_MatrixInvV[1].wwww, u_xlat0);
    u_xlat0 = u_xlat0 * input.NORMAL0.yyyy;
    u_xlat1 = Globals.hlslcc_mtx4x4unity_WorldToObject[1] * Globals.hlslcc_mtx4x4unity_MatrixInvV[0].yyyy;
    u_xlat1 = fma(Globals.hlslcc_mtx4x4unity_WorldToObject[0], Globals.hlslcc_mtx4x4unity_MatrixInvV[0].xxxx, u_xlat1);
    u_xlat1 = fma(Globals.hlslcc_mtx4x4unity_WorldToObject[2], Globals.hlslcc_mtx4x4unity_MatrixInvV[0].zzzz, u_xlat1);
    u_xlat1 = fma(Globals.hlslcc_mtx4x4unity_WorldToObject[3], Globals.hlslcc_mtx4x4unity_MatrixInvV[0].wwww, u_xlat1);
    u_xlat0 = fma(input.NORMAL0.xxxx, u_xlat1, u_xlat0);
    u_xlat1 = Globals.hlslcc_mtx4x4unity_WorldToObject[1] * Globals.hlslcc_mtx4x4unity_MatrixInvV[2].yyyy;
    u_xlat1 = fma(Globals.hlslcc_mtx4x4unity_WorldToObject[0], Globals.hlslcc_mtx4x4unity_MatrixInvV[2].xxxx, u_xlat1);
    u_xlat1 = fma(Globals.hlslcc_mtx4x4unity_WorldToObject[2], Globals.hlslcc_mtx4x4unity_MatrixInvV[2].zzzz, u_xlat1);
    u_xlat1 = fma(Globals.hlslcc_mtx4x4unity_WorldToObject[3], Globals.hlslcc_mtx4x4unity_MatrixInvV[2].wwww, u_xlat1);
    u_xlat1 = fma(input.NORMAL0.zzzz, u_xlat1, u_xlat0);
    u_xlat12 = dot(u_xlat1, u_xlat1);
    u_xlat12 = rsqrt(u_xlat12);
    u_xlat1.xy = fma(u_xlat1.xz, float2(u_xlat12), (-input.NORMAL0.xz));
    u_xlat12 = -abs(input.TANGENT0.w) + 1.0;
    u_xlat1.xy = fma(float2(u_xlat12), u_xlat1.xy, input.NORMAL0.xz);
    u_xlat0.xyz = fma(u_xlat0.xyz, float3(u_xlat12), input.POSITION0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * Globals._TreeInstanceScale.xyz;
    u_xlat12 = input.COLOR0.y * 0.100000001;
    u_xlat1.xz = u_xlat1.xy * float2(u_xlat12);
    u_xlat12 = dot(Globals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, float3(1.0, 1.0, 1.0));
    u_xlat2.y = u_xlat12 + input.COLOR0.x;
    u_xlat12 = u_xlat2.y + input.COLOR0.y;
    u_xlat2.x = dot(u_xlat0.xyz, float3(u_xlat12));
    u_xlat2 = u_xlat2.xxyy + Globals._Time.yyyy;
    u_xlat2 = u_xlat2 * float4(1.97500002, 0.792999983, 0.375, 0.193000004);
    u_xlat2 = fract(u_xlat2);
    u_xlat2 = fma(u_xlat2, float4(2.0, 2.0, 2.0, 2.0), float4(-0.5, -0.5, -0.5, -0.5));
    u_xlat2 = fract(u_xlat2);
    u_xlat2 = fma(u_xlat2, float4(2.0, 2.0, 2.0, 2.0), float4(-1.0, -1.0, -1.0, -1.0));
    u_xlat3 = abs(u_xlat2) * abs(u_xlat2);
    u_xlat2 = fma(-abs(u_xlat2), float4(2.0, 2.0, 2.0, 2.0), float4(3.0, 3.0, 3.0, 3.0));
    u_xlat2 = u_xlat2 * u_xlat3;
    u_xlat2.xy = u_xlat2.yw + u_xlat2.xz;
    u_xlat3.xyz = u_xlat2.yyy * Globals._Wind.xyz;
    u_xlat3.xyz = u_xlat3.xyz * input.TEXCOORD1.yyy;
    u_xlat1.y = u_xlat2.y * input.TEXCOORD1.y;
    u_xlat2.z = 0.300000012;
    u_xlat1.xyz = fma(u_xlat2.xzx, u_xlat1.xyz, u_xlat3.xyz);
    u_xlat0.xyz = fma(u_xlat1.xyz, Globals._Wind.www, u_xlat0.xyz);
    u_xlat0.xyz = fma(input.TEXCOORD1.xxx, Globals._Wind.xyz, u_xlat0.xyz);
    u_xlat12 = dot(Globals._SquashPlaneNormal.xyz, u_xlat0.xyz);
    u_xlat12 = u_xlat12 + Globals._SquashPlaneNormal.w;
    u_xlat1.xyz = fma((-float3(u_xlat12)), Globals._SquashPlaneNormal.xyz, u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat1.xyz);
    u_xlat0.xyz = fma(float3(Globals._SquashAmount), u_xlat0.xyz, u_xlat1.xyz);
    u_xlat1.xyz = u_xlat0.yyy * Globals.hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[0].xyz, u_xlat0.xxx, u_xlat1.xyz);
    u_xlat1.xyz = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[2].xyz, u_xlat0.zzz, u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz + Globals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    output.TEXCOORD0.xyz = u_xlat1.xyz + (-Globals._LightPositionRange.xyz);
    u_xlat1 = u_xlat0.yyyy * Globals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[0], u_xlat0.xxxx, u_xlat1);
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[2], u_xlat0.zzzz, u_xlat1);
    u_xlat0 = u_xlat0 + Globals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * Globals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = fma(Globals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat0.xxxx, u_xlat1);
    u_xlat1 = fma(Globals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat0.zzzz, u_xlat1);
    output.mtl_Position = fma(Globals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat0.wwww, u_xlat1);
    output.TEXCOORD1.xy = fma(input.TEXCOORD0.xy, Globals._MainTex_ST.xy, Globals._MainTex_ST.zw);
    return output;
}


-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0

Constant Buffer "Globals" (36 bytes) on slot 0 {
  Vector4 _LightPositionRange at 0
  Vector4 unity_LightShadowBias at 16
  Float _Cutoff at 32
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

#ifndef XLT_REMAP_O
#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
#endif
constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
struct Globals_Type
{
    float4 _LightPositionRange;
    float4 unity_LightShadowBias;
    float _Cutoff;
};

struct Mtl_FragmentIn
{
    float3 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float2 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant Globals_Type& Globals [[ buffer(0) ]],
    sampler sampler_MainTex [[ sampler (0) ]],
    texture2d<float, access::sample > _MainTex [[ texture (0) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float u_xlat0;
    bool u_xlatb0;
    u_xlat0 = _MainTex.sample(sampler_MainTex, input.TEXCOORD1.xy).w;
    u_xlat0 = u_xlat0 + (-Globals._Cutoff);
    u_xlatb0 = u_xlat0<0.0;
    if((int(u_xlatb0) * int(0xffffffffu))!=0){discard_fragment();}
    u_xlat0 = dot(input.TEXCOORD0.xyz, input.TEXCOORD0.xyz);
    u_xlat0 = sqrt(u_xlat0);
    u_xlat0 = u_xlat0 + Globals.unity_LightShadowBias.x;
    output.SV_Target0 = float4(u_xlat0) * Globals._LightPositionRange.wwww;
    return output;
}


 }
}
Dependency "BillboardShader" = "Hidden/Nature/Tree Creator Leaves Rendertex"
}