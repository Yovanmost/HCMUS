#ifndef QUEUE_H
#define QUEUE_H

#pragma once
#include <string>
#include <cstring>
#include <exception>

class QueueException : public std::exception{
private:
    std::string message;
public:
    QueueException(const std::string &m) : message(m){}

    const char* what() const throw(){
        return strdup(this->message.c_str());
    }
};


template <class T> class Queue{
private:
    T* arr;
    int frontIndex, rearIndex;
    int size;
public:
    Queue();
    Queue(int);
    ~Queue();
    bool isEmpty();
    bool isFull();
    void enqueue(const T &item);
    void dequeue();
    void printQueue();
    T getFrontValue();
};

template <class T>
Queue<T>::Queue(){
    size = 1;
    arr = new T[size];
    frontIndex = 0;
    rearIndex = -1;
}

template <class T>
Queue<T>::Queue(int size) : arr(new T[size]), frontIndex(0), rearIndex(-1){
    this->size = size;
}

template <class T>
Queue<T>::~Queue(){
    delete []arr;
}

template <class T>
bool Queue<T>::isEmpty(){
    return rearIndex == -1;
}

template <class T>
bool Queue<T>::isFull(){
    return rearIndex == size - 1;
}

template <class T>
void Queue<T>::enqueue(const T &t){
    if (!isFull())
        arr[++rearIndex] = t;
    else throw QueueException("Error: Queue is full\n");
}

template <class T>
void Queue<T>::dequeue(){
    if (!isEmpty()){
        for (int i = 1; i <= rearIndex; i++)
            arr[i-1] = arr[i];
            rearIndex--;
    }
    else throw QueueException("Error: Queue is empty\n");
}

template <class T>
void Queue<T>::printQueue(){
   if (!isEmpty())
        for (int i = 0; i <= rearIndex; i++)
            std::cout << arr[i] << " ";
}

template <class T>
T Queue<T>::getFrontValue(){
    if (!isEmpty())
        return arr[frontIndex];
    else throw QueueException("Error: Queue is empty\n");
}

#endif