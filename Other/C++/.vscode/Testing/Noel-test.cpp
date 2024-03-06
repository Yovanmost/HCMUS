#include <iostream>

using namespace std;

// n = 5
// 00100
// 02320
// 34543

// n = 9
// 000010000
// 000232000
// 003454300
// 045676540
// 567898765

int main(){
    int n;
    cin >> n;

    for (int i = 1; i <= n; i++){
        int x = i;

        for (int j = i; j < n; j++){
            cout << " ";
        }
        

        for (int k = n; k > n - i; k--){
            cout << x++;
        }
        cout << "\n";
    }



    return 0;
}