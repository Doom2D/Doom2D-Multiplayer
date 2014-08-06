//process messages
var msg_size, msg_id, msg_blocks;

while 1
{
  //receive shit
  if global.dem_mode == 3 {exit;}
  if global.dem_mode < 2
  {
    msg_size = dll39_message_receive(global.cl_tcp, 0, dll39_default_buffer);
    if msg_size < 0 {exit;} //got nothing
  } else {
    msg_size = 0;
  }

  _delay = 0;

  if global.dem_mode == 2
  {
    if _dem_time || global.dem_pause {exit;}
    demo_tic();
  }
  
  /*
  msg_blocks = 0;
  while dll39_bytes_left(dll39_default_buffer) > 0
  {
    //reading 39dll size signature
    if msg_blocks > 0 {dll39_read_ushort(dll39_default_buffer);} else {msg_blocks += 1;}
  */
    msg_id = dll39_read_byte(dll39_default_buffer); //got message id
    if msg_id != dll39_read_byte(dll39_default_buffer) {exit;} //simple protocol validity check

    if global.dem_mode == 1 && msg_id > 0 && msg_id != 21 && msg_id != 22 && msg_id != 23
    {
      dll39_write_ushort(_dem_delay, global.dem_b);
      dll39_write_ushort(msg_size, global.dem_b);
      dll39_buffer_copy(global.dem_b, dll39_default_buffer);
      _dem_delay = 0;
    }

    switch msg_id
    {
      case 1:
        if global.map_w {break;}

        //receive mah id and server info
        var sv_dlallow;
        global.pl_id = dll39_read_byte(dll39_default_buffer);
        global.sv_name = dll39_read_string(dll39_default_buffer);
        global.sv_map = dll39_read_string(dll39_default_buffer);
        global.sv_map_md5 = dll39_read_string(dll39_default_buffer);
        global.sv_maxplayers = dll39_read_byte(dll39_default_buffer);
        global.mp_scorelimit = dll39_read_byte(dll39_default_buffer);
        global.mp_gamemode = dll39_read_byte(dll39_default_buffer);
        sv_dlallow = dll39_read_byte(dll39_default_buffer);
        global.cl_fps_max = dll39_read_byte(dll39_default_buffer);
        _welcome = dll39_read_string(dll39_default_buffer);
        con_add(':: NET: Получена информация о сервере.');

        if !sv_dlallow { con_add(':: NET: FGET: Передача карт отключена на сервере.'); }
        if !sv_dlallow || global.dem_mode == 2 {event_user(0);}

        room_speed = global.cl_fps_max;
        alarm[0] = 5;
        alarm[11] = 45 * global.cl_fps_max;
      break;

      case 2:
        //got kicked
        //string contains reason
        con_add(":: NET: Вас кикнули: " + dll39_read_string(dll39_default_buffer));
        cl_disconnect();
        if global.map_w > 0 && global.dem_mode < 2
        {
          r_inter(2, 255);
          room_goto(rm_inter);
        } else {
          mus_play(global.mus_menu);
          demo_finish();
          room_goto(rm_menu);
        }
      break;

      case 3:
        //some create new player
        //args: id, name, team, skin, color
        if global.fget_state {break;}
        cl_new_plr( dll39_read_byte(dll39_default_buffer),
                    dll39_read_string(dll39_default_buffer),
                    dll39_read_byte(dll39_default_buffer),
                    dll39_read_string(dll39_default_buffer),
                    dll39_read_int(dll39_default_buffer) );
        if instance_exists(o_hud) { with o_hud { if !alarm[0] {net_list_clients();} } }
      break;

      case 4:
        //player left
        if global.fget_state {break;}
        var _id;
        _id = dll39_read_byte(dll39_default_buffer);
        if _id < 1 {break;}
        if !instance_exists(global.cl_plr[_id]) {break;}
        con_add('Игрок ' + global.cl_plr[_id].cl_name + ' вышел.');
        if global.cl_plr[_id].object_index != o_client {with global.cl_plr[_id] {instance_destroy();}}
        global.cl_plr[_id] = noone;
        if instance_exists(o_hud) { with o_hud { if !alarm[0] {net_list_clients();} } }
      break;

      case 5:
        //chat message
        //string contains it
        con_add( dll39_read_string(dll39_default_buffer) );
        snd_play(24);
      break;

      case 6:
        //received pong
        if global.fget_state {break;}
        global.cl_ping = round( _timer / (global.cl_fps_max / 1000) );
        _timer = 0;
        if global.dem_mode == 2 {global.cl_ping = 0;}
      break;

      case 7:
        //received position update
        if global.fget_state {break;}
        var _id, byte_st;
        _id = dll39_read_byte(dll39_default_buffer);
        if !instance_exists(global.cl_plr[_id]) {break;}
        byte_st = dll39_read_byte(dll39_default_buffer);
        new_left = bit_get(byte_st, 7);
        new_right = bit_get(byte_st, 6);
        if new_left == 1 && new_right == 1
        {
          if global.cl_plr[_id].hsp > 0
          {
            global.cl_plr[_id].image_xscale = -1;
            new_left = 0;
          }
          if global.cl_plr[_id].hsp < 0
          {
            global.cl_plr[_id].image_xscale = 1;
            new_right = 0;
          }
        } else {
          if new_left == 1 {global.cl_plr[_id].image_xscale = -1;}
          if new_right == 1 {global.cl_plr[_id].image_xscale = 1;}
        }
        global.cl_plr[_id].kb_left = new_left;
        global.cl_plr[_id].kb_rght = new_right;
        global.cl_plr[_id].kb_jump = bit_get(byte_st, 5);
        global.cl_plr[_id].kb_lkup = bit_get(byte_st, 4);
        global.cl_plr[_id].kb_lkdn = bit_get(byte_st, 3);
        global.cl_plr[_id].st_talk = bit_get(byte_st, 0);
        if global.cl_interp
        {
          global.cl_plr[_id].xto = dll39_read_short(dll39_default_buffer);
          global.cl_plr[_id].yto = dll39_read_short(dll39_default_buffer);
          with global.cl_plr[_id] {if abs(x - xto) > 128 || abs(y - yto) > 128 {x = xto; y = yto;}}
        } else {
          global.cl_plr[_id].x = dll39_read_short(dll39_default_buffer);
          global.cl_plr[_id].y = dll39_read_short(dll39_default_buffer);
          global.cl_plr[_id].xto = 99999;
          global.cl_plr[_id].yto = 99999;
        }
      break;

      case 8:
        //kill message
        if global.fget_state {break;}
        var killer_id, victim_id, killer_name, victim_name, kill_type, kill_msg;
        killer_id = dll39_read_byte(dll39_default_buffer);
        victim_id = dll39_read_byte(dll39_default_buffer);
        if killer_id < 0 || victim_id < 0 {exit;}
        kill_type = dll39_read_byte(dll39_default_buffer);
        victim_name = 'def_victim';
        killer_name = 'def_killer';
        if killer_id > 0 && !instance_exists(global.cl_plr[killer_id]) {break;}
        if !instance_exists(global.cl_plr[victim_id]) {break;}
        if killer_id != 0 {killer_name = global.cl_plr[killer_id].cl_name;}
        victim_name = global.cl_plr[victim_id].cl_name;
        if killer_id == victim_id {con_add(killer_name + ' прощается с жестоким миром.'); break;}

        switch kill_type
        {
          case 1: kill_msg = killer_name + ' угостил ' + victim_name + ' пистолетной пулей.'; break;
          case 2: kill_msg = killer_name + ' застрелил ' + victim_name + ' из ружья.'; break;
          case 3: kill_msg = killer_name + ' разорвал ' + victim_name + ' выстрелом из двустволки.'; break;
          case 4: kill_msg = killer_name + ' превратил ' + victim_name + ' в дуршлаг.'; break;
          case 5: kill_msg = killer_name + ' взорвал ' + victim_name + '.'; break;
          case 6: kill_msg = killer_name + ' прожег плазмой дырку в ' + victim_name + '.'; break;
          case 7: kill_msg = killer_name + ' познакомил ' + victim_name + ' с зарядом BFG.'; break;
          case 8: kill_msg = victim_name + ' был превращен в фарш суперпулеметом ' + killer_name; break;
          case 9: kill_msg = victim_name + ' утонул.'; break;
          case 10:
          case 11: kill_msg = victim_name + ' растворился в кислоте.'; break;
          case 12: kill_msg = victim_name + ' выпал.'; break;
          case 13: kill_msg = killer_name + ' сломал челюсть ' + victim_name + '.'; break;
          case 14: kill_msg = killer_name + ' распилил ' + victim_name + '.'; break;
          default: kill_msg = victim_name + ' умер.';
        }
        con_add(kill_msg);
        if instance_exists(o_hud) { with o_hud { if !alarm[0] {net_list_clients();} } }
      break;

      case 9:
        //stats update
        if global.fget_state {break;}
        var _id, byte_st, _oh;
        _oh = 0;
        _id = dll39_read_byte(dll39_default_buffer);
        if !instance_exists(global.cl_plr[_id]) {break;}
        if _id = global.pl_id {_oh = global.cl_plr[_id].hp;}
        global.cl_plr[_id].hp = dll39_read_byte(dll39_default_buffer);
        global.cl_plr[_id].ap = dll39_read_byte(dll39_default_buffer);
        global.cl_plr[_id].a1 = dll39_read_short(dll39_default_buffer);
        global.cl_plr[_id].a2 = dll39_read_short(dll39_default_buffer);
        global.cl_plr[_id].a3 = dll39_read_short(dll39_default_buffer);
        global.cl_plr[_id].a4 = dll39_read_short(dll39_default_buffer);
        global.cl_plr[_id].w = dll39_read_byte(dll39_default_buffer);
        global.cl_plr[_id].frag = dll39_read_byte(dll39_default_buffer);

        byte_st = dll39_read_byte(dll39_default_buffer);
        global.cl_plr[_id].st_inv = bit_get(byte_st, 7);
        global.cl_plr[_id].st_vis = bit_get(byte_st, 6);
        global.cl_plr[_id].st_ber = bit_get(byte_st, 5);
        global.cl_plr[_id].st_suit = bit_get(byte_st, 4);

        global.cl_plr[_id].st_flag = dll39_read_byte(dll39_default_buffer);
        global.cl_plr[_id].alarm[2] = 1;

        //pain splash
        if !instance_exists(o_hud) {break;}
        if _id == o_hud.viewing && _oh > 10 {o_hud.pain_alpha += max( 0, (_oh - global.cl_inst.hp) / 100 );}
        with o_hud { if !alarm[0] {net_list_clients();} }
      break;

      case 10:
        //item create
        if global.fget_state {break;}
        var _id, it, xx, yy, anm, o;
        _id = dll39_read_short(dll39_default_buffer);
        _it = dll39_read_byte(dll39_default_buffer);
        xx = dll39_read_short(dll39_default_buffer);
        yy = dll39_read_short(dll39_default_buffer);
        anm = dll39_read_byte(dll39_default_buffer);
        if instance_exists(global.cl_itm[_id]) {exit;}
        o = instance_create(xx, yy, o_item);
        o.item_id = _id;
        o.item = _it;
        o.anim_st = anm;
        global.cl_itm[_id] = o;
      break;

      case 11:
        //item destroy
        if global.fget_state {break;}
        var d_id;
        d_id = dll39_read_short(dll39_default_buffer);
        if !instance_exists(global.cl_itm[d_id]) {break;}
        global.cl_itm[d_id].alarm[1] = 1;
        global.cl_itm[d_id] = noone;
      break;

      case 12:
        //particles
        //args: type, x, y
        if global.fget_state {break;}
        r_part_emit( dll39_read_byte(dll39_default_buffer),
                     dll39_read_short(dll39_default_buffer),
                     dll39_read_short(dll39_default_buffer) );
      break;

      case 13:
        //sound
        //args: sound id, play x, play y
        if global.fget_state {break;}
        snd_play_pos( dll39_read_byte(dll39_default_buffer),
                      dll39_read_short(dll39_default_buffer),
                      dll39_read_short(dll39_default_buffer) );
      break;

      case 14:
        //sprite change
        if global.fget_state {break;}
        var spr_id, spr_attack, spr_pain;
        spr_id = dll39_read_byte(dll39_default_buffer);
        if !instance_exists(global.cl_plr[spr_id]) {break;}
        spr_attack = dll39_read_byte(dll39_default_buffer);
        spr_pain = dll39_read_byte(dll39_default_buffer);
        global.cl_plr[spr_id].attack = spr_attack;
        global.cl_plr[spr_id].pain = spr_pain;
        global.cl_plr[spr_id].alarm[0] = 32;
        global.cl_plr[spr_id].alarm[1] = 10;
        if spr_pain == 1
        {
          global.cl_plr[spr_id].dname = true;
          global.cl_plr[spr_id].alarm[3] = 60;
        }
      break;

      case 15:
        //an hero appears
        //args: player id, death x, death y
        if global.fget_state {break;}
        r_corpse( dll39_read_byte(dll39_default_buffer),
                  dll39_read_short(dll39_default_buffer),
                  dll39_read_short(dll39_default_buffer) );
      break;

      case 16:
        //projectile
        if global.fget_state {break;}
        r_projectile( dll39_read_short(dll39_default_buffer),
                      dll39_read_byte(dll39_default_buffer),
                      dll39_read_double(dll39_default_buffer),
                      dll39_read_double(dll39_default_buffer),
                      dll39_read_double(dll39_default_buffer) );
      break;

      case 17:
        //speed
        if global.fget_state {break;}
        var s_id, s_inst;
        s_id = dll39_read_byte(dll39_default_buffer);
        if !instance_exists(global.cl_plr[s_id]) {break;}
        s_inst = id_to_cl(s_id);
        s_inst.hsp = byte_sign( dll39_read_byte(dll39_default_buffer) );
        s_inst.vsp = byte_sign( dll39_read_byte(dll39_default_buffer) );
      break;

      case 18:
        //explosion
        if global.fget_state {break;}
        r_explosion( dll39_read_byte(dll39_default_buffer),
                     dll39_read_byte(dll39_default_buffer),
                     dll39_read_short(dll39_default_buffer),
                     dll39_read_short(dll39_default_buffer) );
      break; 

      case 19:
        //game over
        if global.dem_mode >= 2 {break;}
        r_inter( dll39_read_byte(dll39_default_buffer),
                 dll39_read_byte(dll39_default_buffer) );
        cl_disconnect();
        room_goto(rm_inter);
      break;

      case 20:
        //char params change
        if global.fget_state {break;}
        _id = dll39_read_byte(dll39_default_buffer);
        _inst = id_to_cl(_id);
        if !instance_exists(_inst) {break;}
        _new_name = dll39_read_string(dll39_default_buffer);
        _new_skin = dll39_read_string(dll39_default_buffer);
        _new_color = dll39_read_int(dll39_default_buffer);
        if _inst.cl_name != _new_name
        {
          con_add(_inst.cl_name + " теперь известен как " + _new_name);
          _inst.cl_name = _new_name;
        }
        if _inst.cl_color != _new_color {_inst.cl_color = _new_color;}
        if _inst.cl_skin != _new_skin
        {
          _inst.cl_skin = _new_skin;
          //skin_release(_inst);
          with _inst {skin_load(cl_skin);}
        }
        if instance_exists(o_hud) { with o_hud { if !alarm[0] {net_list_clients();} } }
      break;

      case 21:
        //fsend state
        var _state;
        _state = dll39_read_byte(dll39_default_buffer);
        if _state == false && global.fget_state {net_fget_finish(); break;}

        if _state == true && !global.fget_state
        {
          var _file, _size, _md5, _cmd5;
          _file = dll39_read_string(dll39_default_buffer);
          _size = dll39_read_uint(dll39_default_buffer);
          _md5 = dll39_read_string(dll39_default_buffer);
          _cmd5 = dll39_read_string(dll39_default_buffer);
          net_fget_start(_file, _size, _md5, _cmd5);
        }
      break;

      case 22:
        //fsend data chunk
        net_fget_main();
      break;

      case 23:
        //hud text
        if global.fget_state || global.dem_mode >= 2 {break;}
        var n, ns, nt, nf, nc, nx, ny, ns;
        n = 1;
        ns = dll39_read_string(dll39_default_buffer); //text
        nt = get_seconds( dll39_read_double(dll39_default_buffer) ); //timer
        nf = dll39_read_byte(dll39_default_buffer); //font
        nc = dll39_read_int(dll39_default_buffer);
        nx = dll39_read_double(dll39_default_buffer); //offset x
        ny = dll39_read_double(dll39_default_buffer); //offset y
        n = dll39_read_byte(dll39_default_buffer);
        for (i = 1; i <= 4; i += 1)
        {
          if global.hud_text[i, 1] == '' && n == 0 {n = i; break;}
        }
        global.hud_text[n, 1] = ns; //text
        global.hud_text[n, 2] = nt; //timer
        f = nf; //font
        global.hud_text[n, 6] = nc;
        global.hud_text[n, 4] = nx; //offset x
        global.hud_text[n, 5] = ny; //offset y
        switch f
        {
          case 1: global.hud_text[n, 3] = global.fnt_sys; break;
          case 2: global.hud_text[n, 3] = global.fnt_small; break;
          case 3: global.hud_text[n, 3] = global.fnt_big; break;
        }
      break;

      case 24:
        //team change
        if global.fget_state {break;}
        _id = dll39_read_byte(dll39_default_buffer);
        _inst = id_to_cl(_id);
        if !instance_exists(_inst) {break;}
        _team = dll39_read_byte(dll39_default_buffer);
        if _team == 1 {con_add(":: Игрок " + string(_inst.cl_name) + " перешел в красную команду.");}
        else {con_add(":: Игрок " + string(_inst.cl_name) + " перешел в синюю команду.");}
        _inst.cl_team = _team;
        if instance_exists(o_hud) { with o_hud { if !alarm[0] {net_list_clients();} } }
      break;

      case 25:
        //team score
        if global.fget_state {break;}
        global.team_score[1] = dll39_read_byte(dll39_default_buffer);
        global.team_score[2] = dll39_read_byte(dll39_default_buffer);
        if instance_exists(o_hud) { with o_hud { if !alarm[0] {net_list_clients();} } }
      break;

      case 26:
        //tile change
        if global.fget_state {break;}
        var tile, state;
        tile = ds_list_find_value( global.cl_tiles, dll39_read_ushort(dll39_default_buffer) );
        if !instance_exists(tile) {break;}
        state = dll39_read_byte(dll39_default_buffer);

        if state == true
        {
          with tile
          {
            visible = true;
            image_index = 0;
            x = xstart;
            y = ystart;
          }
        } else if state == false {
          with tile
          {
            visible = false;
            x = -2048;
            y = -2048;
          }
        }
      break;

      case 27:
        //server shit change
        if global.fget_state {break;}
        global.sv_name = dll39_read_string(dll39_default_buffer);
        global.sv_maxplayers = dll39_read_byte(dll39_default_buffer);
        global.mp_scorelimit = dll39_read_byte(dll39_default_buffer);
      break;

      case 28:
        //projectile destroy
        if global.fget_state {break;}
        var proj, prin;
        proj = dll39_read_short(dll39_default_buffer);
        prin = ds_list_find_value(global.cl_proj, proj);

        if !instance_exists(prin) {break;}

        with prin {instance_destroy();}
        ds_list_replace(global.cl_proj, proj, noone);
      break;

      default:
        con_add(":: NET: DEBUG: Принят пакет с неизвестным ID (" + string(msg_id) + ").");
        global.debug_counter += 1;
        alarm[11] = 30 * global.cl_fps_max;
        if global.debug_counter > 15 && global.dem_mode < 2
        {
          con_add(":: NET: DEBUG: Слишком много неопознанных пакетов. Возможно, сервер вылетел.");
          cl_disconnect();
          mus_play(global.mus_menu);
          room_goto(rm_menu);
        }
    }
//  }
}

