#include <iostream>
#include <cstring>

using namespace std;

void deleteChar(char s[], int pos){
    int n = strlen(s);
    for (int i = pos ;i < n - 1; i++){
        s[i] = s[i+1];
    }
    s[n-1] = '\0';
}

//0 = space
//000abcd00asd00
//00abcd00asd00
//0abcd00asd00
//0abcd0asd00
//
void deleteSpace(char s[]){
    int x = 0;
    int n = strlen(s);
    for (int i = 0; i < n-1; i++){
        if (s[i] == ' ' && s[i+1] == ' '){
            deleteChar(s, i);
            i--;
            x++;
        }
    }
    cout << "|" << n << "|" << x << "|\n";
    if (s[0] == ' '){
        deleteChar(s, 0);
        x++;
    }
        
    if (s[n-x-1] == ' ')
        deleteChar(s, n - x - 1);   
}

int main(){
    char s[256];
    cout << "Input: ";
    cin.getline(s, 256);
    cout << "Before: " << s << "\n";
    deleteSpace(s);
    cout << "After: ." << s << ".\n";
    return 0;
}