#include <iostream>

using namespace std;


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

// 8. Find the subarray with the largest total value from a given array.
int sumSubArray(int* a, int pos, int n){
    int sum = 0;
    for (int i = pos; i <= n; i++)
        sum += a[i];
    return sum;
}

int* findLargestTotalSubarray(int* a, int n, int &total, int &length){
    total = -1e6;
    length = 0;
    int first = 0, last = n - 1;
    for (int i = 0; i < n-1; i++)
        for (int j = i; j < n; j++)
            if (total < sumSubArray(a, i, j)){
                total = sumSubArray(a, i, j);
                length = j - i + 1;
                first = i;
                last = j;
            }    
    int *b = new int[length];
    for (int i = first; i <= last; i++){
        b[i-first] =  a[i];
    }
    return b;
}

void freeArray(int* a){
    delete []a;
}   



int main(){
    int* a, n;
    inputArray(a, n);
    int sumTotal,len; 
    int* b = findLargestTotalSubarray(a, n, sumTotal, len);
    printArray(b, len);

    freeArray(a);
    freeArray(b);
    return 0;
}