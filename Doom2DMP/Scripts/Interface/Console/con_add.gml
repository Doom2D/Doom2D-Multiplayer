//adds string to console
with o_con{
con_str += string(argument0) + '#';
msg_add(string(argument0));
log_add(global.sys_log, string(argument0));
if string_length(con_str) > 1600 
{
    con_str = string_delete(con_str, 1, 400);
}
}
