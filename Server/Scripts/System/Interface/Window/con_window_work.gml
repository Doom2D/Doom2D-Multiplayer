if quiet != 0 {exit;}

var cmd;
cmd = API_Check_Command(1);
if cmd = 0 {exit;}

switch cmd
{
    case global.gui[2]:
        if API_Check_SecondaryCommand(1) = EN_CHANGE
        {
            var str, entp;
            entp = false;
            str = API_Control_GetText(global.gui[2]);
            if string_copy(str, string_length(str) - 1, 2) = eol {entp = true;}
            if string_count(eol, str) > 0
            {
                str = string_replace_all(str, eol, '');
                API_Control_SetText(global.gui[2], str);
                API_Edit_SetSel(global.gui[2], string_length(str), string_length(str));
            }
            if entp {con_parse(str);}
        }
    break;
   
    case global.gui[3]:
        var cmd_t, cmd_l;
        cmd_t = API_Control_GetText(global.gui[2]);
        con_parse(cmd_t);
        cmd_l = string_length(cmd_t);
        API_Control_SetFocus(global.gui[2]);
        API_Edit_SetSel(global.gui[2], cmd_l, cmd_l);
    break;
   
    case global.gui[4]:
        var cmd_l;
        API_Control_SetText(global.gui[2], prev_cmd);
        cmd_l = string_length(prev_cmd);
        API_Control_SetFocus(global.gui[2]);
        API_Edit_SetSel(global.gui[2], cmd_l, cmd_l);
    break;
}
