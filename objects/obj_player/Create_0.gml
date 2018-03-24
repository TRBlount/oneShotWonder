/// @description Insert description here
// You can write your code in this editor

bBullet = true;
playerScore = 0;
totalShots = 0;
hitShots = 0;

gunShotTypes = ds_map_create();

inventory[0] = "normal";
inventory[1] = "";
inventory[2] = "";
inventory[3] = "";

global.player = self;

application_surface_draw_enable(0);
