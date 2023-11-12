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

void shuffleMatrix(Points** matrix, int size){
    // Create a array of pair interger pairs
    // The array will only contain 25 distinct character pairs
    int sizeOfPair = (size-2) * (size-2); // remove the border
    char arrPair[sizeOfPair];
    int count = 0;
    for (int i = 0; i < sizeOfPair; i++){
        arrPair[i] = count / 2 + 'A';
        count++;
        if (count == 50)
            count = 0;
    }
// Shuffle the array of pairs
    for (int i = 1; i < size-1; i++){
        for (int j = 1; j < size-1; j++){
            int posInPairArray = rand() % (sizeOfPair);
            matrix[i][j].value = arrPair[posInPairArray];

            // Swap the value in posInPairArray to the end of array and decrease the size of array
            swap(arrPair[posInPairArray], arrPair[sizeOfPair - 1]);
            sizeOfPair--;
        }
    }
}

Points** newMatrix(int n){ // n = 4x4  8x8 or 16x16; 
	Points** matrixBoard = new Points* [n];
	for (int i = 0; i < n; i++){
		matrixBoard[i] = new Points[n];
	}

    	// outline value
	for (int i = 0; i < n; i++)
		for (int j = 0; j < n; j++){
			// outline
			if (i == 0 || i == n-1 || j == n-1 || j == 0){
                matrixBoard[i][j].value = '0';
                matrixBoard[i][j].state = DEL;
            }
		}
    
    matrixBoard[1][1].value = '1';	matrixBoard[1][2].value = '2';	matrixBoard[1][3].value = '3';	matrixBoard[1][4].value = '4';
	matrixBoard[2][1].value = '3';	matrixBoard[2][2].value = '1';	matrixBoard[2][3].value = '4';	matrixBoard[2][4].value = '2';
	matrixBoard[3][1].value = '2';	matrixBoard[3][2].value = '3';	matrixBoard[3][3].value = '1';	matrixBoard[3][4].value = '4';
	matrixBoard[4][1].value = '2';	matrixBoard[4][2].value = '3';	matrixBoard[4][3].value = '4';	matrixBoard[4][4].value = '1';
	
    matrixBoard[1][1].state = NOR;	matrixBoard[1][2].state = NOR;	matrixBoard[1][3].state = NOR;	matrixBoard[1][4].state = NOR;
	matrixBoard[2][1].state = NOR;	matrixBoard[2][2].state = NOR;	matrixBoard[2][3].state = NOR;	matrixBoard[2][4].state = NOR;
    matrixBoard[3][1].state = NOR;	matrixBoard[3][2].state = NOR;	matrixBoard[3][3].state = NOR;	matrixBoard[3][4].state = NOR;
    matrixBoard[4][1].state = NOR;	matrixBoard[4][2].state = NOR;	matrixBoard[4][3].state = NOR;	matrixBoard[4][4].state = NOR;

	return matrixBoard;
}


// void setUpBoard(Points** &pHead, int size){
// 	changePointNode(pHead, 1, 1, NOR, '1');	changePointNode(pHead, 1, 2, NOR, '2');	changePointNode(pHead, 1, 3, NOR, '3');	changePointNode(pHead, 1, 4, NOR, '4');
// 	changePointNode(pHead, 2, 1, NOR, '3');	changePointNode(pHead, 2, 2, NOR, '1');	changePointNode(pHead, 2, 3, NOR, '4');	changePointNode(pHead, 2, 4, NOR, '2');
// 	changePointNode(pHead, 3, 1, NOR, '2');	changePointNode(pHead, 3, 2, NOR, '3');	changePointNode(pHead, 3, 3, NOR, '1');	changePointNode(pHead, 3, 4, NOR, '4');
// 	changePointNode(pHead, 4, 1, NOR, '2');	changePointNode(pHead, 4, 2, NOR, '3');	changePointNode(pHead, 4, 3, NOR, '4');	changePointNode(pHead, 4, 4, NOR, '1');
// }

void printList(Points* pHead){
	Points* p = pHead;
	while(p != NULL){
		cout << p->value << "   ";
		p = p->pNext;
	}
	cout << endl;
}

void printAll(Points** pHead, int size){
    for (int i = 0; i < size; i++)
        printList(pHead[i]);
}

//------------------------------------------------------------------

Points* createNode(int state, char value){
    Points* p = new Points;
    p->state = state;
    p->value = value;
    p->pNext = NULL;
}


int lengthPointNode(Points* pHead){
	Points* p = pHead;
	int count = 0;
	while (p != NULL){
		count++;
		p = p->pNext;
	}
	return count;
}

void addNode(Points* &pHead, int state, char value){
    if(pHead == NULL){ //TH DSLK rong
		pHead = createNode(state, value);
		return;
	}
	else{
		Points* p = pHead;
		while(p->pNext != NULL){
			p = p->pNext;
		}
		p->pNext = createNode(state, value);
		return;
	}	
}

