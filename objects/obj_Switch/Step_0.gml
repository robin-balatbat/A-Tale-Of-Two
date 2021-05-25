/// @description Check if player in range, then do something

/*
	if player has pressed the key
	within correct distance
	and the switch has not been interacted with,
	set interacted with = true
*/
if (input.key_interact && (distance_to_object(obj_Players) < radius)) {
	interactedWith = true;
	var track = audio_play_sound(choose(snd_Pickup2, snd_Pickup3), 3, false);
	audio_sound_pitch(track, choose(0.8, 1, 1.2));
}

// update sprite
if (interactedWith) {
	image_index = 1;
}
else {
	image_index = 0;
}