#include <iostream>
#include <fstream>
#include <cstring>
#include <string.h>
#include <string>

using namespace std;

string appeared[100];
int numberAppeared[100] = {0};

bool checkAppeared(string s){
    for (int i = 0; i < 100; i++)
        if (s == appeared[i])
            return true;
    return false;
}

int countWord(){
    ifstream fin("Tmp04.txt");
    string tmp;
    int count = 0;
    while (!fin.eof())
    {
        fin >> tmp;
        count++;
    }
    fin.close();
    return count;
    
}

int main(){
    ifstream fin("Tmp04.txt");
    string word;
    int i = 0;
    int n = countWord();
    while (!fin.eof()){
        fin >> word;
        if (checkAppeared(word) == false){
            appeared[i] = word;
            numberAppeared[i++]++;
        }
            
        else {
            for (int j = 0; j < n ; j++){
                if (appeared[j] == word)
                    numberAppeared[j]++;
            }
        }
    }
    fin.close();
    for (int j = 0; j < n; j++)
        if (numberAppeared[j] != 0)
            cout << appeared[j] << " " << numberAppeared[j] << "\n";


    return 0;
}