#include <iostream>
#include <string.h>
#define MAXELE 10

using namespace std;


//  mxn
//  0   1   2
//  0   1   2
//  0   1   2

void inArr(char a[][MAXELE], int& mRow, int& nCol){
    cin >> mRow >> nCol;
    cin.ignore();
    for (int i = 0; i < mRow; i++)
        for (int j = 0; j < nCol; j++)
            cin >> a[i][j];
}

void outArr(char a[][MAXELE], int mRow, int nCol){
    for (int i = 0; i < mRow; i++){
        for (int j = 0; j < nCol; j++)
            cout << a[i][j] << " ";
        cout << "\n";
    }      
}

void findFirst(char a[][MAXELE], int mRow, int nCol, char* find, int posI, int posJ){
    cin >> posI >> posJ;
    cin.ignore();
    cin >> find;
    int lenFind = strlen(find);
    int flag = 0;

    // from up to down
    for (int i = posI, tmp = 0; i < mRow; i++, tmp++){
        if (find[tmp] == 0)
            break;
        if (a[i][posJ] != find[tmp]){
            flag = 0;
            break;
        }else{
            flag = 1;
            cout << a[i][posJ];
        } 
    }
    if (flag == 1){
        cout << flag;
        return;
    }

    // from left to right
    for (int j = posJ, tmp = 0; j < nCol; j++, tmp++){
        if (find[tmp] == 0)
            break;
        if (a[posI][j] != find[tmp]){
            flag = 0;
            break;
        }else{
            flag = 1;
            cout << a[posI][j];
        } 
    }
    if (flag == 1){
    cout << flag;
        return;
    }

    // diagonal from left to right
    for (int i = posI, tmp = 0; i < mRow; i++, tmp++){
        if (find[tmp] == 0)
            break;
        if (a[i][posJ] != find[tmp]){
            flag = 0;
            break;
        }else{
            flag = 1;
            cout << a[i][posJ++]; //posJ++ is to move 1 step to the right
        } 
    }
    cout << flag;
}

int main(){
    int m, n;
    char a[MAXELE][MAXELE];
    inArr(a, m, n);
    outArr(a, m, n);

    char* text;
    int x, y;
    findFirst(a, m, n, text, x, y);
    return 0;
}