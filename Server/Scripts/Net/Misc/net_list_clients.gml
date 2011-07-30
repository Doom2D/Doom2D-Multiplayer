//lists clients
for (i = 1; i <= global.sv_maxplayers; i += 1)
{
    
    if instance_exists(id_to_cl(i)) {con_add(string(id_to_cl(i).cl_id) + "    " + id_to_cl(i).cl_name + "    " + id_to_cl(i).cl_ip);}
}


