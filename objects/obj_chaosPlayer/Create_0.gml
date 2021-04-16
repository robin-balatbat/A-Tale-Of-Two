/// @description Initialize variables

global.current_state = PlayerState.Chaos;

// dependency for getting player input
// input object should already exist when Chaos is spawned
input = instance_nearest(x, y, obj_input);

// movement variables
moveSpeed = 4;

// variables for returning back to main character
verdali_location = instance_nearest(x, y, obj_verdaliPlayer);

returning = false;
return_speed = 5;
destroy_range = 10;