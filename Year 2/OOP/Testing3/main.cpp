#include <iostream>
#include <vector>

using namespace std;

vector<int> vecPublic{0, 1, 2};

void sort(int a[], int n){
    for (int i = 0; i < n; i++)
        for (int j = 0; j < i; j++)
            if (a[i] < a[j])
                swap(a[i], a[j]);
}

void addVector(vector<int> vec){
    vecPublic.insert(std::end(vecPublic), std::begin(vec), std::end(vec));
}


int main(){
    vector<int> tmp{3, 4, 5, 6};
    addVector(tmp);
    // int a[] = {0, 1, 2, 3};
    // int i became a pointer that traverse inside the vector
    for (int i : vecPublic)
        cout << i << ' ';

    return 0;
}