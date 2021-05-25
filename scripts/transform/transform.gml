// Script to transform between Verdali and Bonded form
function transform(object){
	var sound = audio_play_sound(choose(snd_Transform, snd_Transform2), 3, false);
	audio_sound_pitch(sound, choose(0.8, 1.2, 0.6));
	// transform from one form to another
	if (animationEnd()) {
		// play animation, then transfer control
		instance_create_layer(x, y - 1, "Player", object);
		obj_verdaliPlayer.hsp = self.hsp;
		obj_verdaliPlayer.image_xscale = self.image_xscale;
		instance_destroy(input);
		instance_destroy();
	}
}