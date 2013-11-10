//a0 - window handle

if API_Dialog_MessageBox(argument0,
       'Вы уверены? Это действие нельзя будет отменить.',
       '', MB_YESNO|MB_ICONWARNING) == IDYES {return true;} else {return false;}
