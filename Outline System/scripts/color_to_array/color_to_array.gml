///@desc color_to_array
///@arg {color} color
///@arg {real} alpha

var _colour = argument[0],
	_r,_g,_b,
	_a = (argument_count==2 ? argument[1] : 1),
	_arr = array_create(4);
	
_r = _colour & 0xFF;
_g = (_colour >> 8) & 0xFF;
_b = (_colour >> 16) & 0xFF;


_arr[0] = _r/256;
_arr[1] = _g/256;
_arr[2] = _b/256;
_arr[3] = _a;

return _arr;

