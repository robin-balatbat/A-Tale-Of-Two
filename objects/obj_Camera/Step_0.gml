/// @description Camera step event

switch (global.current_state) {
	
	case PlayerState.Verdali:
		follow = obj_verdaliPlayer;
		break;
		
	case PlayerState.Bond:
		follow = obj_bondPlayer;
		break;
		
	case PlayerState.Chaos:
		follow = obj_chaosPlayer;
		break;
}

// update destination
if (instance_exists(follow)) {
	xTo = follow.x;
	yTo = follow.y;
}

// update camera object position
x += (xTo - x) / followSpeed;
y += (yTo - y) / followSpeed;

// Keep camera inside room
x = clamp(x, view_w_half + buff, room_width - view_w_half - buff);
y = clamp(y, view_h_half + buff, room_height - view_h_half - buff);

// Camera shaking
x += random_range(-shake_remain, shake_remain);
y += random_range(-shake_remain, shake_remain);

shake_remain = max(0, shake_remain - ((1 / shake_length) * shake_magnitude));

// update camera view
camera_set_view_pos(cam, x - view_w_half, y - view_h_half);

// Parallax Effect
if (layer_exists("Hill")) {
	layer_x("Hill", x/3);
}
if (layer_exists("Foreground_Hill")) {
	layer_x("Foreground_Hill", x/2);
}
if (layer_exists("Sky")) {
	layer_x("Sky", x/5);
}
if (layer_exists("Mountain")) {
	layer_x("Mountain", x/4);
}
