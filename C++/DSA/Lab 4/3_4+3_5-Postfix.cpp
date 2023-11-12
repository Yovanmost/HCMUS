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

string test(string s){
    string t;
    for (int i = 0; i < s.size(); i++)
        if (s[i] != ' ')
            t += s[i];
    // cout << t << '.' << '\n';
    return t;
}

void stringToStack(string s){
    string t = test(s);
    string tmp = "";
    for (int i = 0; i < t.size(); i++){
        if (isNumber(t[i])){
            tmp += t[i];
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
    if (tmp != "")
        stack.push_back(tmp);
}

void printStack(){
    for (int i = 0; i < stack.size(); i++)
        cout << stack[i] << ".";
    cout << '\n';
}

void postfixCreate(string s){
    stringToStack(s);
    vector<string> tmpStack;
    string t, number = "";
    int n = stack.size();
    for (int i = 0; i < n; i++){
        t = stack[i];
            
        if (isOperator(t)){
            while (!tmpStack.empty() && compareOperator(tmpStack.back(), t)){
                queue.push_back(tmpStack.back());
                tmpStack.pop_back();
            }
            tmpStack.push_back(t);
        }

        else if (stack[i] == "("){
            tmpStack.push_back(t);
        }
            

        else if (stack[i] == ")"){
            while (!tmpStack.empty() && tmpStack.back() != "("){
                queue.push_back(tmpStack.back());
                tmpStack.pop_back();
            }
            if (!tmpStack.empty() && tmpStack.back() == "(")
                tmpStack.pop_back();
        }
        else queue.push_back(t);
    }

    while (!tmpStack.empty()){
        queue.push_back(tmpStack.back());
        tmpStack.pop_back();
    }
}

void postfixCalculate(){
    vector<int> numbers;
    for (int i = 0; i < queue.size(); i++){
        if (isOperator(queue[i])){
            int a = numbers.back(); numbers.pop_back();
            int b = numbers.back(); numbers.pop_back();
            if (queue[i] == "+")
                numbers.push_back(b+a);
            else if (queue[i] == "-")
                numbers.push_back(b-a);
            else if (queue[i] == "*")
                numbers.push_back(b*a);
            else if (queue[i] == "/"){
                if (a == 0)
                    return;
                numbers.push_back(b/a);
            }
                
            cout << b << queue[i] << a << " = " << numbers.back() << '\n';
        }
        else numbers.push_back(stoi(queue[i]));
    }
    cout << numbers.back();
}

void printQueue(){
    for (int i = 0; i < queue.size(); i++)
        cout << queue[i] << ' ';
    cout << '\n';
}



int main(){
    string s = "3 + (4 * 5)";
    postfixCreate(s);
    printQueue();
    postfixCalculate();

    return 0;
}