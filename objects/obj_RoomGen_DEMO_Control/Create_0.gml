// Get the current room number...
// Note that on the first run, the room X and Y values will ALWAYS be set
// to the position of room flagged with "start" in the room DS map, but as 
// we move through the rooms, we'll change these values (see the STEP EVENT 
// of the player object - the part where we check to see if the player has
// left through a door).
var num = RoomGen_GetRoomNumber(global.RoomGen_x, global.RoomGen_y);

// Get the map associated with the room
var map = RoomGen_GetRoomMap(num);

// Get the first entry in the map
var pos = ds_map_find_first(map);

// Parse the map to find out where the entances to the room are and create doors/walls as required
// You can also use this parsing of the map to create additional room elements that you 
// have added into the map when it was generated. See the script "RoomGen_End_DEMO".
show_debug_message("-----------------------------");
for (var i = 0; i < ds_map_size(map); i++;)
{
show_debug_message(pos + string(map[? pos]));
switch(pos)
    {
    case "top":
        // Has a door....
        if map[? pos] == true
            {
            var inst = instance_create(room_width / 2, 0, obj_RoomGen_DEMO_Door);
            inst.sprite_index = spr_RoomGen_DoorClosed_H;
            }
        else
            {
            // No door so cover the space where it would go
            var tl = tile_add(bck_RoomGen_Walls_Covers, 0, 96, 256, 64, (room_width / 2) - 128, 0, -50);
            tile_set_blend(tl, map[? "background"]);
            }
        break;
    case "bottom":
        // Has a door....
        if map[? pos] == true
            {
            var inst = instance_create(room_width / 2, room_height, obj_RoomGen_DEMO_Door);
            inst.sprite_index = spr_RoomGen_DoorClosed_H;
            inst.image_yscale = -1;
            }
        else
            {
            // No door so cover the space where it would go
            var tl = tile_add(bck_RoomGen_Walls_Covers, 256, 96, 256, 64, (room_width / 2) - 128, room_height - 64, -50);
            tile_set_blend(tl, map[? "background"]);
            }
        break;
    case "left":
        // Has a door....
        if map[? pos] == true
            {
            var inst = instance_create(0, room_height / 2, obj_RoomGen_DEMO_Door);
            inst.sprite_index = spr_RoomGen_DoorClosed_V;
            }
        else
            {
            // No door so cover the space where it would go
            var tl = tile_add(bck_RoomGen_Walls_Covers, 608, 0, 64, 256, 0, (room_height / 2) - 128, -50);
            tile_set_blend(tl, map[? "background"]);
            }
        break;
    case "right":
        // Has a door....
        if map[? pos] == true
            {
            var inst = instance_create(room_width, room_height / 2, obj_RoomGen_DEMO_Door);
            inst.sprite_index = spr_RoomGen_DoorClosed_V;
            inst.image_xscale = -1;
            }
        else
            {
            // No door so cover the space where it would go
            var tl = tile_add(bck_RoomGen_Walls_Covers, 864, 0, 64, 256, room_width - 64, (room_height / 2) - 128, -50);
            tile_set_blend(tl, map[? "background"]);
            }
        break;
    case "enter":
        // Get the "enter" map entry to find out where the player 
        // has come from and position him as required
        switch(map[? "enter"])
            {
            case 0: // Top
                var inst = instance_create(room_width / 2, 64, obj_RoomGen_DEMO_Player);
                inst.image_angle = -90;
                break;
            case 1: // Bottom
                var inst = instance_create(room_width / 2, room_height - 64, obj_RoomGen_DEMO_Player);
                inst.image_angle = 90;
                break;
            case 2: // Left
                var inst = instance_create(64, room_height / 2, obj_RoomGen_DEMO_Player);
                inst.image_angle = 0;
                break;
            case 3: // Right
                var inst = instance_create(room_width - 64, room_height / 2, obj_RoomGen_DEMO_Player);
                inst.image_angle = 180;
                break;
            }
        break;
    case "start":
        // Create the player instance in the middle of the first room ONLY if it hasn't been entered before
        if map[? "start"]
            {
            if map[? "visited"] == false
                {
                var inst = instance_create(room_width / 2, room_height / 2, obj_RoomGen_DEMO_Player);
                map[? "visited"] = true; // Flag the room as having been visited
                }
            }
        break;
    case "end":
        // Check to see if the room is the exit room and create Exit object if it is
        if map[? "end"]
            {
            instance_create(room_width / 2, room_height / 2, obj_RoomGen_DEMO_Exit);
            }
        break;   
    case "chests":
        for (var a = 0; a < map[? "chests"]; a++;)
            {
            var _xx = ds_list_find_value(map[? "chest_list"], a * 2);
            var _yy = ds_list_find_value(map[? "chest_list"], (a * 2) + 1);
            instance_create(_xx, _yy, obj_RoomGen_DEMO_Chest);
            }
        break;
    case "trap": // Spawn traps based on the map entry value
        if map[? "trap"] == 0
            {
            instance_create(128, 128, obj_RoomGen_DEMO_Trap);
            instance_create(room_width - 192, 128, obj_RoomGen_DEMO_Trap);
            instance_create(128, room_height - 192, obj_RoomGen_DEMO_Trap);
            instance_create(room_width - 192, room_height - 192, obj_RoomGen_DEMO_Trap);
            }
        if map[? "trap"] == 1
            {
            instance_create(128, (room_height / 2) - 64, obj_RoomGen_DEMO_Trap);
            instance_create(128, (room_height / 2), obj_RoomGen_DEMO_Trap);
            instance_create(room_width - 192, (room_height / 2) - 64, obj_RoomGen_DEMO_Trap);
            instance_create(room_width - 192, (room_height / 2), obj_RoomGen_DEMO_Trap);
            instance_create((room_width / 2) - 64, 128, obj_RoomGen_DEMO_Trap);
            instance_create((room_width / 2), 128, obj_RoomGen_DEMO_Trap);
            instance_create((room_width / 2) - 64, room_height - 192, obj_RoomGen_DEMO_Trap);
            instance_create((room_width / 2), room_height - 192, obj_RoomGen_DEMO_Trap);
            }
        if map[? "trap"] == 2
            {
            for (var a = 0; a < 8; a++;)
                {
                instance_create((room_width / 2) - 32 + lengthdir_x(196, a * 45), (room_height / 2) - 32 + lengthdir_y(196, a * 45), obj_RoomGen_DEMO_Trap);
                }
            }
        break;
    case "background": // Set the background colour so rooms have more variety
        __background_set( e__BG.Blend, 1, map[? "background"] );
        break;
    case "enemy": // Create enemies
        // We have two peices of information stored in the "enemy" key of the map:
        // the type and the number. So we split the string in two to get each 
        // individual value, then parse each of them to create the correct enemy.
        var _type = string_letters(map[? "enemy"]);
        var _num = string_digits(map[? "enemy"]);
        repeat(_num)
            {
            var _xx = 128 + random(room_width - 256);
            var _yy = 128 + random(room_height - 256);
            with (instance_create(_xx, _yy, obj_RoomGen_DEMO_Enemy))
                {
                switch(_type)
                    {
                    case "skeleton":
                        sprite_index = spr_RoomGen_Skeleton;
                        spd = 1;
                        hp = 5;
                        break;
                    case "ghost":
                        sprite_index = spr_RoomGen_Ghost;
                        spd = 3;
                        hp = 3;
                        break;
                    case "demon":
                        sprite_index = spr_RoomGen_Demon;
                        spd = 2;
                        hp = 8;
                        break;
                    }
                }
            }
        break;
    }
pos = ds_map_find_next(map, pos);
}

// Check to see if the room has been visited before.
// If it is, open all the doors (this check CANNOT go in the map parsing (above)
// as it may be that not all the doors have been created when it is parsed...).
// This is not essential and will depend on thegame you are making. In this DEMO
// we are saving the room state to the room map in the "visited" key, so that 
// when we go back to a room it is NOT reset, but in your own games you can do 
// whatever you want!
if map[? "visited"] == true
{
show_debug_message("Doors Opened");
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

// Set a new map entry to show the room has been visited
map[? "visited"] = true;




