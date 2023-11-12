#include <iostream>
#include <cstdlib> // for rand() and srand()
#include <ctime> // for time()

using namespace std;
// y-------------> length
// x  0 1 2 3 4
// |  5 6 7 8 9
// v  
// width
int** newMatrix(int width, int length){
    int** a = new int*[width];
    for (int i = 0; i < width; i++)
        a[i] = new int [length];
    return a;
}

void printMatrix(int** a, int width ,int length){
    for (int i = 0; i < width; i++){
        for (int j = 0; j < length; j++)
            cout << a[i][j] << ' ';
        cout << '\n';
    }
}

void printMatrixV2(int** a, int width ,int length){
    for (int i = 0; i < length; i++){
        for (int j = 0; j < width; j++)
            cout << a[i][j] << ' ';
        cout << '\n';
    }
}

void fillMatrix(int** a, int width ,int length){
    for (int i = 0; i < width; i++)
        for (int j = 0; j < length; j++)
            a[i][j] = i*j;
}


void inputMatrix(int** a, int width, int length){
    for (int i = 0; i < width; i++)
        for (int j = 0; j < length; j++)
            cin >> a[i][j];
}

int main(){
    int** a;
    int width, length;
    cin >>  width >> length;
    a = newMatrix(width, length);
    inputMatrix(a, width, length);
    printMatrix(a, width, length);
    printMatrixV2(a, width, length);
    return 0;
}