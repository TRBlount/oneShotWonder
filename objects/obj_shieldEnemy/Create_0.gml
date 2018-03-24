/// @description Insert description here
// You can write your code in this editor

shield = instance_create_layer(x,y,"Shields",obj_Shield);
with(shield) {
	parent = other;
}