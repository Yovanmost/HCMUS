#include <iostream>
#include <string>
#include <string.h>
#include <fstream>

using namespace std;

void masking(char mask, char name[]){
    for (int i = 0; i < strlen(name); i++) {
        cout << (char)(name[i]^mask);
    }
}

void decoding(char mask, char encrypted[]){
    for (int i = 0; i < strlen(encrypted); i++) {
        cout << (char)(encrypted[i]^mask);
    }
}

std::string hexify(unsigned int n)
{
    std::string res;

    do
    {
        res += "0123456789ABCDEF"[n % 16];
        n >>= 4;
    } while(n);

    return std::string(res.rbegin(), res.rend());
}



int main(){
    // masking('Q', "bhthong");
    
    
    decoding('Q', "78% 92<$\"");

    return 0;
}