//adds string to console
with o_host
{
    s = string(argument0);
    s = string_replace_all(s, '#', chr(13) + chr(10));
    log_add(global.sys_log, s);
    if quiet {exit;}
    API_Control_SetText(global.gui[1], s + chr(13) + chr(10) + string(API_Control_GetText(global.gui[1])));
}
