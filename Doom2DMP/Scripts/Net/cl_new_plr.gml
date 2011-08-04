//creating new player
//0 - id
//1 - name
//2 - skin
//3 - color

var _inst;
_inst = instance_create(0, 0, o_pl);
_inst.cl_name = 'unknown';
_inst.cl_id = argument0;
_inst.cl_name = argument1;
_inst.cl_skin = argument2;
_inst.cl_color = argument3;

if argument0 = global.pl_id {global.cl_inst = _inst;}

with (_inst) {skin_load(cl_skin);}

global.cl_plr[argument0] = _inst;

con_add("Игрок " + argument1 + " вошел.");


