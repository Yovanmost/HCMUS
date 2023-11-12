#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <vector>

using namespace std;

struct Words{
    string word;
    int exist = 1;
};

int checkExist(vector<Words> &s, string tmp){
    for (int i = 0; i < s.size(); i++)
        if (s[i].word == tmp)
            return i;
    return -1;
}

int sentences = 0;

void checkEnd(string s){
    for (int i = 0; i < s.length(); i++)
        if (s[i] == '.' || s[i] == '?' || s[i] == '!')
            sentences++;
}

string tolower(string s){
    string tmp = "";
    for (int i = 0; i < s.size(); i++){
        if (s[i] >= 'A' && s[i] <= 'Z')
            tmp += tolower(s[i]);
        else tmp += tolower(s[i]);
    }
    return tmp;
}

vector<Words> readString(ifstream &fr){
    vector<Words> words;
    Words tmp;
    while (fr >> tmp.word){
        checkEnd(tmp.word);
        tmp.word = tolower(tmp.word);
        if (tmp.word.back() == '.' || tmp.word.back() == '!' || tmp.word.back() == '?')
            tmp.word = tmp.word.substr(0, tmp.word.length() - 1);
        if (checkExist(words, tmp.word) != -1)
            words[checkExist(words, tmp.word)].exist++;
        else words.push_back(tmp);
    }
    return words;
}

void print(vector<Words> s){
    cout << "Sentences: " << sentences << "\n";
    for (int i = 0; i < s.size(); i++){
        cout << s[i].word << " " << s[i].exist << '\n';
    }
}


int main(){
    ifstream fr;
    fr.open("Untitled-1-1.txt");
    if (fr.is_open() == false){
        cout << "Can't open file (fr)";
        return 0;
    }else cout << "START READING\n";
    vector<Words> w = readString(fr);
    print(w);
    return 0;
}