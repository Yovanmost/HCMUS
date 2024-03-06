#pragma once
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
#include <vector>
// State
#define NOR 0
#define SEL 1
#define DEL 2
#define CORRECT 3 // for drawing ONLY (make the square green)
#define INCORRECT 4 // for drawing ONLY (make the square red)
#define HINT 5 // for drawing ONLY (make the square yellow)
// Direction
#define LEFT -1
#define RIGHT 1
#define DOWN 1
#define UP -1
#define L 0
#define R 1
#define U 2
#define D 3
// MODE
#define EASY 6 // 4 inside 2 outline
#define MEDIUM 8
// COLOR
#define BLACK 0
#define AQUA 3
#define RED 4
#define WHITE 7
#define GRAY 8
#define BLUE 9
#define GREEN 10
#define YELLOW 14

#include "Account.h"

void importAccounts(std::map<char*, char*> accs, char* usrname, char* passwrd)
{
    std::fstream fs("Accounts.bin", std::ios::in);
    std::map<char*, char*>::iterator it = accs.begin();
    while(!fs.eof())
    {
        fs.read(usrname, 40);
        fs.read(passwrd, 40);
        accs.insert({usrname, passwrd});
        it++;
    }
    fs.close();
}

void exportAccounts(std::map<char*, char*> accs, char* usrname, char* passwrd)
{
    std::fstream fs("Accounts.bin", std::ios::out);
    std::map<char*, char*>::iterator it = accs.begin();
    while (it != accs.end())
    {
        fs.write(it->first, 40);
        fs.write(it->second, 40);
        it++;
    }
    fs.close();
}



bool CheckSignUp(std::map<char*, char*> accs, char* usrname, char* passwrd)
{
    if (strlen(usrname) < 2 && strlen(usrname) > 40 && strlen(passwrd) < 4 && strlen(passwrd) > 40)
    {
        return false;
    }
    if (accs.empty() == false)
    {
        std::map<char*, char*>::iterator it = accs.begin();
        while (it != accs.end())
        {
            if (usrname == it->first)
                return false;
            it++;
        }
    }
    return true;
}

int CheckLogIn(std::map<char*, char*> accs, char* usrname, char* passwrd)
{
    std::map<char*, char*>::iterator it = accs.begin();
    if (accs.empty() == true)
        return -1; // no accounts found
     
    // find username
    while (it != accs.end())
    {
        if (it->first == usrname)
        {
            if (it->second == passwrd) 
            {
                return 0; // log in successful
            }
            else
            {
                return -2; // wrong password
            }
        }
        it++;
    }

    return -1; // no accounts found
}

static int color[6] = {1, 2, 4, 5, 6, 12};

typedef struct Points{
	int x;
	int y;
	int state; // 0 = normal, 1 = selected, 2 = deleted	
	char value;
    Points* pNext;
}Points;

// for the highlighter (pointer) and window size
static int WIDTH;
static int HEIGHT;
static Points highlighter = {0, 0, DEL, '.'};
static bool gameOver = false;
static int score = 0;
static int countSelector = 0;
static Points *first = nullptr;
static Points *second = nullptr;

using namespace std;

//------------------------------------------------------------------------
                            /*  *   *   *   *
                            *   CONSOLE     *
                            *   FUNCTION    *
                            *   *   *   *   */
//------------------------------------------------------------------------

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

// cls
void clearScreen()
{
    HANDLE hOut;
    COORD Position;

    hOut = GetStdHandle(STD_OUTPUT_HANDLE);

    Position.X = 0;
    Position.Y = 0;
    SetConsoleCursorPosition(hOut, Position);
}

//------------------------------------------------------------------------
                        /*  *   *   *   *   *
                        *   ALGORITHM       *   
                        *   PATH FINDING    *
                        *   *   *   *   *   */
//------------------------------------------------------------------------

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

/* Try to extract and test these functions in a separate cpp file*/
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

//------------------------------------------------------------------------
                            /*  *   *   *
                            *   LINKED  *
                            *   LIST    *
                            *   *   *   */
//------------------------------------------------------------------------

Points* createNode(int state, char value){
    Points* p = new Points;
    p->state = state;
    p->value = value;
    p->pNext = NULL;
}

// the length of the list
int lengthPointNode(Points* pHead){
	Points* p = pHead;
	int count = 0;
	while (p != NULL){
		count++;
		p = p->pNext;
	}
	return count;
}

// addTail
void addNode(Points* &pHead, int state, char value){
    if(pHead == NULL){ //TH DSLK rong
		pHead = createNode(state, value);
		return;
	}
	else{
		Points* p = pHead;
		while(p->pNext != NULL){
			p = p->pNext;
		}
		p->pNext = createNode(state, value);
		return;
	}	
}

// addHead
void addNodeV2(Points* &pHead, int state, char value){
    if(pHead == NULL){ //TH DSLK rong
		pHead = createNode(state, value);
		return;
	}
	else{
		Points* p = createNode(state, value);
		p->pNext = pHead;
		pHead = p;
		return;
	}	
}

// move to the node[x][y] (kinda)
// this is for loadMatrixToLinkedList
Points* moveToPointNode(Points** pHead, int x, int y){
	int pos = 0;
	Points* p = pHead[x];
	while (p != NULL && pos++ < y)
		p = p->pNext;
	return p;
}

