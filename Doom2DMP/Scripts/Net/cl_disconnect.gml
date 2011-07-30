//disconnect script
//check if in game
if !room == rm_game || !variable_global_exists('pl_id')
{
    con_add(":: NET: Not currently connected.");
    exit;
}
//first send message to server
dll39_buffer_clear(0);
dll39_write_byte(2, 0);
dll39_write_byte(global.pl_id, 0);
dll39_message_send(global.cl_tcp, 0, 0, 0);
sleep(15);
con_add(":: NET: Disconnect message sent...");

//destroy sockets
dll39_socket_close(global.cl_tcp);
con_add(":: NET: Closed sockets...");

//go to menu
con_add(":: NET: Disconnected.");

