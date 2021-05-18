/// @description Set up camera
if (!instance_exists(obj_verdaliPlayer)) {
	instance_create_layer(obj_Respawn.x, obj_Respawn.y, "Player", obj_verdaliPlayer);
}

cam = view_camera[0];
follow = obj_verdaliPlayer; // TODO, change based on global state
view_w_half = camera_get_view_width(cam) / 2;
view_h_half = camera_get_view_height(cam) / 2;
xTo = xstart;
yTo = ystart;
followSpeed = 10;

shake_length = 0;
shake_magnitude = 0;
shake_remain = 0;
buff = 32;
