#include <iostream>
#include <string>
#include <vector>

using namespace std;

bool isNumber(char c){
    return c >= '0' && c <= '9';
}

string test(string s){
    string t;
    for (int i = 0; i < s.size(); i++)
        if (s[i] != ' ')
            t += s[i];
    // cout << t << '.';
    return t;
}

void stringToStack(string s){
    vector<string> stack;
    string t = test(s);
    // cout << t << '\n';
    string tmp = "";
    for (int i = 0; i < t.size(); i++){
        if (isNumber(t[i])){
            tmp += t[i];
            cout << tmp << '\n';
        }
            
        else{
            if (tmp != ""){
                stack.push_back(tmp);
            }
            tmp = t[i];
            stack.push_back(tmp);
            tmp = "";
        }
    }
    stack.push_back(tmp);
    for (int i = 0; i < stack.size(); i++)
        cout << stack[i] << ".";

}

int main(){
    string s = "5 + ((1 + 2) * 4) - 3";
    // test(s);
    stringToStack(s);

    return 0;
}