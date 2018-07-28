//
// Customisable outline shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float pix_w;
uniform float pix_h;
uniform float border_w;
uniform vec4 border_colour;

void main()
{
	
	vec2 offset_x;
	offset_x.x = pix_w;
	vec2 offset_y;
	offset_y.y = pix_h;
	
	vec4 colour = texture2D( gm_BaseTexture, v_vTexcoord);
	float alpha = colour.a;
	
	for (float i=-border_w;i<=border_w;i+=1.0) {
		alpha += ceil(	texture2D( gm_BaseTexture, v_vTexcoord + offset_x*i).a);
	    alpha += ceil(	texture2D( gm_BaseTexture, v_vTexcoord + offset_y*i).a);
	    alpha += ceil(	texture2D( gm_BaseTexture, v_vTexcoord + offset_x*i + offset_y*i).a);
	    alpha += ceil(	texture2D( gm_BaseTexture, v_vTexcoord + offset_x*i - offset_y*i).a);
	    alpha += ceil(	texture2D( gm_BaseTexture, v_vTexcoord - offset_x*i - offset_y*i).a);
	    alpha += ceil(	texture2D( gm_BaseTexture, v_vTexcoord - offset_x*i + offset_y*i).a);
	}
	if (colour.a < 0.5) {
		colour.rgb = border_colour.rgb;
		if (alpha > 0.5) {
			alpha = border_colour.a;	
		}
	}
    gl_FragColor = v_vColour * vec4(colour.rgb,alpha);
}
 