//checks for kill streaks
//a0 - player id
if !global.mp_announcer {exit;}
var pin, pnm, knm;
pin = global.sv_plr[argument0];
if !instance_exists(pin){exit;}
pnm = pin.cl_name;
knm = 'OVERKILL';

if pin.kill_streak < 2 && pin.kill_streak > -2 {exit;}

switch (pin.kill_streak)
{
    case -5: knm = 'SHAZBOT'; break;
    case -4: knm = 'BLASPHEMY'; break;
    case -3: knm = 'MADNESS'; break;
    case -2: knm = 'TREASON'; break;
    case 2: knm = 'DOUBLE KILL'; break;
    case 3: knm = 'TRIPLE KILL'; break;
    case 4: knm = 'QUADRO KILL'; break;
    case 5: knm = 'MULTI KILL'; break;
}

plr_send_text(argument0, knm, 3, 3, c_red, 412, 216, 4);

