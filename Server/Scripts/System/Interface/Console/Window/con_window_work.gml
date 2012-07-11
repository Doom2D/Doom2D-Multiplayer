if quiet {exit;}
var cmd;
cmd = API_Check_Command(1);

if !cmd {exit;}
switch cmd
{
    case global.gui[2]:
        if API_Check_SecondaryCommand(1) = EN_CHANGE
        {
            var str, entp;
            entp = false;
            str = API_Control_GetText(global.gui[2]);
            if string_copy(str, string_length(str)-1, 2) = chr(13)+chr(10) {entp = true;}
            if string_count(chr(13)+chr(10), str) > 0
            {
                str = string_replace_all(str, chr(13)+chr(10), '');
                API_Control_SetText(global.gui[2], str);
                API_Edit_SetSel(global.gui[2], string_length(str), string_length(str));
            }
            if entp {con_parse(str);}
        }
    break;
   
    case global.gui[3]:
        con_parse(API_Control_GetText(global.gui[2]));
    break;
   
    case global.gui[4]:
        API_Control_SetText(global.gui[2], prev_cmd);
    break;
}
