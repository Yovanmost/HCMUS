#include <iostream>
#include <fstream>
#include <cstring>
#include <string.h>
#include <string>
#include <sstream>

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

void replace_first(string& s, string const& toReplace, string const& replaceWith) {
    size_t pos = s.find(toReplace);
    if (pos == std::string::npos) return;
    s.replace(pos, toReplace.length(), replaceWith);
}

int main(){
    ifstream fin("Tmp04.txt");
    ofstream fout("Tmp05.txt");
    string word;
    string s;
    string what = "it";
    string with = "snowball";
    while (!fin.eof()){
        getline(fin, word);
        replace_first(word, what, with);
        fout << word << "\n";        
    }
    fin.close();
    fout.close();
    
    return 0;
}