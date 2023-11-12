#pragma once

#include <iostream>
#include <vector>
#include <string>
#include <string.h>

using namespace std;

struct Node{
    string key;
    Node* pNext;
};

Node* createNode(string data){
    Node* p = new Node;
    p->key = data;
    p->pNext = NULL;
    return p;
}

// Stack
struct myStack{
    Node* top = NULL;
};

void push(myStack &s, string data){
    if (s.top == NULL){
        s.top = createNode(data);
        return;
    }
    else {
        Node* p = createNode(data);
        p->pNext = s.top;
        s.top = p;
    }
}

void pop(myStack &s){
    if (s.top == NULL)
        return;
    Node* tmp = s.top;
    s.top = s.top->pNext;
    delete tmp;    
}

bool isEmpty(myStack &s){
    if (s.top == NULL)
        return true;
    return false;
}

string Peek(myStack &s){
    if (!isEmpty(s))
        return s.top->key;
    else return NULL;
}

void freeStack(myStack &s){
    while (s.top != NULL){
        pop(s);
    }
}

void printStack(myStack s){
    Node* pHead = s.top;
    while (pHead != NULL){
        cout << pHead->key << "  ";
        pHead = pHead->pNext;
    }
}

// Queue
struct myQueue{
    Node* front = NULL;
    Node* rear = NULL;
};

void enQueue(myQueue &q, string data){
    if (q.rear == NULL){
        q.rear = createNode(data);
        q.front = q.rear;
        return;
    }
    Node* p = createNode(data);
    q.rear->pNext = p;
    q.rear = p;
}

void deQueue(myQueue &q){
    if (q.rear == NULL)
        return;
    Node* tmp = q.front;
    q.front = q.front->pNext;
    // 1 element only
    if (q.front == NULL)
        q.rear = NULL;
    delete tmp;
}

bool isEmpty(myQueue q){
    if (q.front == NULL)
        return true;
    return false;
}

string Front(myQueue &q){
    if (!isEmpty(q))
        return q.front->key;
    return NULL;
}

string Rear(myQueue &q){
    if (!isEmpty(q))
        return q.rear->key;
    return NULL;
}

void freeQueue(myQueue q){
    while (q.rear != NULL)
        deQueue(q);
}

void printQueue(myQueue q){
    Node* pHead = q.front;
    while (pHead != NULL){
        cout << pHead->key << "  ";
        pHead = pHead->pNext;
    }
}

