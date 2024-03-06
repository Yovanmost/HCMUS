#include <iostream>
#include <string>
#include <fstream>

using namespace std;

void allLower(string &s){
    for (int i = 0; i < s.length(); i++){
        if (s[i] >= 'A' && s[i] <= 'Z')
            s[i] = (char)tolower(s[i]);
    }
}

void removePunctuation(string &s){
    string tmp = "";
    int len = s.length() - 1;
    for (int i = 0; i <= len; i++){
        if ((s[i] >= 'a' && s[i] <= 'z') || (s[i] >= 'A' && s[i] <= 'Z'))
            tmp += s[i];
    }
    s.swap(tmp);
}

string reverseString(string s){
    string tmp = "";
    for (int i = s.length() - 1; i >= 0; i--)
        tmp += s[i];
    return tmp;
}

bool palindromeString(string s){
    removePunctuation(s);
    allLower(s);
    string original = s;
    string reverse = reverseString(s);
    if (original == reverse)
        return true;
        
    return false;
}

void readFile(ifstream &fr){
    string tmp;
    int i = 1;
    while (!fr.eof()){
        getline(fr, tmp);
        if (palindromeString(tmp))
            cout << "Line " << i++ << ": \"" << tmp << "\" is a Palindrome string\n";
        else cout << "Line " << i++ << ": \"" << tmp << "\" is not a Palindrome string\n";
    }
}

int main(){
    ifstream fr;
    fr.open("input1.8.1.txt");
    readFile(fr);
    fr.close();
    return 0;
}