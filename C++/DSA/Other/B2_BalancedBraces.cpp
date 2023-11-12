#include <iostream>
#include <string.h>

using namespace std;

char check(char c){
    if (c == '{')   return '}';
    if (c == '(')   return ')';
    if (c == '[')   return ']';
}

bool checkBalance(char* s){
    int top = -1;
    int i = 0;
    int n = strlen(s);
    char* stack = new char [n];
    while (i != n){
        if (s[i] == '(' || s[i] == '[' || s[i] == '{')
            stack[++top] = s[i];
        else if (s[i] == ']' || s[i] == '}' || s[i] == ')'){
            // pop until find the match
            while (top > -1 && (check(stack[top]) != s[i]))
                top--;
            // if there no match(stack is empty) => false
            if (top == -1){
                delete[] stack;
                return false;
            }
            else top--; // pop the match out
        }
        i++;
    }
    // no longer need to access the string => free
    delete[] stack;
    // if the stack is not empty (top = -1 means empty) (some braces still left inside) => false
    if (top > -1)
        return false;
    return true;
}

int main(){
    char* s = "{ ( [ {} ({()}) {} ] ) }";
    if (checkBalance(s))
        cout << "Y";
    else cout << "N";
    

    return 0;
}
