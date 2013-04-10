//adds string to console
with o_con
{
  s = string(argument0);
  if string_length(s) > 145 && string_count('#', s) == 0
  {
    s = string_insert('#', s, 146);
  }
  con_str += s + '#';
  if !argument1 {msg_add(s);}
  log_add(global.sys_log, s);
  if string_length(con_str) > 1600 
  {
    con_str = string_delete(con_str, 1, string_pos('#', con_str));
  }
}
