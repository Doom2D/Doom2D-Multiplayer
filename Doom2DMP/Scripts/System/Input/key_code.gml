//key codes script
//argument0 = key name
//returns = key code
var _code;
_code = -1;
switch argument0
{
  case 'A': _code = ord('A'); break;
  case 'B': _code = ord('B'); break;
  case 'C': _code = ord('C'); break;
  case 'D': _code = ord('D'); break;
  case 'E': _code = ord('E'); break;
  case 'F': _code = ord('F'); break;
  case 'G': _code = ord('G'); break;
  case 'H': _code = ord('H'); break;
  case 'I': _code = ord('I'); break;
  case 'J': _code = ord('J'); break;
  case 'K': _code = ord('K'); break;
  case 'L': _code = ord('L'); break;
  case 'M': _code = ord('M'); break;
  case 'N': _code = ord('N'); break;
  case 'O': _code = ord('O'); break;
  case 'P': _code = ord('P'); break;
  case 'Q': _code = ord('Q'); break;
  case 'R': _code = ord('R'); break;
  case 'S': _code = ord('S'); break;
  case 'T': _code = ord('T'); break;
  case 'U': _code = ord('U'); break;
  case 'V': _code = ord('V'); break;
  case 'W': _code = ord('W'); break;
  case 'X': _code = ord('X'); break;
  case 'Y': _code = ord('Y'); break;
  case 'Z': _code = ord('Z'); break;
  case 'Ctrl': _code = vk_control; break;
  case 'Alt': _code = vk_alt; break;
  case 'Space': case 'Пробел': _code = vk_space; break;
  case 'Shift': _code = vk_shift; break;
  case 'Tab': _code = vk_tab; break;
  case '0': _code = ord('0'); break;
  case '1': _code = ord('1'); break;
  case '2': _code = ord('2'); break;
  case '3': _code = ord('3'); break;
  case '4': _code = ord('4'); break;
  case '5': _code = ord('5'); break;
  case '6': _code = ord('6'); break;
  case '7': _code = ord('7'); break;
  case '8': _code = ord('8'); break;
  case '9': _code = ord('9'); break;
  case "'": _code = 222; break;
  case '.': _code = 190; break;
  case ',': _code = 188; break;
  case ';': case 'Ж': case ':': _code = 59; break;
  case '[': _code = 219; break;
  case ']': _code = 221; break;
  case '/': _code = 191; break;
  case '\': _code = 220; break;
  case 'Insert': _code = vk_insert; break;
  case 'Delete': _code = vk_delete; break;
  case 'Home': _code = vk_home; break;
  case 'End': _code = vk_end; break;
  case 'PgUp': _code = vk_pageup; break;
  case 'PgDn': _code = vk_pagedown; break;
  case 'Num0': _code = vk_numpad0; break;
  case 'Num1': _code = vk_numpad1; break;
  case 'Num2': _code = vk_numpad2; break;
  case 'Num3': _code = vk_numpad3; break;
  case 'Num4': _code = vk_numpad4; break;
  case 'Num5': _code = vk_numpad5; break;
  case 'Num6': _code = vk_numpad6; break;
  case 'Num7': _code = vk_numpad7; break;
  case 'Num8': _code = vk_numpad8; break;
  case 'Num9': _code = vk_numpad9; break;
  case 'Num *': _code = vk_multiply; break;
  case 'Num /': _code = vk_divide; break;
  case 'Num +': _code = vk_add; break;
  case 'Num -': _code = vk_subtract; break;
  case 'Num .': _code = vk_decimal; break;
  case 'Up': case 'Вверх': _code = vk_up; break;
  case 'Down': case 'Вниз': _code = vk_down; break;
  case 'Left': case 'Влево': _code = vk_left; break;
  case 'Right': case 'Вправо': _code = vk_right; break;
  case 'Enter': case 'Ввод': _code = vk_enter; break;
  case 'F1': _code = vk_f1 break;
  case 'F2': _code = vk_f2 break;
  case 'F3': _code = vk_f3 break;
  case 'F4': _code = vk_f4 break;
  case 'F5': _code = vk_f5 break;
  case 'F6': _code = vk_f6 break;
  case 'F7': _code = vk_f7 break;
  case 'F8': _code = vk_f8 break;
  case 'F9': _code = vk_f9 break;
  case 'F10': _code = vk_f10 break;
  case 'F11': _code = vk_f11 break;
  case 'F12': _code = vk_f12 break;
  case 'PrtScr': case 'PrintScreen': _code = vk_printscreen; break;
    
  default: _code = -1;
}
return _code;



