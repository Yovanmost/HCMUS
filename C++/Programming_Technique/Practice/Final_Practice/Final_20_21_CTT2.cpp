#include <iostream>
#include <cstring>

using namespace std;

int countNumChar(char* str){
    if (str[0] == '\0')
        return 0;
    if (str[0] >= '0' && str[0] <= '9')
        return 1 + countNumChar(str+1);
    else return countNumChar(str+1);
    
}

//--------------------------------------------------------------------------------------------------------
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
//--------------------------------------------------------------------------------------------------------

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

struct Person
{
    char name[50];
    int age;
    char phone[24];
};

int main(){
    char* s = "012345";
    char* tmp = s + strlen(s) - 4;
    cout << tmp[0];

    return 0;   
}