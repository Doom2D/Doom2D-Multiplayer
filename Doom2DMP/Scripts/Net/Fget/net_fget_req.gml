//requests next data chunk from server

dll39_write_byte(16, global.send_buf);
tcp_send(global.cl_tcp, global.send_buf);
