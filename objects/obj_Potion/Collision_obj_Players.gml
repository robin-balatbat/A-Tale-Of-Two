/// @description Insert description here
// You can write your code in this editor
audio_play_sound(choose(snd_Pickup1, snd_Pickup2, snd_Pickup3), 5, false);
global.recoverCount++;
instance_destroy();