//sends position
dyclearbuffer(0);
dywritebyte(7, 0);
dywritebyte(cl_id, 0);
dywritebyte(kb_left, 0);
dywritebyte(kb_rght, 0);
dywritebyte(kb_jump, 0);
dywritebyte(kb_lkup, 0);
dywritebyte(kb_lkdn, 0);
dywritebyte(st_talk, 0);
dywriteshort(x, 0);
dywriteshort(y, 0);
with o_pl {dysendmessage(cl_tcp, 0, 0, 0);}
