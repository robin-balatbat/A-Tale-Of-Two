/// @description Animation endings
if (state == "Transform") {
	// play animation, then transfer control
	instance_create_layer(x, y, "Player", obj_verdaliPlayer);
	instance_destroy(input);
	instance_destroy();
}
