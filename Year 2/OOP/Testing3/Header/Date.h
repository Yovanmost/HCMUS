#ifndef DATE_H
#define DATE_H

#pragma once
#include <iostream>

class Date{
private:
    int day;
    int month;
    int year;

private:
    int GetDaysInMonth(int m, int y){
        switch (m) {
            case 4: case 6: case 9: case 11:
                return 30;
            case 2:
                if ((y % 4 == 0 && y % 100 != 0) || (y % 400 == 0))
                    return 29;
                else
                    return 28;
            default:
                return 31;
        }
    }

public:
    Date();
    ~Date();
    void input();
    void output();

    void increaseOneDay();
    void increaseNDays(int);
    void decreaseOneDay();
    void decreaseNDays(int);
    int compare(Date);
  

};

#endif