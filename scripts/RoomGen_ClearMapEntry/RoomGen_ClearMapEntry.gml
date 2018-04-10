/// @description  RoomGen_ClearMapEntry(room_num, map_key);
/// @param room_num
/// @param  map_key

var map = RoomGen_GetRoomMap(argument0);
if ds_map_exists(map, argument1)
{
ds_map_delete(map, argument1);
}
