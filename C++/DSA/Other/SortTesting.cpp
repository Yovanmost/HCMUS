#include <iostream>
#define MAXI 100

using namespace std;

void print(int a[], int n){
    for (int i = 0; i < n; i++)
        cout << a[i] << ' ';
    cout << '\n';
}

void bubbleSort(int a[], int n){
    int count = 0;
    for (int i = 0; i < n - 1; i++){
        for (int j = n - 1; j > i; j--)
            if (a[j] < a[j-1]){
                swap(a[j], a[j-1]);
                count++;
                print(a, n);
            }
        
    }
        
    cout << count;
}

void selectionSort(int a[], int n){
    int minIdex = 0;
    int countC = 0, countS = 0;
    for (int i = 0; i < n - 1; i++){
        for (int j = i+1; j < n; j++)
            if (a[j] < a[minIdex]){
                countC++;
                minIdex = j;
            }
        if (i != minIdex){
            swap(a[i], a[minIdex]);
            countS++;
        }       
        print(a, n);
    }
    cout << countC << ' ' << countS << '\n';
}

void insertionSort(int a[], int n){
    int i, key, j;
    for (i = 1; i < n; i++) {
        key = a[i];
        j = i - 1;
 
        while (j >= 0 && a[j] > key) {
            a[j + 1] = a[j];
            j = j - 1;
        }
        a[j + 1] = key;
        print(a, n);
    }
}

void interchangeSort(int a[], int n){
    for (int i = 0; i < n - 1; i++){
        for (int j = i+1; j < n; j++){
            if (a[i] > a[j])
                swap(a[i], a[j]);
        }
        print(a, n);
    }
}

int main(){
    int a[MAXI] = {8, 4, 2, 1};
    int n = 4;
    bubbleSort(a, n);
    // selectionSort(a, n);
    // insertionSort(a, n);
    // interchangeSort(a, n);
    // print(a, n);
    cout << 1000*0.05;

    return 0;
}