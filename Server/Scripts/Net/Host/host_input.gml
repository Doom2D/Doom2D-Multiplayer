if quiet != 2 {exit;}
if !keyboard_check(vk_control) {exit;}

if keyboard_check_pressed(vk_f1)
{
    con_parse('bot_add');
}
if keyboard_check_pressed(vk_f2)
{
    con_parse('bot_kick');
}
if keyboard_check_pressed(vk_f3)
{
    con_parse('bot_dummy ' + string(!global.bot_dummy));
}
if keyboard_check_pressed(vk_f4)
{
    if !global.sv_cycle_maps {exit;}
    alarm[0] = 1;
}
if keyboard_check_pressed(vk_f5)
{
    con_parse('resync');
}
if keyboard_check_pressed(vk_f6)
{
    con_parse('repack');
}
if keyboard_check_pressed(vk_f7)
{
    con_parse('sv_lan ' + string(!global.sv_lan));
}
if keyboard_check_pressed(vk_f8)
{
    if !global.sv_autoexec {exit;}
    cfg_load('autoexec.cfg'); //load autoexec

    if global.sv_autoexec == 2
    {
        cfg_load('mapcfg\' + string(argument0) + '.cfg');
    }
}
if keyboard_check_pressed(vk_f9)
{
    con_parse('restart 0');
}
if keyboard_check_pressed(vk_f10)
{
    con_parse('restart 1');
}
if keyboard_check_pressed(vk_f11)
{
    con_parse('exit');
}
if keyboard_check_pressed(vk_f12)
{
    con_parse('die');
}
