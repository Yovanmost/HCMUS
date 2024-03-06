#include <iostream>
#include <cstring>
#include <fstream>
// State
#define NOR 0
#define SEL 1
#define DEL 2

using namespace std;

struct Points{
	int x;
	int y;
	int state = NOR; // 0 = normal, 1 = selected, 2 = deleted	
	char value;
};

struct Board{
    Points** newMatrix(int);
    void deletedBoard(Points**, int);
    void printBoard(Points**, int);
    void printBoardCoordinate(Points**, int);
};

