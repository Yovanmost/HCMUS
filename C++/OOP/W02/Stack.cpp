#include "Stack.h"

// Stack::Stack(){

// }

Stack::Stack(int size): arr(new int[size]), topIndex(-1) {
    this->size = size;
}

Stack::~Stack(){
    delete []arr;
}

bool Stack::isEmpty(){
    if (topIndex == -1)
        return true;
    return false;
}

bool Stack::isFull(){
    if (topIndex == size - 1)
        return true;
    return false;
}

void Stack::push(int t){
    if (!isFull())
        arr[++topIndex] = t;
    else return;
}

void Stack::pop(){
    if (!isEmpty())
        topIndex--;
    else return;
}

int Stack::getTopValue(){
    if (!isEmpty())
        return arr[topIndex];
    // else std::cout << "Nothing";
}

void Stack::printStack(){
    if (!isEmpty())
    for (int i = 0; i <= topIndex; i++)
        std::cout << arr[i] << ' ';
    else if (isEmpty())
        std::cout << "Empty";
    if (isFull())
        std::cout << "\nFull";
    std::cout << '\n';
}