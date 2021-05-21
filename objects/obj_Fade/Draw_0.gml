/// @description Insert description here
// You can write your code in this editor
roomAlpha = clamp(roomAlpha + (roomFade * 0.1), 0, 1);

if (roomAlpha == 1) {
	roomFade = -1;
}

if (roomAlpha == 0 && roomFade == -1) {
	instance_destroy();
}


draw_set_alpha(roomAlpha);
draw_sprite_ext(spr_Pixel, 0, 0, 0, room_width, room_height, 0, c_black, roomAlpha);
draw_set_alpha(1);