// 0 <- 1 <- 2 <- 3 <- 4 <- Head 
Points* moveToPointNodeV2(Points** pHead, int x, int y){
	int pos = 0;
	Points* p = pHead[x];
	int move = lengthPointNode(p) - y - 1;
	while (p != NULL && pos < move){
		p = p->pNext;
		pos++;
	}
	return p;
}

// change the value of node
void changePointNode(Points** &pHead, int x, int y , int state, char value){
	Points* p = moveToPointNode(pHead, x, y);
	p->x = x;
	p->y = y;
	p->state = state;
	p->value = value;
}
void changePointNodeV2(Points** &pHead, int x, int y , int state, char value){
	Points* p = moveToPointNodeV2(pHead, x, y);
	p->x = x;
	p->y = y;
	p->state = state;
	p->value = value;
}


// same as newMatrix but this time is linkedList
// make an empty board 
// for left and up
Points** newLinkedListLU(int width, int length){
    Points** pHead = new Points* [width];
    // head of single linked list
    for (int i = 0; i < width; i++)
        pHead[i] = NULL;
    
	// add all value
	for (int i = 0; i < width; i++)
		for (int j = 0; j < length; j++){
			addNode(pHead[i], NOR, '0');
		}
	
	return pHead;    
}
// for right and down
Points** newLinkedListRD(int width, int length){
    Points** pHead = new Points* [length];
    // head of single linked list
    for (int i = 0; i < length; i++)
        pHead[i] = NULL;
    
	// add all value
	for (int i = 0; i < length; i++)
		for (int j = 0; j < width; j++){
			addNodeV2(pHead[i], NOR, '0');
		}
	
	return pHead;    
}

// remove the node inside 
void removePos(Points* &pHead, int pos){
    if (pos > lengthPointNode(pHead) - 1)
        return;
        
	Points* p = pHead;
	int count = 0;
	while(p != NULL && count < pos - 1){
		p = p->pNext;
		count++;
	}
	
	if(p == NULL)
        return;	

	Points* p1 = p->pNext;
	Points* p2 = p1->pNext;
	
	p->pNext = p2;
	delete p1;
}
void removePosV2(Points* &pHead, int pos, int size){
    // if (pos > lengthPointNode(pHead) - 1)
    //     return;
        
	Points* p = pHead;
	int count = 0;
	int move = size - pos - 1;
	while(p != NULL && count < move - 1){
		p = p->pNext;
		count++;
	}
	
	if(p == NULL)
        return;	

	Points* p1 = p->pNext;
	Points* p2 = p1->pNext;
	
	p->pNext = p2;
	delete p1;
}

void freeLinkedList(Points** pHead, int size){
    Points* tmp;
    for (int i = 0; i < size; i++)
        while (pHead[i] != NULL){
            tmp = pHead[i];
            pHead[i] = pHead[i]->pNext;
            free(tmp);
        }
	delete []pHead;
}


// fill the empty in the matrix after delete the node
Points fillNode(int x, int y){
	Points a;
	a.x = x;
	a.y = y;
	a.state = DEL;
	a.value = '0';
	a.pNext = NULL;
	return a;
}

// load the matrix into the linked list for the first time (ONLY ONCE)
void loadMatrixIntoLinkedListLeft(Points** &pHead, Points** &board, int size){
    for (int i = 0; i < size; i++){
		Points* p = pHead[i];
		for (int j = 0; j < size; j++)
            changePointNode(pHead, i, j, board[i][j].state, board[i][j].value);      
	}	
}

void loadMatrixIntoLinkedListRight(Points** &pHead, Points** &board, int size){
    for (int i = 0; i < size; i++){
		Points* p = pHead[i];
		for (int j = 0; j < size; j++)
            changePointNodeV2(pHead, i, j, board[i][j].state, board[i][j].value);      
	}	
}

void loadMatrixIntoLinkedListUp(Points** &pHead, Points** &board, int size){
    for (int j = 0; j < size; j++){
		Points* p = pHead[j];
		for (int i = 0; i < size; i++)
            changePointNode(pHead, j, i, board[i][j].state, board[i][j].value); 
	}	
}

void loadMatrixIntoLinkedListDown(Points** &pHead, Points** &board, int size){
    for (int j = 0; j < size; j++){
		Points* p = pHead[j];
		for (int i = 0; i < size; i++)
            changePointNodeV2(pHead, j, i, board[i][j].state, board[i][j].value); 
	}	
}

// update the linked list onto the matrix
void linkedListToMatrixLeft(Points** &pHead, Points** &board, int size){
	int j = 0;
	for (int i = 0; i < size; i++){
        Points* p = pHead[i];
		// spine
		while (p != NULL){
			board[i][j++] = *p;
			p = p->pNext;
		}
		while (j < size){
			board[i][j] = fillNode(i, j);
            j++;
		}
		j = 0;
	}
}

void linkedListToMatrixRight(Points** &pHead, Points** &board, int size){
	int j = size - 1;
	for (int i = 0; i < size; i++){
        Points* p = pHead[i];
		// spine
		while (p != NULL){
			board[i][j--] = *p;
			p = p->pNext;
		}
		while (j >= 0){
			board[i][j] = fillNode(i, j);
			j--;
		}
		j = size - 1;
	}
}

