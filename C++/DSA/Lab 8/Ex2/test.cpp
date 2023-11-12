#include <iostream>
#include <cstring>
#include <fstream>
#define SIZE 256

using namespace std;

void readFile(char fileName[]){
    ifstream fr;
    fr.open(fileName);
    ofstream fw;
    fw.open("word_bank_v3.txt");
    char tmpEng[SIZE];
    char tmpVN[SIZE];
    while (!fr.eof()){
        fr.getline(tmpEng, SIZE, ',');
        fr.getline(tmpVN, SIZE, '\n');
        if (tmpEng[0] >= 'A' && tmpEng[0] <= 'Z')
            tmpEng[0] = tmpEng[0] + ('a' - 'A');
        cout << tmpVN << ": " << tmpEng << '\n';
        fw << tmpEng << ',' << tmpVN << '\n';
    }
    fr.close();
    fw.close();
}

int main(){
    char s[] = "word_bank_v2.txt";
    readFile(s);
    

    return 0;
}