#include <iostream>
#include <fstream>
#include <string>
#include <sstream>
#include <windows.h>

using namespace std;

void SetPosition(int16_t X, int16_t Y){
    HANDLE Screen;
    Screen = GetStdHandle(STD_OUTPUT_HANDLE);
    COORD Position = { Y, X };
    SetConsoleCursorPosition(Screen, Position);
}

void drawBackGround(string s){
    fstream fi;
    string line;
    fi.open(s);
    int count = 0;
    system("cls");
    if (fi.is_open()){
        SetPosition(0, 0);
        while (getline(fi,line)){
            count++;
            cout << line << '\n';
            if (count % 24 == 0){
                SetPosition(0, 0);
                Sleep(500);
            }
        }
        fi.close();
    } else cout << "Unable to open file"; 
}

void drawBackGroundV2(){
    string s = "Ascii_Art/Earth.txt";
    fstream fi;
    string line;
    fi.open(s);
    int count = 0;
    system("cls");
    if (fi.is_open()){
        SetPosition(0, 0);
        while (getline(fi,line)){
            count++;
            cout << line << '\n';
            if (count % 24 == 0){
                SetPosition(0, 0);
                Sleep(50);
            }
        }
        fi.close();
    } else cout << "Unable to open file"; 
}

int main(){
    string s;
    // getline(cin, s); 
    while(true){
        drawBackGroundV2();
    }
    // drawBackGround(s);

    return 0;
}