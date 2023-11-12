#include <iostream>
#include <string.h>

using namespace std;

void delArr(int a[], int pos, int& n){
    for (int i = pos; i < n - 1; i++)
        a[i] = a[i+1];
    n--;
}

void combineEven(int a[], int& n){
    int x = 0;
    for (int i = 0; i < n - 1; i++){
        if (a[i] % 2 == 0 && a[i+1] % 2 == 0){
            int tmp = a[i] + a[i+1];
            delArr(a, i, n);
            a[i] = tmp;
            i--;
        }
    }
}

int main(){
    int a[9] = {5, 2, 6, 3, 4, 7, 8, 8, 4};
    int b[9] = {0};
    int n = 9;

    for (int i = 0; i < n; i++)
        cout << a[i] << " ";

    combineEven(a, n);
    cout << "\n";
     for (int i = 0; i < n; i++)
        cout << a[i] << " ";
    return 0;
}