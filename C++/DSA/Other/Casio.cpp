#include <iostream>
#include <vector>
#include <string>
#include "Casio.h"

using namespace std;

myQueue postfix;
myStack order;

bool isOperator(string c){
    if (c == "+" || c ==  "-" || c == "*" || c == "/")
        return true;
    return false;
}

int priorityOperator(string c){
    if (c == "+" || c ==  "-")
        return 1;
    if (c == "*" || c == "/")
        return 2;
    return 0;
}

void cal(string s[], int n){
    for (int i = 0; i < n; i++){
        // number
        if (!isOperator(s[i]) && s[i] != "(" && s[i] != ")"){
            enQueue(postfix, s[i]);
            // cout << s[i] << "\n";
        }

        // '('
        else if (s[i] == "("){
            push(order, s[i]);
        }
            
        // ')'
        // remove from stack and add to queue till find the "("
        else if (s[i] == ")"){
            while (!isEmpty(order) && order.top->key != "("){
                enQueue(postfix, order.top->key);
                pop(order);
            }
        }
        // operator
        else if (isOperator(s[i])){
            // there isn't anything inside the stack
            if (isEmpty(order)){
                push(order, s[i]);
            }
            else{
                // pop all the operators that have higher priority than the current one
                while (!isEmpty(order) && priorityOperator(order.top->key) >= priorityOperator(s[i])){
                    enQueue(postfix, order.top->key);
                    pop(order);
                }
                // all the finish popping then add to stack
                push(order, s[i]);
            }
        }
    }
    // pop the remaining ones
    while (!isEmpty(order)){
        enQueue(postfix, order.top->key);
        pop(order);
    }
}

// 5
// +
// (
// (
// 1
// +
// 2
// )
// *
// 4
// )
// -
// 3

int main(){
    string s[100];
    int i = 0;
    while (i++ < 13){
        getline(cin, s[i]);
    }
    cal(s, 10);
    Node* tmp = postfix.front;
    while (tmp != NULL){
        cout << tmp->key << " ";
        tmp = tmp->pNext;
    }

    return 0;
}