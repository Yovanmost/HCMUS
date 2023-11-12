#include <iostream>
#include <string>
#include <string.h>
#include <vector>

using namespace std;

vector<string> stack;
vector<string> queue;


bool isNumber(char c){
    return c >= '0' && c <= '9';
}

bool isOperator(string c){
    return c == "+" || c == "-" || c == "*" || c == "/";
}

int operatorOrder(string c){
    if (c == "+" || c ==  "-")
        return 1;
    if (c == "*" || c == "/")
        return 2;
    return 0;
}

bool compareOperator(string a, string b){
    return operatorOrder(a) >= operatorOrder(b);
}

// 3 + 5 * 2
// 

string test(string s){
    string t;
    for (int i = 0; i < s.size(); i++)
        if (s[i] != ' ')
            t += s[i];
    // cout << t << '.';
    return t;
}

void stringToStack(string s){
    string t = test(s);
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
}

void printStack(){
    for (int i = 0; i < stack.size(); i++)
        cout << stack[i];
    cout << '\n';
}

void postfixCreate(string s){
    vector<string> tmpStack;
    string t, number = "";
    for (int i = 0; i < s.size(); i++){
        if (isNumber(s[i])){
            number += s[i];
            continue;
        }
        if (s[i] == ' ' ){}
            continue;
        
        t = s[i];
            
        if (isOperator(t)){
            while (!tmpStack.empty() && compareOperator(tmpStack.back(), t)){
                queue.push_back(tmpStack.back());
                tmpStack.pop_back();
            }
            tmpStack.push_back(t);
        }

        else if (s[i] == '('){
            tmpStack.push_back(t);
        }
            

        else if (s[i] == ')'){
            while (!tmpStack.empty() && tmpStack.back() != "("){
                queue.push_back(tmpStack.back());
                tmpStack.pop_back();
            }
            if (!tmpStack.empty() && tmpStack.back() == "(")
                tmpStack.pop_back();
        }
        // else queue.push_back(t);
    }

    while (!tmpStack.empty()){
        queue.push_back(tmpStack.back());
        tmpStack.pop_back();
    }
}

// void postfixCalculate(){
//     vector<int> numbers;
//     for (int i = 0; i < queue.size(); i++){
//         if (isNumber(queue[i]))
//             numbers.push_back(atoi(&queue[i]));
//         // else if (isOperator(queue[i])){
//         //     int a = numbers.back(); numbers.pop_back();
//         //     int b = numbers.back(); numbers.pop_back();
//         //     switch (queue[i])
//         //     {
//         //     case '+':
//         //         numbers.push_back(a+b);
//         //         break;
            
//         //     case '-':
//         //         numbers.push_back(a-b);
//         //         break;

//         //     case '*':
//         //         numbers.push_back(a*b);
//         //         break;

//         //     case '/':
//         //         if (b == 0)
//         //             break;
//         //         numbers.push_back(a/b);
//         //         break;

//         //     default:
//         //         cout << "Nah";
//         //         break;
//         //     }
//         // }
//     }
//     cout << numbers.back();
// }

void printQueue(){
    for (int i = 0; i < queue.size(); i++)
        cout << queue[i] << ' ';
    cout << '\n';
}



int main(){
    string s = "5 + ( ( 1 + 2 ) * 4 ) - 3";
    // pushAll(s);
    printStack();
    // postfixCreate(s);
    // printQueue();
    // postfixCalculate();

    return 0;
}