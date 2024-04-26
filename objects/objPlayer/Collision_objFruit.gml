

if not has_bomb {
	if other.type < 6 {
		audio_play_sound(sndFruit,0,0)
		score_total += other.fruit_values[other.type]
		fruit_amount ++
		array_push(score_types,other.type)
	} else { // BOMB
		has_bomb = true
		audio_play_sound(sndBombPickup,0,0,1,0,random_range(0.9,1.1))
	}
	instance_destroy(other)
}