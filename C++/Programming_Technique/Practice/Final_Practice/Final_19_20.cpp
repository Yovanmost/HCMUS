#include <iostream>
#include <math.h>

using namespace std;

// Q.2
struct Node{
    int data;
    Node* pNext;
};

struct List{
    Node* pHead;
};

Node* createNode(int data){
    Node* p = new Node;
    p->data = data;
    p->pNext = NULL;
    return p;
}

List createList(Node* p){
    List L;
    L.pHead = p;
    L.pHead = p;
    return L;
}

void printList(List L){
    if (L.pHead == NULL)
        return;
    Node* p = L.pHead;
    while (p != NULL){
        cout << p->data << "  ";
        p = p->pNext;
    }
}

bool addHead(List &L, int data){
    Node* p = createNode(data);
    if (p == NULL)
        return false;
    if (L.pHead == NULL){
        L = createList(p);
        return true;
    }
    p->pNext = L.pHead;
    L.pHead = p;
    return true;
}

bool addTail(List &L, int data){
    Node* p = createNode(data);
    if (p == NULL)
        return false;
    if (L.pHead == NULL){
        L = createList(p);
        return true;
    }
    Node* tmp = L.pHead;
    while (tmp->pNext != NULL){
        tmp = tmp->pNext;
    }
    tmp->pNext = p;
}


void addHeadV2(List &L, int data){
	Node* p = createNode(data);
	p->pNext = L.pHead;
	L.pHead = p;
}

List createListV2(int A[], int n){
	List newList;
	Node* first = createNode(A[n-1]);
	newList.pHead = first;
	for (int i = n - 2; i >= 0; i--){
		addHeadV2(newList, A[i]);
	}
	
	return newList;
}

int countNodes(List ls){
    if (ls.pHead == NULL)
        return 0;
    Node* tmp = ls.pHead;
    int count = 0;
    while (tmp != NULL){
        count++;
        tmp = tmp->pNext;
    }
    if (count < 3)
        return 0;
    else count = 0;

    Node* first = ls.pHead;
    Node* second = first->pNext;
    Node* third = second->pNext;
    while (third != NULL){
        if (first->data + third->data == second->data)
            count++;

        first = first->pNext;
        second = second->pNext;
        third = third->pNext;
    }

    return count;
}

// Q.3a
int listLength(Node* start){
    Node* p = start;
    int count = 0;
    while (p != NULL){
        count++;
        p = p->pNext;
    }
    return count;
}

Node* findMin(Node* start){
    // base case
    if (start->pNext == NULL){
        return start;
    }
        
    Node* nextMin = findMin(start->pNext);
    if (start->data < nextMin->data)
        return start;
    return nextMin;
}

int MIN = 10000;
Node* findMinV2(Node* start){
    if (start->pNext == NULL)
        return start;

    if (start->data < MIN)
        MIN = start->data;
    findMinV2(start->pNext);
}

void deleteNode(Node* del){
    Node* tmp = del->pNext;
    *del = *tmp;
    delete tmp;
}

void selectionSort(Node* head){
    

}

// Q.1
void printArray(int* a, int n){
    for (int i = 0; i < n; i++)
        cout << a[i] << "   ";
    cout << '\n';
}

void inputArray(int* &a, int &n){
    cin >> n;
    a = new int [n];
    for (int i = 0; i < n; i++)
        cin >> a[i];
}

/*find the nearest number to the given number in the array*/
void extractNearest(int* A, int N, int X, int* &B, int& M){
    // find the smallest difference
    int smallest = 100000;
    for (int i = 0; i < N; i++){
        if (abs(X - A[i]) < smallest)
            smallest = abs(X - A[i]);
    }
    M = 0;
    for (int i = 0; i < N; i++)
        if (abs(X - A[i]) == smallest)
            M++;
    B = new int[M+1];
    int k = 0;
    for (int i = 0; i < N; i++)
        if (abs(X - A[i]) == smallest){
            B[k++] = A[i];
        }
            
    printArray(B, M);
}

    // int n, m, x;
    // int* a;
    // int* b;
    // inputArray(a, n);
    // cin >> x;
    // extractNearest(a, n, x, b, m);


int main(){
    int* a;
    int n;
    inputArray(a, n);
    List b = createListV2(a, n);
    printList(b);
    Node* tmp = findMin(b.pHead);
    cout << tmp->data;



    return 0;
}