///@desc camera_h
///@arg cam
///@arg [height]
var _cam = argument[0];
if (argument_count == 1) {
	return camera_get_view_height(_cam)
} else {
	camera_set_view_size(_cam,camera_w(_cam),argument[1]);
}