
image_angle = point_direction(x, y, mouse_x, mouse_y);

playerSpeed = 5;

//Move Player
if (keyboard_check(ord("A"))){ 
    x -= playerSpeed; 
}

if (keyboard_check(ord("D"))){ 
    x += playerSpeed; 
}

if (keyboard_check(ord("W"))){ 
    y -= playerSpeed; 
}

if (keyboard_check(ord("S"))){ 
    y += playerSpeed; 
}

if (mouse_check_button(mb_left)) {
	playerShot =  instance_create_layer(x, y, "Projectiles", obj_bullet);
	with(playerShot){
		direction = other.image_angle;
	}
}
