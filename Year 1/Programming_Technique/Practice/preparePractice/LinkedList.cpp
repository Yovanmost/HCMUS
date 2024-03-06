#include <iostream>
#include <fstream>
#include <sstream>

using namespace std;

struct Node{
    int key;
    Node* pNext;
};

Node* createNode(int data){
    Node* p = new Node;
    p->key = data;
    p->pNext = NULL;
    return p;
}

void addTail(Node* &pHead, int data){
    if (pHead == NULL){
        pHead = createNode(data);
        return;
    }
    else{
        Node* p = pHead;
        while (p->pNext != NULL)
            p = p->pNext;
        p->pNext = createNode(data);
        return;
    }
    
}

void addHead(Node* &pHead, int data){
    if (pHead == NULL){
        pHead = createNode(data);
        return;
    }
    else {
        Node* p = createNode(data);
        p->pNext = pHead;
        pHead = p;
        return;
    }
}

void printNode(Node* pHead){
    Node* p = pHead;
    while (p != NULL){
        cout << p->key << ' ';
        p = p->pNext;
    }
}

void removeHead(Node* &pHead){
    if (pHead == NULL)
        return;
    Node* p = pHead;
    pHead = pHead->pNext;
    delete p;
}

void removeLast(Node* &pHead){
    if (pHead == NULL)
        return;
    Node* p = pHead;
    // the one before the last
    while (p->pNext->pNext != NULL)
        p = p->pNext;
    // remove the last one
    Node *_p = p->pNext;
    delete _p;
    // close the wound
    p->pNext = NULL;
}

void removeAll(Node* &pHead){
    while (pHead != NULL){
        removeHead(pHead);
    }
}

void addPos(Node* &pHead, int data, int pos){
    int count = 0;
    Node* p = pHead;
    while (p != NULL && count < pos - 1){
        p = p->pNext;
        count++;
    }
    if (p == NULL)
        return;
    Node* p1 = createNode(data);
    Node* p2 = p->pNext;
    p->pNext = p1;
    p1->pNext = p2;
}

void removePos(Node* &pHead, int pos){
    int count = 0;
    Node* p = pHead;
    while (p != NULL && count < pos - 1){
        p = p->pNext;
        count++;
    }

    if (p == NULL)
        return;
    if (pos == 0)
        removeHead(pHead);
    
    Node* p1 = p->pNext;
    Node* p2 = p1->pNext;
    p->pNext = p2;
    delete p1;
}

int countElements(Node* &pHead){
    int count = 0;
    Node* p = pHead;
    while (p != NULL){
        p = p->pNext;
        count++;
    }   
        
    return count;
}

int countAppearance(Node* &pHead, int value){
    int count = 0;
    Node* p = pHead;
    while (p != NULL){
        if (p->key == value)
            count++;
        p = p->pNext;
    }
    return count;
}

void inputNode(Node* &pHead){
    int length;
    cout << "Length: ";
    cin >> length;
    int i = 0;
    while (i != length){
        int data;
        cout << i++ << ": ";
        cin >> data;
        addTail(pHead, data);
    }
}

Node* moveTo(Node* pHead, int pos){
    Node* p = pHead;
    int count = 0;
    while (p != NULL && count < pos - 1)
        p = p->pNext;
    return p;
}

// sorted
void removeDuplicate(Node* &pHead){
    Node* p = pHead;
    if (p == NULL) 
        return;
    while (p != NULL && p->pNext != NULL){
        if (p->key == p->pNext->key)
            p->pNext = p->pNext->pNext;
        else p = p->pNext;
    }
}

void removeDuplicates(Node* pHead)
{
    Node *ptr1, *ptr2, *dup;
    ptr1 = pHead;
 
    /* Pick elements one by one */
    while (ptr1 != NULL && ptr1->pNext != NULL) {
        ptr2 = ptr1;
 
        /* Compare the picked element with rest
           of the elements */
        while (ptr2->pNext != NULL) {
            /* If duplicate then delete it */
            if (ptr1->key == ptr2->pNext->key) {
                /* sequence of steps is important here */
                dup = ptr2->pNext;
                ptr2->pNext = ptr2->pNext->pNext;
                delete dup;
            }
            else /* This is tricky */
                ptr2 = ptr2->pNext;
        }
        ptr1 = ptr1->pNext;
    }
}

void dup(Node* pHead){
    Node* p = pHead;
    Node* p1;
    Node* same;
    while (p != NULL && p->pNext != NULL){
        p1 = p;
        while (p1->pNext != NULL){
            if (p->key == p1->pNext->key){
                same = p1->pNext;
                p1->pNext = p1->pNext->pNext;
                delete same;
            }
            else p1 = p1->pNext;
        }
        p = p->pNext;
    }
}

Node* reverseList(Node* &pHead){
    Node* p = NULL;
    while (pHead != NULL){
        addHead(p, pHead->key);
        pHead = pHead->pNext;
    }
    return p;
}

void sortLinkedList(Node* &pHead) {
    Node* curr = pHead;
    Node* temp = NULL;
    int t;
    if (pHead == NULL) {
        return;
    }else {
        while (curr != NULL) {
            temp = curr->pNext;
            while (temp != NULL) {
                if (curr->key > temp->key) {
                    t = curr->key;
                    curr->key = temp->key;
                    temp->key = t;
                }
            temp = temp->pNext;
        }
        curr = curr->pNext;
        }
    }
}


int main(){
    int n, i = 0;
    Node* pHead = NULL;
    inputNode(pHead);
    sortLinkedList(pHead);
    printNode(pHead);
    Node* pOther = reverseList(pHead);
    printNode(pOther);

    
    return 0;
}