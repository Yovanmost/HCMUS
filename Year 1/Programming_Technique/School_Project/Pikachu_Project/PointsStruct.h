#include <iostream>
#include <cstring>
#include <fstream>
// State
#define NOR 0
#define SEL 1
#define DEL 2
// Direction
#define LEFT -1
#define RIGHT 1
#define DOWN -1
#define UP 1

using namespace std;

struct Points{
	int x;
	int y;
	int state = NOR; // 0 = normal, 1 = selected, 2 = deleted	
	char value;
};
