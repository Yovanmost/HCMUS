from socket import *
s = socket(AF_INET,SOCK_STREAM)
s.bind(("",9000))
s.listen(5)
while True:
    c,a = s.accept()
    print ("Received connection from", a)
    message = "Hello %s\n" % a[0]
    c.send(message.encode('utf-8'))  
    c.close()
    break
print("END")