/// @hit flash

draw_self();

if (flash > 0) {
	flash--;
	shader_set(sh_hitFlash);
	draw_self();
	shader_reset();
}


