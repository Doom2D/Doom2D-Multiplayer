//selects a random demo
var fn;
fn = 'demos\' + file_find_first("demos\*.dgp", 0);

while !(irandom(10) - 7)
{
    var tf;
    tf = file_find_next();
    if tf == '' {break;}
    
    fn = 'demos\' + tf;
}

file_find_close();
return fn;
