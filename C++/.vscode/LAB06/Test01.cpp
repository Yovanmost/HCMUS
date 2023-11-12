#include <iostream>
#include <string>
#include <string.h>

using namespace std;

void normalLetter(string& s){
    for (int i = 0; i < s.size(); i++){
        if (s[i] <= 'Z' && s[i] >= 'A')
            s[i] = s[i] + ('a' - 'A');
    }
}

void capFirst(string& s){
    s[0] = s[0] - ('a' - 'A');
    for (int i = 1; i < s.size()-1; i++){
        if (s[i] == ' ')
            s[i+1] = s[i+1] - ('a' - 'A');
    }
}

void removeSpace(string s, string& tmp){
    int x = 0;
    for (int i = 0; i < s.size(); i++){
        if (s[i] == ' ' && s[i+1] == ' '){
            // x++;
            tmp = tmp + "";
        }
        else{
            tmp = tmp + s[i];
            // x++;
        }
    }
    cout << "|" << tmp.size() -  1<<"|";
    if (tmp[0] == ' '){
        for (int i = 1; i < tmp.size(); i++)
            tmp[i-1] = tmp[i];
        x = tmp.size() - 1;
    }
    // 0 1 2 3 4
    // 1 2 3 4  
    if (tmp[x - 2] == ' ')
        tmp[x - 2] == '\0';
    cout << "|" << tmp[x - 1] <<"|";
    // cout << "." << tmp << ".";
}

int main(){
    string s = "                     THis                iS                  a              sTriNg    ";
    string tmp = "";
    string t = "This is a string";
    string in;
    // string tmp;
    cout << "Input String: ";
    getline(cin, in);    
   
    removeSpace(in ,tmp);

    // cout << s << "\n";
    // cout << t << "\n";
    cout << "." << tmp << ".\n";
    normalLetter(tmp);
    cout << "." << tmp << ".\n";
    capFirst(tmp);
    cout << "." << tmp << ".";
}