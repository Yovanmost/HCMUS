import socket
import ssl

class Pop3Client:
    def __init__(self, host, port, use_ssl=False):
        self.host = host
        self.port = port
        self.use_ssl = use_ssl
        self.sock = self._create_socket()

    def _create_socket(self):
        """Create and configure a socket for POP3 connection."""
        sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        if self.use_ssl:
            sock = ssl.wrap_socket(sock, ssl_version=ssl.PROTOCOL_SSLv23)
        return sock

    def connect(self):
        """Establish a connection to the POP3 server."""
        self.sock.connect((self.host, self.port))
        code, mssg = self._receive_response()
        self._validate_response(code, mssg, 'Connection established')

    def login(self, username, password):
        """Authenticate to the POP3 server."""
        self._send_command(f'USER {username}')
        code, mssg = self._receive_response()
        self._validate_response(code, mssg, 'Username accepted')

        self._send_command(f'PASS {password}')
        code, mssg = self._receive_response()
        self._validate_response(code, mssg, 'Password accepted')

    def list_messages(self):
        """List all messages on the server."""
        self._send_command('LIST')
        code, mssg = self._receive_response()
        self._validate_response(code, mssg, 'Message list received')
        return mssg.split('\r\n')[1:-2]  # Extract message sizes

    def retrieve_message(self, msg_number):
        """Retrieve a specific message from the server."""
        self._send_command(f'RETR {msg_number}')
        code, mssg = self._receive_response()
        self._validate_response(code, mssg, f'Message {msg_number} retrieved')
        return mssg

    def quit(self):
        """Close the connection to the POP3 server."""
        self._send_command('QUIT')
        code, mssg = self._receive_response()
        self._validate_response(code, mssg, 'Connection closed')
        self.sock.close()

    def _send_command(self, command):
        """Send a command to the server."""
        self.sock.sendall(bytes(command + '\r\n', 'utf8'))

    def _receive_response(self):
        """Receive and parse the server response."""
        data = b''
        while True:
            part = self.sock.recv(1024)
            data += part
            if b'\r\n' in part:
                break
        return data.decode('utf8').split(' ', 1)

    def _validate_response(self, code, mssg, success_message):
        """Validate the server response and print a success message."""
        if code != '+OK':
            raise RuntimeError(f'Error: {mssg}')
        else:
            print(success_message)
