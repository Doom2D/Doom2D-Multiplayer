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
        if global.vote_now && !variable_local_exists('cl_is_bot') && !fsend_state && voted {net_vote();}
        instance_destroy();
      }      
      global.sv_plr[c_id] = noone;
      con_add(":: NET: Клиент " + c_nm + "[" + string(c_id) + "] вышел.");

      //send this to other clients
      dll39_buffer_clear(0);
      dll39_write_byte(4, 0);
      dll39_write_byte(c_id, 0);
      with (o_pl) {dll39_message_send(cl_tcp, 0, 0, 0);}
    break;

    case 3:
      //chat message
      var msg_str;
      msg_str = dll39_read_string(0);

      //send this to other client
      dll39_buffer_clear(0);
      dll39_write_byte(5, 0);
      dll39_write_string(msg_str, 0);
      with (o_pl) {dll39_message_send(cl_tcp, 0, 0, 0)};

      con_add(msg_str);
    break;

    case 4:
      //received ping     
      //send pong back
      dll39_buffer_clear(0);
      dll39_write_byte(6, 0);
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
      var ch_t;
      plr_changewpn(dll39_read_byte(0));
    break;

    case 8:
      //rcon request
      var r_cmd, r_pwd;
      if !global.sv_rcon {break;}
      r_cmd = dll39_read_string(0);
      r_pwd = dll39_read_string(0);
      if r_pwd != global.sv_rcon_pwd {break;}
      con_parse(r_cmd);
    break;

    case 9:
      //cheat
      var _cht, _inst;
      _cht = 1;
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
      cl_name = dll39_read_string(0);
      cl_skin = dll39_read_string(0);
      if global.mp_gamemode == 0 {cl_color = dll39_read_int(0);} else {dll39_read_int(0);};

      //retranslate
      plr_send_skin();
    break;

    case 11:
      con_add(':: NET: FSEND: Передача прервана клиентом.');
      if fsend_state && fsend_file != -1
      {
        dll39_file_close(fsend_file);
        if dll39_buffer_exists(fsend_buf) {dll39_buffer_free(fsend_buf);}
      }
      fsend_state = 0;
      fsend_path = '';
      fsend_file = -1;
      fsend_pos = 0;
      fsend_state = 0;
      fsend_size = 0;
      st_inv = 0;
      st_talk = 0;
      plr_respawn();
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
      with (o_solid)
      {
        dll39_buffer_clear(0);
        dll39_write_byte(26, 0);
        dll39_write_ushort(tile_id, 0);
        dll39_write_byte(active, 0);
        dll39_message_send(other.cl_tcp, 0, 0, 0);
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
  }
}

