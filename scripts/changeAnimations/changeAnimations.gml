// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function changeAnimations(){
	
	switch (global.current_state) {
		
		#region Verdali
		case PlayerState.Verdali:
			// jumping animation
			if (!onGround) {
				sprite_index = spr_Verdali_Air;
				image_speed = 0;
	
				// falling down
				if (sign(vsp) > 0) {
					image_index = 1;
				}
				// jumping up
				else {
					image_index = 0;
				}
			}
			// Attacking State
			else if (state == "Attack") {
				ds_list_clear(hitByAttack);
				verdali_AttackOne();
				mask_index = spr_V_Attack1_Mask;
				sprite_index = spr_Verdali_Attack1;
				image_speed = 0.6;
			}
			// Rolling animation
			else if (state == "Roll") {
				if (!place_meeting(x + rollSpeed, y, obj_testWall) && !place_meeting(x - rollSpeed, y, obj_testWall)) {
					x += image_xscale * rollSpeed;
					image_speed = 0.6;
					sprite_index = spr_Verdali_Roll;
				}
			}
			// transforming
			else if (state == "Transform") {
				image_speed = 0.3;
				sprite_index = spr_Verdali_Transform;
			}
			// on ground
			else {
				image_speed = 1;
				// idle
				if (hsp == 0) {
					sprite_index = spr_Verdali;
				}
				// walking
				else if (abs(hsp) > 0 && abs(hsp) <= 3) {
					sprite_index = spr_Verdali_Walk;
				}
				// running
				else {
					sprite_index = spr_Verdali_Run;
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
					image_speed = 0.6;
					sprite_index = spr_Bond_Dash;
				}
			}
			// jumping animation
			else if (!onGround) {
	
				sprite_index = spr_Bond_Air;
				image_speed = 0;
	
				// falling down
				if (sign(vsp) > 0) {
		
					image_index = 1;
				}
				// jumping up
				else {
					image_index = 0;
				}
			}
			// transforming
			else if (state == "Transform") {
				image_speed = 0.3;
				sprite_index = spr_Bond_Transform;
			}
			// on ground
			else {
				image_speed = 1;
				// idle
				if (hsp == 0) {
					sprite_index = spr_Bond_Idle;
				}
				// walking
				else if (abs(hsp) > 0 && abs(hsp) <= 3) {
					sprite_index = spr_Bond_Walk;
				}
				// running
				else {
					sprite_index = spr_Bond_Run;
				}

			}
			break;
			
		#endregion
			
	}

}