/// @description Animation endings
// transition back to moving state once dash ends
if (state == "Dash") {
	state = "Move";
	image_index = 0;
}
// transforming back to Verdali
if (state == "Transform") {
	// play animation, then transfer control
	instance_create_layer(x, y, "Player", obj_verdaliPlayer);
	instance_destroy(input);
	instance_destroy();
}
