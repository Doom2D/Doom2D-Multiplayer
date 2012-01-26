//adds string to console
with o_host{
s = string(argument0);
if string_length(s) > 90
{
    s = string_insert('#', s, 91);
}
con_str += s + '#';
log_add(global.sys_log, s);
if string_length(con_str) > 1600 
{
    con_str = string_delete(con_str, 1, 400);
}
}
