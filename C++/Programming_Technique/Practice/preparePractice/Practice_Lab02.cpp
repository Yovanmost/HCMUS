#include <iostream>
#include <string>
#include <vector>
#include <fstream>

using namespace std;

struct PLAYER
{
    string pos;
    string name;
    string year;
    string club;
};

struct STUDENT
{
    // string name;
    char name[6];
    // string math, literature;
    char math[6];
    char literature[6];
};


int main(){
    // open file
    ifstream fr;
    fr.open("Test.txt");

    if (fr.is_open() == false){
        cout << "Can't open file";
        return 0;
    }

    // store the list of players
    // vector<PLAYER> listPlayer;
    // PLAYER playerTemp;

    vector<STUDENT> listStudent;
    STUDENT tmpStudent;

    string ignoreFirstLine = "";
    getline(fr, ignoreFirstLine);

    // while (fr.eof() == false){
    //     getline(fr, tmpStudent.name, ';');
    //     getline(fr, tmpStudent.math, ';');
    //     getline(fr, tmpStudent.literature, '\n');

    //     listStudent.push_back(tmpStudent);
    // }

    while (fr.eof() == false){
        fr.getline(tmpStudent.name, 6,';');
        fr.getline(tmpStudent.math, 6,';');
        fr.getline(tmpStudent.literature, 6,'\n');

        listStudent.push_back(tmpStudent);
    }

    fr.close();

    ofstream fw;
    fw.open("TestRes.txt");

    if (fw.is_open() == false){
        cout << "Cant open";
        return 0;
    }

    for (int i = 0; i < listStudent.size(); i++){
        fw << listStudent[i].name << ":";
        fw << listStudent[i].math << " - " << listStudent[i].literature << "\n";
    }

    fw.close();

    return 0;
}