#include <iostream>
#include <string>
#include <fstream>

using namespace std;

int main(){
    fstream fil("input.txt", ios::in);
    int n;
    fil >> n;
    fil.close();
    fil.open("input.txt", ios::app);
    int tmp = n / 3;
    fil << " " << tmp;
    

    return 0;
}