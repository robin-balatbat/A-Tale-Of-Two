/// @description Movement

event_inherited();

// animations
#region animations

switch (state) {
	#region Attack1
	case "Attack1":
		counter++;
		var audioControl = choose(0, 1);
		if (counter > room_speed * 5) {
			switch (audioControl) {
				case 0:
					counter = 0;
					break;
				case 1: 
					var track = audio_play_sound(choose(snd_GiantWalk1, snd_GiantWalk2), 1, false);
					audio_sound_pitch(track, choose(0.8, 1, 1.2));
					counter = 0;
					break;
			}
		}
		
		changeSprite(0.2, spr_Giant_Attack1);
		// hitboxes
		if (animationHitFrame(3)) {
			makeHitBox(spr_Giant_Attack1_Mask, self, 3, 4, damage, image_xscale);
		}
		break;
	#endregion
	#region Attack2
	case "Attack2":
		counter++;
		var audioControl = choose(0, 1);
		if (counter > room_speed * 5) {
			switch (audioControl) {
				case 0:
					counter = 0;
					break;
				case 1: 
					var track = audio_play_sound(choose(snd_GiantWalk1, snd_GiantWalk2), 1, false);
					audio_sound_pitch(track, choose(0.8, 1, 1.2));
					counter = 0;
					break;
			}
		}

		changeSprite(0.2, spr_Giant_Attack2);
		// hitboxes
		if (animationHitFrame(2)) {
			makeHitBox(spr_Giant_Attack2_Mask, self, 6, 4, damage, image_xscale);
		}
		break;
	#endregion
	#region Attack3
	case "Attack3":
		counter++;
		var audioControl = choose(0, 1);
		if (counter > room_speed * 5) {
			switch (audioControl) {
				case 0:
					counter = 0;
					break;
				case 1: 
					var track = audio_play_sound(choose(snd_GiantWalk1, snd_GiantWalk2), 1, false);
					audio_sound_pitch(track, choose(0.8, 1, 1.2));
					counter = 0;
					break;
			}
		}
		changeSprite(0.2, spr_Giant_Attack3);
		// hitboxes
		if (animationHitFrame(2)) {
			makeHitBox(spr_Giant_Attack2_Mask, self, 1, 4, damage, image_xscale);
		}
		
		if (animationHitFrame(5)) {
			makeHitBox(spr_Giant_Attack1_Mask, self, 5, 4, damage, image_xscale);
		}
		break;
	#endregion
	#region Projectile
	case "Projectile":
		counter++;
		var audioControl = choose(0, 1);
		if (counter > room_speed * 5) {
			switch (audioControl) {
				case 0:
					counter = 0;
					break;
				case 1: 
					var track = audio_play_sound(choose(snd_GiantWalk1, snd_GiantWalk2), 1, false);
					audio_sound_pitch(track, choose(0.8, 1, 1.2));
					counter = 0;
					break;
			}
		}
		
		changeSprite(0.2, spr_Giant_Projectile);
		// hitboxes
		if (animationHitFrame(3)) {
			if (image_xscale == 1) {
				spawnProjectile(85, 9, obj_Giant_Magic, self);
			} else if (image_xscale == -1) {
				spawnProjectile(-85, 9, obj_Giant_Magic, self);
			}
			
		}
		break;
	#endregion
	#region Hurt
	case "Hurt":
		knockback_state(spr_Giant_Hurt, "Chase");
		break;
	#endregion
	#region Regular Movement
	default:
		if (hsp == 0) {
			changeSprite(0.2, spr_Giant_Idle);
		} else {
			changeSprite(0.2, spr_Giant_Move);
		}
		break;
	#endregion
}

if (hsp != 0) {
	image_xscale = sign(hsp);
}

#endregion