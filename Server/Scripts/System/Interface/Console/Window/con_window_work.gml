if quiet {exit;}
c = API_Check_Command(1);
switch c
{
    case global.gui[3]:
    con_parse(API_Control_GetText(global.gui[2]));
    break;
    
    case global.gui[4]:
    API_Control_SetText(global.gui[2], prev_cmd);
    break;
}
