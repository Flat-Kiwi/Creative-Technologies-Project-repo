image_speed = 60/SECOND_LENGTH
if collision_point(x+4,y+4,objWall,false,false) /*or collision_point(x+4,y+4,objExplo,false,true)*/ {
	instance_destroy()
}
alarm[0]=SECOND_LENGTH