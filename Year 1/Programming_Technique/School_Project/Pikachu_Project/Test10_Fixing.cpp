#include <iostream>
#include <cstring>
#include <fstream>
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <windows.h>
#include <stdint.h>
#include <conio.h>
// State
#define NOR 0
#define SEL 1
#define DEL 2
#define CORRECT 3 // for drawing ONLY (make the square green)
#define INCORRECT 4 // for drawing ONLY (make the square red)
// Direction
#define LEFT -1
#define RIGHT 1
#define DOWN -1
#define UP 1
// MODE
#define EASY 6 // 4 inside 2 outline
// COLOR
#define BLACK 0
#define AQUA 3
#define RED 4
#define WHITE 7
#define GRAY 8
#define GREEN 10
#define YELLOW 14

// pointer
typedef struct Entity{
    char c;
    int16_t y,x;
}Entity;

typedef struct Points{
	int x;
	int y;
	int state = NOR; // 0 = normal, 1 = selected, 2 = deleted	
	char value;
}Points;

// for the highlighter (pointer) and window size
static int WIDTH;
static int HEIGHT;
static Entity player = {' ', 0, 0 };
static Points highlighter ;
static bool gameOver = false;
static int score = 0;
static char* map;
static int countSelector = 0;
static Points *first = nullptr;
static Points *second = nullptr;
using namespace std;

/*  *   *   *   *
*   CONSOLE     *
*   FUNCTION    *
*   *   *   *   */

void SetWindowSize(int16_t width, int16_t height){
	COORD      coord = { width, height };
    SMALL_RECT rmin  = { 0, 0, 1, 1 };
    SMALL_RECT rect  = { 0, 0, width-1, height-1 };

    HANDLE Handle = GetStdHandle(STD_OUTPUT_HANDLE);
    // SetConsoleWindowInfo(Handle, TRUE, &rmin);
    SetConsoleScreenBufferSize(Handle, coord);
    SetConsoleWindowInfo(Handle, TRUE, &rect);
}

void SetPosition(int16_t X, int16_t Y){
    HANDLE Screen;
    Screen = GetStdHandle(STD_OUTPUT_HANDLE);
    COORD Position = { Y, X };
    SetConsoleCursorPosition(Screen, Position);
}

void ShowsCursor(bool visible){
   HANDLE consoleHandle = GetStdHandle(STD_OUTPUT_HANDLE);
   CONSOLE_CURSOR_INFO info;
   info.dwSize = 100;
   info.bVisible = visible;
   SetConsoleCursorInfo(consoleHandle, &info);
}

void SetColor(int backgound_color, int text_color)
{
    HANDLE hStdout = GetStdHandle(STD_OUTPUT_HANDLE);
    int color_code = backgound_color * 16 + text_color;
    SetConsoleTextAttribute(hStdout, color_code);
}

/*  *   *   *   *   *
*   ALGORITHM       *   
*   PATH FINDING    *
*   *   *   *   *   */

