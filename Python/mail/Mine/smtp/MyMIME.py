import base64
import socket
import os

class MyMIMEText:
    def __init__(self, text, subtype='plain'):
        self.text = text
        self.subtype = subtype

    def as_string(self):
        return f'Content-Type: text/{self.subtype}; charset="utf-8"\r\n\r\n{self.text}\r\n'

class MyMIMEBase:
    def __init__(self, payload, subtype, filename=None):
        self.payload = payload
        self.subtype = subtype
        self.filename = filename

    def as_string(self):
        header = f'Content-Type: application/{self.subtype}\r\n'
        if self.filename:
            header += f'Content-Disposition: attachment; filename="{self.filename}"\r\n'

        encoded_payload = base64.b64encode(self.payload).decode()
        return f'{header}\r\n{encoded_payload}\r\n'

class MyMIMEMultipart:
    def __init__(self):
        self.parts = []

    def attach(self, part):
        self.parts.append(part)

    def as_string(self):
        boundary = 'my_boundary'
        content_type = f'multipart/mixed; boundary={boundary}'
        headers = f'Content-Type: {content_type}\r\n'

        body = '\r\n'.join([f'--{boundary}\r\n{part.as_string()}' for part in self.parts])
        body += f'--{boundary}--\r\n'

        return headers + '\r\n' + body