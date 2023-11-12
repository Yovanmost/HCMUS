#include <iostream>
#include <math.h>
#define minimum INT32_MIN
#define maximum INT32_MAX

using namespace std;

struct Node
{
    int key;
    Node* pNext;
};

struct List 
{
    Node* pHead;
    Node* pTail;
};

Node* createNode(int data){
    Node* p = new Node;
    p->key = data;
    p->pNext = NULL;
    return p;
}

List* createList(Node* p_node){
    List* L = new List;
    L->pHead = p_node;
    L->pTail = p_node;
    return L;
}

bool addHead(List* &L, int data){
    Node* p = createNode(data);
    if (p == NULL)
        return false;
    if (L == NULL){
        L = createList(p);
        return true;
    }
    p->pNext = L->pHead;
    L->pHead = p;
    return true;
}

void addTailV2(List* &L, Node* &p){
    if (p == NULL)
        return;
    if (L == NULL){
        L = createList(p);
        return;
    }
    p->pNext = L->pHead;
    L->pHead = p;
    return;
}

bool addTail(List* &L, int data){
    Node* p = createNode(data);
    if (p == NULL)
        return false;
    if (L == NULL){
        L = createList(p);
        return true;
    }
    L->pTail->pNext = p;
    L->pTail = p;
    return true;
}

void removeHead(List* &list){
    if (list == NULL)
        return;
    if (list->pHead == list->pTail){
        delete list->pHead;
        list->pHead = NULL;
        list->pTail = NULL;
        return;
    }
    Node* p = list->pHead;
    list->pHead = list->pHead->pNext;
    delete p;
}

void removeTail(List* &listNode){
    if (listNode == NULL)
        return;
    if (listNode->pHead == listNode->pTail){
        delete listNode->pHead;
        listNode->pHead = NULL;
        listNode->pTail = NULL;
        return;
    }
    Node* p = listNode->pHead;
    while (p != listNode->pTail){
        p = p->pNext;
    }
    // cut the tail
    p->pNext = NULL;
    delete p->pNext;
    //connect the tail
    listNode->pTail = p;
}

void removeAll(List* &L){
    if (L == NULL)
        return;
    while (L->pHead != NULL)
        removeHead(L);
}

void removeBefore(List* &L, int data){
    // base case
    if(L == NULL)
		return;
	if(L->pHead == L->pTail)
		return;
    // if head is the value
    if (L->pHead->pNext->key == data){
        removeHead(L);
        return;
    }
    // h -> a -> b -> c -> t
	// p2   p1
    Node* p1 = L->pHead->pNext;
    Node* p2 = L->pHead;
    // h -> a -> b -> c -> t
	// p2   p1   v
    while (p1->pNext->key != data && p1 != L->pTail){
        p1 = p1->pNext;
        p2 = p2->pNext;
    }
    // connect the value with the heading
    if (p1 != L->pTail)
        p2->pNext = p1->pNext;
    // remove the value before 
    delete p1;
}

void removeAfter(List* &L, int data){
    // base case
    if(L == NULL)
		return;
	if(L->pHead == L->pTail)
		return;
    Node* p = L->pHead;
    while (p->key != data && p != L->pTail){
        p = p->pNext;
    }
    // nothing
    if (p == L->pTail)
        return;
    // at the end
    if (p->pNext == L->pTail){
        removeTail(L);
        return;
    }
    // h -> a -> b -> c -> t
    //      p    p1   p1.pNext
    Node* p1 = p->pNext;
    p->pNext = p1->pNext;
    delete p1;
}

List* removeDuplicate(List* &L){
    if(L == NULL)
		return NULL;
	if(L->pHead == L->pTail){
		return NULL;
	}
    bool flag = false;
    List* newList = NULL;
    Node* tmp = L->pHead;
    addTail(newList, tmp->key);
    while (tmp != NULL){
        Node* pHead = newList->pHead;
        while (pHead != NULL){
            if (tmp->key == pHead->key){
                flag = true;
                break;
            }
            pHead = pHead->pNext;
        }
        if (flag == false){
            addTail(newList, tmp->key);
        }else flag = false;
        tmp = tmp->pNext;
    }
    return newList;
}

void printList(List* L){
    if (L == NULL)
        return;
    Node* p = L->pHead;
    while (p != NULL){
        cout << p->key << "   ";
        p = p->pNext;
    }
    cout << '\n';
}

List* removeX(List* &L, int k){
    if (L == NULL)
        return NULL;
    if (L->pHead == L->pTail && L->pHead->key == k)
        return NULL;
    List* newList = NULL;
    Node* p = L->pHead;
    while (p != NULL){
        if (p->key == k){

        }else addTail(newList, p->key);
        p = p->pNext;
    }

    return newList;
}

