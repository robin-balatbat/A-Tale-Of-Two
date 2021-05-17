// Script to transform between Verdali and Bonded form
function transform(object){
	
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