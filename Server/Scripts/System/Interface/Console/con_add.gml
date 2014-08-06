//adds string to console

with o_host
{
  var str;
  str = string_replace_all( string(argument0), '#', eol );
  log_add(global.sys_log, str);
  if quiet {exit;}
  API_Control_SetText( global.gui[1], str + eol + string( API_Control_GetText(global.gui[1]) ) );
}
