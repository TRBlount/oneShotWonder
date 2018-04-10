
image_angle = point_direction(x, y, mouse_x, mouse_y);

playerSpeed = 5;


///Movement and Collision
var h = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var v = keyboard_check(ord("S")) - keyboard_check(ord("W"));

var spd = sqrt(hspeed * hspeed + vspeed * vspeed);
if h == 0 && v == 0 {
    // deaccelerate when not moving
    if spd <= nd {
        hspeed = 0;
        vspeed = 0;
    } else {
        hspeed -= hspeed / spd * nd;
        vspeed -= vspeed / spd * nd;
    }
} else {
    if hspeed * h + vspeed * v < 0 {
        // skid
        if spd <= sd {
            hspeed = 0;
            vspeed = 0;
        } else {
            hspeed -= hspeed / spd * sd;
            vspeed -= vspeed / spd * sd;
        }
    } else {
        // accelerate
        hspeed += h * acc;
        vspeed += v * acc;
        spd = sqrt(hspeed * hspeed + vspeed * vspeed);
        if spd > mv {
            hspeed = hspeed / spd * mv;
            vspeed = vspeed / spd * mv;
        }
    }
}
if (hspeed > 0 && place_meeting(x+2,y,obj_wall)){ 
	hspeed = 0;
}

if (hspeed < 0 && place_meeting(x-2,y,obj_wall)){ 
    hspeed = 0;
}

if (vspeed < 0 && place_meeting(x,y-2,obj_wall)){ 
    vspeed = 0;
}

if (vspeed > 0 && place_meeting(x,y+2,obj_wall)){ 
    vspeed = 0;
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

