// Spawns a projectile for attacking
function spawnProjectile(xOffset, yOffset, objToSpawn, identifier){
	with (instance_create_layer(x + xOffset, y - yOffset, "Projectiles", objToSpawn)) {
		image_xscale = other.image_xscale;
		hspeed = other.projSpeed * image_xscale;
		creator = identifier;
	}
}