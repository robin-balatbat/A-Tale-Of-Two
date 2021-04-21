// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function makeHitBox(startIndex, endIndex, spriteToUse, identifier, knockbackNum, lifespan, damageNum, xDir){
	if ((image_index >= startIndex) && (image_index <= endIndex)) {
		hitbox = instance_create_layer(x, y, "Hitbox", obj_hitBoxes);
		with (hitbox) {
			sprite_index = spriteToUse;
			image_xscale = xDir;
			creator = identifier;
			alarm[0] = lifespan;
			damage = damageNum;
			knockback = knockbackNum
		}
	}
}