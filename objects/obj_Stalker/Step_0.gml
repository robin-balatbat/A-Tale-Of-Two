/// @description Movement

event_inherited();

// animations
#region animations
if (!onGround) {
	// air animations
	changeSprite(0, spr_Stalker_Air);
				
	// falling down
	if (sign(vsp) > 0) {
		image_index = 1;
	}
	// jumping up
	else {
		image_index = 0;
					
	}
} else {
	if (hsp == 0) {
		changeSprite(1, spr_Stalker_Idle);
	} else {
		changeSprite(1, spr_Stalker_Run);
	}
}

if (hsp != 0) {
	image_xscale = sign(hsp);
}

#endregion

