//arg0 - filter (file types and their descriptions)
//arg1 - default filename
//arg2 - file extension to check

var temp_fn;
temp_fn = get_save_filename(argument0, argument1);
if temp_fn == '' {return '';}

var f_ext;
f_ext = argument2;
if string_lower(filename_ext(temp_fn)) != string_lower(f_ext) {temp_fn += f_ext;}

if file_exists(temp_fn)
{
  if message_box('Файл "' + filename_name(temp_fn) + '" уже существует.' + EOL +
                 'Перезаписать?',
                 '', MB_YESNO|MB_ICONWARNING) == IDNO {return '';}
}

return temp_fn;
