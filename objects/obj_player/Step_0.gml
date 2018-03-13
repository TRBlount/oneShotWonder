
image_angle = point_direction(x, y, mouse_x, mouse_y);

playerSpeed = 5;

//Move Player
if (keyboard_check(ord("A")) && !place_meeting(x+5,y,obj_wall)){ 
    x -= playerSpeed; 
}

if (keyboard_check(ord("D")) && !place_meeting(x-5,y,obj_wall)){ 
    x += playerSpeed; 
}

if (keyboard_check(ord("W")) && !place_meeting(x,y-5,obj_wall)){ 
    y -= playerSpeed; 
}

if (keyboard_check(ord("S")) && !place_meeting(x,y+5,obj_wall)){ 
    y += playerSpeed; 
}

if (mouse_check_button(mb_left) && bBullet == true) {
	playerShot =  instance_create_layer(x, y, "Projectiles", obj_bullet);
	with(playerShot){
		direction = other.image_angle;
	}
	bBullet = false;
}

