score_total = 0
count = 0
tile_size = 8
score_types = []
draw_player_text = true
objGame.players[player_id] = self
is_selected_player = false
hsp = 0
vsp = 0
has_bomb = false
bomb_cooldown = 0
fruit_amount = 0

player_colours = [c_fuchsia, c_lime, c_yellow, c_aqua]

directions = {
	up    : [0,-1],
	down  : [0, 1],
	left  : [-1,0],
	right : [1, 0],
}




function make_move(dir) {
	if not place_meeting(x+dir[0]*tile_size,y+dir[1]*tile_size,objPlayer) {
		hsp = dir[0]*tile_size
		vsp = dir[1]*tile_size
		audio_play_sound(sndMove,0,0,1,0,random_range(0.9,1.1))
	} else {
		audio_play_sound(sndCollision,0,0,0.5,0,random_range(0.9,1.1))
	}
}

function place_bomb() {
	var new_bomb = instance_create_layer(x,y,"Instances",objBomb)
	has_bomb = false
	audio_play_sound(sndPlaceBomb,0,0,1,0,random_range(0.9,1.1))
}