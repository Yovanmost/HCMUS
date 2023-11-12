// Công Tuấn
// Nguyễn Công Tuấn
// #pragma once
#include <iostream>
#include <cstring>
using namespace std;

class Student
{
    private:
        char* studentID;
        double gpa;
        char* fullname;
        char* address;
    public:
        Student() {studentID = nullptr, gpa = 0, fullname = nullptr, address = nullptr;}
        Student(const char*, double, const char*, const char*); 
        Student(const Student&);
        ~Student() {delete[] studentID, delete[] fullname, delete[] address;}

        friend ostream& operator << (ostream&, const Student&);
        friend istream& operator >> (istream&, Student&);
};

Student::Student(const char* ID, double score, const char* name, const char* addr)
{
    this->studentID = new char[strlen(ID) + 1];
    strcpy(this->studentID, ID);

    this->gpa = score;

    this->fullname = new char[strlen(name) + 1];
    strcpy(this->fullname, name);

    this->address = new char[strlen(addr) + 1];
    strcpy(this->address, addr);
}  

// Student::Student(const char* ID, double score, const char* name, const char* addr) : studentID(new char[]), gpa(score), fullname(name), address(addr){
    
// }

Student::Student(const Student& other)
{
    this->studentID = new char[strlen(other.studentID) + 1];
    strcpy(this->studentID, other.studentID);

    gpa = other.gpa;

    this->fullname = new char[strlen(other.fullname) + 1];
    strcpy(this->fullname, other.fullname);

    this->address = new char[strlen(other.address) + 1];
    strcpy(this->address, other.address);
}

ostream& operator << (ostream& out, const Student& other)
{
    if (other.studentID == nullptr && other.gpa == 0 && other.fullname == nullptr && other.address == nullptr)
    {
        cout << "Empty student!\n\n";
        return out;
    }
    out << "ID: " << other.studentID << endl;
    out << "GPA: " << other.gpa << endl;
    out << "Full name: " << other.fullname << endl;
    out << "Address: " << other.address << endl;
    return out;
}

istream& operator >> (istream& in, Student& other) {
    char ID[256];
    double gpa;
    char name[256];
    char addr[256];

    cout << "Input Student ID: ";
    in.getline(ID, 100);

    cout << "Input GPA: ";
    in >> gpa;
    in.ignore();

    cout << "Input Full name: ";
    in.getline(name, 100);

    cout << "Input Address: ";
    in.getline(addr, 100);

    cout << ID << '\n'
        << gpa << '\n' 
        << name << '\n'
        << addr << '\n';

    // delete[] other.studentID;
    // delete[] other.fullname;
    // delete[] other.address;

    other = Student(ID, gpa, name, addr);

    return in;
}

int main()
{
    // BÀI 4
    cout << "\nBai 4 --------------- \n";
    Student student1;
    Student student2("22127436", 8.0, "Nguyen Cong Tuan", "123 Main01 stress");

    cout << "Student 1\n" << student1;
    cout << "Student 2\n" << student2;

    Student student3, student4;
    cout << "\nInput information of student 3\n";
    cin >> student3;
    // cout << "\nInput information of student 4\n";
    // cin >> student4;
    cout << "\nStudent 3\n" << student3;
    // cout << "\nStudent 4\n" << student4;

    int k;
    cout << "\n\nPress any key to end the program\n";
    cin >> k;

    return 0;
}

