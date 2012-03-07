if keyboard_check_pressed(global.key_chat) || keyboard_check_pressed(global.key_left) || keyboard_check_pressed(global.key_right) || keyboard_check_pressed(global.key_up) || keyboard_check_pressed(global.key_dn) || keyboard_check_pressed(global.key_jmp) || keyboard_check_released(global.key_chat) || keyboard_check_released(global.key_left) || keyboard_check_released(global.key_right) || keyboard_check_released(global.key_up) || keyboard_check_released(global.key_dn) || keyboard_check_released(global.key_jmp)
{
    pos_send();
}
if keyboard_check(global.key_atk)
{
    shoot_send();
}
