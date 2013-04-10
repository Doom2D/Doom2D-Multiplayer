//sends the visual player info
dyclearbuffer(0);
dywritebyte(20, 0);
dywritebyte(cl_id, 0);
dywritestring(cl_name, 0);
dywritestring(cl_skin, 0);
dywriteint(cl_color, 0);
with o_pl {dysendmessage(cl_tcp, 0, 0, 0);}
