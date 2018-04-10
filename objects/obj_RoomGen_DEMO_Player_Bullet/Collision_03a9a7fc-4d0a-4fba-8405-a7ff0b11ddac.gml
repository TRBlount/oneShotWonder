with (other)
{
hp -= 1;
if hp <= 0
    {        
    instance_destroy();
    }
}

if !instance_exists(obj_RoomGen_DEMO_Enemy)
{
var rm = RoomGen_GetRoomNumber(global.RoomGen_x, global.RoomGen_y);
RoomGen_ClearMapEntry(rm, "enemy");
with (obj_RoomGen_DEMO_Door)
    {
    if sprite_index == spr_RoomGen_DoorClosed_H
        {
        sprite_index = spr_RoomGen_DoorOpen_H;
        if image_yscale == 1
            {
            with (instance_position(x - 32, y + 32, obj_RoomGen_DEMO_Wall)) instance_destroy();
            with (instance_position(x + 32, y + 32, obj_RoomGen_DEMO_Wall)) instance_destroy();
            }
        else
            {
            with (instance_position(x - 32, y - 32, obj_RoomGen_DEMO_Wall)) instance_destroy();
            with (instance_position(x + 32, y - 32, obj_RoomGen_DEMO_Wall)) instance_destroy();
            }
        }
    if sprite_index == spr_RoomGen_DoorClosed_V
        {
        sprite_index = spr_RoomGen_DoorOpen_V;
        if image_xscale == 1
            {
            with (instance_position(x + 32, y - 32, obj_RoomGen_DEMO_Wall)) instance_destroy();
            with (instance_position(x + 32, y + 32, obj_RoomGen_DEMO_Wall)) instance_destroy();
            }
        else
            {
            with (instance_position(x - 32, y - 32, obj_RoomGen_DEMO_Wall)) instance_destroy();
            with (instance_position(x - 32, y + 32, obj_RoomGen_DEMO_Wall)) instance_destroy();
            }
        }
    }
}

instance_destroy();


