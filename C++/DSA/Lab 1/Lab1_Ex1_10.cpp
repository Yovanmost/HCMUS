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

void readFile(){
    ifstream fr;
    fr.open("output1.9.bin", ios::binary);
    int n;
    fr.read(reinterpret_cast<char*>(&n), sizeof(n));
    Student list[n];
    fr.read(reinterpret_cast<char*> (&list), sizeof(list));
    for (int i = 0; i < n; i++){
        cout << i+1 << '.';
        cout << list[i].fullName << '\t'
            << list[i].ID << '\t'
            << list[i].address << '\t'
            << list[i].dateOfBirth.day << '/' << list[i].dateOfBirth.month << '/' << list[i].dateOfBirth.year << '\t'
            << list[i].schoolClass << '\n';
    }
    fr.close();
}
int main(){
    readFile();

    return 0;
}