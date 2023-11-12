#pragma once
#include <iostream>
#include <string>
#define long long long
#define uint unsigned int 
#define MAXI 100

using namespace std;

uint a = 10;

void print(string s[], int n){
    for (int i = 0; i < n; i++)
        cout << s[i] << ' ';
    cout << '\n';
}

// BUBBLE SORT

void bubbleSort(string a[], int n){
    for (int i = 0; i < n - 1; i++){
        for (int j = n - 1; j > i; j--)
            if (a[j] < a[j-1])
                swap(a[j], a[j-1]);
    }
}

// SELECTION SORT

void selectionSort(string a[], int n){
    int minIdex = 0;
    for (int i = 0; i < n - 1; i++){
        for (int j = i+1; j < n; j++)
            if (a[j] < a[minIdex])
                minIdex = j;
        
        if (i != minIdex)
            swap(a[i], a[minIdex]);
    }
}

// INSERTION SORT

void insertionSort(string a[], int n){
    int i, j;
    string key;
    for (i = 1; i < n; i++) {
        key = a[i];
        j = i - 1;
 
        while (j >= 0 && a[j] > key) {
            a[j + 1] = a[j];
            j = j - 1;
        }
        a[j + 1] = key;
    }
}

// HEAP SORT

void heapify(string s[], int n, int i){
    int largest = i;
    int left = 2 * i + 1;
    int right = 2 * i + 2;

    if (left < n && s[left] > s[largest])
        largest = left;

    if (right < n && s[right] > s[largest])
        largest = right;

    if (largest != i) {
        // swap(listOfEmployee[i], listOfEmployee[largest]);
        swap(s[i], s[largest]);
        heapify(s, n, largest);
    }
}

void heapSort(string s[], int n){
    for (int i = n / 2 - 1; i >= 0; i--)
        heapify(s, n, i);

    for (int i = n - 1; i >= 0; i--) {
        swap(s[0], s[i]);
        heapify(s, i, 0);
    }
}

// QUICK SORT

int partition(string s[], int low, int high){
    string pivot = s[high];
    // Right most so far
    int i = (low - 1);

    for (int j = low; j <= high - 1; j++){
        // If current element is smaller than the pivot
        if (s[j] < pivot) {
            i++;
            swap(s[i], s[j]);
        }
    }
    swap(s[i + 1], s[high]);
    return (i + 1);
}

void quickSort(string s[], int low, int high){
    if (low < high){
        int pi = partition(s, low, high);

        quickSort(s, low, pi - 1);
        quickSort(s, pi + 1, high);
    }
}

// MERGE SORT

void merge(string s[], int left, int mid, int right){
    int size1 = mid - left + 1;
    int size2 = right - mid;

    string leftTmp[size1], rightTmp[size2];

    for (int i = 0; i < size1; i++)
        leftTmp[i] = s[left+i];

    for (int i = 0; i < size2; i++)
        rightTmp[i] = s[mid + 1 + i];

    int i = 0, j = 0, k = left;
    
    while (i < size1 && j < size2){
        if (leftTmp[i] < rightTmp[j])
            s[k++] = leftTmp[i++];
        else
            s[k++] = rightTmp[j++];
    }

    while (i < size1){
        s[k++] = leftTmp[i++];
    }

    while (j < size2){
        s[k++] = rightTmp[j++];
    }  
}

void mergeSort(string s[], int left, int right){
    if (left < right){
        int mid = left + (right - left) / 2;
        mergeSort(s, left, mid);
        mergeSort(s, mid+1, right);
        merge(s, left, mid, right);
    }
}

// RADIX SORT
int getChar(string s, int pos) {
    if (pos < s.length())
        return s[pos];
    return 0;
}

int getMaxChar(string s[], int n, int pos) {
    int maxChar = 0;
    for (int i = 0; i < n; i++) {
        int charVal = getChar(s[i], pos);
        if (charVal > maxChar) {
            maxChar = charVal;
        }
    }
    return maxChar;
}

void countingSort(string s[], int n, int pos) {
    const int SIZE = 256;
    int total = 0;

    string *output = new string[n];
    int *count = new int[SIZE];


    for (int i = 0; i < SIZE; i++)
        count[i] = 0;

    for (int i = 0; i < n; i++) {
        int index = getChar(s[i], pos);
        count[index]++;
    }

    
    for (int i = 0; i < SIZE; i++) {
        int countVal = count[i];
        count[i] = total;
        total += countVal;
    }

    for (int i = 0; i < n; i++) {
        int index = getChar(s[i], pos);
        output[count[index]] = s[i];
        count[index]++;
    }

    for (int i = 0; i < n; i++) {
        s[i] = output[i];
    }

    delete []output;
    delete []count;
}

void radixSort(string s[], int n) {
    int maxLen = 0;
    for (int i = 0; i < n; i++) {
        int len = s[i].size();
        if (len > maxLen) {
            maxLen = len;
        }
    }

    for (int pos = maxLen - 1; pos >= 0; pos--) {
        countingSort(s, n, pos);
    }
}

// int main(){
//     int n = 5;
//     string s[MAXI] = {"zebra", "nias", "asds", "fasad", "qweqwas"};
//     print(s, n);
//     // radixSort(s, n);
//     // heapSort(s, n);
//     // quickSort(s, 0, n-1);
//     // mergeSort(s, 0, n-1);
//     // bubbleSort(s, n);
//     print(s, n);

//     return 0;
// }