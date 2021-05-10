/// @description Initialize variables

// set corruption layer visible
corruption_layer = layer_get_id("Corruption");
layer_set_visible(corruption_layer, true);

// set proper variables
global.current_state = PlayerState.Chaos;
global.chaos_mp = global.chaos_maxMp;
global.chaos_hp = global.chaos_maxHp;

// dependency for getting player input
// input object should already exist when Chaos is spawned
input = obj_input;

// movement variables
moveSpeed = 4;
moveX = 0;
moveY = 0;
hDir = 0;
vDir = 0;
dir = 0;

// variables for returning back to main character
verdali_location = obj_verdaliPlayer;

returning = false;
return_speed = 5;
destroy_range = 10;

// magic attack
projSpeed = 30;

// flashing for hit
flash = 0;