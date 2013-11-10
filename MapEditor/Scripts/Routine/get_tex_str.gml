//returns texture string preparing to adding into list
//arg0 - texture index

var tx_i, tx_nm;
tx_i = argument0;
tx_nm = dp_textures(global.tex_nm[tx_i]);
if !file_exists(global.tex_nm[tx_i]) {tx_nm = '*' + tx_nm;}
return tx_nm;
