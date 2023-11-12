#include <iostream>
#include <string>
#include <fstream>

using namespace std;


void compare(ifstream &fr1, ifstream &fr2){
    string tmp1, tmp2;
    int lines = 0;
    while (!fr1.eof() && !fr2.eof()){
        lines++;
        getline(fr1, tmp1);
        getline(fr2, tmp2);
        if (tmp1 != tmp2){
            cout << lines << " // " << tmp1 << '\n';
            cout << lines << " \\\\ " << tmp2 << '\n';
        }   
    } 
    if (fr1.eof() && fr2.eof())
        return;
    if (fr1.eof())
        while (!fr2.eof()){
            lines++;
            getline(fr2, tmp2);
            cout << lines << " // " << '\n';
            cout << lines << " \\\\ " << tmp2 << '\n';
        }
    else if (fr2.eof())
        while (!fr1.eof()){
            lines++;
            getline(fr1, tmp1);
            cout << lines << " // " << tmp1 << '\n';
            cout << lines << " \\\\ " << '\n';
        }
}

int main(){
    string tmp;
    ifstream fr1, fr2;
    fr1.open("input1.4.1.txt");
    fr2.open("input1.4.2.txt");
    compare(fr1, fr2);
    fr1.close();
    fr2.close();
    return 0;
}