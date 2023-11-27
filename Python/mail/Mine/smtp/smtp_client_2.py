
"""
author:     iluvgirlswithglasses
github:     https://github.com/iluvgirlswithglasses
created:    Sat Nov 11 15:39:41 2023
tab-width:  4 spaces

 /\_/\
( o.o )
 > ^ <

I firmly believe in the supremacy of the Euphonium
FYI I use Debian
"""

from typing import Dict, List
from datetime import datetime
from client2 import Client
from config_2 import Config
import base64
import os

class SmtpClient(Client):
    """
    @ complete operations

    parameters:
        strt:   address of the sender (start)
        dest:   address of the receiver(s) (destinations)
            format: { 'to/cc/bcc', {receivers} }
        mssg:   message
        attc:   attachments' path
    """
    def send_mail(self, strt: str, dest: Dict[str, List[str]], subj: str, mssg: List[str], attc: List[str]):
        """Send a whole mail"""
        # verification
        self.ehlo('localhost')

        # sender/recipients informations
        self.send(f'MAIL FROM: <{strt}>')
        for mode, recipients in dest.items():
            for rcpt in recipients:
                self.send(f'RCPT TO: <{rcpt}>')

        # headers
        cnfg = Config.load()
        # self.putcmd('DATA')
        self.send('DATA')
        
        # if there are attachments create boundary
        if (len(attc) != 0):
            timestamp = int(datetime.timestamp(datetime.now()))
            boundary = f'------------Boundary_{timestamp}'
            self.send(f'Content-Type: multipart/mixed; boundary="{boundary}"')


        self.send(f'Message-ID: {self.gen_mssg_id(strt)}')
        self.send(f'Date: {self.gen_cdate()}')
        self.send(f'MIME-Version: {cnfg["mime_version"]}')
        self.send(f'User-Agent: {cnfg["user_agent"]}')
        self.send(f'Content-Language: {cnfg["content_language"]}')

        # to/cc/bcc/from
        for mode, recipients in dest.items():
            if mode not in ['To', 'Cc']:
                continue
            self.send(f'{mode}: {", ".join(recipients)}')
        self.send(f'From: {strt}')

        # subject/content declarations
        self.send(f'Subject: {subj}')

        if (len(attc) != 0):
            self.send('This is a multi-part message in MIME format.\n')
            self.send(f'------------{hash(attc)}')

        self.send(f'Content-Type: {cnfg["content_type"]}')
        self.send(f'Content-Transfer-Encoding: {cnfg["content_transfer_encoding"]}')

        # contents
        for line in mssg:
            self.send(line)
        
        # attachments
        # Use a for loop to do this :
        # Start loop
        #     boundary 
        #     ith attachment
        #       content-type 
        #              -Disposition
        #              -Transfer
        #       encode base 64
        # End loop
        # boundary for everything self.send(f'------------{hash(attc)}--') to mark the end
        
        # attachments
        if len(attc) != 0:
            self.send(f'{boundary}')

            for att_path in attc:
                # Extract the file name from the path
                file_name = os.path.basename(att_path)  

                # Checking file size using os
                if os.path.getsize(att_path) > 3 * 1024 * 1024:
                    print(f"Skipping attachment '{file_name}' as it is larger than 3MB.")
                    continue

                self.send(f'Content-Type: application/octet-stream; name="{file_name}"')
                self.send(f'Content-Disposition: attachment; filename="{file_name}"')
                self.send(f'Content-Transfer-Encoding: base64')

                # Ensure there is a boundary before each attachment's content-type
                self.send(f'{boundary}')

                with open(att_path, 'rb') as att_file:
                    att_content = base64.b64encode(att_file.read()).decode('utf-8')

                    # Send the content in chunks of 72 characters
                    for i in range(0, len(att_content), 72):
                        chunk = att_content[i:i+72]
                        self.send(chunk)

                # Empty line to separate attachments
                self.send('')  

            # End of the boundary with a dot
            self.send(f'{boundary}--\n.')   



    """
    @ protocol components
    """
    def ehlo(self, host):
        """Perform EHLO verification"""
        self.putcmd('EHLO', f'[{host}]')

    """
    @ generators
    """
    def gen_mssg_id(self, strt: str):
        """Give the message an ID"""
        return '{}-{}'.format(datetime.now().timestamp(), strt)

    def gen_cdate(self):
        """Return current date in C format"""
        return datetime.now().strftime("%a %b %d %H:%M:%S %Y")

    """
    @ tools
    """
    def putcmd(self, cmd, args=''):
        """Send a command to the server."""
        if args == '':
            s = cmd
        else:
            s = f'{cmd} {args}'
        if '\r' in s or '\n' in s:
            s = s.replace('\n', '\\n').replace('\r', '\\r')
            raise ValueError('Command contains prohibited characters')
        self.send(s)
