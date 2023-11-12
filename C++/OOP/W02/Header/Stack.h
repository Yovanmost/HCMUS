#ifndef STACK_H
#define STACK_H

#pragma once
#include <iostream>

class Stack{
private:
    int* arr;
    int topIndex;
    int size;

public:
    // Stack();
    Stack(int);
    ~Stack();
    bool isEmpty();
    bool isFull();
    void push(int);
    void pop();
    int getTopValue();
    void printStack();
};

#endif