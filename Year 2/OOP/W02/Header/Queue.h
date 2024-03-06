#ifndef QUEUE_H
#define QUEUE_H

#pragma once
#include <iostream>

class Queue{
private:
    int *arr;
    int frontIndex, rearIndex;
    int size;
public:
    // Queue();
    Queue(int);
    ~Queue();
    bool isEmpty();
    bool isFull();
    void enqueue(int);
    void dequeue();
    void printQueue();
    int getFrontValue();
};

#endif