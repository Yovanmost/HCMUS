
"""
author:     iluvgirlswithglasses
github:     https://github.com/iluvgirlswithglasses
created:    Sat Nov 11 15:23:27 2023
tab-width:  4 spaces

 /\_/\
( o.o )
 > ^ <

I firmly believe in the supremacy of the Euphonium
FYI I use Debian
"""

import os, sys
from client import Client
from smtp.smtp_client_2 import SmtpClient

def main():
    rcpt = {
        'To': ['binhminh@fit.hcmus.edu.vn'],
        # 'Cc': ['iluv@example.com'],
        # 'Bcc': ['tmp@here.com', 'there@there.com']
    }
    mssg = ['', 'Sample paragraph', '', '.']

    c = SmtpClient('localhost', 4000)
    c.send_mail('binhminh@fit.hcmus.edu.vn', rcpt, 'Sample Subject', mssg, [])


if __name__ == "__main__":
    main()

