
/// @description Variables for Bond state movement

global.current_state = PlayerState.Verdali;

// dependency for getting player input
input = instance_create_layer(0, 0, "Instances", obj_input);

// basic movement variables
moveSpeed = 3;
jumpSpeed = 14;

hsp = 0;
max_hsp = 6;
fric_val = 0.8;

vsp = 0;

// variables for dashing
mvtLocked = 0;
dashDuration = 0;

// rolling variables
rollSpeed = 3;
state = "Move"; // keeps track of current state

// stores current location on ground or wall
onGround = 0;
onWall = 0;

// input buffering for jumping and wall jumping
jumpBuffer = 0;
jumpBufMax = 4;

// coyote time/edge tolerance
coyote_counter = 0;
coyote_max = 6;
jumped = true;

// handling when Chaos is spawned
chaosSpawned = false;

// projectile speed
projSpeed = 25;