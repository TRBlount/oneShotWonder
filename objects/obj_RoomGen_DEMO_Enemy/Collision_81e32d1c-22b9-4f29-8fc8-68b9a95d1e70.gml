var dir = point_direction(x, y, other.x, other.y);

while(place_meeting(x, y, other))
{
x -= lengthdir_x(1, dir);
y -= lengthdir_y(1, dir);
}


