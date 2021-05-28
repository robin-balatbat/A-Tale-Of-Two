// gets user input
function getInput(){
	
	// mapping alternative keys for horizontal input
	keyboard_set_map(ord("A"), vk_left);
	keyboard_set_map(ord("D"), vk_right);
	keyboard_set_map(ord("W"), vk_up);
	keyboard_set_map(ord("S"), vk_down);
	
	// get input
	key_left = keyboard_check(vk_left);
	key_right = keyboard_check(vk_right);
	key_up = keyboard_check(vk_up); // chaos only movement
	key_down = keyboard_check(vk_down); // chaos only movement
	key_jump = keyboard_check_pressed(vk_space) || key_up;
	key_dash = keyboard_check_pressed(vk_lshift) || mouse_check_button_pressed(mb_right); // also serves as Verdali's roll
	key_interact = keyboard_check_pressed(ord("E"));
	key_instruction = keyboard_check_pressed(ord("I"));
	// changing form between Verdali and Bond is independent to each object

	// need melee attack and magic attack
	
	// magic attack
	key_magic = keyboard_check_pressed(ord("Q"));
	
	// melee attack
	key_attack = keyboard_check_pressed(ord("F")) || mouse_check_button_pressed(mb_left);

	// use the recovery item
	key_recover = keyboard_check_pressed(ord("R"));
}