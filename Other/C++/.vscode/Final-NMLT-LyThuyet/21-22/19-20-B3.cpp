#include <iostream>
#include <string>
#include <string.h>

using namespace std;

void turn2dArrIntoString(float a[][4], int mRow, int nCol, char s[]){
    for (int i = 0; i < mRow; i++)
        for (int j = 0; j < nCol; j++){
            strcat(s, to_string(a[i][j]).c_str());
            strcat(s, " \0");
        }
            
}

int main(){
    float a[3][4] = {   {123, 4.56, 7.8, 9},
                        {0.1, 2.34, 5.6, 78.9},
                        {0.12, -3.4, -5, 67.89}};
    char s[256] = "\0";
    turn2dArrIntoString(a, 3, 4, s);
    cout << s;

    

    return 0;
}
