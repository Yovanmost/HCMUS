from socket import * #import abilities

def main():
    msg = '\r\n I love computer networks!' #message body
    endmsg = '\r\n. \r\n' # character returns and line return end message
    mailServer = 'localhost'
    mailPort = 80 #port number
    clientSocket = socket(AF_INET, SOCK_STREAM)#internet and socket protocols
    clientSocket.connect((mailServer, mailPort))

    recv = clientSocket.recv(1024)#client socket recieves certain amount of data
    print (recv) #print out the message
    if recv[:3] != '220': # if the message is not received
        print ('220 reply not received from server.')
    # Send HELO command and print server response.
    heloCommand = 'HELO Alice\r\n' #reply
    clientSocket.send(heloCommand) #send the reply
    recv1 = clientSocket.recv(1024) #receive the message
    print (recv1) #print recieved message
    if recv1[:3] != '250': #if message not received
        print ('250 reply not received from server.')
    # Send MAIL FROM command and print server response.

    clientSocket.send('Mail FROM: <alice@crepes.edu>\r\n')# who the message will appear from
    recv1 = clientSocket.recv(1024) #amount of data received
    print (recv1) #print data
    if recv1[:3] != '250': #if the data is not received
        print ('250 reply not received from server.')
    # Send RCPT TO command and print server response.
    clientSocket.send('RCPT TO: <sullivanmax@my.easternct.edu> \r\n')#recepient
    recv1 = clientSocket.recv(1024)# receive data
    print (recv1) #print data
    if recv1[:3] != '250': #if data not recieved
        print ('250 reply not received from server.')

    # Send DATA command and print server response.
    clientSocket.send('DATA\r\n') #send the data
    recv1 = clientSocket.recv(1024)#total size of the message
    print (recv1)#print received message
    if recv1[:3] != '354': #if message not received
        print ('250 reply not received from server.')

    # Send message data.
    clientSocket.send('\r\n')
    clientSocket.send('something important\r\n')

    # Message ends with a single period.
    clientSocket.send('.\r\n') # sends period, then blank line
    recv1 = clientSocket.recv(1024) #amount of data to be sent
    print (recv1) #print the message
    if recv1[:3] != '250': #if the message does not print properly
        print ('250 reply not received from server.') #print out

    # Send QUIT command and get server response.
    clientSocket.send('QUIT\r\n') #tells the server the interaction should be terminated
    clientSocket.close() #close the socket
    pass

if __name__ == '__main__':
    main()