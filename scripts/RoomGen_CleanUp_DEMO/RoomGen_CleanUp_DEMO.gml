/// @description  RoomGen_CleanUp_DEMO([optional - restart]);
/// @param [optional - restart]

/* ////////////////////////////////////////////////////////////



This script is a copy of the "RoomGen_CleanUp" script and has been 
adapted for the purposes of this demo to show how different things
that have been added in to the script to create dynamic content can
be cleaned up too. In this case, we used DS lists to hold chest
coordinates in rooms (so that they didn't change position each time
the player left and entered the room). These need cleaned up so we've
added an extra bit in this script.

For full details of what this script does, see the original 
script. Note that comments have been stripped out of this script
EXCEPT where the script has been adapted to make it easier to 
see exactly what has been added and what the new code does.

THIS SCRIPT SHOULD NOT BE USED FOR NEW PROJECTS! IT IS PART OF THE DEMO ONLY!!!!

//////////////////////////////////////////////////////////// */

for (var i = 0; i < ds_list_size(global.RoomGen_list); i++;)
    {
    var map = global.RoomGen_list[| i];
    if ds_exists(map, ds_type_map)
        {
        // Check each room for a chest list, and if one is found, destroy it.
        if ds_map_exists(map, "chest_list")
            {
            ds_list_destroy(map[? "chest_list"]);
            }
        ds_map_destroy(map);
        }
    }
ds_list_destroy(global.RoomGen_list);
ds_grid_destroy(global.RoomGen_grid);

// DEBUG! ///////////////////////////////////////////////////////////////////////////////////////////
if global.RoomGen_Debug show_debug_message("Room Gen Cleaned!");
// DEBUG! ///////////////////////////////////////////////////////////////////////////////////////////

if argument_count > 0
{
if global.RoomGen_Debug show_debug_message("Restarting...");
if argument[0] == true instance_create(x, y, object_index);
}
