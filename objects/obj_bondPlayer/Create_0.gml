/// @description Variables for Bond state movement

global.current_state = PlayerState.Bond;

// Getting input for player
input = instance_create_layer(0, 0, "Instances", obj_input);

// basic movement variables
moveSpeed = 3.5;
jumpSpeed = 15;

hsp = 0;
max_hsp = 7;
fric_val = 0.8;

vsp = 0;

// variables for dashing
mvtLocked = 0;
maxMvtLocked = 10;
dashSpeed = 10;
dashDuration = 0;

// stores current location on ground or wall
onGround = 0;
onWall = 0;

// state for movement animation
state = "Move";

// input buffering for jumping and wall jumping
jumpBuffer = 0;
jumpBufMax = 4;

// coyote time/edge tolerance
coyote_counter = 0;
coyote_max = 6;
jumped = true;

// projectile attack speed
projSpeed = 15;

// for getting hurt
flash = 0;