List* reverseList(List* &L){
    if (L == NULL)
        return NULL;
    // if (L->pHead == L->pTail)
    //     return NULL;
    List* newList = NULL;
    Node* Head = L->pHead;
    while (Head != NULL){
        addHead(newList, Head->key);
        Head = Head->pNext;
    }
    return newList;
}

void addElement(List* &L){
    int t;
    while (true){
        cin >> t;
        if (t == 0) break;
        if (L == NULL){
            L = createList(createNode(t));
        }else addTail(L, t);
    };
}

List* addEven(List* &L){
    if (L == NULL)
        return NULL;
    List* newList = NULL;
    if (L->pHead == L->pTail){
        newList = createList(L->pHead);
        addHead(newList, 2);
        return newList;
    }

    int even = 2;
    int i = 1;
    Node* tmp = L->pHead;
    while (tmp != NULL){
        addTail(newList, even*(i++));
        addTail(newList, tmp->key);
        tmp = tmp->pNext;
    }
    return newList;
}

Node* moveTo(List* L, int pos){
    if (L == NULL)
        return NULL;
    if (pos == 0)
        return L->pHead;
    
    int count = 0;
    Node* p = L->pHead;
    while (p != NULL && count < pos){
        p = p->pNext;
        count++;
    }
    return p;
}

// only the value and next
Node* copyNode(Node* p){
    Node* tmp = new Node;
    tmp->key= p->key;
    tmp->pNext = p->pNext;
    return tmp;
}

void sortList(List* L){
    if (L == NULL)
        return;
    if (L->pHead == L->pTail)   
        return;
    
    Node* p = L->pHead;
    while (p != NULL){
        Node* tmp = p->pNext;
        while (tmp != NULL){
            if (tmp->key < p->key){
                int t = p->key;
                p->key = tmp->key;
                tmp->key = t;
            }
        tmp = tmp->pNext;
        }
        p = p->pNext;   
    }
}

void addOrder(List* &L, int data){
    if (L == NULL)
        return;
    if (L->pHead == L->pTail)
        if (L->pHead->key > data){
            addHead(L, data);
            return;
        }
        else {
            addTail(L, data);
            return;
        }
    
    if (data > L->pTail->key){
        addTail(L, data);
        return;
    }

    if (data < L->pHead->key){
        addHead(L, data);
        return;
    }
    
    Node* p = L->pHead;      
    Node* p1 = p->pNext;  
    while (p != NULL && p1 != NULL){
        if (p->key <= data && data <= p1->key){
            Node* tmp = createNode(data);
            tmp->pNext = p1;
            p->pNext = tmp;
            break;
        }
        p = p->pNext;
        p1 = p1->pNext;
    }
}

int listLength(List* L){
    Node* p = L->pHead;
    int count = 0;
    while (p != NULL){
        count++;
        p = p->pNext;
    }
    return count;
}

List* listOfSum(List* &in){
    int sum = 0;
    if (in == NULL)
        return NULL;
    List* sumList = NULL;
    if (in->pHead == in->pTail){
        sumList = createList(in->pHead);
        return sumList;
    }
    int i = 1;
    Node* p = in->pHead;
    while (p != NULL){
        Node* tmp = in->pHead;
        for (int j = 0; j < i; j++){
            sum += tmp->key;
            tmp = tmp->pNext;
        }
        addTail(sumList, sum);
        i++;
        sum = 0;
        p = p->pNext;
    }
    return sumList;  
}

void oneBecomeTwo(List* &in, List* &first, List* &second){
    if (in == NULL)
        return;
    if (in->pHead == in->pTail)
        return;
    
    int i = 1;
    Node* pHead1 = in->pHead;
    Node* pHead2 = in->pHead->pNext;
    // pHead1->pNext = NULL;
    // pHead2->pNext = NULL;    
    // first = createList(pHead1);
    // second = createList(pHead2);
    addTailV2(first, pHead1);
    
    addTailV2(second, pHead2);

    Node* p = in->pHead->pNext->pNext;
    while (p != NULL){
        if (i % 2 == 1){
            first->pTail->pNext = p;
            first->pTail = p;
        }else {
            second->pTail->pNext = p;
            second->pTail = p;
        }
        i++;
        p = p->pNext;
    }       
    printList(first);
    printList(second);
}

