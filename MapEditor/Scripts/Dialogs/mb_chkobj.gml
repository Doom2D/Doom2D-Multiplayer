if instance_number(par_obj) == 0
{
  message_box('На карте нет объектов для обработки.',
              'Ошибка', MB_OK|MB_ICONWARNING);
  return false;
}

return true;
