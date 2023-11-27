from client import Client
from smtp.smtp_client_2 import SmtpClient

def main():
    try:
        # Create an instance of SmtpClient with the server details
        smtp_client = SmtpClient('127.0.0.1', 4000)

        # Receive the server's welcome message
        welcome_code, welcome_message = smtp_client.recv()
        print(f"Server response: {welcome_code} {welcome_message}")

        # Send EHLO command
        smtp_client.send('EHLO localhost')
        ehlo_code, ehlo_message = smtp_client.recv()
        print(f"EHLO response: {ehlo_code} {ehlo_message}")

        # Define email details
        sender_address = 'binhminh@fit.hcmus.edu.vn'
        recipient_addresses = {'To': ['binhminh@fit.hcmus.edu.vn']}
        subject = 'Test Email'
        message_body = ['', 'Sample paragraph', '', '.']


        # Attachments, if any
        attachments = ['/path/to/attachment.txt']

        # Send the email
        smtp_client.send_mail(sender_address, recipient_addresses, subject, message_body, attachments)

        # Close the connection
        smtp_client.close()

    except Exception as e:
        print(f"An error occurred: {e}")

# Run the main function if this script is executed
if __name__ == "__main__":
    main()