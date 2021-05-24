/// @description Insert description here
// You can write your code in this editor
if (!created) {
	instance_create_depth(x, y, -9999, obj_Fade);
	instance_create_depth(x, y, -9999, obj_GameComplete);
	created = true;
}