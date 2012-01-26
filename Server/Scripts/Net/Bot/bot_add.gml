//adds a bot lol
//argument0 - name
//argument1 - skin
//argument2 - r
if global.map_w < 1 {exit;}
if instance_number(o_pl) >= global.sv_maxplayers {con_add(":: ERROR: Все слоты заняты."); exit;}

_id = host_find_slot();
if !global.bot_names
{
    _name = '[BOT] ' + string(_id);
}
else
{
    _name = argument0;
    if _name == "0" {_name = '[BOT] ' + string(_id);}
}
_skin = argument1;
_color = argument2;

_bot = host_add_player(_id, -1, _name, _skin, _color, true);
_bot.cl_ip = 'BOT';
_bot.kb_left = 1;
con_add(":: BOT: Добавлен бот " + _name + " в слот " + string(_id) + ".");
