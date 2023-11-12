#include <iostream>
#include <fstream>
#include <cstdlib>
#include <ctime>

#define long long long

using namespace std;

void createRandomArray(int n, long k){
    long arr[n];
    srand(time(0));
    for (int i = 0; i < n; i++) {
        arr[i] = rand() % (k + 1);
        cout << arr[i] << " ";
    }
}

void foo(long k){
    srand(time(0));
    long tmp = 0;
    while (tmp != k){
        tmp = rand() % (k+1);
        cout << tmp << '\n';
    }
}

void randomTest(){
    long int randNum;
    long int randMax = 30000000;
    long int randMin = 1000000;

    srand (time (0));
    randNum = rand () % (randMax - randMin) + randMin;
    while (randNum < randMax){
        randNum = rand () % (randMax - randMin) + randMin;
        cout << randNum << '\n';
    }
    
}

int main(){
    int n;
    long k;
    // cin >> k;
    // createRandomArray(n, k);
    // foo(k);
    randomTest();
    

    return 0;
}