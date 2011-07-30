//Return your external IP adress, returns an empty string if failed
if global.sv_lan {return mplay_ipaddress();}
var tcp, s, a;
tcp = dll39_tcp_connect("whatismyip.org", 80, 0);
if(!tcp) {con_add(":: WARNING: Не удалось определить внешний IP, используется внутренний."); return mplay_ipaddress();}
dll39_set_format(tcp,dll39_format_text, chr(13) + chr(10) + chr(13) + chr(10)); //set format to text mode to receive double blank lines (the whole header file)
//send get request
dll39_buffer_clear(0);
dll39_write_chars("GET / HTTP/1.1" + chr(13) + chr(10),0);
dll39_write_chars("Host: whatismyip.org" + chr(13) + chr(10),0);
dll39_write_chars("Connection: close"+chr(13) + chr(10),0);
dll39_write_chars("Accept: image/gif, image/x-xbitmap, image/jpeg, image/pjpeg, application/x-shockwave-flash, application/vnd.ms-excel, application/vnd.ms-powerpoint, application/msword, application/xaml+xml, application/vnd.ms-xpsdocument, application/x-ms-xbap, application/x-ms-application, application/x-alambik-script, application/x-alambik-alamgram-link, */*"+chr(13)+chr(10),0);
dll39_write_chars("Accept-Language: en-us"+chr(13) + chr(10),0);
dll39_write_chars("User-Agent: Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; InfoPath.1; .NET CLR 2.0.50727; .NET CLR 1.1.4322)" +chr(13) + chr(10),0);
dll39_message_send(tcp,0,0,0);

a = dll39_message_receive(tcp,0,0);
a = dll39_message_receive(tcp,16,0);
dll39_socket_close(tcp);
s = dll39_read_chars(dll39_bytes_left(0),0)
if string_length(s) > 16 || string_count('<', s) > 0 {con_add(":: WARNING: Не удалось определить внешний IP, используется внутренний."); s = mplay_ipaddress();}
return s;
