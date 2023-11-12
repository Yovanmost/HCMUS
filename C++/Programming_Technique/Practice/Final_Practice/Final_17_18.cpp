#include <iostream>

using namespace std;

void hailStone(int &n){
    if (n == 1){
        cout << 1;
        return;
    }
    cout << n << "  ";
    if (n % 2 == 0)
        n = n/2;
    else n = n*3 + 1;
    hailStone(n);
}

int main(){
    int n;
    cin >> n;
    hailStone(n);

    return 0;
}