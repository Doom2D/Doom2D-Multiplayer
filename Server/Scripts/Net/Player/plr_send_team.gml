//sends the player's team

dyclearbuffer(0);
dywritebyte(24, 0);
dywritebyte(cl_id, 0); //id
dywritebyte(cl_team, 0); //team

with (o_pl) {dysendmessage(cl_tcp, 0, 0, 0);}
