show_debug_message(score_totals)
show_debug_message(score_types)
show_debug_message(fruit_amounts)


//score totals
draw_self()
draw_set_color(c_grey)


var y_offset = 30

for (var i = 0; i < 4; i += 1) {
	
	draw_text(121, y_offset, score_totals[i])
	y_offset +=24
}

y_offset = 41
var x_offset = 40

var max_per_row = 12

for (var p = 0; p < 4; p += 1) {
	
	draw_set_color(c_grey)	
	
	
	if fruit_amounts[p] > 0 {
		for (var k = 0; k < fruit_amounts[p]; k+= 1) {
			if k < max_per_row {
				draw_sprite(sprScoreboardLetters,score_types[p][k],x_offset+k*8,y_offset)
			} else {
				draw_sprite(sprScoreboardLetters,score_types[p][k],x_offset+(k-max_per_row)*8,y_offset+8)
			}
		}
	}
	y_offset +=24
}