import socket
import base64

def encode_attachment(file_path):
    """Encode the content of the attachment file"""
    with open(file_path, 'rb') as file:
        attachment_content = file.read()
    return base64.b64encode(attachment_content).decode('utf-8')

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
            # email_message += f"Content-Type: multipart/mixed; boundary=boundary_{hash(attachment_content)}\r\n"
            
            email_message += "\r\n--boundary_{hash(attachment_content)}\r\n"
            email_message += "Content-Type: text/plain; charset=UTF-8\r\n"
            email_message += "\r\n"  # Blank line before the message body
            email_message += message
            email_message += f"\r\n--boundary_{hash(attachment_content)}\r\n"
            email_message += "Content-Type: application/octet-stream\r\n"
            email_message += "Content-Transfer-Encoding: base64\r\n"
            email_message += f"Content-Disposition: attachment; filename={attachment_path}\r\n"
            email_message += "\r\n"  # Blank line before the attachment content
            email_message += attachment_content
            email_message += f"\r\n--boundary_{hash(attachment_content)}--\r\n.\r\n"

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
    sender_email = 'binhminh@fit.hcmus.edu.vn'
    recipient_email = 'binhminh@fit.hcmus.edu.vn'
    email_subject = 'Test Email'
    email_body = 'This is a test email.\n\nBest regards,\nSender'
    # attachment_path = 'Attachment/HDLT_Socket.pdf'

    send_email(sender_email, recipient_email, email_subject, email_body)
    # send_email_with_attachment(sender_email, recipient_email, email_subject, email_body, attachment_path)
