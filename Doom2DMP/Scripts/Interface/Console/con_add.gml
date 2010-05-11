//adds string to console
with o_con{
con_str += string(argument0) + '#';
msg_add(string(argument0));
log_add(global.sys_log, string(argument0));
yy += 16;
if yy > 288
{
  yyy -= 16;
}}
