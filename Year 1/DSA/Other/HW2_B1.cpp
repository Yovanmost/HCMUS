#include <iostream>
#define long long long

using namespace std;

long power(int n){
    long sum = 2;
    for (int i = 2; i <= n; i++)
        sum *= 2;
    return sum;
}

long sumPower(int n){
    long sum = 0;
    for (int i = 1; i <= n; i++)
        sum += power(i);
    return sum;
}

long sumPower2(int n){
    long sum = 0, base = 1;
    for (int i = 1; i <= n; i++){
        base *= 2;
        sum += base;
    }
    return sum;
}

// sumPower2 runs faster because it only needs 1 loop => O(n)
// sumPower need power(O(n)) and runs it n-times => O(n^2)

int main(){
    int n;
    cin >> n;
    cout << sumPower2(n);

    return 0;
}