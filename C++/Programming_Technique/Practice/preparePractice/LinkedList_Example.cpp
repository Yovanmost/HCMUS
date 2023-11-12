#include <iostream>
using namespace std;

struct Node{
	int key;
	Node* pNext;
};

struct List{
	Node* pHead;
	Node* pTail;
};

Node* createNode(int data){
	Node* p = new Node;
	p->key = data;
	p->pNext = NULL;
	return p;
}

List* createList(Node* pNode){
	List* L = new List;
	L->pHead = pNode;
	L->pTail = pNode;
	return L;
}

void printList(List* L){
	if(L == NULL)
		return;
	Node* p = L->pHead;
	while(p != NULL){
		cout << p->key << "   ";
		p = p->pNext;
	}
}

bool addHead(List* &L, int data){
	Node* p = createNode(data);
    // cannot create a node ???
	if(p == NULL)
		return false;
    // list is empty
	if(L == NULL){
		L = createList(p);
		return true;
	}
    // list is not empty
	p->pNext = L->pHead;
	L->pHead = p;
	return true;
}

bool addTail(List* &L, int data){
	Node* p = createNode(data);
	if(p == NULL)
		return false;
	if(L == NULL){
		L = createList(p);
		return true;
	}
    // h -> a -> b -> c -> tail
	L->pTail->pNext = p;
	L->pTail = p;
	return true;
}

void removeHead(List* &L){
	if(L == NULL)
		return;
	if(L->pHead == L->pTail){
		delete L->pHead;
		L->pHead = NULL;
		L->pTail = NULL;
		return;
	}
	Node* p = L->pHead;
	L->pHead = L->pHead->pNext;
	delete p;
}

void removeTail(List* &L){
	if(L == NULL)
		return;
	if(L->pHead == L->pTail){
		delete L->pHead;
		L->pHead = NULL;
		L->pTail = NULL;
		return;
	}
	Node* p = L->pHead;
	while(p->pNext != L->pTail){
		p = p->pNext; 
	}
	p->pNext = NULL;
	delete p->pNext;
	L->pTail = p;
}

void removeAll(List* &L){
	if(L == NULL)
		return;
	while(L->pHead != NULL){
		removeHead(L);
	}
}

void removeBefore(List* &L, int val){
	if(L == NULL)
		return;
	if(L->pHead == L->pTail)
		return;
	if(L->pHead->pNext->key == val){
		removeHead(L);
		return;
	}
	// h -> a -> b -> c -> t
	// p2   p1
	Node* p1 = L->pHead->pNext;
	Node* p2 = L->pHead;
	// h -> a -> b -> c -> t
	// p2   p1   v
	while(p1->pNext->key != val && p1 != L->pTail){
		p1 = p1->pNext;
		p2 = p2->pNext;
	}
	// connect the value with the heading
	if(p1 != L->pTail){
		p2->pNext = p1->pNext;
	}
	// remove the value before
	delete p1;
}

void removeAfter(List* &L, int val){
	if(L == NULL)
		return;
	if(L->pHead == L->pTail)
		return;
	Node* p1 = L->pHead;
	while(p1->key != val && p1 != L->pTail){
		p1 = p1->pNext;
	}
	if(p1 == L->pTail)
		return;
	if(p1->pNext == L->pTail){
		removeTail(L);
		return;
	}
	Node* p = p1->pNext;
	p1->pNext = p->pNext;
	delete p;
}

void removeDuplicate(List* &L){
	//Cách 1: Tạo L', với mỗi node của L, nếu giá trị node này chưa xuất hiện trong L' add vào L'. Gán lại L = L'.
	//Cách 2: Tạo 2 vòng lặp, nếu gặp phần tử trùng, xóa đi
	if(L == NULL)
		return;
	if(L->pHead == L->pTail){
		return;
	}
	Node* p = L->pHead->pNext;
	Node* q = L->pHead;
	while(p != NULL){
		Node* p1 = L->pHead;
		while( p1 != p && p1->key != p->key){
			p1 = p1->pNext;
		}
		if(p1 != p){
			q->pNext = p->pNext;
			delete p;
			p = q->pNext;
			if(p == NULL){
				L->pTail = q;
			}
		}
		else{
			p = p->pNext;
			q = q->pNext;
		}
	}
}

int main(){
	Node* p = createNode(5);
	List* L = createList(p);
	addHead(L, 10);
	addTail(L, 7);
	addTail(L, 7);
	addTail(L, 7);
	addTail(L, 10);
	//removeHead(L);
	//removeHead(L);
	//removeTail(L);
	//removeBefore(L, 5);
	printList(L);
	//removeAll(L);
	//cout << endl;
	//cout << L->pHead->key << "  " << L->pTail->key;
	//if(L->pHead == NULL)
	//	cout << "List deleted";
	// removeDuplicate(L);
	removeTail(L);
	cout << endl;
	printList(L);
	return 0;
}