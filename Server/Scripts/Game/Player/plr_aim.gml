//returns direction of aiming

if !kb_lkup && !kb_lkdn
{
  if aim ==  1 {return 0;}
  if aim == -1 {return 180;}
}

switch global.mp_aimtype
{
  case 0:
    if kb_lkup { if aim ==  1 {return 55;}
                 if aim == -1 {return 125;} }
    if kb_lkdn { if aim ==  1 {return 325;}
                 if aim == -1 {return 215;} }
  break;

  case 1:
    if kb_lkup { if aim ==  1 {return 45;}
                 if aim == -1 {return 135;} }
    if kb_lkdn { if aim ==  1 {return 335;}
                 if aim == -1 {return 205;} }
  break;

  case 2:
    if kb_lkup { if aim ==  1 {return 45;}
                 if aim == -1 {return 135;} }
    if kb_lkdn { if aim ==  1 {return 315;}
                 if aim == -1 {return 225;} }
  break;
}
