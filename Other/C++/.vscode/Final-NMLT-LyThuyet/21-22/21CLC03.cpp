#include <iostream>
#include <cstring>

using namespace std;

int twoCom(int n){
    int res = 1;
    for (int i = 0; i < n; i++)
        res *= 2;
    return res;
}

int main(){
    int n;
    cin >> n;

    int tu = 1, mau = 0;
    for (int i = 1; i <= n; i++){
        tu *= i;
        mau += twoCom(i);
    }

    float sum = 1.0 * tu / mau;

    cout << sum;

    return 0;
}