import os, sys
from client import Client
from smtp.smtp_client_2 import SmtpClient

def main():
    rcpt = {
        'To': ['binhminh@fit.hcmus.edu.vn']
    }

    mssg = ['', '[...That was but a fleshly love.', 
             'Bodily love tends to occur from sensation. The eyes spot a beauty. The nose smells sweetness. Being protected to rest at a nearby pond and the feeling of elongating my existence is brought forth from a bodily relationship. But that stops once filled. It dries rapidly and something sweeter can always replace it and ache the heart.', 
            'But psychological love permeates through the stomach and levitates the entire body. It occurs not from sensation but from the time spent together. It pervades and is not filled and thus cannot be replaced with anything else. It forever establishes its position in between the soul and warmly embraces my body and mind.',
            'This is fundamentally different from the short throbbing or aching of the heart. Thinking about it, the warmth spreading from the lower stomach to all over the body through the veins, is like \'that\' filling the empty outer space called \'me\', brightening it with warm light.',
            'Though I have yet to hear such stories about love...]', '']
    attc = [r'C:\\Users\\Binh Minh\\OneDrive - MSFT\Documents\\HCMUS\\Python\\mail\\Mine\\22127266_Week08_01.rar',
            r'C:\\Users\\Binh Minh\\OneDrive - MSFT\Documents\\HCMUS\\Python\\mail\\Mine\\pop3.py',
            r'C:\\Users\\Binh Minh\\OneDrive - MSFT\Documents\\HCMUS\\Python\\mail\\Mine\\References.txt']

    # some how the detect function change the out come of how long the smtp can be sent ????
    c = SmtpClient('localhost', 4000)
    
    c.send_mail('binhminh@fit.hcmus.edu.vn', rcpt, 'Test no. IDK with multiple attachments', mssg, attc)
    

if __name__ == "__main__":
    main()
