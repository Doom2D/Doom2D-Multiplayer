#!/usr/bin/env python

import SocketServer
import sys
import socket
import struct
import time
import logging
import argparse
import urllib2
import re

VERSION = 1.3
PORT = 25667
IO_TIMEOUT = 5
UPDATE_TIMEOUT = 15

server_list = {}

def recv_string(sock):
    str = ""
    while True:
        byte = sock.recv(1)
        if ord(byte)==0: break
        str += byte
    return str

def tick():
    for key,value in server_list.items():
        if time.time()-value["time"]>UPDATE_TIMEOUT*60:
            logging.info("{:<15}:{} Update timeout".format(value["ip"],value["port"]))
            del server_list[key]
            
def get_external_ip():
    url = "http://checkip.dyndns.org"
    request = urllib2.urlopen(url).read()
    theIP = re.findall(r"\d{1,3}\.\d{1,3}\.\d{1,3}.\d{1,3}", request)
    return theIP[0] if theIP else None

def is_local_ip(ip):
    local_ip_list = ["127.", "192.", "10.", "172."]
    for i in local_ip_list:
        if ip.startswith(i):
            return True
    return False

class RequestHandler(SocketServer.BaseRequestHandler):
    def handle(self):
        tick()

        self.log_msg = True
        self.msg = '{:<15}:{:<6}'.format(*self.client_address)

        op = {0:RequestHandler.send_list,
              1:RequestHandler.update_list,
              2:RequestHandler.delete_from_list,
              3:RequestHandler.send_ip}

        self.request.settimeout(IO_TIMEOUT)

        values = {}

        try:
            data_size = struct.unpack('=H', self.request.recv(2))[0]
            cmd = ord(self.request.recv(1))
            values["name"]=recv_string(self.request)
            values["map"]=recv_string(self.request)
            values["plr"]=recv_string(self.request)
            values["ver"]=recv_string(self.request)
            #values["port"]=struct.unpack('=d', self.request.recv(8))[0]
            values["port"]=self.request.recv(8)

            op[cmd](self, values)

            self.msg += "DONE"
        except Exception, e:
            self.msg += "SEND/RECV ERROR: " + str(e)
            self.log_msg = True

        if self.log_msg:
            logging.info(self.msg)
    
    def send_list(self, v):
        self.msg += "Sending list..."

        data = bytearray()
        data += chr(254)
        data += chr(len(server_list))

        for key,value in server_list.items():
            data += value["ip"]+'\0'
            data += value["name"]+'\0'
            data += value["map"]+'\0'
            data += value["plr"]+'\0'
            data += value["ver"]+'\0'
            # data += struct.pack('=d', value["port"])
            data += value["port"]

        self.request.sendall(struct.pack("=H", len(data)))
        self.request.sendall(data)

    def update_list(self, v):
        key = (self.client_address[0], v["port"])
        
        if not (key in server_list):
            self.msg += "Updating list..."
        else:
            self.log_msg = False

        if is_local_ip(self.client_address[0]):
            ip = get_external_ip()
        else:
            ip = self.client_address[0]

        v["time"] = time.time()
        v["ip"] = ip
        
        server_list[key] = v

    def delete_from_list(self, v):
        self.msg += "Deleting from list..."

        key = (self.client_address[0], v["port"])

        del server_list[key]

    def send_ip(self, v):
        self.msg += "Sending ip..."

        if is_local_ip(self.client_address[0]):
            ip = get_external_ip()
        else:
            ip = self.client_address[0]

        data = bytearray()
        data += (chr(253))
        data += (ip + '\0')

        self.request.sendall(struct.pack("=H", len(data)))
        self.request.sendall(data)

class MasterServer(SocketServer.TCPServer):
    pass



if __name__=="__main__":
    parser = argparse.ArgumentParser('Master server for D2DMP06')
    parser.add_argument('-p','--port', type=int, default=PORT,
                        help='Set server port')
    parser.add_argument('-t','--timeout', type=int, default=UPDATE_TIMEOUT, metavar='MINUTES',
                        help='Update timeout')
    parser.add_argument('-v','--verbose', action='store_true',
                        help='Turn logging on')
    parser.add_argument('--log', metavar='FILE',
                        help='Write log to file')
    args = parser.parse_args()
    
    PORT = args.port
    UPDATE_TIMEOUT = args.timeout
    
    lvl = logging.ERROR
    if args.verbose or args.log!=None: lvl = logging.DEBUG
    logging.basicConfig(format = '[%(asctime)s]  %(message)s',
                        level=lvl, filename=args.log)
    
    try:
        server = MasterServer(("0.0.0.0",PORT), RequestHandler)
        logging.info("SYSTEM: D2DMP06_SLIST {} starting up on port :{}".format(VERSION, PORT))
        logging.info("SYSTEM: Update timeout {} minutes".format(UPDATE_TIMEOUT))
        server.serve_forever()
    except KeyboardInterrupt:
        server.shutdown()
        logging.info("SYSTEM: Shutdown")
        sys.exit(0)
    except:
        logging.info("SYSTEM: Server starting error on port :{}".format(PORT))
   
