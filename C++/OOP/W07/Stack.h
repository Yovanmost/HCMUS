#ifndef STACK_H
#define STACK_H

#pragma once
#include <exception>
#include <string>
#include <cstring>

class StackException : public std::exception{
private:
    std::string message;
public:
    StackException(const std::string &m) : message(m){}

    const char* what() const throw(){
        return strdup(this->message.c_str());
    }
};


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
    return topIndex == capacity - 1;
}

template <class T>
bool Stack<T>::isEmpty(){
    return topIndex ==  -1;
}

template <class T>
void Stack<T>::push(const T & item){
    if (!isFull())
        data[++topIndex] = item;
    else throw StackException("Error: Stack is full\n");
}

template <class T>
T Stack<T>::pop(){
    if (!isEmpty())
        return data[--topIndex];
    else throw StackException("Error: Stack is empty\n");
}

template <class T>
T Stack<T>::getTop(){
    if (!isEmpty())
        return data[topIndex];
    else throw StackException("Error: Stack is empty\n");
}

template <class T>
void Stack<T>::printStack(){
    for (int i = 0; i <= topIndex; i++)
        std::cout << data[i] << ' ';
    std::cout << '\n';
}


#endif
