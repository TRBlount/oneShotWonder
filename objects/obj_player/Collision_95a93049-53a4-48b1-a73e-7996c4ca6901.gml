/// @description Insert description here
// You can write your code in this edito
for(i = 0; i < 4; i+=1;){
	if(inventory[i] == ""){
		with(other){
			instance_destroy();
		}
		inventory[i] = "shotgun";
		if(bBullet == false){
			activeGun = "shotgun";
			aGunInvSlot = i;
		}
		break;
	}
}

