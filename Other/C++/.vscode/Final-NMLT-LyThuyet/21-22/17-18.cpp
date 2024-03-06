#include <iostream>
#include <math.h>

using namespace std;

int isPrime(int n){
    if (n < 2)
        return 0;
    for (int i = 2; i <= sqrt(n); i++){
        if (n % i == 0)
            return 0;
    }

    return 1;
}

void slitPrime(int n){
    for (int i = 2; i < n / 2; i++){
        if (isPrime(i) == 1 && isPrime(n-i) == 1)
            cout << i << " " << n - i << "\n";
    }
}

int main(){
    int n;
    cin >> n;
    slitPrime(n);

    return 0;
}