void linkedListToMatrixDown(Points** &pHead, Points** &board, int size){
	int i = size - 1;
	for (int j = 0; j < size; j++){
        Points* p = pHead[j];
		// spine
		while (p != NULL){
			board[i--][j] = *p;
			p = p->pNext;
		}
		while (i >= 0){
			board[i][j] = fillNode(i, j);
			i--;
		}
		i = size - 1;
	}
}

void linkedListToMatrixUp(Points** &pHead, Points** &board, int size){
	int i = 0;
	for (int j = 0; j < size; j++){
        Points* p = pHead[j];
		// spine
		while (p != NULL){
			board[i++][j] = *p;
			p = p->pNext;
		}
		while(i < size){
			board[i][j] = fillNode(i, j);
			i++;
		}
		i = 0;
	}
}

// Basically, everything is performed at the matrix (2d pointer array)
// so after all the crazy shit we performed and deleted 2 correct elements inside the matrix
// we reload the value back to the linked list for deletion inside the linked list
// then using the linkedListToMatrix to upload value and the shrinked-board onto the matrix again.

void matrixToLinkedListLeft(Points** &pHead, Points** &board, int size){
	for (int i = 1; i < size - 1; i++){
		Points* p = pHead[i];
		for (int j = size - 2; j > 0; j--)
			if (board[i][j].state == DEL && board[i][j].value == '.')
				removePos(p, j);
	}	
}

void matrixToLinkedListRight(Points** &pHead, Points** &board, int size){
	for (int i = 1; i < size - 1; i++){
		Points* p = pHead[i];
		for (int j = 1; j < size - 1; j++)
			if (board[i][j].state == DEL && board[i][j].value == '.')
				removePosV2(p, j, size);
	}	
}

void matrixToLinkedListUp(Points** &pHead, Points** &board, int size){
	for (int j = 1; j < size - 1; j++){
		Points* p = pHead[j];
		for (int i = size - 2; i > 0; i--)
			if (board[i][j].state == DEL && board[i][j].value == '.')
				removePos(p, i);
	}	
}

void matrixToLinkedListDown(Points** &pHead, Points** &board, int size){
	for (int j = 1; j < size - 1; j++){
		Points* p = pHead[j];
		for (int i = 0; i < size - 1; i++)
			if (board[i][j].state == DEL && board[i][j].value == '.')
				removePosV2(p, i, size);
	}	
}
// update the coordinate after sliding 
void coordinateMania(Points** &board, int size){
    for (int i = 0; i < size; i++)
        for (int j = 0; j < size; j++){
            board[i][j].x = i;
            board[i][j].y = j;
        }
            
}

// Process: 
//  1. do the calculation, deletion, checking, bla bla bla
//  2. load to the linked list to remove node and shrink the board
//  3. reload back to the matrix
void updateLeft(Points** &pHead, Points** &board, int size){
    matrixToLinkedListLeft(pHead, board, size);
    linkedListToMatrixLeft(pHead, board, size);
    coordinateMania(board, size);
}

void updateRight(Points** &pHead, Points** &board, int size){
    matrixToLinkedListRight(pHead, board, size);
    linkedListToMatrixRight(pHead, board, size);
    coordinateMania(board, size);
}

void updateUp(Points** &pHead, Points** &board, int size){
    matrixToLinkedListUp(pHead, board, size);
    linkedListToMatrixUp(pHead, board, size);
    coordinateMania(board, size);
}

void updateDown(Points** &pHead, Points** &board, int size){
    matrixToLinkedListDown(pHead, board, size);
    linkedListToMatrixDown(pHead, board, size);
    coordinateMania(board, size);
}

