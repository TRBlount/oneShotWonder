// This is a DEMO object to show how to use the scripts supplied.
// This object simply generates a new room map over a number of 
// steps instead of all at once and can be removed from the project
// along with all the other Objects/Sprites/Rooms marked DEMO.

// Get the number of rooms, whether to double back and the debug resolution
var num = irandom_range(10, 30);
var dob = choose("true", "false");
res = 64;

// Initialise the romm generator
if string_lower(dob) == "true"
{
RoomGen_Init(num, true, true);
}
else
{
RoomGen_Init(num, false, true);
}

// Set an alarm to iterate through the scripts and generate room 
// spaces one at a time (normally all generation would go here)
alarm[0] = room_speed;

