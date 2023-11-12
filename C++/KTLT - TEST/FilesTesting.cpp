#include <iostream>
#include <fstream>
#include <iomanip>

using namespace std;

int main(){
    int n, m;
    cin >> n >> m;

    // fstream fout("FilesTesting.txt", ios::out);
    fstream file;
    file.open("FilesTesting.dat", ios::out | ios::binary);


    int **a = new int *[n];
    for (int i = 0; i < n; i++){
        a[i] = new int [m];
        for (int j = 0; j < m; j++){
            cin >> a[i][j];
        }                
    }
   
    file.write(reinterpret_cast<char *>(a), sizeof(a));  
    file.close();

    file.open("FilesTesting.dat", ios::in | ios::binary);

    file.read(reinterpret_cast<char *>(a), sizeof(a));  

    for (int i = 0; i < n; i++){
        for (int j = 0; j < m; j++)
            cout << setw(8) << a[i][j] << " " ;
        cout << "\n";
    }

    // for (int i = n - 1; i >= 0; i--){
    //     for (int j = m - 1; j >= 0; j--)
    //         cout << setw(8) << a[i][j] << " " << &a[i][j] << "\n";
    //     cout << "\n";
    // }
        
    
    delete []a;
    file.close();
    cout << "Done";

    return 0;
}