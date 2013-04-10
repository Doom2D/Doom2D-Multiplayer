//sends team score
dyclearbuffer(0);
dywritebyte(25, 0);
dywritebyte(global.team_score[1], 0); //red
dywritebyte(global.team_score[2], 0); //blu

with (o_pl) {dysendmessage(cl_tcp, 0, 0, 0);}
