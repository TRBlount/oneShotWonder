/// @description  RoomGen_End_DEMO();

/* ////////////////////////////////////////////////////////////

This script is a copy of the "RoomGen_End" script and has been 
adapted for the purposes of this demo to show how different things
can be added in to the script to create dynamic content for 
the different rooms created.

For full details of what this script does, see the original 
script. Note that comments have been stripped out of this script
EXCEPT where the script has been adapted to make it easier to 
see exactly what has been added and what the new code does.

THIS SCRIPT SHOULD NOT BE USED FOR NEW PROJECTS! IT IS PART OF THE DEMO ONLY!!!!

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
    // Mark start and end rooms
    map[? "start"] = false;
    var _gridx = RoomGen_GetRoom_x(i);
    var _gridy = RoomGen_GetRoom_y(i);
    if i == 0
        {
        map[? "start"] = true;
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
    // Add any further map entries (or scripts to add map entries) here
    if map[? "start"] == false
        {
        if irandom(5) == 0
            {
            // Add traps into the room. We'll use the value for the map key to decide HOW to add them
            map[? "trap"] = irandom(2);
            show_debug_message("TRAPS ADDED");
            }
        // Add an enemy or two (or 5!) into the room
        var _e = choose("skeleton", "ghost", "demon");
        map[? "enemy"] = _e + string(irandom_range(1, 5));
        show_debug_message("ENEMIES ADDED");
        // How about some treasure chests?
        if irandom(2) == 0
            {
            map[? "chests"] = 1 + irandom(4);
            map[? "chest_list"] = ds_list_create();
            for (var a = 0; a < map[? "chests"]; a++;)
                {
                var _x = 96 + random(room_width - 160);
                var _y = 96 + random(room_height - 160);
                ds_list_add(map[? "chest_list"], _x, _y);
                }
            show_debug_message("CHESTS ADDED");
            }
        }
    // Set the colour for the room
    map[? "background"] = make_colour_hsv(random(255), 128, 255);
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

