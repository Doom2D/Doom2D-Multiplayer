//makes filename unique
//arg0 - filename
//arg1 - extension

var f_nm, num;
f_nm = argument0;
num = 1;

while file_exists(f_nm + argument1)
{
  f_nm = argument0 + '_' + string(num);
  num += 1;
}

return f_nm + argument1;
