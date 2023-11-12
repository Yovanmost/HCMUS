#include <iostream>

using namespace std;

// 11. Concatenate 2 given array.
int* concatenate2Arrays(int* a, int* b, int na, int nb){
    int* newArray = new int[na+nb];
    for (int i = 0; i < na; i++)
        newArray[i] = a[i];
    for (int i = na; i < nb+na; i++)
        newArray[i] = b[i-na];

    return newArray;
}

void inputArray(int* &a, int &n){
    cin >> n;
    a = new int[n];
    for (int i = 0; i < n; i++)
        cin >> a[i];
}   
void printArray(int *a, int n){
    for (int i = 0; i < n; i++)
        cout << a[i] << ' ';
}

void sort(int* a, int n){
    for (int i = 0; i < n - 1; i++)
        for (int j = i + 1; j < n; j++)
            if (a[i] > a[j]) 
                swap(a[i], a[j]);
}

int* merge2Arrays(int* a, int* b, int na, int nb, int&nc){
    int *c = concatenate2Arrays(a, b, na, nb);
    nc = na+nb;
    sort(c, na+nb);
    return c;
}

void freeArray(int* a){
    delete []a;
}   

// void swapArray(int *&a, int *&b, int& na , int& nb){
//     int* tmp = a;
//     a = b;
//     b = tmp;

//     int sizeTmp = na;
//     na = nb;
//     nb = sizeTmp;
// }

void swapArray(int *&a, int *&b, int& na , int& nb){
    int* tmp = a;
    a = b;
    b = tmp;

    int sizeTmp = na;
    na = nb;
    nb = sizeTmp;
}

int main(){
    int* a, *b, n, m;
    inputArray(a, n);
    inputArray(b, m);
    // int *c = concatenate2Arrays(a, b, n, m);
    // printArray(c, m+n);
    // int nc;
    // int* c = merge2Arrays(a, b, n, m, nc);
    // printArray(c, nc);

    // freeArray(a);
    // freeArray(b);
    // freeArray(c);

    swapArray(a, b, n, m);
    printArray(a, n);
    printArray(b, m);
    
    return 0;
}