//processing client messages script

//vars
var msg_size, msg_id;

//Check for messages
while(1)
{
    msg_size = dll39_message_receive(o_host.sv_udp, 0, 0); //accept message via udp
    if (msg_size <= 0) msg_size = dll39_message_receive(cl_tcp, 0, 0); //if no udp then tcp
    if (msg_size <=0) break; //if nothing then break
    msg_id = dll39_read_byte(0); //read message id
    ping = 0;
    //process message
    switch msg_id
    {
        case 2:
            //client disconnected
            var c_id;
            //con_add("DEBUG: Received disconnect message");
            c_id = dll39_read_byte(0);
            
            con_add(":: Client " + string(global.sv_plr[c_id].cl_name) + "[" + string(c_id) + "] left.");
            with global.sv_plr[c_id] {instance_destroy();}      
            global.sv_plr[c_id] = noone;
            
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
            
            //inform admin
            //con_add("Received ping message from " + cl_name + ", sent pong.");
        break;
        
        case 5:
            //controls update
            var c_id;
            c_id = dll39_read_byte(0);
            new_left = dll39_read_byte(0);
            new_right = dll39_read_byte(0);
            global.sv_plr[c_id].kb_jump = dll39_read_byte(0);
            global.sv_plr[c_id].kb_lkup = dll39_read_byte(0);
            global.sv_plr[c_id].kb_lkdn = dll39_read_byte(0);
            _garbage = dll39_read_byte(0);
            
            //retranslate
            dll39_buffer_clear(0);
            dll39_write_byte(7, 0);
            dll39_write_byte(c_id, 0);
            dll39_write_byte(new_left, 0);
            dll39_write_byte(new_right, 0);
            dll39_write_byte(global.sv_plr[c_id].kb_jump, 0);
            dll39_write_byte(global.sv_plr[c_id].kb_lkup, 0);
            dll39_write_byte(global.sv_plr[c_id].kb_lkdn, 0);
            dll39_write_byte(global.sv_plr[c_id].kb_strf, 0);
            dll39_write_short(global.sv_plr[c_id].x, 0);
            dll39_write_short(global.sv_plr[c_id].y, 0);
            with  o_pl
            {   
                dll39_message_send(cl_tcp, 0, 0, 0);
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
        break;
        
        case 6:
            //someone attacks
            var attacker_id;
            attacker_id = dll39_read_byte(0);
            with global.sv_plr[attacker_id] {plr_shoot();}
        break;
        
        case 7:
            //weapon change request
            var ch_id, ch_t;
            ch_id = dll39_read_byte(0);
            ch_t = dll39_read_byte(0);
            with global.sv_plr[ch_id] {plr_changewpn(ch_t);}
        break;
    }
}
