/// @description Send player to next room
other.hsp = 0;
other.vsp = 0;
alarm[0] = 5;
var track = audio_play_sound(snd_Death, 1, false);
audio_sound_pitch(track, choose(1, 1.4, 1.2));
instance_create_depth(x, y, -9999, obj_Fade);
