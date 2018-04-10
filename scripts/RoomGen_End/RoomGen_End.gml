/// @description  RoomGen_End();

/* ////////////////////////////////////////////////////////////

This scrpt finalises the room creation by creating a DS List 
with all the room DS Maps in order of creation. The room DS maps
will all be populated with certain "standard" keys already, but 
this also completes these standard keys for rooms that have less
than 4 exits. The standard key/value pairs are:

"top" - will be (true) if there is an exit at the top or (false) if there is not
"bottom" - will be (true) if there is an exit at the bottom or (false) if there is not
"left" - will be (true) if there is an exit on the left or (false) if there is not
"right" - will be (true) if there is an exit on the right or (false) if there is not
"room" - the number of the room from 0 to the max number (-1) you gave to the "Init" script
"start" - will be (true) if the room is flagged as the first room generated
"end" - will be (true) if the room is the last room generated
"enter" - will mark the side of the room that the player entered and is initialised to (-1)
"visited" - will mark the room as visited by the player and is initialised to (false).

These maps can be parsed at anytime from the DS list, and you can
use the grid value for the room to get the position within the list,
making it easy to be checked in the game for things.

The grid and list are global and so you can use them to create 
the correct door objects (for example), but you can also add in 
your own custom keys to populate the rooms with traps, enemies, 
decoration, bosses, weapons, pickups and anything else you can 
think of. Simply add the item (or items) into DS map for the 
room then parse it when you enter the room in game.

For example, say you want to spawn 3 enemy bats in a room. You'd 
add:

map[? "e_bats"] = 3;

into the map. You can then us ds_map_exists() to check for this
key and if it is found, spawn 3 bats.
//////////////////////////////////////////////////////////// */

// Loop through the room list
for (var i = 0; i < ds_list_size(global.RoomGen_list); i++;)
{
// Get the DS map ID for the room
var map = RoomGen_GetRoomMap(i);
if ds_exists(map, ds_type_map)
    {
    // DEBUG! ///////////////////////////////////////////////////////////////////////////////////////////
    if global.RoomGen_Debug show_debug_message("Room " + string(i) + " is a map!");
    // DEBUG! ///////////////////////////////////////////////////////////////////////////////////////////
    // Room map is valid so complete the exit positions
    if !ds_map_exists(map, "top") map[? "top"] = false;
    if !ds_map_exists(map, "bottom") map[? "bottom"] = false;
    if !ds_map_exists(map, "left") map[? "left"] = false;
    if !ds_map_exists(map, "right") map[? "right"] = false;
    // Initialise the entry point for the player (this will later be set to 0 (top), 1(bottom), 2(left) or 3(right)
    map[? "enter"] = -1;
    // Initialise whether the room has been visited or not (set to (false) to start with)
    map[? "visited"] = false;    
    // Add any further map entries (or scripts to add map entries) here
    // Mark start and end rooms (Note that you don't HAVE to mark the first room 
    // as the start and the last room as the end and can set any room to these values).
    map[? "start"] = false;
    var _gridx = RoomGen_GetRoom_x(i);
    var _gridy = RoomGen_GetRoom_y(i);
    if i == 0
        {
        map[? "start"] = true;
        // Set the global room grid position
        global.RoomGen_x = _gridx;
        global.RoomGen_y = _gridy;
        // DEBUG! ///////////////////////////////////////////////////////////////////////////////////////////
        if global.RoomGen_Debug show_debug_message("Start Grid Pos = " + string(_gridx) + "/" + string(_gridy));
        // DEBUG! ///////////////////////////////////////////////////////////////////////////////////////////
        }
    map[? "end"] = false;
    if i == ds_list_size(global.RoomGen_list) - 1 map[? "end"] = true;
    // Set the global DS grid to hold the ROOM NUMBER since the DS map is now
    // held within the DS list that we just created. This means that you can 
    // get the room number from the grid, then use that to get the DS map 
    // from the room position in the list
    global.RoomGen_grid[# _gridx, _gridy] = ds_map_find_value(global.RoomGen_list[| i], "room");
    }
else
    {
    // There is an issue with the room generation so clean up and restart
    RoomGen_CleanUp(true);
    // DEBUG! ///////////////////////////////////////////////////////////////////////////////////////////
    if global.RoomGen_Debug
        {
        show_debug_message("//////////////////////////////////////");
        show_debug_message("Room " + string(i) + " is undefined!");
        show_debug_message("Trying again!");
        show_debug_message("//////////////////////////////////////");
        }
    // DEBUG! ///////////////////////////////////////////////////////////////////////////////////////////
    }
}

