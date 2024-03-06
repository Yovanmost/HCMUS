#include <iostream>
#include <cstring>
#include <fstream>
#define NOR 0
#define SEL 1
#define DEL 2

using namespace std;

struct Points{
	int x;
	int y;
	int state = NOR; // 0 = normal, 1 = selected, 2 = deleted	
	int value;
};

// 
Points** newMatric(int n){ // n = 4x4 8x8 or 16x16; 
	Points** matricBoard = new Points* [n+1];
	
	for (int i = 0; i <= n+1; i++){
		matricBoard[i] = new Points[n+1];
	}
	// coordinate
	for (int i = 0; i <= n+1; i++)
		for (int j = 0; j <= n+1; j++){
			matricBoard[i][j].x = i;			
			matricBoard[i][j].y = j;
		}
	
	// outline value
	for (int i = 0; i <= n+1; i++)
		for (int j = 0; j <= n+1; j++){
			// outline
			if (i == 0 || i == n+1 || j == n+1)
				matricBoard[i][j].value = 0;			
		}
	
	matricBoard[1][1].value = 1;	matricBoard[1][2].value = 2;	matricBoard[1][3].value = 3;	matricBoard[1][4].value = 4;
	matricBoard[2][1].value = 3;	matricBoard[2][2].value = 1;	matricBoard[2][3].value = 4;	matricBoard[2][4].value = 2;
	matricBoard[3][1].value = 2;	matricBoard[3][2].value = 3;	matricBoard[3][3].value = 1;	matricBoard[3][4].value = 4;
	matricBoard[1][1].value = 2;	matricBoard[4][2].value = 3;	matricBoard[4][3].value = 4;	matricBoard[4][4].value = 1;
	
	return matricBoard;
}
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

void printBoardCoodinate(Points** a, int n){
	for (int i = 0; i <= n+1; i++){
		for (int j = 0; j <= n+1; j++)
			cout << a[i][j].x << " " << a[i][j].y << " ";			
		cout << "\n";
	}
}

// remove space
// void changeState(Points** a, Points m, Points n){
// 	if (s == true){
// 		a[x1][y1].state = DEL;
// 		a[x2][y2].state = DEL;
// 	}
// }

// check I line, fixed X and moving Y column
bool checkLineX(Points** a, int x, int y1, int y2){
	int maxY = max(y1, y2);
	int minY = min(y1, y2);
	for (int i = minY; i <= maxY; i++)
		if (a[x][i].state == 0)
			return false;
	return true;	
}
// fixed Y, moving X row
bool checkLineY(Points** a, int y, int x1, int x2){
	int maxX = max(x1, x2);
	int minX = min(x1, x2);
	for (int i = minX; i <= maxX; i++)
		if (a[i][y].state == 0)
			return false;
	return true;	
}

// check Z line
bool checkBoxX(Points** a, Points m, Points n){
	Points minY = m, maxY = n;
	// find which one is higher 
	// 0 1 2 3 0
	// 0 3 2 1 0
	if (m.y > n.y){
		minY = n;
		maxY = m;
	}
	// scan from column left to right exclude first and last column to make a Z line
	for (int i = minY.y + 1; i < maxY.y; i++)
		if (checkLineX(a, minY.x, minY.y, i) && 
			checkLineY(a, i, minY.x, maxY.x) && 
			checkLineX(a, maxY.x, i, maxY.y))
			return true;
	return false;	
}

bool checkBoxY(Points** a, Points m, Points n){
	Points minX = m, maxX = n;
	if (m.x > n.x){
		minX = n;
		maxX = m;
	}
	
	for (int i = minX.x + 1; i < maxX.x; i++)
		if (checkLineY(a, minX.y, minX.x, i) && 
			checkLineX(a, i, minX.y, maxX.y) && 
			checkLineY(a, maxX.y, i, maxX.x))
			return true;
	return false;	
}

int checkMoreX(Points** a, Points m, Points n, int type){
	Points minY = m, maxY = n;
	if (m.y > n.y){
		minY = n;
		maxY = m;
	}

	int y = maxY.y;
	int row = minY.x;
	if (type == -1){
		y = minY.y;

	}
}

int main(){
	int n = 4;
	
//	cin >> n;
	Points p;
	
	Points** a = newMatric(n);
	printBoard(a, n);
	printBoardCoodinate(a, n);
	
	deletedBoard(a, n);



	return 0;
}

