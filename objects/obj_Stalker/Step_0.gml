/// @description Movement

event_inherited();

// animations
#region animations

if (!onGround) {
	// air animations
}
else {
	if (hsp == 0) {
		changeSprite(1, spr_Stalker_Idle);
	}
	else {
		changeSprite(1, spr_Stalker_Run);
	}
}

#endregion

