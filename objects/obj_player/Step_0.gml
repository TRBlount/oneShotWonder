
image_angle = point_direction(x, y, mouse_x, mouse_y);

playerSpeed = 5;


///Movement and Collision
var h = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var v = keyboard_check(ord("S")) - keyboard_check(ord("W"));

var spd = sqrt(hsp * hsp + vsp * vsp);
if h == 0 && v == 0 {
    // deaccelerate when not moving
    if spd <= nd {
        hsp = 0;
        vsp = 0;
    } else {
        hsp -= hsp / spd * nd;
        vsp -= vsp / spd * nd;
    }
} else {
    if hsp * h + vsp * v < 0 {
        // skid
        if spd <= sd {
            hsp = 0;
            vsp = 0;
        } else {
            hsp -= hsp / spd * sd;
            vsp -= vsp / spd * sd;
        }
    } else {
        // accelerate
        hsp += h * acc;
        vsp += v * acc;
        spd = sqrt(hsp * hsp + vsp * vsp);
        if spd > mv {
            hsp = hsp / spd * mv;
            vsp = vsp / spd * mv;
        }
    }
}


if (place_meeting(x+hsp,y,obj_wall)){
	while(!place_meeting(x+sign(hsp),y,obj_wall)){
		x += sign(hsp);
	}
	hsp = 0;
} else {
	x += hsp;
}

if (place_meeting(x,y+vsp,obj_wall)){
	while(!place_meeting(x,y+sign(vsp),obj_wall)){
		y += sign(vsp);
	}
	vsp = 0;
} else {
	y += vsp;
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

