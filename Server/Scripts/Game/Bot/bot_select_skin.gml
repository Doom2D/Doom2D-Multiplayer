//selects skin from the skin_list

var v;
v = list_get_val( 'skin_list', irandom( list_get_len('skin_list') - 1 ) );
if is_real(v) {return "doomer";} else {return v;}
