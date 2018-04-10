// Chests are stroed in the room map, along with a list of 
// coordinates so that the game places them in the same place every time.
// this means that we need to check this list and remove the coordinates,
// or the list itself if empty, when the player picks up a chest object

with (other)
{
if image_speed == 0
    {
    image_speed = 0.25;
    var _rm = RoomGen_GetRoomNumber(global.RoomGen_x, global.RoomGen_y);
    var _m = RoomGen_GetRoomMap(_rm);
    var _l = _m[? "chest_list"];
    ds_list_delete(_l, ds_list_find_index(_l, x));
    ds_list_delete(_l, ds_list_find_index(_l, y));
    _m[? "chests"] -= 1;
    if _m[? "chests"] <= 0
        {
        ds_map_delete(_m, "chests");
        ds_list_destroy(_l);
        ds_map_delete(_m, "chest_list");
        }
    }
}

x = xprevious;
y = yprevious;


