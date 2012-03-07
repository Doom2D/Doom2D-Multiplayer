//sends death message and adds a frag to the killer
//arg0 - killer id
//arg1 - victim id
//arg2 - kill type

dll39_buffer_clear(0);
dll39_write_byte(8, 0);
dll39_write_byte(argument0, 0);
dll39_write_byte(argument1, 0);
dll39_write_byte(argument2, 0);
with o_pl {dll39_message_send(cl_tcp, 0, 0, 0);}

if argument2 == 12 {exit;}

if global.sv_plr[argument1].hp < -25
{
    plr_send_effect(3, global.sv_plr[argument1].x, global.sv_plr[argument1].y);
    plr_send_sound(20, global.sv_plr[argument1].x, global.sv_plr[argument1].y);
}
else
{
    plr_send_corpse(argument1, global.sv_plr[argument1].x, global.sv_plr[argument1].y);
    plr_send_sound(8, global.sv_plr[argument1].x, global.sv_plr[argument1].y);
}

if argument0 != argument1 && argument0 != 0 
{
    global.sv_plr[argument0].frag += 1;
    if global.sv_plr[argument0].frag >= global.mp_fraglimit && global.mp_fraglimit > 0
    {
        o_host.alarm[0] = 1;
    }
}

if argument0 == argument1 && argument0 != 0 && global.mp_penalty
{
    if global.sv_plr[argument1].frag > 0 {global.sv_plr[argument1].frag -= 1;}
}

with (global.sv_plr[argument0]) {plr_send_stat();}

global.sv_plr[argument1].hp = 0;
global.sv_plr[argument1].ap = 0;
with (global.sv_plr[argument1]) {plr_send_stat();}
