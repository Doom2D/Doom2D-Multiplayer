//the ultrahuge input processing code
//a0 - client id

            var new_left, new_right;
            new_left = dyreadbyte(0);
            new_right = dyreadbyte(0);
            kb_left_n = new_left;
            kb_rght_n = new_right;
            kb_jump = dyreadbyte(0);
            kb_lkup = dyreadbyte(0);
            kb_lkdn = dyreadbyte(0);
            st_talk = dyreadbyte(0);
            
            if global.sv_sync_type == 0 || global.sv_sync_type == 1
            {
                //retranslate
                dyclearbuffer(0);
                dywritebyte(7, 0);
                dywritebyte(c_id, 0);
                dywritebyte(new_left, 0);
                dywritebyte(new_right, 0);
                dywritebyte(kb_jump, 0);
                dywritebyte(kb_lkup, 0);
                dywritebyte(kb_lkdn, 0);
                dywritebyte(st_talk, 0);
                dywriteshort(x, 0);
                dywriteshort(y, 0);
                with  o_pl
                {   
                    dysendmessage(cl_tcp, 0, 0, 0);
                }
                
                if global.sv_sync_type == 1
                {
                    plr_send_speed();
                }
            }
            
            //strafe shit
            if new_left == 1 && new_right == 1
            {
                if hsp > 0
                {
                    aim = -1;
                    new_left = 0;
                }
                if hsp < 0
                {
                    aim = 1;
                    new_right = 0;
                }
            }
            else
            {
                if new_left == 1 {aim = -1;}
                if new_right == 1 {aim = 1;}
            }
            kb_left = new_left;
            kb_rght = new_right;
