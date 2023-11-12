#include <iostream>
#include <string.h>

using namespace std;

void splitWords(char s[], char tmp[256][256], int &n){
    int i = 0, j = 0, k = 0;

    while (s[k] != '\0'){
        if (s[k] != ' '){
            tmp[i][j++] = s[k];
        }else{
            tmp[i][j] = '\0';
            i++;
            j = 0;
        }
        k++;
    }
    n = i+1;

    for (int i = 0; i < n; i++)
        cout << tmp[i] << "\n";
}

int main(){
    char s[256];
    char words[256][256];
    string tmp;
    cin.getline(s, 256);
    getline(cin, tmp);
    int n, count = 0;
    splitWords(s, words, n);
    for (int i = 0; i < n; i++)
        if (tmp == words[i])
            count++;
    cout << count;

    return 0;
}