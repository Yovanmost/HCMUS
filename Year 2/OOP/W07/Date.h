#ifndef DATE_H
#define DATE_H

#pragma once
#include <exception>

class DateFormatException : public std::exception{
public:
    const char* what() const throw() {
        return "Error: Wrong Date format";
    }
};

class Date{
public:
    int day;
    int month;
    int year;

    Date();
    Date(int day, int month, int year) : day(day), month(month), year(year){
        check();
    }
    ~Date();

    int getDaysInMonth(int m, int y);

private:
    void check(){
        if (day < 1 || month < 1 || month > 12 || year < 0 || day > getDaysInMonth(month, year)){
            throw DateFormatException();
        }
    }
};




#endif