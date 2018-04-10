if instance_exists(obj_RoomGen_DEMO_Player)
{
var dir = point_direction(x, y, obj_RoomGen_DEMO_Player.x, obj_RoomGen_DEMO_Player.y);
image_angle += clamp(angle_difference(dir, image_angle), -10, 10);
direction = image_angle;
speed = spd;
if sprite_index == spr_RoomGen_Demon
    {
    if point_distance(x, y, obj_RoomGen_DEMO_Player.x, obj_RoomGen_DEMO_Player.y) < 256
        {
        direction = image_angle + 180;
        }
    if alarm[0] < 0
        {
        with (instance_create(x, y, obj_RoomGen_DEMO_Enemy_Bullet))
            {
            direction = other.image_angle;
            }
        alarm[0] = room_speed;
        }
    }
}

