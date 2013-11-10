//saves a full size picture of a map

var get_fn;
get_fn = dlg_savefile('Portable Network Graphics (*.PNG)|*.png',
                      working_directory + '\' + filename_change_ext(filename_name(global.map_file), '.png'),
                      '.png');
if get_fn == '' {exit;}
if file_exists(get_fn) {file_delete(get_fn);}

var alt_s, sf_w, sf_h, out_sf;
alt_s = API_Menu_GetItemChecked(ui_mbar_m2_alts);
if alt_s
{
  sf_w = round_p2(global.map_w); sf_h = round_p2(global.map_h);
} else {
  sf_w = global.map_w; sf_h = global.map_h;
}

out_sf = surface_create(sf_w, sf_h);
if !surface_exists(out_sf) {mb_error(window_handle()); exit;}
surface_set_target(out_sf);

draw_clear(c_black);
if global.mbk_ind != -1 {draw_background_stretched(global.mbk_ind, 0, 0, global.map_w, global.map_h);}

with o_bkg                                 {draw_sprite(sprite_index, image_index, x, y);}
with o_solid                               {draw_sprite(sprite_index, image_index, x, y);}
with o_jthr                                {draw_sprite(sprite_index, image_index, x, y);}
with o_item                                {draw_sprite(sprite_index, image_index, x, y);}
with o_spawn { if o_id == 42 || o_id == 43 {draw_sprite(sprite_index, image_index, x, y);} }
with o_liquid                              {draw_sprite(sprite_index, image_index, x, y);}
with o_frg                                 {draw_sprite(sprite_index, image_index, x, y);}

//to avoid bug with incorrect blending on surfaces in GM
draw_set_blend_mode_ext(bm_dest_alpha, bm_src_alpha);
draw_set_color(c_black);
draw_set_alpha(1);
draw_rectangle(0, 0, global.map_w, global.map_h, 0);
draw_set_blend_mode(bm_normal);

surface_reset_target();
if alt_s
{
  surface_save_part(out_sf, get_fn, 0, 0, global.map_w, global.map_h);
} else {
  surface_save(out_sf, get_fn);
}
surface_free(out_sf);

if !file_exists(get_fn) {mb_error(window_handle());}
