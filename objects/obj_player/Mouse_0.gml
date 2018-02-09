/// @description Insert description here
// You can write your code in this editor
playerShot =  instance_create_layer(x, y, "Projectiles", obj_bullet);
with(playerShot){
	direction = other.image_angle;
}
