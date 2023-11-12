#include <iostream>
#include <fstream>
#include <cstring>
#include <string.h>
#include <string>
#include <sstream>

using namespace std;

// string appeared[100];
// int numberAppeared[100] = {0};

// bool checkAppeared(string s){
//     for (int i = 0; i < 100; i++)
//         if (s == appeared[i])
//             return true;
//     return false;
// }

// int countWord(){
//     ifstream fin("Tmp04.txt");
//     string tmp;
//     int count = 0;
//     while (!fin.eof())
//     {
//         fin >> tmp;
//         count++;
//     }
//     fin.close();
//     return count;
// }

// void replace_first(string& s, string const& toReplace, string const& replaceWith) {
//     size_t pos = s.find(toReplace);
//     if (pos == std::string::npos) return;
//     s.replace(pos, toReplace.length(), replaceWith);
// }

int countLine(ifstream &fin){
    fin.open("Tmp06.txt");
    string tmp;
    int count = 0;
    while (!fin.eof()){
        getline(fin, tmp);
        count++;
    }   
    fin.close();
    return count;
}

int main(){
    ifstream fin;
    cout << countLine(fin);
    int n;
    cin >> n;
    if (n > countLine(fin))
        return 0;
    ofstream fout("Tmp07.txt");
    fin.open("Tmp06.txt");
    string word;
    int i = 1;
    while (!fin.eof()){
        if (i++ == n){
            // getline(fin, word);
            fout << "ILoveSnowBall\n";
            continue;
        }  
        getline(fin, word);
        fout << word << '\n';
    }
    return 0;
}