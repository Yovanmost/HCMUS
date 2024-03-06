import os
import base64

def save_email(username, email_content, filename, subfolder):
    database_folder = "database"
    user_folder = os.path.join(database_folder, username)
    deeper_folder = os.path.join(user_folder, subfolder)
    file_path = os.path.join(deeper_folder, filename)

    # Ensure directories exist
    for folder in [database_folder, user_folder, deeper_folder]:
        if not os.path.exists(folder):
            os.makedirs(folder)

    # Save email content to file
    with open(file_path, 'w') as file:
        file.write(email_content)

def save_file(file_path, filename, file_content):
    # Decode base64 content
    decoded_content = base64.b64decode(file_content)

    # Save decoded content to file
    with open(os.path.join(file_path, filename), 'wb') as file:
        file.write(decoded_content)
        print(f"File saved successfully: {file_path}/{filename}")

# Example usage
save_email("john_doe", "Hello, this is an email content.", "email.txt", "inbox")
save_file("files", "document.txt", "VGhpcyBpcyBhIGRvY3VtZW50IGVuY29kaW5nLg==")
