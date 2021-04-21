// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function EnemyHit(damage, flash_num){
	
	other.hitPoints -= damage;
	other.flash = flash_num;
	
}