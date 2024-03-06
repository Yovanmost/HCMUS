#include <iostream>

using namespace std;

int sumAllEven(int a[], int n){
    if (n == 0)
        return 0;
    if (a[n] % 2 == 0)
        return a[n] + sumAllEven(a, n - 1);
    else
        return sumAllEven(a, n - 1);
}

int findMax(int a, int b){
    if (a > b)
        return a;
    else return b;
}

int findMaxArray(int a[], int n){
    if (n == 0)
        return a[0];
    return findMax(a[n], findMaxArray(a, n - 1));
}

int findPositionOfX(int a[], int n, int x){
    if (n < 0)
        return -1;
    if (a[n] == x)
        return n;
    return findPositionOfX(a, n-1, x);
}

int isPrime(int n){
    if (n < 2)
        return 0;
    for (int i = 2; i < n; i++)
        if (n % i == 0)
            return 0;
    return 1;
}

int isPrimeArray(int a[], int n){
    if (n < 0)
        return 0;
    if (isPrime(a[n]) == 1){
        cout << a[n];
        isPrimeArray(a, n - 1);
    }
    else isPrimeArray(a, n - 1);
}

int main(){
    int a[1000];
    int n, x;
    cin >> n >> x;
    for (int i = 0; i < n; i++)
        cin >> a[i];
    
    isPrimeArray(a, n - 1);

    return 0;
}