from client2 import Client
from smtp.smtp_client_2 import SmtpClient
import base64
from datetime import datetime
import os


def encode_attachment(file_path):
    """Encode the content of the attachment file"""
    with open(file_path, 'rb') as file:
        attachment_content = file.read()
    return base64.b64encode(attachment_content).decode('utf-8')

def send_demo():
    attc = r"C:\Users\Admin\Desktop\Tai_lieu_Socket\References.txt"
    c = SmtpClient('127.0.0.1', 4000)

    c.send('EHLO 127.0.0.1')
    c.send('MAIL FROM: binhminh@fit.hcmus.edu.vn')
    c.send('RCPT TO: binhminh@fit.hcmus.edu.vn')
    c.send('DATA')

    timestamp = int(datetime.timestamp(datetime.now()))
    boundary = f'------------Boundary_{timestamp}'
    c.send(f'Content-Type: multipart/mixed; boundary="{boundary}"')

    c.send('Message-ID: 126')
    c.send('Date: Wed, 15 Nov 2023 22:11:00 +0700')
    c.send('MIME-Version: 1.0')
    c.send('User-Agent: Mozilla Thunderbird')
    c.send('Content-Language: en-US')

    c.send('To: binhminh@fit.hcmus.edu.vn')
    c.send('From: Binh Minh <binhminh@fit.hcmus.edu.vn>')
    c.send('Subject: Test12')
    c.send('Content-Type: text/plain; charset=UFT-8; format=flowed')
    c.send('Content-Transfer-Encoding: 7bit\n')



    c.send('Dear me\n This is a test\nDearest, me\n.')


    if len(attc) != 0:
        c.send(f'{boundary}')

        for att_path in attc:
            file_name = att_path.split("/")[-1]  # Extract the file name from the path

            c.send(f'Content-Type: application/octet-stream; name="{file_name}"')
            c.send(f'Content-Disposition: attachment; filename="{file_name}"')
            c.send(f'Content-Transfer-Encoding: base64')

            # Ensure there is a boundary before each attachment's content-type
            c.send(f'{boundary}')

            with open(att_path, 'rb') as att_file:
                att_content = base64.b64encode(att_file.read()).decode('utf-8')

                # Send the content in chunks of 72 characters
                for i in range(0, len(att_content), 72):
                    chunk = att_content[i:i+72]
                    c.send(chunk)

            c.send('')  # Empty line to separate attachments

        c.send(f'{boundary}--\n.')  # End of the boundary

    # c.send('.')

def demo1():
    attachment_path = r"C:\Users\Admin\Desktop\Tai_lieu_Socket\References.txt"
    print(encode_attachment(attachment_path),'\n')
    print(f'Content-Type: multipart/mixed; boundary="------------{hash(attachment_path)}')

def main():
    print('Something\n')  
    # demo1()  
    send_demo()

if __name__ == "__main__":
    main()



    # if len(attc) != 0:
        #     for attachment_path in attc:
        #         # boundary for individual attachment
        #         self.send(f'------------{hash(attc)}')

        #         # content type, disposition, transfer encoding
        #         self.send(f'Content-Type: application/octet-stream; name="{attachment_path}"')
        #         self.send(f'Content-Disposition: attachment; filename="{attachment_path}"')
        #         self.send(f'Content-Transfer-Encoding: base64')

        #         # encode base64 in chunks of 72 characters
        #         with open(attachment_path, 'rb') as file:
        #             attachment_data = base64.b64encode(file.read()).decode('utf-8')
        #             chunk_size = 72
        #             for i in range(0, len(attachment_data), chunk_size):
        #                 self.send(attachment_data[i:i + chunk_size])

        #     # end boundary for all attachments
        #     self.send(f'------------{hash(attc)}--')
