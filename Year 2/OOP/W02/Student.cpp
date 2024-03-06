#include "Student.h"

Student::Student() : studentID(nullptr), gpa(0), fullname(nullptr), address(nullptr){

}

Student::Student(const char* studentID, double gpa, const char* fullname, const char* address)
{
    this->studentID = new char[strlen(studentID) + 1];
    strcpy(this->studentID, studentID);

    this->gpa = gpa;

    this->fullname = new char[strlen(fullname) + 1];
    strcpy(this->fullname, fullname);

    this->address = new char[strlen(address) + 1];
    strcpy(this->address, address);
}  

Student::Student(const Student& p)
{
    this->studentID = new char[strlen(p.studentID) + 1];
    strcpy(this->studentID, p.studentID);

    gpa = p.gpa;

    this->fullname = new char[strlen(p.fullname) + 1];
    strcpy(this->fullname, p.fullname);

    this->address = new char[strlen(p.address) + 1];
    strcpy(this->address, p.address);
}

Student::~Student(){
    delete[] studentID;
    delete[] fullname; 
    delete[] address;
}

Student& Student::operator=(const Student &p){
    if (this == &p)
        return *this;

    this->studentID = new char[strlen(p.studentID) + 1];
    strcpy(this->studentID, p.studentID);

    gpa = p.gpa;

    this->fullname = new char[strlen(p.fullname) + 1];
    strcpy(this->fullname, p.fullname);

    this->address = new char[strlen(p.address) + 1];
    strcpy(this->address, p.address);

    return *this;
}

std::ostream& operator<<(std::ostream& out, const Student& p)
{
    if (p.studentID == nullptr && p.gpa == 0 && p.fullname == nullptr && p.address == nullptr){
        std::cout << "Empty student!\n\n";
        return out;
    }

    out << "Student ID: " << p.studentID << '\n';
    out << "Student's gpa: " << p.gpa << '\n';
    out << "Student's full name: " << p.fullname << '\n';
    out << "Student's address: " << p.address << '\n';

    return out;
}

std::istream& operator>>(std::istream& in, Student& p) {
    char studentID[MAX_CHAR];
    double gpa;
    char fullname[MAX_CHAR];
    char address[MAX_CHAR];

    std::cout << "Input Student ID: ";
    in.getline(studentID, MAX_CHAR);

    std::cout << "Input GPA: ";
    in >> gpa;
    in.ignore();

    std::cout << "Input Full name: ";
    in.getline(fullname, MAX_CHAR);

    std::cout << "Input Address: ";
    in.getline(address, 100);

    delete[] p.studentID;
    delete[] p.fullname;
    delete[] p.address;

    p = Student(studentID, gpa, fullname, address);

    return in;
}