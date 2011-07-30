//argument0 - command
var k;
msg_add("Нажмите клавишу...");

screen_redraw();
keyboard_wait();

k = key_name(keyboard_key);

io_clear();

con_parse('bind ' + k + ' ' + argument0);