void updateDirection(Points** &pHead, Points** &board, int size, int direction){
    if (direction == L)
        updateLeft(pHead, board, size);
    else if (direction == D)
        updateDown(pHead, board, size);
    else if (direction == R)
        updateRight(pHead, board, size);
    else if(direction == U)
        updateUp(pHead, board, size);
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

//------------------------------------------------------------------------
                        /*  *   *   *   *   *   *
                        *   CHANGE THE STATE    *
                        *   *   *   *   *   *   */
//------------------------------------------------------------------------
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

// for hightlighter
void selectState(Points &p){
    p.state = SEL;
}

void normalizeState(Points &p){
    p.state = NOR;
}

void correctState(Points &p){
    p.state = CORRECT;
}

void incorrectState(Points &p){
    p.state = INCORRECT;
}

// Check the End of game
bool checkEndGame(Points** matrix, int n){
    for (int i = 0; i < n; i++)
		for (int j = 0; j < n; j++)
			if (matrix[i][j].state != DEL)
                return false; 
    return true;
}
// for linked list
bool checkEndGameLinkedList(Points** matrix, int n){
    for (int i = 1; i < n-1; i++)
		for (int j = 1; j < n-1; j++)
			if (matrix[i][j].state != DEL)
                return false; 
    return true;
}

//------------------------------------------------------------------------
                    /*	*	*	*	*	*	*	*
                    *			RANDOM			*
                    *	CHECKING IF SOLVABLE	*
                    *	*	*	*	*	*	*	*/
//------------------------------------------------------------------------

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

// y-------------> length
// x  0 1 2 3 4
// |  5 6 7 8 9
// v  
// width

// turn matrix into an array
Points* matrixToArray(Points** source, int width, int length){
    Points* array = new Points[width*length];
    int k = 0;
    for (int i = 0; i < width; i++)
        for (int j = 0; j < length; j++)
            array[k++] = source[i][j];
    return array;
}

// update the matrix from the array
void arrayToMatrix(Points** &a, Points* &b, int rows, int cols){
    int k = 0;
    for (int i = 0; i < rows; i++)
        for (int j = 0; j < cols; j++)
            a[i][j] = b[k++];
}

bool checkPlayable(Points** matrix, int size){
	Points** a = copyMatrix(matrix, size);
    // Stretch the matrix into an array 
    Points* b = matrixToArray(a, size, size);
	bool solved = false;

	
    for (int i = 0; i < size*size-1; i++){ 
        if (checkEndGame(a, size)){
                solved = true;
                break;
            }           
        for (int j = i+1; j < size*size; j++){
            if (checkEndGame(a, size))
                break;

            int tmpState1 = b[i].state;
			int tmpState2 = b[j].state;

            changeState(b[i], b[j]);
                        
            if (pathFinding(a, b[i], b[j]) != -1){
                removeState(b[i], b[j]);
                // update the deleted one onto the matrix
                arrayToMatrix(a, b, size, size);
                i = 0;
            } else {
                b[i].state = tmpState1;
                b[j].state = tmpState2;
            }            
        }
    }
	deleteBoard(a, size);
    delete []b;

	if (solved == true)
		return true;
	return false;
}

// bool checkPlayableLinkedList(Points** matrix, int size, int direction){
// 	Points** a = copyMatrix(matrix, size);
//     // LOAD LINKED LIST
//     Points** pHead = newLinkedListRD(size, size);
//     loadMatrixIntoLinkedListDown(pHead, a, size);
//     // Stretch the matrix into an array 
//     Points* b = matrixToArray(a, size, size);
// 	bool solved = false;

	
//     for (int i = 0; i < size*size-1; i++){ 
//         if (checkEndGame(a, size)){
//                 solved = true;
//                 break;
//             }           
//         for (int j = i+1; j < size*size; j++){
//             if (checkEndGame(a, size))
//                 break;

//             int tmpState1 = b[i].state;
// 			int tmpState2 = b[j].state;

//             changeState(b[i], b[j]);
                        
//             if (pathFinding(a, b[i], b[j]) != -1){
//                 removeState(b[i], b[j]);
//                 update(pHead, a, size, direction);
//                 // update the deleted one onto the matrix
//                 arrayToMatrix(a, b, size, size);
//                 i = 0;
//             } else {
//                 b[i].state = tmpState1;
//                 b[j].state = tmpState2;
//             }            
//         }
//     }
// 	deleteBoard(a, size);
//     freeLinkedList(pHead, size);
//     delete []b;

// 	if (solved == true)
// 		return true;
// 	return false;
// }

//------------------------------------------------------------------------
                            /*	*	*	*	*
                            *	SHUFFLE		*
                            *	*	*	*	*/
//------------------------------------------------------------------------

void shuffleMatrix(Points** matrix, int size){
    // Create a array of pair interger pairs
    // The array will only contain 25 distinct character pairs
    int sizeOfPair = (size-2) * (size-2); // remove the border
    char arrPair[sizeOfPair];
    int count = 0;
    for (int i = 0; i < sizeOfPair; i++){
        arrPair[i] = count / 2 + 'A';
        count++;
        if (count == 50)
            count = 0;
    }
// Shuffle the array of pairs
    srand(time(0));
Shuffle:
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
        goto Shuffle;
    }
}

// void shuffleLinkedList(Points** matrix, int size, int direction){
//     // Create a array of pair interger pairs
//     // The array will only contain 25 distinct character pairs
//     int sizeOfPair = (size-2) * (size-2); // remove the border
//     char arrPair[sizeOfPair];
//     int count = 0;
//     for (int i = 0; i < sizeOfPair; i++){
//         arrPair[i] = count / 2 + 'A';
//         count++;
//         if (count == 50)
//             count = 0;
//     }
// // Shuffle the array of pairs
//     srand(time(0));
// ShuffleLL:
//     for (int i = 1; i < size-1; i++){
//         for (int j = 1; j < size-1; j++){
//             int posInPairArray = rand() % (sizeOfPair);
//             matrix[i][j].value = arrPair[posInPairArray];

//             // Swap the value in posInPairArray to the end of array and decrease the size of array
//             swap(arrPair[posInPairArray], arrPair[sizeOfPair - 1]);
//             sizeOfPair--;
//         }
//     }

//     if (checkPlayableLinkedList(matrix, size, direction) == false)
//     {
//         sizeOfPair = (size-2) * (size-2);
//         goto ShuffleLL;
//     }
// }

//------------------------------------------------------------------------
                        /*  *   *   *   *   *   *
                        *   SELECT HIGHLIGHTER  *
                        *   *   *   *   *   *   */
