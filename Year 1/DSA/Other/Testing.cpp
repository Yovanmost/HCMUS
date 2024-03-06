#include <iostream>
#include <string>
#include <cstring>
#include "StackAndQueue.h"

using namespace std;



int main(){
    string s = "E A S * Y * Q U E * * *  S T * * * I O * N * * *";
    // string s = "L A * S T I * N * F I R * S T * * O U * T * * * * * *";
    myStack st;
    myQueue qe;
    for (int i = 0; i < s.length(); i++){
        string tmp = "";
        tmp += s[i];
        if (s[i] != '*' && s[i] != ' ')
            enQueue(qe, tmp);
        else if (s[i] == '*'){
            cout << Front(qe);
            deQueue(qe);
        }
    }
    

    return 0;
}