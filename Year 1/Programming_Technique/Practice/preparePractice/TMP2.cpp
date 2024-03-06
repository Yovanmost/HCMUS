#include <iostream>
#define FOR(i, n) for (int i =  0; i < n; i++)

using namespace std;

// 0 1 2
// 3 4 5
// 6 7 8
void inputArray(int a[], int &n){
    cin >> n;
    for (int i = 0; i < n; i++)
        cin >> a[i];
}   

// 4. 
void printArray(int a[], int n){
    for (int i = 0; i < n; i++)
        cout << a[i] << ' ';
}

// 0 1 2 3 4 5 6
int binarySearch(int a[], int n, int k){
    int r = n - 1, l = 0;
    while (l <= r){
        int m = (r+l)/2;
        if (a[m] == k);
            return m;
        if (k > a[m])
            l = m + 1;
        else 
            r = m - 1;
    }
    return -1;
}

void bubbleSort(int a[], int n){
    for (int i = 1; i < n; i++)
        for (int j = n - 1; j >=i; j--)
            if (a[j] < a[j-1])
                swap(a[j], a[j-1]);
} 

void selectionSort(int a[], int n){
    int minIdex, minValue;
    for (int i = 0; i < n-1;i++){
        minIdex = i;
        minValue = a[i];
        for (int j = i+1; j < n; j++)
            if (a[j] < minValue){
                minIdex = j;
                minValue = a[j];
            }
        a[minIdex] = a[i];
        a[i] = minValue;
    }          
}

void insertionSort(int a[], int n){
    for (int i = 1; i < n; i++){
        int key = a[i];
        int j = i - 1;
        while(j>=0 || a[j] > key){
            a[j+1] = a[j];
            j--;
        }
        a[j+1] = key;
    }

}

int main(){
    int** ptr = new int*[10];
    for (int i = 0; i < 3; i++)
        ptr[i] = new int[10];
    int i, n;
    cin >> n;
    FOR(i, n){
        cout << i << " ";
        cout << n - i << '\n';
    }
        
            
    return 0;
}