// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function animationHitFrame(frame){
	
	var frame_range = image_speed * sprite_get_speed(sprite_index) / game_get_speed(gamespeed_fps);
	return image_index >= frame && image_index < frame+frame_range;
}