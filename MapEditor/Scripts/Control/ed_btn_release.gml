if trg != noone && instance_exists(trg)
{
  if global.ed_mode == MODE_TRIGZONE
  {
    trg.image_xscale = (round_mouse_x() + x_off - trg.x) / 16;
    trg.image_yscale = (round_mouse_y() + y_off - trg.y) / 16;

    with trg
    {
      if image_xscale < 0
      {
        x += image_xscale * 16;
        image_xscale = abs(image_xscale);
        xx[1] = x; xx[2] = x;
      }
      if image_yscale < 0
      {
        y += image_yscale * 16;
        image_yscale = abs(image_yscale);
        yy[1] = y; yy[2] = y;
      }
    }

    if trg.image_xscale < 0.5 {trg.image_xscale = 0.5;}
    if trg.image_yscale < 0.5 {trg.image_yscale = 0.5;}
    with trg {o_w = obj_get_w(o_id); o_h = obj_get_h(o_id);}
        
    if trg.t_id != TRAC_ENDROUND
    {
      global.ed_mode = MODE_TRIGACT;
    } else {
      trg.xx[1] = trg.x;
      trg.yy[1] = trg.y;
      trg.xx[2] = trg.x;
      trg.yy[2] = trg.y;
      global.ed_mode = MODE_NORMAL;
      trg = noone;
    }
  exit;
  }

  if global.ed_mode == MODE_TRIGACT
  {
    trg.xx[2] = round_mouse_x() + x_off;
    trg.yy[2] = round_mouse_y() + y_off;
    with trg
    {
      var txx;
      if xx[1] > xx[2]
      {
        txx = xx[1];
        xx[1] = xx[2];
        xx[2] = txx;
      }
      if yy[1] > yy[2]
      {
        txx = yy[1];
        yy[1] = yy[2];
        yy[2] = txx;
      }
      if xx[2] - xx[1] < 8 || t_id == TRAC_TELEPORT {xx[2] = xx[1] + 8;}
      if yy[2] - yy[1] < 8 || t_id == TRAC_TELEPORT {yy[2] = yy[1] + 8;}

      if t_id == TRAC_TGLSOLID
      {
        timer = dlg_gettimer('Введите задержку (в секундах, максимум 300) перед повторным переключением стены (0 - без повторного переключения):', o_ctrl.t2_std);
        o_ctrl.t2_std = timer;
      }
      if t_id == TRAC_ACTTRIG
      {
        timer = dlg_gettimer('Введите задержку (в секундах, максимум 300) перед активацией расширителя (0 - без задержки):', o_ctrl.t4_std);
        o_ctrl.t4_std = timer;
      }
    }

    trg = noone;
    global.ed_mode = MODE_NORMAL;
    exit;
  }
}

x2 = round_mouse_x() + x_off;
y2 = round_mouse_y() + y_off;

if !obj_block(obj_sel) || !keyboard_check(vk_shift) {exit;}

var obj;
switch obj_sel
{
  case BLOCK_SOLID:
    obj = o_solid;
  break;
  case BLOCK_JTHR:
    obj = o_jthr;
  break;
  case BLOCK_BKG:
    obj = o_bkg;
  break;
  case BLOCK_FRG:
    obj = o_frg;
  break;
  case BLOCK_WATER:
  case BLOCK_ACID1:
  case BLOCK_ACID2:
    obj = o_liquid;
  break;
  case BLOCK_LIFTU:
  case BLOCK_LIFTD:
  case BLOCK_LIFTL:
  case BLOCK_LIFTR:
    obj = o_lift;
  break;
}

ed_create_panel(x1, y1, x2, y2, obj, tex_sel, obj_sel);