Points** newMatrix(int n){ // n = 4x4  8x8 or 16x16; 
	Points** matrixBoard = new Points* [n];
	
	for (int i = 0; i < n; i++){
		matrixBoard[i] = new Points[n];
	}
	// coordinate
	for (int i = 0; i < n; i++)
		for (int j = 0; j < n; j++){
			matrixBoard[i][j].x = i;			
			matrixBoard[i][j].y = j;
		}
	
	
	// outline value
	for (int i = 0; i < n; i++)
		for (int j = 0; j < n; j++){
			// outline
			if (i == 0 || i == n-1 || j == n-1 || j == 0){
                matrixBoard[i][j].value = '0';
                matrixBoard[i][j].state = DEL;
            }
				
		}
	
	matrixBoard[1][1].value = '1';	matrixBoard[1][2].value = '2';	matrixBoard[1][3].value = '3';	matrixBoard[1][4].value = '4';
	matrixBoard[2][1].value = '3';	matrixBoard[2][2].value = '1';	matrixBoard[2][3].value = '4';	matrixBoard[2][4].value = '2';
	matrixBoard[3][1].value = '2';	matrixBoard[3][2].value = '3';	matrixBoard[3][3].value = '1';	matrixBoard[3][4].value = '4';
	matrixBoard[4][1].value = '2';	matrixBoard[4][2].value = '3';	matrixBoard[4][3].value = '4';	matrixBoard[4][4].value = '1';
	
    // matrixBoard[1][1].value = '1';	matrixBoard[1][2].value = '2';	matrixBoard[1][3].value = '3';	matrixBoard[1][4].value = '4';
	// matrixBoard[2][1].value = '.';	matrixBoard[2][2].value = '.';	matrixBoard[2][3].value = '.';	matrixBoard[2][4].value = '2';
	// matrixBoard[3][1].value = '2';	matrixBoard[3][2].value = '3';	matrixBoard[3][3].value = '1';	matrixBoard[3][4].value = '4';
	// matrixBoard[4][1].value = '2';	matrixBoard[4][2].value = '3';	matrixBoard[4][3].value = '.';	matrixBoard[4][4].value = '1';
	

    matrixBoard[1][1].state = NOR;	matrixBoard[1][2].state = NOR;	matrixBoard[1][3].state = NOR;	matrixBoard[1][4].state = NOR;
	matrixBoard[2][1].state = NOR;	matrixBoard[2][2].state = NOR;	matrixBoard[2][3].state = NOR;	matrixBoard[2][4].state = NOR;
    matrixBoard[3][1].state = NOR;	matrixBoard[3][2].state = NOR;	matrixBoard[3][3].state = NOR;	matrixBoard[3][4].state = NOR;
    matrixBoard[4][1].state = NOR;	matrixBoard[4][2].state = NOR;	matrixBoard[4][3].state = NOR;	matrixBoard[4][4].state = NOR;

	
	return matrixBoard;
}

/* Try to extract and test these functions iin a separate cpp file*/
// Delete Board
void deleteBoard(Points** a, int n){
	for (int i = 0; i < n; i++)
		delete []a[i];
	delete []a;
}

// ONLY for testing
// Show Board
void printBoard(Points** a, int n){
	for (int i = 0; i < n; i++){
		for (int j = 0; j < n; j++)
			cout << a[i][j].value << " ";			
		cout << "\n";
	}
}

/* print board coordinate of the whole board
next time try to use print only 1 point of the board */
void printBoardCoordinate(Points** a, int n){
	for (int i = 0; i < n; i++){
		for (int j = 0; j < n; j++)
			cout << a[i][j].x << " " << a[i][j].y << " ";			
		cout << "\n";
	}
}

/*  *   *   *   *   *
*   PATH CHECKING   *
*   *   *   *   *   */

bool checkValue(Points** matrix, Points p1, Points p2){
    if (p1.value != p2.value)
        return false;
    if (p1.value == '.' || p2.value == '.' || p1.value == '0' || p2.value == '0')
        return false;
    if (p1.x == p2.x && p1.y == p2.y)
        return false;
    return true;
}

// check with line x, from column y1 to y2
bool checkLineX(Points** matrix, int y1, int y2, int x) {
    // find point have column max and min
    int minP = min(y1, y2);
    int maxP = max(y1, y2);
    
    // run column
    for (int y = minP+1; y < maxP; y++) {
        if (matrix[x][y].state == NOR) { // if see obstacle -> stop
            cout << "dieLX: " << x << " " << y << " ";
            return false;
        }
        cout << "ok: " << x << " " << y << " ";
    }
    
    return true;
}
 
bool checkLineY(Points** matrix , int x1, int x2, int y) {
    int minP = min(x1, x2);
    int maxP = max(x1, x2);
    for (int x = minP+1; x < maxP; x++) {
        if (matrix[x][y].state == NOR) {
            cout << "dieLY: " <<  x << " " << y << " ";
            return false;
        }
        cout << "ok: " << x << " " << y << ' ';
    }
    return true;
}

