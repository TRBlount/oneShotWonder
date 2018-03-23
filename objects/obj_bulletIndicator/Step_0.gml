/// @description Insert description here
// You can write your code in this editor


if(obj_player.activeGun == "shotgun"){
	sprite_index = shotShellSprite;
} else if (obj_player.bBullet) {
	sprite_index = haveBulletSprite;	
} else {
	sprite_index = noBulletSprite;		
}