//clears the map
con_add(":: MAP: Очищаем карту...");
con_add(":: MAP: Удаляем тайлы...");
with o_solid {instance_destroy();}
with o_jthr {instance_destroy();}
with o_bkg {instance_destroy();}
with o_frg {instance_destroy();}
with o_water {instance_destroy();}
with o_acid {instance_destroy();}
with o_lift_left {instance_destroy();}
with o_lift_right {instance_destroy();}
with o_lift_up {instance_destroy();}
with o_lift_down {instance_destroy();}
with o_spawn {instance_destroy();}
with o_item {drop = true; instance_destroy();}
with o_itm_spwn {instance_destroy();}

con_add(":: MAP: Удаляем текстуры...");
for (i = 1; i < 256; i += 1)
{
  if sprite_exists(global.tex[i]) {sprite_delete(global.tex[i]);}
  global.tex[i] = -1;
  global.tex_nm[i] = -1;
}

con_add(":: MAP: Удаляем информацию...");
global.map_name = '';
global.map_desc = '';
global.map_w = 0;
global.map_h = 0;
global.team_score[1] = 0;
global.team_score[2] = 0;
global.red_flag = 0; //flag states 0 - standing 1 - taken 2 - dropped
global.blu_flag = 0;

if global.sv_log_update
{
    log_init(); //delete logs if needed
}

con_add(":: MAP: Карта очищена.");
