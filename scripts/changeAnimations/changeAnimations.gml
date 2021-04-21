// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function changeAnimations(identifier){
	
	switch (global.current_state) {
		
		#region Verdali
		case PlayerState.Verdali:
			// Jumping
			if (!onGround) {
				
				// mid-air attacking
				if (state == "Attack") {
					vsp = 0;
					mask_index = spr_V_Attack1_Mask;
					changeSprite(0.7, spr_Verdali_Attack1);
					makeHitBox(1, 3, obj_V_Attack1_hitBox, identifier);
					
					if (animationEnd()) {
						mask_index = spr_Verdali_Mask;
						state = "Move";
						image_index = 0;
					}
					
				}
				// mid-air transform
				else if (state == "Transform") {
					vsp = 0;
					changeSprite(0.7, spr_Verdali_Transform);
					transform(obj_bondPlayer);
				}
				// normal jumping
				else {
					changeSprite(0, spr_Verdali_Air);
				
					// falling down
					if (sign(vsp) > 0) {
						image_index = 1;
					}
					// jumping up
					else {
						image_index = 0;
					
					}
				}
				
			}
			// attacking while on ground
			else if (state == "Attack") {
				mask_index = spr_V_Attack1_Mask;
				changeSprite(0.7, spr_Verdali_Attack1);
				// hitboxes
				makeHitBox(1, 3, obj_V_Attack1_hitBox, self);
				
				if (animationEnd()) {
					mask_index = spr_Verdali_Mask;
					state = "Move";
					image_index = 0;
				}
				
			}
			// Rolling animation
			else if (state == "Roll") {
				if (!place_meeting(x + rollSpeed, y, obj_testWall) && !place_meeting(x - rollSpeed, y, obj_testWall)) {
					x += image_xscale * rollSpeed;
					changeSprite(0.6, spr_Verdali_Roll);
				}
				if (animationEnd()) {
					state = "Move";
				}
			}
			// transforming
			else if (state == "Transform") {
				changeSprite(0.3, spr_Verdali_Transform);
				transform(obj_bondPlayer);
			}
			// on ground
			else {
				// idle
				if (hsp == 0) {
					changeSprite(1, spr_Verdali);
				}
				// walking
				else if (abs(hsp) > 0 && abs(hsp) <= 3) {
					changeSprite(1, spr_Verdali_Walk);
				}
				// running
				else {
					changeSprite(1, spr_Verdali_Run);
				}

			}
			break;
		
		#endregion
		
		#region Bond
		case PlayerState.Bond:
			// Dashinging animation
			if (state == "Dash") {
				if (!place_meeting(x + dashSpeed, y, obj_testWall) && !place_meeting(x - dashSpeed, y, obj_testWall)) {
					x += image_xscale * dashSpeed;
					changeSprite(0.6, spr_Bond_Dash);
					
				}
				
				if (animationEnd()) {
					state = "Move";
					image_index = 0;
				}
			}
			// jumping animation
			else if (!onGround) {
				
				if (onWall != 0) {
					changeSprite(1, spr_Bond_Wall);
				}
				// mid-air attacking
				else if (state == "Attack") {
					vsp = 0;
					mask_index = spr_V_Attack1_Mask;
					changeSprite(0.6, spr_Verdali_Attack1);
				}
				// mid-air transform
				else if (state == "Transform") {
					vsp = 0;
					changeSprite(0.7, spr_Bond_Transform);
					transform(obj_verdaliPlayer);
				}
				else {
					changeSprite(0, spr_Bond_Air);
	
					// falling down
					if (sign(vsp) > 0) {
						image_index = 1;
					}
					// jumping up
					else {
						image_index = 0;
					}
				}
	
				
			}
			// transforming
			else if (state == "Transform") {
				changeSprite(0.3, spr_Bond_Transform);
				transform(obj_verdaliPlayer);
			}
			// on ground
			else {
				// idle
				if (hsp == 0) {
					changeSprite(1, spr_Bond_Idle);
				}
				// walking
				else if (abs(hsp) > 0 && abs(hsp) <= 3) {
					changeSprite(1, spr_Bond_Walk);
				}
				// running
				else {
					changeSprite(1, spr_Bond_Run);
				}

			}
			break;
			
		#endregion
			
	}

}