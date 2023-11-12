#ifndef COURSE_H
#define COURSE_H

#pragma once
#include <string>
#include <vector>
#include <fstream>
#include "Student.h"
#define EXCELLENT 0
#define GOOD 1
#define DECENT 2
#define AVERAGE 3
#define BELOW_AVG 4
#define ALL 5
#define PASS 5
#define NOT_PASS 4
#define ASCEND 0
#define DESCEND 1

class Course : public Student{
private:
    std::string courseID;
    std::string courseName;
    std::vector<Student> listOfStudent;

public:
    Course();
    Course(std::string, std::string);
    ~Course();

    void enroll(Student);
    void enroll(std::vector<Student>);
    void enroll();

    void unEnroll(std::string);
    void unEnroll(std::vector<Student>);
    void unEnroll();
    int findID(std::string);
    
    void showList(int);
    void showList();
    
    int numberOfPassOrNot(int);
    
    void sortByName(int);
    void sortByGrade(int);

    void saveFile();
    void loadFile(std::string);
};

#endif