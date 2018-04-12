/// @description Insert description here
// You can write your code in this editor

bBullet = true;
playerScore = 0;
totalShots = 0;
hitShots = 0;

hsp = 0;
vsp = 0;

gunShotTypes = ds_map_create();

inventory[0] = "normal";
inventory[1] = "";
inventory[2] = "";
inventory[3] = "";

global.player = self;

application_surface_draw_enable(0);

mv = 6; // maximal velocity
acc = 0.5; // acceleration
nd = 0.5; // normal deacceleration
sd = 1.0; // skid deacceleration
