//releases all skins
//arg0 - player to release skin

with argument0
{
  if !variable_local_exists('sprites') || !variable_local_exists('spr') || !variable_local_exists('cl_id') {continue;}
  for (i = 1; i <= 9; i += 1)
  {
    if sprite_exists(sprites[i, 0]) {sprite_delete(sprites[i, 0]);}
    if sprite_exists(sprites[i, 1]) {sprite_delete(sprites[i, 1]);}
  }
}
