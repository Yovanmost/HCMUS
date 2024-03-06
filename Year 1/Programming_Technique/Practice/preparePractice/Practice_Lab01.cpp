#include <iostream>
#include <math.h>
#include <vector>

using namespace std;

void checkTriangle(int a, int b, int c){
    if (a + b < c || a + c < b || b + c < a){
        cout << "Not a triangle.";
        return;
    }
    else{
        if (a == b && a == c && b == c){
            cout << "Equilateral triangle";
        }
        else if (a == b || a == c || b == c){
            if (a*a + b*c == c*c || a*a + c*c == b*b || b*b + c*c == a*a){
                cout << "Isosceles right triangle";
            }
            else cout << "Isosceles triangle";
        }
        else if (a*a + b*c == c*c || a*a + c*c == b*b || b*b + c*c == a*a){
            cout << "Right triangle";
        }
        else cout << "Normal triangle";
    }
}

int isPrime(int n){
    if (n < 2)
        return 0;
    
    for (int i = 2; i*i < n*n; i++){
        if (n*n % i*i == 0)
            return 0;
    }
    return 1;
}

int countPrime(int a[], int n){
    int count = 0;
    for (int i = 0; i < n; i++){
        if (isPrime(a[i]))
            count++;
    }
    return count;
}

bool isIncreasing(float a[], int n){
    int flag = 0;
    if (n == 1 || n == 0)
        return false;
    if (a[0] < a[1])
        flag = 1;
    
    for (int i = 2; i < n-1; i++)
    {
        if (a[i] > a[i+1])
            flag = 0;
    }

    if (flag)
        return true;
    return false;
}

void vectorInput(vector<float> &a){
    float x;
    while (cin >> x){
        a.push_back(x);
    }
}

void vectorOutput(const vector<float> &a){
    for (int i = 0; i <a.size(); i++)
        cout << a[i] << " ";
    cout << "\n";
}

void inArray2D(int a[][100], int &mRows, int &nCols){
    cout << "Rows: ";
    cin >> mRows;
    cout << "Columns: ";
    cin >> nCols;
    for (int i = 0; i < mRows; i++){
        for (int j = 0; j < nCols; j++)
            cin >> a[i][j];
    }
}

void outArray2D(int a[][100], int mRows, int nCols){
    for (int i = 0; i < mRows; i++){
        for (int j = 0; j < nCols; j++){
            cout << a[i][j] << " ";
        }
        cout << "\n";
    }
}

void rotateArray2D(int a[][100], int mRows, int nCols){
    outArray2D(a, mRows, nCols);
    int b[100][100];
    cout << "\n";
    for (int j = 0, m = 0; j < nCols; j++, m++){
        for (int i = mRows - 1; i >= 0; i--){
            cout << a[i][j] << " ";
            b[i][j] = a[i][j];
        }
            
        cout << "\n";
    }
    outArray2D(b, nCols, mRows);
}

bool isUpperTriangleMatrix(int a[][100], int m, int n){
    for (int i = 0; i < m; i++){
        for (int j = 0; j < n; j++){
            if (j < i && j < n){
                if (a[i][j] != 0){
                    return false;
                } 
            }                    
            else if (j >= i){
                if (a[i][j] == 0)
                    return false;
            }
        }
        cout << "\n";
    }
    return true;
}

bool isLowerTriangleMatrix(int a[][100], int m, int n){
    for (int i = 0; i < m; i++)
        for (int j = n - 1; j >= 0; j--){
            if (j > i){
                if (a[i][j] != 0)
                    return false;
            }
            else {
                if (a[i][j] == 0)
                    return false;
            }
        }
    return true;
}

bool isDiagonalMatrix(int a[][100], int m, int n){
    for (int i = 0; i < m; i++)
        for (int j = 0; j < n; j++){
            if (j == i){
                if (a[i][j] == 0)
                    return false;
            }
            else {
                if (a[i][j] != 0)
                    return false;
            }
        }
    return true;
}

// void sumOf2DArray(int a[][], int b[][], int res[][], int m, int n, int p){
//     for (int i = 0; i < m; i++)
//         for (int j = 0; j < n; j++){
//             res[i][j] = a[i][j] + b[i][j];
//         }
    
//     outArray2D(res, m, n);
// }

int main(){
    int mRows, nCols;
    int a[100][100];
    inArray2D(a, mRows, nCols);
    rotateArray2D(a, mRows, nCols);

    // if (isDiagonalMatrix(a, mRows, nCols))
    //     cout << "Yeh";
    // else cout << "Not";


    return 0;
}