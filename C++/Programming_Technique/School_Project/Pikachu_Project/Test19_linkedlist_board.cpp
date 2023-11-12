#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <windows.h>
#include <stdint.h>
#include <conio.h>
#include <cstdlib>
#include <ctime>
// STATE
#define NOR 0
#define SEL 1
#define DEL 2
// MODE
#define EASY 6 // 4 inside 2 outline
#define MEDIUM 8

struct Points{
	int x;
	int y;
	int state; // 0 = normal, 1 = selected, 2 = deleted	
	char value;
    Points* pNext;
};

//------------------------------------------------------------------------
//					REMINDER
//	x and y inside a node does not matter.
// 	Why? because when delete one node, you also delete
//	coordinate of that node. So x and y inside a node is a meaningless approach.
//	So, members like state, value and most importantly pNext matter.
//------------------------------------------------------------------------ 	

static Points highlighter = {0, 0, DEL, '.'};
static int color[6] = {1, 2, 4, 5, 6, 12};

using namespace std;

void SetPosition(int16_t X, int16_t Y){
    HANDLE Screen;
    Screen = GetStdHandle(STD_OUTPUT_HANDLE);
    COORD Position = { Y, X };
    SetConsoleCursorPosition(Screen, Position);
}

void SetColor(int backgound_color, int text_color)
{
    HANDLE hStdout = GetStdHandle(STD_OUTPUT_HANDLE);
    int color_code = backgound_color * 16 + text_color;
    SetConsoleTextAttribute(hStdout, color_code);
}



Points* createPointNode(int x, int y, int state, char value){
	Points* p = new Points;
	p->x = x;
	p->y = y;
	p->state = state;
	p->value = value;
	p->pNext = NULL;
	return p;
}

void addTail(Points* &pHead, int x, int y, int state, char value){
	if (pHead == NULL){ //TH DSLK rong
		pHead = createPointNode(x, y, state, value);
		return;
	}
	else {
		Points* p = pHead;
		while (p->pNext != NULL){
			p = p->pNext;
		}
		p->pNext = createPointNode(x, y, state, value);
		return;
	}
}

Points* moveToPointNode(Points** pHead, int x, int y){
	int pos = 0;
	Points* p = pHead[x];
	while (p != NULL && pos++ < y)
		p = p->pNext;
	return p;
}

void changePointNode(Points** &pHead, int x, int y , int state, char value){
	Points* p = moveToPointNode(pHead, x, y);
	p->x = x;
	p->y = y;
	p->state = state;
	p->value = value;
}

void removeHeadNode(Points* &pHead){
	if (pHead == NULL)
		return;
	Points* p = pHead;
	pHead = pHead->pNext;
	delete p;
}

// the length of row x
int lengthPointNode(Points* pHead){
	Points* p = pHead;
	int count = 0;
	while (p != NULL){
		count++;
		p = p->pNext;
	}
	return count;
}

void removePointNode(Points* &pHead, int y){
	if (y > lengthPointNode(pHead) - 1)
		return;
		
	// p is 1 pos before the deleted one
	Points* p = pHead;
	int count = 0;
	while (p != NULL && count < y - 1){
		p = p->pNext;
		count++;
	}
	// nothing left
	if (p == NULL)
		return;
		
	Points* p1 = p->pNext;
	Points* p2 = p1->pNext;
	//       delete
	//       v
	//    p  p1 p2
	// 0  1  2  3  4
	p->pNext = p2;
	delete p1;
}



void freeAll(Points** pHead, int size){
   Points* tmp;

	for (int i = 0; i < size; i++)
		while (pHead[i] != NULL){
				tmp = pHead[i];
				pHead[i] = pHead[i]->pNext;
				delete tmp;
			}
}

Points** createMatrixLL(int size){
    Points** pHead = new Points* [size];
    // head of single linked list
    for (int i = 0; i < size; i++)
        pHead[i] = NULL;
    
	// add all value
	for (int i = 0; i < size; i++)
		for (int j = 0; j < size; j++){
			addTail(pHead[i], i, j, NOR, '0');
		}
	
	// outline value
	for (int i = 0; i < size; i++)
		for (int j = 0; j < size; j++){
			if (i == 0 || i == size-1 || j == size-1 || j == 0)
                changePointNode(pHead , i, j, DEL, '0');   
		}
	return pHead;
}

void setUpBoard(Points** &pHead, int size){
	changePointNode(pHead, 1, 1, NOR, '1');	changePointNode(pHead, 1, 2, NOR, '2');	changePointNode(pHead, 1, 3, NOR, '3');	changePointNode(pHead, 1, 4, NOR, '4');
	changePointNode(pHead, 2, 1, NOR, '3');	changePointNode(pHead, 2, 2, NOR, '1');	changePointNode(pHead, 2, 3, NOR, '4');	changePointNode(pHead, 2, 4, NOR, '2');
	changePointNode(pHead, 3, 1, NOR, '2');	changePointNode(pHead, 3, 2, NOR, '3');	changePointNode(pHead, 3, 3, NOR, '1');	changePointNode(pHead, 3, 4, NOR, '4');
	changePointNode(pHead, 4, 1, NOR, '2');	changePointNode(pHead, 4, 2, NOR, '3');	changePointNode(pHead, 4, 3, NOR, '4');	changePointNode(pHead, 4, 4, NOR, '1');
}

