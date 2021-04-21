// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function makeHitBox(startIndex, endIndex, spriteToUse){
	if ((image_index >= startIndex) && (image_index <= endIndex)) {
		hitbox = instance_create_layer(x, y, "Hitbox", spriteToUse);
		with (hitbox) {
			image_xscale = other.image_xscale;
							
		}
	}
}