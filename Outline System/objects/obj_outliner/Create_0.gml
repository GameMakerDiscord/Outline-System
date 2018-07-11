/// @description 
/// Implementation of the entire system
outline_queue = ds_priority_create();
screen_surface = noone;
mask_surface = noone;
layer_surface = noone;
width = display_get_gui_width();
height = display_get_gui_height();

last_width = width;
last_height = height;

uni_border_width = shader_get_uniform(shd_outline,"border_w");
uni_pix_w = shader_get_uniform(shd_outline,"pix_w");
uni_pix_h = shader_get_uniform(shd_outline,"pix_h");
uni_colour = shader_get_uniform(shd_outline,"border_colour");
