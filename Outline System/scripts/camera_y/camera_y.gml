///@desc camera_y
///@arg {real} camera
///@arg {real} [y]
var _cam = argument[0];
if (argument_count == 1) {
	return camera_get_view_y(_cam)
} else {
	camera_set_view_pos(_cam,camera_x(_cam),argument[1]);
}