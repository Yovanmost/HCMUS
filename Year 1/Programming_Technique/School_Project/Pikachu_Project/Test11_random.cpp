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
typedef struct Points{
	int x;
	int y;
	int state = NOR; // 0 = normal, 1 = selected, 2 = deleted	
	char value;
}Points;

using namespace std;

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

	for (int i = 1; i < n-1; i++)
		for (int j = 1; j < n-1; j++)
			matrixBoard[i][j].state = NOR;	
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
    for (int y = minP+1; y < maxP; y++)
        if (matrix[x][y].state == NOR) // if see obstacle -> stop
            return false;
    
    return true;
}
 
bool checkLineY(Points** matrix , int x1, int x2, int y) {
    int minP = min(x1, x2);
    int maxP = max(x1, x2);
    for (int x = minP+1; x < maxP; x++)
        if (matrix[x][y].state == NOR)
            return false;
    
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
                && checkLineX(matrix, y, pMaxY.y, pMaxY.x)) 
            return y;
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
                && checkLineY(matrix, x, pMaxX.x, pMaxX.y)) 
            return x;
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
            && checkLineX(matrix, pMinY.y, pMaxY.y, row)) 
        while (matrix[pMinY.x][y].state != NOR
                && matrix[pMaxY.x][y].state != NOR) {
            if (checkLineY(matrix, pMinY.x, pMaxY.x, y))
                return y;
            y += type;
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
            && checkLineY(matrix, pMinX.x, pMaxX.x, col))
        while (matrix[x][pMinX.y].state != NOR
                && matrix[x][pMaxX.x].state != NOR) {
            if (checkLineX(matrix, pMinX.y, pMaxX.y, x))
                return x;
            x += type;
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

/*	*	*	*	*	*	*	*
*			RANDOM			*
*	CHECKING IF SOLVABLE	*
*	*	*	*	*	*	*	*/

// allocate new matrix
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

bool checkPlayable(Points** matrix, int size){
	Points** a = copyMatrix(matrix, size);
	bool solved = false;

	// Stretch the matrix into an array 
    for (int i = 0; i < size*size-1; i++){ 
        if (checkEndGame(a, size)){
                solved = true;
                break;
            }           
        for (int j = i+1; j < size*size; j++){
            if (checkEndGame(a, size))
                break;

            int tmpState1 = a[i/size][i%size].state;
			int tmpState2 = a[j/size][j%size].state;

            changeState(a[i/size][i%size], a[j/size][j%size]);
                        
            if (pathFinding(a, a[i/size][i%size], a[j/size][j%size]) != -1){
                // cout << '\n';
                removeState(a[i/size][i%size], a[j/size][j%size]);
                // printBoard(a, size);
                // cout << "|Found|\n";
                i = 0;
            } else {
                a[i/size][i%size].state = tmpState1;
                a[j/size][j%size].state = tmpState2;
            }            
        }
    }
	deleteBoard(a, size);

	if (solved == true)
		return true;
	return false;
}

/*	*	*	*	*
*	SHUFFLE		*
*	*	*	*	*/

void shuffleMatrix(Points** matrix, int size){
    // Create a array of pair interger pairs
    // The array will only contain 25 distinct character pairs
    int sizeOfPair = (size-2) * (size-2);
    char arrPair[sizeOfPair];
    int count = 0;
    for (int i = 0; i < sizeOfPair; i++){
        arrPair[i] = count / 2 + 'A';
        count++;
        if (count == 50)
            count = 0;
    }
    // cout << "a";
// Shuffle the array of pairs
// Bug: if i (1, size-1) takes longer than i (0, size) (???)
    srand(time(0));
    int times = 0;
Shuffle:
    cout << '|' << times << '|';
    for (int i = 1; i < size-1; i++){
        for (int j = 1; j < size-1; j++){
            int posInPairArray = rand() % (sizeOfPair);
            matrix[i][j].value = arrPair[posInPairArray];

            // Swap the value in posInPairArray to the end of array and decrease the size of array
            swap(arrPair[posInPairArray], arrPair[sizeOfPair - 1]);
            sizeOfPair--;
        }
    }

    if (checkPlayable(matrix, size) == false)
    {
        sizeOfPair = (size-2) * (size-2);
        times++;
        goto Shuffle;
    }
}


/*  *   *   *
*   MAIN    *
*   *   *   */   

int main(){
	system("cls");
    int n = EASY;
	
    Points** a = newMatrix(n);
	shuffleMatrix(a, n);
	printBoard(a, n);
    cout << a[3][4].state;

	return 0;
}
