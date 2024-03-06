import socket
import base64
from datetime import datetime
from typing import Dict, List

def encode_attachment(file_path):
    """Encode the content of the attachment file"""
    with open(file_path, 'rb') as file:
        attachment_content = file.read()
    return base64.b64encode(attachment_content).decode('utf-8')

"""
@ generators
"""
def gen_mssg_id(self, strt: str):
    """Give the message an ID"""
    return '{}-{}'.format(datetime.now().timestamp(), strt)

def gen_cdate(self):
    """Return current date in C format"""
    return datetime.now().strftime("%a %b %d %H:%M:%S %Y")

def send_email(sender, recipient, subject, message):
    # SMTP server details
    smtp_server = '127.0.0.1'
    smtp_port = 4000

    # Sender and recipient details
    from_address = sender
    to_address = recipient

    # Establish a connection to the SMTP server
    with socket.create_connection((smtp_server, smtp_port)) as server_socket:
        # Receive the server's welcome message
        welcome_message = server_socket.recv(1024).decode('utf-8')
        print(welcome_message)

        # Send the EHLO command
        server_socket.sendall(b'EHLO HCMUS\r\n')
        ehlo_response = server_socket.recv(1024).decode('utf-8')
        print(ehlo_response)

        # Establish a secure connection
        with socket.create_connection((smtp_server, smtp_port)) as secure_socket:
            # Compose the email message
            email_message = f"From: {from_address}\r\n"
            email_message += f"To: {to_address}\r\n"
            email_message += f"Subject: {subject}\r\n"
            email_message += "\r\n"  # Blank line before the message body
            email_message += message

            # Send the email message
            secure_socket.sendall(f'MAIL FROM:<{from_address}>\r\n'.encode('utf-8'))
            secure_socket.recv(1024).decode('utf-8')  # Wait for server's response

            secure_socket.sendall(f'RCPT TO:<{to_address}>\r\n'.encode('utf-8'))
            secure_socket.recv(1024).decode('utf-8')  # Wait for server's response

            secure_socket.sendall(b'DATA\r\n')
            secure_socket.recv(1024).decode('utf-8')  # Wait for server's response

            secure_socket.sendall(email_message.encode('utf-8') + b'\r\n.\r\n')
            send_response = secure_socket.recv(1024).decode('utf-8')
            print(send_response)

            # Quit the session
            secure_socket.sendall(b'QUIT\r\n')
            secure_socket.recv(1024).decode('utf-8')  # Wait for server's response

def send_email_with_attachment(sender, recipient, subject, message, attachment_path):
    # SMTP server details
    smtp_server = '127.0.0.1'
    smtp_port = 4000

    # Sender and recipient details
    from_address = sender
    to_address = recipient

    # Encode attachment content
    attachment_content = encode_attachment(attachment_path)

    # Establish a connection to the SMTP server
    with socket.create_connection((smtp_server, smtp_port)) as server_socket:
        # Receive the server's welcome message
        welcome_message = server_socket.recv(1024).decode('utf-8')
        print(welcome_message)

        # Send the EHLO command
        server_socket.sendall(b'EHLO HCMUS\r\n')
        ehlo_response = server_socket.recv(1024).decode('utf-8')
        print(ehlo_response)

        # Establish a secure connection
        with socket.create_connection((smtp_server, smtp_port)) as secure_socket:
            # Compose the email message with attachment
            email_message = f"From: {from_address}\r\n"
            email_message += f"To: {to_address}\r\n"
            email_message += f"Subject: {subject}\r\n"
            email_message += "MIME-Version: 1.0\r\n"
            email_message += f"Content-Type: multipart/mixed; boundary=\"------------{hash(attachment_content)}\r\n"
            
            email_message += f"\r\n\"------------{hash(attachment_content)}\r\n"
            email_message += "Content-Type: text/plain; charset=UTF-8\r\n"
            email_message += "\r\n"  # Blank line before the message body
            email_message += message
            email_message += f"\r\n\"------------{hash(attachment_content)}\r\n"
            email_message += "Content-Type: application/octet-stream\r\n"
            email_message += "Content-Transfer-Encoding: base64\r\n"
            email_message += f"Content-Disposition: attachment; filename={attachment_path}\r\n"
            email_message += "\r\n"  # Blank line before the attachment content
            email_message += attachment_content
            email_message += f"\r\n\"------------{hash(attachment_content)}--\r\n.\r\n"

            # Send the email message
            secure_socket.sendall(f'MAIL FROM:<{from_address}>\r\n'.encode('utf-8'))
            secure_socket.recv(1024).decode('utf-8')  # Wait for the server's response

            secure_socket.sendall(f'RCPT TO:<{to_address}>\r\n'.encode('utf-8'))
            secure_socket.recv(1024).decode('utf-8')  # Wait for the server's response

            secure_socket.sendall(b'DATA\r\n')
            secure_socket.recv(1024).decode('utf-8')  # Wait for the server's response

            secure_socket.sendall(email_message.encode('utf-8'))
            send_response = secure_socket.recv(1024).decode('utf-8')
            print(send_response)

            # Quit the session
            secure_socket.sendall(b'QUIT\r\n')
            secure_socket.recv(1024).decode('utf-8')  # Wait for the server's response


if __name__ == "__main__":
    sender_email = 'minh@fit.hcmus.edu.vn'
    recipient_email = 'minh@fit.hcmus.edu.vn'
    email_subject = 'Test03'
    email_body = 'Dear me\nThis is a test email.\nDearest, me.'
    attachment_path = 'Attachment/HDLT_Socket.pdf'
    file_name = attachment_path.split("/")[-1]
    file_extension = file_name.split(".")[-1]
    print(f"File Name: {file_name}")
    print(f"File Type: {file_extension}")
    # print(encode_attachment(attachment_path))

    # send_email(sender_email, recipient_email, email_subject, email_body)
    # send_email_with_attachment(sender_email, recipient_email, email_subject, email_body, attachment_path)
