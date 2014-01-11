//checks for necessary skin files
//arg0 - skin dir

var chk;
chk = argument0;

if !directory_exists(chk) {return false;}
if !file_exists(chk + '\INFO') {return false;}

if !file_exists(chk + '\stand.tga')      || !file_exists(chk + '\standmask.tga')      {return false;}
if !file_exists(chk + '\walk.tga')       || !file_exists(chk + '\walkmask.tga')       {return false;}
if !file_exists(chk + '\attack.tga')     || !file_exists(chk + '\attackmask.tga')     {return false;}
if !file_exists(chk + '\seeup.tga')      || !file_exists(chk + '\seeupmask.tga')      {return false;}
if !file_exists(chk + '\seedown.tga')    || !file_exists(chk + '\seedownmask.tga')    {return false;}
if !file_exists(chk + '\attackup.tga')   || !file_exists(chk + '\attackupmask.tga')   {return false;}
if !file_exists(chk + '\attackdown.tga') || !file_exists(chk + '\attackdownmask.tga') {return false;}
if !file_exists(chk + '\pain.tga')       || !file_exists(chk + '\painmask.tga')       {return false;}
if !file_exists(chk + '\die.tga')        || !file_exists(chk + '\diemask.tga')        {return false;}

return true;
