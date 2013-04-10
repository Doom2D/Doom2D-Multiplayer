//binds command argument1 to key argument0
var key, command;
if is_real(argument0) or is_real(argument1)
{
  con_add('Недопустимое значение аргумента.'); exit;
}
if argument0 == '' or argument1 == ''
{
  con_add('Недопустимое значение аргумента.'); exit;
}
key = key_code(argument0);
command = argument1;
if key == -1
{
  con_add(':: INPUT: ERROR: Нельзя забиндить клавишу ' + string(argument0) + '!');
  exit;
} 
switch (command)
{
  case '+lookup': global.key_up = key; break;
  case '+lookdown': global.key_dn = key; break;
  case '+left': global.key_left = key; break;
  case '+right': global.key_right = key; break;
  case '+attack': global.key_atk = key; break;
  case '+jump': global.key_jmp = key; break;
  case '+chat': global.key_chat = key; break;
  case '+nextweapon': global.key_chw = key; break;
  case '+prevweapon': global.key_chw2 = key; break;
  case '+screenshot': global.key_scr = key; break;
  case '+use': global.key_use = key; break;
}
//con_add('Команда ' + string(command) + ' теперь висит на клавише ' + string(argument0) + '.');
