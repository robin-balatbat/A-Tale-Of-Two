/// @description Collision with a hitbox

with (other) {
	
	EnemyHit(damage, 3);
	other.image_xscale = sign(x);
	other.hitFrom = direction;
	
}
ds_list_add(other.hitObjects, object_get_parent(self));
instance_destroy(other);