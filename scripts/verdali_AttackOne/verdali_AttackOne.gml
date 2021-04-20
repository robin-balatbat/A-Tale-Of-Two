// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function verdali_AttackOne(){

	hsp = 0;
	vsp = 0;
	
	var hitByAttackNow = ds_list_create();
	var hits = instance_place_list(x, y, obj_Enemy, hitByAttackNow, false);
	
	if (hits > 0) {
		for (var i = 0; i < hits; i++) {
			var hitID = hitByAttackNow[| i];
			
			if (ds_list_find_value(hitByAttackNow, hitID) == -1) {
				ds_list_add(hitByAttack, hitID);
				
				with(hitID) {
					// Damage enemy
				}
			}
		}
	}
	
	ds_list_destroy(hitByAttackNow);

}