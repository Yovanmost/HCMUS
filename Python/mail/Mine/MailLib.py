import os
import csv
import re
import base64
import socket
#--------------
from datetime import datetime
import uuid
#--------------
HEADER = 1024
FORMAT = "utf-8"
BOUNDARY = "------------5sWLTDpPOowcnjH7yr7J87Aq"
MIME_VERSION = "1.0"
USER_AGENT = "Mozilla Thunderbird"
CONTENT_LANGUAGE = "en-US"
BCC_NOTICE = "undisclosed-recipients: ;"
CONTENT_TYPE = "text/plain; charset=UTF-8; format=flowed"
CONTENT_TXT = "text/plain; charset=UTF-8; name="
CONTENT_DOCX = "application/vnd.openxmlformats-officedocument.wordprocessingml.document; name="
CONTENT_PDF = "application/pdf; name="
CONTENT_JPG = "image/jpeg; name="
CONTENT_ZIP = "application/x-zip-compressed; name="
CONTENT_TRANSFER_ENCODING = "7bit"
NOTICE = "This is a multi-part message in MIME format."
SEND_CONTENT = False
USERNAME = "Dang" #can by modify
#--------------
USERNAME = 'abc@ẽample.com'  #can by modify
PASSWORD = '123' #can by modify
SERVER = '127.0.0.1'
BOUNDARIES = "--------------5sWLTDpPOowcnjH7yr7J87Aq"
POP3_PORT = 4001#can by modify
SMTP_PORT  = 4000#can by modify
SAVE_FOLDER = 'saved_emails'
NOTICE_1 = 'Content-Type: multipart/mixed;'
FOLDER_LIST = ['Inbox', 'Project', 'Important', 'Work', 'Spam']
IMPORTANT = ['urgent', 'asap', 'important', 'action required', 'critical',
             'priority', 'attention', 'dealine', 'approval required', 'emergency', 
             'important information', 'right now']
SPAM = ['virus', 'hack', 'crack', 'security alert', 'suspicious activity', 
        'unauthorized access', 'account compromise', 'fraud warning', 'phishing attempt',
        'please confirm your identity', 'click here to reset your password', 'verify your account',
        'unusual login activity', 'your account will be suspended', 'bank account verification',
        'important security upadate', 'win a prize', 'win a lottery']
WORK = ['meeting', 'report', 'project update', 'task', 'collaboration', 'discussion', 'schedule', 
        'feedback', 'assignment']
PROJECT = ['abc@example.com'] #can by modify