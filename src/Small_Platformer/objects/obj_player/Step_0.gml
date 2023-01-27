// If the player isn't jumping and there's no floor beneath them, set falling to true
if (!player_jumping && !place_meeting(x,y + 20,obj_ground) && !place_meeting(x,y + 20, obj_wall_1) && !place_meeting(x,y + 20, obj_wall_2) && !place_meeting(x,y + 20, obj_wall_3))
{
	player_falling = true;
}

// If you're falling, add fall acceleration to velocity and constrain it by max fall velocity
// But if the floor is below, then stop falling
if (player_falling)
{
	player_velocity_y += player_fall_acceleration;
	
	if (player_velocity_y > player_max_fall_velocity) player_velocity_y = player_max_fall_velocity;
	
	if (place_meeting(x,y+20,obj_ground))
	{
		player_falling = false;
		player_velocity_y = 0;

		y = obj_ground.y - sprite_height;
	}
	
	if (place_meeting(x,y+20,obj_wall_1))
	{
		player_falling = false;
		player_velocity_y = 0;

		y = obj_wall_1.y - sprite_height;
	}
	
	if (place_meeting(x,y+20,obj_wall_2))
	{
		player_falling = false;
		player_velocity_y = 0;

		y = obj_wall_2.y - sprite_height;
	}
	
	if (place_meeting(x,y+20,obj_wall_3))
	{
		player_falling = false;
		player_velocity_y = 0;

		y = obj_wall_3.y - sprite_height;
	}
}

// If the player is not falling and hits spacebar, start jumping!

if (!player_falling && keyboard_check(vk_space))
{
	player_jumping = true;
	player_velocity_y -= player_initial_jump_acceleration;
	player_jump_counter++;
}

// If jumping subtract jump acceleration from velocity, constraining for max velocity
// If the jump counter is great than jump duration start falling
if (player_jumping)
{
	player_velocity_y -= player_jump_acceleration;
	
	if (player_velocity_y < -player_max_jump_velocity) player_velocity_y = -player_max_jump_velocity;
	
	if (player_jump_counter > player_jump_duration)
	{
		player_jump_counter = 0;
		player_jumping = false;
		player_falling = true;
	}
}

// If you're jumping and the jump button is released, start falling
if(player_jumping && keyboard_check_released(vk_space))
{
	player_jump_counter = true;
	player_jumping = false;
	player_falling  = true;
}

y += player_velocity_y;