//------------------------------------------------------------------------

void selectHighLight(Points** board){
    int pX = highlighter.x;
    int pY = highlighter.y;
    selectState(board[pX][pY]);
}

void deleteHighLight(Points** board){
    int pX = highlighter.x;
    int pY = highlighter.y;
    deleteState(board[pX][pY]);
}

void normalizeHighLight(Points** board){
    int pX = highlighter.x;
    int pY = highlighter.y;
    normalizeState(board[pX][pY]);
}

void selector(Points** board){
    int pX = highlighter.x;
    int pY = highlighter.y;
    if (board[pX][pY].state == SEL){
        normalizeHighLight(board);
    }     
    else if (board[pX][pY].state == NOR){
        selectHighLight(board);
    } 
}

//------------------------------------------------------------------------
                            /*  *   *   *
                            *   DRAW    *
                            *   BOARD   *
                            *   *   *   */
//------------------------------------------------------------------------

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
    else if (state == HINT)
        SetColor(BLACK, YELLOW);
}

void drawDelete(Points** board, int pX, int pY){
    cout << "     \n";
    SetPosition(pX+1, pY);
    cout << "     \n";
    SetPosition(pX+2, pY);
    cout << "     \n"; 
}

void drawBlank(int x, int y){
    fstream fin;
    string line;
    int skipRows = x * 3;
    int pX = x * 3, pY = y * 6;
    int lenRow = 3;
    int posCols = y * 6;
    int lenCol = 6;
    fin.open("Ascii_Art/Girl2.txt", ios::in);
    int count = 0;
    // skip rows
    while (skipRows != 0){
        getline(fin, line);
        skipRows--;
    }
    
    // read rows
    while (count != lenRow){
        getline(fin, line);
        SetPosition(pX++, pY);
        cout << line.substr(posCols, lenCol) << '\n';
        count++;
    }
    fin.close();
}

