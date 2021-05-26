/// @description Control the menu

menu_x += (menu_x_target - menu_x) / menu_speed;

if (menu_control) {
	if (keyboard_check_pressed(vk_up)) {
		menu_cursor++;
		
		if (menu_cursor >= menu_items) {
			menu_cursor = 0;
		}
	}
	if (keyboard_check_pressed(vk_down)) {
		menu_cursor--;
		
		if (menu_cursor < 0) {
			menu_cursor = menu_items - 1;
		}
	}
	
	if (keyboard_check_pressed(vk_enter)) {
		menu_x_target = gui_width + 500;
		menu_committed = menu_cursor;
		menu_control = false;
		audio_play_sound(snd_Pickup1, 10, false);
	}
}

if (menu_x > gui_width + 150 && menu_committed != -1) {
	switch (menu_committed) {
		case 2: default: // transition to main game
			instance_create_depth(x, y, -9999, obj_Fade);
			
			audio_sound_gain(snd_MenuBackground1, 0, 2000);
			if (audio_sound_get_gain(snd_MenuBackground1) <= 0) {
				audio_stop_sound(snd_MenuBackground1);
			}
			
			audio_play_sound(snd_Background1, 5, true);
			audio_sound_gain(snd_Background1, 0.5, 2000);
			room_goto(rm_Battleground1);
			break;
		case 1:
			instance_create_depth(x, y, -9999, obj_Fade);
			room_goto(rm_Controls);
			break;
		case 0:
			game_end();
			break;
	}
}