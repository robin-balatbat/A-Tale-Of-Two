/// @description Death

if (hitPoints <= 0) {
	
	instance_create_layer(x, y - 10, layer, obj_Corruption);
	instance_destroy();
}