/// @description Initialize

position_bar_y = display_get_gui_height();
position_bar_y_end = position_bar_y - 200;

canDisplayText = false;

character_index = 0;
is_waiting_for_keypress = false;



dialog_create(global.scriptArray);
