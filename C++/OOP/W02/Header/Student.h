#ifndef STUDENT_H
#define STUDENT_H

#pragma once
#include <iostream>
#include <cstring>
#define MAX_CHAR 256

class Student{
private:
    char* studentID;
    double gpa;
    char* fullname;
    char* address;
public:
    Student();
    Student(const char*, double, const char*, const char*); 
    Student(const Student&);
    ~Student();

    Student& operator=(const Student &p);
    friend std::ostream& operator<<(std::ostream&, const Student&);
    friend std::istream& operator>>(std::istream&, Student&);
};

#endif

// int main()
// {
//     // BÀI 4
//     cout << "\nBai 4 --------------- \n";
//     Student student1;
//     Student student2("22127436", 8.0, "Nguyen Cong Tuan", "123 Main01 stress");

//     cout << "Student 1\n" << student1;
//     cout << "Student 2\n" << student2;

//     Student student3, student4;
//     cout << "\nInput information of student 3\n";
//     cin >> student3;
//     // cout << "\nInput information of student 4\n";
//     // cin >> student4;
//     cout << "\nStudent 3\n" << student3;
//     // cout << "\nStudent 4\n" << student4;

//     int k;
//     cout << "\n\nPress any key to end the program\n";
//     cin >> k;

//     return 0;
// }