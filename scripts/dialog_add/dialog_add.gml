// Add lines to the dialogue scene
function dialog_add(picture, sIndex, message){
	if (global.dialog_index == -1) {
		global.dialog_index = 0;
	}
	else {
		global.dialog_index++;
	}
	
	global.dialog_messages[global.dialog_index, DIALOG.PICTURE] = picture;
	global.dialog_messages[global.dialog_index, DIALOG.SINDEX] = sIndex;
	global.dialog_messages[global.dialog_index, DIALOG.MESSAGE] = message;
}

// reset the global dialog
function dialog_cleanup() {
	global.dialog_messages = -1;
	global.dialog_index = -1;
}

// returns the height of the array
function dialog_count() {
	return array_length(global.dialog_messages);
}

// check if there's no more dialog to display
function dialog_end() {
	return dialog_count() <= global.dialog_index;
}

// enums for dialog
enum DIALOG {
	PICTURE,
	SINDEX,
	MESSAGE
}

// get the sprite to use
function dialog_get_picture() {
	return global.dialog_messages[global.dialog_index, DIALOG.PICTURE];
}

// get the sprite index to use
function dialog_get_sindex() {
	return global.dialog_messages[global.dialog_index, DIALOG.SINDEX];
}

// get the text to display
function dialog_get_message() {
	return global.dialog_messages[global.dialog_index, DIALOG.MESSAGE];
}

// initialize the dialog messages
function dialog_init() {
	global.dialog_messages = -1;
	global.dialog_index = -1;
}

// increment the index
function dialog_next() {
	global.dialog_index++;
}

// reset the index to the start
function dialog_reset() {
	global.dialog_index = 0;
}

// reset the color and alpha
function draw_reset() {
	draw_set_alpha(1);
	draw_set_color(c_white);
}

// set the color and alpha
function draw_set(colorVal, alphaVal) {
	draw_set_color(colorVal);
	draw_set_alpha(alphaVal);
}

function draw_set_align(halignVar, valignVar) {
	draw_set_halign(halignVar);
	draw_set_valign(valignVar);
}