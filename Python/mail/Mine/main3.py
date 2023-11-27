import os, sys
from client import Client
from smtp.smtp_client_2 import SmtpClient

def main():
    rcpt = {
        'To': ['binhminh@fit.hcmus.edu.vn']
    }
    mssg = ['', 'Sample paragraph', '', '.']

    c = SmtpClient('127.0.0.1', 4000)
    c.send_mail('binhminh@fit.hcmus.edu.vn', rcpt, 'Sample Subject', mssg, [])


if __name__ == "__main__":
    main()

