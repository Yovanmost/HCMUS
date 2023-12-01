from socket import *
from base64 import *
import ssl
#add in prompt
userEmail = input("Enter Your Email Address: ")
userPassword = input("Enter Your Password: ")
userDestinationEmail = input("Enter Email Destination: ")
userSubject = input("Enter Subject: ")
userBody = input("Enter Message: ")




msg = '{}.\r\n I love computer networks!'.format(userBody)
endmsg = "\r\n.\r\n"
# Choose a mail server (e.g. Google mail server) and call it mailserver
mailserver = 'localhost'
mailPort = 4000
# Create socket called clientSocket and establish a TCP connection with mailserver
#Fill in start
clientSocket = socket(AF_INET, SOCK_STREAM)
clientSocket.connect((mailserver, mailPort))
#Fill in end
recv = clientSocket.recv(1024)
print(recv)
if recv[:3] != '220':
    print('220 reply not received from server.')
# Send HELO command and print server response.
heloCommand = 'HELO Alice\r\n'
clientSocket.send(heloCommand)
recv1 = clientSocket.recv(1024)
print(recv1)
if recv1[:3] != '250':
    print('250 reply not received from server.')
 

# Send MAIL FROM command and print server response.
# Fill in start
mailFrom = "Mail from: <{}>\r\n".format(userDestinationEmail)
clientSocket.send(mailFrom)
recv5 = clientSocket.recv(1024)
print(recv5)
# Fill in end
# Send RCPT TO command and print server response.
# Fill in start
rcptto = "RCPT TO: <{}>\r\n".format(userDestinationEmail)
clientSocket.send(rcptto)
recv6 = clientSocket.recv(1024)
print(recv6)
# Fill in end
# Send DATA command and print server response.
# Fill in start
data = 'DATA\r\n'
clientSocket.send(data)
recv7 = clientSocket.recv(1024)
print(recv7)
# Fill in end
# Send message data.
# Fill in start
clientSocket.send("Subject: {}\n\n{}".format(userSubject, msg))
# Fill in end
# Message ends with a single period.
# Fill in start
clientSocket.send(endmsg)
recv8 = clientSocket.recv(1024)
print(recv8)
# Fill in end
# Send QUIT command and get server response.
# Fill in start
quitCMD = 'QUIT\r\n'
clientSocket.send(quitCMD)
recv9 = clientSocket.recv(1024)
print(recv9)


clientSocket.close()
print('Success')
# Fill in end