void printMatrixLL(Points** &pHead, int size){
	for (int i = 0; i < size; i++){
		Points* p = pHead[i];
		while (p != NULL){
			cout << p->value << ' ';
			p = p->pNext;
		}
		cout << '\n';
	}
}

Points** newMatrix(int n){ // n = 4x4  8x8 or 16x16; 
	Points** matrixBoard = new Points* [n];
	for (int i = 0; i < n; i++){
		matrixBoard[i] = new Points[n];
	}
	return matrixBoard;
}

Points deletedNode(int x, int y){
	Points a;
	a.x = x;
	a.y = y;
	a.state = DEL;
	a.value = '.';
	a.pNext = NULL;
	return a;
}

/*
	PROCESS
	1. UPLOAD THE LINKED_LIST ON TO THE MATRIX
	2. ELEMENTS DELETED ON THE MATRIX
	3. RELOAD THE MATRIX TO THE LINKED_LIST
	4. REMOVE THOSE ELEMENTS IN THE LINKED_LIST
	5. UPDATE THE MATRIX AGAIN
*/

// 1.
void linkedListToMatrix(Points** &pHead, Points** &board, int size){
	Points** p = pHead;
	int j = 1;
	for (int i = 1; i < size - 1; i++){
		while (p[i] != NULL){
			board[i][j++] = *p[i];
			p[i] = p[i]->pNext;
		}
		while (j < size - 1){
			board[i][j] = deletedNode(i, j++);
		}
		j = 0;
	}
}


// HERE LIES THE PROBLEM
void matrixToLinkedList(Points** &pHead, Points** &board, int size){
	// do not touch the border
	Points* p = NULL;
	for (int i = 1; i < size - 1; i++){
		p = pHead[i];
		for (int j = size - 2; j > 0; j--){
			if (board[i][j].state == DEL){
				cout << j;
				removePointNode(p, j);
			}
		}
	}	
}

// void removeNodeMatrixToLinkedList(Points** &pHead, Points** &board, int x, int y){
// 	removePointNode(pHead[x], y);
// }

// // find the amount of avalilable node and missing node in a row of linkedlist
// // 										      (row is fixed)V  
void updateMatrixByRow(Points** &pHead, Points** &board, int x, int size){
	// moving the remains
	for (int j = size - 2; j > 0; j--)
		if (board[x][j].state == DEL)
			removePointNode(pHead[x], j);
}

void updateMatrix(Points** pHead, Points** &board, int size){
	for (int i = 1; i < size - 1; i++){
		updateMatrixByRow(pHead, board, i, size);
	}
}



void deleteBoard(Points** a, int n){
	for (int i = 0; i < n; i++)
		delete []a[i];
	delete []a;
}

// ONLY for testing
// Show Board
void printBoard(Points** a, int n){
	for (int i = 0; i < n; i++){
		for (int j = 0; j < n; j++)
			cout << a[i][j].value << ' ';			
		cout << '\n';
	}
}

void drawDelete(Points** board, int pX, int pY){
    cout << "     \n";
    SetPosition(pX+1, pY);
    cout << "     \n";
    SetPosition(pX+2, pY);
    cout << "     \n"; 
}

void drawBoard(Points** board, int size){
	// srand(time(0));
    for (int i = 1; i < size-1; i++){
        for (int j = 1; j < size-1; j++){   
            int pX = (i * 3);
            int pY = (j * 6);
            SetPosition(pX, pY);
            // draw background later
            if (board[i][j].state == DEL){
                // SetColor(BLACK, WHITE);
                drawDelete(board, pX, pY);
            }
            else{
                // drawState(board[i][j].state);
				SetColor(0, 7);
				cout << "+---+\n";
				SetPosition(pX+1, pY);
				cout << "| " << board[i][j].value << " |\n";
				SetPosition(pX+2, pY);
				cout << "+---+\n";
            }
            
        }
    }
}

void remove(Points** board, int &x, int &y){
	cin >> x >> y;
	highlighter.x = x;
	highlighter.y = y;
	board[highlighter.x][highlighter.y].state = DEL;
}

void removeState(Points &a){
	a.state = DEL;
	a.value = '.';
}

void printList(Points* pHead){
	Points* p = pHead;
	while(p != NULL){
		cout << p->value << "   ";
		p = p->pNext;
	}
	cout << endl;
}

int main(){
	Points** a;
	Points* p;
	int n = EASY;
	a = createMatrixLL(n);
	setUpBoard(a, n);
	Points** b = newMatrix(n);
	int x, y;
	while (true){
		// printMatrixLL(a, n);
		linkedListToMatrix(a, b, n);
		// printBoard(b, n);
		cin >> x >> y;
		removeState(b[x][y]);
		// removePointNode(a[x], y);
		// printBoard(b, n);
		// matrixToLinkedList(a, b, n);
		updateMatrix(a, b, n);
		printMatrixLL(a, n);
	}

	// printMatrixLL(a, n);
	// cin >> x >> y;
	// removePointNode(a[x], y);
	// printMatrixLL(a, n);
	
	
    return 0;
}