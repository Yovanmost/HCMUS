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

def encode_message(msg):
    return msg.encode('utf-8')

def decode_message(msg):
    return msg.decode('utf-8')

def send_mail(to_address, subject, body, attachment_filename=None):
    # SMTP server details
    smtp_server = 'localhost'
    smtp_port = 4000

    # Sender and recipient email addresses
    from_address = 'your_email@example.com'
    username = 'your_username'
    password = 'your_password'

    # Create MIME object
    mime_body = MyMIMEText(body)
    mime_attachment = None

    if attachment_filename:
        with open(attachment_filename, 'rb') as attachment_file:
            attachment_payload = attachment_file.read()
        mime_attachment = MyMIMEBase(attachment_payload, 'octet-stream', os.path.basename(attachment_filename))

    # Create MIMEMultipart
    mime_msg = MyMIMEMultipart()
    mime_msg.attach(mime_body)
    if mime_attachment:
        mime_msg.attach(mime_attachment)

    # Connect to SMTP server
    server = socket.create_connection((smtp_server, smtp_port))

    # Receive the server's welcome message
    print(server.recv(1024).decode())

    # EHLO command
    server.sendall(b'EHLO example.com\r\n')
    print(server.recv(1024).decode())

    # Send mail
    server.sendall(f'MAIL FROM: <{from_address}>\r\n'.encode())
    print(server.recv(1024).decode())
    server.sendall(f'RCPT TO: <{to_address}>\r\n'.encode())
    print(server.recv(1024).decode())
    server.sendall(b'DATA\r\n')
    print(server.recv(1024).decode())

    # Encode and send the message body
    server.sendall(encode_message(mime_msg.as_string()))

    # End the data section
    server.sendall(b'\r\n.\r\n')
    print(server.recv(1024).decode())

    # Quit
    server.sendall(b'QUIT\r\n')
    print(server.recv(1024).decode())

if __name__ == "__main__":
    to_address = 'binhminh@fit.hcmus.edu.vn'
    subject = 'Test Email 02'
    body = 'This is a test email to see how to not send the header through the mail.'
    attachment_filename = r'C:\\Users\\Binh Minh\\OneDrive - MSFT\Documents\\HCMUS\\Python\\mail\\Mine\\smtp_log01.txt'

    send_mail(to_address, subject, body, attachment_filename)
