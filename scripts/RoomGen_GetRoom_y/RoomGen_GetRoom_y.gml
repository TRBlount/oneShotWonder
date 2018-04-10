/// @description  RoomGen_GetRoom_y(room_num)
/// @param room_num

var _map = RoomGen_GetRoomMap(argument0);
if _map != -1
{
var _gridw = ds_grid_width(global.RoomGen_grid);
var _gridh = ds_grid_height(global.RoomGen_grid);
return ds_grid_value_y(global.RoomGen_grid, 0, 0, _gridw, _gridh, _map);
}
else
{
show_debug_message("Cannot get Y position for room " + string(argument0));
show_debug_message("Returning -1");
return -1;
}

