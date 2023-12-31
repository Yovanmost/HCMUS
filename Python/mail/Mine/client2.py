
"""
author:     iluvgirlswithglasses
github:     https://github.com/iluvgirlswithglasses
created:    Sat Nov 11 10:10:25 2023
tab-width:  4 spaces

 /\_/\
( o.o )
 > ^ <

I firmly believe in the supremacy of the Euphonium
FYI I use Debian
"""

import socket

class Client:
    def __init__(self, host, port):
        self.sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.sock.connect((host, port))

    def close(self):
        self.sock.close()

    def send(self, mssg):
        self.sock.sendall(bytes(mssg + '\r\n', 'utf8'))
        # self.sock.send(bytes(mssg + '\r\n', 'utf8'))
        # self.sock.sendall((mssg + '\r\n').encode('utf-8'))

    def recv(self):
        data = self.sock.recv(1024)
        code, mssg = data.decode('utf8').split(' ', 1)
        return code, mssg.strip()
    
    def detect_220_code(self):
        # Receive the initial response from the server
        code, mssg = self.recv()

        # Check if the received code is 220
        if code == '220':
            print(f"Connection established successfully: {mssg}")
        else:
            print(f"Unexpected response: {code} {mssg}")

