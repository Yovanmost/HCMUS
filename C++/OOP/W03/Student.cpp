#include "Student.h"

Student::Student() : studentId("null"), grade(0), fullname("null"){

}

Student::Student(std::string studentID, double grade, std::string fullName) : studentId(studentID), grade(grade), fullname(fullName){
    // this->studentId = studentID;
    // this->grade = grade;
    // this->fullname = fullName;
}

Student::~Student(){
    
}

Student& Student::operator=(const Student &p){
    if (this == &p)
        return *this;
    this->studentId = p.studentId;
    this->grade = p.grade;
    this->fullname = p.fullname;
    return *this;
}


std::istream& operator>>(std::istream& in, Student& p){

    std::cout << "Input Student ID: ";
    getline(in, p.studentId);

    std::cout << "Input grade: ";
    in >> p.grade;
    in.ignore();

    std::cout << "Input Full name: ";
    getline(in, p.fullname);

    return in;
}


std::ostream& operator<<(std::ostream& out, const Student& p){
    if (p.studentId == "null" && p.grade == 0 && p.fullname == "null"){
        std::cout << "Empty student!\n";
        return out;
    }

    out << "Student ID: " << p.studentId << '\n';
    out << "Student's gpa: " << p.grade << '\n';
    out << "Student's full name: " << p.fullname << '\n';

    return out;
}

std::string Student::getStudentID(){
    return studentId;
}

void Student::setStudentID(std::string studentId){
    this->studentId = studentId;
}

double Student::getGrade(){
    return grade;
}

void Student::setGrade(double grade){
    this->grade = grade;
}

std::string Student::getFullName(){
    return fullname;
}

void Student::setFullName(std::string fullname){
    this->fullname = fullname;
}