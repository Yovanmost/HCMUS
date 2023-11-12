#include "Date.h"

Date::Date(){

}

Date::~Date(){

}


// void Date::input(){
//     std::cout << "Day: ";
//     std::cin>> this->day;
//     std::cout << "Month: ";
//     std::cin >> this->month;
//     std::cout << "Year: ";
//     std::cin >> this->year;
// }

void Date::input(int day, int month, int year){
    this->day = day;
    this->month = month;
    this->year = year;
}

void Date::output(){
    std::cout << day << "/" << month << "/" << year << '\n';
}

void Date::increaseOneDay(){
    day++;
    if (day > GetDaysInMonth(month, year)){
        day = 1;
        month++;
    }
        
    if (month > 12){
        year++;
        month = 1;
    }
}

void Date::increaseNDays(int n){
    for (int i = 0; i < n; i++)
        increaseOneDay();
}

void Date::decreaseOneDay(){
    day--;

    if (day < 1){
        month--;
        if (month < 1){
            month = 12;
            year--;
        }
            
        day = GetDaysInMonth(month, year);
    }
}

void Date::decreaseNDays(int n){
    for (int i = 0; i < n; i++)
        decreaseOneDay();
}

int Date::compare(Date other){
    if (year < other.year)
        return -1;
    else if (year > other.year)
        return 1;

    if (month < other.month)
        return -1;
    else if (month > other.month)
        return 1;

    if (day < other.day)
        return -1;
    else if (day > other.day)   
        return 1;

    return 0;
}
