#include <iostream>

using namespace std;

int main(){
    int n, m;
    cin >> n >> m;

    int **a = new int *[n];
    for (int i = 0; i < n; i++){
        a[i] = new int [m];
        for (int j = 0; j < m; j++)
            cin >> a[i][j];
    }
        

    for (int i = n - 1; i >= 0; i--){
        for (int j = m - 1; j >= 0; j--)
            cout << a[i][j] << " ";
        cout << "\n";
    }
        
    
    delete []a;

    return 0;
}