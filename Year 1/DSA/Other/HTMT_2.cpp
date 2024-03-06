#include <iostream>

using namespace std;

struct minipoint{
    uint8_t x;
    uint8_t y;
    uint8_t z;
};

// XOR: commutative and associative => order of the operands does not matter
// 0x11 ^ n = 0x3d
// n = 0x11 ^ 0x3d
// n = 0x2c
// n = 44 (in decimal)

int f1(int n){    
    return 0x11 ^ n;
}


int main(){
    unsigned short us[1];
    double d[0];
    char **ptr;
    cout << sizeof(char) << ' '
        << sizeof(minipoint) << ' '
        << sizeof(int) << ' '
        << sizeof(us) << ' '
        << sizeof(ptr) << ' '
        << sizeof(d);
    cout << f1(44);
    // 1 3 4 2 4 0
    // 1 2 3 4 5 6

    // 6 < 1 < 4 < 2 < 3 = 5
    return 0;
}