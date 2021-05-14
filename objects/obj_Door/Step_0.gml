/// @description If the corresponding object has been interacted with, play
// animation and destroy
if (interactable.interactedWith) {
	//show_debug_message("Unlocked!");
	image_speed = 0.5;
	if (animationEnd()) {
		instance_destroy();
	}
} else {
	image_speed = 0;
}
