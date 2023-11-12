#include <iostream>
#include <cstdlib> // for rand() and srand()
#include <ctime> // for time()

using namespace std;

// Matrix allocation
int** newMatrix(int length, int width){
    int** a = new int* [width];
    for (int i = 0; i < width; i++)
        a[i] = new int [length];    
    return a;
}

void freeMatrix(int** a, int cols, int rows){
    for (int i = 0; i < rows; i++)
        delete []a[i];
    delete []a;
}

void print2dArray(int** a, int n, int m){
    for (int i = 0; i < m; i++){
        for (int j = 0; j < n; j++)
            cout << a[i][j] << ' ';
        cout << '\n';
    }
}

// 13. Generate a random matrix with keyboard input size.
void generateMatrix1(int** &A, int &length, int &width){
    cin >> width >> length;
    A = new int* [width];
    for (int i = 0; i < width; i++)
        A[i] = new int [length];

    srand(time(0));          
    for (int i = 0; i < width; i++)
        for (int j = 0; j < length; j++)
            A[i][j] = rand() % 10 + 1; // random from 1 to 10
}

// 14. Given 2 1D arrays a and b. Generate the matrix c that c[i][j] = a[i] * b[j].
int** generateMatrix2(int* a, int* b, int na, int nb){
    // array a will be rows
    // array b will be columns
    int** c = new int* [na];
    for (int i = 0; i < na; i++)
        c[i] = new int [nb];
    
    for (int i = 0; i < na; i++)
        for (int j = 0; j < nb; j++)
            c[i][j] = a[i] * b[j];

    return c;
}

void newRandomArray(int* &a, int &n){
    cin >> n;
    a = new int[n];
    srand(time(0));      
    for (int i = 0; i < n; i++)
        a[i] = rand() % 10 + 1;
}

// 15. Swap 2 columns/rows of a given matrix.
void swapRows(int** a, int length, int width){

}

// 16. Generate the transpose matrix of a given matrix.
int** transposeMatrix(int** a, int length, int width){
    int** transMtrx = newMatrix(width, length);
    for (int i = 0; i < width; i++)
        for (int j = 0; j < length; j++)
            transMtrx[j][i] = a[i][j];
    return transMtrx;
}

// 11. Concatenate 2 given array.
int* concatenate2Arrays(int* a, int* b, int na, int nb){
    int* newArray = new int[na+nb];
    for (int i = 0; i < na; i++)
        newArray[i] = a[i];
    for (int i = na; i < nb+na; i++)
        newArray[i] = b[i-na];

    return newArray;
}

// 17. Concatenate 2 given size-equal matrices, horizontally / vertically.
int** concatenate2MatricesH(int** a, int** b, int length, int width){
    int** c = newMatrix(length*2, width);
    for (int i = 0; i < width; i++)
        c[i] = concatenate2Arrays(a[i], b[i], length, length);

    return c;
}

int** concatenate2MatricesHV2(int** a, int** b, int length, int width){
    int** c = newMatrix(length*2, width);
    for (int i = 0; i < width; i++)
        for (int j = 0; j < length; j++)
            c[i][j] = a[i][j];

    for (int i = 0; i < width; i++)
        for (int j = 0; j < length; j++)
            c[i][j+length] = b[i][j];

    return c;
}

int** concatenate2MatricesV(int** a, int** b, int length, int width){
    int** c = newMatrix(length, width*2);
    for (int i = 0; i < width; i++)
        for (int j = 0; j < length; j++)
            c[i][j] = a[i][j];

    for (int i = 0; i < width; i++)
        for (int j = 0; j < length; j++)
            c[i+width][j] = b[i][j];
    return c;
}

int** spinCounterClockMatrix(int** a, int length,  int width){
    int** b = newMatrix(width, length);
    for (int i = length - 1; i >= 0; i--)
        for (int j = 0; j < width; j++)
            b[length - 1 - i][j] = a[j][i];
    return b;
}

int main(){
    int** c, ** d, ** e;
    int* a, *b;
    int rows, cols;
    generateMatrix1(c, cols, rows);
    generateMatrix1(d, cols, rows);
    print2dArray(c, cols, rows);
    cout << '\n';
    print2dArray(d, cols, rows);
    cout << '\n';
    e = concatenate2MatricesHV2(c, d, cols, rows);
    print2dArray(e, cols*2, rows);


}