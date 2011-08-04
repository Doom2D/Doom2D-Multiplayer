//disconnect script
//check if in game
if !room == rm_game || !variable_global_exists('pl_id')
{
    con_add(":: NET: Вы сейчас не в игре.");
    exit;
}
//first send message to server
dll39_buffer_clear(0);
dll39_write_byte(2, 0);
dll39_write_byte(global.pl_id, 0);
dll39_message_send(global.cl_tcp, 0, 0, 0);
sleep(15);
con_add(":: NET: Отправляем сообщение об отключении...");

//destroy sockets
dll39_socket_close(global.cl_tcp);
con_add(":: NET: Закрываем сокеты...");

//go to menu
con_add(":: NET: Отключено.");

