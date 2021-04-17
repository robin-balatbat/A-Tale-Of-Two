/// @description Ending of animations and part of state machine
if (state == "Roll" && onGround) {
	state = "Move";
	image_index = 0;
}
// changing form, transfer controls to Bond
if (state == "Transform") {
	show_debug_message("Attempted form change!");
	instance_create_layer(x, y, "Player", obj_bondPlayer);
	instance_destroy(input);
	instance_destroy();
}
