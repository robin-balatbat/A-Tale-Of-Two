/// @description If the corresponding object has been interacted with, play
// animation and win screen and destroy

// need to change such that object is destroyed once boss is defeated
if (!instance_exists(boss)) {
	//show_debug_message("Unlocked!");
	image_speed = 0.5;
	if (animationEnd()) {
		instance_destroy();
	}
} else {
	image_speed = 0;
}
