/// @description Animation endings
// transition back to moving state once dash ends
switch (state) {
	
	case "Dash":
		state = "Move";
		image_index = 0;
		break;
		
	case "Transform":
		// play animation, then transfer control
		instance_create_layer(x, y, "Player", obj_verdaliPlayer);
		instance_destroy(input);
		instance_destroy();
		break;
}
