import socket

FORMAT = 'utf-8'
send_mail_server = ("localhost", 4000)  # Server default PORT + local IP

def send_msg(msg, send_client_socket):
    send_client_socket.send(msg.encode(FORMAT))

def recv_msg(recv_client_socket):
    return recv_client_socket.recv(1024).decode(FORMAT)

def demo2():
    send_client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    send_client_socket.connect(send_mail_server)

    attc = r'C:\\Users\\Binh Minh\\OneDrive - MSFT\\Documents\\HCMUS\\Python\\mail\\Mine\\smtp_log03.txt'

    send_msg('EHLO [127.0.0.1]', send_client_socket)
    send_msg('MAIL FROM:<binhminh@fit.hcmus.edu.vn>', send_client_socket) 
    send_msg('RCPT TO:<binhminh@fit.hcmus.edu.vn>', send_client_socket)
    send_msg('DATA', send_client_socket)

    with open(attc, 'r') as att_file:
        for line in att_file:
            send_msg(line, send_client_socket)
            # print(f'{line}')

def main():
    demo2()

if __name__ == "__main__":
    main()
