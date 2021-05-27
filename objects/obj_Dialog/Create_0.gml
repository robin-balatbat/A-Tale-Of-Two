/// @description Initialize

position_bar_y = display_get_gui_height();
position_bar_y_end = position_bar_y - 200;

canDisplayText = false;

character_index = 0;
is_waiting_for_keypress = false;

dialog_init();

dialog_add(spr_Verdali_Icons, 0, "Hello!");
dialog_add(spr_Chaos_Icons, 2, "This is a test!");
dialog_add(spr_Chaos_Icons, 5, "Hee hoo");
dialog_add(spr_Verdali_Icons, 3, "Alright, let's go");

dialog_reset();
