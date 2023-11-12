#include <iostream>
#include <string>

using namespace std;

struct Node{
    int data;
    Node* pNext;
};

Node* createNode(int data){
    Node* p = new Node;
    p->data = data;
    p->pNext = NULL;
}

struct List{
    Node* pHead;
    Node* pTail;
};

// Singly Linked List
void addHeadV2(List &L, int data){
	Node* p = createNode(data);
	p->pNext = L.pHead;
	L.pHead = p;
}

List createListV2(int A[], int n){
	List newList;
	Node* first = createNode(A[n-1]);
	newList.pHead = first;
    newList.pTail = first;
	for (int i = n - 2; i >= 0; i--){
		addHeadV2(newList, A[i]);
	}
	
	return newList;
}

void printList(List L){
    if (L.pHead == NULL)
        return;
    Node* p = L.pHead;
    while (p != NULL){
        cout << p->data << "  ";
        p = p->pNext;
    }
    cout << '\n';
}

void printListV2(List L){
    if (L.pHead == NULL)
        return;
    Node* p = L.pHead;
    do {
        cout << p->data << "  ";
        p = p->pNext;
    } while (p != NULL);
    cout << '\n';
}

// Circular Linked List
void addHeadCircular(List &L, int data){
	Node* p = createNode(data);
	p->pNext = L.pHead;
	L.pHead = p;
    L.pTail->pNext = L.pHead;
}

List createCircularList(int A[], int n){
	List newList;
	Node* first = createNode(A[n-1]);
	newList.pHead = first;
    newList.pTail = first;
	for (int i = n - 2; i >= 0; i--){
		addHeadCircular(newList, A[i]);
	}
	
	return newList;
}

void printCircularList(List L){
    if (L.pHead == NULL)
        return;
    Node* p = L.pHead;
    do{
        cout << p->data << "  ";
        p = p->pNext;
    }while (p != L.pHead);
}


// Array Insertion
void inputArray(int* &a, int &n){
    cin >> n;
    a = new int [n];
    for (int i = 0; i < n; i++)
        cin >> a[i];
}

bool checkIncreaseNode(Node* h){
    if (h->pNext == NULL)
        return true;
    if (h->data < h->pNext->data)
        checkIncreaseNode(h->pNext);
    else return false;    
}

int sumOfLinkedList(Node* pHead){
    if (pHead->pNext == NULL)
        return pHead->data;
    return pHead->data + sumOfLinkedList(pHead->pNext);
}

int countNode(Node* pHead){
    if (pHead == NULL)
        return 0;
    if (pHead->pNext == NULL)
        return 1;
    return 1 + countNode(pHead->pNext);
}

int countFrequency(Node* pHead, int k){
    if (pHead->pNext == NULL && pHead->data == k)
        return 1;
    else if (pHead->pNext == NULL && pHead->data != k)
        return 0;
    if (pHead->data == k)
        return 1 + countFrequency(pHead->pNext, k);
    else return countFrequency(pHead->pNext, k);
}

Node* getMinNode(Node* head, Node* tail){
    Node* p = head;
    Node* minNode = p;
    while (p != NULL){
        if (p->data < minNode->data)
            minNode = p;
        p = p->pNext;
    }
    return minNode;
}

Node* getMaxNode(Node* head, Node* tail){
    Node* p = head;
    Node* maxNode = p;
    while (p != NULL){
        if (p->data > maxNode->data)
            maxNode = p;
        p = p->pNext;
    }
    return maxNode;
}

int countNodeBetweenMinMax(Node* pHead, Node* pTail){
    Node* start = getMaxNode(pHead, pTail);
    Node* end = getMinNode(pHead, pTail);
    int which = 0;
    if (end == start)
        return 0;
    while (true){
        if (end == NULL){
            which = 1;
            break;
        }
        if (start == NULL){
            which = 0;
            break;
        }
        end = end->pNext;
        start = start->pNext;  
    }
    // min is near NULL than max
    if (which == 0){
        start = getMinNode(pHead, pTail);
        end = getMaxNode(pHead, pTail);
    }
    else {
        start = getMaxNode(pHead, pTail);
        end = getMinNode(pHead, pTail);
    }

    int count = 0;
    while (start->pNext != end){
        count++;
        start = start->pNext;
    }
    return count;
}

int main(){
    int* a, *d, n, m;
    List b;
    List c;
    cout << "In a: ";
    inputArray(a ,n);
    b = createListV2(a, n);
    // printList(b);
    printListV2(b);
    cout << countNodeBetweenMinMax(b.pHead, b.pTail);
    // cout << "k: ";
    // cin >> m;
    // cout << countFrequency(b.pHead, m);
    // cout << "In a: ";
    // inputArray(a ,n);
    // b = createCircularList(a, n);
    // printCircularList(b);
    

    return 0;
}
