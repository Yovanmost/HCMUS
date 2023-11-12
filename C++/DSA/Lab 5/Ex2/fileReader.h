#pragma once
#include <iostream>
#include <string>
#include <fstream>

using namespace std;

void readFile(string s, bool grid[][10]){
    ifstream fr;
    fr.open(s);
    string tmp;
    for (int i = 0; i < 10*10; i++){
        fr >> tmp;
        // if (i % 10 == 0 && i != 0)
        //     cout << '\n';
        // cout << tmp << "|";
        if (tmp == "1")
            grid[i/10][i%10] = true;
    }
}