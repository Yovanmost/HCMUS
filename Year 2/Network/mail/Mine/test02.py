from client2 import Client
from smtp.smtp_client_2 import SmtpClient
import base64
from datetime import datetime
import os
import random


def encode_attachment(file_path):
    """Encode the content of the attachment file"""
    with open(file_path, 'rb') as file:
        attachment_content = file.read()
    return base64.b64encode(attachment_content).decode('utf-8')

def send_demo():
    # attc = [r'C:\\Users\\Binh Minh\\OneDrive - MSFT\\Documents\\HCMUS\\Python\\mail\\Mine\\hello.py']
    attc = [r'C:\\Users\\Binh Minh\\OneDrive - MSFT\Documents\\HCMUS\\Python\\mail\\Mine\\References.txt']
    # c = SmtpClient('localhost', 4000)
    c = Client('localhost', 4000)
    print(c.recv())
    c.send('EHLO 127.0.0.1')
    print(c.recv())
    c.send('MAIL FROM: binhminh@fit.hcmus.edu.vn')
    print(c.recv())
    c.send('RCPT TO: binhminh@fit.hcmus.edu.vn')
    print(c.recv())
    c.send('DATA')
    print(c.recv())
    
    # c.recv()
    n = random.randint(20, 40)
    timestamp = int(datetime.timestamp(datetime.now()))
    # boundary = f'------------{timestamp}'
    boundary = '------------NTQGbcMfsPnd4nUCcvOXBxJc'
    c.send(f'Content-Type: multipart/mixed; boundary="{boundary}"')

    c.send(f'Message-ID: <{n}>')
    c.send('Date: Wed, 29 Nov 2023 22:49:45 +0700')
    c.send('MIME-Version: 1.0')
    c.send('User-Agent: Mozilla Thunderbird')
    c.send('Content-Language: en-US')

    c.send('To: binhminh@fit.hcmus.edu.vn')
    c.send('From: Binh Minh <binhminh@fit.hcmus.edu.vn>')
    c.send(f'Subject: Test{n}')
    c.send('')
    c.send('This is a multi-part message in MIME format.')
    c.send(f'{boundary}\n')
    c.send('Content-Type: text/plain; charset=UFT-8; format=flowed')
    c.send('Content-Transfer-Encoding: 7bit\n')
    
    c.send('Dear me\n This is a References.txt\nDearest, me.\n')

    if len(attc) != 0:

        for att_path in attc:
            # Extract the file name from the path
            file_name = os.path.basename(att_path)  

            # Checking file size using os
            if os.path.getsize(att_path) > 3 * 1024 * 1024:
                print(f"Skipping attachment '{file_name}' as it is larger than 3MB.")
                continue

            c.send(f'{boundary}')
            c.send(f'Content-Type: text/plain; charset=UTF-8; name="{file_name}"')
            c.send(f'Content-Disposition: attachment; filename="{file_name}"')
            c.send(f'Content-Transfer-Encoding: base64')
            c.send('')
            # Ensure there is a boundary before each attachment's content-type
            

            with open(att_path, 'rb') as att_file:
                att_content = base64.b64encode(att_file.read()).decode('utf-8')
                # print(f'{att_content}\n')

                # Send the content in chunks of 72 characters
                for i in range(0, len(att_content), 72):
                    chunk = att_content[i:i+72]
                    c.send(chunk)
                    print(f'{chunk}')

            # Empty line to separate attachments
            c.send('')  

        # End of the boundary with a dot
        c.send(f'--{boundary}--')
        c.send('.')
        print(c.recv())

def demo1():
    attc = r'C:\\Users\\Binh Minh\\OneDrive - MSFT\Documents\\HCMUS\\Python\\mail\\Mine\\References.txt'
    with open(attc, 'rb') as att_file:
        att_content = base64.b64encode(att_file.read()).decode('utf-8')
    print(att_content)
    
    # print(f'Content-Type: multipart/mixed; boundary="------------{hash(attachment_path)}')

def demo2():
    c = Client('localhost', 4000)
    attc = r'C:\\Users\\Binh Minh\\OneDrive - MSFT\\Documents\\HCMUS\\Python\\mail\\Mine\\smtp_log01.txt'
    with open(attc, 'rb') as att_file:
        for line in att_file:
            c.send(line)
            # print(f'{line}')

def send_file_content(file_path):
    # Initialize the client
    c = Client('localhost', 4000)

    # Open the file and send each line as a string
    with open(file_path, 'r') as file:
        for line in file:
            # Treat each line as a string and send it using c.send()
            c.send(str(line.strip()))        

def demo3():
    c = SmtpClient('localhost', 4000)
    c.detect_220_code()
    c.send(f'EHLO {'localhost'}')
    

def main():
    print('Something\n')  
    attc = r'C:\\Users\\Binh Minh\\OneDrive - MSFT\\Documents\\HCMUS\\Python\\mail\\Mine\\smtp_log01.txt'
    # send_file_content(attc)
    # demo1()  
    # demo2()
    # demo3()
    send_demo()

if __name__ == "__main__":
    main()



    # if len(attc) != 0:
        #     for attachment_path in attc:
        #         # boundary for individual attachment
        #         c.send(f'------------{hash(attc)}')

        #         # content type, disposition, transfer encoding
        #         c.send(f'Content-Type: application/octet-stream; name="{attachment_path}"')
        #         c.send(f'Content-Disposition: attachment; filename="{attachment_path}"')
        #         c.send(f'Content-Transfer-Encoding: base64')

        #         # encode base64 in chunks of 72 characters
        #         with open(attachment_path, 'rb') as file:
        #             attachment_data = base64.b64encode(file.read()).decode('utf-8')
        #             chunk_size = 72
        #             for i in range(0, len(attachment_data), chunk_size):
        #                 c.send(attachment_data[i:i + chunk_size])

        #     # end boundary for all attachments
        #     c.send(f'------------{hash(attc)}--')
