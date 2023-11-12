#include <iostream>
#include <cstring>

using namespace std;

/*B1*/
void reverseWord(char* s){
    int top = -1;
    int i = 0;
    char* reverse = new char [strlen(s)];
    while (i != strlen(s)){
        reverse[++top] = s[i++];
    }
    while (top > -1){
        cout << reverse[top--];
    }
    delete[] reverse;
}

/*B2*/
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

/*B3*/
void decimalToBinary(unsigned int n){
    if (n == 0){
        cout << 0;
        return;
    }   
    int* stack = new int [100];
    int top = -1;    
    while (n != 0){
        stack[++top] = n % 2;
        n = n/2;
    }
    while (top > -1){
        cout << stack[top--];
    }
}

/*B4*/
struct Time{
    int start;
    int process;
    int end;
    int wait;
};

int countLoss(Time customer[], int n){
    int count = 0;
    customer[0].wait = 0;
    customer[0].end = customer[0].start + customer[0].process;
    for (int i = 1; i < n; i++){
        if (customer[i].start >= customer[i-1].end){
            customer[i].wait = 0;
            customer[i].end = customer[i].start + customer[i].process;
        }
        else {
            customer[i].end = customer[i-1].end + customer[i].process;
            customer[i].wait = customer[i-1].end - customer[i].start;
            if (customer[i].wait > 10)
                count++;
        }       
    }
    return count;
}

/*
    Idea: total time = customer waiting time + customer processing time
    (n > 0)
    customer(n) waiting time = customer(n-1) finished time - customer(n) start time
    customer(n) end time = customer(n-1) finished time + customer(n) process time
    ~W: waiting period
    W-: processing period
    S: start (arrival)
    E: end
        (S)  (E)
    1. 0-5----14
    2.     7~~W----19
    3.        14~~~W-----24
    4.                     30-------45
    5.                        32~~~~W-----50
    6.                          34~~~~~~~~W------55

    Corner case: customer(n) start time >= customer(n-1) end time (customer 3 and 4 above)
        => customer(n) doesn't need to wait (customer[n].wait = 0)
*/


int main(){

    return 0;
}