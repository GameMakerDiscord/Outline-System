/// @description
/// Implementation of the outline shader without any extra scaling or transformations applied. 


uni_border_width = shader_get_uniform(shd_outline,"border_w");
uni_pix_w = shader_get_uniform(shd_outline,"pix_w");
uni_pix_h = shader_get_uniform(shd_outline,"pix_h");
uni_colour = shader_get_uniform(shd_outline,"border_colour");
width = 4;
colour = color_to_array(c_lime,0.75);