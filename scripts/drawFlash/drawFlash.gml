// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function drawFlash(){
	if (flash > 0) {
		flash--;
		shader_set(sh_hitFlash);
		draw_self();
		shader_reset();
	}
}