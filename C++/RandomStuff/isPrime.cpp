#include <iostream>
#include <math.h>
using namespace std;

int isPrime(int n);

int main(){
    int n;
    cin >> n;
    int a[n];
    for (int i = 1; i <= n; i++)
        a[i-1] = i;

    int k;
    cin >> k;

    int b[k];
    for (int i = 0; i < k; i++)
        cin >> b[i];

    for (int i = 0; i < k; i++)
        if (isPrime(b[i]) == 0)
            cout << "Really";
    
    int count = 0;

    for (int i = 1; i <= n; i++)
        for (int j = 0; j < k; j++)
            if (a[i-1] % b[j] == 0){
                count++;
                break;
            }

    cout << count;

    return 0;
}

int isPrime(int n){
    if (n < 2)
        return 0;

    for (int i = 2; i <= sqrt(n); i++)
        if (n % i == 0)
            return 0;
    
    return 1;
}