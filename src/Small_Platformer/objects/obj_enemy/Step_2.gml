if(left){
	x -= walk_speed
	if(place_meeting(x - walk_speed, y, obj_wall_1) || place_meeting(x - walk_speed, y, obj_wall_2) || place_meeting(x - walk_speed, y, obj_wall_3)){
		left = false
	}
	return
}

x += walk_speed
if(place_meeting(x + walk_speed, y, obj_wall_1) || place_meeting(x + walk_speed, y, obj_wall_2) || place_meeting(x + walk_speed, y, obj_wall_3)){
	left = true
}