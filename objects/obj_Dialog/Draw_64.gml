/// @description Insert description here
// You can write your code in this editor

draw_set(c_black, 0.5);

draw_rectangle(0, display_get_gui_height(), display_get_gui_width(), position_bar_y, false);

draw_reset();

if (canDisplayText) {
	draw_set_align(fa_center, fa_middle);
	
	draw_sprite(dialog_get_picture(), dialog_get_sindex(), 64, display_get_gui_height() - 200);
	
	var text = dialog_get_message();
	var char = string_copy(text, 0, character_index);
	
	draw_text(display_get_gui_width() / 2, display_get_gui_height() - 100, char);
	
	if (is_waiting_for_keypress) {
		draw_set_align(fa_left, fa_middle);
		char = "Press Enter";
		var text_length = string_width(char);
		draw_text_transformed(display_get_gui_width() - text_length, display_get_gui_height() - 20, char, 0.75, 0.75, 0);
	}
}