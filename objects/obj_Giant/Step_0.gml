/// @description Movement

event_inherited();

// animations
#region animations

switch (state) {
	#region Attack1
	case "Attack1":
		changeSprite(0.2, spr_Giant_Attack1);
		// hitboxes
		if (animationHitFrame(3)) {
			makeHitBox(spr_Giant_Attack1_Mask, self, 3, 4, damage, image_xscale);
		}
		break;
	#endregion
	#region Attack2
	case "Attack2":
		changeSprite(0.2, spr_Giant_Attack2);
		// hitboxes
		if (animationHitFrame(2)) {
			makeHitBox(spr_Giant_Attack2_Mask, self, 3, 4, damage, image_xscale);
		}
		break;
	#endregion
	#region Attack3
	case "Attack3":
		changeSprite(0.2, spr_Giant_Attack3);
		// hitboxes
		if (animationHitFrame(2)) {
			makeHitBox(spr_Giant_Attack2_Mask, self, 3, 4, damage, image_xscale);
		}
		
		if (animationHitFrame(5)) {
			makeHitBox(spr_Giant_Attack2_Mask, self, 3, 4, damage, image_xscale);
		}
		break;
	#endregion
	#region Projectile
	case "Projectile":
		changeSprite(0.2, spr_Giant_Projectile);
		// hitboxes
		if (animationHitFrame(3)) {
			spawnProjectile(-64, -9, obj_Bond_Magic, self);
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