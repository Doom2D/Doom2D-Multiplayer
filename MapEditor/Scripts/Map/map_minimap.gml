//saves a minimap
//arg0 - scale reduction degree

var get_fn;
get_fn = dlg_savefile('Portable Network Graphics (*.PNG)|*.png',
                      working_directory + '\' + filename_change_ext(filename_name(global.map_file), '.png'),
                      '.png');
if get_fn == '' {exit;}
if file_exists(get_fn) {file_delete(get_fn);}

var img_sc, img_w, img_h, alt_s, sf_w, sf_h, out_sf;
img_sc = argument0;
img_w = round(global.map_w / img_sc);
img_h = round(global.map_h / img_sc);
alt_s = API_Menu_GetItemChecked(ui_mbar_m2_alts);
if alt_s {sf_w = round_p2(img_w); sf_h = round_p2(img_h);} else {sf_w = img_w; sf_h = img_h;}

out_sf = surface_create(sf_w, sf_h);
if !surface_exists(out_sf) {mb_error(window_handle()); exit;}
surface_set_target(out_sf);

draw_set_alpha(1);
draw_clear(c_black);

//to avoid bug with draw_rectangle() on various video cards
var dr_f;
draw_set_color(c_white);
draw_rectangle(0, 0, img_w - 1, img_h - 1, 0);
dr_f = surface_getpixel(out_sf, img_w - 1, img_h - 1);
if dr_f != 0 {dr_f = 1;}

draw_clear(c_black);

var rx1, ry1, rx2, ry2;

with o_lift
{
  switch o_id
  {
    case 7: case 8:  draw_set_color(c_orange); break; //old: c_olive
    case 9: case 10: draw_set_color(c_teal); break;
  }
  rx1 = round( x / img_sc ); rx2 = round( (x + o_w) / img_sc - dr_f );
  ry1 = round( y / img_sc ); ry2 = round( (y + o_h) / img_sc - dr_f );
  draw_rectangle(rx1, ry1, rx2, ry2, 0);
}

with o_liquid
{
  if (o_w <= img_sc / 2) || (o_h <= img_sc / 2) {continue;}
  switch o_id
  {
    case 4:  draw_set_color(c_blue); break; //old: c_navy
    case 5:  draw_set_color(c_lime); break; //old: c_green
    case 6:  draw_set_color(c_red);  break; //old: c_maroon
  }
  rx1 = round( x / img_sc ); rx2 = round( (x + o_w) / img_sc - dr_f );
  ry1 = round( y / img_sc ); ry2 = round( (y + o_h) / img_sc - dr_f );
  draw_rectangle(rx1, ry1, rx2, ry2, 0);
}

draw_set_color(c_gray); //old: c_ltgray
with o_jthr
{
  if (o_w <= img_sc / 2) || (o_h <= img_sc / 2) {continue;}
  rx1 = round( x / img_sc ); rx2 = round( (x + o_w) / img_sc - dr_f );
  ry1 = round( y / img_sc ); ry2 = round( (y + o_h) / img_sc - dr_f );
  draw_rectangle(rx1, ry1, rx2, ry2, 0);
}

draw_set_color(c_white);
with o_solid
{
  if (o_w <= img_sc / 2) || (o_h <= img_sc / 2) {continue;}
  rx1 = round( x / img_sc ); rx2 = round( (x + o_w) / img_sc - dr_f );
  ry1 = round( y / img_sc ); ry2 = round( (y + o_h) / img_sc - dr_f );
  draw_rectangle(rx1, ry1, rx2, ry2, 0);
}

surface_reset_target();
if alt_s {surface_save_part(out_sf, get_fn, 0, 0, img_w, img_h);} else {surface_save(out_sf, get_fn);}
surface_free(out_sf);

if !file_exists(get_fn) {mb_error(window_handle());}
