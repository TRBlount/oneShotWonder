var _h = (keyboard_check(vk_right) - keyboard_check(vk_left));
var _v = (keyboard_check(vk_down) - keyboard_check(vk_up));

if _h != 0 || _v != 0
{
var dir = point_direction(0, 0, _h, _v);
x += lengthdir_x(5, dir);
y += lengthdir_y(5, dir);
image_speed = 0.5;
if !mouse_check_button(mb_left)
    {
    image_angle += clamp(angle_difference(dir, image_angle), -5, 5);
    }
}
else
{
image_speed = 0;
var dir = point_direction(x, y, mouse_x, mouse_y);
image_angle += clamp(angle_difference(dir, image_angle), -5, 5);
}

if place_meeting(x, y, obj_RoomGen_DEMO_Wall)
{
if bbox_top < 64 y = 80;
if bbox_bottom > room_height - 64 y = room_height - 80;
if bbox_left < 64 x = 80;
if bbox_right > room_width - 64 x = room_width - 80;
}
else
{
if bbox_left < 0
    {
    global.RoomGen_x -= 1;
    var num = RoomGen_GetRoomNumber(global.RoomGen_x, global.RoomGen_y);
    RoomGen_SetRoomMap(num, "enter", 3); // Set to the RIGHT
    room_restart();
    }
if bbox_right > room_width
    {
    global.RoomGen_x += 1;
    var num = RoomGen_GetRoomNumber(global.RoomGen_x, global.RoomGen_y);
    RoomGen_SetRoomMap(num, "enter", 2); // Set to the LEFT
    room_restart();
    }
if bbox_top < 0
    {
    global.RoomGen_y -= 1;
    var num = RoomGen_GetRoomNumber(global.RoomGen_x, global.RoomGen_y);
    RoomGen_SetRoomMap(num, "enter", 1); // Set to the BOTTOM
    room_restart();
    }
if bbox_bottom > room_height
    {
    global.RoomGen_y += 1;
    var num = RoomGen_GetRoomNumber(global.RoomGen_x, global.RoomGen_y);
    RoomGen_SetRoomMap(num, "enter", 0); // Set to the TOP
    room_restart();
    }
}


if mouse_check_button(mb_left)
{
var dir = point_direction(x, y, mouse_x, mouse_y);
image_angle += clamp(angle_difference(dir, image_angle), -5, 5);
if alarm[0] < 0
    {
    with (instance_create(x + lengthdir_x(32, image_angle), y + lengthdir_y(32, image_angle), obj_RoomGen_DEMO_Player_Bullet))
        {
        direction = other.image_angle;
        image_angle = direction;
        }
    alarm[0] = room_speed / 3;
    }
}

