//the ultrahuge input processing code
//a0 - client id

var byte_st, new_left, new_right;
byte_st = dll39_read_byte(0);
new_left = bit_get(byte_st, 7);
new_right = bit_get(byte_st, 6);
kb_left_n = new_left;
kb_rght_n = new_right;
kb_jump = bit_get(byte_st, 5);
kb_lkup = bit_get(byte_st, 4);
kb_lkdn = bit_get(byte_st, 3);
st_talk = bit_get(byte_st, 0);

if global.sv_sync_type == 0 || global.sv_sync_type == 1
{
  //retranslate
  dll39_buffer_clear(0);
  write_msg_id(7, 0);
  dll39_write_byte(c_id, 0);
  dll39_write_byte( build_byte( new_left, new_right, kb_jump, kb_lkup, kb_lkdn, 0, 0, st_talk ), 0 );
  dll39_write_short(x, 0);
  dll39_write_short(y, 0);
  with o_pl { dll39_message_send(cl_tcp, 0, 0, 0); }

  if global.sv_sync_type == 1 { plr_send_speed(); }
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
} else {
  if new_left == 1 {aim = -1;}
  if new_right == 1 {aim = 1;}
}

kb_left = new_left;
kb_rght = new_right;

