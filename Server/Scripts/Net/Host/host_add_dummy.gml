//creates a dummy which will transfer the necessary files to the newly connected client, check the integrity and all that shit
//a0 - id
//a1 - sock
//a2 - name
//a3 - skin
//a4 - color

var _inst;
_inst = instance_create(0, 0, o_dummy);
_inst.cl_id = argument0;
_inst.cl_tcp = argument1;
_inst.cl_name = argument2;
_inst.cl_skin = argument3;
_inst.cl_color = argument4;
