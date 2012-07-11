//checks for necessary skin files
//argument0 - skin dir

if !directory_exists(argument0) || !file_exists(argument0 + '\INFO') ||
                                   !file_exists(argument0 + '\stand.tga') ||
                                   !file_exists(argument0 + '\standmask.tga') ||
                                   !file_exists(argument0 + '\walk.tga') ||
                                   !file_exists(argument0 + '\walkmask.tga') ||
                                   !file_exists(argument0 + '\attack.tga') ||
                                   !file_exists(argument0 + '\attackmask.tga') ||
                                   !file_exists(argument0 + '\seeup.tga') ||
                                   !file_exists(argument0 + '\seeupmask.tga') ||
                                   !file_exists(argument0 + '\seedown.tga') ||
                                   !file_exists(argument0 + '\seedownmask.tga') ||
                                   !file_exists(argument0 + '\attackup.tga') ||
                                   !file_exists(argument0 + '\attackupmask.tga') ||
                                   !file_exists(argument0 + '\attackdown.tga') ||
                                   !file_exists(argument0 + '\attackdownmask.tga') ||
                                   !file_exists(argument0 + '\pain.tga') ||
                                   !file_exists(argument0 + '\painmask.tga') ||
                                   !file_exists(argument0 + '\die.tga') ||
                                   !file_exists(argument0 + '\diemask.tga')
{return false;} else {return true;}
