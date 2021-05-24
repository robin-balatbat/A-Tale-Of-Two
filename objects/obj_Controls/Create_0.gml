/// @description Menu Setup

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();
gui_margin = 32;

menu_x = gui_width;
menu_y = gui_height - gui_margin;
menu_x_target = gui_width - gui_margin;
menu_speed = 25;
menu_font = Main_Font1;
menu_itemheight = font_get_size(Main_Font1);

menu_committed = -1;
menu_control = true;

menu[0] = "Return to Menu";

menu_items = array_length(menu);
menu_cursor = 1;