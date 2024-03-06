#include <iostream>
#include <cstring>

using namespace std;

int main(){
    char text[256];
    cin.getline(text, 256);

    int a[26];
    for (int i = 0; i < 26; i++){
        a[i] = 0;
    }

    for (int i = 0;i < strlen(text); i++){
        if (text[i] >= 'a' && text[i] <= 'z')
            a[text[i] - 'a']++;
    }

    int max = 0;
    for (int i = 0; i < 26; i++)
        if (a[i] > max)
            max = a[i];

    while (true){
        int max = 0;
        for (int i = 0; i < 26; i++)
            if (a[i] > max)
                max = a[i];

        if (max == 0)
            break;   

        cout << max << ": ";
        for (int i = 0; i < 26; i++){
            if (a[i] == max){
                cout << (char)(i + 'a') << " ";
                a[i] = 0;
            }            
        }     
        cout << "\n";      
    }

    return 0;
}