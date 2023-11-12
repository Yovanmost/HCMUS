#include <iostream>

using namespace std;

void inArray(int a[], int &n){
    cin >> n;
    for (int i = 0; i < n; i++){
        cin >> a[i];
    }
}

void outArray(int a[], int n){
    for (int i = 0; i < n; i++){
        cout << a[i] << " ";
    }
}

void insertionSort(int a[], int n){
    int x, i, j;
    for (i = 1; i < n; i++){
        x = a[i];
        j = i - 1;
        while((j >= 0) && (a[j] > x)){
            a[j+1] = a[j];
            j--;
        }
        a[j+1] = x;
    outArray(a, n);
    cout << "\n";    
    }
}

void bubbleSortDesc(int a[], int n){
    for (int i = 0; i < n; i++)
        for (int j = n - 1; j >= i; j--)
            if (a[j] > a[j-i])
                swap(a[j], a[j-1]);
}

void bubbleSort(int a[], int n){
    for (int i = 0; i < n - 1; i++){
        for (int j = i + 1; j < n; j++)
            if (a[j] > a[j+i])
                swap(a[j+1], a[j]);
        outArray(a, n);
        cout << '\n';
    }
        
}

void selectionSortDesc(int a[], int n){
    int maxIndex = 0;
    int maxValue = a[0];
    for (int i = 0; i < n - 1; i ++){
        maxIndex = i;
        maxValue = a[i];
        for (int j = i + 1; j < n; j++)
            if (a[j] > maxValue){
                maxIndex = j;
                maxValue = a[j];
            }
        swap(a[i], a[maxIndex]);
    }   
}

void interchangeSortDesc(int a[], int n){
    for (int i = 0; i < n - 1; i++)
        for (int j = i + 1; j < n; j++)
            if (a[j] > a[i])
                swap(a[j], a[i]);
}

void interchangeSort(int a[], int n){
    for (int i = 0; i < n - 1; i++){
        for (int j = i + 1; j < n; j++)
            if (a[j] < a[i]){
                swap(a[j], a[i]);
                outArray(a, n);
                cout << "\n";
            }
    }
        
}

int main(){
    int n;
    int a[1000];
    inArray(a, n);
    // outArray(a, n);
    cout << "\n";
    // insertionSort(a, n);
    // bubbleSortDesc(a, n);
    // selectionSortDesc(a, n);
    // interchangeSort(a, n);
    bubbleSort(a, n);
    outArray(a, n);

    return 0;
}