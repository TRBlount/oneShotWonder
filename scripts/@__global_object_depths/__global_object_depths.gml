// Initialise the global array that allows the lookup of the depth of a given object
// GM2.0 does not have a depth on objects so on import from 1.x a global array is created
// NOTE: MacroExpansion is used to insert the array initialisation at import time
gml_pragma( "global", "__global_object_depths()");

// insert the generated arrays here
global.__objectDepths[0] = 0; // obj_RoomGen
global.__objectDepths[1] = 0; // obj_RoomGen_DEMO_1
global.__objectDepths[2] = 0; // obj_RoomGen_DEMO_3
global.__objectDepths[3] = 0; // obj_RoomGen_DEMO_2
global.__objectDepths[4] = 0; // obj_RoomGen_DEMO_Control
global.__objectDepths[5] = -100; // obj_RoomGen_DEMO_Player
global.__objectDepths[6] = -50; // obj_RoomGen_DEMO_Player_Bullet
global.__objectDepths[7] = -50; // obj_RoomGen_DEMO_Enemy
global.__objectDepths[8] = -50; // obj_RoomGen_DEMO_Enemy_Bullet
global.__objectDepths[9] = 0; // obj_RoomGen_DEMO_Wall
global.__objectDepths[10] = 0; // obj_RoomGen_DEMO_Door
global.__objectDepths[11] = 0; // obj_RoomGen_DEMO_Exit
global.__objectDepths[12] = 0; // obj_RoomGen_DEMO_Chest
global.__objectDepths[13] = 0; // obj_RoomGen_DEMO_Trap


global.__objectNames[0] = "obj_RoomGen";
global.__objectNames[1] = "obj_RoomGen_DEMO_1";
global.__objectNames[2] = "obj_RoomGen_DEMO_3";
global.__objectNames[3] = "obj_RoomGen_DEMO_2";
global.__objectNames[4] = "obj_RoomGen_DEMO_Control";
global.__objectNames[5] = "obj_RoomGen_DEMO_Player";
global.__objectNames[6] = "obj_RoomGen_DEMO_Player_Bullet";
global.__objectNames[7] = "obj_RoomGen_DEMO_Enemy";
global.__objectNames[8] = "obj_RoomGen_DEMO_Enemy_Bullet";
global.__objectNames[9] = "obj_RoomGen_DEMO_Wall";
global.__objectNames[10] = "obj_RoomGen_DEMO_Door";
global.__objectNames[11] = "obj_RoomGen_DEMO_Exit";
global.__objectNames[12] = "obj_RoomGen_DEMO_Chest";
global.__objectNames[13] = "obj_RoomGen_DEMO_Trap";


// create another array that has the correct entries
var len = array_length_1d(global.__objectDepths);
global.__objectID2Depth = [];
for( var i=0; i<len; ++i ) {
	var objID = asset_get_index( global.__objectNames[i] );
	if (objID >= 0) {
		global.__objectID2Depth[ objID ] = global.__objectDepths[i];
	} // end if
} // end for