//disconnect script
//check if in game

global.menu_id = 0;
if global.dem_mode == 2 {demo_finish(); exit;}

if room != rm_game || !variable_global_exists('pl_id')
{
    con_add(":: NET: Вы сейчас не в игре.");
    exit;
}

//check the fget process
if global.fget_state && global.fget_file != -1
{  
    if dll39_buffer_exists(global.fget_buf) {dll39_buffer_free(global.fget_buf);}
    dll39_file_close(global.fget_file);
    file_delete(global.fget_path);
    net_fget_abort();
}

if global.dem_mode == 1 {demo_rec();}

//first send message to server
if global.dem_mode < 2
{
    con_add(":: NET: Отправляем сообщение об отключении...");
    dll39_write_byte(2, global.send_buf);
    dll39_write_byte(global.pl_id, global.send_buf);
    tcp_send(global.cl_tcp, global.send_buf);
}
sleep(15);

global.map_done = false;

//destroy particles
r_part_wipe();

//destroy skins
if instance_number(o_pl) > 0
{
    with (o_pl)
    {
        if !variable_local_exists('sprites') || !variable_local_exists('spr') || !variable_local_exists('cl_id') {continue;}
        for (i = 1; i <= 9; i += 1)
        {
            if sprite_exists(sprites[i, 0]) {sprite_delete(sprites[i, 0]);}
            if sprite_exists(sprites[i, 1]) {sprite_delete(sprites[i, 1]);}
        }
    }
}

//destroy backgrounds and music
if global.map_bkg != -1
{
  if background_exists(global.map_bkg) {background_delete(global.map_bkg);}
  global.map_bkg = -1;
}

//destroy sockets
if global.dem_mode < 2 
{
    dll39_socket_close(global.cl_tcp);
    con_add(":: NET: Закрываем сокеты...");
    con_add(":: NET: Отключено.");
}
if global.dem_mode == 2
{
    con_add(":: DEMO: Завершено.");
    global.dem_mode = 3;
}
