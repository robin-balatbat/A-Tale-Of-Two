/// @description Menu Setup

audio_play_sound(snd_MenuBackground1, 10, true);

// Menu

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();
gui_margin = 210;

menu_x = gui_width;
menu_y = gui_height - gui_margin * 0.5;
menu_x_target = gui_width - gui_margin;
menu_speed = 25;
menu_font = Main_Font1;
menu_itemheight = font_get_size(Main_Font1);

menu_committed = -1;
menu_control = true;

menu[2] = "Start Game";
menu[1] = "Controls";
menu[0] = "Quit";

menu_items = array_length(menu);
menu_cursor = 2;