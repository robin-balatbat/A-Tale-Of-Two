hsp = 0;
vsp = 0;
grv = 0.3;
done = 0;

global.current_state = PlayerState.Dead;
input = instance_create_layer(x, y, layer, obj_input);
audio_sound_pitch(snd_Death, choose(0.6, 0.8, 1));
audio_play_sound(snd_Death, 10, false);
