#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <windows.h>
#include <stdint.h>
#include <conio.h>

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

typedef struct POS{
    int8_t y;
    int8_t x;
}POS;

typedef enum Color {
    BLACK = 0,
    DARKBLUE = FOREGROUND_BLUE,
    DARKGREEN = FOREGROUND_GREEN,
    DARKCYAN = FOREGROUND_GREEN | FOREGROUND_BLUE,
    DARKRED = FOREGROUND_RED,
    DARKMAGENTA = FOREGROUND_RED | FOREGROUND_BLUE,
    DARKYELLOW = FOREGROUND_RED | FOREGROUND_GREEN,
    DARKGRAY = FOREGROUND_RED | FOREGROUND_GREEN | FOREGROUND_BLUE,
    GRAY = FOREGROUND_INTENSITY,
    BLUE = FOREGROUND_INTENSITY | FOREGROUND_BLUE,
    GREEN = FOREGROUND_INTENSITY | FOREGROUND_GREEN,
    CYAN = FOREGROUND_INTENSITY | FOREGROUND_GREEN | FOREGROUND_BLUE,
    RED = FOREGROUND_INTENSITY | FOREGROUND_RED,
    MAGENTA = FOREGROUND_INTENSITY | FOREGROUND_RED | FOREGROUND_BLUE,
    YELLOW = FOREGROUND_INTENSITY | FOREGROUND_RED | FOREGROUND_GREEN,
    WHITE = FOREGROUND_INTENSITY | FOREGROUND_RED | FOREGROUND_GREEN | FOREGROUND_BLUE,
    BACKDARKBLUE = BACKGROUND_BLUE,
    BACKDARKGREEN = BACKGROUND_GREEN,
    BACKDARKCYAN = BACKGROUND_GREEN | BACKGROUND_BLUE,
    BACKDARKRED = BACKGROUND_RED,
    BACKDARKMAGENTA = BACKGROUND_RED | BACKGROUND_BLUE,
    BACKDARKYELLOW = BACKGROUND_RED | BACKGROUND_GREEN,
    BACKDARKGRAY = BACKGROUND_RED | BACKGROUND_GREEN | BACKGROUND_BLUE,
    BACKGRAY = BACKGROUND_INTENSITY,
    BACKBLUE = BACKGROUND_INTENSITY | BACKGROUND_BLUE,
    BACKGREEN = BACKGROUND_INTENSITY | BACKGROUND_GREEN,
    BACKCYAN = BACKGROUND_INTENSITY | BACKGROUND_GREEN | BACKGROUND_BLUE,
    BACKRED = BACKGROUND_INTENSITY | BACKGROUND_RED,
    BACKMAGENTA = BACKGROUND_INTENSITY | BACKGROUND_RED | BACKGROUND_BLUE,
    BACKYELLOW = BACKGROUND_INTENSITY | BACKGROUND_RED | BACKGROUND_GREEN,
    BACKWHITE = BACKGROUND_INTENSITY | BACKGROUND_RED | BACKGROUND_GREEN | BACKGROUND_BLUE,
    CYANMAGENTA = CYAN | BACKMAGENTA
}Color;

typedef struct Entity{
    Color color;
    char c;
    int16_t y,x;
}Entity;

void SetWindowSize(int8_t width, int8_t height);
void ShowsCursor(bool visible);
void SetPosition(int16_t X, int16_t Y);
void cPrint(char c, int16_t x, int16_t y);
void sPrint(char* c, int16_t x, int16_t y);
void SetColor(int8_t ForgC);
void cColoredPrint(char c, int16_t x, int16_t y, Color color);
void sColoredPrint(char* s, int16_t x, int16_t y, Color color);
void Print(const Entity entity);


