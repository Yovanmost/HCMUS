#include <iostream>
#include <math.h>
#include <string.h>
#include <cstring>
#include <string>
#include <vector>
#define NOT_PALINDROME 10
using namespace std;

struct NODE{
	int key;
	NODE* p_next;
	
};

struct List{
	NODE* p_head;
	NODE* p_tail;
	
};

// cau 2
// a
NODE* createNode(int data){
	NODE* p = new NODE;
	p->key = data;
	p->p_next = NULL; 
}

void addHead(List &L, int data){
	NODE* p = createNode(data);
	p->p_next = L.p_head;
	L.p_head = p;
}

void addTail(List &L, int data){
	NODE* p = createNode(data);
	L.p_tail->p_next = p;
	L.p_tail = p;
}

List createListV2(int A[], int n){
	List newList;
	NODE* first = createNode(A[0]);
	newList.p_head = first;
	newList.p_tail = first;
	for (int i = 1; i < n; i++)
		addTail(newList, A[i]);
	
	return newList;
}

List createList(int A[], int n){
	List newList;
	NODE* first = createNode(A[n-1]);
	newList.p_head = first;
	newList.p_tail = first;
	for (int i = n - 2; i >= 0; i--){
		addHead(newList, A[i]);
	}
	
	return newList;
}

List printList(List l){
	NODE* p = l.p_head;
	while(p != NULL){
		cout << p->key << "  ";
		p = p->p_next;
	}
	cout << '\n';
}

bool checkPalindrome(int n){
	string s = to_string(n);
	if (s.length() == 1)
		return false;
	for (int i = 0; i < s.length()/2; i++){
		if (s[i] != s[s.length() - 1 - i])
			return false;
	}
	return true;
}

int listLength(List &L){
	NODE* p = L.p_head;
	int count = 0;
	while (p != NULL){
		count++;
		p = p->p_next;
	}
	return count;
}

void deleteNode(NODE* &del){
	NODE* p = del->p_next;
	*del = *p;
	delete del;
}

List splitSymNumber(List &L){
	List splitted;
	List original;
	splitted.p_head = NULL;
	splitted.p_tail = NULL;
	original.p_head = NULL;
	original.p_tail = NULL;
	while (L.p_head != NULL){
		// split the node out of the list
		NODE* cutNode = L.p_head;
		L.p_head = L.p_head->p_next;
		cutNode->p_next = NULL;
		
		// if the node is palindrome
		if (checkPalindrome(cutNode->key) == true){
			if (splitted.p_head == NULL){	// if list is empty
				splitted.p_head = cutNode;
				splitted.p_tail = cutNode;
			}else{	// add to the tail
				splitted.p_tail->p_next = cutNode;
				splitted.p_tail = cutNode;
			}
		}
		else{	// add to the NOT palindrome list (change the pointer latter)
			if (original.p_head == NULL){	// if list is empty
				original.p_head = cutNode;
				original.p_tail = cutNode;
			}else{	// add to the tail
				original.p_tail->p_next = cutNode;
				original.p_tail = cutNode;
			}
		}
	}
	L.p_head = original.p_head;
	L.p_tail = original.p_tail;
	cout << "Original:\n";
	printList(L);
	cout << "Splitted:\n";
	printList(splitted);
	return splitted;
}


// cau 1
// n = row
// m = col
void print2D_Matrix(char** A, int n, int m){
	for (int i = 0; i < n; i++){
		for (int j = 0; j < m; j++)
			cout << A[i][j] << "   ";
		cout << "\n";
	}
}
//
void print3D_Matrix(char*** A, int n, int m, int k){
	for (int i = 0; i < k; i++){
		for (int j = 0; j < n; j++){
			for (int p = 0; p < m; p++)
				cout << A[i][j][p] << " ";
			cout << "\n";
		}
		cout << "\n";
	}		
}

bool checkCaps(char** A, int startR, int endR, int startC, int endC){
	int caps = 0;
	int nors = 0;
	for (int i = startR; i <= endR; i++)
		for (int j = startC; j < endC; j++)
			if (A[i][j] >= 'a' && A[i][j] <= 'z')
				nors++;
			else if (A[i][j] >= 'A' && A[i][j] <= 'Z')
				caps++;
	if (caps > nors)
		return true;
	return false;
}

void add(char** a, char*** b, int startR, int endR, int startC, int endC, int k){
	for (int i = startR; i <= endR; i++)
		for (int j = startC; j < endC; j++)
			b[k][i - startR][j - startC] = a[i][j];
}

char*** findBoringSubMatrix(char** A, int n, int m, int p, int q, int& k){
	k = 0;
	int pos = 0;
	char*** B;

	for (int i = 0; i <= n - p; i++)
		for (int j = 0; j <= m - q; j++)
			if (checkCaps(A, i, i + p - 1, j, j + q - 1))
				k++;

	if (k == 0)
		return NULL;
	B = new char**[k];
	for (int i = 0; i < k; i++){
		B[i] = new char*[p];
		for (int j = 0; j < p; j++)
			B[i][j] = new char [q];
	}
	for (int i = 0; i <= n - p; i++)
		for (int j = 0; j <= m - q; j++)
			if (checkCaps(A, i, i + p - 1, j, j + q - 1)){
				add(A, B, i, i + p - 1, j, j + q - 1, pos++);
			}
	
	return B;
}



int main(){
	int n;
	cin >> n;
	int a[n];
	for (int i = 0; i < n; i++){
		cin >> a[i];
	}

	// List b = createList(a, n);
	List b = createListV2(a, n);
	// printList(b);
	splitSymNumber(b);	

	

	return 0;
}