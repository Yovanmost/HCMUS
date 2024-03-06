#include <iostream>
#include <cstring>
#include <fstream>
// State
#define NOR 0
#define SEL 1
#define DEL 2
// Direction
#define LEFT -1
#define RIGHT 1
#define DOWN -1
#define UP 1

using namespace std;

struct Points{
	int x;
	int y;
	int state = NOR; // 0 = normal, 1 = selected, 2 = deleted	
	int value;
};

// main 
Points** newMatrix(int n){ // n = 4x4 8x8 or 16x16; 
	Points** matrixBoard = new Points* [n+1];
	
	for (int i = 0; i <= n+1; i++){
		matrixBoard[i] = new Points[n+1];
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
                matrixBoard[i][j].value = 0;
                matrixBoard[i][j].state = DEL;
            }
				
		}
	
	matrixBoard[1][1].value = 1;	matrixBoard[1][2].value = 2;	matrixBoard[1][3].value = 3;	matrixBoard[1][4].value = 4;
	matrixBoard[2][1].value = 3;	matrixBoard[2][2].value = 1;	matrixBoard[2][3].value = 4;	matrixBoard[2][4].value = 2;
	matrixBoard[3][1].value = 2;	matrixBoard[3][2].value = 3;	matrixBoard[3][3].value = 1;	matrixBoard[3][4].value = 4;
	matrixBoard[4][1].value = 2;	matrixBoard[4][2].value = 3;	matrixBoard[4][3].value = 4;	matrixBoard[4][4].value = 1;
	
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

/*
    PATH CHECKING - VALUE LATER
    */

bool checkValue(Points** matrix, Points p1, Points p2){
    if (p1.value != p2.value)
        return false;
    if (p1.value == 0)
        return false;
    return true;
}

// check with line x, from column y1 to y2
bool checkLineX(Points** matrix, int y1, int y2, int x) {
    // find point have column max and min
    int minP = min(y1, y2);
    int maxP = max(y1, y2);
    
    // run column
    for (int y = minP; y <= maxP; y++) {
        if (matrix[x][y].state == NOR) { // if see obstacle -> stop
            // cout << "dieLX: " << x << " " << y;
            return false;
        }
        // cout << "ok: " << x << " " << y;
    }
    
    return true;
}
 
bool checkLineY(Points** matrix , int x1, int x2, int y) {
    int minP = min(x1, x2);
    int maxP = max(x1, x2);
    for (int x = minP; x <= maxP; x++) {
        if (matrix[x][y].state == NOR) {
            // cout << "dieLY: " <<  x << " " << y;
            return false;
        }
        // cout << "ok: " << x << " " << y;
    }
    return true;
}

// check in rectangle
int checkRectX(Points** matrix, Points p1, Points p2) {
    // find point have y min and max
    Points pMinY = p1, pMaxY = p2;
    if (p1.y > p2.y) {
        pMinY = p2;
        pMaxY = p1;
    }
    for (int y = pMinY.y + 1; y < pMaxY.y; y++) {
        // check three line
        if (checkLineX(matrix, pMinY.y, y, pMinY.x)
                && checkLineY(matrix, pMinY.x, pMaxY.x, y)
                && checkLineX(matrix, y, pMaxY.y, pMaxY.x)) {
 
            // cout << "Rect x";
            // cout << "(" << pMinY.x << "," << pMinY.y << ") -> ("
            //         << pMinY.x << "," << y << ") -> (" << pMaxY.x << "," << y
            //         << ") -> (" << pMaxY.x << "," << pMaxY.y << ")";
            // if three line is true return column y
            return y;
        }
    }
    // have a line in three line not true then return -1
    return -1;
}

 
int checkRectY(Points** matrix, Points p1, Points p2) {
    // find point have y min
    Points pMinX = p1, pMaxX = p2;
    if (p1.x > p2.x) {
        pMinX = p2;
        pMaxX = p1;
    }
    // find line and y begin
    for (int x = pMinX.x + 1; x < pMaxX.x; x++) {
        if (checkLineY(matrix, pMinX.x, x, pMinX.y)
                && checkLineX(matrix, pMinX.y, pMaxX.y, x)
                && checkLineY(matrix, x, pMaxX.x, pMaxX.y)) {
             
            // cout << "Rect y";
            // cout << "(" << pMinX.x << "," << pMinX.y << ") -> (" << x
            //         << "," << pMinX.y << ") -> (" << x << "," << pMaxX.y
            //         << ") -> (" << pMaxX.x << "," << pMaxX.y << ")";
            return x;
        }
    }
    return -1;
}

// check along the cloumns
int checkMoreLineX(Points** matrix, Points p1, Points p2, int type) {
    // find point have y min
    Points pMinY = p1, pMaxY = p2;
    if (p1.y > p2.y) {
        pMinY = p2;
        pMaxY = p1;
    }
    // find line and y begin
    int y = pMaxY.y;
    int row = pMinY.x;
    if (type == -1) {
        y = pMinY.y;
        row = pMaxY.x;
    }
    // check more
    if (checkLineX(matrix, pMinY.y, pMaxY.y, row)) {
        while (matrix[pMinY.x][y].state != NOR
                && matrix[pMaxY.x][y].state != NOR) {
            if (checkLineY(matrix, pMinY.x, pMaxY.x, y)) {
                 
                // cout << "TH X " << type;
                // cout << "(" << pMinY.x << "," << pMinY.y << ") -> ("
                //         << pMinY.x << "," << y << ") -> (" << pMaxY.x << "," << y
                //         << ") -> (" << pMaxY.x << "," << pMaxY.y << ")";
                return y;
            }
            y += type;
        }
    }
    return -1;
}


