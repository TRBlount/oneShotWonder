
x = parent.x;
y = parent.y;

var player_dir = point_direction(x,y,global.player.x,global.player.y);
var dd = angle_difference(image_angle, player_dir);
image_angle -= min(abs(dd), 2) * sign(dd);
