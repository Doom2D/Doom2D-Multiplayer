//makes bot chat lol
if random(10) < global.bot_randrate {exit;}
if !global.bot_chatter {exit;}
var v, phrase;
v = list_get_val('chat_list', round(random(list_get_len('chat_list'))));
if is_real(v) {exit;}

phrase = string(v);

dyclearbuffer(0);
dywritebyte(5, 0);
dywritestring(cl_name + ': ' + phrase, 0);
with (o_pl) {dysendmessage(cl_tcp, 0, 0, 0)};

con_add(cl_name + ': ' + phrase);
