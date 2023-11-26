#include <iostream>
#include <string>
#include "Date.h"
#include "Date.cpp"
#include "Time.h"
#include "Time.cpp"

using namespace std;

void demo5(){
    int d,m,y;

    try{
        cout << "5. DateFormatException\n";
        cout << "Input day: ";
        cin >> d;
        cout << "Input month: ";
        cin >> m;
        cout << "Input year: ";
        cin >> y;
        Date theDay(d, m, y);
        cout << theDay.day << '/' << theDay.month << '/' << theDay.year << '\n';
    }
    catch(const DateFormatException& e){
        std::cerr << e.what() << '\n';
    }    
    cin.ignore();
}

void demo6(){
    int s,m,h;

    try{
        cout << "6. TimeFormatException\n";
        cout << "Input second: ";
        cin >> s;
        cout << "Input minute: ";
        cin >> m;
        cout << "Input hour: ";
        cin >> h;
        Time t(s,m,h);
        cout << t.second << ':' << t.minute << ':' << t.hour << '\n';
    }
    catch(const TimeFormatException& e){
        std::cerr << e.what() << '\n';
    }
    cin.ignore();
}

int main(){
    // Bai 5
    demo5();

    // Bai 6
    demo6();
    


    return 0;
}