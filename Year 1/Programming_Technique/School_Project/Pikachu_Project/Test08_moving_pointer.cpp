#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <windows.h>
#include <stdint.h>
#include <conio.h>

using namespace std;

#define BLACK 0
#define AQUA 3
#define RED 4
#define WHITE 7
#define GRAY 8
#define GREEN 10
#define YELLOW 14

bool CanMove(int x, int y);
void CheckForCollisions();

typedef struct Entity{
    char c;
    int16_t y,x;
}Entity;

static int WIDTH;
static int HEIGHT;
static Entity player = {' ', 0, 0 };
// static const Entity coin = { YELLOW, '$', 0, 0 };
// static const Entity bomb = { DARKRED, 'o', 0, 0 };
static bool gameOver = false;
static int score = 0;
static char* map;

void SetWindowSize(int8_t width, int8_t height){
	COORD      coord = { width, height };
    SMALL_RECT rmin  = { 0, 0, 1, 1 };
    SMALL_RECT rect  = { 0, 0, width-1, height-1 };

    HANDLE Handle = GetStdHandle(STD_OUTPUT_HANDLE);
    SetConsoleWindowInfo(Handle, TRUE, &rmin);
    SetConsoleScreenBufferSize(Handle, coord);
    SetConsoleWindowInfo(Handle, TRUE, &rect);
}

void ShowsCursor(bool visible){
   HANDLE consoleHandle = GetStdHandle(STD_OUTPUT_HANDLE);
   CONSOLE_CURSOR_INFO info;
   info.dwSize = 100;
   info.bVisible = visible;
   SetConsoleCursorInfo(consoleHandle, &info);
}

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

void cPrint(char c, int16_t x, int16_t y){
    SetPosition(x,y);
    printf("%c",c);
}

void Print(const Entity entity){
    cPrint(entity.c,entity.x,entity.y);
}


void hightLight(int i, int j){
    int pX = (i * 3);
    int pY = (j * 6);
    
    SetPosition(pX, pY);
    SetColor(BLACK, YELLOW);
    cout << "+---+\n";
    SetPosition(pX+1, pY);
    cout << "| " << 'o' << " |\n";
    SetPosition(pX+2, pY);
    cout << "+---+\n";
}

void removeHightLight(Entity player, int i, int j){
    int pX = (i * 3);
    int pY = (j * 6);
    SetColor(BLACK, WHITE);
    SetPosition(pX, pY);
    cout << "+---+\n";
    SetPosition(pX+1, pY);
    cout << "| " << player.c << " |\n";
    SetPosition(pX+2, pY);
    cout << "+---+\n";   
}

void Setup(int width, int height){
    WIDTH = width;
    HEIGHT = height;
    SetWindowSize(width,height+1);
    ShowsCursor(false);
    // SetConsoleTitle("Demo");
    player.x = 1;
    player.y = 1;
    // cout << "DA FUG";
    // Print(player);
    hightLight(player.x, player.y);

    // cout << "a";
}

// void Move(){
//     switch(getch()){
//         case 77: //right key
//             if (CanMove(player.x, player.y + 1)){
//                 // cPrint(' ', player.x, player.y);
//                 // hightLight(player.x, player.y);
//                 removeHightLight(player, player.x, player.y);
//                 player.y++;
//                 // Print(player);
//                 hightLight(player.x, player.y);
//                 // CheckForCollisions();
//             }
//         break;
//         case 75: //left key
//             if (CanMove(player.x, player.y - 1)){
//                 cPrint(' ', player.x,player.y);
//                 player.y--;
//                 Print(player);
//                 // CheckForCollisions();
//             }
//             break;
//         case 72: //up key
//             if (CanMove(player.x - 1, player.y)){
//                 cPrint(' 'n, player.x,player.y);
//                 player.x--;
//                 Print(player);
//                 // CheckForCollisions();
//             }
//             break;
//         case 80: //down key
//             if (CanMove(player.x + 1, player.y)){
//                 cPrint('+', player.x,player.y);
//                 player.x++;
//                 Print(player);
//                 // CheckForCollisions();
//             }
//             break;
//         case 88: // X
//             gameOver = true;
//     }
// }

// testing
void Move(){
    switch(getch()){
        case 77: //right key
            if (CanMove(player.x, player.y + 1)){
                removeHightLight(player, player.x, player.y);
                player.y++;
                hightLight(player.x, player.y);
            }
        break;
        case 75: //left key
            if (CanMove(player.x, player.y - 1)){
                removeHightLight(player, player.x, player.y);
                player.y--;
                hightLight(player.x, player.y);
            }
            break;
        case 72: //up key
            if (CanMove(player.x - 1, player.y)){
                removeHightLight(player, player.x, player.y);
                player.x--;
                hightLight(player.x, player.y);
                // CheckForCollisions();
            }
            break;
        case 80: //down key
            if (CanMove(player.x + 1, player.y)){
                removeHightLight(player, player.x, player.y);
                player.x++;
                hightLight(player.x, player.y);
                // CheckForCollisions();
            }
            break;
        case 88: // X
            gameOver = true;
    }
}


bool CanMove(int x, int y){
    return x >= 0 && y >= 0 && x < HEIGHT && y < WIDTH;
}

// void CheckForCollisions(){
    
// }

void Play(){
    do {
        Move();
    } while(!gameOver);
}

int main(int argc, char *argv[]) {
    Setup(50*2,20*2);
    Play();
    getch();
    system("cls");

    return 0;
    system("pause");
}
