var num = irandom_range(20, 200);
RoomGen_Init(num, choose(true, false), false);
RoomGen_CreateAllRooms(false);
RoomGen_End();

