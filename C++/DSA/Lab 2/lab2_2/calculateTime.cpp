#include <iostream>
#include <chrono>

using namespace std;

void myFunction() {
    for (int i = 0; i < 1000; i++)
        cout << i << ' ';
}

int main() {
    auto start = chrono::high_resolution_clock::now();
    myFunction();
    auto finish = chrono::high_resolution_clock::now();
    auto duration = chrono::duration_cast<chrono::milliseconds>(finish - start);
    cout << "Time taken by function: " << duration.count() << " milliseconds" << endl;
    return 0;
}
