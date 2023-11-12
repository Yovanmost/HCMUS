#pragma once
#include <iostream>
#define long long long
#define uint unsigned int 
#define MAXI 100

using namespace std;

uint a = 10;

// void print(long a[], int n){
//     for (int i = 0; i < n; i++)
//         cout << a[i] << ' ';
//     cout << '\n';
// }

void bubbleSort(long a[], int n){
    for (int i = 0; i < n - 1; i++){
        for (int j = n - 1; j > i; j--)
            if (a[j] < a[j-1])
                swap(a[j], a[j-1]);
    }
}

void selectionSort(long a[], int n){
    int minIdex = 0;
    for (int i = 0; i < n - 1; i++){
        for (int j = i+1; j < n; j++)
            if (a[j] < a[minIdex])
                minIdex = j;
        
        if (i != minIdex)
            swap(a[i], a[minIdex]);
    }
}

void insertionSort(long a[], int n){
    int i, key, j;
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

void interchangeSort(long a[], int n){
    for (int i = 0; i < n - 1; i++){
        for (int j = i+1; j < n; j++){
            if (a[i] > a[j])
                swap(a[i], a[j]);
        }
    }
}

void shakerSortV2(long a[], int n){
    int top = 0, bottom = n - 1, k = n - 1;
    while (top < bottom){
        for (int i = bottom; i > top; i--)
            if (a[i-1] > a[i]){
                swap(a[i-1], a[i]);
                k = i;
            }
                
        top = k;
        for (int i = top; i < bottom; i++)
            if (a[i] > a[i+1]){
                swap(a[i], a[i+1]);
                k = i;
            }
        bottom = k;
    }
}

void shakerSort(long a[], int n){
    int top = 0;
    int bottom = n - 1;

    while (top < bottom){
        for (int i = top; i < bottom; i++) 
            if (a[i] > a[i + 1])
                swap(a[i], a[i + 1]);
        bottom--;

        for (int i = bottom; i > top; i--) 
            if (a[i] < a[i - 1])
                swap(a[i], a[i - 1]);
        top++;
    }
}

// int main(){
//     long a[MAXI] = {8, 4, 2, 1};
//     int n = 4;
//     // bubbleSort(a, n);
//     // selectionSort(a, n);
//     // insertionSort(a, n);
//     // interchangeSort(a, n);
//     // shakerSort(a, n);
//     print(a, n);
//     // cout << 1000*0.05;

//     return 0;
// }