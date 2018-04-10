/// @description  RoomGen_GetRoomNumber(x_cell, y_cell);
/// @param x_cell
/// @param  y_cell

/* ////////////////////////////////////////////////////////////

This script can be used to get the room number for any given cell 
of the global room DS grid. If the values given are outside of the 
grid bounds the script will return -1.

//////////////////////////////////////////////////////////// */

if argument0 < 0 || argument0 >= ds_grid_width(global.RoomGen_grid)
{
return -4;
}
else if argument1 < 0 || argument1 >= ds_grid_height(global.RoomGen_grid)
{
return -4;
}
else return global.RoomGen_grid[# argument0, argument1];
