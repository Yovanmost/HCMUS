#include <iostream>

using namespace std;

/*
    Idea:
    1. Put the number and the amount of bit inside 
    2. Shift right i times to find the ith bit and using &(and operator) with number 1 to find it either 1 or 0
    3. i runs from the left most bit(biggest) to the right most bit(smallest)
    Ex: num = 7, bit = 4
    7 = 0111
    7 >> 3 = 0; 0 & 1 = 0
    7 >> 2 = 1; 1 & 1 = 1
    7 >> 1 = 3; 3 & 1 = 1
    7 >> 0 = 7; 7 & 1 = 1
    => 0111
    Shift right ">>" means a >> b or a / 2^b
    With single precision number just cast it as int (for the function to work) and put 32 bits(float = 16bits)
*/

void printBinary(int num, int bits) {
    for (int i = bits - 1; i >= 0; i--) {
        cout << ((num >> i) & 1);
    }
    cout << endl;
}

int main() {
    int16_t x;
    float y;

    cout << "Enter a signed integer X (16-bit): ";
    cin >> x;
    cout << "Binary bit pattern of X: ";
    printBinary(x, 16);

    cout << "Enter a single precision Y: ";
    cin >> y;
    cout << "Binary bit pattern of Y: \n";
    printBinary(*reinterpret_cast<int*>(&y), 32);

    return 0;
}
