//sends stats
dyclearbuffer(0);
dywritebyte(9, 0);
dywritebyte(cl_id, 0);
dywritebyte(max(0, hp), 0);
dywritebyte(ap, 0);
dywriteshort(a1, 0);
dywriteshort(a2, 0);
dywriteshort(a3, 0);
dywriteshort(a4, 0);
dywritebyte(w, 0);
dywritebyte(frag, 0);
dywritebyte(st_inv, 0);
dywritebyte(st_ber, 0);
dywritebyte(st_flag, 0);
dywritebyte(st_vis, 0);
with o_pl {dysendmessage(cl_tcp, 0, 0, 0);}
