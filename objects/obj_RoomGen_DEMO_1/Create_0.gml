// This is a DEMO object to show how to use the scripts supplied.
// This object simply generates a new room map over a number of 
// steps instead of all at once and can be removed from the project
// along with all the other Objects/Sprites/Rooms marked DEMO.

// Get the number of rooms, whether to double back and the debug resolution
var num = get_integer("Number of rooms?", irandom_range(10, 100));
var dob = get_string("Double back over rooms (true / false)?", choose("true", "false"));
res = get_integer("Debug resolution?", 32);

// Initialise the romm generator
if string_lower(dob) == "true"
{
RoomGen_Init(num, true, true);
}
else
{
RoomGen_Init(num, false, true);
}

/*// Get the number of rooms, whether to double back and the debug resolution
var num = get_integer("Number of rooms?", 20);
var wid = get_integer("Grid Width?", 5);
var hei = get_integer("Grid Height?", 5);

res = get_integer("Debug resolution?", 32);

RoomGen_Init_Constrained(num, wid, hei, true);*/


// Set an alarm to iterate through the scripts and generate room 
// spaces one at a time (normally all generation would go here)
alarm[0] = room_speed;

/* */
/*  */
