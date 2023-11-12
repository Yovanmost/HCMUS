#include <iostream>
#include <cstring>

using namespace std;

int digitMatch(int a, int b){
    if (a == 0 || b == 0)
        return 0;
    if ((a % 10) == (b % 10))
        return 1 + digitMatch(a/10, b/10);
    else if ((a % 10) != (b % 10))
        return digitMatch(a/10, b/10);
}

int main(){
    int a = 1234567;
    int b = 67;
    cout << digitMatch(a, b);

    return 0;
}