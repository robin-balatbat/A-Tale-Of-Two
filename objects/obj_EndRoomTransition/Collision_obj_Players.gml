/// @description Insert description here
// You can write your code in this editor
if (!created) {
	var track = audio_play_sound(snd_Death, 1, false);
	audio_sound_pitch(track, choose(1, 1.4, 1.2));
	instance_create_depth(x, y, -9999, obj_GameComplete);
	created = true;
}