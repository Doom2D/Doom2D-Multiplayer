//adds a bot lol
//argument0 - name

if instance_number(o_pl) >= global.sv_maxplayers {con_add(":: ERROR: Все слоты заняты."); exit;}

_id = host_find_slot();
//if !global.bot_names
//{
_name = 'BOT ' + string(_id);
//}
_skin = choose("doomer", "mario", "ssman", "ewj");
_color = make_color_rgb(round(random(255)), round(random(255)), round(random(255)));

_bot = host_add_player(_id, -1, _name, _skin, _color, true);
_bot.cl_ip = 'BOT';
_bot.kb_left = 1;
con_add("Added bot " + _name + " in slot " + string(_id) + ".");
