//transfers file send state
//a0 - client id
dyclearbuffer(0);
dywritebyte(21, 0);
dywritebyte(fsend_state, 0);
dywriteint(fsend_size, 0);
dywritestring(fsend_path, 0);
dywritestring(fsend_md5, 0);
dywritestring(fsend_cmd5, 0);
with id_to_cl(argument0) {dysendmessage(cl_tcp, 0, 0, 0);}
