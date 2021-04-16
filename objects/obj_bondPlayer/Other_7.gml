/// @description Animation endings
if (state == "Transform") {
	// play animation, then transfer control
	instance_create_layer(x, y, "Instances", obj_verdaliPlayer);
	instance_destroy(input);
	instance_destroy();
}
