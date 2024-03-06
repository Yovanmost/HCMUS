#include <iostream>

using namespace std;

struct minipoint{
    uint8_t x;
    uint8_t y;
    uint8_t z;
};

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

    // result:  1 3 4 2 4 0
    // order:   1 2 3 4 5 6
    // 6 < 1 < 4 < 2 < 3 = 5
    return 0;
}