#include "Test_Tmp_03.h"

int** newMatrix(int n){
    int** a = new int*[n];
    for (int i = 0; i < n; i++)
        a[i] = new int[n];
    return a;
}

void fill(int** &a, int n){
    for (int i = 0; i < n; i++)
        for (int j = 0; j < n; j++)
            a[i][j] = i*j;
}

void printMatrix(int** a, int n){
    for (int i = 0; i < n; i++){
        for (int j = 0; j < n; j++)
            cout << a[i][j] << ' ';
        cout << '\n';
    }
        
}

void printMatrixV2(int** a, int n){
    for (int i = 0; i < n; i++){
        for (int j = 0; j < n; j++)
            cout << a[j][i] << ' ';
        cout << '\n';
    }
        
}

void test(int** a){
    a[0][0] = 10;
}

void sort(int** a, int n){
    for (int i = 0; i < n*n-1; i++)
        for (int j = i+1; j < n*n; j++)
            if (a[i/n][i%n] > a[j/n][j%n])
                swap(a[i/n][i%n], a[j/n][j%n]);
}

int** copy(int** a, int n){
    int** b = newMatrix(n);
    for (int i = 0; i < n; i++)
        for (int j = 0; j < n; j++)
            b[i][j] = a[i][j];
    return b;
}

int main(){
    int ** a, ** b;
    int n = 4;
    a = newMatrix(n);
    fill(a, n);
    test(a);
    sort(a, n);
    b = copy(a, n);
    printMatrix(a, n);
    printMatrix(b, n);

    return 0;
}