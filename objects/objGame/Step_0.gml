

// timer related
if game_started {
	if (counter mod SECOND_LENGTH == 0 && counter > 0) && game_timer > 0{
		on_second()
	}
}
counter ++




function on_second() 
{
	game_timer --
	if (game_timer <= 15) audio_play_sound(sndClick,10,0)
	
	if game_timer == 0 {
		stop_game()
	}
	if (120 - game_timer) % fruit_interval == 1 {
		spawn_fruit(objGame.fruit_order[fruit_id])
		fruit_id ++
	}
}



if keyboard_check_pressed(vk_control) && !game_started {
	start_game()
}

if keyboard_check_pressed(ord("1")) {
	selected_player = 0
}
if keyboard_check_pressed(ord("2")) {
	selected_player = 1
}
if keyboard_check_pressed(ord("3")) {
	selected_player = 2
}
if keyboard_check_pressed(ord("4")) {
	selected_player = 3
}