void drawBoard(Points** board, int size){
    for (int i = 1; i < size-1; i++){
        for (int j = 1; j < size-1; j++){   
            int pX = (i * 3);
            int pY = (j * 6);
            SetPosition(pX, pY);
            if (board[i][j].state == DEL){
                SetColor(BLACK, WHITE);
                drawBlank(i, j);
            }
            else{
                if (board[i][j].state == NOR){    
                    SetColor(BLACK, BLUE);
                    cout << "+---+\n";
                    SetPosition(pX+1, pY);
                    cout << "| ";
                    int randomColor = color[(int)board[i][j].value % 6];
                    SetColor(BLACK, randomColor);
                    cout << board[i][j].value;
                    SetColor(BLACK, BLUE);
                    cout << " |\n";
                    SetPosition(pX+2, pY);
                    cout << "+---+\n";
                }
                else {
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
}

void drawBackGround(){
    SetPosition(0,0);
    fstream fi;
    string s = "Ascii_Art/Girl2.txt";
    string line;
    fi.open(s);
    int count = 0;
    // system("cls");
    if (fi.is_open()){
        while (getline(fi,line)){
            count++;
            cout << line << '\n';
        }
        fi.close();
    } else cout << "Unable to open file"; 
}

void drawAll(Points** board, int size){
    drawBackGround();
    // drawBorder(board, size);
    drawBoard(board, size);
    
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
        Sleep(5);
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
        Sleep(5);
        
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

bool comparePoints(Points a, Points b){
    if (a.x == b.x && a.y == b.y)
        return true;
    return false;
}

static vector<Points> record;
void drawPreMove(int size){
    for (int i = 0; i < record.size(); i++){
        int pX = i;
        int pY = size*10;
        SetPosition(pX, pY);
        cout << record[i].value;
        cout << '(' << record[i].x << ',' << record[i].y << ')' << record[i].state;
    }
}

//------------------------------------------------------------------------
                        /*  *   *   *   *   *   *
                        *   CONTROLLER          *
                        *   MOVING THE POINTER  *
                        *   *   *   *   *   *   */
//------------------------------------------------------------------------

// part of drawing highlighter (or pointer whatever you want to call it)
void removeHighLight(Points** board, int i, int j, int size){
    int pX = (i * 3);
    int pY = (j * 6);  
    // drawAll(board, size);
    drawBoard(board, size);
    SetPosition(pX, pY);
    SetColor(BLACK, WHITE);
    if (board[i][j].state == DEL){
        // drawAll(board, size);
        drawBlank(i, j);
    }
    else {
        cout << "+---+\n";
        SetPosition(pX+1, pY);
        cout << "| " << board[i][j].value << " |\n";
        SetPosition(pX+2, pY);
        cout << "+---+\n";
    }
}

// highlight the current square
void highLight(Points** board, int i, int j, int size){
    int pX = (i * 3);
    int pY = (j * 6);  
    // drawAll(board, size);
    drawBoard(board, size);
    SetPosition(pX, pY);
    SetColor(WHITE, BLACK);
    
    if (board[i][j].state == DEL){
        // drawDelete(board, pX, pY);
        drawBlank(i, j);
    }
    else {
        cout << "+---+\n";
        SetPosition(pX+1, pY);
        cout << "| " << board[i][j].value << " |\n";
        SetPosition(pX+2, pY);
        cout << "+---+\n";
    }
    SetColor(BLACK, WHITE);
}

void Setup(Points** board, int width, int height, int size){
    WIDTH = width;
    HEIGHT = height;
    SetWindowSize(width,height+1);
    ShowsCursor(false);
    highlighter.x = 1;
    highlighter.y = 1;
    drawAll(board, size);
    highLight(board, highlighter.x, highlighter.y, size);
}

bool CanMove(int x, int y, int mode){
    return x >= 1 && y >= 1 && x < mode -1 && y < mode - 1;
}

//------------------------------------------------------------------------
                        /*  *   *   *   *   *
                        *   MOVE SUGGESTION *
                        *   *   *   *   *   */
//------------------------------------------------------------------------
// later not now
// now I guess

void moveSuggestion(Points** board, int size){
    // Stretch the matrix into an array 
    Points* array = matrixToArray(board, size, size);
    bool end = false;

    for (int i = 0; i < size*size-1; i++){ 
        if (end == true){
                break;
            }           
        for (int j = i+1; j < size*size; j++){
            if (checkEndGame(board, size))
                break;

            int tmpState1 = array[i].state;
			int tmpState2 = array[j].state;

            changeState(array[i], array[j]);
                        
            // a possible path is found
            if (pathFinding(board, array[i], array[j]) != -1){
                // draw the selected one
                arrayToMatrix(board, array, size, size);
                drawBoard(board, size);
                Sleep(250);
                // remove the state
                array[i].state = tmpState1;
                array[j].state = tmpState2;
                // return 
                arrayToMatrix(board, array, size, size);
                drawBoard(board, size);
                end = true;
                break;
            } else {
                array[i].state = tmpState1;
                array[j].state = tmpState2;
            }            
        }
    }
}



//------------------------------------------------------------------------
// pathDraw
//------------------------------------------------------------------------

int pathDraw(Points** matrix, Points p1, Points p2){
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
        int tmpY = checkMoreLineX(matrix, p1, p2, LEFT);
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
        // cout << "THE FUCK IS THAT SUPPOSE TO BE";
        return 7;
    }
       
    if (checkMoreLineY(matrix, p1, p2, UP) != -1){
        int tmpX = checkMoreLineY(matrix, p1, p2, UP);
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
        return 8;
    } 
    
    // if every case fails => no possible connection can be made
    return -1;
}

//------------------------------------------------------------------------
                        /*  *   *   *   *   *
                        *   PRE_MOVE MODE   *
                        *   *   *   *   *   */
//------------------------------------------------------------------------
// make a file contains all the move being choose
// read from the file 2 selected each time
// if 1 incorrect or not solve all => lose 
// else win
// make a selected move on the right side of the board

bool moving(Points** board, int size){
    if (record.size() % 2 != 0){
        return false;
    }
    // 0 1 2 3 4 5
    // f s f s f s
    for (int i = 0; i < record.size(); i+=2){
        changeState(board[record[i].x][record[i].y],board[record[i+1].x][record[i+1].y] );
        first = &board[record[i].x][record[i].y];
        second = &board[record[i+1].x][record[i+1].y];
        if (pathDraw(board, *first, *second) != -1){
            Beep(2794, 50);
            correctState(*first);
            correctState(*second);
            drawAll(board, size);
            Sleep(50);
            deleteState(*first);
            deleteState(*second);
            highLight(board, highlighter.x, highlighter.y, size);
        }
        else if (first->x == second->x && first->y == second->y){ // re-enter to deselect
            returnState(*first, *second);
            highLight(board, highlighter.x, highlighter.y, size);
            return false;
        }
        else{
            Beep(185, 50);
            incorrectState(*first);
            incorrectState(*second);
            drawAll(board, size);
            Sleep(500);
            returnState(*first, *second);
            highLight(board, highlighter.x, highlighter.y, size);
            return false;
        }
        first = nullptr;
        second = nullptr;
    }
    if (checkEndGame(board, size) == false)
        return false;
    return true;
}

void preMove(Points** board, int size){
    switch(getch()){
        case 77: //right key
            if (CanMove(highlighter.x, highlighter.y + 1, size)){
                // removeHighLight(board, highlighter.x, highlighter.y, size);
                highLight(board, highlighter.x, highlighter.y, size);
                highlighter.y++;
                highLight(board, highlighter.x, highlighter.y, size);
            }
        break;
        case 75: //left key
            if (CanMove(highlighter.x, highlighter.y - 1, size)){
                // removeHighLight(board, highlighter.x, highlighter.y, size);
                highLight(board, highlighter.x, highlighter.y, size);
                highlighter.y--;
                highLight(board, highlighter.x, highlighter.y, size);
            }
            break;
        case 72: //up key
            if (CanMove(highlighter.x - 1, highlighter.y, size)){
                // removeHighLight(board, highlighter.x, highlighter.y, size);
                highLight(board, highlighter.x, highlighter.y, size);
                highlighter.x--;
                highLight(board, highlighter.x, highlighter.y, size);
            }
            break;
        case 80: //down key
            if (CanMove(highlighter.x + 1, highlighter.y, size)){
                // removeHighLight(board, highlighter.x, highlighter.y, size);
                highLight(board, highlighter.x, highlighter.y, size);
                highlighter.x++;
                highLight(board, highlighter.x, highlighter.y, size);
            }
            break;
        case 13: // ENTER BUTTON
            // avoid selecting blank space
            if (board[highlighter.x][highlighter.y].state == DEL){
                break;
            }
            // change the state
            selector(board);
            if (countSelector == 0){
                first = &board[highlighter.x][highlighter.y]; // store the first one being selected
                record.push_back(*first);
                countSelector++;
            }
            else if (countSelector == 1){
                second = &board[highlighter.x][highlighter.y]; // store the second one being selected
                record.push_back(*second);
                countSelector++;
            }
                
            
            // 2 already stored
            if (countSelector == 2){
                returnState(*first, *second);
                highLight(board, highlighter.x, highlighter.y, size);
                // reset       
                drawPreMove(size);
                countSelector = 0;
                first = nullptr;
                second = nullptr;
            }
            if (checkEndGame(board, size))
                gameOver = true;
            break;
        case 27: // esc
            gameOver = true;
            break;
        case 'h':
            if (first != nullptr){
                // remove selected state
                normalizeState(*first);
                countSelector = 0;
                // remove pointer
                first = nullptr;
            }
            Beep(1865, 50);
            moveSuggestion(board, size);
            highLight(board, highlighter.x, highlighter.y, size);
            break;
        case 'y':
            SetPosition(size*7, size*7);
            if (moving(board, size) == false){    
                cout << "LOSE" ;
            }else cout << "WIN";
            break;
    }
}

//------------------------------------------------------------------------
                        /*  *   *   *   *   *   *
                        *   SETUP AND MOVING    *
                        *   *   *   *   *   *   */
//------------------------------------------------------------------------

void Move(Points** board, int size){
    switch(getch()){
        case 77: //right key
            if (CanMove(highlighter.x, highlighter.y + 1, size)){
                // removeHighLight(board, highlighter.x, highlighter.y, size);
                highLight(board, highlighter.x, highlighter.y, size);
                highlighter.y++;
                highLight(board, highlighter.x, highlighter.y, size);
            }
        break;
        case 75: //left key
            if (CanMove(highlighter.x, highlighter.y - 1, size)){
                // removeHighLight(board, highlighter.x, highlighter.y, size);
                highLight(board, highlighter.x, highlighter.y, size);
                highlighter.y--;
                highLight(board, highlighter.x, highlighter.y, size);
            }
            break;
        case 72: //up key
            if (CanMove(highlighter.x - 1, highlighter.y, size)){
                // removeHighLight(board, highlighter.x, highlighter.y, size);
                highLight(board, highlighter.x, highlighter.y, size);
                highlighter.x--;
                highLight(board, highlighter.x, highlighter.y, size);
            }
            break;
        case 80: //down key
            if (CanMove(highlighter.x + 1, highlighter.y, size)){
                // removeHighLight(board, highlighter.x, highlighter.y, size);
                highLight(board, highlighter.x, highlighter.y, size);
                highlighter.x++;
                highLight(board, highlighter.x, highlighter.y, size);
            }
            break;
        case 13: // ENTER BUTTON
            // change the state
            selector(board);
            // avoid selecting blank space
            if (board[highlighter.x][highlighter.y].state == DEL){
                break;
            }
            // Beep(1397, 50);
            countSelector++;
            first = &board[highlighter.x][highlighter.y]; // store the first one being selected
            if (countSelector == 1)
                second = &board[highlighter.x][highlighter.y]; // store the second one being selected
            
            // 2 already stored
            if (countSelector == 2){
                if (pathDraw(board, *second, *first) != -1){
                    Beep(2794, 50);
                    correctState(*first);
                    correctState(*second);
                    drawAll(board, size);
                    Sleep(50);
                    deleteState(*first);
                    deleteState(*second);
                    highLight(board, highlighter.x, highlighter.y, size);
                }
                else if (first->x == second->x && first->y == second->y){ // re-enter to deselect
                    returnState(*first, *second);
                    highLight(board, highlighter.x, highlighter.y, size);
                }
                else{
                    Beep(185, 50);
                    incorrectState(*first);
                    incorrectState(*second);
                    drawAll(board, size);
                    Sleep(500);
                    returnState(*first, *second);
                    highLight(board, highlighter.x, highlighter.y, size);
                }

                // reset       
                countSelector = 0;
                first = nullptr;
                second = nullptr;
            }
            if (checkEndGame(board, size))
                gameOver = true;
            break;
        case 27: // esc
            gameOver = true;
            break;
        case 'h':
            if (first != nullptr){
                // remove selected state
                normalizeState(*first);
                countSelector = 0;
                // remove pointer
                first = nullptr;
            }
            Beep(1865, 50);
            moveSuggestion(board, size);
            highLight(board, highlighter.x, highlighter.y, size);
            break;
    }
}

//------------------------------------------------------------------------
                        /*  *   *   *   *   *   *
                        *   SETUP AND MOVING    *
                        *   LINKED LIST         *
                        *   *   *   *   *   *   */
//------------------------------------------------------------------------

void linkedListMove(Points** pHead, Points** board, int size, int direction){
    switch(getch()){
        case 77: //right key
            if (CanMove(highlighter.x, highlighter.y + 1, size)){
                // removeHighLight(board, highlighter.x, highlighter.y, size);
                highLight(board, highlighter.x, highlighter.y, size);
                highlighter.y++;
                highLight(board, highlighter.x, highlighter.y, size);
            }
        break;
        case 75: //left key
            if (CanMove(highlighter.x, highlighter.y - 1, size)){
                // removeHighLight(board, highlighter.x, highlighter.y, size);
                highLight(board, highlighter.x, highlighter.y, size);
                highlighter.y--;
                highLight(board, highlighter.x, highlighter.y, size);
            }
            break;
        case 72: //up key
            if (CanMove(highlighter.x - 1, highlighter.y, size)){
                // removeHighLight(board, highlighter.x, highlighter.y, size);
                highLight(board, highlighter.x, highlighter.y, size);
                highlighter.x--;
                highLight(board, highlighter.x, highlighter.y, size);
            }
            break;
        case 80: //down key
            if (CanMove(highlighter.x + 1, highlighter.y, size)){
                // removeHighLight(board, highlighter.x, highlighter.y, size);
                highLight(board, highlighter.x, highlighter.y, size);
                highlighter.x++;
                highLight(board, highlighter.x, highlighter.y, size);
            }
            break;
        case 13: // ENTER BUTTON
            // change the state
            selector(board);
            // avoid selecting blank space
            if (board[highlighter.x][highlighter.y].state == DEL){
                break;
            }
            // Beep(1397, 50);
            countSelector++;
            first = &board[highlighter.x][highlighter.y]; // store the first one being selected
            if (countSelector == 1)
                second = &board[highlighter.x][highlighter.y]; // store the second one being selected
            
            // 2 already stored
            if (countSelector == 2){
                if (pathDraw(board, *second, *first) != -1){
                    Beep(2794, 50);
                    correctState(*first);
                    correctState(*second);
                    drawAll(board, size);
                    Sleep(50);
                    deleteState(*first);
                    deleteState(*second);
                    // update(pHead, board, size, direction);
                    updateDirection(pHead, board, size, direction);
                    highLight(board, highlighter.x, highlighter.y, size);
                }
                else if (first->x == second->x && first->y == second->y){ // re-enter to deselect
                    returnState(*first, *second);
                    highLight(board, highlighter.x, highlighter.y, size);
                }
                else{
                    Beep(185, 50);
                    incorrectState(*first);
                    incorrectState(*second);
                    drawAll(board, size);
                    Sleep(500);
                    returnState(*first, *second);
                    highLight(board, highlighter.x, highlighter.y, size);
                }

                // reset       
                countSelector = 0;
                first = nullptr;
                second = nullptr;
            }
            if (checkEndGame(board, size))
                gameOver = true;
            break;
        case 27: // esc
            gameOver = true;
            break;
        case 'h':
            if (first != nullptr){
                // remove selected state
                normalizeState(*first);
                countSelector = 0;
                // remove pointer
                first = nullptr;
            }
            Beep(1865, 50);
            moveSuggestion(board, size);
            highLight(board, highlighter.x, highlighter.y, size);
            break;
        case 'r':
            shuffleMatrix(board, size);
            break;
    }
}

//------------------------------------------------------------------------
// PLAY - MODE
//------------------------------------------------------------------------

void playBackGround(){
    PlaySound(TEXT("Sound/Background.wav"), NULL, SND_FILENAME | SND_LOOP | SND_ASYNC);
}

void Play_Pre(Points** board, int size){
    while(!gameOver){
        preMove(board, size);
        if (checkEndGame(board, size))
            gameOver = true;
    }   
}

void Play(Points** board, int size){
    while(!gameOver){
        Move(board, size);
        if (checkEndGame(board, size))
            gameOver = true;
    }
}

void Play_LinkedList(Points** pHead, Points** board, int size, int direction){
    playBackGround();
    if (direction == L)
        loadMatrixIntoLinkedListLeft(pHead, board, size);
    else if (direction == D)
        loadMatrixIntoLinkedListDown(pHead, board, size);
    else if (direction == R)
        loadMatrixIntoLinkedListRight(pHead, board, size);
    else if(direction == U)
        loadMatrixIntoLinkedListUp(pHead, board, size);
    while(!gameOver){
        linkedListMove(pHead, board, size, direction);
        if (checkEndGame(board, size))
            gameOver = true;
    }   
}

void InitEasyModeV1(){
    Points** board = newMatrix(EASY);
    shuffleMatrix(board, EASY);
    Setup(board, 50*3, 20*3, EASY);
    Play(board, EASY);
    getch();
}



//------------------------------------------------------------------------
                                /*  *   *   *
                                *   MAIN    *
                                *   *   *   */
//------------------------------------------------------------------------

// int main(int argc, char *argv[]) {
//     system("cls");
//     int n = EASY;
//     Points** board = newMatrix(n);
//     Points** pHead = newLinkedListRD(n, n);
//     shuffleMatrix(board, n);
//     Setup(board, 50*3,20*3, n);
//     Play_LinkedList(pHead, board, n, D);
//     getch();
//     return 0;
//     system("pause");
// }
