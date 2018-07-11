/// @description

draw_self();

shader_set(shd_outline);
var _s_t = sprite_get_texture(sprite_index,image_index);
var _s_w = texture_get_texel_width(_s_t);
var _s_h = texture_get_texel_width(_s_t);
	
shader_set_uniform_f(uni_pix_w,_s_w);
shader_set_uniform_f(uni_pix_h,_s_h);
shader_set_uniform_f(uni_border_width,width);
shader_set_uniform_f_array(uni_colour,colour);
	
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,c_white,1);

shader_reset();