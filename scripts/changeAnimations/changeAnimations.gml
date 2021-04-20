// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function changeAnimations(){
	
	switch (global.current_state) {
		
		#region Verdali
		case PlayerState.Verdali:
			// Jumping
			if (!onGround) {
				
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
			// attacking
			else if (state == "Attack") {
				ds_list_clear(hitByAttack);
				verdali_AttackOne();
				mask_index = spr_V_Attack1_Mask;
				changeSprite(0.6, spr_Verdali_Attack1);
				
			}
			// Rolling animation
			else if (state == "Roll") {
				if (!place_meeting(x + rollSpeed, y, obj_testWall) && !place_meeting(x - rollSpeed, y, obj_testWall)) {
					x += image_xscale * rollSpeed;
					changeSprite(0.6, spr_Verdali_Roll);
				}
			}
			// transforming
			else if (state == "Transform") {
				changeSprite(0.3, spr_Verdali_Transform);
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
			}
			// jumping animation
			else if (!onGround) {
				
				if (onWall != 0) {
					changeSprite(1, spr_Bond_Wall);
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