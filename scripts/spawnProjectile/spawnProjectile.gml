// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function spawnProjectile(xOffset, yOffset, objToSpawn){
	with (instance_create_layer(x + xOffset, y - yOffset, "Projectiles", objToSpawn)) {
		image_xscale = other.image_xscale;
		hspeed = other.projSpeed * image_xscale;
	}
}