#include <iostream>

using namespace std;

int sumToN(int n){

    if (n == 0)
        return 0;
    return n + sumToN(n - 1);
    
}

// 0 1 2 3 
int main(){
    int n;
    cin >> n;
    int i = 0;
    cout << sumToN(n);

    return 0;
}