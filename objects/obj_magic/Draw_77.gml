/// @description Handle collisions with walls

if (place_meeting(x, y, obj_testWall)) {
	audio_play_sound(choose(snd_Hit_Hurt1, snd_Hit_Hurt2, snd_Hit_Hurt3), 10, false);
	instance_destroy();
}
