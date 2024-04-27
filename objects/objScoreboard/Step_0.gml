if keyboard_check_pressed(vk_space) {
	game_restart()
	instance_destroy()
}

if  (array_equals(score_totals,[58, 40, 14, 33])) &&
	(array_equals(score_types, [[ 2,6,4,3,1,5 ],[ 1,2,0,5,1 ],[ 0,3,1,2,6 ],[ 1,0,3,4,6,0,2 ]])) &&
	(!score_correct)
	{
	score_correct = true
	alarm[0] = 180
}

if start_animating and irandom(2) == 0 {
	image_speed = random(1)
}

