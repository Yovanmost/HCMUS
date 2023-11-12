#include <iostream>
#include <cstring>
#include <fstream>
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <windows.h>
#include <stdint.h>
#include <conio.h>
#include <time.h>
#include <cstdlib>

// COLOR
#define BLACK 0
#define AQUA 3
#define RED 4
#define WHITE 7
#define GRAY 8
#define GREEN 10
#define YELLOW 14
// State
#define NOR 0
#define SEL 1
#define DEL 2
#define CORRECT 3 // for drawing ONLY (make the square green)
#define INCORRECT 4 // for drawing ONLY (make the square red)
// Direction
#define LEFT -1
#define RIGHT 1
#define DOWN 1
#define UP -1

using namespace std;

typedef struct Points{
	int x;
	int y;
	int state; // 0 = normal, 1 = selected, 2 = deleted	
	char value;
}Points;

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
    // for (int i = 1; i < n-1; i++)
	// 	for (int j = 1; j < n-1; j++)
	// 		matrixBoard[i][j].state = NOR;

    // matrixBoard[1][1].value = '1';	matrixBoard[1][2].value = '2';	matrixBoard[1][3].value = '3';	matrixBoard[1][4].value = '4';
	// matrixBoard[2][1].value = '3';	matrixBoard[2][2].value = '1';	matrixBoard[2][3].value = '4';	matrixBoard[2][4].value = '2';
	// matrixBoard[3][1].value = '2';	matrixBoard[3][2].value = '3';	matrixBoard[3][3].value = '1';	matrixBoard[3][4].value = '4';
	// matrixBoard[4][1].value = '2';	matrixBoard[4][2].value = '3';	matrixBoard[4][3].value = '4';	matrixBoard[4][4].value = '1';
	
    matrixBoard[1][1].value = '1';	matrixBoard[1][2].value = '2';	matrixBoard[1][3].value = '2';	matrixBoard[1][4].value = '4';
	matrixBoard[2][1].value = '1';	matrixBoard[2][2].value = '.';	matrixBoard[2][3].value = '.';	matrixBoard[2][4].value = '3';
	matrixBoard[3][1].value = '2';	matrixBoard[3][2].value = '2';	matrixBoard[3][3].value = '2';	matrixBoard[3][4].value = '2';
	matrixBoard[4][1].value = '1';	matrixBoard[4][2].value = '3';	matrixBoard[4][3].value = '3';	matrixBoard[4][4].value = '2';
	
    matrixBoard[1][1].state = NOR;	matrixBoard[1][2].state = NOR;	matrixBoard[1][3].state = NOR;	matrixBoard[1][4].state = DEL;
	matrixBoard[2][1].state = NOR;	matrixBoard[2][2].state = DEL;	matrixBoard[2][3].state = DEL;	matrixBoard[2][4].state = NOR;
    matrixBoard[3][1].state = NOR;	matrixBoard[3][2].state = NOR;	matrixBoard[3][3].state = NOR;	matrixBoard[3][4].state = NOR;
    matrixBoard[4][1].state = NOR;	matrixBoard[4][2].state = NOR;	matrixBoard[4][3].state = NOR;	matrixBoard[4][4].state = NOR;

	
	return matrixBoard;
}

//------------------------------------------------------------------------
                        /*  *   *   *   *   *
                        *   PATH CHECKING   *
                        *   *   *   *   *   */
//------------------------------------------------------------------------

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
            // cout << "dieLX: " << x << " " << y << " ";
            return false;
        }
        // cout << "ok: " << x << " " << y << " ";
    }
    
    return true;
}
 
