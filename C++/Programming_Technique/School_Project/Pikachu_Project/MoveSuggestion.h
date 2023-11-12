#include "Path_Algorithm.h"
#include "BoardV2.h"

/*
    CHANGE THE STATE
    */
void removeState(Points &p1, Points &p2){
    p1.state = DEL;
    p2.state = DEL;
    p1.value = '.';
    p2.value = '.';
}

void changeState(Points &p1, Points &p2){
    p1.state = SEL;
    p2.state = SEL;
}

void returnState(Points &p1, Points &p2){
    p1.state = NOR;
    p2.state = NOR;
}

Points* matrixToArray(Points** &a, int rows, int cols, int &k){
    Points* b = new Points[(rows+2)*(cols+2)];
    k = 0;
    for (int i = 0; i <= rows+1; i++)
        for (int j = 0; j <= cols+1; j++)
            b[k++] = a[i][j];
    k--;
    return b;
}

// update the matrix from the array
void arrayToMatrix(Points** &a, Points* &b, int rows, int cols){
    int k = 0;
    for (int i = 0; i <= rows+1; i++)
        for (int j = 0; j <= cols+1; j++)
            a[i][j] = b[k++];
}

void printArray(Points* a, int n){
    for (int i = 0; i < n; i++)
        cout << a[i].value << ' ';
}

bool checkEndGame(Points** matrix, int n){
    for (int i = 0; i <= n+1; i++)
		for (int j = 0; j <= n+1; j++)
			if (matrix[i][j].state != DEL)
                return false; 
    return true;
}

Points** newMatrixV2(int n){ // n = 4x4 8x8 or 16x16; 
	Points** matrixBoard = new Points* [n];
	
	for (int i = 0; i < n; i++){
		matrixBoard[i] = new Points[n];
	}
}

void pathSuggest(Points** a, int n){
    Points* b;
    int bTotal; // bTotal = (n+2)*(n+2)
    b = matrixToArray(a, n, n, bTotal);
    // move suggestion
    for (int i = 0; i < (n+2)*(n+2) - 1; i++){
        if (checkEndGame(a, n))
            break;
        for (int j = i+1; j < (n+2)*(n+2); j++){
            int tmpState1 = b[i].state;
            int tmpState2 = b[j].state;
            changeState(b[i], b[j]);
            arrayToMatrix(a, b, n, n);
            if (pathFinding(a, b[i], b[j]) != -1){
                removeState(b[i], b[j]);
                arrayToMatrix(a, b, n, n);
                printBoard(a, n);
                cout << "|Found|\n";
                cout << "(" << b[i].x << ":" << b[i].y << ")(" << b[j].x << ":" << b[j].y << ")";
                return;
            } else {
                b[i].state = tmpState1;
                b[j].state = tmpState2;
            }  
        }
    }
    delete []b;
}
