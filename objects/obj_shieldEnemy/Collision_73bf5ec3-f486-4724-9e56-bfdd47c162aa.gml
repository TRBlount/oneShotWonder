/// @description Insert description here
// You can write your code in this editor

with(other)
{
    instance_destroy();
}

obj_player.bBullet = true;
obj_player.playerScore += 250;
obj_player.hitShots +=1;

instance_destroy(shield);

instance_destroy();