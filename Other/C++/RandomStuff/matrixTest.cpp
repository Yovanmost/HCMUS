#include <iostream>

using namespace std;

int main(){
    int n = 3;
    for (int i = 1; i < n+1; i++){
        for (int j = 1; j < n+1; j++)
            cout << n * (i - 1) + j - 1 << ' ';
        cout << '\n';
    }   


    return 0;
}