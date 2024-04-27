// BACKGROUND
draw_sprite(sprHudBG,0,0,0)


// TIMER

var minutes = game_timer div 60

var seconds = game_timer mod 60
seconds = string_replace_all(string_format(seconds, 2, 0), " ", "0")

var formatted_timer = string("{0}:{1}",minutes,seconds)

draw_set_font(fntTimes)
if (game_timer <= 15) draw_set_color(c_red);
draw_text(time_offset_x,time_offset_y,formatted_timer)


// SCORES



for (var i = 0; i < 4; i += 1) {
	draw_set_color(c_grey)
	var offset_x = 48 
	if (i > 1) offset_x = 96
	var offset_y = 0 + ((i mod 2)*8) - 1
	//if (i > 2) offset_y = 
	var formattedScore = ""
	if scores[i] < 100 {
		formattedScore = string_replace_all(string_format(scores[i], 2, 0), " ", "0")
		
	} else {
		// start displaying as hex so that it never shows more than 2 characters. advanced
		formattedScore = dec_to_hex(scores[i])
		draw_set_color(c_yellow)
	}
	draw_text(offset_x,offset_y,formattedScore)
}

// aaaaaaaaaaaaaaaaaaaaaaaaa

max_per_row = 10


// left side scores

for (var i = 0; i < 2; i+= 1) {
	var offset_x = 9
	if (i > 1) offset_x = room_width-8
	var offset_y = 3 + ((i mod 2)*8) - 1
	
	var local_list = []
	sReplaceArrayByCopy(local_list,fruit_types)
	
	while array_length(local_list[i]) > max_per_row {
		array_shift(local_list[i])
	}
	for (var k = 0; k < fruit_amounts[i]; k+= 1) {
		if k < max_per_row {
			draw_sprite(sprScoreLetters,local_list[i][k],offset_x+k*4,offset_y)
		}
	}
	
}

// right side

for (var i = 2; i < 4; i+= 1) {
	
	
	var offset_y = 3 + ((i mod 2)*8) - 1
	
	var local_list = []
	sReplaceArrayByCopy(local_list,fruit_types)
	
	
	while (array_length(local_list[i]) > max_per_row) {
		array_shift(local_list[i])
	}
	show_debug_message(fruit_types)
	show_debug_message(local_list)
	var offset_x = room_width-8 - (4*array_length(local_list[i]))
	
	for (var k = 0; k < fruit_amounts[i]; k+= 1) {
		if k < max_per_row {
			draw_sprite(sprScoreLetters,local_list[i][k],offset_x+k*4,offset_y)
		}
	}
	
}



draw_set_color(c_black)
draw_rectangle(0,room_height-6,120,room_height,false)
draw_set_color(objPlayer.player_colours[selected_player])
draw_text(0,room_height-10,string("Controlling P{0}",selected_player+1))

draw_set_color(c_white)