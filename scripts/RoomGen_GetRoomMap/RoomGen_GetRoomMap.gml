/// @description  RoomGen_GetRoomMap(room_num);
/// @param room_num

var _map = global.RoomGen_list[| argument0];
if is_undefined(_map)
{
show_debug_message("Map undefined for room " + string(argument0));
show_debug_message("Returning -1");
return -1;
}

return _map;

