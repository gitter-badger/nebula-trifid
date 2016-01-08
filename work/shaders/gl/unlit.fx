//------------------------------------------------------------------------------
//  unlit.fx
//  (C) 2012 Gustav Sterbrant
//------------------------------------------------------------------------------

#include "lib/std.fxh"
#include "lib/shared.fxh"
#include "lib/util.fxh"
#include "lib/techniques.fxh"

float Brightness = 0.0f;

/// Declaring used textures
sampler2D AlbedoMap;

/// Declaring used samplers
samplerstate DefaultSampler
{
	Samplers = { AlbedoMap };
};

state UnlitOpaqueState
{
	CullMode = Back;
};

state UnlitAlphaState
{
	BlendEnabled[0] = true;
	SrcBlend[0] = SrcAlpha;
	DstBlend[0] = OneMinusSrcAlpha;
	CullMode = Back;
};


//------------------------------------------------------------------------------
/**
*/
shader
void
vsMain(in vec3 position,
	in vec3 normal,
	in vec2 uv,
	in vec3 tangent,
	in vec3 binormal,
	out vec2 UV) 
{
    gl_Position = ViewProjection * Model * vec4(position, 1);
    UV = uv;
}

//------------------------------------------------------------------------------
/**
*/
shader
void
psMain(in vec2 UV,
	[color0] out vec4 Albedo) 
{
	vec4 diffColor = texture(AlbedoMap, UV.xy);
	float alpha = diffColor.a;
	if (alpha < AlphaSensitivity) discard;
	Albedo = EncodeHDR(diffColor * Brightness);
}

//------------------------------------------------------------------------------
/**
*/
shader
void
psMainAlpha(in vec2 UV,
	[color0] out vec4 Albedo) 
{
	vec4 diffColor = texture(AlbedoMap, UV.xy);
	float alpha = diffColor.a;
	if (alpha < AlphaSensitivity) discard;
	Albedo = EncodeHDR(diffColor * AlphaBlendFactor * Brightness);
}


//------------------------------------------------------------------------------
/**
*/
SimpleTechnique(Static, "Static", vsMain(), psMain(), UnlitOpaqueState);
SimpleTechnique(Alpha, "Alpha", vsMain(), psMainAlpha(), UnlitAlphaState);