void addNodeV2(Points* &pHead, int state, char value){
    if(pHead == NULL){ //TH DSLK rong
		pHead = createNode(state, value);
		return;
	}
	else{
		Points* p = createNode(state, value);
		p->pNext = pHead;
		pHead = p;
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


// size not length
Points* moveToPointNodeV2(Points** pHead, int x, int y){
	int pos = 0;
	Points* p = pHead[x];
	int move = lengthPointNode(p) - y - 1;
	while (p != NULL && pos < move){
		p = p->pNext;
		pos++;
	}
	return p;
}

void changePointNode(Points** &pHead, int x, int y , int state, char value){
	Points* p = moveToPointNode(pHead, x, y);
	p->x = x;
	p->y = y;
	p->state = state;
	p->value = value;
}

void changePointNodeV2(Points** &pHead, int x, int y , int state, char value){
	Points* p = moveToPointNodeV2(pHead, x, y);
	p->x = x;
	p->y = y;
	p->state = state;
	p->value = value;
}

Points** newLinkedListLU(int width, int length){
    Points** pHead = new Points* [width];
    // head of single linked list
    for (int i = 0; i < width; i++)
        pHead[i] = NULL;
    
	// add all value
	for (int i = 0; i < width; i++)
		for (int j = 0; j < length; j++){
			addNode(pHead[i], NOR, '0');
		}
	
	return pHead;    
}

Points** newLinkedListRD(int width, int length){
    Points** pHead = new Points* [length];
    // head of single linked list
    for (int i = 0; i < length; i++)
        pHead[i] = NULL;
    
	// add all value
	for (int i = 0; i < length; i++)
		for (int j = 0; j < width; j++){
			addNodeV2(pHead[i], NOR, '0');
		}
	
	return pHead;    
}

void removePos(Points* &pHead, int pos){
    if (pos > lengthPointNode(pHead) - 1)
        return;
        
	Points* p = pHead;
	int count = 0;
	while(p != NULL && count < pos - 1){
		p = p->pNext;
		count++;
	}
	
	if(p == NULL)
        return;	

	Points* p1 = p->pNext;
	Points* p2 = p1->pNext;
	
	p->pNext = p2;
	delete p1;
}

void removePosV2(Points* &pHead, int pos, int size){
    // if (pos > lengthPointNode(pHead) - 1)
    //     return;
        
	Points* p = pHead;
	int count = 0;
	int move = size - pos - 1;
	while(p != NULL && count < move - 1){
		p = p->pNext;
		count++;
	}
	
	if(p == NULL)
        return;	

	Points* p1 = p->pNext;
	Points* p2 = p1->pNext;
	
	p->pNext = p2;
	delete p1;
}

Points fillNode(int x, int y){
	Points a;
	a.x = x;
	a.y = y;
	a.state = DEL;
	a.value = '0';
	a.pNext = NULL;
	return a;
}

void loadMatrixIntoLinkedListLeft(Points** &pHead, Points** &board, int size){
    for (int i = 0; i < size; i++){
		Points* p = pHead[i];
		for (int j = 0; j < size; j++)
            changePointNode(pHead, i, j, board[i][j].state, board[i][j].value);      
	}	
}

void loadMatrixIntoLinkedListRight(Points** &pHead, Points** &board, int size){
    for (int i = 0; i < size; i++){
		Points* p = pHead[i];
		for (int j = 0; j < size; j++)
            changePointNodeV2(pHead, i, j, board[i][j].state, board[i][j].value);      
	}	
}

void loadMatrixIntoLinkedListUp(Points** &pHead, Points** &board, int size){
    for (int j = 0; j < size; j++){
		Points* p = pHead[j];
		for (int i = 0; i < size; i++)
            changePointNode(pHead, j, i, board[i][j].state, board[i][j].value); 
	}	
}

void loadMatrixIntoLinkedListDown(Points** &pHead, Points** &board, int size){
    for (int j = 0; j < size; j++){
		Points* p = pHead[j];
		for (int i = 0; i < size; i++)
            changePointNodeV2(pHead, j, i, board[i][j].state, board[i][j].value); 
	}	
}

void linkedListToMatrixLeft(Points** &pHead, Points** &board, int size){
	int j = 0;
	for (int i = 0; i < size; i++){
        Points* p = pHead[i];
		// spine
		while (p != NULL){
			board[i][j++] = *p;
			p = p->pNext;
		}
		while (j < size){
			board[i][j] = fillNode(i, j);
            j++;
		}
		j = 0;
	}
}

void linkedListToMatrixRight(Points** &pHead, Points** &board, int size){
	int j = size - 1;
	for (int i = 0; i < size; i++){
        Points* p = pHead[i];
		// spine
		while (p != NULL){
			board[i][j--] = *p;
			p = p->pNext;
		}
		while (j >= 0){
			board[i][j] = fillNode(i, j);
			j--;
		}
		j = size - 1;
	}
}

void linkedListToMatrixDown(Points** &pHead, Points** &board, int size){
	int i = size - 1;
	for (int j = 0; j < size; j++){
        Points* p = pHead[j];
		// spine
		while (p != NULL){
			board[i--][j] = *p;
			p = p->pNext;
		}
		while (i >= 0){
			board[i][j] = fillNode(i, j);
			i--;
		}
		i = size - 1;
	}
}

void linkedListToMatrixUp(Points** &pHead, Points** &board, int size){
	int i = 0;
	for (int j = 0; j < size; j++){
        Points* p = pHead[j];
		// spine
		while (p != NULL){
			board[i++][j] = *p;
			p = p->pNext;
		}
		while(i < size){
			board[i][j] = fillNode(i, j);
			i++;
		}
		i = 0;
	}
}

void matrixToLinkedListLeft(Points** &pHead, Points** &board, int size){
	for (int i = 1; i < size - 1; i++){
		Points* p = pHead[i];
		for (int j = size - 2; j > 0; j--)
			if (board[i][j].state == DEL && board[i][j].value == '.')
				removePos(p, j);
	}	
}

void matrixToLinkedListRight(Points** &pHead, Points** &board, int size){
	for (int i = 1; i < size - 1; i++){
		Points* p = pHead[i];
		for (int j = 1; j < size - 1; j++)
			if (board[i][j].state == DEL && board[i][j].value == '.')
				removePosV2(p, j, size);
	}	
}

void matrixToLinkedListUp(Points** &pHead, Points** &board, int size){
	for (int j = 1; j < size - 1; j++){
		Points* p = pHead[j];
		for (int i = size - 2; i > 0; i--)
			if (board[i][j].state == DEL && board[i][j].value == '.')
				removePos(p, i);
	}	
}

void matrixToLinkedListDown(Points** &pHead, Points** &board, int size){
	for (int j = 1; j < size - 1; j++){
		Points* p = pHead[j];
		for (int i = 0; i < size - 1; i++)
			if (board[i][j].state == DEL && board[i][j].value == '.')
				removePosV2(p, i, size);
	}	
}

void updateLeft(Points** &pHead, Points** &board, int size){
    matrixToLinkedListLeft(pHead, board, size);
    linkedListToMatrixLeft(pHead, board, size);
}

void updateRight(Points** &pHead, Points** &board, int size){
    matrixToLinkedListRight(pHead, board, size);
    linkedListToMatrixRight(pHead, board, size);
}

void updateUp(Points** &pHead, Points** &board, int size){
    matrixToLinkedListUp(pHead, board, size);
    linkedListToMatrixUp(pHead, board, size);
}

void updateDown(Points** &pHead, Points** &board, int size){
    matrixToLinkedListDown(pHead, board, size);
    linkedListToMatrixDown(pHead, board, size);
}

void removeState(Points &a){
	a.state = DEL;
	a.value = '.';
}

void printBoard(Points** a, int n){
	for (int i = 0; i < n; i++){
		for (int j = 0; j < n; j++)
			cout << a[i][j].value << "   ";			
		cout << '\n';
	}
}

void printR(Points** &pHead, int size){
	for (int i = 0; i < size; i++){
		Points* p = pHead[i];
		for (int j = 0; j < size; j++){
			Points* tmp = moveToPointNodeV2(pHead, i, j);
			cout << tmp->value << "   ";
		}
		cout << '\n';
	}
}

int main(){
    int n = EASY;
    Points** a = newLinkedListRD(n, n);
    Points** b = newMatrix(n);
    // setUpBoard(a, n);
	int x, y;
	shuffleMatrix(b, n);
    // loadMatrixIntoLinkedListGravity(a, b, n);
	loadMatrixIntoLinkedListRight(a, b, n);
   	system("cls");
    // drawBoard(b, n);
	printR(a, n);
	cout << '\n';
	printBoard(b, n);
    while(true){
        cin >> x >> y;
        removeState(b[x][y]);
        cin >> x >> y;
        removeState(b[x][y]);
		// updateV2(a, b, n);
		printR(a, n);
		cout << '\n';
		printBoard(b, n);
		cout << '\n';
		updateRight(a, b, n);
		// printR(a, n);
        // system("cls");
        printR(a, n);
		cout << '\n';
		printBoard(b, n);
    }

	// printAll(a, n);
	// while (true){
		
	// 	cin >> x >> y;
	// 	removePos(a[y], x);
	// 	printAll(a, n);
	// }

    return 0;
}
