#include <iostream>
#include <random>
#include <time.h>

using namespace std;

int main(){
    int i = 0;
    while (i++ < 9999){
        cout << rand() % 18500 << '\n';
    }
    return 0;
}