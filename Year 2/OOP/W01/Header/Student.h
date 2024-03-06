#ifndef STUDENT_H
#define STUDENT_H

#pragma once
#include <iostream>

class Student{
private:
    double mathGrade;
    double englishGrade;
    double programmingGrade;
public:
    Student();
    Student(double, double, double);
    ~Student();
    void setMathGrade(double);
    void setEnglishGrade(double);
    void setProgrammingGrade(double);
    double avgGrade();
    bool isAllAround();
    void input();
    void output();

};

#endif