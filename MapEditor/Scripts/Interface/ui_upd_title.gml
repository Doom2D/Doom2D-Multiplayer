if global.map_file == working_directory + '\data\maps\*.dlv' {exit;}
room_caption = global.ed_apptitle + ' - ' +
               filename_name(global.map_file) +
               ' (' + global.map_name + ')';
