#include <iostream>

using namespace std;

// ENIAC
struct s{
    char f1[7]; // 7 + 9((padding)) = 16 bytes 
    char *f2;   // 16 bytes
    short f3;   // 4 + 12(padding) bytes = 16 bytes
    int f4;     // 8 + 8(padding)bytes = 16 bytes
};
// => sizeof(s) = 16*4 = 64


int main(){
    char* ptr;
    cout << sizeof(ptr);

    return 0;
}