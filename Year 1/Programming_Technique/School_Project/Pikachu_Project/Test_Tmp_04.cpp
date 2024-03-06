#include <iostream>

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

int lengthNode(Node* &pHead){
    Node* p = pHead;
    int count = 0;
    while (p != NULL){
        count++;
        p = p->pNext;
    }
        
    return count;
}

Node* moveV2(Node* pHead, int x, int y){
    Node* p = pHead;
    int count = 0;
    int move = lengthNode(pHead) - y - 1;
    while (p != NULL && count < move)
    {
        p = p->pNext;
        count++;
    }
    return p;   
}

Node* move(Node* pHead, int x, int y){
    Node* p = pHead;
    int count = 0;
    while (p != NULL && count < y)
    {
        p = p->pNext;
        count++;
    }
    return p;
}

void printList(Node* pHead){
	Node* p = pHead;
	while(p != NULL){
		cout << p->key << "   ";
		p = p->pNext;
	}
	cout << endl;
}

void printListV2(Node* pHead){
    Node* p = pHead;
    for (int i = 0; i < lengthNode(p); i++){
        Node* tmp = moveV2(p, 0, i);
        cout << tmp->key << "   ";
    }      
}

void removePos(Node* pHead, int pos){
    Node* p = pHead;
	int count = 0;
	while(p != NULL && count < pos - 1){
		p= p->pNext;
		count++;
	}
	
	if(p == NULL)
		return;

	Node* p1 = p->pNext;
	Node* p2 = p1->pNext;
	
	p->pNext = p2;
	delete p1;
}

int main(){
    Node* p = NULL;
	for(int i = 0; i < 8; i++){
		addHead(p, i);
	}   
    // Node* tmp = moveV2(p, 0, 6);
    // cout << tmp->key;
    printListV2(p);
	return 0;
}