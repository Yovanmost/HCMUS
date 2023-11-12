#include "Board.h"

// main 
Points** Board::newMatrix(int n){ // n = 4x4 8x8 or 16x16; 
	Points** matrixBoard = new Points* [n+2]; // space for the outline
	
	// try to create rectangle boards, instead of square ones
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
	// have not find the way to randomize value so make a board by hand for now
	matrixBoard[1][1].value = '1';	matrixBoard[1][2].value = '2';	matrixBoard[1][3].value = '3';	matrixBoard[1][4].value = '4';
	matrixBoard[2][1].value = '3';	matrixBoard[2][2].value = '1';	matrixBoard[2][3].value = '4';	matrixBoard[2][4].value = '2';
	matrixBoard[3][1].value = '2';	matrixBoard[3][2].value = '3';	matrixBoard[3][3].value = '1';	matrixBoard[3][4].value = '4';
	matrixBoard[4][1].value = '2';	matrixBoard[4][2].value = '3';	matrixBoard[4][3].value = '4';	matrixBoard[4][4].value = '1';

	return matrixBoard;
}

void Board::deletedBoard(Points** a, int n){
	for (int i = 0; i <= n+1; i++)
		delete []a[i];
	delete []a;
}

void Board::printBoard(Points** a, int n){
	for (int i = 0; i <= n+1; i++){
		for (int j = 0; j <= n+1; j++)
			cout << a[i][j].value << " ";			
		cout << "\n";
	}
}

void Board::printBoard(Points** a, int n){
	for (int i = 0; i <= n+1; i++){
		for (int j = 0; j <= n+1; j++)
			cout << a[i][j].x << " " << a[i][j].y << " ";			
		cout << "\n";
	}
}