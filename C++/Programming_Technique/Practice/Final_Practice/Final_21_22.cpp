#include <iostream>
#include <string>

using namespace std;

void allLower(string &s){
    for (int i = 0; i < s.length(); i++){
        if (s[i] >= 'A' && s[i] <= 'Z')
            s[i] = (char)tolower(s[i]);
    }
}

void removePunctuation(string &s){
    string tmp;
    for (int i = 0; i < s.length(); i++){
        if ((s[i] >= 'a' && s[i] <= 'z') || s[i] == ' ')
            tmp += s[i];
        else if ((s[i] == ',' && s[i+1] != ' ') || (s[i] == '.' && s[i+1] != ' ') && i != s.length() - 1)
            tmp += " ";
    }
    s.swap(tmp);
}

bool palindromeString(string s){
    string tmp;
    allLower(s);
    removePunctuation(s);
    string original = s;
    while (s.rfind(" ") != string::npos){
        int lastSpacePos = s.rfind(" ");
        tmp += s.substr(lastSpacePos+1);
        tmp += " ";
        s.erase(lastSpacePos);
    }
    tmp += s;
    if (tmp == original){
        cout << "\n" << tmp << "\n" << original;
        return true;
    }
    return false;
}


/*Question 2*/
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

void inputArray(int* &a, int &n){
    cin >> n;
    a = new int [n];
    for (int i = 0; i < n; i++)
        cin >> a[i];
}

int listLength(Node* pHead){
    Node* p = pHead;
    int count = 0;
    while (p != NULL){
        count++;
        p = p->pNext;
    }
    return count;
}

int countSubLinkedListAppearance(Node* head, Node* tail, Node* h, Node* t){
    Node* tmp = head;
    int n = listLength(h);
    int counter = 0;
    int times = 0;
    while (tmp != NULL){
        Node* tmp2 = tmp;
        Node* tmpH = h;
        bool flag = true;
        while (tmpH != NULL && tmp2 != NULL){
            if (tmp2->data == tmpH->data){
                counter++;
            }else break;
            tmp2 = tmp2->pNext;
            tmpH = tmpH->pNext;
        }
        if (counter == n){
            times++;
            counter = 0;
        }
        counter = 0;
        tmp = tmp->pNext;
    }

    return times;
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

bool checkIncreaseNode(Node* h){
    if (h->pNext == NULL)
        return true;
    if (h->data < h->pNext->data)
        checkIncreaseNode(h->pNext);
    else return false;    
}

bool checkIncreaseSteadilyNode(Node* h){
    // two nodes only
    if (h->pNext->data - h->data <= 0)
        return false;
    // check the end 
    if (h->pNext->pNext == NULL)
        return true;
    // check three nodes
    if ((h->pNext->pNext->data - h->pNext->data) == (h->pNext->data - h->data))
        checkIncreaseNode(h->pNext);
    else return false;    
}




int main(){
    int* a, *d, n, m;
    List b;
    List c;
    cout << "In a: ";
    inputArray(a ,n);
    b = createListV2(a, n);
    printList(b);
    

    return 0;
}
