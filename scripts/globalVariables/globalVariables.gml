/// @description Holds global variables for the game, most importantly player stats

enum PlayerState {
	Verdali,
	Bond,
	Chaos,
	Dead
}
// global variables for all states
global.current_state = PlayerState.Verdali;

// Variables for Verdali state
global.verdali_maxHp = 25;
global.verdali_hp = global.verdali_maxHp;
global.verdali_maxMp = 50;
global.verdali_mp = global.verdali_maxMp;
global.verdali_damageNum = 5;

// Variables for Bond state
global.bond_maxHp = 50;
global.bond_hp = global.bond_maxHp;
global.bond_maxMp = 25;
global.bond_mp = global.bond_maxMp;
global.bond_damageNum = global.verdali_damageNum * 2;

// Variables for Chaos state
global.chaos_hp = 10;
global.chaos_maxHp = 10;

global.chaos_maxMp = 30;
global.chaos_mp = global.chaos_maxMp;
