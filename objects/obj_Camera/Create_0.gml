/// @description Set up camera
cam = view_camera[0];
follow = obj_verdaliPlayer; // TODO, change based on global state
view_w_half = camera_get_view_width(cam) / 2;
view_h_half = camera_get_view_height(cam) / 2;
xTo = xstart;
yTo = ystart;
followSpeed = 10;
