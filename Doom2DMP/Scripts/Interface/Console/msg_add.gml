//adds text to msgs at the top
//argument0 - text
with o_con{
msg_str += string(argument0) + '#';
if string_length(msg_str) > 300 
{
    msg_str = string_delete(msg_str, 1, 100);
}
alarm[0] = 196;}
