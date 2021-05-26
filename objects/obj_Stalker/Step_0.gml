/// @description Movement

event_inherited();

// animations
#region animations

switch (state) {
	#region Attack
	case "Attack":
		counter++;
		var audioControl = choose(0, 1);
		if (counter > room_speed * 5) {
			switch (audioControl) {
				case 0:
					counter = 0;
					break;
				case 1: 
					var track = audio_play_sound(choose(snd_Stalker1, snd_Stalker2, snd_Stalker3), 1, false);
					audio_sound_pitch(track, choose(0.8, 1, 1.2));
					counter = 0;
					break;
			}
		}
		
		changeSprite(1, spr_Stalker_Attack);
		// hitboxes
		if (animationHitFrame(5)) {
			makeHitBox(spr_Stalker_Attack_Mask, self, 3, 4, damage, image_xscale);
		}
		break;
	#endregion
	#region Hurt
	case "Hurt":
		knockback_state(spr_Stalker_Hurt, "Chase");
		break;
	#endregion
	#region Regular Movement
	default:
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
		break;
	#endregion
}

if (hsp != 0) {
	image_xscale = sign(hsp);
}

#endregion

