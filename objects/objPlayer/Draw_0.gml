

if has_bomb {
	draw_sprite(sprFruits,6,x,y-8)
}


if (bomb_cooldown == 0 ) or (bomb_cooldown > 0 and count % 2 == 0) {
	if is_selected_player and objGame.game_started {
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);
	
	} else {
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, player_colours[player_id], image_alpha);
	
	}
}
if not objGame.game_started {
	draw_set_font(fntTimes)
	draw_set_color(c_black)
	draw_rectangle(x-6, y-12, x+12, y-3, false);
	draw_set_color(player_colours[player_id])
	if draw_player_text {
		draw_text(x-4,y-12,string("P{0}",player_id+1))
	}
	draw_set_color(c_white)
}

