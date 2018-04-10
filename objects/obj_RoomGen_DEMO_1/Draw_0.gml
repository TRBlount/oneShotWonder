// Draw the generated grid for debugging

RoomGen_Draw_Debug(res, true);

if room_num == room_max - 1
{
draw_text(32, 32, string_hash_to_newline("#DEBUG ROOM GRID#Press Space To Generate again#Press Escape to go to next room"));
}
else
{
var _str = "";
repeat(room_num)
    {
    _str += ".";
    }
draw_text(32, 32, string_hash_to_newline("Generating" + _str));
}

