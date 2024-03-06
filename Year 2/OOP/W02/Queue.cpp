#include "Queue.h"

// Queue::Queue(){

// }

Queue::Queue(int size) : arr(new int[size]), frontIndex(0), rearIndex(-1){
    this->size = size;
}

Queue::~Queue(){
    delete []arr;
}

bool Queue::isEmpty(){
    if (rearIndex == -1)
        return true;
    return false;
}

bool Queue::isFull(){
    if (rearIndex == size - 1)
        return true;
    return false;
}

void Queue::enqueue(int t){
    if (!isFull())
        arr[++rearIndex] = t;
}

void Queue::dequeue(){
    if (!isEmpty()){
        for (int i = 1; i <= rearIndex; i++)
            arr[i-1] = arr[i];
            rearIndex--;
    }
}

void Queue::printQueue(){
   if (!isEmpty())
        for (int i = 0; i <= rearIndex; i++)
            std::cout << arr[i] << " ";
    else if (isEmpty())
        std::cout << "Empty";
    if (isFull())
        std::cout << "\nFull";
    std::cout << '\n'; 
}

int Queue::getFrontValue(){
    return arr[frontIndex];
}