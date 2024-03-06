#include <iostream>

using namespace std;

// No.1
struct DATE{
    short day;
    short month;
    int year;
};

int checkLeapYear(int a){
    if ((a % 400 == 0) || (a % 4 == 0 && a % 100 != 0))
        return 1;
    return 0;
}

int checkDate(DATE a){
    if (a.month > 12 || a.month <= 0)
        return 0;
    if (a.day > 31 || a.day <= 0)
        return 0;
    if (a.year <= 0)
        return 0;

    if (a.month == 1 || a.month == 3 || a.month == 5 || a.month == 7 || a.month == 8 || a.month == 10 || a.month ==  12)
        if (a.day > 31)
            return 0;
    
    if (a.month == 4 || a.month == 6 || a.month == 9 || a.month == 11 )
        if (a.day > 30)
            return 0;

    if (a.month == 2){
        if (checkLeapYear(a.year) == 0 && a.day > 28)
            return 0;
        else if (checkLeapYear(a.year == 1) && a.day > 29)
            return 0;
    }
    return 1;
}

// No.2
bool checkBrickLayers(int l, int n, int m){
    int layerBrick = n +m*5;
    if (layerBrick - l >= 0)
        return true;
    return false;
}

// No.3
void delArr(int a[], int& n, int pos){
    for (int i = pos; i < n-1; i++)
        a[i] = a[i+1];
    n--;
}

void delRepeatNum(int a[], int& n){
    for (int i = 0; i < n-1; i++){
        for (int j = i + 1; j < n; j++){
            if (a[i] == a[j])
                delArr(a, n, j);
        }
    }
}

// No.4
void printMultiply(int n){
    for (int i = 1; i < 10; i++){
        for (int j = 2; j < 6; j++){
            cout << j << " x " << i << " = " << j*i << "\t";
        }
        cout << "\n";
    }

    cout << "\n";
    for (int i = 1; i < 10; i++){
        for (int j = 6; j < 10; j++){
            cout << j << " x " << i << " = " << j*i << "\t";
        }
        cout << "\n";
    }
}

int main(){
    // DATE a;
    // cin >> a.day >> a.month >> a.year;
    // cout << checkDate(a);

    // if (checkBrickLayers(10, 3, 2) == true)
    //     cout << "1";
    // else cout << "0";

    // int n = 6;
    // int a[n] = {3, 7, 3, 5, 6, 5};
    // for (int i = 0; i < n; i++)
    //     cout << a[i] << " ";

    // cout << "\n";
    // delRepeatNum(a, n);

    // for (int i = 0; i < n; i++)
    //     cout << a[i] << " ";
   
    // int n = 6;
    // printMultiply(n);

    return 0;   
}