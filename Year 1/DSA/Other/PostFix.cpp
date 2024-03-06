#include <iostream>
#include <string>

using namespace std;

bool isOperator(string s){
    if (s == "+" || s == "-" || s == "*" || s == "/")
        return true;
    return false;
}

int checkPriority(string s){
    if (s == "+" || s == "-")
        return 1;
    if (s == "*" || s == "/")
        return 2;
    return 0;
}

void cal(string s[], int n){
    string myStack[n]; // push and pop
    string myQueue[n]; // only enQueue
    int top = -1; // indicate the empty state of stack
    int idex = 0;
    for (int i = 0; i < n; i++){
        if (s[i] != "(" || s[i] != ")" || !isOperator(s[i]))
            myQueue[idex++] = s[i];

        // add "(" only to the stack so that we can know when to stop pop to output ")"
        else if (s[i] == "(")
            myStack[++top] = s[i];
        else if (s[i] == ")"){
            while (top > -1 && myStack[top] != "("){
                myQueue[idex++] = myStack[top--];
            }
            if (top > -1 && myStack[top] != "(")
                return;
            else top--; // if top == 0 then move it back to -1 ( if == "(" then pop it from stack)
        }
        else if (isOperator(s[i])){
            while (top > -1 && checkPriority(myStack[top]) >= checkPriority(s[i]))
                myQueue[idex++] = myStack[top--];
            myStack[++top] = s[i];
        }
    }
    while (top > -1 ){
        myQueue[idex++] = myStack[top--];
    }
}

int main(){
    int n = 5;
    string s[n] = {"(", "4", "5", ")" , "6"};
    string myStack[n];
    int top = -1;
    string myQueue[n];
    int idex = 0;
    for (int i = 0; i < n; i++){
        
        if (s[i] == "(")
            myStack[++top] = s[i];
        if (s[i] == ")"){
            while (top > -1 && myStack[top] != "("){
                myQueue[idex++] = myStack[top--];
            }
            if (top > -1 && myStack[top] != "("){
                cout << "WTF";
                break;
            }               
            else top--;
            cout << top;
        }
    }
    
    

    return 0;
}