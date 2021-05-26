// draw the hitflash
function drawFlash(){
	if (flash > 0) {
		flash--;
		shader_set(sh_hitFlash);
		draw_self();
		shader_reset();
	}
}

// draw the invincibility flash
function drawIFrame(){
	if (invincible > 0) {
		shader_set(sh_iFlash);
		draw_self();
		shader_reset();
	}
}