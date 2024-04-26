
if (!audio_is_playing(sndBoom))
{
   audio_play_sound(sndBoom,0,0)
}
var offset_x = -2
var offset_y = -2
for (var i = 0; i < 5; i += 1)
{
	offset_x = -2
    for (var k = 0; k < 5; k += 1)
	{
		// circular explosion teehee
		if not (((offset_x == -2) or (offset_x == 2)) and ((offset_y == -2) or (offset_y == 2))) {
			instance_create_layer(x+(offset_x*8),y+(offset_y*8),"Instances",objExplo)
		}
		offset_x++
	}	
	offset_y++
}

audio_stop_sound(sndBombHiss)

instance_destroy()