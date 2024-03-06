#include <iostream>
#define ROWS 100
#define COLS 100

using namespace std;

void inMatrix(int a[][COLS], int &m, int &n){
    cin >> m >> n;
    for (int i = 0; i < m; i++)
        for (int j = 0; j < n; j++)
            cin >> a[i][j];
}

void outMatrix(int a[][COLS], int m, int n){
    for (int i = 0; i < m; i++){
        for (int j = 0; j < n; j++)
            cout << a[i][j] << " ";
        cout << '\n';
    }
        
}

void additionMatrix(int a[][COLS], int b[][COLS], int m, int n, int c[][COLS]){
    for (int i = 0; i < m; i++)
        for (int j = 0; j < n; j++)
            c[i][j] = a[i][j] + b[i][j];
}

void multiplyMatrix(int a[][COLS], int b[][COLS], int c[][COLS], int m, int n, int p){
    

    // mxn nxp => mxp
    // 2x4 4x2 => 2x2
    // 1 2 3 4 
    // 5 6 7 8  
    // 1 2
    // 2 3
    // 4 5
    // 6 7


    // mxn nxp => mxp
    // 4x2 2x4 => 4x4
    // 1 2
    // 3 4
    // 5 6
    // 7 8 
    // 1 2 3 4 
    // 5 6 7 8  
    int tmpSum = 0;
    int k = 0;
    // work well with 3x3 matrix alone
    for (int l = 0; l < m; l++)
        for (int i = 0; i < n; i++){
            for (int j = 0; j < p; j++){
                tmpSum += a[l][j] * b[j][i]; // bug at [i] i cannot scan the whole j.length
            }
            cout << tmpSum << "\n";
            c[l][i] = tmpSum;
            tmpSum = 0;
        }

    outMatrix(c, m, p);

}

int multiple1DArr(int A[], int B[], int n){
	int sum = 0;
	for (int i = 0; i < n; i++){
		sum += A[i] * B[i];
	}
	return sum;
}


void multiple2DArr(int A[][COLS], int B[][COLS], int result[][COLS], int m, int n, int p){
	int tmp[ROWS][COLS];
	for (int i = 0; i < p; i++){
		for (int j = 0; j < n; j++){
			tmp[i][j] = B[j][i];
		}
	}
    outMatrix(tmp, p, n);
    // 1 2 3 4
    // 5 6 7 8
	
	for (int i = 0; i < m; i++){
		for (int j = 0; j < p; j++){
			result[i][j] = multiple1DArr(A[i], tmp[j], n);
		}
	}
	outMatrix(result,m,p);
}

void rotateMatrix(int a[][COLS], int m, int n){
    int b[ROWS][COLS];
    int k = 0, t = 0;
    for (int j = 0; j < n; j++, k++){
        for (int i = m - 1; i >= 0; i--, t++)
            b[k][t]= a[i][j];
        t = 0;
    }
        
    outMatrix(b, n, m);

}

int main(){
    int a[ROWS][COLS], b[ROWS][COLS], c[ROWS][COLS];
    int m,n, x, y;
    inMatrix(a, m, n);
    rotateMatrix(a, m, n);

    return 0;
}