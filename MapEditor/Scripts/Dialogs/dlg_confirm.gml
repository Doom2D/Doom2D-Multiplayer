if message_box('Вы уверены? Это действие нельзя будет отменить.',
               '', MB_YESNO|MB_ICONWARNING) == IDYES {return true;} else {return false;}
