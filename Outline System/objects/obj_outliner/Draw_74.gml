/// @description 
if (!surface_exists(screen_surface)) {
	screen_surface = surface_create(width,height);
}
if (!surface_exists(mask_surface)) {
	mask_surface = surface_create(width,height);
}
if (last_width != width || last_height != height) {
	surface_free(screen_surface);
	surface_free(mask_surface);
	screen_surface = surface_create(width,height);
	mask_surface = surface_create(width,height);
}
var _screen_tex = surface_get_texture(screen_surface);
var _pix_w = texture_get_texel_width(_screen_tex);
var _pix_h = texture_get_texel_height(_screen_tex);
var _layer_surface = surface_create(width,height);
surface_set_target(screen_surface);
draw_clear_alpha(c_black,0);
surface_reset_target();
surface_set_target(mask_surface);
draw_clear_alpha(c_black,0);
surface_reset_target();
surface_set_target(_layer_surface);
draw_clear_alpha(c_black,0);
surface_reset_target();

var _depth = undefined;
var _lastdepth = undefined;

var _size = ds_priority_size(outline_queue);
repeat (_size) {
	var _list = ds_priority_delete_max(outline_queue);
	_depth = _list[| OUTLINE_ELEMENT.DEPTH];
	
	if (_lastdepth == undefined) {
		_lastdepth = _depth+1;
	}
	if (_lastdepth != _depth) {
		
		//mask screen
		surface_set_target(screen_surface);
		gpu_set_colorwriteenable(false,false,false,true);
		gpu_set_blendmode(bm_subtract);
		
		draw_surface(mask_surface,0,0);
		
		gpu_set_blendmode(bm_normal);
		gpu_set_colorwriteenable(true,true,true,true);
		surface_reset_target();
		
		//clear mask
		surface_set_target(mask_surface);
		draw_clear_alpha(c_black,0);
		surface_reset_target();
		_lastdepth = _depth;
	}
	
	var _x = _list[| OUTLINE_ELEMENT.X]-cam_x;
	var _y = _list[| OUTLINE_ELEMENT.Y]-cam_y;
	var _sprite = _list[| OUTLINE_ELEMENT.SPRITE];
	var _subimage = _list[| OUTLINE_ELEMENT.SUBIMAGE];
	var _angle = _list[| OUTLINE_ELEMENT.ANGLE];
	var _xscale = _list[| OUTLINE_ELEMENT.XSCALE];
	var _yscale = _list[| OUTLINE_ELEMENT.YSCALE];
	var _colour = _list[| OUTLINE_ELEMENT.COLOUR];
	var _width = _list[| OUTLINE_ELEMENT.WIDTH];
	var _depth = _list[| OUTLINE_ELEMENT.DEPTH];
	
	_x = _x * scale_width;
	_y = _y * scale_height;
	
	_xscale = _xscale * scale_width;
	_yscale = _yscale * scale_height;
	
	
	surface_set_target(mask_surface);
	
	draw_sprite_ext(_sprite,_subimage,_x,_y,_xscale,_yscale,_angle,c_black,1);
	
	surface_reset_target();
	
	surface_set_target(_layer_surface);
	
	draw_clear_alpha(0,0);
	draw_sprite_ext(_sprite,_subimage,_x,_y,_xscale,_yscale,_angle,c_white,1);
	
	surface_reset_target();
	
	surface_set_target(screen_surface);
	
	shader_set(shd_outline);
	var _s_t = surface_get_texture(_layer_surface);
	var _s_w = texture_get_texel_width(_s_t);
	var _s_h = texture_get_texel_height(_s_t);
	
	shader_set_uniform_f(uni_pix_w,_s_w);
	shader_set_uniform_f(uni_pix_h,_s_h);
	shader_set_uniform_f(uni_border_width,_width);
	shader_set_uniform_f_array(uni_colour,_colour);
	
	draw_surface(_layer_surface,0,0);
	
	shader_reset();
	
	surface_reset_target();
	
	/* debug surface
	surface_set_target(_db_surf);
	
	draw_sprite_ext(_sprite,_subimage,_x,_y,_xscale,_yscale,_angle,c_white,1);
	
	surface_reset_target();
	*/
	
	
	
	ds_list_destroy(_list);
} 
surface_set_target(screen_surface);
	gpu_set_colorwriteenable(false,false,false,true);
	gpu_set_blendmode(bm_subtract);
		
	draw_surface(mask_surface,0,0);
		
	gpu_set_blendmode(bm_normal);
	gpu_set_colorwriteenable(true,true,true,true);
surface_reset_target();

draw_surface(screen_surface,0,0);

if (keyboard_check_pressed(ord("S"))) {
	surface_save(screen_surface,"screen_surface.png");
	surface_save(mask_surface,"mask_surface.png");
}
surface_free(_layer_surface);