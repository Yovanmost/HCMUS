#pragma once
#include <iostream>
#include <string>
#include <fstream>
#include <vector>

using namespace std;

void loadName(string fileName, vector<string> &listOfNames){
    ifstream fr;
    fr.open(fileName);
    string tmp;
    while (!fr.eof()){
        fr >> tmp;
        listOfNames.push_back(tmp);
    }
    fr.close();
}