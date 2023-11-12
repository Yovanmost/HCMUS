#include <iostream>

using namespace std;

void decimalToBinary(unsigned int n){
    if (n == 0){
        cout << 0;
        return;
    }   
    int* stack = new int [100];
    int top = -1;    
    while (n != 0){
        stack[++top] = n % 2;
        n = n/2;
    }
    while (top > -1){
        cout << stack[top--];
    }
}

int main(){
    int n;
    cin >> n;
    decimalToBinary(n);

    return 0;
}