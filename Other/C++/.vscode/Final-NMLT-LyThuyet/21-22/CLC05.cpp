#include <iostream>

using namespace std;

// A = 2
// B = 6
// C = 6
// M = 10 + A = 12
// N = 21 - B = 15
// P = A + B = 8

float calFraction(int a[], int n){
    if (n == 0)
        return 0;
    return (a[n-1] * (a[n] + n) * 1.0) / (n + 1) + calFraction(a, n - 1);
}

int sumToN(int n){
    int i = 0;
    if (n == 0)
        return 0;
    return n + sumToN(n-1);
}

int main(){
    // int m, n;
    // cin >> m >> n;
    // int a[m][n];
    // for (int i = 0; i < m; i++){
    //     for (int j = 0; j< n; j++){
    //         cout << "[" << i << "][" << j << "]: ";
    //         cin >> a[i][j];
    //     }
    // }

    // for (int i = 0; i < m; i++){
    //     for (int j = 0; j< n; j++){
    //         cout << a[i][j] << "\t" ;
    //     }
    //     cout << "\n";
    // }

    // int b[100];
    // int tmp = 0;

    // for (int i = 0; i < m; i++){
    //     for (int j = 0; j< n; j++){
    //         if(i == 0 || i == m - 1)   
    //             b[tmp++] = a[i][j];
    //         else if (j == 0 || j == n - 1)
    //             b[tmp++] = a[i][j];
    //     }
    // }

    // for (int i = 0; i < tmp; i++){
    //     cout << b[i] << " ";
    // }

    int a[100];
    int n;
    cin >> n;
    for (int i = 0; i <= n; i++){
        a[i] = -i - 1;
    }

    for (int i = 0; i <= n; i++)
        cout << a[i] << " ";

    int m = 0;
    float res = calFraction(a, n);
    cout << "\nRes: " << res; 
    return 0;
}