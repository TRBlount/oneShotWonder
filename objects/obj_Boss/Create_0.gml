/// @description Insert description here
// You can write your code in this editor
node1 = instance_create_layer(x+10,y+10,"Shields",obj_bossNode);
with(node1) {
	parent = other;
}
node2 = instance_create_layer(x,y-12,"Shields",obj_bossNode);
with(node2) {
	parent = other;
}
node3 = instance_create_layer(x-10,y+10,"Shields",obj_bossNode);
with(node3) {
	parent = other;
}