//sets the text in the map information window

API_Control_SetText(ui_win4_t1, 
                    'Текстур: ' + string(global.tex_n - 1) + EOL +
                    'Тайлов окружения: ' + string(instance_number(o_solid) +
                                                  instance_number(o_jthr) +
                                                  instance_number(o_bkg) +
                                                  instance_number(o_frg) +
                                                  instance_number(o_liquid) +
                                                  instance_number(o_lift)) + EOL +
                    'Предметов: ' + string(instance_number(o_item)) + EOL +
                    'Областей: ' + string(instance_number(o_spawn)) + EOL +
                    'Триггеров: ' + string(instance_number(o_trigger)));
API_Control_SetText(ui_win4_bt, 'Обновить статистику');
