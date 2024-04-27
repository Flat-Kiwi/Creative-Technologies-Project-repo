/*
P1
	AOBBGP
P2
	SAG!PS
P3
	GBOSAS
P4	
	SGBGOA

Fruit spawn order:
	G S S A G A O B G O B G B P S O B A G S S A P
*/

randomize()
fruit_interval = 5
max_time = 120
game_timer = max_time
game_started = false
counter = 0
game_started = false
surface_resize(application_surface, 160, 144)
fruit_id = 0
time_offset_x = 64
time_offset_y = 4
players = []
fruit_amounts = []
fruit_types = []
scores = [30,22,40,90]

#macro SECOND_LENGTH 80

// debug
selected_player = 0

// fruit sequence
var G = 0
var S = 1
var A = 2
var B = 3
var O = 4
var P = 5
var b = 6

fruit_order = [G,S,S,A,G,b,A,O,B,G,B,P,S,O,b,B,A,b,G,S,S,b,A,P] // length = 24



empty_tiles = []
// add empty tiles to list
var lay_id = layer_get_id("tiles");
var map_id = layer_tilemap_get_id(lay_id);
for (var i = 0; i < tilemap_get_width(map_id); i++;)
{
    for (var j = 0; j < tilemap_get_height(map_id); j++;)
    {
        var data = tilemap_get(map_id, i, j);
        if (tile_get_empty(data))
        {
            array_push(empty_tiles,[i,j])
        }
    }
}
show_debug_message(empty_tiles)




var _pcount = 0
with (objPlayerSpawn)
{
	//if (_pcount > 3) break;
	instance_create_layer(self.x,self.y,"Instances",objPlayer,{player_id : _pcount})
	instance_destroy()
	_pcount++
}


function start_game() {
	game_started = true
	audio_play_sound(sndYay,4,0)
}


function spawn_fruit(type_of_fruit) {
	var pos = []
	var tileAmt = array_length(empty_tiles)
	
	pos[0] = empty_tiles[irandom(array_length(empty_tiles) -1 )][0]
	pos[1] = empty_tiles[irandom(array_length(empty_tiles) -1 )][1]
	
	
	var v = instance_create_layer(pos[0]*8,pos[1]*8,"Instances",objFruitSpawn, {type : type_of_fruit})
	
	while ((collision_point(v.x+4,v.y+4,objPlayer,false,false)) or 
           (collision_point(v.x+4,v.y+4,objFruit,false,false)) or 
		   (collision_point(v.x+4,v.y+4,objWall,false,false)) or 
		   v.x >= room_width or v.y >= room_height or
		   v.x <= 0 or v.y <= 0 ) {
		v.x = empty_tiles[irandom(array_length(empty_tiles) -1 )][0] * 8
		v.y = empty_tiles[irandom(array_length(empty_tiles) -1 )][1] * 8
	}
	//show_debug_message(string("{0}: {1},{2}",fruit_id,v.x,v.y))
	//var spawned_fruit = instance_create_layer()
}

function stop_game() {
	game_started = false
	audio_play_sound(sndGameEnd,10,0)
	alarm[0] = 180
}

function sReplaceArrayByCopy(dst, src) {
	array_delete(dst, 0, array_length(dst))
	for (var i = 0; i < array_length(src); i++)
	{
		if is_array(src[i])
			{	dst[i] = []
				sReplaceArrayByCopy(dst[i], src[i])}
		else
			{dst[i] = src[i]}
	}
}