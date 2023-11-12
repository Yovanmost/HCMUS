#include <iostream>
#include <string.h>

using namespace std;

void reverseWord(char* s){
    int top = -1;
    int i = 0;
    char* reverse = new char [strlen(s)];
    while (i != strlen(s)){
        reverse[++top] = s[i++];
    }
    while (top > -1){
        cout << reverse[top--];
    }
    delete[] reverse;
}

int main(){
    char* s = "duck";
    reverseWord(s);

    return 0;
}