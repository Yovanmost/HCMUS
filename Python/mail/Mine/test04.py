# Import the POP3Client class from the pop3 module
from pop3_v2 import Pop3Client

# Define the server details
server_host = '127.0.0.1'
server_port = 4001
email = 'abc@example.com'
password = '123'

print('asdas')

# Create a POP3 client instance
pop3_client = Pop3Client(server_host, server_port)

try:
    print('asdas')
    # Connect to the server
    pop3_client.connect()
    print('asdas')

    # Login to the server with the provided email and password
    pop3_client.login(email, password)
    print('asdas')

    # List all messages on the server
    messages = pop3_client.list_messages()
    print(f'Messages on the server: {messages}')

    # Retrieve the first message (assuming at least one message exists)
    if messages:
        first_message_number = 1
        first_message = pop3_client.retrieve_message(first_message_number)
        print(f'Retrieved message {first_message_number}:\n{first_message}')

finally:
    # Close the connection to the server
    pop3_client.quit()