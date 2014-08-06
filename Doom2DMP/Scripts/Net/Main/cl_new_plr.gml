//creating new player
//0 - id
//1 - name
//2 - team
//3 - skin
//4 - color

if instance_exists( global.cl_plr[argument0] ) {exit;}

var _inst;
_inst = instance_create(0, 0, o_pl);
with _inst
{
  cl_id = argument0;
  cl_name = argument1;
  cl_team = argument2;
  cl_skin = argument3;
  cl_color = argument4;
  skin_load(cl_skin);
}

global.cl_plr[argument0] = _inst;
if argument0 == global.pl_id { global.cl_inst = _inst; } else { con_add("Игрок " + argument1 + " вошел."); }
