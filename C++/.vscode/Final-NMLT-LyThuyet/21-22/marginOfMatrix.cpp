#include <iostream>

using namespace std;

void inMatrix(int a[][10], int& mRow, int& nCol){
    cin >> mRow >> nCol;
    for (int i = 0;i < mRow; i++)
        for (int j = 0; j < nCol; j++)
            cin >> a[i][j];
}

void outMatrix(int a[][10], int mRow, int nCol){
    for (int i = 0;i < mRow; i++){
        for (int j = 0; j < nCol; j++) 
            cout << a[i][j] << " ";
        cout << "\n";
    }            
}


// find the outline of matrix
int outMargin(int a[][10], int mRow, int nCol, int arr[]){
    int n = mRow * nCol;
    int count = 0;
    for (int i = 0;i < mRow; i++){
        for (int j = 0; j < nCol; j++) 
            if (i == 0 || i == mRow - 1)
                arr[count++] = a[i][j];
            else if (j == 0 || j == nCol - 1)
                arr[count++] = a[i][j];
    }

    return count;
}

int main(){
    int a[10][10];
    int m, n;
    int b[100];
    inMatrix(a, m, n);
    outMatrix(a, m, n);
    outMargin(a, m, n, b);
    for (int i = 0; i < outMargin(a, m, n, b); i++){
        cout << b[i] << " ";
    }


    return 0;
}