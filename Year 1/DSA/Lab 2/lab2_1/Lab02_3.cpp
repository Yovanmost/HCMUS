#include <iostream>
#define MAX 100

using namespace std;

void sort(int a[][MAX], int b[], int n){
    int idex = 0;
    for (int i = 0; i < n*n; i++){
        b[i] = a[i/n][i%n];
    }

    for (int i = 0; i < n*n - 1; i++)
        for (int j = i+1; j < n*n; j++)
            if (b[i] > b[j])
                swap(b[i], b[j]);
}

void printSpiralMatrix(int a[][MAX], int n){
    int ogN = n;
    // sR: start Row, sC: start Column
    int sR = 0, sC = 0, idex = 0, m = n, i;
    int tmp[n*n];
    int anotherMatrix[MAX][MAX];
    sort(a, tmp, n);
    
    while (sR < m && sC < n){
        // top row
        for (i = sC; i < n; i++)
            a[sR][i] = tmp[idex++];
        sR++;
        
        // most right column
        for (i = sR; i < m; i++)
            a[i][n-1] = tmp[idex++];
        n--;

        // bottom row
        if (sR < m){
            for (i = n - 1; i >= sC; i--)
                a[m - 1][i] = tmp[idex++];
            m--;    
        }
        
        // left most column
        if (sC < n){
            for (i = m - 1; i >= sR; i--)
                a[i][sC] = tmp[idex++];
            sC++;
        }
    }

    for (int i = 0; i < ogN*ogN; i++){
        if (i % ogN == 0 && i != 0)
            cout << '\n';
        cout << a[i/ogN][i%ogN] << ' ';
    }
}


int main(){
    // int n = 4;
    // int a[MAX][MAX] = { { 1, 2, 3, 4 },
    //                     { 5, 6, 7, 8 },
    //                     { 9, 10, 11, 12 },
    //                     { 13, 14, 15, 16 } };

    int n = 5;
    int a[MAX][MAX] = { {1, 4, 3 ,5, 2},
                        {9, 8 ,7, 6, 10},
                        {12, 11, 13, 14, 15},
                        {16, 19, 20, 18, 17},
                        {25, 22, 23, 21, 24} };

    printSpiralMatrix(a, n);

    return 0;
}