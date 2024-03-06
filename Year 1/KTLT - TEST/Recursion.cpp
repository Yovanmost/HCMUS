#include <iostream>

using namespace std;

// S(n) = 1 + 2 + .. + n
int sumOfN(int n){
    
    if (n == 0) 
        return 0;
    return n + sumOfN(n - 1);
}

// T(x) = n^k
int sumOfT(int n, int k){
    if (n == 1)
        return 1;
    if (n == 0)
        return 0;
    
    if (k == 0)
        return 1;
    k--;
    return n * sumOfT(n, k);
}

// C(n) = 1/1 - 1/2 + 1/3 - 1/4 .. (+/-) 1/n
float sumOfC(int n){
    if (n == 1)
        return 1;
    if (n % 2 == 0)
        return -(1.0/n)*1.0 + sumOfC(n-1);
    else 
        return (1.0/n)*1.0 + sumOfC(n-1);
}

int main(){
    int n, k;
    cin >> n;
    cout << sumOfC(n);
    return 0;
}