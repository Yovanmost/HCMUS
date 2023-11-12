#include <iostream>
#include <random>
#define long long long

using namespace std;

long createRandomNumber(long k){
    random_device rd;
    default_random_engine generator(rd());
    uniform_int_distribution<long unsigned> distribution(0, k);
    return distribution(generator);
}

int main(){
    long k;
    cin >> k;
    for (int i = 0; i < 100; i++)
        cout << createRandomNumber(k) << ' ';

    return 0;
}