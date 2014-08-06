/*
argument0  = port
return:  0 = Blocked
         1 = Open
        -1 = Error
*/                
var port, tcp, data, a, b;
port = argument0;

// make post request
data = "IP=" + global.sv_ip + "&port=" + string(port) + "&submit=Check";

tcp = dll39_tcp_connect("canyouseeme.org", 80, 0);
if (!tcp) return -1;
dll39_set_format(tcp, 1, "<br>"); //set format to html mode to receive <br> lines

//send post request
dll39_buffer_clear(global._sl_buf);
dll39_write_chars("POST / HTTP/1.1" + eol, global._sl_buf);
dll39_write_chars("Host: canyouseeme.org" + eol, global._sl_buf);
dll39_write_chars("Keep-Alive: 300" + eol, global._sl_buf);
dll39_write_chars("Connection: keep-alive" + eol, global._sl_buf);
dll39_write_chars("User-Agent: Mozilla/4.0" + eol, global._sl_buf);
dll39_write_chars("Content-Type: application/x-www-form-urlencoded" + eol, global._sl_buf);
dll39_write_chars("Content-Length: " + string(string_length(data)) + eol, global._sl_buf);
dll39_write_chars(eol, global._sl_buf);
dll39_write_chars(data, global._sl_buf);
dll39_write_chars(tcp, global._sl_buf);
dll39_message_send(tcp, 0, 0, global._sl_buf);

while (true)    // infinite loop
{
  a = dll39_message_receive(tcp, 0, global._sl_buf);  // receive data
  b = dll39_read_chars(dll39_bytes_left(global._sl_buf), global._sl_buf)
  if string_count("Success", b) // until Keyword "Success" is found
  {
    dll39_socket_close(tcp);
    return 1
    break;
  }
  if string_count("Error", b) // or Keyword "Error" is found
  {
    dll39_socket_close(tcp);
    return 0
    break;
  }
  if b == "" // Error if nothing found
  {
    dll39_socket_close(tcp);
    return -1
    break;
  }
  sleep(60);
}
dll39_socket_close(tcp);
