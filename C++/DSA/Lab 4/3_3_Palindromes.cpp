#include <iostream>
#include <string>
#include <fstream>
#include <vector>

using namespace std;

bool isLetter(char c){
    return (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z');
}

// 1 2 3
// a b c

// 1 2 3
// c b a
// => false

// 1 2 3
// a b a

// a b a
// => true

// or just compare first and last character, no need for 2 array/vector

bool check(string s){
    vector<char> stack;
    vector<char> queue;
    for (int i = 0; i < s.length(); i++){
        if (isLetter(s[i])){
            stack.push_back((char)tolower(s[i]));
            queue.push_back((char)tolower(s[i]));
        }
    }

    for (int i = 0; i < stack.size(); i++)
        if (stack[stack.size() - 1 - i]  != queue[i])
            return false;
    return true;
}

int main(){
    ifstream fr("test.txt");
    string tmp;
    int i = 1;
    while (!fr.eof()){
        getline(fr, tmp);
        if (check(tmp))
            cout << i++ << " palindrome\n";
        else cout << i++ << " nah\n";
    }


    return 0;
}