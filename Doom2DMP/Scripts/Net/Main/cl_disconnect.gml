//disconnect script
//check if in game
if !room == rm_game || !variable_global_exists('pl_id')
{
    con_add(":: NET: Вы сейчас не в игре.");
    exit;
}
//first send message to server
con_add(":: NET: Отправляем сообщение об отключении...");
dll39_buffer_clear(0);
dll39_write_byte(2, 0);
dll39_write_byte(global.pl_id, 0);
dll39_message_send(global.cl_tcp, 0, 0, 0);
sleep(15);

//destroy skins
if instance_number(o_pl) > 0
{
    with (o_pl)
    {
        if !variable_local_exists('sprites') || !variable_local_exists('spr') || !variable_local_exists('cl_id') {continue;}
        for (i = 1; i <= 9; i += 1)
        {
            if sprite_exists(sprites[i, 0]) {sprite_delete(sprites[i, 1]);}
            if sprite_exists(sprites[i, 1]) {sprite_delete(sprites[i, 2]);}
        }
    }
}

//file sending stuff
if global.fget_state
{  
    file_bin_close(global.fget_file); 
    net_fget_abort();
    file_delete(global.fget_file);
}

//destroy backgrounds and music
if background_exists(global.map_bkg) {if global.map_bkg != bkg_inter {background_delete(global.map_bkg);} global.map_bkg = -1;}

//destroy sockets
dll39_socket_close(global.cl_tcp);
con_add(":: NET: Закрываем сокеты...");

//message
con_add(":: NET: Отключено.");

