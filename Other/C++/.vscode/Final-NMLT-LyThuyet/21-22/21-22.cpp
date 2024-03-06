#include <iostream>

using namespace std;

void slitNumToPrime(int n){
    for (int i = 2; i <= n; i++){
        int count = 0;
        while (n % i == 0){
            count++;
            n /= i;
        }
        if (count != 0 && n == 1)
            cout << i << "^" << count ;
        else if (count != 0)
            cout << i << "^" << count << " * ";
    }
}

int main(){
    int n;
    cin >> n;
    slitNumToPrime(n);

    return 0;
}