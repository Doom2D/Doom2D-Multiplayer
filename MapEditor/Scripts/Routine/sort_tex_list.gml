//sorts textures list
//arg0 - ascending (true) or descending (false) sorting

if global.tex_n < 3
{
  API_Dialog_MessageBox(window_handle(),
      'В списке недостаточно текстур для сортировки.',
      'Ошибка', MB_OK|MB_ICONWARNING);
  exit;
}

if !mb_confirm(window_handle()) {exit;}

var src_l, new_l, ind_l;
src_l = ds_list_create();
new_l = ds_list_create();
ind_l = ds_list_create();

for (i = 1; i < global.tex_n; i += 1)
{
  ds_list_add(ind_l, global.tex[i]);
  ds_list_add(src_l, global.tex_nm[i]);
}

ds_list_copy(new_l, src_l);
ds_list_sort(new_l, argument0);

with par_obj
{
  if o_id > 6 || t_id == 0 {continue;}
  t_id = ds_list_find_index(new_l, ds_list_find_value(src_l, t_id - 1)) + 1;
}

tb_tex_reset(true);
if API_Window_Exists(ui_win5) {API_Listbox_ResetContent(ui_win5_lb1);}

var id_t, tx_nm;
for (i = 1; i < global.tex_n; i += 1)
{
  id_t = ds_list_find_index(new_l, ds_list_find_value(src_l, i - 1)) + 1;
  global.tex[id_t] = ds_list_find_value(ind_l, i - 1);
  global.tex_nm[i] = ds_list_find_value(new_l, i - 1);
  tx_nm = get_tex_str(i);
  API_Combobox_AddString(ui_tx_cb, tx_nm);
  if API_Window_Exists(ui_win5) {API_Listbox_AddString(ui_win5_lb1, tx_nm);}
}

ds_list_destroy(src_l);
ds_list_destroy(new_l);
ds_list_destroy(ind_l);
