/// @description Ending of animations and part of state machine

switch (state) {

	case "Roll":
		if (onGround) {
			state = "Move"
			image_index = 0;
		}	
		break;
	
	case "Transform":
		show_debug_message("Attempted form change!");
		instance_create_layer(x, y, "Player", obj_bondPlayer);
		obj_bondPlayer.hsp = self.hsp;
		obj_bondPlayer.image_xscale = self.image_xscale;
		instance_destroy(input);
		instance_destroy();
		break;
		
	case "Attack":
		mask_index = spr_Verdali_Mask;
		state = "Move";
		image_index = 0;
		break;

}
