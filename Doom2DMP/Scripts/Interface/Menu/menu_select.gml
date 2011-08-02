//execs selected menu string's script
if sel != menu_n {snd_play(1);} else {snd_play(26);}
execute_string(string(str[sel, 1]));
