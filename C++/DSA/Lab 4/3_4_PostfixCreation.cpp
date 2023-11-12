#include <iostream>
#include <string>
#include <string.h>
#include <vector>

using namespace std;

vector<char> stack;
vector<char> queue;

bool isNumber(char c){
    return c >= '0' && c <= '9';
}

bool isOperator(char c){
    return c == '+' || c == '-' || c == '*' || c == '/';
}

int operatorOrder(char c){
    if (c == '+' || c ==  '-')
        return 1;
    if (c == '*' || c == '/')
        return 2;
    return 0;
}

bool compareOperator(char a, char b){
    return operatorOrder(a) >= operatorOrder(b);
}

// 3 + 5 * 2
// 

void postfixCreate(string s){
    vector<char> tmpStack;
    string tmp = "";
    for (int i = 0; i < s.size(); i++){
        // if (isNumber(s[i])){
        //     queue.push_back(s[i]);
        // }
        if (s[i] == ' ')
            continue;
            
        if (isOperator(s[i])){
            while (!tmpStack.empty() && compareOperator(tmpStack.back(), s[i])){
                queue.push_back(tmpStack.back());
                tmpStack.pop_back();
            }
            tmpStack.push_back(s[i]);
        }

        else if (s[i] == '(')
            tmpStack.push_back(s[i]);

        else if (s[i] == ')'){
            while (!tmpStack.empty() && tmpStack.back() != '('){
                queue.push_back(tmpStack.back());
                tmpStack.pop_back();
            }
            if (!tmpStack.empty() && tmpStack.back() == '(')
                tmpStack.pop_back();
        }
        else queue.push_back(s[i]);
    }

    while (!tmpStack.empty()){
        queue.push_back(tmpStack.back());
        tmpStack.pop_back();
    }
}

void postfixCalculate(){
    vector<int> numbers;
    for (int i = 0; i < queue.size(); i++){
        if (isNumber(queue[i]))
            numbers.push_back(atoi(&queue[i]));
        // else if (isOperator(queue[i])){
        //     int a = numbers.back(); numbers.pop_back();
        //     int b = numbers.back(); numbers.pop_back();
        //     switch (queue[i])
        //     {
        //     case '+':
        //         numbers.push_back(a+b);
        //         break;
            
        //     case '-':
        //         numbers.push_back(a-b);
        //         break;

        //     case '*':
        //         numbers.push_back(a*b);
        //         break;

        //     case '/':
        //         if (b == 0)
        //             break;
        //         numbers.push_back(a/b);
        //         break;

        //     default:
        //         cout << "Nah";
        //         break;
        //     }
        // }
    }
    cout << numbers.back();
}

void printQueue(){
    for (int i = 0; i < queue.size(); i++)
        cout << queue[i] << ' ';
    cout << '\n';
}



int main(){
    string s = "5 + ( ( 1 + 2 ) * 4 ) - 3";
    postfixCreate(s);
    printQueue();
    // postfixCalculate();

    return 0;
}