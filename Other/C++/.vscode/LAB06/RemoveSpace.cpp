#include <iostream>
#include <cstring>

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
        
    if (s[n - 1 - x] == ' ')
        removeChar(s, n - 1 - x);
}

int main(){
    char text[256];
    cin.getline(text, 256);

    cout <<"\n" << text;
    removeSpace(text);
    cout << "\n" << text;

    return 0;
}