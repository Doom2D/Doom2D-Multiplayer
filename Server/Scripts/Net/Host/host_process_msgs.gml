//processing client messages script

//vars
var msg_size, msg_id;

//Check for messages
while(1)
{
  msg_size = dll39_message_receive(cl_tcp, 0, 0); //if no udp then tcp
  if msg_size <= 0 {break;} //if nothing then break
  msg_id = dll39_read_byte(0); //read message id
  ping = 0;
  //process message
  switch msg_id
  {
    case 2:
      //client disconnected
      var c_id, c_nm;
      //con_add("DEBUG: Received disconnect message");
      c_id = dll39_read_byte(0);
      if !instance_exists(global.sv_plr[c_id]) {break;}
      c_nm = string(global.sv_plr[c_id].cl_name);
      with global.sv_plr[c_id]
      {
        if global.vote_now && !cl_is_bot && !fsend_state && voted {net_vote();}
        instance_destroy();
      }      
      global.sv_plr[c_id] = noone;
      con_add(":: NET: Клиент " + c_nm + "[" + string(c_id) + "] вышел.");

      //send this to other clients
      dll39_buffer_clear(0);
      write_msg_id(4, 0);
      dll39_write_byte(c_id, 0);
      with (o_pl) {dll39_message_send(cl_tcp, 0, 0, 0);}
    break;

    case 3:
      //chat message
      var msg_str;
      msg_str = dll39_read_string(0);

      //send this to other client
      dll39_buffer_clear(0);
      write_msg_id(5, 0);
      dll39_write_string(msg_str, 0);
      with (o_pl) {dll39_message_send(cl_tcp, 0, 0, 0)};

      con_add(msg_str);
      
      with o_plugin
      {
        last_chat = string_replace(msg_str, other.cl_name + ": ", "");
        last_plr = other;
        plug_exec(PLUG_ONCHAT);
      }
    break;

    case 4:
      //received ping     
      //send pong back
      dll39_buffer_clear(0);
      write_msg_id(6, 0);
      dll39_message_send(cl_tcp, 0, 0, 0);
    break;

    case 5:
      //controls update
      host_message_input(cl_id);
    break;

    case 6:
      //someone attacks
      plr_shoot();
    break;

    case 7:
      //weapon change request
      plr_changewpn(dll39_read_byte(0));
    break;

    case 8:
      //rcon request
      if !global.sv_rcon {break;}
      var r_cmd, r_pwd;
      r_cmd = dll39_read_string(0);
      r_pwd = dll39_read_string(0);
      if r_pwd != global.sv_rcon_pwd {break;}
      con_parse(r_cmd);
    break;

    case 9:
      //cheat
      var _cht;
      _cht = dll39_read_byte(0);
      if _cht < 1 {break;}
      switch _cht
      {
        case 1:
          //godmode
          if !global.sv_cheats {break;}
          st_inv = 1;
          hp = 200;
          ap = 200;
        break;

        case 2:
          //flymode
          if !global.sv_cheats {break;}
          st_jet = 1;
        break;

        case 3:
          //all weapons
          if !global.sv_cheats {break;}
          hw[2] = 1;
          hw[3] = 1;
          hw[4] = 1;
          hw[5] = 1;
          hw[6] = 1;
          hw[7] = 1;
          hw[8] = 1;
          hw[9] = 1;
          st_bpk = 1;
          a1 = 999;
          a2 = 999;
          a3 = 999;
          a4 = 999;
        break;

        case 4:
          //insta-death
          killer_id = cl_id;
          kill_type = 1;
          plr_hurt(999);
        break;
      }
      plr_send_stat();
    break;

    case 10:
      //color/skin/name change
      ds_list_delete( global.name_taken, list_get_ind('name_taken', cl_name) );
      cl_name = dll39_read_string(0);
      list_add("name_taken", cl_name);

      cl_skin = dll39_read_string(0);
      if global.mp_gamemode == GAME_DM {cl_color = dll39_read_int(0);}

      //retranslate
      plr_send_skin();
    break;

    case 11:
      if !fsend_state {break;}
      con_add(':: NET: FSEND: Передача прервана клиентом.');
      net_fsend_finish(dll39_read_byte(0));
    break;

    case 12:
      var _team, red, blu;
      _team = dll39_read_byte(0);
      red = team_count(1);
      blu = team_count(2);

      if _team == 1 && (red < blu || !global.mp_autobalance)
      {
        cl_team = 1;
        cl_color = c_red;
        plr_send_team();
        plr_send_skin();
        plr_kill(cl_id);
      }

      if _team == 2 && (red > blu || !global.mp_autobalance)
      {
        cl_team = 2;
        cl_color = c_blue;
        plr_send_team();
        plr_send_skin();
        plr_kill(cl_id);
      }
    break;

    case 13:
      //client requests tile update
      var lst_s, t_id;
      with par_trigger
      {
        lst_s = ds_list_size(tiles);
        for(i = 0; i < lst_s; i += 1)
        {
          t_id = ds_list_find_value(tiles, i);
          dll39_buffer_clear(0);
          write_msg_id(26, 0);
          dll39_write_ushort(t_id.tile_id, 0);
          dll39_write_byte(t_id.active, 0);
          dll39_message_send(other.cl_tcp, 0, 0, 0);
        }
      }
    break;

    case 14:
      //client +use's
      plr_use();
    break;

    case 15:
      //voting
      if fsend_state {exit;}
      var t;
      t = dll39_read_byte(0);
      if t == 0 {net_vote_start(dll39_read_string(0)); break;}
      if t == 1 {net_vote();}
    break;

    case 16:
      //fsend inb req
      if fsend_state {net_fsend_main();}
    break;
    
    case 17:
      //flag drop request
      if global.mp_gamemode != GAME_CTF {break;}
      if st_flag == 1 
      {
        i = item_find_slot();
        o = instance_create(x - 32, y - 24, o_item);
        o.item_id = i;
        o.item = 29;
        o.drop = 1;
        global.sv_itm[i] = o;
        if x < global.map_w && x > 0 && y < global.map_h && y > 0
        {
            o.alarm[1] = global.mp_drop_clear * global.sv_fps_max;
        } else {
            o.alarm[1] = 1;
        }
        item_send_create(i, o.item, x - 32, y - 24, false);
    
        global.red_flag = 2;
        if global.mp_announcer {with o_pl {plr_send_text(cl_id, other.cl_name + ' ВЫРОНИЛ КРАСНЫЙ ФЛАГ!', 3, 2, c_blue, 412, 264, 1);}}
        st_flag = 0;
      }
      if st_flag == 2 
      {
        i = item_find_slot();
        o = instance_create(x - 32, y - 24, o_item);
        o.item_id = i;
        o.item = 30;
        o.drop = 1;
        global.sv_itm[i] = o;
        if x < global.map_w && x > 0 && y < global.map_h && y > 0
        {
            o.alarm[1] = global.mp_drop_clear * global.sv_fps_max;
        } else {
            o.alarm[1] = 1;
        }
        item_send_create(i, o.item, x - 32, y - 24, false);
    
        global.blu_flag = 2;
        if global.mp_announcer {with o_pl {plr_send_text(cl_id, other.cl_name + ' ВЫРОНИЛ СИНИЙ ФЛАГ!', 3, 2, c_red, 412, 264, 1);}}
        st_flag = 0;
      }
      cantflag = true;
      alarm[8] = 2 * global.sv_fps_max;
      plr_send_stat();
    break;
  }
}