void oneBecomeTwoV2(List* &in){
    List* first = NULL;
    List* second = NULL;
    int i = 0;
    while (in->pHead != NULL){
        Node* cutNode = in->pHead;
        in->pHead = in->pHead->pNext;
        cutNode->pNext = NULL;

        if (i++ % 2 == 0){
            if (first == NULL){
                first = createList(cutNode);
            }
            else{
                first->pTail->pNext = cutNode;
                first->pTail = cutNode;
            }
        }
        else {
            if (second == NULL){
                second = createList(cutNode);
            }
            else{
                second->pTail->pNext = cutNode;
                second->pTail = cutNode;
            }
        }
    }

    in = first;
    printList(first);
    printList(second);

}

void printListV2(List* L){
    Node* p = L->pHead;
    do{
        cout << p->key << "  ";
        p = p->pNext;
    }while (p != L->pTail);
    cout << p->key;
    cout << '\n';
}

List* twoBecomeOne(List* &a, List* &b){
    Node* p1 = a->pHead;
    Node* p2 = b->pHead;
    
    List* join = NULL;
    int len = listLength(a) + listLength(b);
    int minLen = min(listLength(a), listLength(b));
    int i = 0;
    while (((minLen == listLength(a)) ? p1 : p2) != NULL){
        addTail(join, p1->key);
        addTail(join, p2->key);
        p1 = p1->pNext;
        p2 = p2->pNext;
        i+=2;
    }
    while (i < len){
        i++;
        if (minLen == listLength(a)){
            addTail(join, p2->key);
            p2 = p2->pNext;
        }else {
            addTail(join, p1->key);
            p1 = p1->pNext;
        }
    }
    return join;
}

bool isPrime(int n){
    if (n < 2)
        return false;
    for (int i = 2; i < n/2; i++)
        if (n % i == 0)
            return false;
    return true;
}

void primePicker(List* &L, int start, int end){
    if (end >= listLength(L))
        return;
    if (start < 0)
        return;
    if (L == NULL)
        return;
    if (L->pHead == L->pTail)
        if (start == end && start == 0){
            cout << L->pHead->key;
            return;
        }else return;

    Node* p = L->pHead;
    int count = 0;
    while (count++ != start){
        p = p->pNext;
    }
    while (p != NULL && start++ < end){
        if (isPrime(p->key))
            cout << p->key << "  ";
        p = p->pNext;
    }
}

List* joinTwoLists(List* &a, List* &b){
    List* joined = NULL;
    while (a->pHead != NULL){
        Node* cutNode = a->pHead;
        a->pHead = a->pHead->pNext;
        cutNode->pNext = NULL;
        
        if (joined == NULL)
            joined = createList(cutNode);
        else{
            joined->pTail->pNext = cutNode;
            joined->pTail = cutNode;
        }
    }
    while (b->pHead != NULL){
        Node* cutNode = b->pHead;
        b->pHead = b->pHead->pNext;
        cutNode->pNext = NULL;

        if (joined == NULL)
            createList(cutNode);
        else{
            joined->pTail->pNext = cutNode;
            joined->pTail = cutNode;
        }
    }
    cout << "Joined: \n";
    printList(joined);
}

int main(){
    // Node* p = createNode(5);
	// List* L = createList(p);
    // List* L = NULL;
    // addElement(L);
    // printList(L);
    // int a, b;
    // cin >> a >> b;
    // primePicker(L, a, b);
    List* a = createList(createNode(2));
    addTail(a, 10);
    addTail(a, 11);
    // addTail(a, 12);
    // addTail(a, 13);
	// addTail(a, 14);
    // addTail(a, 15);
    // addTail(a, 16);
    List* b = createList(createNode(4));
    addTail(b, 1);
	addTail(b, 2);
    addTail(b, 3);
    addTail(b, 4);
    addTail(b, 5);
    addTail(b, 6);
    printList(a);
    printList(b);
    // oneBecomeTwoV2(L);
    // // addElement(L);
    // printList(a);
    // printList(b);
    // List* tmp = twoBecomeOne(a, b);
    List* tmp2 = joinTwoLists(a, b);
    // printList(tmp);
    // printList(L);
    return 0;
}
    // cout << L->pTail->key;
    // List* tmp = 
    // cout << '\n';
    // printList(tmp);
    // addTail(L, 4);
	// addHead(L, 5);
    // addTail(L, 5);
    // addTail(L, 7);
    // addTail(L, 10);
    // addTail(L, 10);
    // addTail(L, 10);
    // addTail(L, 7);
    // addHead(L, 10);
	// addTail(L, 7);
	// addTail(L, 7);
	// addTail(L, 7);
	// addTail(L, 10);
    // addTail(L, 10);
    // addTail(L, 10);
    // addTail(L, 10);

        // printListV2(L);
    // oneBecomeTwo(L, a, b);
    // cout << "a: ";
    // printListV2(a);
    // cout << "b: ";
    // printListV2(b);
