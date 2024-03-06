#include "Student.h"

Student::Student(){

}

Student::Student(double mathGrade, double englishGrade, double programmingGrade){
    this->mathGrade = mathGrade;
    this->englishGrade = englishGrade;
    this->programmingGrade = programmingGrade;
    
}

Student::~Student(){

}

void Student::setMathGrade(double mathGrade){
    this->mathGrade = mathGrade;
}

void Student::setEnglishGrade(double englishGrade){
    this->englishGrade = englishGrade;
}

void Student::setProgrammingGrade(double programmingGrade){
    this->programmingGrade = programmingGrade;
}

double Student::avgGrade(){
    return (mathGrade + englishGrade + programmingGrade)/3;
}

bool Student::isAllAround(){
    return (mathGrade >= 6.5 && englishGrade >= 6.5 && programmingGrade >= 6.5) &&
            (avgGrade() >= 8);

}

void Student::input(){
    double math, english, programming;
    std::cout << "Math grade: ";
    std::cin >> math;
    setMathGrade(math);
    std::cout << "English grade: ";
    std::cin >> english;
    setEnglishGrade(english);
    std::cout << "Programming grade: ";
    std::cin >> programming;    
    setProgrammingGrade(programming);
}

void Student::output(){
    std::cout << "Math: " << mathGrade
            << " English: " << englishGrade
            << " Programming: " << programmingGrade << "\n";
    std::cout << "Average grade: " << avgGrade() << '\n';
    if (isAllAround())
        std::cout << "This is an all around student\n";
    else std::cout << "Nah";
}