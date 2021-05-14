/// @description Check if player in range, then do something

/*
	if player has pressed the key
	within correct distance
	and the switch has not been interacted with,
	set interacted with = true
*/
if (input.key_interact && (distance_to_object(obj_Players) < radius)) {
	interactedWith = true;
}

// update sprite
if (interactedWith) {
	image_index = 1;
}
else {
	image_index = 0;
}