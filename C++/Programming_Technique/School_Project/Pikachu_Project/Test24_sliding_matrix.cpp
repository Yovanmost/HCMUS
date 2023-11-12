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

void SetPosition(int16_t X, int16_t Y){
    HANDLE Screen;
    Screen = GetStdHandle(STD_OUTPUT_HANDLE);
    COORD Position = { Y, X };
    SetConsoleCursorPosition(Screen, Position);
}

void SetColor(int backgound_color, int text_color)
{
    HANDLE hStdout = GetStdHandle(STD_OUTPUT_HANDLE);
    int color_code = backgound_color * 16 + text_color;
    SetConsoleTextAttribute(hStdout, color_code);
}

void drawDelete(Points** board, int pX, int pY){
    cout << "     \n";
    SetPosition(pX+1, pY);
    cout << "     \n";
    SetPosition(pX+2, pY);
    cout << "     \n"; 
}

void drawBoard(Points** board, int size){
	// srand(time(0));
    for (int i = 1; i < size-1; i++){
        for (int j = 1; j < size-1; j++){   
            int pX = (i * 3);
            int pY = (j * 6);
            SetPosition(pX, pY);
            // draw background later
            if (board[i][j].state == DEL){
                // SetColor(BLACK, WHITE);
                drawDelete(board, pX, pY);
            }
            else{
                // drawState(board[i][j].state);
				SetColor(0, 7);
				cout << "+---+\n";
				SetPosition(pX+1, pY);
				cout << "| " << board[i][j].value << " |\n";
				SetPosition(pX+2, pY);
				cout << "+---+\n";
            }
            
        }
    }
}

void printBoard(Points** a, int n){
	for (int i = 0; i < n; i++){
		for (int j = 0; j < n; j++)
			cout << (int)a[i][j].value << " ";			
		cout << '\n';
	}
}

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
    for (int i = 1; i < size-1; i++){
        for (int j = 1; j < size-1; j++){
            int posInPairArray = rand() % (sizeOfPair);
            matrix[i][j].value = arrPair[posInPairArray];

            // Swap the value in posInPairArray to the end of array and decrease the size of array
            swap(arrPair[posInPairArray], arrPair[sizeOfPair - 1]);
            sizeOfPair--;
        }
    }
}

Points** newMatrix(int n){ // n = 4x4  8x8 or 16x16; 
	Points** matrixBoard = new Points* [n];
	for (int i = 0; i < n; i++){
		matrixBoard[i] = new Points[n];
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
	
    matrixBoard[1][1].state = NOR;	matrixBoard[1][2].state = NOR;	matrixBoard[1][3].state = NOR;	matrixBoard[1][4].state = NOR;
	matrixBoard[2][1].state = NOR;	matrixBoard[2][2].state = NOR;	matrixBoard[2][3].state = NOR;	matrixBoard[2][4].state = NOR;
    matrixBoard[3][1].state = NOR;	matrixBoard[3][2].state = NOR;	matrixBoard[3][3].state = NOR;	matrixBoard[3][4].state = NOR;
    matrixBoard[4][1].state = NOR;	matrixBoard[4][2].state = NOR;	matrixBoard[4][3].state = NOR;	matrixBoard[4][4].state = NOR;

	return matrixBoard;
}

int deleteCellAtLeft(Points** matrix, int length, int x, int y){
    for (int i = y; i < length - 1; i++){
        matrix[x][i] = matrix[x][i+1];
    }
}

int deleteCellAtRight(Points** matrix, int length, int x, int y){
    for (int i = y; i > 0 ; i--){
        matrix[x][i] = matrix[x][i-1];
    }
}

int cellRemain(Points* matrix, int length){
    int count = 0;
    for (int i = 0; i < length; i++)
        if (matrix[i].state != DEL)
            count++;
    return count;
}

void deletedCell(Points &a){
    a.state = DEL;
    a.value = '.';
    a.pNext = NULL;
}

void slidingLeft(Points** board, int width, int length){
    for (int i = 1; i < width - 1; i++){
        for (int j = 1; j < length - 1; j++){
            if (board[i][j].state == DEL && board[i][j].value == '.'){
                deleteCellAtLeft(board, length, i, j);
            }          
        }
    }       
}

void slidingRight(Points** board, int width, int length){
    for (int i = 1; i < width - 1; i++){
        for (int j = length - 2; j >= 1; j--){
            if (board[i][j].state == DEL && board[i][j].value == '.'){
                deleteCellAtRight(board, length, i, j);
            }          
        }
    }       
}

void coordinateMania(Points** &board, int size){
    for (int i = 0; i < size; i++)
        for (int j = 0; j < size; j++){
            board[i][j].x = i;
            board[i][j].y = j;
        }
            
}

int main(){
    int n = EASY;
    Points** a = newMatrix(EASY);
    int x, y;
    shuffleMatrix(a, n);
    int t = 0;
    drawBoard(a ,n);
    while (true){
        // system("cls");
        cin >> x >> y;
        deletedCell(a[x][y]);
        slidingLeft(a, n, n);
        drawBoard(a, n);
    }


    return 0;
}