bool checkLineY(Points** matrix , int x1, int x2, int y) {
    int minP = min(x1, x2);
    int maxP = max(x1, x2);
    for (int x = minP+1; x < maxP; x++) {
        if (matrix[x][y].state == NOR) {
            // cout << "dieLY: " <<  x << " " << y << " ";
            return false;
            
        }
        // cout << "ok: " << x << " " << y << ' ';
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
    for (int x = pMinX.x; x <= pMaxX.x; x++) {
        if (x > pMinX.x && matrix[x][pMinX.y].state == NOR)
				return -1;
        if ((matrix[x][pMaxX.y].state != NOR || x == pMaxX.x)
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
        // cout << "colFinish = " << colFinish;
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
    int x = pMaxX.x + type;
    int col = pMinX.y;
    int rowFinish = pMaxX.x;
    if (type == -1) {
        rowFinish = pMinX.x;
        x = pMinX.x + type;
        col = pMaxX.y;
    }
    if ((matrix[rowFinish][col].state != NOR || pMinX.x == pMaxX.x)
            && checkLineY(matrix, pMinX.x, pMaxX.x, col)) {
        while (matrix[x][pMinX.y].state != NOR
                && matrix[x][pMaxX.y].state != NOR) {
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



void drawLineH(Points a, Points b, int state){
    int pX = a.x * 3 + 1;
    int pY;
    if (a.y < b.y)
        pY = a.y * 6 + 3;
    else pY = a.y * 6 +1;

    int n = (max(b.y, a.y) - min(b.y, a.y) - 1)*6 + 5;// y = 6x + 5
    for (int i = 0; i < n ; i++){
        if (a.y < b.y)
            SetPosition(pX, pY+i);
        else SetPosition(pX, pY-i);
        if (state == DEL)
            SetColor(BLACK ,WHITE);
        else SetColor(GREEN, BLACK);
        cout << ' ';
        Sleep(50);
    }       
    SetColor(BLACK ,WHITE);
}

void drawLineV(Points a, Points b, int state){
    int pX;
    if (a.x < b.x)
        pX = a.x * 3 + 2;
    else pX = a.x * 3;

    int pY = a.y * 6 + 2;
    int n = (max(b.x, a.x) - min(b.x, a.x) - 1)*3 + 2;// y = 3x+2
    
    for (int i = 0; i < n; i++){
        if (a.x < b.x)
            SetPosition(pX+i, pY);
        else 
            SetPosition(pX-i, pY);
        if (state == DEL)
            SetColor(BLACK ,WHITE);
        else SetColor(GREEN, BLACK);
        cout << ' ';
        Sleep(50);
        
    }
    SetColor(BLACK ,WHITE);
}

void drawCorner(Points a, int state){
    int pX = (a.x * 3) + 1;
    int pY = (a.y * 6) + 2;  
    SetPosition(pX, pY);
    
    
    if (state == DEL){
        SetColor(BLACK, WHITE);
        cout << ' ';
    }
    else {
        SetColor(GREEN, BLACK);
        cout << ' ';
    }
}

void drawBorder(Points** board, int size){
    SetColor(BLACK, WHITE);
    for (int i = 0; i < size; i++){
        for (int j = 0; j < size; j++){
            if (j == 0){
                int pX = (i * 3);
                int pY = (j * 6);
                SetPosition(pX, pY);

                if (i != 0)
                    cout << "+\n";

                SetPosition(pX+1, pY);
                cout << "*\n";
                SetPosition(pX+2, pY);
                if (i != size - 1)
                    cout << "+\n";
            }
            else if (j == size - 1){
                int pX = (i * 3);
                int pY = (j * 6);
                SetPosition(pX, pY);
                if (i != 0)
                    cout << "    +\n";
                SetPosition(pX+1, pY);
                cout << "    *\n";
                SetPosition(pX+2, pY);
                if (i != size - 1)
                    cout << "    +\n";
            }
        }
    }
    for (int i = 0; i < size; i++)
        for (int j = 0; j < size; j++)
            if (i == 0){
                int pX = (i * 3);
                int pY = (j * 6);
                SetPosition(pX, pY);
                cout << "-+-+-\n";
            }
            else if (i == size - 1){
                int pX = (i * 3);
                int pY = (j * 6);
                SetPosition(pX+2, pY);
                cout << "-+-+-\n";
            }
}


void drawState(int state){
    if (state == NOR)
        SetColor(BLACK, WHITE);
    else if (state == SEL)
        SetColor(GRAY, AQUA);
    else if (state == CORRECT)
        SetColor(BLACK, GREEN);
    else if (state == INCORRECT)
        SetColor(BLACK, RED);
}

void drawDelete(Points** board, int pX, int pY){
    cout << "     \n";
    SetPosition(pX+1, pY);
    cout << "     \n";
    SetPosition(pX+2, pY);
    cout << "     \n"; 
}

void drawBoard(Points** board, int size){
    for (int i = 1; i < size-1; i++){
        for (int j = 1; j < size-1; j++){   
            int pX = (i * 3);
            int pY = (j * 6);
            SetPosition(pX, pY);
            // draw background later
            if (board[i][j].state == DEL){
                SetColor(BLACK, WHITE);
                drawDelete(board, pX, pY);
            }
            else{
                drawState(board[i][j].state);
                cout << "+---+\n";
                SetPosition(pX+1, pY);
                cout << "| " << board[i][j].value << " |\n";
                SetPosition(pX+2, pY);
                cout << "+---+\n";
            }
            
        }
    }
}

bool comparePoints(Points a, Points b){
    if (a.x == b.x && a.y == b.y)
        return true;
    return false;
}

/*
    MAKE A pathFinding FUNCTION TO CHECK FROM START TO FINISH
    */
int pathFindingV2(Points** matrix, Points p1, Points p2){
    Points tmp1 = p1;
    Points tmp2 = p2;
     // checking 2 values and positions
    if (!checkValue(matrix, p1, p2))
        return -1;
    
    // check straight line (I line)
    if (p1.x == p2.x)
        if (checkLineX(matrix, p1.y, p2.y, p1.x)){
            drawLineH(p1, p2, NOR);
            drawLineH(p1, p2, DEL);
            return 1;// return some kind of signal to change the state of 2 selected points
        }
            
    if (p1.y == p2.y)
        if (checkLineY(matrix, p1.x, p2.x, p1.y)){
            drawLineV(p1, p2, NOR);
            drawLineV(p1, p2, DEL);
            return 2;
        }
            

    // pointCheck is the return column/row of checkRect function
    int pointCheck = -1;
    // check within the rectangle zone (Z line)

    if (checkRectX(matrix, p1, p2) != -1){
        // NOTE: check for duplicate value (corner and destination) 
        int tmpY = checkRectX(matrix, p1, p2);
        tmp1.y = tmpY;
        tmp2.y = tmpY;
        drawLineH(p1, tmp1, NOR);
        if (!comparePoints(p1, tmp1))
            drawCorner(tmp1, NOR);
            
        drawLineV(tmp1, tmp2, NOR);
        if (!comparePoints(p2, tmp2))
            drawCorner(tmp2, NOR);
        drawLineH(tmp2, p2, NOR);

        drawLineH(p1, tmp1, DEL);
        drawCorner(tmp1, DEL);
        drawLineV(tmp1, tmp2, DEL);
        drawCorner(tmp2, DEL);
        drawLineH(tmp2, p2, DEL);
        return 3;
    }
        
    if (checkRectY(matrix, p1, p2) != -1){
        int tmpX = checkRectY(matrix, p1, p2);
        tmp1.x = tmpX;
        tmp2.x = tmpX;
        drawLineV(p1, tmp1, NOR);
        if (!comparePoints(p1, tmp1))
            drawCorner(tmp1, NOR);
            
        drawLineH(tmp1, tmp2, NOR);
        if (!comparePoints(p2, tmp2))
            drawCorner(tmp2, NOR);
        drawLineV(tmp2, p2, NOR);

        drawLineV(p1, tmp1, DEL);
        drawCorner(tmp1, DEL);
        drawLineH(tmp1, tmp2, DEL);
        drawCorner(tmp2, DEL);
        drawLineV(tmp2, p2, DEL);
        return 4;
    }
        
    
    
    // check the tricker way (L and U line)
    // check if the left side is available
    if (checkMoreLineX(matrix, p1, p2, RIGHT) != -1){
        int tmpY = checkMoreLineX(matrix, p1, p2, RIGHT);
        tmp1.y = tmpY;
        tmp2.y = tmpY;
        drawLineH(p1, tmp1, NOR);
        drawCorner(tmp1, NOR);
        drawLineV(tmp1, tmp2, NOR);
        drawCorner(tmp2, NOR);
        drawLineH(tmp2, p2, NOR);

        drawLineH(p1, tmp1, DEL);
        drawCorner(tmp1, DEL);
        drawLineV(tmp1, tmp2, DEL);
        drawCorner(tmp2, DEL);
        drawLineH(tmp2, p2, DEL);
        return 5;
    }
        
    if (checkMoreLineX(matrix, p1, p2, LEFT) != -1){
        int tmpY = checkMoreLineX(matrix, p1, p2, RIGHT);
        tmp1.y = tmpY;
        tmp2.y = tmpY;
        drawLineH(p1, tmp1, NOR);
        drawCorner(tmp1, NOR);
        drawLineV(tmp1, tmp2, NOR);
        drawCorner(tmp2, NOR);
        drawLineH(tmp2, p2, NOR);

        drawLineH(p1, tmp1, DEL);
        drawCorner(tmp1, DEL);
        drawLineV(tmp1, tmp2, DEL);
        drawCorner(tmp2, DEL);
        drawLineH(tmp2, p2, DEL);
        return 6;
    }
        
    if (checkMoreLineY(matrix, p1, p2, DOWN) != -1) {
        int tmpX = checkMoreLineY(matrix, p1, p2, DOWN);
        tmp1.x = tmpX;
        tmp2.x = tmpX;
        
        drawLineV(p1, tmp1, NOR);
        drawCorner(tmp1, NOR);
        drawLineH(tmp1, tmp2, NOR);
        drawCorner(tmp2, NOR);
        drawLineV(tmp2, p2, NOR);

        drawLineV(p1, tmp1, DEL);
        drawCorner(tmp1, DEL);
        drawLineH(tmp1, tmp2, DEL);
        drawCorner(tmp2, DEL);
        drawLineV(tmp2, p2, DEL);   
        return 7;
    }
       
    if (checkMoreLineY(matrix, p1, p2, UP) != -1){
        int tmpX = checkMoreLineY(matrix, p1, p2, UP);
        tmp1.x = tmpX;
        tmp2.x = tmpX;
        
        drawLineV(p1, tmp1, NOR);
        drawCorner(tmp1, NOR);
        drawLineH(tmp1, tmp2, NOR);
        drawCorner(tmp1, NOR);
        drawLineV(tmp2, p2, NOR);

        drawLineV(p1, tmp1, DEL);
        drawCorner(tmp1, DEL);
        drawLineH(tmp1, tmp2, DEL);
        drawCorner(tmp2, DEL);
        drawLineV(tmp2, p2, DEL); 
        return 8;
    }
        
    
    
    // if every case fails => no possible connection can be made
    return -1;
}


void drawAll(Points** board, int size){
    drawBoard(board, size);
    drawBorder(board, size);
}

int main(){
    system("cls");
    int n = 6;
    Points** a = newMatrix(n);
    drawAll(a, n);
    // drawLineV(a[1][1], a[2][1]);
    // drawLineH(a[2][1], a[2][2]);
    a[2][1].state = SEL; 
    a[4][1].state = SEL;
    cout << pathFinding(a, a[2][1], a[4][1]);
    // cout << "end";
    // system("pause");
    // drawAll(a, n);

    return 0;
}