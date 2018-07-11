/// @description 
var _cam = view_camera[0];		///PUT YOUR CAMERA VARIABLE HERE!


#region Camera Control
/**/ // comment this out on import
if (mouse_wheel_up()) {
	camera_w(_cam,camera_w(_cam) - 128);
	camera_h(_cam,camera_h(_cam) - 96);
}
if (mouse_wheel_down()) {
	camera_w(_cam,camera_w(_cam) + 128);
	camera_h(_cam,camera_h(_cam) + 96);
}
var _lr = keyboard_check(vk_right)-keyboard_check(vk_left);
var _ud = keyboard_check(vk_down)-keyboard_check(vk_up);

camera_x(_cam,camera_x(_cam)+_lr*8);
camera_y(_cam,camera_y(_cam)+_ud*8);
/**/
#endregion


last_width = width;
last_height = height;
width = display_get_gui_width();
height = display_get_gui_height();
scale_width = width/camera_get_view_width(_cam);
scale_height = height/camera_get_view_height(_cam);
cam_x = camera_get_view_x(_cam);
cam_y = camera_get_view_y(_cam);