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

// update camera view
camera_set_view_pos(cam, x - view_w_half, y - view_h_half);