void SetWindowSize(int8_t width, int8_t height){
	COORD      coord = { width, height };
    SMALL_RECT rmin  = { 0, 0, 1, 1 };
    SMALL_RECT rect  = { 0, 0, width-1, height-1 };

    HANDLE Handle = GetStdHandle(STD_OUTPUT_HANDLE);
    // SetConsoleWindowInfo(Handle, TRUE, &rmin);
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

void cPrint(char c, int16_t x, int16_t y){
    SetPosition(x,y);
    printf("%c",c);
}

void sPrint(char* s, int16_t x, int16_t y){
    SetPosition(x,y);
    printf("%s",s);
}

void SetColor(int8_t ForgC) {
    WORD wColor;
    HANDLE hStdOut = GetStdHandle(STD_OUTPUT_HANDLE);
    CONSOLE_SCREEN_BUFFER_INFO csbi;
    if (GetConsoleScreenBufferInfo(hStdOut, &csbi)){
        wColor = (csbi.wAttributes & 0xF0) + (ForgC & 0x0F);
        SetConsoleTextAttribute(hStdOut, wColor);
    }
}

void cColoredPrint(char c, int16_t x, int16_t y, Color color){
    SetColor(color);
    SetPosition(x,y);
    printf("%c",c);
    SetColor(WHITE);
}

void sColoredPrint(char* s, int16_t x, int16_t y, Color color){
    SetColor(color);
    SetPosition(x,y);
    printf("%s",s);
    SetColor(WHITE);
}

void Print(const Entity entity){
    cPrint(entity.c,entity.x,entity.y);
}

void Setup(int width, int height);
void Play();
void Move();
bool CanMove(int, int);
void SpawnCoin();
void UpdateScore();
void CheckForCollisions();

static int WIDTH;
static int HEIGHT;
static Entity player = { WHITE, '@', 0, 0 };
static const Entity coin = { YELLOW, '$', 0, 0 };
static const Entity bomb = { DARKRED, 'o', 0, 0 };
static bool gameOver = false;
static int score = 0;
static char* map;

void Setup(int width, int height){
    WIDTH = width;
    HEIGHT = height;
    SetWindowSize(width,height+1);
    ShowsCursor(false);
    // SetConsoleTitle("Demo");

    map = (char*)calloc(WIDTH * HEIGHT,sizeof(char));
    srand((unsigned)time(NULL));
    int amountOfBombs = (HEIGHT * WIDTH) / 10;
    int amountOfCoins = amountOfBombs / 5;
    sPrint("Your Score: 0", HEIGHT, 0);
    POS rndp;
    int i;
    
    for(i = 0; i < amountOfBombs; i++){
        do{
            rndp.x = rand() % HEIGHT;
            rndp.y = rand() % WIDTH;
        }while(map[rndp.x * WIDTH + rndp.y] != 0);
    
        map[rndp.x * WIDTH + rndp.y] = bomb.c;
        cColoredPrint(bomb.c, rndp.x, rndp.y, bomb.color);
    }
    
    for(i = 0; i < amountOfCoins; i++){
        do{
            rndp.x = rand() % HEIGHT;
            rndp.y = rand() % WIDTH;
        }while(map[rndp.x * WIDTH + rndp.y] != 0);
    
        map[rndp.x * WIDTH + rndp.y] = coin.c;
        cColoredPrint(coin.c, rndp.x, rndp.y, coin.color);
    }
    
    do{
        rndp.x = rand() % HEIGHT;
        rndp.y = rand() % WIDTH;
    }while(map[rndp.x * WIDTH + rndp.y] != 0);
    
    player.x = rndp.x;
    player.y = rndp.y;
    Print(player);
}

void Play(){
    do {
        Move();
    } while(!gameOver);
    
    free(map);
    sPrint("You've lost!", HEIGHT/2, WIDTH/2-6);
}

void Move(){
    switch(getch()){
        case 77: //right key
            if (CanMove(player.x, player.y + 1)){
                cPrint(' ', player.x, player.y);
                player.y++;
                Print(player);
                CheckForCollisions();
            }
        break;
        case 75: //left key
            if (CanMove(player.x, player.y - 1)){
                cPrint(' ', player.x,player.y);
                player.y--;
                Print(player);
                CheckForCollisions();
            }
            break;
        case 72: //up key
            if (CanMove(player.x - 1, player.y)){
                cPrint(' ', player.x,player.y);
                player.x--;
                Print(player);
                CheckForCollisions();
            }
            break;
        case 80: //down key
            if (CanMove(player.x + 1, player.y)){
                cPrint(' ', player.x,player.y);
                player.x++;
                Print(player);
                CheckForCollisions();
            }
            break;
    }
}

bool CanMove(int x, int y){
    return x >= 0 && y >= 0 && x < HEIGHT && y < WIDTH;
}

void CheckForCollisions(){
    if (map[player.x * WIDTH + player.y] == coin.c){
        map[player.x * WIDTH + player.y] = ' ';
        UpdateScore();
    }
        
    else if(map[player.x * WIDTH + player.y] == bomb.c){
        gameOver = true;
    }
}

void UpdateScore(){
    score++;
    char sscore[20];
    itoa(score,sscore, 10);
    sPrint(sscore, HEIGHT, 12);
}

int main(int argc, char *argv[]) {
    Setup(50,20);
    Play();
    getch();
    return 0;
}