// check in rectangle
int checkRectX(Points** matrix, Points p1, Points p2) {
    // find point have y min and max
    // for checking from left to right (column (x, 0) -> (x, n))
    Points pMinY = p1, pMaxY = p2;
    if (p1.y > p2.y) {
        pMinY = p2;
        pMaxY = p1;
    }

    // moving from left to right
    for (int y = pMinY.y; y <= pMaxY.y; y++) {
        // moving left and find no blank space along the way -> no possible column -> end
        if (y > pMinY.y && matrix[pMinY.x][y].state == NOR)
				return -1;
        // check three-line (find the possible combination of 3 lines that can go)
        if ((matrix[pMaxY.x][y].state != NOR || y == pMaxY.y)
                && checkLineY(matrix, pMinY.x, pMaxY.x, y)
                && checkLineX(matrix, y, pMaxY.y, pMaxY.x)) {
 
            cout << "Rect x";
            cout << "(" << pMinY.x << "," << pMinY.y << ") -> ("
                    << pMinY.x << "," << y << ") -> (" << pMaxY.x << "," << y
                    << ") -> (" << pMaxY.x << "," << pMaxY.y << ")";
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
    for (int x = pMinX.x; x <= pMaxX.x; x++) {
        if (x > pMinX.x && matrix[x][pMinX.y].state == NOR)
				return -1;
        if ((matrix[x][pMaxX.y].state != NOR || x == pMaxX.x)
                && checkLineX(matrix, pMinX.y, pMaxX.y, x)
                && checkLineY(matrix, x, pMaxX.x, pMaxX.y)) {
             
            cout << "Rect y";
            cout << "(" << pMinX.x << "," << pMinX.y << ") -> (" << x
                    << "," << pMinX.y << ") -> (" << x << "," << pMaxX.y
                    << ") -> (" << pMaxX.x << "," << pMaxX.y << ")";
            return x;
        }
    }
    return -1;
}

// check along the columns
int checkMoreLineX(Points** matrix, Points p1, Points p2, int type) {
    // find point have y min
    Points pMinY = p1, pMaxY = p2;
    if (p1.y > p2.y) {
        pMinY = p2;
        pMaxY = p1;
    }
    // find line and y begin
    int y = pMaxY.y + type;
    int row = pMinY.x;
    int colFinish = pMaxY.y;
    if (type == -1) {
        colFinish = pMinY.y;
        y = pMinY.y;
        row = pMaxY.x;
        cout << "colFinish = " << colFinish;
    }
    // find column finish of line

    // check more
    if ((matrix[row][colFinish].state != NOR || pMinY.y == pMaxY.y)
            && checkLineX(matrix, pMinY.y, pMaxY.y, row)) {
        while (matrix[pMinY.x][y].state != NOR
                && matrix[pMaxY.x][y].state != NOR) {
            if (checkLineY(matrix, pMinY.x, pMaxY.x, y)) {
                 
                cout << "TH X " << type;
                cout << "(" << pMinY.x << "," << pMinY.y << ") -> ("
                        << pMinY.x << "," << y << ") -> (" << pMaxY.x << "," << y
                        << ") -> (" << pMaxY.x << "," << pMaxY.y << ")";
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
    int rowFinish = pMaxX.x;
    if (type == -1) {
        x = pMinX.x + type;
        col = pMaxX.y;
        rowFinish = pMinX.x;
    }
    if ((matrix[rowFinish][col].state != NOR || pMinX.x == pMaxX.x)
            && checkLineY(matrix, pMinX.x, pMaxX.x, col)) {
        while (matrix[x][pMinX.y].state != NOR
                && matrix[x][pMaxX.x].state != NOR) {
            if (checkLineX(matrix, pMinX.y, pMaxX.y, x)) {
                cout << "TH Y " << type;
                cout << "(" << pMinX.x << "," << pMinX.y << ") -> ("
                        << x << "," << pMinX.y << ") -> (" << x << "," << pMaxX.y
                        << ") -> (" << pMaxX.x << "," << pMaxX.y << ")";
                return x;
            }
            x += type;
        }
    }
    return -1;
}

/*
    MAKE A pathFinding FUNCTION TO CHECK FROM START TO FINISH
    */
int pathFinding(Points** matrix, Points p1, Points p2){
    // checking 2 values and positions
    if (!checkValue(matrix, p1, p2))
        return -1;
    
    // check straight line (I line)
    if (p1.x == p2.x)
        if (checkLineX(matrix, p1.y, p2.y, p1.x))
            return 1;// return some kind of signal to change the state of 2 selected points
    if (p1.y == p2.y)
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

/*  *   *   *   *   *   *
*   CHANGE THE STATE    *
*   *   *   *   *   *   */

// extract to per point
// Note: for move suggestion
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

void deleteState(Points &p){
    p.state = DEL;
    p.value = '.';
}

void selectState(Points &p){
    p.state = SEL;
}

void normalizeState(Points &p){
    p.state = NOR;
}


// Check the End of game
bool checkEndGame(Points** matrix, int n){
    for (int i = 0; i < n; i++)
		for (int j = 0; j < n; j++)
			if (matrix[i][j].state != DEL)
                return false; 
    return true;
}

/*  *   *   *   *   *
*   MOVE SUGGESTION *
*   *   *   *   *   */
// later not now

Points* matrixToArray(Points** &a, int rows, int cols, int &k){
    Points* b = new Points[rows*cols];
    k = 0;
    for (int i = 0; i < rows; i++)
        for (int j = 0; j < cols; j++)
            b[k++] = a[i][j];
    k--;
    return b;
}

// update the matrix from the array
void arrayToMatrix(Points** &a, Points* &b, int rows, int cols){
    int k = 0;
    for (int i = 0; i < rows; i++)
        for (int j = 0; j < cols; j++)
            a[i][j] = b[k++];
}

void printArray(Points* a, int n){
    for (int i = 0; i < n; i++)
        cout << a[i].value << ' ';
}

// This is too complicated, find another way that does not require checking the whole board every time.
// Note: use for move suggestion
Points** newMatrixV2(int n){ // n = 4x4 8x8 or 16x16; 
	Points** matrixBoard = new Points* [n];
	
	for (int i = 0; i < n; i++){
		matrixBoard[i] = new Points[n];
	}
    return matrixBoard;
}

Points** copyMatrix(Points** source, int size){
	Points** destination = newMatrixV2(size);
	for (int i = 0; i < size; i++)
		for (int j = 0; j < size; j++)
			destination[i][j] = source[i][j];
	return destination;
}


/*  *   *   *
*   MAIN    *
*   *   *   */

int main() {
    system("cls");
    int size = EASY;
    Points** a = newMatrix(size);
    printBoard(a, size);
    // Points* b;
    // int bTotal = 10;
    // b = arrayValue(bTotal);
    // b = matrixToArray(a, n, n, bTotal);
    // cout << "1";
    // printArray(b, bTotal);
    cout << '\n';
    cout << "a";
    Points** b = copyMatrix(a, size);
    cout << "a";
    printBoard(b, size);
    
    // move suggestion
    // for (int i = 0; i < size*size-1; i++){ 
    //     if (checkEndGame(a, size)){
    //             cout << "end";
    //             break;
    //         }           
    //     for (int j = i+1; j < size*size; j++){
    //         if (checkEndGame(a, size))
    //             break;
    //         // int tmpState1 = b[i].state;
    //         // int tmpState2 = b[j].state;

    //         int tmpState1 = a[i/size][i%size].state;
	// 		int tmpState2 = a[j/size][j%size].state;

    //         changeState(a[i/size][i%size], a[j/size][j%size]);
    //         // arrayToMatrix(a, b, n, n);
            
    //         if (pathFinding(a, a[i/size][i%size], a[j/size][j%size]) != -1){
    //             // cout << '\n' << pathFinding(a, b[i], b[j]) << '\n';
    //             cout << '\n';
    //             removeState(a[i/size][i%size], a[j/size][j%size]);
    //             // arrayToMatrix(a, b, n, n);
    //             printBoard(a, size);
    //             cout << "|Found|\n";
    //             i = 0;
    //         } else {
    //             a[i/size][i%size].state = tmpState1;
    //             a[j/size][j%size].state = tmpState2;
    //             // cout << "Not found " << i << " " << j;
    //         }  
    //         // cout << "\n";
            
    //     }
    // }
    
    // delete []b;

    deleteBoard(a, size);
    return 0;
    system("pause");
}
   
