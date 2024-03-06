#include "Course.h"

Course::Course() : courseID("null"), courseName("null"), listOfStudent() {

}

Course::Course(std::string courseID, std::string courseName) : courseID(courseID), courseName(courseName), listOfStudent() {

}

Course::~Course(){

}

void Course::enroll(Student s){
    listOfStudent.push_back(s);
}

void Course::enroll(std::vector<Student> list){
    listOfStudent.insert(std::end(listOfStudent), std::begin(list), std::end(list));
}

void Course::enroll(){
    std::cout << "Enter number of students to enroll: ";
    int n;
    std::cin >> n;
    std::cin.ignore();
    Student tmp;
    for (int i = 0; i < n; i++){
        std::cout << "Input student no " << i+1 << '\n';
        std::cin >> tmp;
        listOfStudent.push_back(tmp);
    }
}

int Course::findID(std::string id){
    for (int i = 0; i < listOfStudent.size(); i++)
        if (id == listOfStudent[i].getStudentID())
            return i;
    return -1;
}

void Course::unEnroll(std::string id){
    int idex = findID(id);
    if (idex != -1)
        listOfStudent.erase(listOfStudent.begin() + idex);
    return;
}

void Course::unEnroll(std::vector<Student> list){
    for (int i = 0; i < list.size(); i++){
        unEnroll(list[i].getStudentID());
    }
}

void Course::unEnroll(){
    std::cout << "Enter number of students to unenroll: ";
    int n;
    std::cin >> n;
    std::cin.ignore();
    std::string tmp;
    for (int i = 0; i < n; i++){
        std::cout << "Input studentID no" << i+1 << " :";
        std::getline(std::cin, tmp);
        int idex = findID(tmp);
        if (idex == -1)
            continue;
        else listOfStudent.erase(listOfStudent.begin() + idex);
    }
}

int judge(Student s){
    if (s.getGrade() >= 9)
        return EXCELLENT;
    if (s.getGrade() >= 8)
        return GOOD;
    if (s.getGrade() >= 6.5)
        return DECENT;
    if (s.getGrade() >= 5)
        return AVERAGE;
    else return BELOW_AVG;
}

void Course::showList(int option){
    for (int i = 0; i < listOfStudent.size(); i++)
        if (judge(listOfStudent[i]) == option)
            std::cout << "\n---------\n" << listOfStudent[i];
}

void Course::showList(){
    for (int i = 0; i < listOfStudent.size(); i++)
            std::cout << "\n---------\n" << listOfStudent[i];
}

int Course::numberOfPassOrNot(int option){
    int op;
    for (int i = 0; i < listOfStudent.size(); i++)
    if (option == PASS)
        if (judge(listOfStudent[i]) > NOT_PASS)
            std::cout << listOfStudent[i] << '\n';
    else 
        if (judge(listOfStudent[i]) == NOT_PASS)
            std::cout << listOfStudent[i] << '\n';
}

bool compareBigger(std::string a, std::string b){
    return a > b;
}

bool compareSmaller(std::string a, std::string b){
    return a < b;
}

void Course::sortByName(int option){
    for (int i = 0; i < listOfStudent.size() - 1; i++)
        for (int j = i+1; j < listOfStudent.size(); j++)
            if (option == ASCEND){
                if (compareSmaller(listOfStudent[j].getFullName(), listOfStudent[i].getFullName()))
                    std::swap(listOfStudent[j], listOfStudent[i]);
            }
            else if (option == DESCEND){
                if (compareBigger(listOfStudent[j].getFullName(), listOfStudent[i].getFullName()))
                    std::swap(listOfStudent[j], listOfStudent[i]);
            }
                
}

void Course::sortByGrade(int option){
    for (int i = 0; i < listOfStudent.size() - 1; i++)
        for (int j = i+1; j < listOfStudent.size(); j++)
            if (option == ASCEND){
                if (listOfStudent[j].getGrade() < listOfStudent[i].getGrade())
                    std::swap(listOfStudent[i], listOfStudent[j]);
            }
            else if (option == DESCEND){
                if (listOfStudent[j].getGrade() > listOfStudent[i].getGrade())
                    std::swap(listOfStudent[i], listOfStudent[j]);
            }
                
}

void Course::saveFile(){
    std::ofstream fw;
    std::string fileName = courseName + "_course.txt";
    fw.open(fileName);
    fw << courseID << '\n';
    fw << courseName << '\n';
    
    for (int i = 0; i < listOfStudent.size() - 1; i++){
        fw << listOfStudent[i].getStudentID() << '\n'
            << listOfStudent[i].getGrade() << '\n'
            << listOfStudent[i].getFullName() << '\n';
    }

    fw << listOfStudent[listOfStudent.size() - 1].getStudentID() << '\n'
            << listOfStudent[listOfStudent.size() - 1].getGrade() << '\n'
            << listOfStudent[listOfStudent.size() - 1].getFullName();
        
    
    fw.close();
}

void Course::loadFile(std::string fileName){
    std::ifstream fr;
    fr.open(fileName);
    // fr >> courseID;
    // fr >> courseName;

    std::getline(fr, courseID);
    std::getline(fr, courseName);

    std::string tmpID, tmpName;
    double tmpGrade;
    
    while (!fr.eof()){
        
        // fr >> tmpGrade;
        
        // Student tmp(tmpID, tmpGrade, tmpName);
        // listOfStudent.push_back(tmp);
        // fr >> tmpID;

        std::getline(fr, tmpID);
        // std::cout << tmpID;
        fr >> tmpGrade;
        fr.ignore();
        // std::cout << tmpGrade;
        getline(fr, tmpName);
        // fr >> tmpName;
        // std::cout << tmpName;
        Student tmp(tmpID, tmpGrade, tmpName);
        std::cout << "\n---------\n" << tmp;
        // listOfStudent.push_back(tmp);
    }
    fr.close();
}
