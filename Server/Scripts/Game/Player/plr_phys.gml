//credit to Jenner for this shit
//The repeat function only works with absolute values. This makes the values hrep/vrep go +1 if the hsp/vsp has decimals. 
//argument0 - left key
//argument1 - right key
//argument2 - jump key

//controls
if argument0 && !argument1
{
    if hsp > -maxhspd {hsp -= acc;}
    //if !kb_strf {aim = -1;}
}
if argument1 && !argument0
{
    if hsp < maxhspd {hsp += acc;}
    //if !kb_strf {aim = 1;}
}
if argument2 && !free && !global.mp_flymode && !st_jet
{
    if !collision_rectangle(x-8, y, x+8, y+16, o_water, 0, 1) && !collision_rectangle(x-8, y, x+8, y+16, o_acid, 0, 1)
    {
        vsp = -jspd;
    }
    else
    {
        vsp = -2.75;
    }
}
if argument2 && (st_jet || global.mp_flymode)
{
    vsp = -4;
}

//this piece of code is responsive for physics and is taken full from jenner's platform physics engine with minor changes
//all shit reserved
/////
hrep = 0;
vrep = 0;

if hsp > 0 {htime += hsp - floor(hsp);}
if hsp < 0 {htime += abs(hsp - ceil(hsp));}
if htime >= 1 {htime = -1;}
hrep = abs(hsp);
if htime = -1 {hrep += 1; htime = 0;}

if vsp > 0 {vtime += vsp - floor(vsp);}
if vsp < 0 {vtime += abs(vsp - ceil(vsp));}
if vtime >= 1 {vtime = -1;}
vrep = abs(vsp);
if vtime = -1 {vrep += 1; vtime = 0;}

trin = 999;

//The hspeed movement (Uses repeat function)
repeat(floor(hrep))
{
  if !place_meeting(x+sign(hsp), y, o_solid) {trinfree = true; x += sign(hsp);} else {trinfree = false;}
}

//The vspeed movement (Uses repeat function)
repeat(floor(vrep))
{
  if !place_meeting(x, y+sign(vsp), o_solid)
  {
    col_jumpthrough = collision_rectangle(x - 16, y + 32, x + 16, y + 36, o_jthr, 0, 1);
    if col_jumpthrough > 0 and vsp >= 0
    {
      cjy = col_jumpthrough.y;
      if y < cjy-30+vsp
      {
        y = cjy - 32;
        vsp = 0;
      } else {
        y += sign(vsp);
      }
    } else {
      y += sign(vsp);
    }
  } else {
    vsp = 0;
  }
}

//This last part simply checks if there is ground under the player.
if place_meeting(x, y+1, o_solid)
{
  free = false;
  freemd = true;
} else {
  freemd = false;
  col_jumpthrough = collision_rectangle(x - 16, y + 32, x + 16, y + 36, o_jthr, 0, 1);
  if col_jumpthrough > 0 and vsp >= 0
  {
    cjy = col_jumpthrough.y;
    if y < cjy-30+vsp
    {
      y = cjy - 32;
      free = false;
    } else {
      free = true;
    }
  } else {
    free = true;
  }
}

//This is for gravity and friction. (Change vsp to make gravity go up/down)
if free = true {vsp += 0.22;}
if !free {hsp = max(0, abs(hsp)-deacc) * sign(hsp);} else {hsp = max(0, abs(hsp)-deacc/2) * sign(hsp);}
//////
if place_meeting(x, y - 15, o_water) || place_meeting(x, y - 15, o_acid)
{
    free = false;
    if st_jet {st_jet = 0;}
    if vsp > 2 {vsp = 2;}
    if vsp < -2 {vsp = -2;}
    if hsp > 2 {hsp = 2;}
    if hsp < -2 {hsp = -2;}
}

if place_meeting(x, y, o_jthr)
{
    free = false;
}

if vsp > 13-(st_jet+global.mp_flymode)*8 {vsp = 13-(st_jet+global.mp_flymode)*8;}

if place_meeting(x, y, o_lift_up) && vsp > -5 {vsp -= 0.5;}
if place_meeting(x, y, o_lift_down) && vsp > 3 {vsp -= 0.5;}
if place_meeting(x, y, o_lift_left)
{
  free = false;
  if vsp < -1 {vsp += 1;}
  if vsp > 1 {vsp -= 1;};
  if hsp > -8 {hsp -= 0.5;}
}
if place_meeting(x, y, o_lift_right)
{
  free = false;
  if vsp < -1 {vsp += 1;}
  if vsp > 1 {vsp -= 1;};
  if hsp < 8 {hsp += 0.5;}
}

if place_meeting(x + hsp, y, o_solid) {hsp = 0;}