// check along the rows
int checkMoreLineY(Points** matrix, Points p1, Points p2, int type) {
    Points pMinX = p1, pMaxX = p2;
    if (p1.x > p2.x) {
        pMinX = p2;
        pMaxX = p1;
    }
    int x = pMaxX.x;
    int col = pMinX.y;
    if (type == -1) {
        x = pMinX.x;
        col = pMaxX.y;
    }
    if (checkLineY(matrix, pMinX.x, pMaxX.x, col)) {
        while (matrix[x][pMinX.y].state != NOR
                && matrix[x][pMaxX.x].state != NOR) {
            if (checkLineX(matrix, pMinX.y, pMaxX.y, x)) {
                // cout << "TH Y " << type;
                // cout << "(" << pMinX.x << "," << pMinX.y << ") -> ("
                //         << x << "," << pMinX.y << ") -> (" << x << "," << pMaxX.y
                //         << ") -> (" << pMaxX.x << "," << pMaxX.y << ")";
                return x;
            }
            x += type;
        }
    }
    return -1;
}

/*
    MAKE A MYLINE FUNCTION TO CHECK FROM START TO FINISH
    */
int myLine(Points** matrix, Points p1, Points p2){
    // checking 2 values and positions
    if (!checkValue(matrix, p1, p2))
        return -1;
    
    // check straight line (I line)
    if (p1.x == p2.x)
        if (checkLineX(matrix, p1.y, p2.y, p1.x))
            return 1;// return some kind of signal to change the state of 2 selected points
    if (p1.y = p2.y)
        if (checkLineY(matrix, p1.x, p2.x, p1.y))
            return 2;

    // pointCheck is the return column/row of checkRect function
    int pointCheck = -1;
    // check within the rectangle zone (Z line)

    if (checkRectX(matrix, p1, p2) != -1)
        return 3;
    if (checkRectY(matrix, p1, p2) != -1)
        return 4;
    
    
    // check the tricker way (L and U line)
    // check if the left side is available
    if (checkMoreLineX(matrix, p1, p2, RIGHT) != -1)
        return 5;
    if (checkMoreLineX(matrix, p1, p2, LEFT) != -1)
        return 6;
    if (checkMoreLineY(matrix, p1, p2, DOWN) != -1) 
        return 7;
    if (checkMoreLineY(matrix, p1, p2, UP) != -1)
        return 8;
    
    
    // if every case fails => no possible connection can be made
    return -1;
}

/*
    CHANGE THE STATE
    */
void removeState(Points &p1, Points &p2){
    p1.state = DEL;
    p2.state = DEL;
    p1.value = 0;
    p2.value = 0;
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
    Points* b = new Points[(rows+1)*(cols+1)];
    k = 0;
    for (int i = 0; i <= rows+1; i++)
        for (int j = 0; j <= cols+1; j++)
            b[k++] = a[i][j];
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

Points* arrayValue(int n){
    Points* a = new Points[n];
    for (int i = 0; i < n; i++)
        a[i].value = i;
    return a;
}

bool checkEndGame(Points** matrix, int n){
    for (int i = 0; i <= n+1; i++)
		for (int j = 0; j <= n+1; j++)
			if (matrix[i][j].state != DEL)
                return false; 
    return true;
}

int main(){
	int n = 4;
	
	Points** a = newMatrix(n);
	printBoard(a, n);  

    Points* b;
    int bTotal = 10;
    cout << "something2";
    // b = arrayValue(bTotal);
    b = matrixToArray(a, n, n, bTotal);
    cout << "something2";
    // cout << "1";
    // printArray(b, bTotal);
    
    // move suggestion
    for (int i = 0; i < (n+2)*(n+2) - 1; i++){
        if (checkEndGame(a, n))
            break;
        for (int j = i+1; j < (n+2)*(n+2); j++){
            int tmpState1 = b[i].state;
            int tmpState2 = b[j].state;
            changeState(b[i], b[j]);
            arrayToMatrix(a, b, n, n);
            if (myLine(a, b[i], b[j]) != -1){
                // cout << '\n' << myLine(a, b[i], b[j]) << '\n';
                removeState(b[i], b[j]);
                arrayToMatrix(a, b, n, n);
                printBoard(a, n);
                cout << "|Found|";
            } else {
                b[i].state = tmpState1;
                b[j].state = tmpState2;
                cout << "Not found " << i << " " << j;
            }  
            cout << "\n";
        }
    }

	cout << "something2";
   
//    int x;
//    cin >> x;
//    do {
//         Points p1, p2;
//         cin >> p1.x >> p1.y;
//         cin >> p2.x >> p2.y;
//         int tmpX;
//         cin >> tmpX;
//         int tmpY;
//         cin >> tmpY;

//    }while (x != 10);

	deletedBoard(a, n);
    
    cout << "something2";

	return 0;
}
   
