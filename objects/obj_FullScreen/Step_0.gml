/// @description switch between full screen mode
if (keyboard_check_pressed(vk_escape)) {
	full = !full;
	window_set_fullscreen(full);
}