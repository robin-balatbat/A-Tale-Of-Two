hsp = 0;
vsp = 0;
grv = 0.3;
done = 0;

image_speed = 0;
var track = audio_play_sound(choose(snd_GiantWalk1, snd_GiantWalk2), 1, false);
audio_sound_pitch(track, choose(1, 1.4, 1.2));