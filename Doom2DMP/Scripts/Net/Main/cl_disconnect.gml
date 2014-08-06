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
if global.fget_state {net_fget_abort(false);}

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

r_part_wipe();
skin_release(o_pl);

//destroy sockets
if global.dem_mode < 2 
{
  dll39_socket_close(global.cl_tcp);
  con_add(":: NET: Закрываем сокеты...");
  con_add(":: NET: Отключено.");
}

