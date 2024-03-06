#include <iostream>

using namespace std;


// O(n)
void fibLoop(int n){
    int a[n];
    a[0] = 0, a[1] = 1, a[2] = 1;
    if (n < 3)
        return;
    for (int i = 1; i < 3; i++)
        cout << a[i] << ' ';
    for (int i = 3; i <= n; i++){
        a[i] = a[i-1] + a[i-2];
        cout << a[i] << ' ';
    } 
}

// O(1.6180^n)
int fibRecursion(int n){
    if (n <= 1)     
        return n;
    return fibRecursion(n-1) + fibRecursion(n-2);
}

// O(n*(1.6180^n))
void fibRecursionList(int n){
    for (int i = 1; i <= n; i++)
        cout << fibRecursion(i) << ' ';
}

int main(){
    int n;
    cin >> n;
    // cout <<fibRecursion(n);
    fibRecursionList(n);

    return 0;
}