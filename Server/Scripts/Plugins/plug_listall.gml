// lists all plugins

var c;
c = 0;

con_add("=============================");
with o_plugin
{
    c += 1;
    con_add(string(c) + ": " + plug_dir); 
}
con_add("=============================");
con_add("СПИСОК ПОДКЛЮЧЕННЫХ ПЛАГИНОВ:");
