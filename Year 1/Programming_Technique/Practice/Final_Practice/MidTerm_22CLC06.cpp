#include <iostream>

using namespace std;

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
    cout << '\n';
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

void inputArray(int a[], int &n){
    cin >> n;
    // a = new int [n];
    for (int i = 0; i < n; i++)
        cin >> a[i];
}

int findMax(Node* pHead){
    Node* p = pHead;
    int max = -10000000;
    while (p != NULL){
        if (p->data > max)
            max = p->data;
        p = p->pNext;
    }
    return max;
}

void deleteNode(Node* del){
    Node* tmp = del->pNext;
    *del = *tmp;
    delete tmp;
}

void removeBiggest(Node* pHead){
    int max = findMax(pHead);
    Node* p = pHead;
    while (p != NULL){
        if (p->data == max)
            deleteNode(p);
        p = p->pNext;
    }
}

int main(){
    int a[1000], n;
    inputArray(a, n);
    List b = createListV2(a, n);
    printList(b);
    removeBiggest(b.pHead);
    printList(b);
    // cout << findMax(b.pHead);


    return 0;
}