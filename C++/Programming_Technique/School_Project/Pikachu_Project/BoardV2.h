#include "PointsStruct.h"
// main 

Points** newMatrix(int n){ // n = 4x4 8x8 or 16x16; 
	Points** matrixBoard = new Points* [n+2];
	
	for (int i = 0; i <= n+1; i++){
		matrixBoard[i] = new Points[n+2];
	}
	// coordinate
	for (int i = 0; i <= n+1; i++)
		for (int j = 0; j <= n+1; j++){
			matrixBoard[i][j].x = i;			
			matrixBoard[i][j].y = j;
		}
	
	
	// outline value
	for (int i = 0; i <= n+1; i++)
		for (int j = 0; j <= n+1; j++){
			// outline
			if (i == 0 || i == n+1 || j == n+1 || j == 0){
                matrixBoard[i][j].value = '0';
                matrixBoard[i][j].state = DEL;
            }
				
		}
	
	matrixBoard[1][1].value = '1';	matrixBoard[1][2].value = '2';	matrixBoard[1][3].value = '3';	matrixBoard[1][4].value = '4';
	matrixBoard[2][1].value = '3';	matrixBoard[2][2].value = '1';	matrixBoard[2][3].value = '4';	matrixBoard[2][4].value = '2';
	matrixBoard[3][1].value = '2';	matrixBoard[3][2].value = '3';	matrixBoard[3][3].value = '1';	matrixBoard[3][4].value = '4';
	matrixBoard[4][1].value = '2';	matrixBoard[4][2].value = '3';	matrixBoard[4][3].value = '4';	matrixBoard[4][4].value = '1';
	
	return matrixBoard;
}

// testing
// Points** newMatrix(int n){ // n = 4x4 8x8 or 16x16; 
// 	Points** matrixBoard = new Points* [n+1];
	
// 	for (int i = 0; i <= n+1; i++){
// 		matrixBoard[i] = new Points[n+1];
// 	}
// 	// coordinate
// 	for (int i = 0; i <= n+1; i++)
// 		for (int j = 0; j <= n+1; j++){
// 			matrixBoard[i][j].x = i;			
// 			matrixBoard[i][j].y = j;
// 		}
	
// 	// outline value
// 	for (int i = 0; i <= n+1; i++)
// 		for (int j = 0; j <= n+1; j++){
// 			// outline
// 			if (i == 0 || i == n+1 || j == n+1 || j == 0){
//                 matrixBoard[i][j].value = 0;
//                 matrixBoard[i][j].state = DEL;
//             }
				
// 		}
	
// 	matrixBoard[1][1].value = 1;	matrixBoard[1][2].value = 2;	matrixBoard[1][3].value = 3;	matrixBoard[1][4].value = 4;
// 	matrixBoard[2][1].value = 3;	matrixBoard[2][2].value = 1;	matrixBoard[2][3].value = 4;	matrixBoard[2][4].value = 3;
// 	matrixBoard[3][1].value = 3;	matrixBoard[3][2].value = 3;	matrixBoard[3][3].value = 1;	matrixBoard[3][4].value = 4;
// 	matrixBoard[4][1].value = 1;	matrixBoard[4][2].value = 3;	matrixBoard[4][3].value = 4;	matrixBoard[4][4].value = 1;
	
//     matrixBoard[1][1].state = NOR;	matrixBoard[1][2].state = NOR;	matrixBoard[1][3].state = NOR;	matrixBoard[1][4].state = NOR;
// 	matrixBoard[2][1].state = NOR;	matrixBoard[2][2].state = NOR;	matrixBoard[2][3].state = NOR;	matrixBoard[2][4].state = NOR;
//     matrixBoard[3][1].state = NOR;	matrixBoard[3][2].state = NOR;	matrixBoard[3][3].state = NOR;	matrixBoard[3][4].state = NOR;
//     matrixBoard[4][1].state = NOR;	matrixBoard[4][2].state = NOR;	matrixBoard[4][3].state = NOR;	matrixBoard[4][4].state = NOR;

//     // for (int i = 1; i <= n; i++)
//     //     for (int j = 1; j <= n; j++)
//     //         matrixBoard[i][j].state = DEL;

// 	return matrixBoard;
// }

void deletedBoard(Points** a, int n){
	for (int i = 0; i <= n+1; i++)
		delete []a[i];
	delete []a;
}

void printBoard(Points** a, int n){
	for (int i = 0; i <= n+1; i++){
		for (int j = 0; j <= n+1; j++)
			cout << a[i][j].value << " ";			
		cout << "\n";
	}
}

void printBoardCoordinate(Points** a, int n){
	for (int i = 0; i <= n+1; i++){
		for (int j = 0; j <= n+1; j++)
			cout << a[i][j].x << " " << a[i][j].y << " ";			
		cout << "\n";
	}
}

void setUpBoard(){
    int n = 4;
    Points** a = newMatrix(n);
    printBoard(a, n);
    printBoardCoordinate(a, n);
    // deletedBoard(a, n);
}