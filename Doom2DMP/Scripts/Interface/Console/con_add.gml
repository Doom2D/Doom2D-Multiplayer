//adds string to console
with o_con
{
  var str, t_cnt;
  str = string(argument0);
  if string_length(str) > 145 && string_count('#', str) == 0 { str = string_insert('#', str, 146); }
  con_str += str + '#';
  if !argument1 && room != rm_init {msg_add(str);}
  log_add(global.sys_log, str);

  t_cnt = string_count('#', con_str);
  if t_cnt > 20
  {
    repeat t_cnt - 20
    {
      con_str = string_delete(con_str, 1, string_pos('#', con_str));
    }
  }
}
