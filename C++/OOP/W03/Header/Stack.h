#ifndef STACK_H
#define STACK_H

#pragma once

template <class T> class Stack{
private:
    T* data;
    int topIndex;
    int capacity;
public:
    Stack();
    Stack(int n);
    ~Stack();
    void clear();
    bool isFull();
    bool isEmpty();
    void push(const T &item);
    T pop();
    T getTop();
    void printStack();
};

template <class T>
Stack<T>::Stack(){
    capacity = 1;
    data = new T[capacity];
    topIndex = -1;
}

template <class T>
Stack<T>::Stack(int n){
    capacity = n;
    data = new T[capacity];
    topIndex = -1;
}

template <class T>
Stack<T>::~Stack(){
    delete []data;
}

template <class T>
void Stack<T>::clear(){
    delete []data;
    capacity = 1;
    data = new T[capacity];
    topIndex = -1;
}

template <class T>
bool Stack<T>::isFull(){
    // if (topIndex == capacity - 1)
    //     return true;
    // return false;
    return topIndex == capacity - 1;
}

template <class T>
bool Stack<T>::isEmpty(){
    // if (topIndex == capacity - 1)
    //     return true;
    // return false;
    return topIndex ==  -1;
}

template <class T>
void Stack<T>::push(const T & item){
    if (!isFull())
        data[++topIndex] = item;
    else std::cout << "Stack is full\n";
}

template <class T>
T Stack<T>::pop(){
    if (!isEmpty())
        return data[--topIndex];
    else std::cout << "Stack is empty\n";
}

template <class T>
T Stack<T>::getTop(){
    if (!isEmpty())
        return data[topIndex];
    else std::cout << "Stack is empty";
}

template <class T>
void Stack<T>::printStack(){
    for (int i = 0; i <= topIndex; i++)
        std::cout << data[i] << ' ';
    std::cout << '\n';
}


#endif
