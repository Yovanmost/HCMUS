#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <windows.h>
#include <stdint.h>
#include <conio.h>

#define BLACK 0
#define AQUA 3
#define RED 4
#define WHITE 7
#define GRAY 8
#define GREEN 10
#define YELLOW 14

using namespace std;

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

void drawBorder(int** board, int size){
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

void drawBoard(int **board, int size){
    for (int i = 1; i < size-1; i++)
    {
        for (int j = 1; j < size-1; j++)
        {   
            int pX = (i * 3);
            int pY = (j * 6);
            SetPosition(pX, pY);
            cout << "+---+\n";
            SetPosition(pX+1, pY);
            cout << "| " << board[i][j] << " |\n";
            SetPosition(pX+2, pY);
            cout << "+---+\n";
        }
    }
    
}

void SetColor(int backgound_color, int text_color)
{
    HANDLE hStdout = GetStdHandle(STD_OUTPUT_HANDLE);

    int color_code = backgound_color * 16 + text_color;
    SetConsoleTextAttribute(hStdout, color_code);
}

// void DrawCube(char **a, int difficulty, Selected A, int backgound_color, int text_color)
// {
//     SetColor(backgound_color, text_color);
//     // Draw the cube
//     int posY = calculatePositionHeight(A.posY, difficulty) + 1;
//     int posX = calculatePositionWidth(A.posX, difficulty) + 1;
//     GoTo(posX, posY++);
//     wprintf(L"       \n");
//     GoTo(posX, posY++);
//     wprintf(L"   %c   \n", a[A.posY][A.posX]);
//     GoTo(posX, posY++);
//     wprintf(L"       \n");
//     SetColor(BLACK, WHITE);
// }


int** newMatrix(int n){
    int** a = new int*[n];
    for (int i = 0; i < n; i++)
        a[i] = new int[n];
    return a;
}

void fill(int** &a, int n){
    for (int i = 0; i < n; i++)
        for (int j = 0; j < n; j++)
            if (i == 0 || i == n-1 || j == n-1  || j == 0)
                a[i][j] = 0;
            else a[i][j] = rand() % 9 +1;
}

void printBoard(int** a, int n){
	for (int i = 0; i < n; i++){
		for (int j = 0; j < n; j++)
			cout << a[i][j] << " ";			
		cout << "\n";
	}
}

int main(){
    int n = 6;
    SetWindowSize(n*18, n*7);
    int** a = newMatrix(n);
    fill(a, n);
    // // SetPosition(0, 6);
    // // cout << "1";
    // fill(a, n);
    drawBoard(a, n);
    drawBorder(a, n);
    
    
    system("pause");
    return 0;
}
