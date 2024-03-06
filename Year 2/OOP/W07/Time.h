#ifndef TIME_H
#define TIME_H

#pragma once
#include <exception>

class TimeFormatException : public std::exception{
public:
    const char* what() const throw() {
        return "Error: Wrong Time format";
    }
};

class Time{
public:
    int hour;
    int minute;
    int second;

    Time();
    Time(int h, int m, int s) : hour(h), minute(m), second(s){
        check();
    }
    ~Time();



private:
    void check(){
        if (hour < 0 || hour > 23 || minute < 0 || minute > 59 || second < 0 || second > 59)
            throw TimeFormatException();
    }
};



#endif