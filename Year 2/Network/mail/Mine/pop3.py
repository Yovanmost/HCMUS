import socket

FORMAT = 'utf-8'
recv_mail_server = ("localhost", 4001)  # Server default PORT + local IP

def send_msg(msg, send_client_socket):
    send_client_socket.send(msg.encode(FORMAT))

def recv_msg(recv_client_socket):
    return recv_client_socket.recv(1024).decode(FORMAT)

def pop3(username, password):
    recv_client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    recv_client_socket.connect(recv_mail_server)

    # USERNAME
    send_msg(f'USER {username}\r\n', recv_client_socket)
    print(recv_msg(recv_client_socket))

    # PASSWORD
    send_msg(f'PASS {password}\r\n', recv_client_socket)
    print(recv_msg(recv_client_socket))

    # STATUS (number of messages on server + total bytes)
    send_msg('STAT\r\n', recv_client_socket)
    print(recv_msg(recv_client_socket))

    # LIST (of messages stored on server)
    send_msg('LIST\r\n', recv_client_socket)
    list_response = recv_msg(recv_client_socket)
    print(list_response)

    # count number of mail in list respond
    num_files =  int(list_response.split()[1])
    print(f"Number of files: {num_files}")

    # UIDL
    send_msg('UIDL\r\n', recv_client_socket)
    uidl_response = recv_msg(recv_client_socket)
    print(uidl_response)

    # Fetch each email using RETR
    for i in range (num_files):
        send_msg(f'RETR {i+1}\r\n', recv_client_socket)
        print(recv_msg(recv_client_socket))

    # num_ids, email_ids = [line.split()[0] for line in list_response.splitlines()[1:-1]], [line.split()[1] for line in list_response.splitlines()[1:-1]]
    # for num_id, email_id in zip(num_ids, email_ids):
    #     send_msg(f'RETR {num_id}\r\n', recv_client_socket)
    #     retr_response = recv_msg(recv_client_socket)
    #     print(retr_response)

    # Bye bye!!
    send_msg('QUIT\r\n', recv_client_socket)

    # Close the socket
    recv_client_socket.close()

pop3('binhminh@fit.hcmus.edu.vn', '123456')