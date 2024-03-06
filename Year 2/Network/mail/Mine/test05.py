from MailLib import EmailClient_Download

def main():
    email_client = EmailClient_Download()
    email_client.run_download_mail_program()

if __name__ == "__main__":
    main()