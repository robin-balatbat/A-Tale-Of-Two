/// @description Initialize variables

global.current_state = PlayerState.Chaos;
global.chaos_mp = global.chaos_maxMp;

// dependency for getting player input
// input object should already exist when Chaos is spawned
input = obj_input;

// movement variables
moveSpeed = 4;

// variables for returning back to main character
verdali_location = obj_verdaliPlayer;

returning = false;
return_speed = 5;
destroy_range = 10;

// magic attack
projSpeed = 30;