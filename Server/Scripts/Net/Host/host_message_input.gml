//the ultrahuge input processing code
//a0 - client id
            var c_id;
            c_id = argument0;
            new_left = dll39_read_byte(0);
            new_right = dll39_read_byte(0);
            global.sv_plr[c_id].kb_left_n = new_left;
            global.sv_plr[c_id].kb_rght_n = new_right;
            global.sv_plr[c_id].kb_jump = dll39_read_byte(0);
            global.sv_plr[c_id].kb_lkup = dll39_read_byte(0);
            global.sv_plr[c_id].kb_lkdn = dll39_read_byte(0);
            global.sv_plr[c_id].st_talk = dll39_read_byte(0);
            
            if global.sv_sync_type == 0 || global.sv_sync_type == 1
            {
                //retranslate
                dll39_buffer_clear(0);
                dll39_write_byte(7, 0);
                dll39_write_byte(c_id, 0);
                dll39_write_byte(new_left, 0);
                dll39_write_byte(new_right, 0);
                dll39_write_byte(global.sv_plr[c_id].kb_jump, 0);
                dll39_write_byte(global.sv_plr[c_id].kb_lkup, 0);
                dll39_write_byte(global.sv_plr[c_id].kb_lkdn, 0);
                dll39_write_byte(global.sv_plr[c_id].st_talk, 0);
                dll39_write_short(global.sv_plr[c_id].x, 0);
                dll39_write_short(global.sv_plr[c_id].y, 0);
                with  o_pl
                {   
                    dll39_message_send(cl_tcp, 0, 0, 0);
                }
                
                if global.sv_sync_type == 1 {with global.sv_plr[c_id] {plr_send_speed();}}
            }
            
            //strafe shit
            if new_left == 1 && new_right == 1
            {
                if global.sv_plr[c_id].hsp > 0
                {
                    global.sv_plr[c_id].aim = -1;
                    new_left = 0;
                }
                if global.sv_plr[c_id].hsp < 0
                {
                    global.sv_plr[c_id].aim = 1;
                    new_right = 0;
                }
            }
            else
            {
                if new_left == 1 {global.sv_plr[c_id].aim = -1;}
                if new_right == 1 {global.sv_plr[c_id].aim = 1;}
            }
            global.sv_plr[c_id].kb_left = new_left;
            global.sv_plr[c_id].kb_rght = new_right;
