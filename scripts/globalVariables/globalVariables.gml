/// @description Holds global variables for the game, most importantly player stats

enum PlayerState {
	Verdali,
	Bond,
	Chaos
}
// global variables for all states
global.current_state = PlayerState.Verdali;

// Variables for Verdali state
global.verdali_maxHp = 25;
global.verdali_hp = global.verdali_maxHp;
//global.verdali_mp = 0;
//global.verdlai_maxMp = 50;

// Variables for Bond state
global.bond_maxHp = 50;
global.bond_hp = global.bond_maxHp;
//global.bond_mp = 0;
//global.bond_maxMp = 25;

// Variables for Chaos state
//global.chaos_hp = 10;
//global.chaos_maxHp = 10;
//global.chaos_mp = 30;
//global.chaos_maxMp = 30;
