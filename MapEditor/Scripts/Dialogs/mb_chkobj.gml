//a0 - window handle

if instance_number(par_obj) == 0
{
  API_Dialog_MessageBox(argument0,
      'На карте нет объектов для обработки.',
      'Ошибка', MB_OK|MB_ICONWARNING);
  return false;
}

return true;
