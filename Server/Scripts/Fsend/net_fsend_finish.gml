//finishes file sending process
//arg0 - should be player respawned

dll39_buffer_free(fsend_buf);
net_fsend_init();
if argument0
{
  st_inv = 0;
  st_talk = 0;
  plr_respawn();
}
