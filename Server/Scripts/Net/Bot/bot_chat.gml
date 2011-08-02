//makes bot chat lol
if random(10) < global.bot_randrate {exit;}
if !global.bot_chatter {exit;}
var phrase;
phrase = string(list_get_val('chat_list', round(random(list_get_len('chat_list')))));

dll39_buffer_clear(0);
dll39_write_byte(5, 0);
dll39_write_string(cl_name + ': ' + phrase, 0);
with (o_pl) {dll39_message_send(cl_tcp, 0, 0, 0)};

con_add(cl_name + ': ' + phrase);
