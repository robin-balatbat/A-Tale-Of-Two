/// @description Check if player in range, then do something

/*
	if player has pressed the key
	within correct distance
	and the switch has not been interacted with,
	set interacted with = true
*/
if (input.key_interact && (distance_to_object(obj_Players) < radius) && !interactedWith) {
	interactedWith = true;
	show_debug_message("Interacted with!");
}