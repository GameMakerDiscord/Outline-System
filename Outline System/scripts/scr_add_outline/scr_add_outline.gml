///@desc scr_add_outline
///@arg {sprite} sprite_index
///@arg {real} image_index
///@arg {real} x
///@arg {real} y
///@arg {real} angle
///@arg {real} xscale
///@arg {real} yscale
///@arg {real} colour
///@arg {real} alpha
///@arg {real} width
///@arg {real} depth
var _list = ds_list_create();
_list[| OUTLINE_ELEMENT.DEPTH] = argument[10];	//needed in outline controller


_list[| OUTLINE_ELEMENT.SPRITE] = argument[0];
_list[| OUTLINE_ELEMENT.SUBIMAGE] = argument[1];
_list[| OUTLINE_ELEMENT.X] = argument[2];
_list[| OUTLINE_ELEMENT.Y] = argument[3];
_list[| OUTLINE_ELEMENT.ANGLE] = argument[4];
_list[| OUTLINE_ELEMENT.XSCALE] = argument[5];
_list[| OUTLINE_ELEMENT.YSCALE] = argument[6];
_list[| OUTLINE_ELEMENT.COLOUR] = color_to_array(argument[7],argument[8]);
_list[| OUTLINE_ELEMENT.WIDTH] = argument[9];

ds_priority_add(obj_outliner.outline_queue,_list,argument[10]);
