/// @description Camera step event
show_debug_message(global.current_state);

// get current object to follow
if (global.current_state == PlayerState.Verdali && !instance_exists(obj_chaosPlayer)) {
	follow = obj_verdaliPlayer;
}
else if (global.current_state == PlayerState.Bond) {
	follow = obj_bondPlayer;
}
else {
	follow = obj_chaosPlayer;
}

// update destination
if (instance_exists(follow)) {
	fname = object_get_name(follow.object_index);
	show_debug_message(fname);
	xTo = follow.x;
	yTo = follow.y;
}

// update camera object position
x += (xTo - x) / followSpeed;
y += (yTo - y) / followSpeed;

// update camera view
camera_set_view_pos(cam, x - view_w_half, y - view_h_half);
