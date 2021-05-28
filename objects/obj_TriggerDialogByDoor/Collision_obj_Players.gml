/// @description Trigger dialog when player is near
if (!instance_exists(door)) {
	instance_create_layer(x, y, layer, obj_Dialog);
	instance_destroy();
}