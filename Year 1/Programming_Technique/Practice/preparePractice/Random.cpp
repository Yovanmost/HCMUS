#include <iostream>
#include <time.h>
#include <stdlib.h>

using namespace std;

int main(){
    srand(time(NULL));
    int i = rand() % 90 + 10;
    cout << i;
    return 0;
}