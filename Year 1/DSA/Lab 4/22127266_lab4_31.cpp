#include <iostream>
#define SIZE 10

using namespace std;
int top = -1;
char stack[SIZE];

bool isEmpty(){
    return top == -1;
}

bool isFull(){
    return top == SIZE - 1;
}

void push(char c){
    if (!isFull())
        stack[++top] = c;
    else return;
}

void pop(){
    if (!isEmpty())
        top--;
    else return;
}

void printStack(){
    if (!isEmpty())
    for (int i = 0; i <= top; i++)
        cout << stack[i] << ' ';
    else if (isEmpty())
        cout << "Empty";
    if (isFull())
        cout << "\nFull";
    cout << '\n';
}

int main(){
    char k;
    do {
        // system("cls");
        cout << "Stack (10 characters):\n";
        printStack();
        cout << "0 to end, 1 for push, 2 for pop\n";
        cout << "Enter: ";
        cin >> k;
        switch (k)
        {
        case '1':
            char c;
            cout << "Push? ";
            cin >> c;
            push(c);
            break;
        case '2':
            pop();
            break;
        case '0':  
            return 0;
        default:
            cout << "Enter again\n";
            break;
        }
        
    } while (k != '0');

    return 0;
}