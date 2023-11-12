#include <iostream>
#define MAX 100

using namespace std;

void inputMatrix(int a[][MAX], int &rows, int &cols){
    cout << "Rows: ";   cin >> rows;
    cout << "Cols: ";   cin >> cols;
    for (int i = 0; i < rows; i++)
        for (int j = 0; j < cols; j++)
            cin >> a[i][j];
}

void printMatrix(int a[][MAX], int rows, int cols){
    for (int i = 0; i < rows; i++){
        for (int j = 0; j < cols; j++)
            cout << a[i][j] << ' ';
        cout << '\n';
    } 
}

void mainDiagonal(int a[][MAX], int rows, int cols){
    for (int i = 0; i < rows; i++){
        for (int j = 0; j < cols; j++)
            if (i == j)
                cout << a[i][j] << ' ';
    }
    cout << '\n';
}

void subDiagonal(int a[][MAX], int rows, int cols){
    for (int i = 0; i < rows; i++){
        for (int j = 0; j < cols; j++)
            if (i + j == cols - 1)
                cout << a[i][j] << ' ';
    }
    cout << '\n';
}

void triangle_MainDiagonal(int a[][MAX], int rows, int cols){
    for (int i = 0; i < rows; i++){
        for (int j = 0; j < cols; j++)
            if (i <= j)
                cout << a[i][j] << ' ';
        cout << '\n';
    }
}

void triangle_subDiagonal(int a[][MAX], int rows, int cols){
    for (int i = 0; i < rows; i++){
        for (int j = cols - 1; j >= 0; j--)
            if (i >= cols - j)
                cout << a[i][j] << ' ';
    }
    cout << '\n';
}

int main(){
    int a[MAX][MAX];
    int rows, cols;
    inputMatrix(a, rows, cols);
    printMatrix(a, rows, cols);
    subDiagonal(a, rows, cols);

    return 0;
}