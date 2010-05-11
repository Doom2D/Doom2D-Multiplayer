//adds string to console
with o_host{
con_str += string(argument0) + '#';
log_add(global.sys_log, string(argument0));
yy += 16;
if yy > 450
{
  yyy -= 16;
}}
