//adds text to msgs at the top
//argument0 - text
with o_con
{
  msg_str += string(argument0) + '#';
  var t_cnt;
  t_cnt = string_count('#', msg_str);
  if t_cnt > 7
  {
    repeat t_cnt - 7
    {
      msg_str = string_delete(msg_str, 1, string_pos('#', msg_str));
    }
  }
  alarm[0] = 222;
}
