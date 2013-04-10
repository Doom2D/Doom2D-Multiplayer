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

tcp = dytcpconnect("canyouseeme.org", 80, 0);
if (!tcp) return -1;
dysetformat(tcp, 1, "<br>"); //set format to html mode to receive <br> lines

//send post request
dyclearbuffer(global._sl_buf);
dywritechars("POST / HTTP/1.1" + chr(13) + chr(10), global._sl_buf);
dywritechars("Host: canyouseeme.org" + chr(13) + chr(10), global._sl_buf);
dywritechars("Keep-Alive: 300" + chr(13) + chr(10), global._sl_buf);
dywritechars("Connection: keep-alive" + chr(13) + chr(10), global._sl_buf);
dywritechars("User-Agent: Mozilla/4.0" + chr(13) + chr(10), global._sl_buf);
dywritechars("Content-Type: application/x-www-form-urlencoded" + chr(13) + chr(10), global._sl_buf);
dywritechars("Content-Length: " + string(string_length(data)) + chr(13) + chr(10), global._sl_buf);
dywritechars(chr(13) + chr(10), global._sl_buf);
dywritechars(data, global._sl_buf);
dywritechars(tcp, global._sl_buf);
dysendmessage(tcp, 0, 0, global._sl_buf);

while (true)    // infinite loop
{
        a = dyreceivemessage(tcp, 0, global._sl_buf);  // receive data
        b = dyreadchars(dybytesleft(global._sl_buf), global._sl_buf)
        if string_count("Success", b) // until Keyword "Success" is found
        {
                dyclosesock(tcp);
                return 1
                break;
        }
        if string_count("Error", b) // or Keyword "Error" is found
        {
                dyclosesock(tcp);
                return 0
                break;
        }
        if b == ""        // Error if nothing found
        {
                dyclosesock(tcp);
                return -1
                break;
        }
        sleep(60);
}
dyclosesock(tcp);
