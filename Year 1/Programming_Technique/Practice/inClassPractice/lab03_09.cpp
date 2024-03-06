#include <iostream>

using namespace std;


// 9. Find the longest ascending subarray from a given array.
bool checkAscSubArray(int* a, int pos, int n){
    for (int i = pos; i < n; i++)
        if (a[i] >= a[i+1])
            return false;
    return true;
}

int* findLongestAscendingSubarray(int* a, int n, int &length){
    length = 0;
    int first = 0, last = 0;
    for (int i = 0; i < n-1; i++)
        for (int j = i + 1; j < n; j++)
            if (checkAscSubArray(a, i, j)){
                int tmpLength = j - i + 1;
                if (tmpLength > length){
                    length = tmpLength; 
                    first = i;
                    last = j;
                }
            }
    
    int *b = new int[length];
    for (int i = first; i <= last; i++){
        b[i-first] =  a[i];
    }
    return b;   
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

void freeArray(int* a){
    delete []a;
}   

int main(){
    int* a, n;
    inputArray(a, n);
    int sumTotal,len; 
    int* b = findLongestAscendingSubarray(a, n, len);
    printArray(b, len);
    

    freeArray(a);
    freeArray(b);

    return 0;
}