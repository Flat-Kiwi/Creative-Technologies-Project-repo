count++

if (score_total < 0) score_total = 0


if objGame.game_started {
	is_selected_player = (objGame.selected_player == player_id)
	if is_selected_player {
		if keyboard_check_pressed(vk_up) {
			make_move(directions.up)
		}
		if keyboard_check_pressed(vk_down) {
			make_move(directions.down)
		}
		
		if keyboard_check_pressed(vk_left) {
			make_move(directions.left)
		}
		if keyboard_check_pressed(vk_right) {
			make_move(directions.right)
		}
		if keyboard_check_pressed(vk_space) && has_bomb {
			place_bomb()
		}
	}
} else {
		if (count % 25 == 0) draw_player_text = not draw_player_text
}



var onepixel = sign(hsp) 
if (place_meeting(x+hsp,y,objWall))
{
    //move as close as we can
    while (!place_meeting(x+onepixel,y,objWall))
    {
        x = x + onepixel;
    }
    hsp = 0;
	if (!audio_is_playing(sndBoom))
	{
	   audio_play_sound(sndCollision,0,0)
	}
	audio_stop_sound(sndMove) 
}
x = x + hsp;


var onepixel = sign(vsp) 
if (place_meeting(x,y+vsp,objWall))
{
    
    while (!place_meeting(x,y+onepixel,objWall))
    {
        y = y + onepixel;
    }
    vsp = 0;
	if (!audio_is_playing(sndBoom))
	{
	   audio_play_sound(sndCollision,0,0)
	}
	audio_stop_sound(sndMove)
}
y = y + vsp;

if (bomb_cooldown > 0) bomb_cooldown--

if (x > room_width - 8) {
	x = 0
	audio_play_sound(sndWarp,0,0)	
}
if (x < 0) {
	x = room_width - 8 
	audio_play_sound(sndWarp,0,0)
}

hsp = 0
vsp = 0

objGame.scores[player_id] = score_total
objGame.fruit_amounts[player_id] = fruit_amount
objGame.fruit_types[player_id] = score_types