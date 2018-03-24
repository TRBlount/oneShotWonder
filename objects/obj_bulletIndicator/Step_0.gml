/// @description Insert description here
// You can write your code in this editor


if(obj_player.activeGun == "shotgun"){
	sprite_index = spr_shotShell;
} else if (obj_player.bBullet) {
	sprite_index = spr_haveBullet;	
} else {
	sprite_index = spr_noBullet;		
}