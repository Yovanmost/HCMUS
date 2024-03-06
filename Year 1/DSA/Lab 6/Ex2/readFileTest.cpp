#include <iostream>
#include <string>
#include <fstream>

using namespace std;

struct Student{
    string code;
    string name;
    string birthday;
    bool status;
};

void printStudent(Student st){
    cout << st.code << "|"
        << st.name << "|"
        << st.birthday << "|"
        << st.status << '\n';
}

void readFile(string s){
    ifstream fr;
    fr.open(s);
    int numberOfStudent;
    fr >> numberOfStudent;
    fr.ignore();
    for (int i = 0; i < numberOfStudent; i++){
        Student st;
        getline(fr, st.code);
        getline(fr, st.name);
        getline(fr, st.birthday);
        fr >> st.status;
        fr.ignore();
        printStudent(st);
    }

}

int main(){
    string s = "student.txt";
    readFile(s);
    

    return 0;
}