///@desc camera_x
///@arg {real} camera
///@arg {real} [x]
var _cam = argument[0];
if (argument_count == 1) {
	return camera_get_view_x(_cam)
} else {
	camera_set_view_pos(_cam,argument[1],camera_y(_cam));
}