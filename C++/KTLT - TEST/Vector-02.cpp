#include <iostream>
#include <math.h>

using namespace std;

int qFactors(long n, long primes[], long k[], int &np){
    if (n < 0){
        qFactors(-n, primes, k, np);
        primes[0] = -primes[0];
        return -1;
    }

    if (n <= 3){
        primes[0] = n;
        k[0] = 1;
        np = 1;
    }
    else{
        long p = 2, countFactor = 0;
        double sqrt_n = sqrt(n);
        np = 0;
        while (n > 1){
            if (n % p == 0){
                if (countFactor == 0){
                    primes[np] = p;
                    np++;
                }
                countFactor++;
                k[np-1] = countFactor;
                n /= p;
            }
            else {
                p++;
                countFactor = 0;
                // Prime number checking condition
                if (p > sqrt_n){
                    primes[np] = n;
                    k[np] = 1;
                    np++;
                    break;
                }
            }
        }
    }
}

int main(){

    return 0;
}