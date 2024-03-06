#include <iostream>
#include <string>
#include <fstream>
#define SIZE 256

using namespace std;

struct Birthday{
    unsigned short day, month, year;
};

struct Student{
    char fullName[SIZE];
    Birthday dateOfBirth;
    char address[SIZE];
    char schoolClass[SIZE];
    unsigned int ID;
};

void menu(){
    ofstream fw;
    fw.open("output1.9.bin", ios::binary);
    char k;
    int n;
    cout << "Number of students: ";
    cin >> n;
    cin.ignore();
    fw.write(reinterpret_cast<char*> (&n), sizeof(n));
    Student list[n];
    for (int i = 0; i < n; i++){
        cout << "Name: ";       cin.getline(list[i].fullName, SIZE, '\n');
        cout << "ID: ";         cin >> list[i].ID;  cin.ignore();
        cout << "Address: ";    cin.getline(list[i].address, SIZE, '\n');
        cout << "Birthday\n";   
            cout << "\tDay: ";      cin >> list[i].dateOfBirth.day;
            cout << "\tMonth: ";    cin >> list[i].dateOfBirth.month;
            cout << "\tYear: ";     cin >> list[i].dateOfBirth.year;
        cin.ignore();
        cout << "Class: ";      cin.getline(list[i].schoolClass, SIZE, '\n');
    }
    for (int i = 0; i < n; i++){
        cout << list[i].fullName << '\t'
            << list[i].ID << '\t'
            << list[i].address << '\t'
            << list[i].dateOfBirth.day << '/' << list[i].dateOfBirth.month << '/' << list[i].dateOfBirth.year << '\t'
            << list[i].schoolClass << '\n';
    }
    fw.write(reinterpret_cast<char*>(&list), sizeof(list));
    fw.close();
}


int main(){
    menu();

    return 0;
}