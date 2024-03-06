#include <iostream>
#include <string>
#include <fstream>

using namespace std;

string findLongestWorkingDuration(string fileName){
    ifstream fr;
    fr.open(fileName);

    if (fr.is_open() == false){
        cout << "Can't open file (fr)";
        return 0;
    }else cout << "START READING\n";
}

int main(){
    findLongestWorkingDuration("record.txt");
    

    return 0;
}