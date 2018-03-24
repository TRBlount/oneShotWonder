
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

if (keyboard_check(ord("1"))){ 
    aGunInvSlot = 0;
	activeGun = "normal";
}
if (keyboard_check(ord("2"))){
	if(inventory[1] != ""){
	    aGunInvSlot = 1;
		activeGun = inventory[1];
	}
}
if (keyboard_check(ord("3"))){
	if(inventory[2] != ""){
	    aGunInvSlot = 2;
		activeGun = inventory[2];
	}
}
if (keyboard_check(ord("4"))){
	if(inventory[3] != ""){
	    aGunInvSlot = 3;
		activeGun = inventory[3];
	}
}


if (mouse_check_button(mb_left) && gunCooldown == 10) {
	if(activeGun == "normal" && bBullet){
		playerShot =  instance_create_layer(x, y, "Projectiles", obj_bullet);
		with(playerShot){
			direction = other.image_angle;
		}
		bBullet = false;
		gunCooldown = 0;
	} else if (activeGun == "shotgun"){
		for(i = -4; i < 5; i+=1){
			shotgunShot =  instance_create_layer(x, y, "Projectiles", obj_bullet);
			shotgunShot.direction = other.image_angle - (3*i);
		}
		activeGun = "normal";
		inventory[aGunInvSlot] = "";
		aGunInvSlot = 0;
		gunCooldown = 0;
	}
	totalShots +=1;
}

if(gunCooldown != 10){
	gunCooldown+=1;	
}

