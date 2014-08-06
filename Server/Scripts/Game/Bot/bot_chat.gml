//makes bot chat lol

if !global.bot_chatter {exit;}
if irandom( ceil(global.bot_randrate / 4) ) != 1 {exit;}

var v, phrase;
v = list_get_val( 'chat_list', irandom( list_get_len('chat_list') - 1 ) );
if is_real(v) {exit;}

phrase = string(v);

dll39_buffer_clear(0);
write_msg_id(5, 0);
dll39_write_string(cl_name + ': ' + phrase, 0);
with (o_pl) {dll39_message_send(cl_tcp, 0, 0, 0)};

con_add(cl_name + ': ' + phrase);
