// move right
if(keyboard_check(ord("D")) && x + sprite_width + 50 < room_width && !place_meeting(x, y, obj_wall_1) && !place_meeting(x, y, obj_wall_2) && !place_meeting(x, y, obj_wall_3)){
	image_speed = 1
	x += walk_speed
	if(x > obj_camera.x + 130){
		obj_camera.x += walk_speed
	}
	return
}

// move left
if(keyboard_check(ord("A")) && x > 50 && !place_meeting(x, y, obj_wall_1) && !place_meeting(x, y, obj_wall_2) && !place_meeting(x, y, obj_wall_3)){
	image_speed = 1
	x -= walk_speed
	if(x < (obj_camera.x + obj_camera.view_width) - (130 + sprite_width)){
		obj_camera.x -= walk_speed
	}
	return
}

// door collision
if(place_meeting(x, y, obj_door)){
	room_goto(rm_start)
}

// lava collision
if(place_meeting(x, y, obj_lava)){
	instance_destroy()
	instance_create_depth(64,64,0)
}

// enemy collision
if(place_meeting(x, y + player_max_fall_velocity, obj_enemy)){
	if(y + sprite_height - player_max_fall_velocity <= obj_enemy.y){
		instance_destroy(obj_enemy)
		return
	}
	instance_destroy()
	instance_create_depth(64,64,0)
}

image_speed = 0
image_index = 0