#include <iostream>
#include <string.h>

using namespace std;

void removeChar(char s[], int pos){
    for (int i = pos; i < strlen(s) - 1; i++){
        s[i] = s[i+1];
    }
    int n = strlen(s);
    s[n - 1] = '\0'; 
}

void removeSpace(char s[]){
    int x = 0;
    int n = strlen(s);
    for (int i = 0; i < n - 1; i++){
        if (s[i] == ' ' && s[i+1] == ' '){
            removeChar(s, i);
            i--;
            x++;
        }
    }

    if (s[0] == ' '){
        removeChar(s, 0);
        x++;
    }
        
    if (s[n - x - 1] == ' ')
        removeChar(s, n - x - 1);
}

void normalChar(char s[]){
    int n = strlen(s);
    for (int i = 0; i < n; i++){
        if (s[i] <= 'Z' && s[i] >= 'A')
            s[i] += 'a' - 'A';
    }
}
// 0 1 2 3

void upLetter(char s[]){
    int n = strlen(s);
    for (int i = 0; i < n - 1; i++){
        if (s[i] == ' ' && s[i+1] != ' ' && s[i+1] <= 'z' && s[i+1] >= 'a'){
            s[i+1] -= 'a' - 'A';
        }
    }
    s[0] -= 'a' - 'A';
}

void StandardizeName(char name[])
{
    removeSpace(name);
    normalChar(name);
    upLetter(name);
}
int main()
{  
    // Test bai 3 ----------------------------------------------------------------------------------
    // char name[100];
    // strcpy(name, "  nguyen  vAn teO");
    // cout << "Bai 3: ";
    // StandardizeName(name);
    // cout << name;
    // if (strcmp(name, "Nguyen Van Teo") == 0)
    //     cout << "Dung vi du de bai\n";
    // else
    //     cout << "Sai vi du de bai\n";

    char test[256];
    cin.getline(test, 256);
    cout << test << "\n";
    removeSpace(test);
    cout << "." << test << ".";
    return 0;
}