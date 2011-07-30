//describes item's effect on player
//argument0 - item type
switch argument0
{
    case 1:
        //stimpack
        if hp >= 100 {exit;}
        hp += 15;
        if hp > 100 {hp = 100;}
        plr_send_stat();
        plr_send_sound(3, x, y);
        with (other) {instance_destroy();}
    break;
    case 2:
        //medkit
        if hp >= 100 {exit;}
        hp += 25;
        if hp > 100 {hp = 100;}
        plr_send_stat();
        plr_send_sound(3, x, y);
        with (other) {instance_destroy();}
    break;
    case 3:
        //g armor
        if ap >= 100 {exit;}
        ap += 100;
        if ap > 100 {ap = 100;}
        plr_send_stat();
        plr_send_sound(3, x, y);
        with (other) {instance_destroy();}
    break;
    case 4:
        //b armor
        if ap >= 200 {exit;}
        ap = 200;
        plr_send_stat();
        plr_send_sound(3, x, y);
        with (other) {instance_destroy();}
    break;
    case 5:
        //soulsphere
        if hp >= 200 {exit;}
        if hp < 200 {hp = 200;}
        plr_send_stat();
        plr_send_sound(5, x, y);
        with (other) {instance_destroy();}
    break;
    case 6:
        //megasphere
        if hp >= 200 && ap >= 200 {exit;}
        if hp < 200 {hp = 200;}
        ap = 200;
        plr_send_stat();
        plr_send_sound(5, x, y);
        with (other) {instance_destroy();}
    break;
    case 7:
        //invulnerability
        hp = 250;
        st_inv = 1;
        alarm[3] = 1800;
        plr_send_stat();
        plr_send_sound(5, x, y);
        with (other) {instance_destroy();}
    break;
    case 8:
        //jetpack
        st_jet = 1;
        alarm[4] = 1800;
        plr_send_stat();
        plr_send_sound(4, x, y);
        with (other) {instance_destroy();}
    break;
    case 10:
        //backpack
        a1 += 50; if a1 > 400 {a1 = 400;}
        a2 += 12; if a2 > 100 {a2 = 100;}
        a3 += 5; if a3 > 50 {a3 = 50;}
        a4 += 80; if a4 > 400 {a4 = 400;}
        plr_send_stat();
        plr_send_sound(4, x, y);
        with (other) {instance_destroy();}
    break;
    case 9:
        //berserk
        if st_ber && hp >= 100 {exit;}
        hp = 100;
        st_ber = 1;
        w = 0;
        plr_send_stat();
        plr_send_sound(5, x, y);
        with (other) {instance_destroy();}
    break;
    case 11:
        //clip
        if a1 >= 400 {exit;}
        a1 += 10;
        if a1 > 400 {a1 = 400;}
        plr_send_stat();
        plr_send_sound(3, x, y);
        with (other) {instance_destroy();}
    break;
    case 12:
        //box of bullets
        if a1 >= 400 {exit;}
        a1 += 50;
        if a1 > 400 {a1 = 400;}
        plr_send_stat();
        plr_send_sound(3, x, y);
        with (other) {instance_destroy();}
    break;
    case 13:
        //shells
        if a2 >= 100 {exit;}
        a2 += 4;
        if a2 > 100 {a2 = 100;}
        plr_send_stat();
        plr_send_sound(3, x, y);
        with (other) {instance_destroy();}
    break;
    case 14:
        //box of shells
        if a2 >= 100 {exit;}
        a2 += 12;
        if a2 > 100 {a2 = 100;}
        plr_send_stat();
        plr_send_sound(3, x, y);
        with (other) {instance_destroy();}
    break;
    case 15:
        //whatever
    break;
    case 16:
        //whatever
    break;
    case 17:
        //rocket
        if a3 >= 50 {exit;}
        a3 += 1;
        if a3 > 50 {a3 = 50;}
        plr_send_stat();
        plr_send_sound(3, x, y);
        with (other) {instance_destroy();}
    break;
    case 18:
        //5 rockets
        if a3 >= 50 {exit;}
        a3 += 5;
        if a3 > 50 {a3 = 50;}
        plr_send_stat();
        plr_send_sound(3, x, y);
        with (other) {instance_destroy();}
    break;
    case 19:
        //cell
        if a4 >= 400 {exit;}
        a4 += 40;
        if a4 > 400 {a4 = 400;}
        plr_send_stat();
        plr_send_sound(3, x, y);
        with (other) {instance_destroy();}
    break;
    case 20:
        //super cell
        if a4 >= 400 {exit;}
        a4 += 80;
        if a4 > 400 {a4 = 400;}
        plr_send_stat();
        plr_send_sound(3, x, y);
        with (other) {instance_destroy();}
    break;
    case 21:
        //shotgun
        if a2 >= 100 && hw[2] == 1 {exit;}
        hw[2] = 1;
        w = 2;
        a2 += 12;
        if a2 > 100 {a2 = 100;}
        plr_send_stat();
        plr_send_sound(4, x, y);
        with (other) {instance_destroy();}
    break;
    case 22:
        //supershotgun
        if a2 >= 100 && hw[3] == 1 {exit;}
        hw[3] = 1;
        w = 3;
        a2 += 12;
        if a2 > 100 {a2 = 100;}
        plr_send_stat();
        plr_send_sound(4, x, y);
        with (other) {instance_destroy();}
    break;
    case 23:
        //chaingun
        if a1 >= 400 && hw[4] == 1 {exit;}
        hw[4] = 1;
        w = 4;
        a1 += 50;
        if a1 > 400 {a1 = 400;}
        plr_send_stat();
        plr_send_sound(4, x, y);
        with (other) {instance_destroy();}
    break;
    case 24:
        //chainsaw
        if hw[9] == 1 {exit;}
        hw[9] = 1;
        w = 9;
        plr_send_stat();
        plr_send_sound(4, x, y);
        alarm[6] = 1;
        with (other) {instance_destroy();}
    break;
    case 25:
        //rocketlauncher
        if a3 >= 50 && hw[5] == 1 {exit;}
        hw[5] = 1;
        w = 5;
        a3 += 5;
        if a3 > 50 {a3 = 50;}
        plr_send_stat();
        plr_send_sound(4, x, y);
        with (other) {instance_destroy();}
    break;
    case 26:
        //plasmagun
        if a4 >= 400 && hw[6] == 1 {exit;}
        hw[6] = 1;
        w = 6;
        a4 += 40;
        if a4 > 400 {a4 = 400;}
        plr_send_stat();
        plr_send_sound(4, x, y);
        with (other) {instance_destroy();}
    break;
    case 27:
        //bfg
        if a4 >= 400 && hw[7] == 1 {exit;}
        hw[7] = 1;
        w = 7;
        a4 += 80;
        if a4 > 400 {a4 = 400;}
        plr_send_stat();
        plr_send_sound(4, x, y);
        with (other) {instance_destroy();}
    break;
    case 28:
        //superchaingun
        if a2 >= 100 && hw[8] == 1 {exit;}
        hw[8] = 1;
        w = 8;
        a2 += 100;
        if a2 > 100 {a2 = 100;}
        plr_send_stat();
        plr_send_sound(4, x, y);
        with (other) {instance_destroy();}
    break;
}


