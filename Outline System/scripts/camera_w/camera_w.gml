///@desc camera_w
///@arg cam
///@arg [width]
var _cam = argument[0];
if (argument_count == 1) {
	return camera_get_view_width(_cam)
} else {
	camera_set_view_size(_cam,argument[1],camera_h(_cam));
}