if alarm[0] > SECOND_LENGTH-20 and other.bomb_cooldown == 0 {
	other.score_total -= 10
	other.bomb_cooldown = SECOND_LENGTH
	audio_play_sound(sndLoseScore,0,0)
	other.fruit_amount ++
	array_push(other.score_types,6)
}