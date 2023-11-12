#include<iostream>
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

void addHead(Node* &pHead, int data){
	if(pHead == NULL){ //TH DSLK rong
		pHead = createNode(data);
		return;
	}
	else{
		Node* p = createNode(data);
		p->pNext = pHead;
		pHead = p;
		return;
	}
}

void addTail(Node* &pHead, int data){
	if(pHead == NULL){ //TH DSLK rong
		pHead = createNode(data);
		return;
	}
	else{
		Node* p = pHead;
		while(p->pNext != NULL){
			p = p->pNext;
		}
		p->pNext = createNode(data);
		return;
	}		
}

void removeHead(Node* &pHead){
	if(pHead == NULL)
		return;
	Node* p = pHead;
	pHead = pHead->pNext;
	delete p;
}

void removeTail(Node* &pHead){
	if(pHead == NULL)
		return;
	if(pHead->pNext == NULL){
		delete pHead;
		pHead = NULL;
		return;
	}
	
	Node* p = pHead;
	while(p->pNext->pNext != NULL){
		p = p->pNext;
	}
	Node* p_ = p->pNext;
	delete p_;
	p->pNext = NULL;
}

void addPos(Node* &pHead, int data, int pos){
	Node* p = pHead;
	int count = 1;
	while(p != NULL && count < pos - 1){
		p= p->pNext;
		count++;
	}
	if(p == NULL){
		return;
	}
	
	// 0	1	2	3	4
	// 		p 	p2
	Node* p2 = p->pNext;
	Node* p1 = createNode(data);
	p->pNext = p1;
	p1->pNext = p2;
	
}

void removePos(Node* &pHead, int pos){
	Node* p = pHead;
	int count = 0;
	while(p != NULL && count < pos - 1){
		p= p->pNext;
		count++;
	}
	
	if(p == NULL)
		return;
	
	if(pos == 0){
		removeHead(pHead);
		return;
	}
	Node* p1 = p->pNext;
	Node* p2 = p1->pNext;
	
	p->pNext = p2;
	delete p1;
}
void printList(Node* pHead){
	Node* p = pHead;
	while(p != NULL){
		cout << p->key << "   ";
		p = p->pNext;
	}
	cout << endl;
}


int main(){
	Node** matrix = new Node* [10];
	matrix[0] = NULL;
	// Node* head = NULL;
	for(int i = 0; i < 8; i++){
		addTail(matrix[0], i);
	}
	
	printList(matrix[0]);
	// addPos(matrix[0], 40, 3);
	removePos(matrix[0], 0);
	printList(matrix[0]);
	return 0;
}