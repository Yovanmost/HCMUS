#include <iostream>
#include <string>
#include <fstream>
#include <windows.h>

using namespace std;

void SetPosition(int16_t X, int16_t Y){
    HANDLE Screen;
    Screen = GetStdHandle(STD_OUTPUT_HANDLE);
    COORD Position = { Y, X };
    SetConsoleCursorPosition(Screen, Position);
}

// x = i*3
// y = j*6
void drawBlank(int x, int y){
    fstream fin;
    string line;
    int skipRows = x * 3;
    int lenRow = 3;
    int posCols = y * 6;
    int lenCol = 6;
    fin.open("Test.txt", ios::in);
    int count = 0;
    // skip rows
    
    while (skipRows != 0){
        getline(fin, line);
        skipRows--;
    }
    
    // read rows
    while (count != lenRow){
        getline(fin, line);
        SetPosition(skipRows++, posCols);
        cout << line.substr(posCols, lenCol) << '\n';
        count++;
    }
    fin.close();
}

// read rows that are not needed (coordinate row)
// find the starting row (coordinate = x) (count++)
// read character in the row that are not needed (substring) line.substr(pos, length)
// keeps reading the row (count = i)

int main(){
    fstream fin;
    string line;
    int x, y;
    cin >> x >> y;
    system("cls");
    drawBlank(x, y);
    return 0;
}