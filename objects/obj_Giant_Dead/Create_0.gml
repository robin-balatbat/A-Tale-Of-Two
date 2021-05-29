hsp = 0;
vsp = 0;
grv = 0.3;
done = 0;

image_speed = 0;
var track = audio_play_sound(choose(snd_GiantWalk1, snd_GiantWalk2), 1, false);
audio_sound_pitch(track, choose(1, 1.4, 1.2));

// spawn the closing dialog
global.scriptArray = [
[spr_Chaos_Icons, 5, "Poor souls."],
[spr_Verdali_Icons, 0, "What are these things?"],
[spr_Chaos_Icons, 5, "..."],
[spr_Verdali_Icons, 3, "..."],
[spr_Verdali_Icons, 0, "... The way forward is clear now."]
];

instance_create_layer(x, y, layer, obj_Dialog);