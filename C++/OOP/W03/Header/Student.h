#ifndef STUDENT_H
#define STUDENT_H

#pragma once
#include <iostream>
#include <string>

// using namespace std;

class Student{
private:
    std::string studentId;
    double grade;
    std::string fullname;
public:
    Student();
    Student(std::string, double, std::string);
    ~Student();

    Student& operator=(const Student &p);

    friend std::istream& operator>>(std::istream&, Student& p);
    friend std::ostream& operator<<(std::ostream&, const Student& p);
    

    std::string getStudentID();
    void setStudentID(std::string);

    double getGrade();
    void setGrade(double);  

    std::string getFullName();
    void setFullName(std::string);
      
    
};

#endif