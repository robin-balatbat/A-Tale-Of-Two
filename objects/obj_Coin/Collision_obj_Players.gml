/// @description Increment coin amount
global.coins++;
audio_play_sound(choose(snd_Pickup1, snd_Pickup2, snd_Pickup3), 5, false);
instance_destroy();
